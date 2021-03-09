Return-Path: <SRS0=trcm=IH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94E4C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 01:24:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6BC651B7
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 01:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6BC651B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KDfklPUwBBnLNSm7TiGnHrBKZOXiLOXHagg3mvo9wEg=; b=Si/ovgBOYy19nLdgLEdZGDoT/
	3t8KLM8E8yUUsvDtLFByZHggp0V8uUm00veS1yEAtUY5nnZmKqoYKlFfQ6Wkv6WzM/NZtDCeVAYdl
	Edwhacz0OGcJsTxo+q2mfVHXtuaeVxStvROv5LfMD4gP2fb2ZL3oJlO55o/tThG1N0zLcK8ev6BU8
	U/YV6bes26e9IUIl5crpsfW8Omzqiju7SHPlOdeJ71SdwLp1N65Si1kJCTL6DiO8aqg0I/076pfLV
	O/UURdGeq/xgwC2oEHxoATslbh7pfd1TGaJYR/huiDR6QQoFOszaUUSVqfn5C7INBajqEVfx4z2uH
	C0e6noriQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJR6T-003aJo-Vi; Tue, 09 Mar 2021 01:24:06 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJR6O-003aI7-H8
 for linux-riscv@lists.infradead.org; Tue, 09 Mar 2021 01:24:02 +0000
Received: by mail-qk1-x72f.google.com with SMTP id d20so11536255qkc.2
 for <linux-riscv@lists.infradead.org>; Mon, 08 Mar 2021 17:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JMkbhhcCY8Z3nUSjTwM2D5C+eBrmgZwHpkYvA2/ajaI=;
 b=urCKj6cJAZFH7atFsb/bamoXPUCsayrT83qV0n9u3XhH6qOLXy/5XEmy4WmVGIYMK+
 nX7FjEW16jhGrzxSNYxzkinK+kQ5qjIOOwk5cC/Zn85Hwe1MGklL5Hd5T/8CoLLvTB3Y
 3+ZfU0EVgwIyZ9an/zIARlQIA/4LBNuIr2NSYM2KDp1Q5h131dxJ/vuzgwp/wCnqd0q2
 9zSB0sJORoFCfggV4AvQiIToqDIJhbnf/9DJ85MND6MsugREIUfsAgN171gBCuhBhPPA
 /N5Kn6gfyWea0KrYPAOFNdFsXb/P+eRvS6DsEztBTUP2K8Jltm9nEox6ddCSM5AkhCHX
 ANwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JMkbhhcCY8Z3nUSjTwM2D5C+eBrmgZwHpkYvA2/ajaI=;
 b=PMYf0ahaPKErNZU/8vGdXEeSUJzoulhlGGPM3PbXPRntHIX2p0HwAdif2HT+nlCVBt
 JEVBhJ+YIyNrWPhD+VtjaoLyyKj1e5HwhJglgaulbRDB3PNizSC0iPEHGidYUvRqtKPN
 ifnfSuC5FP+WCWaSxJNrfYOOUldXHsYetHUTMgF50VBovjoEQ7ilKvBxbMPnCBU7SOy+
 NRuH5bt0Pjk+zuctEq9hzNSYO1b+eiSEmCQColZWjBOGg0tG/q4Bgg2JQxbTJ5WcLhPo
 Vdca7FSPTLzaEsmUqclV4u2RknBG04cYnhExYbwotvXI2Z6QZ3SRn/L2+t/UsJeXRh9O
 L7Cw==
X-Gm-Message-State: AOAM532C5+pgopSKF5NUd97ycF6tfTa5JQ8i4yskge9PkJVKXNpn93kP
 Gu+8ozrWd5XJrWs1ZC6ig6c=
X-Google-Smtp-Source: ABdhPJyZU8L9prMKWRBE6DvIxjTbwf/Is6iZ1L1mpjw2Klc2EmdBb8i0c0fXWdBgj04waRaqu7yojA==
X-Received: by 2002:a05:620a:144a:: with SMTP id
 i10mr23490322qkl.431.1615253038916; 
 Mon, 08 Mar 2021 17:23:58 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id 73sm9161807qkk.131.2021.03.08.17.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 17:23:58 -0800 (PST)
Subject: Re: [RFC patch 2/4] riscv: Get CPU manufacturer information
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>
Cc: "Frank.Zhao@starfivetech.com" <Frank.Zhao@starfivetech.com>,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 "guoren@kernel.org" <guoren@kernel.org>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
References: <1615175897-23509-1-git-send-email-vincent.chen@sifive.com>
 <1615175897-23509-3-git-send-email-vincent.chen@sifive.com>
 <BL0PR04MB6514006678BE79B275DCE744E7939@BL0PR04MB6514.namprd04.prod.outlook.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <8d7465e5-9234-b525-f5fd-ea342f7fc3fd@gmail.com>
Date: Mon, 8 Mar 2021 20:23:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BL0PR04MB6514006678BE79B275DCE744E7939@BL0PR04MB6514.namprd04.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_012400_812302_0AC6F158 
X-CRM114-Status: GOOD (  21.94  )
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

On 3/8/21 6:30 PM, Damien Le Moal wrote:
> On 2021/03/08 12:59, Vincent Chen wrote:
>> Issue 3 SBI calls to get the vendor ID, architecture ID and implementation
>> ID early in boot so we only need to take the SBI call overhead once.
>>
>> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
>> ---
>>   arch/riscv/include/asm/csr.h       |  3 +++
>>   arch/riscv/include/asm/hwcap.h     |  6 ++++++
>>   arch/riscv/include/asm/processor.h |  2 ++
>>   arch/riscv/include/asm/soc.h       |  1 +
>>   arch/riscv/kernel/cpufeature.c     | 17 +++++++++++++++++
>>   arch/riscv/kernel/setup.c          |  2 ++
>>   arch/riscv/kernel/soc.c            |  1 +
>>   7 files changed, 32 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
>> index caadfc1d7487..87ac65696871 100644
>> --- a/arch/riscv/include/asm/csr.h
>> +++ b/arch/riscv/include/asm/csr.h
>> @@ -115,6 +115,9 @@
>>   #define CSR_MIP			0x344
>>   #define CSR_PMPCFG0		0x3a0
>>   #define CSR_PMPADDR0		0x3b0
>> +#define CSR_MVENDORID		0xf11
>> +#define CSR_MARCHID		0xf12
>> +#define CSR_MIMPID		0xf13
>>   #define CSR_MHARTID		0xf14
>>   
>>   #ifdef CONFIG_RISCV_M_MODE
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index 5ce50468aff1..b7409487c9d2 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -44,6 +44,12 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
>>   #define riscv_isa_extension_available(isa_bitmap, ext)	\
>>   	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
>>   
>> +struct cpu_manufacturer_info_t {
>> +	unsigned long vendor_id;
>> +	unsigned long arch_id;
>> +	unsigned long imp_id;
>> +};
>> +
>>   #endif
>>   
>>   #endif /* _ASM_RISCV_HWCAP_H */
>> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
>> index 3a240037bde2..4e11a9621d14 100644
>> --- a/arch/riscv/include/asm/processor.h
>> +++ b/arch/riscv/include/asm/processor.h
>> @@ -72,6 +72,8 @@ int riscv_of_parent_hartid(struct device_node *node);
>>   
>>   extern void riscv_fill_hwcap(void);
>>   
>> +void riscv_fill_cpu_manufacturer_info(void);
>> +
>>   #endif /* __ASSEMBLY__ */
>>   
>>   #endif /* _ASM_RISCV_PROCESSOR_H */
>> diff --git a/arch/riscv/include/asm/soc.h b/arch/riscv/include/asm/soc.h
>> index f494066051a2..03dee6db404c 100644
>> --- a/arch/riscv/include/asm/soc.h
>> +++ b/arch/riscv/include/asm/soc.h
>> @@ -10,6 +10,7 @@
>>   #include <linux/of.h>
>>   #include <linux/linkage.h>
>>   #include <linux/types.h>
>> +#include <asm/hwcap.h>
>>   
>>   #define SOC_EARLY_INIT_DECLARE(name, compat, fn)			\
>>   	static const struct of_device_id __soc_early_init__##name	\
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index ac202f44a670..389162ee19ea 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -12,6 +12,8 @@
>>   #include <asm/hwcap.h>
>>   #include <asm/smp.h>
>>   #include <asm/switch_to.h>
>> +#include <asm/sbi.h>
>> +#include <asm/csr.h>
>>   
>>   unsigned long elf_hwcap __read_mostly;
>>   
>> @@ -22,6 +24,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>>   bool has_fpu __read_mostly;
>>   #endif
>>   
>> +struct cpu_manufacturer_info_t cpu_mfr_info;
>> +
>>   /**
>>    * riscv_isa_extension_base() - Get base extension word
>>    *
>> @@ -149,3 +153,16 @@ void riscv_fill_hwcap(void)
>>   		has_fpu = true;
>>   #endif
>>   }
>> +
>> +void riscv_fill_cpu_manufacturer_info(void)
>> +{
>> +#ifndef CONFIG_RISCV_M_MODE
>> +	cpu_mfr_info.vendor_id = sbi_get_vendorid();
>> +	cpu_mfr_info.arch_id = sbi_get_archid();
>> +	cpu_mfr_info.imp_id = sbi_get_impid();
>> +#else
>> +	cpu_mfr_info.vendor_id = csr_read(CSR_MVENDORID);
>> +	cpu_mfr_info.arch_id = csr_read(CSR_MARCHID);
>> +	cpu_mfr_info.imp_id = csr_read(CSR_MIMPID);
>> +#endif
> 
> Why ? reading the registers will work with M-Mode too. It was there before when
> we temporarily had the builtin DTB lookup based on vendor/arch/imp (see defunct
> soc_lookup_builtin_dtb() in 5.11).

I don't understand what the objection is here. S-mode does not have
these CSRs, so it uses SBI. M-mode does, so it reads the CSRs. This is
the same logic as soc_lookup_builtin_dtb, except it works with S-mode as
well.

--Sean

> 
>> +}
>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> index e85bacff1b50..03621ce9092c 100644
>> --- a/arch/riscv/kernel/setup.c
>> +++ b/arch/riscv/kernel/setup.c
>> @@ -278,6 +278,8 @@ void __init setup_arch(char **cmdline_p)
>>   #endif
>>   
>>   	riscv_fill_hwcap();
>> +
> 
> Nit: I do not think the white libe is really necessary here.
> 
>> +	riscv_fill_cpu_manufacturer_info();
>>   }
>>   
>>   static int __init topology_init(void)
>> diff --git a/arch/riscv/kernel/soc.c b/arch/riscv/kernel/soc.c
>> index a0516172a33c..58f6fd91743a 100644
>> --- a/arch/riscv/kernel/soc.c
>> +++ b/arch/riscv/kernel/soc.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/libfdt.h>
>>   #include <linux/pgtable.h>
>>   #include <asm/soc.h>
>> +#include <asm/hwcap.h>
> 
> Why is this necessary ?
> 
>>   
>>   /*
>>    * This is called extremly early, before parse_dtb(), to allow initializing
>>
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
