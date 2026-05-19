Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CE8CD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 17:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z18f0h2d2AgmNntxorMHMda3B0uS+PNPHuduED7voLw=; b=pXJWDXDUyqNk5b
	sXMvMZN/KcbXfR+MoeXf7sIYk4HdDQoZuNU4Dtj8XnPdLwkm8qo+730MvVZ5AJ0D4xSb7e4svcL29
	5nVk/teDtRjWkpTJZMTQFBdwzdWm3gHPXaP/FhKUYe++0QdiEEmita/By9SiiUhGdYKPwrVQrfATd
	ZmX9H1rjlI01x9y5LovHqYLmA1egHLqSlQSyZaLorIzpyoTvT+/ACg6y0au2yNj2wxWD/XDr29s4I
	Dz3/tJNF1AJkb4rvPJS133h22NkGehoCLCzh8N9RgBcIVFJkViRrWoPKAP4Jv4cBcxMLlhFiW5lDg
	Tsrl0n5GwdoTiHHyIcdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOLC-00000002Pet-1piE;
	Tue, 19 May 2026 17:34:50 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOLA-00000002Pe8-1iaR
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 17:34:49 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7de431da8fbso3495867a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 10:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779212087; x=1779816887; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tye5Ry/uPh3IdUfjZdOE/qSwu/HkY8CplMa5WQ3odOM=;
        b=Dd++g5eWAJ3hlq80L2Nmj/ARGiLu/p+0x2+KG+rsZz0/mbvHB/qg5Ns77JOcdddjaf
         pjhhAfOJu4xAmC37P1GYoK1ET0pj/5B2WpqCIajbX3VYLQ2YavkLnVKoZAe1N8lkE3xC
         DvkEjqjk0eyiWKdOjVoL6nG7BSMueqHSQUgSRFrOlnRTe/v6tuagDtriaZrURYraWqlw
         cijKh8fH2wrdWlOqVCnB35QSYE9teTZBAfje5Mvs0+zRDi7agETlOG/Ff6KbgYRNRBy4
         SImrTAg9r4xhtm8kackyUQxIB3DeDN5/bRTGBZnTbxoGbNapvEDq8983PNrtnhCFgISf
         KSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779212087; x=1779816887;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tye5Ry/uPh3IdUfjZdOE/qSwu/HkY8CplMa5WQ3odOM=;
        b=kjkr9VRnwyYtZiqRm3wyU24nv4yBms/ml05Q7uUh62dKaUCucYeiYX47kaXKt66CrA
         xlqhrOwb4ELYofeCDs7oi7pllV/otvVc+kb5uw+XooMKe+eOO2v/9PIX72y6CuZZmJ2H
         zchctLeVwqs3BamKUN1WSRuMb2TsZMGjrd28G63GV52aQCD7Z+FMpkUaayS1kLOG9ccW
         tPkbuROr0sX70t5JH3KoEjJjE2o1JYjRueWE2/sdh5ungBLlV2ZbpsLbytIOnWt/TSY4
         nWOaSuY2NffKj6Ye+Zz+c9+6Rd8LWYVvcaQmWC+hBuMTA9nDRlNv7eBmAp1sfvfHHClk
         h2rQ==
X-Forwarded-Encrypted: i=1; AFNElJ+OoIVaOiufhUHfQJRUQCkj40sQ+aq+jBlx+8UPdBbRS1ppFygbQtjjjyWJmPIpjJ7G/XkcQIk7z1sBfg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3K4S6Q5c+FnOtDJPAJoeOxlFE79KBxo0o07wVd1isPcnbDg6c
	2G5tsfmRGav/6/npS3MjCo97Ort9Rc6nEL7q5+45Nmmbnqjb1HU0FFqFeFhvMG8MWW4=
X-Gm-Gg: Acq92OHI3lxxciSCxQRmxI1s4dpHZrTP677QQT9P2JfN0Yau7JigKE12fwKiSJ7E8lL
	LH2YClN1sdB0FlG/3r1UwZIKjt1Kid92NpTUkMALK6KwmQoC84JKJdPJRT8V9G7El0el6qI5M4T
	Gugd7S3wm66DPv2T5VeliagXcBNcaa3dTRMskV2ohWcU0J/6OxxyaQxb0g/Mi3SMuNF7ph4uFzb
	0oog3aTLyFN3rT1E30Jt60T9LnEPUfS2TiiZVGpR1nOKuPw8F1JdcYIDTXR8O1wTkuSqsrR0ZLc
	esn0vTtwQH300ax1ok1bDxXAmbEKeI/WLNTI8tS3OmhJpUwLpc9XeZZDdlOIDIkMMsqnA8st/YN
	iJhRuTALU9UsC/wsi9WmGaZ07YtRPp2LATjZ85vMaxYaelaZCCCMxdGDZnZWrE+93gVlovJe4ZX
	RG9DT2JTi7s4au/Dsbct5lim23LOFQHGjsTss=
X-Received: by 2002:a05:6830:d0a:b0:7dc:e1e6:7687 with SMTP id 46e09a7af769-7e4ea06dd71mr13897026a34.4.1779212086860;
        Tue, 19 May 2026 10:34:46 -0700 (PDT)
Received: from [100.64.0.1] ([165.225.37.83])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55bc13a0asm11239964a34.21.2026.05.19.10.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 10:34:46 -0700 (PDT)
Message-ID: <66c1503a-5fc5-432d-8312-403b2999d9d4@sifive.com>
Date: Tue, 19 May 2026 12:34:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: track effective hardware PTE A/D updates
To: Conor Dooley <conor@kernel.org>, Michael Ellerman <mpe@kernel.org>
Cc: Yunhui Cui <cuiyunhui@bytedance.com>, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, andrew+kernel@donnellan.id.au,
 rmclure@linux.ibm.com, debug@rivosinc.com, baolin.wang@linux.alibaba.com,
 zhangchunyan@iscas.ac.cn, apopple@nvidia.com, namcao@linutronix.de,
 wangruikang@iscas.ac.cn, apatel@ventanamicro.com, liu.xuemei1@zte.com.cn,
 ajones@ventanamicro.com, cleger@rivosinc.com, charlie@rivosinc.com,
 hui.wang@canonical.com, guodong@riscstar.com,
 pincheng.plct@isrc.iscas.ac.cn, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Qingwei Hu <qingwei.hu@bytedance.com>
References: <20260519031927.70683-1-cuiyunhui@bytedance.com>
 <78e7f039-74a4-4499-a896-a20912ebc6fb@kernel.org>
 <20260519-justly-fragile-f0e298526b08@spud>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260519-justly-fragile-f0e298526b08@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_103448_465492_EC3BAFA8 
X-CRM114-Status: GOOD (  25.43  )
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

On 2026-05-19 10:37 AM, Conor Dooley wrote:
> On Tue, May 19, 2026 at 10:05:21PM +1000, Michael Ellerman wrote:
>> On 19/5/2026 13:19, Yunhui Cui wrote:
>>> Separate Svadu capability discovery from the host's effective ADUE
>>> state. Enable SBI FWFT PTE A/D hardware updating on each online CPU
>>> through CPUHP when both Svade and Svadu are present, use the resulting
>>> runtime state for arch_has_hw_pte_young(), and fall back to
>>> software-managed A/D updates when enabling the feature fails.
>>>
>>> Platforms with Svadu but without Svade are treated as always using
>>> hardware PTE A/D updates. Expose the runtime state through an inline
>>> getter so hot MM paths avoid an out-of-line function call.
>>
>> I'm not sure what you mean here. The current code doesn't use an out-of-line
>> function call AFAICS? More comments below ...
>>
>>> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>>> Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
>>> ---
>>>   arch/riscv/include/asm/cpufeature.h |  6 +++
>>>   arch/riscv/include/asm/pgtable.h    |  8 ++--
>>>   arch/riscv/kernel/cpufeature.c      | 73 ++++++++++++++++++++++++++---
>>>   3 files changed, 77 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
>>> index 739fcc84bf7b2..877d71a1ea755 100644
>>> --- a/arch/riscv/include/asm/cpufeature.h
>>> +++ b/arch/riscv/include/asm/cpufeature.h
>>> @@ -128,6 +128,12 @@ struct riscv_isa_ext_data {
>>>   extern const struct riscv_isa_ext_data riscv_isa_ext[];
>>>   extern const size_t riscv_isa_ext_count;
>>>   extern bool riscv_isa_fallback;
>>> +extern bool riscv_hw_pte_ad_updating_enabled;
>>> +
>>> +static __always_inline bool riscv_has_hw_pte_ad_updating(void)
>>> +{
>>> +	return READ_ONCE(riscv_hw_pte_ad_updating_enabled);
>>> +}
>>>   unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
>>>   static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
>>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>>> index a1a7c6520a095..20663a466cf6c 100644
>>> --- a/arch/riscv/include/asm/pgtable.h
>>> +++ b/arch/riscv/include/asm/pgtable.h
>>> @@ -732,14 +732,14 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
>>>   #define pgprot_dmacoherent pgprot_writecombine
>>>   /*
>>> - * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
>>> - * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
>>> - * DT.
>>> + * Both Svade and Svadu control the hardware behavior when the PTE A/D bits
>>> + * need to be set. The core MM code only cares whether hardware updating of
>>> + * the accessed/dirty state is currently active.
>>>    */
>>>   #define arch_has_hw_pte_young arch_has_hw_pte_young
>>>   static inline bool arch_has_hw_pte_young(void)
>>>   {
>>> -	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
>>> +	return riscv_has_hw_pte_ad_updating();
>>>   }
>>
>> riscv_has_extension_unlikely() uses an asm alternative, ie. it's patched at
>> boot so there's no runtime cost. But now you've changed it to just test a
>> bool.
>>
>> I'm not sure arch_has_hw_pte_young() is a particularly hot path, but seems
>> like you could use a static key, so that the code is patched to avoid the
>> runtime test?
>>
>>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>>> index f46aa5602d74d..e46b2d2b49eed 100644
>>> --- a/arch/riscv/kernel/cpufeature.c
>>> +++ b/arch/riscv/kernel/cpufeature.c
>>> @@ -35,6 +35,8 @@
>>>   static bool any_cpu_has_zicboz;
>>>   static bool any_cpu_has_zicbop;
>>>   static bool any_cpu_has_zicbom;
>>> +bool riscv_hw_pte_ad_updating_enabled __read_mostly;
>>> +EXPORT_SYMBOL_GPL(riscv_hw_pte_ad_updating_enabled);
>>>   unsigned long elf_hwcap __read_mostly;
>>> @@ -287,15 +289,74 @@ static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *data,
>> ...
>>> +static int __init riscv_hw_pte_ad_updating_init(void)
>>> +{
>>> +	bool has_svade, has_svadu;
>>> +	int state;
>>> +
>>> +	has_svade = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADE);
>>> +	has_svadu = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
>>> +
>>> +	if (!has_svadu)
>>> +		return 0;
>>> +
>>> +	if (!has_svade) {
>>> +		riscv_set_hw_pte_ad_updating(true);
>>> +		pr_info("riscv: hardware PTE A/D updating enabled\n");
>>> +		return 0;
>>
>> This block is identical to the tail of the function. I'd probably use "goto
>> enable", with an "enable" label below.
> 
> Is this code correct though? On DT systems, !svade && !svadu means we
> don't actually know if it is hardware or software managed, so printing
> that it's hardware managed may not be correct.
> 
> I don't understand the mm code enough to know if arch_has_hw_pte_young()
> returning true is problematic too, but it probably is?

This block is for !svade && svadu (Svadu is present; we didn't return above), so
I think this block and Michael's comment are correct.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
