using Microsoft.EntityFrameworkCore.Migrations;

namespace Cine_NT1_Grupo2.Migrations
{
    public partial class migracionEntradaModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Asiento_Funcion_FuncionId",
                table: "Asiento");

            migrationBuilder.DropForeignKey(
                name: "FK_Entrada_Asiento_AsientoId",
                table: "Entrada");

            migrationBuilder.DropForeignKey(
                name: "FK_Entrada_Funcion_FuncionId",
                table: "Entrada");

            migrationBuilder.AlterColumn<int>(
                name: "FuncionId",
                table: "Entrada",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "AsientoId",
                table: "Entrada",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "FuncionId",
                table: "Asiento",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Asiento_Funcion_FuncionId",
                table: "Asiento",
                column: "FuncionId",
                principalTable: "Funcion",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Entrada_Asiento_AsientoId",
                table: "Entrada",
                column: "AsientoId",
                principalTable: "Asiento",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Entrada_Funcion_FuncionId",
                table: "Entrada",
                column: "FuncionId",
                principalTable: "Funcion",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Asiento_Funcion_FuncionId",
                table: "Asiento");

            migrationBuilder.DropForeignKey(
                name: "FK_Entrada_Asiento_AsientoId",
                table: "Entrada");

            migrationBuilder.DropForeignKey(
                name: "FK_Entrada_Funcion_FuncionId",
                table: "Entrada");

            migrationBuilder.AlterColumn<int>(
                name: "FuncionId",
                table: "Entrada",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "AsientoId",
                table: "Entrada",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "FuncionId",
                table: "Asiento",
                type: "int",
                nullable: true,
                oldClrType: typeof(int));

            migrationBuilder.AddForeignKey(
                name: "FK_Asiento_Funcion_FuncionId",
                table: "Asiento",
                column: "FuncionId",
                principalTable: "Funcion",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Entrada_Asiento_AsientoId",
                table: "Entrada",
                column: "AsientoId",
                principalTable: "Asiento",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Entrada_Funcion_FuncionId",
                table: "Entrada",
                column: "FuncionId",
                principalTable: "Funcion",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
