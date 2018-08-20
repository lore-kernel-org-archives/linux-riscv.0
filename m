From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 20 Aug 2018 15:33:29 -0700 (PDT)
Subject: [PATCH] riscv: Drop setup_initrd
In-Reply-To: <1533874300-17656-1-git-send-email-linux@roeck-us.net>
Message-ID: <mhng-fabb487c-62df-4a45-b629-5a8f59d9bbb8@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 09 Aug 2018 21:11:40 PDT (-0700), linux at roeck-us.net wrote:
> setup_initrd() does not appear to serve a practical purpose other than
> preventing qemu boots with "-initrd" parameter, so let's drop it.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  arch/riscv/kernel/setup.c | 39 ---------------------------------------
>  1 file changed, 39 deletions(-)

I missed this for the merge window but I think it's suitable for an RC so I'll 
target it for next week.  It's at kernel.org/palmer/linux.git/fix-initrd and 
I've added it to for-next.

Thanks!
