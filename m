Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB18CC6379F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 11:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMhoiiX964ilRbIYWtqPgtADROwEYKhbsm1qWhWpTiA=; b=JF+JEdkuCJVVcS
	Hy7dIpAV0Jx+J7M3C/Q0c5n84VmRjp3TUFh2OzqqoL8B6bThHxc1eyg6wNOE4ewzuZUHM11OmFzm+
	uorM0It51AGkl/T6encZ7yFbsQSocBHc7392kx+P5v42TKlT3Kr9L08VwB6TTvSgiy+61SI6Vx5yX
	+8ZbezBvTZ+WDCFubGMlF3q44498GNzsNjVlLRGMps7KpprFi2GmBQk5lxPQbCij1xkI3EAxr5WhA
	S98iUsdzjk9XKucEicWVSOoMNwS61uq5Jz/9UR+gZAJouG/hwiutijgsiB3/thNbnE6VZDWAd5oxi
	u/5c/rjsBD1Qp75PHtDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4yk-001GUs-7I; Thu, 09 Feb 2023 11:20:38 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4yT-001GIG-C7
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 11:20:23 +0000
Received: by mail-pj1-x1034.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so2053759pjp.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 03:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXe8EadkEx/055P10hs8mAmP94OkK4zucvqxGkXCpMk=;
        b=GeweVCB3gM/QamVNS/g6iCBg3l3eg8enJHF82PHhmhFRkp5/nyIV0XD/QYWErnsASE
         Di3O5guzO+vXyFIH5PeAYufDcRHcdSHTizGMWohnO9GFbiAR9/+r+/x0kQlNgZTEOp5I
         JfnNmailmKP0NpducXI+a0gP/PJthziNYQYTfRI/P4uvJ7QIMJH06wooSLWo1wPVbxWE
         zJOh6BOwsbWbzb1xqRsH/KInXRuXobg2GXkP/absxN/C1ZlN1Ml69OE8tbK8J44Djvo1
         vT7ho2UDxoxd8SIAUXvWvzvWn6JoPupQJuz76VtvcqwExTTslJK6MtfhnOfLACJi3jbk
         Frbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hXe8EadkEx/055P10hs8mAmP94OkK4zucvqxGkXCpMk=;
        b=6inBKelt/rLh/WJta0s7I+kWyNRpg6zdiGn0Do/LmvyN+oZP0nUVrCu4+Zi1n2uvBE
         WeM5Z1uaXXyg4cGJJwUbNMlfp539xFOqZ1jg763S1vlzmTywkUQaV7JYZgGPKggBwe+b
         lYtlrgd6ApfUvtjTT2aUhal8H046LCsDYPlHci3OGW5vBh6xIjFsWPdXgvFM629rIxp5
         ShSBRHbNP/GMWsAM470RJs289iZNILv3YMSDcWEpL629h5kLebNRWxpfCgvv1C9KfJzT
         fHQwioaCenfq4H6u7UdCpPazdpZliVNI3QfmQeCeorCEqZQgFj1m41UIMmjRgWJb3wsM
         HxrQ==
X-Gm-Message-State: AO0yUKWyX5PbZxhKykueDdCqrlhMf+ErF3QcTbfuoYvwUvL/uiHGiZkI
	IOLUL7WtoNIUv/ebbK0j/RY=
X-Google-Smtp-Source: AK7set+9uraImlVfYMBbqlyAuqEl5HhKnWLdFNtwrtnpH2qrFUBu5baFvYpCX85sN0ClxqxQzjNJFA==
X-Received: by 2002:a17:902:f392:b0:199:48fc:3dcb with SMTP id f18-20020a170902f39200b0019948fc3dcbmr4380927ple.68.1675941617945;
        Thu, 09 Feb 2023 03:20:17 -0800 (PST)
Received: from [198.18.0.1] ([47.75.78.161])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902f7c300b0019a593e45f1sm1208296plw.261.2023.02.09.03.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 03:20:17 -0800 (PST)
Message-ID: <5c5e578c-8834-5a87-1968-c79a16479a00@gmail.com>
Date: Thu, 9 Feb 2023 19:20:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v12 1/3] riscv: mm: modify pte format for Svnapot
To: Andrew Jones <ajones@ventanamicro.com>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
 xuyinan@ict.ac.cn, conor@kernel.org, Qinglin Pan <panqinglin2020@iscas.ac.cn>
References: <20230209035343.15282-1-panqinglin00@gmail.com>
 <20230209035343.15282-2-panqinglin00@gmail.com>
 <20230209101601.ppygtfm3kuk46k3g@orel>
From: Qinglin Pan <panqinglin00@gmail.com>
In-Reply-To: <20230209101601.ppygtfm3kuk46k3g@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_032021_506122_54A4F1E4 
X-CRM114-Status: GOOD (  26.71  )
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

On 2023/2/9 18:16, Andrew Jones wrote:
> On Thu, Feb 09, 2023 at 11:53:41AM +0800, Qinglin Pan wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> Add one alternative to enable/disable svnapot support, enable this static
>> key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
>> option is set. It will influence the behavior of has_svnapot. All code
>> dependent on svnapot should make sure that has_svnapot return true firstly.
>>
>> Modify PTE definition for Svnapot, and creates some functions in pgtable.h
>> to mark a PTE as napot and check if it is a Svnapot PTE. Until now, only
>> 64KB napot size is supported in spec, so some macros has only 64KB version.
>>
>> Signed-off-by: Qinglin Pan <panqinglin00@gmail.com>
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 7c814fbf9527..5b051ca93fa7 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -397,6 +397,25 @@ config RISCV_ISA_C
>>   
>>   	  If you don't know what to do here, say Y.
>>   
>> +config RISCV_ISA_SVNAPOT
>> +	bool "SVNAPOT extension support"
>> +	depends on 64BIT && MMU
>> +	select RISCV_ALTERNATIVE
>> +	default y
>> +	help
>> +	  Allow kernel to detect the SVNAPOT ISA-extension dynamically at boot
>> +	  time and enable its usage.
>> +
>> +	  The SVNAPOT extension is used to mark contiguous PTEs as a range
>> +	  of contiguous virtual-to-physical translations for a naturally
>> +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
>> +	  size. When HUGETLBFS is also selected this option unconditionally
>> +	  allocates some memory for each NAPOT page size supported by the kernel.
>> +	  When optimizing for low memory consumption and for platforms without
>> +	  the SVNAPOT extension, it may be better to say N here.
>> +
>> +	  If you don't know what to do here, say Y.
>> +
>>   config RISCV_ISA_SVPBMT
>>   	bool "SVPBMT extension support"
>>   	depends on 64BIT && MMU
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index ee9c80fe0062..6e368d3f6631 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -43,10 +43,11 @@
>>   #define RISCV_ISA_EXT_SSCOFPMF         26
>>   #define RISCV_ISA_EXT_SSTC             27
>>   #define RISCV_ISA_EXT_SVINVAL          28
>> -#define RISCV_ISA_EXT_SVPBMT           29
>> -#define RISCV_ISA_EXT_ZBB              30
>> -#define RISCV_ISA_EXT_ZICBOM           31
>> -#define RISCV_ISA_EXT_ZIHINTPAUSE      32
>> +#define RISCV_ISA_EXT_SVNAPOT          29
>> +#define RISCV_ISA_EXT_SVPBMT           30
>> +#define RISCV_ISA_EXT_ZBB              31
>> +#define RISCV_ISA_EXT_ZICBOM           32
>> +#define RISCV_ISA_EXT_ZIHINTPAUSE      33
> 
> We shouldn't reshuffle this every time we add a new extension, as that's
> too error-prone. I'll send a patch to clarify that this list doesn't need
> to be alphabetical.

Sure. I will define RISCV_ISA_EXT_SVNAPOT as 33 directly in the v13 :)

> 
>>   
>>   #ifndef __ASSEMBLY__
>>   
>> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
>> index 9f432c1b5289..24a3dd265183 100644
>> --- a/arch/riscv/include/asm/page.h
>> +++ b/arch/riscv/include/asm/page.h
>> @@ -16,11 +16,6 @@
>>   #define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
>>   #define PAGE_MASK	(~(PAGE_SIZE - 1))
>>   
>> -#ifdef CONFIG_64BIT
>> -#define HUGE_MAX_HSTATE		2
>> -#else
>> -#define HUGE_MAX_HSTATE		1
>> -#endif
>>   #define HPAGE_SHIFT		PMD_SHIFT
>>   #define HPAGE_SIZE		(_AC(1, UL) << HPAGE_SHIFT)
>>   #define HPAGE_MASK              (~(HPAGE_SIZE - 1))
>> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
>> index 42a042c0e13e..7a5097202e15 100644
>> --- a/arch/riscv/include/asm/pgtable-64.h
>> +++ b/arch/riscv/include/asm/pgtable-64.h
>> @@ -78,6 +78,40 @@ typedef struct {
>>    */
>>   #define _PAGE_PFN_MASK  GENMASK(53, 10)
>>   
>> +/*
>> + * [63] Svnapot definitions:
>> + * 0 Svnapot disabled
>> + * 1 Svnapot enabled
>> + */
>> +#define _PAGE_NAPOT_SHIFT	63
>> +#define _PAGE_NAPOT		BIT(_PAGE_NAPOT_SHIFT)
>> +/*
>> + * Only 64KB (order 4) napot ptes supported.
>> + */
>> +#define NAPOT_CONT_ORDER_BASE 4
>> +enum napot_cont_order {
>> +	NAPOT_CONT64KB_ORDER = NAPOT_CONT_ORDER_BASE,
>> +	NAPOT_ORDER_MAX,
>> +};
>> +
>> +#define for_each_napot_order(order)						\
>> +	for (order = NAPOT_CONT_ORDER_BASE; order < NAPOT_ORDER_MAX; order++)
>> +#define for_each_napot_order_rev(order)						\
>> +	for (order = NAPOT_ORDER_MAX - 1;					\
>> +	     order >= NAPOT_CONT_ORDER_BASE; order--)
>> +#define napot_cont_order(val)	(__builtin_ctzl((val.pte >> _PAGE_PFN_SHIFT) << 1))
>> +
>> +#define napot_cont_shift(order)	((order) + PAGE_SHIFT)
>> +#define napot_cont_size(order)	BIT(napot_cont_shift(order))
>> +#define napot_cont_mask(order)	(~(napot_cont_size(order) - 1UL))
>> +#define napot_pte_num(order)	BIT(order)
>> +
>> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
>> +#define HUGE_MAX_HSTATE		(2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
>> +#else
>> +#define HUGE_MAX_HSTATE		2
>> +#endif
>> +
>>   /*
>>    * [62:61] Svpbmt Memory Type definitions:
>>    *
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index 2a88362dffa5..76502bc7bef2 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -264,10 +264,47 @@ static inline pte_t pud_pte(pud_t pud)
>>   	return __pte(pud_val(pud));
>>   }
>>   
>> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
>> +
>> +static __always_inline bool has_svnapot(void)
>> +{
>> +	return riscv_has_extension_likely(RISCV_ISA_EXT_SVNAPOT);
>> +}
>> +
>> +static inline unsigned long pte_napot(pte_t pte)
>> +{
>> +	return pte_val(pte) & _PAGE_NAPOT;
>> +}
>> +
>> +static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
>> +{
>> +	int pos = order - 1 + _PAGE_PFN_SHIFT;
>> +	unsigned long napot_bit = BIT(pos);
>> +	unsigned long napot_mask = ~GENMASK(pos, _PAGE_PFN_SHIFT);
>> +
>> +	return __pte((pte_val(pte) & napot_mask) | napot_bit | _PAGE_NAPOT);
>> +}
>> +
>> +#else
>> +
>> +static __always_inline bool has_svnapot(void) { return false; }
>> +
>> +static inline unsigned long pte_napot(pte_t pte)
>> +{
>> +	return 0;
>> +}
>> +
>> +#endif /* CONFIG_RISCV_ISA_SVNAPOT */
>> +
>>   /* Yields the page frame number (PFN) of a page table entry */
>>   static inline unsigned long pte_pfn(pte_t pte)
>>   {
>> -	return __page_val_to_pfn(pte_val(pte));
>> +	unsigned long res  = __page_val_to_pfn(pte_val(pte));
>> +
>> +	if (has_svnapot() && pte_napot(pte))
>> +		res = res & (res - 1UL);
>> +
>> +	return res;
>>   }
>>   
>>   #define pte_page(x)     pfn_to_page(pte_pfn(x))
>> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>> index 420228e219f7..5670909619c8 100644
>> --- a/arch/riscv/kernel/cpu.c
>> +++ b/arch/riscv/kernel/cpu.c
>> @@ -191,6 +191,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
>>   	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>>   	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>>   	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>> +	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>>   	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>>   	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>>   };
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 21fb567e1b22..271e391d436d 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -223,6 +223,7 @@ void __init riscv_fill_hwcap(void)
>>   				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>>   				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>>   				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
>> +				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
>>   				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
>>   				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
>>   				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
>> -- 
>> 2.39.1
>>
> 
> FYI, I don't think these rebase changes were significant enough to drop my
> r-b, but, anyway, here it is again
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Got it.

Thanks,
Qinglin.

> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
