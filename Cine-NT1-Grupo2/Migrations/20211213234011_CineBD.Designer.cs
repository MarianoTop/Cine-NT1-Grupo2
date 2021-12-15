﻿// <auto-generated />
using System;
using Cine_NT1_Grupo2.Context;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace Cine_NT1_Grupo2.Migrations
{
    [DbContext(typeof(CineContext))]
    [Migration("20211213234011_CineBD")]
    partial class CineBD
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.20")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("Cine_NT1_Grupo2.Models.Asiento", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("ClienteId")
                        .HasColumnType("int");

                    b.Property<string>("Fila")
                        .IsRequired()
                        .HasColumnType("nvarchar(1)")
                        .HasMaxLength(1);

                    b.Property<int>("FuncionId")
                        .HasColumnType("int");

                    b.Property<int>("Numero")
                        .HasColumnType("int")
                        .HasMaxLength(2);

                    b.HasKey("Id");

                    b.HasIndex("FuncionId");

                    b.ToTable("Asiento");
                });

            modelBuilder.Entity("Cine_NT1_Grupo2.Models.Cine", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int?>("ClienteActualid")
                        .HasColumnType("int");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("ClienteActualid");

                    b.ToTable("Cine");
                });

            modelBuilder.Entity("Cine_NT1_Grupo2.Models.Cliente", b =>
                {
                    b.Property<int>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Apellido")
                        .IsRequired()
                        .HasColumnType("nvarchar(20)")
                        .HasMaxLength(20);

                    b.Property<int?>("CineId")
                        .HasColumnType("int");

                    b.Property<string>("Mail")
                        .IsRequired()
                        .HasColumnType("nvarchar(20)")
                        .HasMaxLength(20);

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(20)")
                        .HasMaxLength(20);

                    b.Property<int>("Rol")
                        .HasColumnType("int");

                    b.Property<string>("pass")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("id");

                    b.HasIndex("CineId");

                    b.ToTable("Cliente");
                });

            modelBuilder.Entity("Cine_NT1_Grupo2.Models.Entrada", b =>
                {
                    b.Property<int>("EntradaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("AsientoId")
                        .HasColumnType("int");

                    b.Property<int>("ClienteId")
                        .HasColumnType("int");

                    b.Property<int?>("FuncionId")
                        .HasColumnType("int");

                    b.HasKey("EntradaId");

                    b.HasIndex("AsientoId");

                    b.HasIndex("ClienteId");

                    b.HasIndex("FuncionId");

                    b.ToTable("Entrada");
                });

            modelBuilder.Entity("Cine_NT1_Grupo2.Models.Funcion", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int?>("CineId")
                        .HasColumnType("int");

                    b.Property<DateTime>("Fecha")
                        .HasColumnType("datetime2");

                    b.Property<int>("IdPelicula")
                        .HasColumnType("int");

                    b.Property<int>("Sala")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("CineId");

                    b.HasIndex("IdPelicula");

                    b.ToTable("Funcion");
                });

            modelBuilder.Entity("Cine_NT1_Grupo2.Models.Pelicula", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("Calificacion")
                        .HasColumnType("int");

                    b.Property<int>("Genero")
                        .HasColumnType("int");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(30)")
                        .HasMaxLength(30);

                    b.HasKey("Id");

                    b.ToTable("Pelicula");
                });

            modelBuilder.Entity("Cine_NT1_Grupo2.Models.Tarjeta", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("ClienteId")
                        .HasColumnType("int");

                    b.Property<int>("CodigoSeguridad")
                        .HasColumnType("int");

                    b.Property<DateTime>("FechaDeVencimiento")
                        .HasColumnType("datetime2");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasColumnType("nvarchar(30)")
                        .HasMaxLength(30);

                    b.Property<long>("Numero")
                        .HasColumnType("bigint");

                    b.HasKey("Id");

                    b.HasIndex("ClienteId");

                    b.ToTable("Tarjeta");
                });

            modelBuilder.Entity("Cine_NT1_Grupo2.Models.Asiento", b =>
                {
                    b.HasOne("Cine_NT1_Grupo2.Models.Funcion", null)
                        .WithMany("Asientos")
                        .HasForeignKey("FuncionId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Cine_NT1_Grupo2.Models.Cine", b =>
                {
                    b.HasOne("Cine_NT1_Grupo2.Models.Cliente", "ClienteActual")
                        .WithMany()
                        .HasForeignKey("ClienteActualid");
                });

            modelBuilder.Entity("Cine_NT1_Grupo2.Models.Cliente", b =>
                {
                    b.HasOne("Cine_NT1_Grupo2.Models.Cine", null)
                        .WithMany("Clientes")
                        .HasForeignKey("CineId");
                });

            modelBuilder.Entity("Cine_NT1_Grupo2.Models.Entrada", b =>
                {
                    b.HasOne("Cine_NT1_Grupo2.Models.Asiento", "Asiento")
                        .WithMany()
                        .HasForeignKey("AsientoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Cine_NT1_Grupo2.Models.Cliente", null)
                        .WithMany("entradas")
                        .HasForeignKey("ClienteId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Cine_NT1_Grupo2.Models.Funcion", "Funcion")
                        .WithMany("EntradasDisponibles")
                        .HasForeignKey("FuncionId");
                });

            modelBuilder.Entity("Cine_NT1_Grupo2.Models.Funcion", b =>
                {
                    b.HasOne("Cine_NT1_Grupo2.Models.Cine", null)
                        .WithMany("Funciones")
                        .HasForeignKey("CineId");

                    b.HasOne("Cine_NT1_Grupo2.Models.Pelicula", "Pelicula")
                        .WithMany()
                        .HasForeignKey("IdPelicula")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Cine_NT1_Grupo2.Models.Tarjeta", b =>
                {
                    b.HasOne("Cine_NT1_Grupo2.Models.Cliente", null)
                        .WithMany("tarjetas")
                        .HasForeignKey("ClienteId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}