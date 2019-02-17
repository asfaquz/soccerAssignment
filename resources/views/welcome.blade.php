@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-15 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3>Welcome ,Guest </h3>
                    <a href="{{url('/api/scoccer/teams')}}" class="btn btn-info" onclick="getTeamList();">Get Soccer Team</a></li>
                </div>
                <div id='result' class="table-responsive-sm "></div>
            </div>
        </div>
    </div>
</div>
<script>
    function getTeamList() {
        event.preventDefault();
        var URL = event.currentTarget.getAttribute('href');
        var html = '';
        $.ajax({
            type: 'GET',
            url: URL,
            data: '_token = <?php echo csrf_token() ?>',
            success: function (response) {
                if (response.success == true) {
                    var teamPlayerList = [];
                    var data = response.data;
                    html += "<table border='1' class='table table-striped w-auto'>";
                    html += "<tr><th>Team Id</th><th>Name</th><th>Logo Uri</th><th>Player Info</th>"
                    Object.keys(data).forEach(function (k, i) {
                        var team = data[i]['team'];
                        var player = data[i]['players'];
                        html += '<tr scope="row">' + '<td>' + team.id + '</td>' + '<td>' + team.name + '</td>' + '<td>' + team.logoUri + '</td>';
                        var htmlInner = '';
                        Object.keys(player).forEach(function (l, j) {
                            htmlInner +="<tr>";
                            htmlInner += '<td>' + player[j]['imageUri'] + '</td>';
                            htmlInner += '<td>' + player[j]['firstName'] + ' ' + player[j]['lastName'] + '</td>';
                            htmlInner +="</tr>"
                        });
                        html += '<td>'+htmlInner+'</td>'+ '</tr>';
                    });
                    html += '</table>';

                    document.getElementById("result").innerHTML = html;

                }


            }
        });
    }
</script>
@endsection
