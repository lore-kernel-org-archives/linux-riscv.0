Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DF6C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 16:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHIQu8P8ea4SXnSOogNpgPWAta3hiU95EZ78M9yivc0=; b=JYlvwP592hbABQ
	Hrv3lpKXIEVeARK3Tn6sPSkkQfM5ErBkZGk0V8LO0u6yZJg6715TyJf43DrZ7XirJjFCFXaxvAMee
	YF7vlDfYPzMJiYndkCdCzGcTVZmS55bJRpbYzS2bVjK7NkA+mHmI7hWQX5c70HAmcJvTKO9vcazcZ
	g1npZNU2yOOo55gmpjGdx1PsXQCVanykYA80SLzcLGLSdQYZtKqcOJGxpfGLhtxJVw9MJF+ZAQAo9
	d0pmo/wpGGQMTL1O0W8MNNammH/pi1Z7YgCulBhBgTWyaIQUxRl08QN4bnSVtclS01qMwn5bFqWwK
	1JYavZd7uv25FjxopRYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUUDw-000000000SV-1JYu;
	Thu, 18 Jul 2024 16:43:20 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUUDr-000000000Pk-3uzb;
	Thu, 18 Jul 2024 16:43:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B39ED1BF205;
	Thu, 18 Jul 2024 16:43:05 +0000 (UTC)
Message-ID: <6ad0c386-6777-4467-bab4-8fba149f3bfe@ghiti.fr>
Date: Thu, 18 Jul 2024 18:43:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] RISC-V: Add Svade and Svadu Extensions Support
Content-Language: en-US
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com,
 Jinyu Tang <tjytimi@163.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Atish Patra <atishp@rivosinc.com>, Samuel Ortiz <sameo@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Evan Green <evan@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Leonardo Bras <leobras@redhat.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jisheng Zhang <jszhang@kernel.org>
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
 <20240712083850.4242-2-yongxuan.wang@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240712083850.4242-2-yongxuan.wang@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_094316_295965_F783B003 
X-CRM114-Status: GOOD (  26.20  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Yong-Xuan,

On 12/07/2024 10:38, Yong-Xuan Wang wrote:
> Svade and Svadu extensions represent two schemes for managing the PTE A/D
> bits. When the PTE A/D bits need to be set, Svade extension intdicates
> that a related page fault will be raised. In contrast, the Svadu extension
> supports hardware updating of PTE A/D bits. Since the Svade extension is
> mandatory and the Svadu extension is optional in RVA23 profile, by default
> the M-mode firmware will enable the Svadu extension in the menvcfg CSR
> when only Svadu is present in DT.
>
> This patch detects Svade and Svadu extensions from DT and adds
> arch_has_hw_pte_young() to enable optimization in MGLRU and
> __wp_page_copy_user() when we have the PTE A/D bits hardware updating
> support.
>
> Co-developed-by: Jinyu Tang <tjytimi@163.com>
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   arch/riscv/Kconfig               |  1 +
>   arch/riscv/include/asm/csr.h     |  1 +
>   arch/riscv/include/asm/hwcap.h   |  2 ++
>   arch/riscv/include/asm/pgtable.h | 13 ++++++++++++-
>   arch/riscv/kernel/cpufeature.c   | 32 ++++++++++++++++++++++++++++++++
>   5 files changed, 48 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0525ee2d63c7..3d705e28ff85 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -36,6 +36,7 @@ config RISCV
>   	select ARCH_HAS_PMEM_API
>   	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
>   	select ARCH_HAS_PTE_SPECIAL
> +	select ARCH_HAS_HW_PTE_YOUNG
>   	select ARCH_HAS_SET_DIRECT_MAP if MMU
>   	select ARCH_HAS_SET_MEMORY if MMU
>   	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 25966995da04..524cd4131c71 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -195,6 +195,7 @@
>   /* xENVCFG flags */
>   #define ENVCFG_STCE			(_AC(1, ULL) << 63)
>   #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
> +#define ENVCFG_ADUE			(_AC(1, ULL) << 61)
>   #define ENVCFG_CBZE			(_AC(1, UL) << 7)
>   #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
>   #define ENVCFG_CBIE_SHIFT		4
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index e17d0078a651..35d7aa49785d 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -81,6 +81,8 @@
>   #define RISCV_ISA_EXT_ZTSO		72
>   #define RISCV_ISA_EXT_ZACAS		73
>   #define RISCV_ISA_EXT_XANDESPMU		74
> +#define RISCV_ISA_EXT_SVADE             75
> +#define RISCV_ISA_EXT_SVADU		76
>   
>   #define RISCV_ISA_EXT_XLINUXENVCFG	127
>   
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index aad8b8ca51f1..ec0cdacd7da0 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -120,6 +120,7 @@
>   #include <asm/tlbflush.h>
>   #include <linux/mm_types.h>
>   #include <asm/compat.h>
> +#include <asm/cpufeature.h>
>   
>   #define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)
>   
> @@ -288,7 +289,6 @@ static inline pte_t pud_pte(pud_t pud)
>   }
>   
>   #ifdef CONFIG_RISCV_ISA_SVNAPOT
> -#include <asm/cpufeature.h>
>   
>   static __always_inline bool has_svnapot(void)
>   {
> @@ -624,6 +624,17 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
>   	return __pgprot(prot);
>   }
>   
> +/*
> + * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
> + * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
> + * DT.
> + */
> +#define arch_has_hw_pte_young arch_has_hw_pte_young
> +static inline bool arch_has_hw_pte_young(void)
> +{
> +	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> +}
> +
>   /*
>    * THP functions
>    */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 5ef48cb20ee1..b2c3fe945e89 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -301,6 +301,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>   	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>   	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>   	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> +	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
> +	__RISCV_ISA_EXT_DATA(svadu, RISCV_ISA_EXT_SVADU),
>   	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>   	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>   	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> @@ -554,6 +556,21 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
>   			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
>   		}
>   
> +		/*
> +		 * When neither Svade nor Svadu present in DT, it is technically
> +		 * unknown whether the platform uses Svade or Svadu. Supervisor may
> +		 * assume Svade to be present and enabled or it can discover based
> +		 * on mvendorid, marchid, and mimpid. When both Svade and Svadu present
> +		 * in DT, supervisor must assume Svadu turned-off at boot time. To use
> +		 * Svadu, supervisor must explicitly enable it using the SBI FWFT extension.
> +		 */
> +		if (!test_bit(RISCV_ISA_EXT_SVADE, isainfo->isa) &&
> +		    !test_bit(RISCV_ISA_EXT_SVADU, isainfo->isa))
> +			set_bit(RISCV_ISA_EXT_SVADE, isainfo->isa);
> +		else if (test_bit(RISCV_ISA_EXT_SVADE, isainfo->isa) &&
> +			 test_bit(RISCV_ISA_EXT_SVADU, isainfo->isa))
> +			clear_bit(RISCV_ISA_EXT_SVADU, isainfo->isa);
> +
>   		/*
>   		 * All "okay" hart should have same isa. Set HWCAP based on
>   		 * common capabilities of every "okay" hart, in case they don't
> @@ -619,6 +636,21 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
>   
>   		of_node_put(cpu_node);
>   
> +		/*
> +		 * When neither Svade nor Svadu present in DT, it is technically
> +		 * unknown whether the platform uses Svade or Svadu. Supervisor may
> +		 * assume Svade to be present and enabled or it can discover based
> +		 * on mvendorid, marchid, and mimpid. When both Svade and Svadu present
> +		 * in DT, supervisor must assume Svadu turned-off at boot time. To use
> +		 * Svadu, supervisor must explicitly enable it using the SBI FWFT extension.
> +		 */
> +		if (!test_bit(RISCV_ISA_EXT_SVADE, isainfo->isa) &&
> +		    !test_bit(RISCV_ISA_EXT_SVADU, isainfo->isa))
> +			set_bit(RISCV_ISA_EXT_SVADE, isainfo->isa);
> +		else if (test_bit(RISCV_ISA_EXT_SVADE, isainfo->isa) &&
> +			 test_bit(RISCV_ISA_EXT_SVADU, isainfo->isa))
> +			clear_bit(RISCV_ISA_EXT_SVADU, isainfo->isa);
> +
>   		/*
>   		 * All "okay" harts should have same isa. Set HWCAP based on
>   		 * common capabilities of every "okay" hart, in case they don't.


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
