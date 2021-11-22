using Microsoft.EntityFrameworkCore.Migrations;

namespace Cine_NT1_Grupo2.Migrations
{
    public partial class agregueNroTarjeta : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<long>(
                name: "Numero",
                table: "Tarjeta",
                maxLength: 16,
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int",
                oldMaxLength: 16);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "Numero",
                table: "Tarjeta",
                type: "int",
                maxLength: 16,
                nullable: false,
                oldClrType: typeof(long),
                oldMaxLength: 16);
        }
    }
}
