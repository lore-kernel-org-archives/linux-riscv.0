Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801DEC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 00:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+TKAkAHhf9EIX6dlmMlcVw8MiYm4mKluojTEUMQ6y0=; b=GFaNWsnRaS6CAI
	115TLpyOkW6hLVi+JojLXoQGEqaqWZIe0qLe3duRA/dGHmWjHJwysVjTE5qo6NUjYQDJ3UdVlAYzT
	ag0rUXsfCxrQeKCR/CwjXq/UFZA6FfL30a4rMOi1Q/DAggg5273I5W2Zqvo3wDXf7r44mPrQlXdRA
	m0zd8IC0LqJa+DxhHxhv2E+2BU0/YYlT4Bs4nztiKtlWWOmwSA833ipXjyL8aoXPhuvNMMjxRU8MK
	QXCPLT50MR9mBeGvi/Am95h+uuevs2iCvgvFK1BOplDaRmQxeTuwBIQR76wKGK0s29l6b99+6OSo9
	WuS3TEM6JtnT8QQLPmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnSXm-00000005DuU-44Wg;
	Fri, 22 Mar 2024 00:13:58 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnSXj-00000005Dtr-3qAH
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 00:13:57 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3686abc0dc2so3246215ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 17:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711066434; x=1711671234; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oVj0RTqijXF6fGHo7lvyifktNSlsSBmRQcPYhg8uW8Y=;
        b=P5rDP97Fjx9FJD2J4BB+JtKSq09HQ09jAHVJssU8UU7wiumZ2Ygoh3Wk1LYdSMyiZO
         2rPDX4PjMkMtmPySqCh02LpB1qK3oy363+XFs6/nZYeIYqRg3Gq2HTvJT+xpnr8lCehl
         89MsjtMIelr/jZ5aXkzgnPSWa8+tKc04Dsp/yfNUVxDGEURsZbTQCwn3n5Rdeh0kZbo0
         W5vvpJyLgH/5OhVztXrMF1UvYSruU4t5zp/J4aa1WKJWMS/2wHrYB5KYhdRgkeVzmfrL
         w1IZf/0sijPmvi2Kpzo1kl+C7lE0SjrTWW0IkGUybCR88J+v/WanrHKzmqMK+uMobrM3
         Y7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711066434; x=1711671234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVj0RTqijXF6fGHo7lvyifktNSlsSBmRQcPYhg8uW8Y=;
        b=oNhZYS1pZYOz1ha67z2m7ZIMnqCkuuUSwvFm2ABrt6vSCTBmDYhGpW8mGuEAfUuwch
         PBW2mYRGpgRf7XMKnkllMVfhAzG9VooORFtjm0dFdTvMexev0ExUAdtCKLYkaxMUbFrJ
         wW++ubyc4h1VbjTwyLjakvCZAF3xejLW2omC6oKpZXPuOMlw5jTV/sXpO/UMEGlWXEDB
         8c4t32XqFCxvpdwW/99/NIhOoarXu8gxGS4li8f09ZlU1H2oDYCHIpj0nvgSBryjtq+3
         /yY/EvMz83oOmvI6cMP05/dWhFdgya/Bqc7VDLh9CISWi7/eeE6EPsnze4UlROWfXCkI
         hx/g==
X-Gm-Message-State: AOJu0YwQBq+dHFoJOdkkAjc5dO5+ShsJzY4fxAWJHCtJONSJG0hHzCBT
	OVSqSk2hrdx+3ha4s08l+ZIdldrOLmODGjupRso5EPpslbsj21nL9cF6Fw12vq/0wPQMwrTwcy9
	1
X-Google-Smtp-Source: AGHT+IFKwWGMcmPYu0Ub5wCx2QiMD01tH+85fFGHMfPp5sK/V1U4H3V0F6RY+8M0VE4TG4elEaDvoQ==
X-Received: by 2002:a92:dc83:0:b0:365:29e4:d95d with SMTP id c3-20020a92dc83000000b0036529e4d95dmr966458iln.30.1711066434179;
        Thu, 21 Mar 2024 17:13:54 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.86.189])
        by smtp.gmail.com with ESMTPSA id y18-20020a056638015200b00476f1daad44sm206727jao.54.2024.03.21.17.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 17:13:53 -0700 (PDT)
Message-ID: <d9452ab4-a783-4bcf-ac25-40baa4f31fac@sifive.com>
Date: Thu, 21 Mar 2024 19:13:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RISC-V] [tech-j-ext] [RFC PATCH 5/9] riscv: Split per-CPU and
 per-thread envcfg bits
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 tech-j-ext@lists.risc-v.org, kasan-dev@googlegroups.com,
 Evgenii Stepanov <eugenis@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
 Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
 <20240319215915.832127-6-samuel.holland@sifive.com>
 <CAKC1njSg9-hJo6hibcM9a-=FUmMWyR39QUYqQ1uwiWhpBZQb9A@mail.gmail.com>
 <40ab1ce5-8700-4a63-b182-1e864f6c9225@sifive.com>
 <CAKC1njQYZHbQJ71mapeG1DEw=A+aGx77xsuQGecsNFpoJ=tzGQ@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAKC1njQYZHbQJ71mapeG1DEw=A+aGx77xsuQGecsNFpoJ=tzGQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_171356_013853_914009B9 
X-CRM114-Status: GOOD (  12.61  )
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

On 2024-03-19 11:39 PM, Deepak Gupta wrote:
>>>> --- a/arch/riscv/include/asm/switch_to.h
>>>> +++ b/arch/riscv/include/asm/switch_to.h
>>>> @@ -69,6 +69,17 @@ static __always_inline bool has_fpu(void) { return false; }
>>>>  #define __switch_to_fpu(__prev, __next) do { } while (0)
>>>>  #endif
>>>>
>>>> +static inline void sync_envcfg(struct task_struct *task)
>>>> +{
>>>> +       csr_write(CSR_ENVCFG, this_cpu_read(riscv_cpu_envcfg) | task->thread.envcfg);
>>>> +}
>>>> +
>>>> +static inline void __switch_to_envcfg(struct task_struct *next)
>>>> +{
>>>> +       if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
>>>
>>> I've seen `riscv_cpu_has_extension_unlikely` generating branchy code
>>> even if ALTERNATIVES was turned on.
>>> Can you check disasm on your end as well.  IMHO, `entry.S` is a better
>>> place to pick up *envcfg.
>>
>> The branchiness is sort of expected, since that function is implemented by
>> switching on/off a branch instruction, so the alternate code is necessarily a
>> separate basic block. It's a tradeoff so we don't have to write assembly code
>> for every bit of code that depends on an extension. However, the cost should be
>> somewhat lowered since the branch is unconditional and so entirely predictable.
>>
>> If the branch turns out to be problematic for performance, then we could use
>> ALTERNATIVE directly in sync_envcfg() to NOP out the CSR write.
> 
> Yeah I lean towards using alternatives directly.

One thing to note here: we can't use alternatives directly if the behavior needs
to be different on different harts (i.e. a subset of harts implement the envcfg
CSR). I think we need some policy about which ISA extensions are allowed to be
asymmetric across harts, or else we add too much complexity.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
