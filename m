Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CF8C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 05:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iToDLuv/vCRAoDZXnXqqmrysZvSkoIf+v+2BQeJfCvk=; b=jIDhQxws5wBqmsJUj6H3634jZP
	DlW0V9vcswEzvTwUqPJgMIovVqBwqamhmEj4KZWgaViHsYJQQOi3AMb432MBMRaTeDv1uD9V2W5KT
	AzgdwFvk824wMEXoOtXNlJFz+hRM1SQ9/igUOxjhFWIRagWcgJIVo2S0YTR4tJb6JPflVURs2x+2N
	T70jhO3ho+LTe6Rzt2qoRlFWSBhp0s/f7/6TQULfpS4slE0peN1Wkc97pI/Evs5fZC7tKcaZJePIR
	XHipQf3d7DM3+RB2SUlhvp5ULYB2MK/kbc/QFragvTaRKlMWh18BmU9607KZuD9e81SLd9Z6OZZ6r
	6GLT0xqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxLeH-004BOF-R9; Tue, 22 Nov 2022 05:16:45 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxLeE-004BJk-3L
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 05:16:44 +0000
Received: by mail-pl1-x631.google.com with SMTP id j12so12577443plj.5
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 21:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmJIC+NHaysdpOEUXMvyd23U3/2WSJwb31FRzrLQVX0=;
        b=bcUXEwRu+ZcLl22BLqCnDSOGUUqIe/cCfHQMrJM6MdKkmrVCu6JmujvqgdD15sPzSV
         ZQIY3PFhPdz8PJq3wCNQlDCxRnJ0WytsLixFmab0P+E9Mr38+R3gOK9lAQ+dbs0UfCtX
         wqmX5eA89wWEz7bwfhU7FNt5i5SchgN8T770Oc/6f2WLOOKUgZJf+fQcoPx1iaLw8/U9
         YrUBN2mOGu8AhVWRSWIGYy+kdsgpfutmDd6qk8oAbe+NhiSmQOAula6Q6do37ytN2G0J
         RWcougQ/vQz6xoJGDHltLmGJuRjCFOe5Ja1hNK3x1DXutCEbLXcXp3T6GkhC7JRgTEF3
         hZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmJIC+NHaysdpOEUXMvyd23U3/2WSJwb31FRzrLQVX0=;
        b=wAwzasm9KRBsbZ0/uMcfZXG8LdaowFqTsGn/LcwjVzlguuX+2EvdRytvbLv75qsnDP
         EL4YX6KfUvYpc+x7XNHzFTWGbgldNqNRd/BR9zC1ENyyYZjnfC0I5Y3IlDY2gK2YHeuO
         WOBjnVKSi45c7lNrXRG2RhJ3OjoP6r4UmxJxtuadMjFlMCok7ybDDUmP8E4vTqhOAiTQ
         VPHSKO6dNhJunsWP5eHDIqj+vBVv+CVDQTRVYjbVNxz1iG3Jdcyas2r8u/65476hp1Of
         ibwrm3rlKQobAB68bdY/DMnzqBNOylugnNGzTiTvThTMoH9oo3NvDxv3EaqGi1/O/hpo
         /TIw==
X-Gm-Message-State: ANoB5pkD5G2TwCOHR0MWcLFPnvI6/orHfNfdDig7Cbs2qDxVwhPhzRRE
	rODVsK19Qp+j6MC5CNkf17cThQ==
X-Google-Smtp-Source: AA0mqf7H5Kg9b0kRSpYfvU5gCu0yzDPTQ7DMorg1/QXLCCiB1FPHV3Oj4hj442qtY5yXZAiC/GmxAQ==
X-Received: by 2002:a17:903:204b:b0:180:a0e6:f81b with SMTP id q11-20020a170903204b00b00180a0e6f81bmr2737567pla.78.1669094200710;
        Mon, 21 Nov 2022 21:16:40 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id y29-20020aa79e1d000000b0056b6a22d6c9sm9594943pfq.212.2022.11.21.21.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 21:16:40 -0800 (PST)
Date: Mon, 21 Nov 2022 21:16:40 -0800 (PST)
X-Google-Original-Date: Mon, 21 Nov 2022 21:16:38 PST (-0800)
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
In-Reply-To: <CAAhSdy0Fs9ZVoRgtz92RgLnFPvgwUzCP_KpK9SCOiVsA-t3p3Q@mail.gmail.com>
CC: Conor Dooley <conor@kernel.org>, rafael@kernel.org, daniel.lezcano@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-pm@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux@rivosinc.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: anup@brainfault.org
Message-ID: <mhng-3f44cc1f-7305-41c5-a1cf-dfed096bd364@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_211642_388886_4824F063 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 21 Nov 2022 19:45:07 PST (-0800), anup@brainfault.org wrote:
> On Tue, Nov 22, 2022 at 2:27 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> As per [1], whether or not the core can wake up from non-retentive
>> suspend is a platform-specific detail.  We don't have any way to encode
>> that, so just stop using them until we've sorted that out.
>>
>> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/issues/98#issuecomment-1288564687
>> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> This is just unnecessary maintenance churn and it's not the
> right way to go. Better to fix this the right way instead of having
> a temporary fix.
>
> I had already sent-out a patch series 5 months back to describe
> this in DT:
> https://lore.kernel.org/lkml/20220727114302.302201-1-apatel@ventanamicro.com/
>
> No one has commented/suggested anything (except Samuel
> Holland and Sudeep Holla).

I see some comments from Krzysztof here 
<https://lore.kernel.org/lkml/7a0477a0-9f0f-87d6-4070-30321745f4cc@linaro.org/> 
as well.  Looks like everyone is pointing out that having our CPU nodes 
encode timers is a bad idea, my guess is that they're probably right.

> Please review this series. I can quickly address comments to
> make this available for Linux-6.2. Until this series is merged,
> the affected platforms can simply remove non-retentive suspend
> states from their DT.

That leaves us with a dependency between kernel versions and DT 
bindings: kernels with the current driver will result in broken systems 
with the non-retentive suspend states in the DT they boot with when 
those states can't wake up the CPU.

> With all due respect, NACK to this patch from my side.
>
> Regards,
> Anup
>
>>
>> ---
>>
>> This should allow us to revert 232ccac1bd9b ("clocksource/drivers/riscv:
>> Events are stopped during CPU suspend"), which fixes suspend on the D1
>> but breaks timers everywhere.
>> ---
>>  drivers/cpuidle/cpuidle-riscv-sbi.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
>> index 05fe2902df9a..9d1063a54495 100644
>> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
>> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
>> @@ -214,6 +214,17 @@ static bool sbi_suspend_state_is_valid(u32 state)
>>         if (state > SBI_HSM_SUSPEND_NON_RET_DEFAULT &&
>>             state < SBI_HSM_SUSPEND_NON_RET_PLATFORM)
>>                 return false;
>> +
>> +       /*
>> +        * Whether or not RISC-V systems deliver interrupts to harts in a
>> +        * non-retentive suspend state is a platform-specific detail.  This can
>> +        * leave the hart unable to wake up, so just mark these states as
>> +        * unsupported until we have a mechanism to expose these
>> +        * platform-specific details to Linux.
>> +        */
>> +       if (state & SBI_HSM_SUSP_NON_RET_BIT)
>> +               return false;
>> +
>>         return true;
>>  }
>>
>> --
>> 2.38.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
