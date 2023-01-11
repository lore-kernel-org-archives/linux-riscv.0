Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7417FC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 06:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SX5AcRKIqhfBK1Q/HG+tGETOLXphsBFzvSRUtXAvSnw=; b=faVkx621k2mMKS
	ocmc3wY8C7h7GefwHNURjWgEijcEYfusBC4uVlh9p1JPyqnlY4fQjHZqm2MGRYkfjRVSBByCuU0zp
	hmvQaSB52kuEGN6qmikWg0cmXFb66Jq2LHtgmY8BUQlaQa+U8cLS2mkon/CnQT5586YimKc9nmI80
	XBv+7BBf4Coo1Bg4BhbpATG14xSJkLSqhuXRtkxs11vmGMAPYP8ri7WwhnTqrrgayw8SB5HAZutbK
	0eNz8WuKT3oQKrszl4Mu1bupjElMkCR2iA7j9S4TTeVQoB1+8xEyYFEjaCGDCdkH1W28N8/rV3r3E
	JCvXMYzbc0ojdB0d9j/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFUT7-009qga-Pv; Wed, 11 Jan 2023 06:20:13 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFUT4-009qfw-JR
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 06:20:12 +0000
Received: by mail-pj1-x1034.google.com with SMTP id z4-20020a17090a170400b00226d331390cso16011834pjd.5
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 22:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fywcalk7yz5BAvp56hQZy/QX+1/SrPMih03sNl/Yf74=;
        b=h6+a3uyzJrnnhsIet2BXcTFxftT22DyCw4Sgya1AtoqMN2ORk+awnnRZdneM1fPLXn
         9GxOkn3tOfjBzW58x0j66FPYiiFNS3lrG8nL8El8JCL/UpA/AyRS4H18fUiaFUwaizWh
         bJN3pm6pwPFSCMOLtoefCIFPpDMffF9dqpJj1TpUYVexLY1EK2oR4JDZuzt0q46hIeLn
         bGkmnWVsTioKMy+GAkPL1OxF0sRAuN5UCwdm8qJA1VUVTXfusPOeXE5c3leY4l7Gp/eF
         dQb4uNUU8QHqhYrcTcE4RKOIgUQnl7eV7+UyF9Q5Be2DAWIbsUWpKpy8b3KcxwmfWkbO
         77Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fywcalk7yz5BAvp56hQZy/QX+1/SrPMih03sNl/Yf74=;
        b=JQ0rKnWU9B2kp04VbhV2PErawI7gUVu24vqeQWhwb6eIHnqlEYILTWchW6Tj0Z7wEh
         1RF6yvWC6Uu1f8kqWuwQA0w+ULe+YYXcSw6ZcnV9tLFWSemtmV4ytoFoi2CtlbxzrP/1
         M7yzmNpQzCmS8Sm6jvFSyUgbx6Ln2aib/Q7q8lNTEWuYjr3t+pk/gbvputT27UIXZSEq
         oDWCuoIMR7nnSSKbr22Utsbhej/5RhBv2FKNFUPmgaMJMwyuiWDc9ywvhW9jEmkwrqv4
         iz5ZsLwnCA1DaGE6bV1txAo3gKCbWt0SKx5hC8m4CZ9Sn6qdRsoB/09eFd31OeSPuyrB
         KM/Q==
X-Gm-Message-State: AFqh2kp5D8X8qhmuogPFpHDZi1rAf12R/fccJGPN5PWmb5PM1OrkzzpC
	/8/xfYWpHe8dKjLYnWzo6td4pA==
X-Google-Smtp-Source: AMrXdXsO/simWGOG9rDo1VDsBKthiPIJgDqXVFyG61fw1CTujscbnuwlaPtWEZtIW7T4xLktmarvwA==
X-Received: by 2002:a17:90b:3015:b0:226:c6fa:9843 with SMTP id hg21-20020a17090b301500b00226c6fa9843mr1358227pjb.1.1673418009659;
        Tue, 10 Jan 2023 22:20:09 -0800 (PST)
Received: from ?IPV6:2601:681:8600:13d0::f0a? ([2601:681:8600:13d0::f0a])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a3e4300b002276ba8fb71sm2741230pjm.25.2023.01.10.22.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 22:20:09 -0800 (PST)
Message-ID: <e2a2ef3a-bb5e-0bda-20e5-a2344e7c4cef@ventanamicro.com>
Date: Tue, 10 Jan 2023 23:20:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Auto-enabling V unit and/or use of elf attributes (was Re: Adding
 V-ext regs to signal context w/o expanding kernel struct sigcontext to avoid
 glibc ABI break)
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Vineet Gupta <vineetg@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Vincent Chen <vincent.chen@sifive.com>, Florian Weimer <fweimer@redhat.com>,
 Rich Felker <dalias@libc.org>, Andrew Waterman <andrew@sifive.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu
 <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
 <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com>
 <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
 <a559e7dc-83fa-fac1-5811-95d37c6e662a@rivosinc.com>
 <CAAeLtUCPLD8if+-xikbjD78G=N_bEyMLh3WcZzyJR4Zt2LWz7Q@mail.gmail.com>
 <1f8f1d21-4a19-54fe-8b29-bf9e2a8501d7@rivosinc.com>
 <CALLt3ThickhyW5gX6LNjHXza484Xb5Cg8t7OUYH6hoA3V3GpAg@mail.gmail.com>
 <3a838afe-974b-60bb-a0e5-83e366ec652e@rivosinc.com>
 <CALLt3ThJyH3yihiwq-ZDeP1v5UgQZEsUWNwxOewZBeuocciRJg@mail.gmail.com>
 <b440aeaf-03e6-aa4e-9636-adbf3f841b40@rivosinc.com>
 <3923eeee-e4dc-0911-40bf-84c34aee962d@linaro.org>
 <119da65f-e976-f382-3fe1-1585be738352@ventanamicro.com>
 <8be4d673-f435-429e-9a61-bb49e7820529@linaro.org>
 <6d13e63f-69b3-6e48-b811-bbfcf3ffb3af@ventanamicro.com>
 <CABgGipUAhZNt3gaxEx7mPm20Xw7WNVVppRZ4fxZX-XswA5VG2g@mail.gmail.com>
From: Jeff Law <jlaw@ventanamicro.com>
In-Reply-To: <CABgGipUAhZNt3gaxEx7mPm20Xw7WNVVppRZ4fxZX-XswA5VG2g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_222010_677286_494B4C92 
X-CRM114-Status: GOOD (  17.11  )
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



On 1/10/23 23:00, Andy Chiu wrote:
> On Wed, Jan 11, 2023 at 1:07 PM Jeff Law <jlaw@ventanamicro.com> wrote:
>>
>>
>>
>> On 1/10/23 21:57, Richard Henderson wrote:
>>> On 1/10/23 20:28, Jeff Law wrote:
>>>>
>>>>
>>>> On 1/10/23 18:22, Richard Henderson wrote:
>>>>> On 1/10/23 10:07, Vineet Gupta wrote:
>>>>>> Yes bulk of glibc might not have vector code, but those V ifunc
>>>>>> routines do and IMO this information needs to be recorded somewhere
>>>>>> in the elf. Case in point being the current issue with how to enable
>>>>>> V unit. Community wants a per-process enable, using an explicit
>>>>>> prctl from userspace (since RV doesn't have fault-on-first use
>>>>>> hardware mechanism unlike some of the other arches). But how does
>>>>>> the glibc loader know to invoke prctl. We can't just rely on user
>>>>>> env GLIBC_TUNABLE etc since that might not be accurate. It needs
>>>>>> somethign concrete which IMO can come from elf attributes. If not,
>>>>>> do you have suggestions on how to solve this issue ?
>>>>>
>>>>> Why not just fault on first use to enable?  That's vastly less
>>>>> complicated than trying to plumb anything through elf resulting in a
>>>>> prctl.
>>>> Well, the answer is in Vineet's paragraph -- the hardware apparently
>>>> doesn't have fault-on-first-use which is mighty unfortunate.
>>>
>>> Nonsense -- sstatus.vs stores {off, initial, clean, dirty} state, just
>>> like fpu.
>>> Now treat the vector unit just like fpu lazy migration.
>> Then let's do something sensible.    Manually enabling via prctl seems
>> silly if we have fault on first use.
> Yes, faulting on first use is a viable way of approaching. However, my
> concern is that doing this on a system with libraries having common
> V-optimized routines such as memcpy, memset would essentially trap
> every process to m-mode starting up. This might take more cost than a
> prctl syscall. And if every process on the system wants to be
> benefited from V-optimized ifuncs, then having an additional prctl to
> call at start time seems tedious as well.
>
It's not perfect, but it's workable.  Explicitly turning things on seems 
like madness.  It boils down to having to annotate every binary and DSO 
and also adds complexity to JITs, the dynamic loader and probably all 
kinds of places we haven't thought through yet.

Fault on first use is well understood and has been implemented on many 
architectures through the decades, even with its warts.

jeff

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
