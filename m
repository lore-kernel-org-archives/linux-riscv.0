From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 01 Nov 2018 10:54:47 -0700 (PDT)
Subject: [PATCH v2 2/2] RISC-V: defconfig: Enable printk timestamps
In-Reply-To: <20181101051033.10089-2-anup@brainfault.org>
Message-ID: <mhng-f1ed976f-ca28-42af-bdb2-ee53e4585c2a@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 31 Oct 2018 22:10:33 PDT (-0700), anup at brainfault.org wrote:
> The printk timestamps are very useful information to visually see
> where kernel is spending time during boot. It also helps us see
> the timing of hotplug events at runtime.
>
> This patch enables printk timestamps in RISC-V defconfig so that
> we have it enabled by default (similar to other architectures
> such as x86_64, arm64, etc).
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Acked-by: Olof Johansson <olof@lixom.net>
> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 07fa9ea75fea..ef4f15df9adf 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -76,4 +76,5 @@ CONFIG_NFS_V4_1=y
>  CONFIG_NFS_V4_2=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_CRYPTO_USER_API_HASH=y
> +CONFIG_PRINTK_TIME=y
>  # CONFIG_RCU_TRACE is not set

Thanks.  Since this is a functional change I'm not going to rush it in, but I 
think it's OK to go in after rc1 so I'll include it as part of my 
regularly-scheduled PR next week.
