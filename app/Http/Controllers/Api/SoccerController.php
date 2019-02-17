<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Requests;
use Log;
use Exception;
use Carbon\Carbon;
use App\Models\Players as Player;
use App\Models\PlayerToTeamMapping as PlayerTeamMap;
use App\Models\Team;
use App\Http\Controllers\Api\APIBaseController;

class SoccerController extends APIBaseController {

    /**
     * Get All Teams
     * @return mixed
     * @throws Exception
     */
    public function getAllTeam() {
        $teamInfo = [];
        try {
            $teams = Team::all('id', 'name', 'logoUri');
            if (!$teams) {
                throw new Exception('Empty Team List');
            }
            if (!empty($teams)) {
                foreach ($teams->toArray() as $team) {
                    $playersList = $this->fetchPlayerByTeam($team['id']);
                    $teamInfo[] = ['team' => $team, 'players' => $playersList];
                }
            }
            return $this->sendResponse($teamInfo, 'Soccer Team List');
        } catch (Exception $e) {
            $error = $e->getMessage();
            $errorMessage = 'Something went wrong.';
            $errorCode = 500;
            Log::error('Error :: Scoccer::getAllTeam ', ['reason' => $e->getMessage(), 'trace' => $e->getTraceAsString()]);
            return $this->sendError($error, $errorMessage, $errorCode);
        }
    }

    /**
     * Get All Player List By Team Id
     * @param type $teamId
     * @return type
     * @throws Exception
     */
    public function getAllPlayer($teamId = '') {
        try {
            $playersList = [];
            if (!empty($teamId)) {
                $playersList = $this->fetchPlayerByTeam($teamId);
                if (!$playersList) {
                    throw new Exception('Empty Player List');
                }
            }
            return $this->sendResponse($playersList, 'Soccer Player List');
        } catch (Exception $e) {
            $error = $e->getMessage();
            $errorMessage = 'Something went wrong.';
            $errorCode = 500;
            Log::error('Error :: Scoccer::getAllPlayer ', ['reason' => $e->getMessage(), 'trace' => $e->getTraceAsString()]);
            return $this->sendError($error, $errorMessage, $errorCode);
        }
    }

    protected function fetchPlayerByTeam($teamId) {
        $playersList = [];
        try {
            if (!empty($teamId)) {
                $playerTeam = PlayerTeamMap::where('team_id', '=', $teamId)->get();
                if (!empty($playerTeam)) {
                    $playerTeamResult = $playerTeam->toArray();
                    if (!empty($playerTeamResult)) {
                        $playerIds = array_column($playerTeamResult, 'player_id');
                        if (!empty($playerIds)) {
                            $players = Player::find($playerIds, ['firstName', 'lastName', 'imageUri']);
                            if (!empty($players)) {
                                $playersList = $players->toArray();
                            }
                        }
                    }
                }
            }
        } catch (Exception $e) {
            Log::error('Error :: fetchPlayerByTeam', ['reason' => $e->getMessage(), 'trace' => $e->getTraceAsString()]);
        }
        return $playersList;
    }

}
