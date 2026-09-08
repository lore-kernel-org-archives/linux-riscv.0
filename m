Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949DDC79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 11:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Date:In-Reply-To:Mime-Version:Cc:
	References:Message-Id:Subject:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+vCtizTXWwmAH6SktKhJELP1dNmzsQERb5l33qkI4c=; b=JkXPTU87XKkgEi
	d/zW7B9IyLr51cSmz/vDJWkmwJt4u+hoUX8uYftfKBgGZdTbJ+b+a5IXmxLne0DkEUSd9GgtpkudD
	A6LAdfCvG4A1wceo72JTb+Wtdl/53oOxvsAjgXKQBW6xHqmrVNXmfSX8r1DM0nRh7fX1LNR3wN/Hi
	EQfq7Bz68ruaGF1Ug9XsUyW479RNRBECQowCG9a1BWYc5+/CmxtGsN3Npmiu2mPO3pqCc+dDqiPG7
	RN50WjlH5u8PvbapU3Z5EtWbLhusKe6xfihVW5oUmxctjYLVQ1uVdqkDKVFA20eHFi4w3JNYn7JHv
	b0QwcENYlOGbwTCgtjEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uCu-00000008uMR-1PSY;
	Tue, 08 Sep 2026 11:41:44 +0000
Received: from va-2-38.ptr.blmpb.com ([209.127.231.38])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uCr-00000008uLX-1JLU
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 11:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1788867689; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=jyG3J7ip9YpK/4a7tMbQUZEK+nzdPG60JkaDryl20Ms=;
 b=iQm8jnxNNcMXcL9DwqhFxtLcJgadAjZauDbgP6M0EhvDQ6xCTby89AObrvrFMQCpf2dEWf
 0JuBohzlgTgzxdW26Uju14l1aRrR91sBaVER7u5r8U105mJ5Mbv6J8NAwHJpMqWikFt5GX
 o802Gwrk43+9OFllb6Qn8CxObbyGLKxkxHq/gcGTBW0IeRdgJ1aqugmYVFAElLK7GCiy+v
 NWJ4t8WD2LHiGQH2r1TRd8+jFqbnpsCyIm7RDV9l41qTsTEyrPgV1/t9JL2VDaTOi9iLYm
 qsJ6J5odLe4e4ZJfcM+2NI2Ytp6QJ/OFzsReggYm4A52unU3RZxyFKtnNPsg4g==
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: Re: [PATCH v3 5/5] riscv: errata: picoheart: Add workaround for AMOCASQ errata
Message-Id: <faa5620e-741e-4a95-8c22-79651a3b19bf@picoheart.com>
References: <20260907072149.72031-1-yang.yicong@picoheart.com> <20260907072149.72031-6-yang.yicong@picoheart.com> <20260907-wiring-paramount-33df8fcf7c35@spud>
Cc: <yang.yicong@picoheart.com>, <pjw@kernel.org>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>, 
	<wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, <alex@ghiti.fr>, 
	<andrew.jones@oss.qualcomm.com>, <cleger@meta.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>
Mime-Version: 1.0
Received: from [100.86.221.254] ([58.250.106.106]) by smtp.feishu.cn with ESMTPS; Tue, 08 Sep 2026 19:41:26 +0800
In-Reply-To: <20260907-wiring-paramount-33df8fcf7c35@spud>
Content-Language: en-US
Date: Tue, 8 Sep 2026 19:41:24 +0800
X-Lms-Return-Path: <lba+26a9ff467+2bf0e2+lists.infradead.org+yang.yicong@picoheart.com>
To: "Conor Dooley" <conor@kernel.org>
User-Agent: Mozilla Thunderbird
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_044141_576821_2BD92432 
X-CRM114-Status: GOOD (  31.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor,

On 9/7/26 11:44 PM, Conor Dooley wrote:
> On Mon, Sep 07, 2026 at 03:21:49PM +0800, Yicong Yang wrote:
>> Some Picoheart CPUs implement Zacas extension but lack support
>> for AMOCASQ PMA attribute. Thus makes the CASQ instruction de
>> facto unavailable. Since currently no ways to retrieve the PMA
>> information and the riscv kernel will declare cmpxchg128 support
>> if platform declare support of Zacas, the use of cmpxchg128 will
>> lead to PMA violation and crash the kernel. Add the errata
>> workaround to disable the use of cmpxchg128 on the affected CPUs.
>>
>> Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
>> ---
>>  arch/riscv/Kconfig.errata            | 12 ++++++++++++
>>  arch/riscv/errata/picoheart/errata.c | 22 ++++++++++++++++++++++
>>  arch/riscv/include/asm/cmpxchg.h     |  2 +-
>>  arch/riscv/include/asm/cpufeature.h  |  8 ++++++++
>>  arch/riscv/kernel/cpufeature.c       | 13 ++++++++++++-
>>  5 files changed, 55 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
>> index 8ce5c0314321..16e37391d596 100644
>> --- a/arch/riscv/Kconfig.errata
>> +++ b/arch/riscv/Kconfig.errata
>> @@ -176,4 +176,16 @@ config ERRATA_PICOHEART_CBO_CLEAN
>>  
>>  	   If you don't know what to do here, say "Y".
>>  
>> +config ERRATA_PICOHEART_AMOCASQ
>> +	bool "Apply Picoheart AMOCASQ errata"
>> +	depends on ERRATA_PICOHEART && RISCV_ISA_ZACAS
>> +	default y
>> +	help
>> +	  Some Picoheart CPUs implement the Zacas extension but lack support
>> +	  for AMOCASQ PMA attribute. Thus makes the CASQ instruction de facto
>> +	  unavailable. Enable this errata workaround to disable the use of
>> +	  CASQ in the kernel (cmpxchg128).
>> +
>> +	  If you don't know what to do here, say "Y".
>> +
>>  endmenu # "CPU errata selection"
>> diff --git a/arch/riscv/errata/picoheart/errata.c b/arch/riscv/errata/picoheart/errata.c
>> index 21480d19c084..0fb4cb41ab03 100644
>> --- a/arch/riscv/errata/picoheart/errata.c
>> +++ b/arch/riscv/errata/picoheart/errata.c
>> @@ -174,10 +174,32 @@ static void picoheart_errata_probe_cbo_clean(unsigned int stage,
>>  	static_branch_enable(&has_picoheart_cbo_clean_errata);
>>  }
>>  
>> +static void picoheart_errata_probe_amocasq(unsigned int stage,
>> +					   unsigned long archid,
>> +					   unsigned long impid)
>> +{
>> +	if (!IS_ENABLED(CONFIG_ERRATA_PICOHEART_AMOCASQ))
>> +		return;
>> +
>> +	if (stage != RISCV_ALTERNATIVES_BOOT)
>> +		return;
>> +
>> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) ||
>> +	    !riscv_isa_extension_available(NULL, ZACAS))
>> +		return;
>> +
>> +	if (archid != 0x804a555049544552 || impid != 0x100)
>> +		return;
>> +
>> +	static_branch_disable(&cpus_support_cmpxchg128);
>> +}
>> +
>>  static u32 picoheart_errata_probe(unsigned int stage, unsigned long archid,
>>  				  unsigned long impid)
>>  {
>>  	picoheart_errata_probe_cbo_clean(stage, archid, impid);
>> +	picoheart_errata_probe_amocasq(stage, archid, impid);
>> +
>>  	return 0;
>>  }
>>  
>> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
>> index 662e160b0522..e231e9619eee 100644
>> --- a/arch/riscv/include/asm/cmpxchg.h
>> +++ b/arch/riscv/include/asm/cmpxchg.h
>> @@ -329,7 +329,7 @@
>>  
>>  #if defined(CONFIG_64BIT) && defined(CONFIG_RISCV_ISA_ZACAS) && defined(CONFIG_TOOLCHAIN_HAS_ZACAS)
>>  
>> -#define system_has_cmpxchg128()        riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)
>> +#define system_has_cmpxchg128	system_has_cmpxchg128
>>  
>>  union __u128_halves {
>>  	u128 full;
>> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
>> index 739fcc84bf7b..f9d95cbf5abd 100644
>> --- a/arch/riscv/include/asm/cpufeature.h
>> +++ b/arch/riscv/include/asm/cpufeature.h
>> @@ -164,4 +164,12 @@ static inline bool cpu_supports_indirect_br_lp_instr(void)
>>  		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFILP));
>>  }
>>  
>> +DECLARE_STATIC_KEY_FALSE(cpus_support_cmpxchg128);
>> +
>> +static inline bool system_has_cmpxchg128(void)
>> +{
>> +	return riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS) &&
>> +	       static_branch_likely(&cpus_support_cmpxchg128);
>> +}
>> +
>>  #endif
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index b56d149cf4ed..f73ce43df626 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -46,6 +46,9 @@ struct riscv_isainfo hart_isa[NR_CPUS];
>>  
>>  u32 thead_vlenb_of;
>>  
>> +/* All the CPUs supports cmpxchg128 (CASQ*). */
>> +DEFINE_STATIC_KEY_FALSE(cpus_support_cmpxchg128);
>> +
>>  /**
>>   * riscv_isa_extension_base() - Get base extension word
>>   *
>> @@ -317,6 +320,14 @@ static int riscv_cfiss_validate(const struct riscv_isa_ext_data *data,
>>  	return 0;
>>  }
>>  
>> +static int riscv_ext_zacas_validate(const struct riscv_isa_ext_data *data,
>> +				    const unsigned long *isa_bitmap)
>> +{
>> +	static_branch_enable(&cpus_support_cmpxchg128);
> 
> A validate callback is meant to determine whether or not the extension
> can be used, it's not there for people to add arbitrary code, partially
> because each validate callback runs multiple times and may change state
> depending on what happens with other extensions. E.g. a validate
> callback may pass on the first iteration but fail on the second because
> a dependant extension later in the list fails. In practice, this might
> not ever affect Zacas, and doesn't at the moment, but this sort of code
> should not be added to validate callbacks.

agree that this doesn't match the validate callback function perfectly.
the motivation here is to split a separate control for cmpxchg128
then the suffered platform can disable it in the errata code. though all
the AMOCAS.{W,D,Q} are included by Zacas, the PMA attribute is separated
as AMOCASW, AMOCASD, AMOCASQ. so I suppose the right validation here
is to check whether the AMOCASQ is supported, similar to how the Zicbom
is enabled according to a valid riscv_cbom_block_size. But unfortunately
there's no starndard way to retrieve the PMA attributes currently.

> 
> To be honest, I'd rather just turn the extension off entirely on this
> platform rather than make everyone suffer.

it's too brutal to disable the entire Zacas. we'll lose the performance
benefit from the users of cmpxchg and if clear it in the isa bitmap, it'll
be unavailable to the userspace. considering the kernel already provides
the system_has_cmpxchg128() for checking, we can limit it to cmpxchg128 only.

> The errata probe functions run after extension detection but before
> patching, so could we just clear the Zacas bit in the isa bitmap?
> 

maybe not, as from _apply_alternatives() the errata probe/patch is performed
after the patching. so it's too late to clear the isa bitmap as the patching
is already done...

what about something like below to add an errata alternative to disable
the cmpxchg128 only on the suffered platforms? this will limit the
change only to system_has_cmpxchg128() and won't bother others:

#define system_has_cmpxchg128 system_has_cmpxchg128
static __always_inline bool system_has_cmpxchg128(void)
{
	if (!IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
		return riscv_isa_extension_available(NULL, ZACAS);

	/* The vendor erratum overrides the standard Zacas alternative. */
	asm goto(ALTERNATIVE_2(
			"nop",
			"j %l[l_yes]",
			STANDARD_EXT, RISCV_ISA_EXT_ZACAS, 1,
			"nop",
			PICOHEART_VENDOR_ID, ERRATA_PICOHEART_AMOCASQ,
			CONFIG_ERRATA_PICOHEART_AMOCASQ)
		: : : : l_yes);
	
	return false;
l_yes:
	return true;
}

Thanks.


> Cheers,
> Conor.
> 
>> +
>> +	return 0;
>> +}
>> +
>>  static const unsigned int riscv_a_exts[] = {
>>  	RISCV_ISA_EXT_ZAAMO,
>>  	RISCV_ISA_EXT_ZALRSC,
>> @@ -544,7 +555,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>>  	__RISCV_ISA_EXT_DATA(za64rs, RISCV_ISA_EXT_ZA64RS),
>>  	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
>>  	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
>> -	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
>> +	__RISCV_ISA_EXT_DATA_VALIDATE(zacas, RISCV_ISA_EXT_ZACAS, riscv_ext_zacas_validate),
>>  	__RISCV_ISA_EXT_DATA(zalasr, RISCV_ISA_EXT_ZALASR),
>>  	__RISCV_ISA_EXT_DATA(zalrsc, RISCV_ISA_EXT_ZALRSC),
>>  	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
>> -- 
>> 2.50.1 (Apple Git-155)
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
