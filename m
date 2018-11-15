From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 15 Nov 2018 06:59:05 -0800 (PST)
Subject: [PATCH] RISC-V: Fix raw_copy_{to,from}_user()
In-Reply-To: <20181115002755.24195-1-olof@lixom.net>
Message-ID: <mhng-4c28d7f1-e034-4506-9ace-40fc2abd1668@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 14 Nov 2018 16:27:55 PST (-0800), Olof Johansson wrote:
> Sparse highlighted it, and appears to be a pure bug (from vs to).
>
> ./arch/riscv/include/asm/uaccess.h:403:35: warning: incorrect type in argument 1 (different address spaces)
> ./arch/riscv/include/asm/uaccess.h:403:39: warning: incorrect type in argument 2 (different address spaces)
> ./arch/riscv/include/asm/uaccess.h:409:37: warning: incorrect type in argument 1 (different address spaces)
> ./arch/riscv/include/asm/uaccess.h:409:41: warning: incorrect type in argument 2 (different address spaces)
>
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
>  arch/riscv/include/asm/uaccess.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 473cfc84e412f..8c3e3e3c8be12 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -400,13 +400,13 @@ extern unsigned long __must_check __asm_copy_from_user(void *to,
>  static inline unsigned long
>  raw_copy_from_user(void *to, const void __user *from, unsigned long n)
>  {
> -	return __asm_copy_to_user(to, from, n);
> +	return __asm_copy_from_user(to, from, n);
>  }
>
>  static inline unsigned long
>  raw_copy_to_user(void __user *to, const void *from, unsigned long n)
>  {
> -	return __asm_copy_from_user(to, from, n);
> +	return __asm_copy_to_user(to, from, n);
>  }
>
>  extern long strncpy_from_user(char *dest, const char __user *src, long count);

Oh, no idea how I missed that one.  This looks like it's been in for a long 
time, so I'm surprised anything works at all!

I'm going to add a stable CC and PR this to Linus this week, assuming I get 
some time to at least give it a minimal test.

Thanks for catching this!
