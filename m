Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07D0C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 08:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VEplercvVNgMdyuUoMhAARWbDbSElMlDgRfdBo78bU=; b=Dyjnbm+sg1xt0G
	97yUx5nMcCgqMIycMwMCmnKLIiNFarqo12Ww1LZvNilrY9tBSiNhXVo93JIsEjfdbpaPsS4P4BiWT
	vzWWsrzOUr+MCl6R9Uzyb25ELQEit0FMHQd2lK1x4J6ark/TfLC7AeiFEF829AkcB48WEHJH2MlF3
	xqrhyGqx4KL9CfOzCoI0SCBRtiwtv4Cd1wJNDTVaySpfOYzCfufqb3RIZlubxsiDcxmcFhaI6ysOl
	FiVEmoDOojj7ar03drRkp2tdT6koBgDrJ2+ZkE/+WFEu134dKgfnF949jP4ZUigwG0kD4B7g+pWF2
	CcWj3f05PN0MCz+pvYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCb0X-00000006blF-2Wqz;
	Thu, 30 May 2024 08:19:33 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCb0T-00000006bjF-3QFS;
	Thu, 30 May 2024 08:19:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 054A320008;
	Thu, 30 May 2024 08:19:12 +0000 (UTC)
Message-ID: <ec110587-d557-439b-ae50-f3472535ef3a@ghiti.fr>
Date: Thu, 30 May 2024 10:19:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 1/5] RISC-V: Detect and Enable Svadu Extension
 Support
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, greentime.hu@sifive.com, vincent.chen@sifive.com,
 cleger@rivosinc.com, Jinyu Tang <tjytimi@163.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>, Samuel Ortiz
 <sameo@rivosinc.com>, Evan Green <evan@rivosinc.com>,
 Xiao Wang <xiao.w.wang@intel.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Charlie Jenkins <charlie@rivosinc.com>, Leonardo Bras <leobras@redhat.com>,
 linux-kernel@vger.kernel.org
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-2-yongxuan.wang@sifive.com>
 <20240527-41b376a2bfedb3b9cf7e9c7b@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240527-41b376a2bfedb3b9cf7e9c7b@orel>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_011930_255917_E8284EF9 
X-CRM114-Status: GOOD (  28.14  )
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

On 27/05/2024 18:25, Andrew Jones wrote:
> On Fri, May 24, 2024 at 06:33:01PM GMT, Yong-Xuan Wang wrote:
>> Svadu is a RISC-V extension for hardware updating of PTE A/D bits.
>>
>> In this patch we detect Svadu extension support from DTB and enable it
>> with SBI FWFT extension. Also we add arch_has_hw_pte_young() to enable
>> optimization in MGLRU and __wp_page_copy_user() if Svadu extension is
>> available.


So we talked about this yesterday during the linux-riscv patchwork 
meeting. We came to the conclusion that we should not wait for the SBI 
FWFT extension to enable Svadu but instead, it should be enabled by 
default by openSBI if the extension is present in the device tree. This 
is because we did not find any backward compatibility issues, meaning 
that enabling Svadu should not break any S-mode software. This is what 
you did in your previous versions of this patchset so the changes should 
be easy. This behaviour must be added to the dtbinding description of 
the Svadu extension.

Another thing that we discussed yesterday. There exist 2 schemes to 
manage the A/D bits updates, Svade and Svadu. If a platform supports 
both extensions and both are present in the device tree, it is M-mode 
firmware's responsibility to provide a "sane" device tree to the S-mode 
software, meaning the device tree can not contain both extensions. And 
because on such platforms, Svadu is more performant than Svade, Svadu 
should be enabled by the M-mode firmware and only Svadu should be 
present in the device tree.

I hope that clearly explains what we discussed yesterday, let me know if 
you (or anyone else) need more explanations. If no one is opposed to 
this solution, do you think you can implement this behaviour? If not, I 
can deal with it, just let me know.

Thanks


>>
>> Co-developed-by: Jinyu Tang <tjytimi@163.com>
>> Signed-off-by: Jinyu Tang <tjytimi@163.com>
>> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> I think this patch changed too much to keep r-b's. We didn't have the
> FWFT part before.
>
>> ---
>>   arch/riscv/Kconfig               |  1 +
>>   arch/riscv/include/asm/csr.h     |  1 +
>>   arch/riscv/include/asm/hwcap.h   |  1 +
>>   arch/riscv/include/asm/pgtable.h |  8 +++++++-
>>   arch/riscv/kernel/cpufeature.c   | 11 +++++++++++
>>   5 files changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index be09c8836d56..30fa558ee284 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -34,6 +34,7 @@ config RISCV
>>   	select ARCH_HAS_PMEM_API
>>   	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
>>   	select ARCH_HAS_PTE_SPECIAL
>> +	select ARCH_HAS_HW_PTE_YOUNG
>>   	select ARCH_HAS_SET_DIRECT_MAP if MMU
>>   	select ARCH_HAS_SET_MEMORY if MMU
>>   	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
>> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
>> index 2468c55933cd..2ac270ad4acd 100644
>> --- a/arch/riscv/include/asm/csr.h
>> +++ b/arch/riscv/include/asm/csr.h
>> @@ -194,6 +194,7 @@
>>   /* xENVCFG flags */
>>   #define ENVCFG_STCE			(_AC(1, ULL) << 63)
>>   #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
>> +#define ENVCFG_ADUE			(_AC(1, ULL) << 61)
>>   #define ENVCFG_CBZE			(_AC(1, UL) << 7)
>>   #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
>>   #define ENVCFG_CBIE_SHIFT		4
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index e17d0078a651..8d539e3f4e11 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -81,6 +81,7 @@
>>   #define RISCV_ISA_EXT_ZTSO		72
>>   #define RISCV_ISA_EXT_ZACAS		73
>>   #define RISCV_ISA_EXT_XANDESPMU		74
>> +#define RISCV_ISA_EXT_SVADU		75
>>   
>>   #define RISCV_ISA_EXT_XLINUXENVCFG	127
>>   
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index 9f8ea0e33eb1..1f1b326ccf63 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -117,6 +117,7 @@
>>   #include <asm/tlbflush.h>
>>   #include <linux/mm_types.h>
>>   #include <asm/compat.h>
>> +#include <asm/cpufeature.h>
>>   
>>   #define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)
>>   
>> @@ -285,7 +286,6 @@ static inline pte_t pud_pte(pud_t pud)
>>   }
>>   
>>   #ifdef CONFIG_RISCV_ISA_SVNAPOT
>> -#include <asm/cpufeature.h>
>>   
>>   static __always_inline bool has_svnapot(void)
>>   {
>> @@ -621,6 +621,12 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
>>   	return __pgprot(prot);
>>   }
>>   
>> +#define arch_has_hw_pte_young arch_has_hw_pte_young
>> +static inline bool arch_has_hw_pte_young(void)
>> +{
>> +	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
>> +}
>> +
>>   /*
>>    * THP functions
>>    */
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 3ed2359eae35..b023908c5932 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -93,6 +93,16 @@ static bool riscv_isa_extension_check(int id)
>>   			return false;
>>   		}
>>   		return true;
>> +	case RISCV_ISA_EXT_SVADU:
>> +		if (sbi_probe_extension(SBI_EXT_FWFT) > 0) {
> I think we've decided the appropriate way to prove for SBI extensions is
> to first ensure the SBI version and then do the probe, like we do for STA
> in has_pv_steal_clock()
>
>> +			struct sbiret ret;
>> +
>> +			ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET, SBI_FWFT_PTE_AD_HW_UPDATING,
>> +					1, 0, 0, 0, 0);
>> +
>> +			return ret.error == SBI_SUCCESS;
>> +		}
>> +		return false;
>>   	case RISCV_ISA_EXT_INVALID:
>>   		return false;
>>   	}
>> @@ -301,6 +311,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>>   	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>>   	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>>   	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>> +	__RISCV_ISA_EXT_SUPERSET(svadu, RISCV_ISA_EXT_SVADU, riscv_xlinuxenvcfg_exts),
> We do we need XLINUXENVCFG?
>
> Thanks,
> drew
>
>>   	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>>   	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>>   	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>> -- 
>> 2.17.1
>>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
