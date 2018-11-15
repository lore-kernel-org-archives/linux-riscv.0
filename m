From: kernel@esmil.dk (Emil Renner Berthing)
Date: Thu, 15 Nov 2018 12:01:25 +0100
Subject: [PATCH v3 2/2] tty: serial: add driver for the SiFive UART
In-Reply-To: <20181020101045.15991-3-paul.walmsley@sifive.com>
References: <20181020101045.15991-1-paul.walmsley@sifive.com>
 <20181020101045.15991-3-paul.walmsley@sifive.com>
Message-ID: <CANBLGcy9WoBqBKQnvz-YGQpXossP2HDmW_go8WZD7FfBZdr5VQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Paul,

Thanks for the patch!

On Sat, 20 Oct 2018 at 12:12, Paul Walmsley <paul.walmsley@sifive.com> wrote:
> +/*
> + *
> + */

Interesting comment ;)

> +static int __init sifive_serial_console_setup(struct console *co, char *options)

Unfortunately I get this error unless I remove the __init:
...
  GEN     .version
  CHK     include/generated/compile.h
  AR      built-in.a
  LD      vmlinux.o
  MODPOST vmlinux.o
WARNING: vmlinux.o(.data+0x14e48): Section mismatch in reference from
the variable .LANCHOR0 to the function
.init.text:sifive_serial_console_setup()
The variable .LANCHOR0 references
the function __init sifive_serial_console_setup()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

FATAL: modpost: Section mismatches detected.
Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
make[1]: *** [scripts/Makefile.modpost:98: vmlinux.o] Error 1
make: *** [Makefile:1040: vmlinux] Error 2

I have
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_SIFIVE=y
CONFIG_SERIAL_SIFIVE_CONSOLE=y
and it happens both on v4.20-rc2 and v4.19.
Without the __init everything seems to work fine though.

> +#else
> +
> +#define SIFIVE_SERIAL_CONSOLE  NULL
> +
> +static inline void __ssp_add_console_port(struct sifive_serial_port *ssp)
> +{}
> +static void __ssp_remove_console_port(struct sifive_serial_port *ssp)
> +{}

Missing "inline"?

> +static int __init sifive_serial_init(void)
> +{
> +       int r;

If you're sending a v4 anyway, here and in the the probe function
using int ret; for this kind of variable is a common idiom and
hence easier to read.

/Emil
