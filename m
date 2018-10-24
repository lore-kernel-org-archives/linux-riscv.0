From: keescook@chromium.org (Kees Cook)
Date: Wed, 24 Oct 2018 14:26:05 -0700
Subject: [PATCH 1/2] Move EM_RISCV into elf-em.h
In-Reply-To: <20181024204036.8799-2-palmer@sifive.com>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-2-palmer@sifive.com>
Message-ID: <CAGXu5jJxPKcivD6PtK0WwGVphU6Uzj4QAFXrAw52UjUDTZSupw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Oct 24, 2018 at 1:40 PM, Palmer Dabbelt <palmer@sifive.com> wrote:
> This should never have been inside our arch port to begin with, it's
> just a relic from when we were maintaining out of tree patches.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/riscv/include/asm/elf.h | 3 ---
>  include/uapi/linux/elf-em.h  | 1 +
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index a1ef503d616e..697fc23b0d5a 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -16,9 +16,6 @@
>  #include <asm/auxvec.h>
>  #include <asm/byteorder.h>
>
> -/* TODO: Move definition into include/uapi/linux/elf-em.h */
> -#define EM_RISCV       0xF3
> -
>  /*
>   * These are used to set parameters in the core dumps.
>   */
> diff --git a/include/uapi/linux/elf-em.h b/include/uapi/linux/elf-em.h
> index 31aa10178335..93722e60204c 100644
> --- a/include/uapi/linux/elf-em.h
> +++ b/include/uapi/linux/elf-em.h
> @@ -41,6 +41,7 @@
>  #define EM_TILEPRO     188     /* Tilera TILEPro */
>  #define EM_MICROBLAZE  189     /* Xilinx MicroBlaze */
>  #define EM_TILEGX      191     /* Tilera TILE-Gx */
> +#define EM_RISCV       243     /* RISC-V */
>  #define EM_BPF         247     /* Linux BPF - in-kernel virtual machine */
>  #define EM_FRV         0x5441  /* Fujitsu FR-V */
>
> --
> 2.18.1
>



-- 
Kees Cook
