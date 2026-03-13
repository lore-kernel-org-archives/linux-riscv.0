Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FC5107BCE6
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 21:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btLWnaqR2KgEF3V223snQ27bT9ptrTsAnt1llpSaPmI=; b=2O7TKc8/9DJ7KE
	oKnHLA3Km1/z9z6yq+YdGZds4bW5lVG6p3sVZlnjmDtZ7tjNSOPTd3W/oqsmrawK9fXOdgKxdnmFG
	BIsEwM9AWjX3RJwCiIoYdKDdBXhmH4a5+wgoCrfYjo5X3MR45SslBhbn/tVS8sEdbL2UlN2vY0Vpm
	PtLU8c98WiQovPJAUhPabKLFmp2v9ss+dZEksnWLUNdMaeNthoPtot5Db1rfu8nVE+0BY2ZDR1uq1
	10c8DFP2P75JmIXTMgNgUYOoj0XbQDzYoESYSVkWue/nkcYXsBUu3XFeDfeyPYRGvA4pFg/h0WslJ
	P6/hvSWgTKhOvkRV78ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1A4N-00000001DUS-37qr;
	Fri, 13 Mar 2026 21:29:19 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1A4K-00000001DU0-2cAn
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 21:29:17 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-126ea4b77adso3424791c88.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 14:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773437356; x=1774042156; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1IyD/QFjiB4F3V0bSsrb/CnqUpdLxKmx3PhmqTmoLis=;
        b=nOjm5Zk32zXcgrSdr4w85RN6f0qWiLdbojKJQBR+lCVUAK4zm5xZyybe71Q3ihDEQt
         uC33QZXXL46CxZDQepCZ2SGzBWqLU6r094u2FC90W1UR7+zt9ruWHE64i1b3eKkp0ltI
         yDWhkGoNiGRaXh1kdkA++tXMKQv18hINFkvvq5yLkaRDzmKIM1KWfecPnqVy/eP3ruKC
         vmbkn/wiPl6lsIYwDMGVzaoWYBNbm4sy0uQ4vz8pYobquzqqzrkv7paP0e+guCqO4T5L
         hrrwcEv50ac7RbFNXF2RPUfpzpzUvXIhlreLXpp/kDDbQ5zwKV//kQj49kxOtlJpawHP
         9W8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773437356; x=1774042156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1IyD/QFjiB4F3V0bSsrb/CnqUpdLxKmx3PhmqTmoLis=;
        b=lpbzKEhXPIZ3h1sxTwsUjzRjh1qlZ3cPKsKNhTH+YGbHBrJRUNI97bNiOOuNTL0Fyc
         IUtIIRsqO8l7kpg2flMVzhZo3QSThgakubCzCYP9YKwNngjZHWiRigTCcAIwC0Zajl4k
         NEuEcfjchfmnx2L58u6K7+hDvzERp5IrbQwRF20nmLPKnt0KBil8j/+78DengZWg/+3O
         on8BBTVLaP4tLU6efivkPmEqsXLAKONe0tRBGNOvOJkAHrjRTzaPJ4l0sXfBMMoDCED7
         qnw457ZMJsrgKY/D/lRN1lvGbDNMMVkbA8YxJ3bgsP9CNHiQZntvmd6EBz4orkvzGrji
         Ay2A==
X-Gm-Message-State: AOJu0Ywfty8I9HYTVS1WzjEC+aytU23wzsu1UOY5jKMNWneVx6XpV6xy
	5k1tFTf5jfzmy67VxIFX2DvziDBLKHM5pLL3IlmomeuOy2KUmeByQcsy
X-Gm-Gg: ATEYQzxIvT9zUPwaind7nGCZu6fgADyYzW8x8xsT5U77AGN6p8MfGPsXXiKCtwXDu2B
	rN6DXALtB19SI+bLPnCtvjnJjTKnwHdIzrfZpV8htuJR29tThnLtihcejTpklPlahy2VdaR3o+v
	doWeg758r7MS6Uj6BBi9kAggN6nYA/9KBN8RlBldtgCdiL0dVFueSOB8fo7cH8LE5Hvo/4GsTF1
	ecJbqCuAqAJRZd2ZqxlGhRu6NZDbP354Zp+8UYG7IEo1Zel2h/d2CNPXOgG3jAd5p5WMjE27UXT
	0VnP2WmIC8PXG0k+O9w0pp4LXp4DGkm2uay0uVIOLEXqNya6EZvo4JFrhO/5Wrmoi+JdyxxQM+5
	C/O0PrV1C/woPlqRq6VReo6C7pHT+S1zQZhBfCpHHhYIsNtS6pb/GTXshuCyxARo3XaOz2znsR3
	nnlcY+OpzfbOBhuuhDpbhH8vtnmhr+csAboPVWXLdiN//gCb0=
X-Received: by 2002:a05:7300:d717:b0:2be:fe8:8b0a with SMTP id 5a478bee46e88-2bea54de394mr2020946eec.21.1773437355602;
        Fri, 13 Mar 2026 14:29:15 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3eec8fsm4224208eec.13.2026.03.13.14.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 14:29:14 -0700 (PDT)
Message-ID: <31b0abc4-b107-4c95-b6c8-51941330b0f4@gmail.com>
Date: Fri, 13 Mar 2026 14:34:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/6] riscv: apply page table attribute bits for
 XPbmtUC
To: Conor Dooley <conor@kernel.org>, Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
 david@redhat.com, palmer@dabbelt.com, pjw@kernel.org, gaohan@iscas.ac.cn,
 me@ziyao.cc, lizhi2@eswincomputing.com, hal.feng@starfivetech.com,
 marcel@ziswiler.com, kernel@esmil.dk, devicetree@vger.kernel.org
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313084407.29669-4-ganboing@gmail.com>
 <20260313-breezy-from-6b5ad9e9a5ac@spud>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260313-breezy-from-6b5ad9e9a5ac@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_142916_664218_B81833A3 
X-CRM114-Status: GOOD (  15.68  )
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

Hi Conor,

On 3/13/26 06:24, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 01:44:04AM -0700, Bo Gan wrote:
>> Apply the UC bit like Svpbmt and THEAD_MAE does. Also changed the
>> _PAGE_PFN_MASK definition to exclude the UC bit, as it's position
>> is now determined at runtime, and can be part of PPN.
>>
>> Signed-off-by: Bo Gan <ganboing@gmail.com>
> 
> This should be squashed with the patch adding detection and the Kconfig
> option.
> 

Sure.

>> ---
>>   arch/riscv/include/asm/errata_list.h | 17 +++++++++++++++--
>>   arch/riscv/include/asm/pgtable-64.h  |  9 ++++++++-
>>   2 files changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
>> index 6694b5ccdcf85..ba0f3d4dd0cbb 100644
>> --- a/arch/riscv/include/asm/errata_list.h
>> +++ b/arch/riscv/include/asm/errata_list.h
>> @@ -53,6 +53,16 @@ asm(ALTERNATIVE(	\
>>   	: /* no inputs */	\
>>   	: "memory")
>>   
>> +#ifdef CONFIG_64BIT
>> +#define ALT_PAGE_CUST_BIT(_bit)						\
>> +asm(ALTERNATIVE("li %0, 0\t\nnop",					\
>> +		"1: auipc %0, %%pcrel_hi(riscv_xpbmtuc_mask)\t\n"	\
>> +		      "ld %0, %%pcrel_lo(1b)(%0)", 0,			\
>> +			RISCV_ISA_EXT_XPBMTUC,				\
>> +			CONFIG_RISCV_ISA_XPBMTUC)			\
>> +		: "=r"(_bit))
>> +#endif
>> +
>>   /*
>>    * _val is marked as "will be overwritten", so need to set it to 0
>>    * in the default case.
>> @@ -60,11 +70,14 @@ asm(ALTERNATIVE(	\
>>   #define ALT_SVPBMT_SHIFT 61
>>   #define ALT_THEAD_MAE_SHIFT 59
>>   #define ALT_SVPBMT(_val, prot)						\
>> -asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
>> +asm(ALTERNATIVE_3("li %0, 0\t\nnop",					\
>>   		  "li %0, %1\t\nslli %0,%0,%3", 0,			\
>>   			RISCV_ISA_EXT_SVPBMT, CONFIG_RISCV_ISA_SVPBMT,	\
>>   		  "li %0, %2\t\nslli %0,%0,%4", THEAD_VENDOR_ID,	\
>> -			ERRATA_THEAD_MAE, CONFIG_ERRATA_THEAD_MAE)	\
>> +			ERRATA_THEAD_MAE, CONFIG_ERRATA_THEAD_MAE,	\
>> +		  "1: auipc %0, %%pcrel_hi(riscv_xpbmtuc_mask)\t\n"	\
>> +			"ld %0, %%pcrel_lo(1b)(%0)", 0,			\
>> +			RISCV_ISA_EXT_XPBMTUC, XPBMTUC_HAS##prot)	\
>>   		: "=r"(_val)						\
>>   		: "I"(prot##_SVPBMT >> ALT_SVPBMT_SHIFT),		\
>>   		  "I"(prot##_THEAD >> ALT_THEAD_MAE_SHIFT),		\
>> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
>> index 1a6d04884111d..aab6990d92238 100644
>> --- a/arch/riscv/include/asm/pgtable-64.h
>> +++ b/arch/riscv/include/asm/pgtable-64.h
>> @@ -76,7 +76,14 @@ typedef struct {
>>    * | 63 | 62 61 | 60 54 | 53  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
>>    *   N      MT     RSV    PFN      reserved for SW   D   A   G   U   X   W   R   V
>>    */
>> -#define _PAGE_PFN_MASK  GENMASK(53, 10)
>> +static inline u64 riscv_pfn_mask(void)
>> +{
>> +	u64 cust_bit;
>> +
>> +	ALT_PAGE_CUST_BIT(cust_bit);
>> +	return GENMASK(53, 10) ^ cust_bit;
>> +}
>> +#define _PAGE_PFN_MASK  riscv_pfn_mask()
>>   
>>   /*
>>    * [63] Svnapot definitions:
>> -- 
>> 2.34.1
>>

Bo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
