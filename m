Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67640C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 22:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yNnGlDvZnEJWIs+yFoxzzhKueslElnDb+IoKIh+kes=; b=2YUDdhjdY7Dk8I
	Kfaqlry8N0/mEow+Kr/v2M+sIvPdei7nsKK8p2djsegKckkhfN1VIMtQq7MT+J/0Yb8YLShQkhp96
	CiriK8/TYxjXB73NRhnvN8HiZn8XaaY82p2ap0gD5mAslQMcCXIJKUZy73kzXIW5Vq6betk336wFZ
	SaizdAbaKpZbXrX/kf9N0s2sStRvXnP2jCE5ocxoEveU5Lr7OYX/5D4/bAcwvgOo5pkFw28lGFMOr
	niloJTFYeNgDo9EcLWyWFRCK0HSLOfYuVhMTNLDHc+WlOucqt9pVMyP13OtSBwsR9qXFFXkjLitMy
	sSIHByeKP7/1YqJ1a0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxZoJ-00000003nNF-0wGn;
	Thu, 18 Apr 2024 22:00:51 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxZoF-00000003nMj-3hgJ
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 22:00:49 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7d5facf3161so50593639f.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 15:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1713477645; x=1714082445; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LPPGE1q9s6cTnAk4kOg+eroFH/OZnnaVpd01j4nY80E=;
        b=KqBV1uVjh+yNUnztFCY6m4AfXZDMj4s0mDcgWfghSqDWujubAZSd67SwS46P48+d2e
         o01mkauyYP3V/XHzlnWdhD5Nt9pbChRo3QNWr/JAPjNoevfazTcGhOWNPVMRbVV+nWYD
         jzlPokU1Qs1bhF6zZrUMvrB9Az7Fxp94Mfkief4vzu/DbYd1uHhYwMhbTpdLu8n8Iy6T
         aJmU7NHSlFVCqGUH03U034aGHl9f4S0/2Xt4KUkMVB7GGJOHfmhCoOj4UFVsjSQNdUvY
         yS3YhROk3CGfCcKMQSdxTNfeuwNU+3mpGCzw8km8D4BGUlQCyL3t6QYyM13jp7kn5ZzS
         IudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713477645; x=1714082445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPPGE1q9s6cTnAk4kOg+eroFH/OZnnaVpd01j4nY80E=;
        b=XwgoF0Pb8j0xD+ky0yFbz+sWh1YoiQa+vWYeXauiYolCGf8EtozAa1cAUPSLly/ig9
         EC5ff4ETAD7jKnGJxptsBDmVnac/0EYJu0SMglYkqliAdLcyLYDWfV9SiWnub/Bfgos+
         Utv+3kmXpjnVemZjmRhByxpcU0X59nAa521XSqupW7IEqZauMcWId7AM4RDcRyUKcM7Y
         eEkVXoPNYqSUASQwJD3hoKgWSDWi9KoHQ0qAs/ajr/YWzva/+LyoGoHc9nwJylsoROTR
         ZqBUOe1r+Cw0HQZ0uLiObGx57aB3Lkmt8foqcntsLrlaVC0h9NNxahlgYLDRjigwFhwt
         lDlA==
X-Forwarded-Encrypted: i=1; AJvYcCUhwWbTPCSxJazuhrYs1tsbfpFDNcQnfEwiPYM1QxRhe0T5RWorE3KQirEM0NdjHoZEiB8pRpRykPy2bVzabNkG0q5Aiqm4bvBpMWztK1Bp
X-Gm-Message-State: AOJu0YzEMGtaUcGzlkCT2sRHkayaDRbUwr9X7gx+3ME6QIH+lC/Nk2Sf
	cbHiIpR5LQTODOCLJFcMrJYbNSukNg1Uyh0S//GwolF/Sm2oDq6RKxQ/mxU58C4=
X-Google-Smtp-Source: AGHT+IF4iUMS3eOsGMRU754zue/Q9W8EqUFJSSWAR8r9SOKI8KHJgGqick2Fy8LHDjkEuBIaHtDFRg==
X-Received: by 2002:a6b:4402:0:b0:7d5:f121:dee7 with SMTP id r2-20020a6b4402000000b007d5f121dee7mr498314ioa.19.1713477645449;
        Thu, 18 Apr 2024 15:00:45 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.197])
        by smtp.gmail.com with ESMTPSA id f2-20020a056638168200b00482a6d6ad31sm650286jat.92.2024.04.18.15.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 15:00:45 -0700 (PDT)
Message-ID: <33de5d8f-5ccb-4dd0-9915-720e6f800560@sifive.com>
Date: Thu, 18 Apr 2024 17:00:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] riscv: process: Introduce idle thread using Zawrs
 extension
To: Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>
Cc: Xu Lu <luxu.kernel@bytedance.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, andy.chiu@sifive.com,
 guoren@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, lihangjing@bytedance.com,
 dengliang.1214@bytedance.com, xieyongji@bytedance.com,
 chaiwen.cc@bytedance.com
References: <20240418114942.52770-1-luxu.kernel@bytedance.com>
 <20240418114942.52770-2-luxu.kernel@bytedance.com>
 <20240418-dove-deferral-2b01100e13ca@spud>
 <20240418-d9f305770dc71c2687a6e84b@orel>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240418-d9f305770dc71c2687a6e84b@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_150048_094179_69D8069E 
X-CRM114-Status: GOOD (  20.78  )
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

Hi Drew,

On 2024-04-18 2:10 PM, Andrew Jones wrote:
> On Thu, Apr 18, 2024 at 04:05:55PM +0100, Conor Dooley wrote:
>> + Drew,
>>
>> On Thu, Apr 18, 2024 at 07:49:41PM +0800, Xu Lu wrote:
>>> The Zawrs extension introduces a new instruction WRS.NTO, which will
>>> register a reservation set and causes the hart to temporarily stall
>>> execution in a low-power state until a store occurs to the reservation
>>> set or an interrupt is observed.
>>>
>>> This commit implements new version of idle thread for RISC-V via Zawrs
>>> extension.
>>>
>>> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
>>> Reviewed-by: Hangjing Li <lihangjing@bytedance.com>
>>> Reviewed-by: Liang Deng <dengliang.1214@bytedance.com>
>>> Reviewed-by: Wen Chai <chaiwen.cc@bytedance.com>
>>> ---
>>>  arch/riscv/Kconfig                 | 24 +++++++++++++++++
>>>  arch/riscv/include/asm/cpuidle.h   | 11 +-------
>>>  arch/riscv/include/asm/hwcap.h     |  1 +
>>>  arch/riscv/include/asm/processor.h | 17 +++++++++++++
>>>  arch/riscv/kernel/cpu.c            |  5 ++++
>>>  arch/riscv/kernel/cpufeature.c     |  1 +
>>>  arch/riscv/kernel/process.c        | 41 +++++++++++++++++++++++++++++-
>>>  7 files changed, 89 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>> index be09c8836d56..a0d344e9803f 100644
>>> --- a/arch/riscv/Kconfig
>>> +++ b/arch/riscv/Kconfig
>>> @@ -19,6 +19,7 @@ config RISCV
>>>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>>>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>>>  	select ARCH_HAS_BINFMT_FLAT
>>> +	select ARCH_HAS_CPU_FINALIZE_INIT
>>>  	select ARCH_HAS_CURRENT_STACK_POINTER
>>>  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
>>>  	select ARCH_HAS_DEBUG_VM_PGTABLE
>>> @@ -525,6 +526,20 @@ config RISCV_ISA_SVPBMT
>>>  
>>>  	   If you don't know what to do here, say Y.
>>>  
>>> +config RISCV_ISA_ZAWRS
>>> +	bool "Zawrs extension support for wait-on-reservation-set instructions"
>>> +	depends on RISCV_ALTERNATIVE
>>> +	default y
>>> +	help
>>> +	   Adds support to dynamically detect the presence of the Zawrs
>>> +	   extension and enable its usage.
>>
>> Drew, could you, in your update, use the wording:
>> 	   Add support for enabling optimisations in the kernel when the
>> 	   Zawrs extension is detected at boot.
> 
> How about
> 
>   The Zawrs extension defines a pair of instructions to be used in
>   polling loops which allow a hart to enter a low-power state or to
>   trap to the hypervisor while waiting on a store to a memory location.
>   Enable the use of these instructions when the Zawrs extension is

                                        ^ in the kernel

I believe "in the kernel" was an important part of the clarification that these
Kconfig options do not affect whether userspace can use these instructions.

Regards,
Samuel

>   detected at boot.
> 
> Thanks,
> drew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
