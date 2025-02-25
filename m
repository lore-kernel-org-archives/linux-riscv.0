Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D37BC021B2
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 22:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=E06mbN//0TDGD0UeDr4O4zR6yyY5/zlJACzvnldfWhE=; b=QPnp+IcQ5kigN2PQBVe+06WwOX
	KsLzD1gAJ+VQ+tZXnR1cyIVvVaPEgD1pOCH5Daa2+FbcaZFHggMbLozBFTWc6r8tQiQgCe7OQ4Flh
	yFzOedxD0hTZgVwRIOpqFq4DVOPGO872V+3KCrBoWJAPXz56fzEq/t9gJrM7wWLTSX17UH8KpuUB4
	gD1y/gVb8WoHVBb0FELzN1yCBFY2f5mpW7C8b0lsQmW7pz9K2ouOgz1A5m3vup5tzNP8GK+q17ii3
	LIT6tKo716bpYp+kpYhgzGgdiyl4hrJPUiNpbRpaI1P2cMFTnfgNO1OpdfB2Y8zisI6s1LDOJCyCN
	HQU5zlPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn3pQ-00000001lKN-2LcT;
	Tue, 25 Feb 2025 22:55:04 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn3pO-00000001lJy-1D71
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 22:55:03 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-220e6028214so135331745ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 14:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1740524101; x=1741128901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoxgd0LXqhYyoIs1TcxAsnvLmRYvl51fOK6HZwrhImc=;
        b=kmI528kuemGJDXzBrVdlfQXJfCRRpIlRi53HVBU0/2Vxffe9/exeX3nrXQ78H2s/Jb
         /C/YF42YsJzz54845wSC9sZ3lfCdfNoawLWWJI4Si5yRp1D19nrvVLP236oA3cVE+Wew
         QaZRif5J957W2vD6viIvdP2F3jqW6ASYsxWlZmhKOylMvZyYYf+jnZZennCaG/tDkKMk
         JjmZEvgLRimDkbfpJNjcpA+622ZV5+XuwlFl3/c3PIv5yZj+iywTMoaSvmpI2hvU1qBv
         vwvzI+yWEmd7C6Qc/uZQvt++YjKwGfuH/8ijG6vL4P/MqytugOhEfgguJPKarR0EmoId
         CCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740524101; x=1741128901;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoxgd0LXqhYyoIs1TcxAsnvLmRYvl51fOK6HZwrhImc=;
        b=GYn3iTh+XdR+UnVLJhkx/E7KzRZ9CTfgZAJ39ydui04U4COiNbu1TgnK2uf/+uJ8Cm
         3LkdOthjZUI82hqsBZK/Y+B8/Do2IcmU0NQs4ybaU7ODziCGO9g4ddjJFsUGZbMOgaGu
         pjXjtasAmruc5frYY9K7zK+CO2FHM+Ilwoy4yGqySmrnW1HTzfHe5ENMcIPmBTWQYHYz
         fuIMyXbid9vtZhHHsNUmJhrhDl3h7GNbqVlJv0gF1uRdsSLRlW8B2cxzRH8Fny69DIv+
         vR5qjQu8j206+Gesf1CrXt5oFPv2MX3FmaqED1gSAM3vYct8D3wGBjffWwRAnqtcIb49
         Sxxw==
X-Forwarded-Encrypted: i=1; AJvYcCX4tBDBxlzRTSkXelcxsu7fQKRUSwyKumMHk2O9lDrzIKSG52L2FYhs7x8K4QtDYinHEKgj4eOi+00mxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFy5/s54zusIru+NKZhX+R04zLkvvIIhmGwueFR5oomYrA9rne
	2CB858C2amV2/hqVpz37/58bCVOerulDcKDFnYsqHlhGFym8T/nhtGaXENPVE+k=
X-Gm-Gg: ASbGncviqSXthschE8oP3QRr4uN/eJsfgAYtZPkybfvRtMbwTYRJE9SZJmPpPevAY7f
	AO9KDd7veme2S7hAvstkByuv+AVUSkjz1hAtnGS5/WS2/0oJ0+IUuv2hu9KYGp5qru3A+O0sO3y
	rFyWkVPv/TM7IRltvmJgcwyfgKeLysAPul5ovQhXqKzQYz4Xb33mIuD2Y2edk8B1cnwsL/ewGZ0
	ikBpbOlia5vLZq+IejuhVN4jgB6jOeA/KjkqmOTI7v2iOy8nRKsYdWWZDpqgxv4SLgNEHSPweP3
	vjDXOWyX7tRjxaudvH0=
X-Google-Smtp-Source: AGHT+IHDF0cWJ/SEBMVNAJOxihTtvNcg7f922v9D9w95rEqvhz8RZQiYleayAK1FRV0WuHL7CfLLPw==
X-Received: by 2002:a17:903:986:b0:221:80f8:99cd with SMTP id d9443c01a7336-2219ffb3badmr294881865ad.21.1740524101121;
        Tue, 25 Feb 2025 14:55:01 -0800 (PST)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a092fc9sm19662355ad.126.2025.02.25.14.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:55:00 -0800 (PST)
Date: Tue, 25 Feb 2025 14:55:00 -0800 (PST)
X-Google-Original-Date: Tue, 25 Feb 2025 14:54:59 PST (-0800)
Subject: Re: [PATCH] riscv: tracing: Fix __write_overflow_field in ftrace_partial_regs()
In-Reply-To: <Z74DlyiSS75MrkqS@ghost>
CC: alex@ghiti.fr, rostedt@goodmis.org, mhiramat@kernel.org,
  Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  oleg@redhat.com, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Message-ID: <mhng-2350fde8-5ca3-4770-94d0-26582bdfc0dd@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_145502_598190_A30426B5 
X-CRM114-Status: GOOD (  27.11  )
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

On Tue, 25 Feb 2025 09:53:27 PST (-0800), Charlie Jenkins wrote:
> On Tue, Feb 25, 2025 at 09:36:04AM +0100, Alexandre Ghiti wrote:
>> Hi Charlie,
>>
>> On 25/02/2025 03:42, Charlie Jenkins wrote:
>> > The size of &regs->a0 is unknown, causing the error:
>> >
>> > ../include/linux/fortify-string.h:571:25: warning: call to
>> > '__write_overflow_field' declared with attribute warning: detected write
>> > beyond size of field (1st parameter); maybe use struct_group()?
>> > [-Wattribute-warning]
>>
>>
>> I can't reproduce this warning with gcc and llvm, even when setting by hand
>> -Wattribute-warning when compiling bpf_trace.c (which is the user of
>> ftrace_partial_regs()).
>>
>> Which toolchain did you use?
>
> You need to have the configs:
> CONFIG_BPF_SYSCALL=y
> CONFIG_FORTIFY_SOURCE=y

I don't think I have any FORTIFY_SOURCE runs, unless they're on by 
default behind some other argument.  I'm kind of surprised this is the 
only bug we have, that usually trips up all sorts of stuff.

I'll go add some runs and see...

(I'm also going to just go pick this up, might take a little bit to show 
up.)

Thanks!

> CONFIG_FUNCTION_TRACER=y
> CONFIG_FPROBE=y
> CONFIG_DYNAMIC_FTRACE=y
>
> I used gcc 14.2.0
>
> - Charlie
>
>>
>> Thanks,
>>
>> Alex
>>
>>
>> >
>> > Fix this by wrapping the required registers in pt_regs with
>> > struct_group() and reference the group when doing the offending
>> > memcpy().
>> >
>> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>> > ---
>> >   arch/riscv/include/asm/ftrace.h |  2 +-
>> >   arch/riscv/include/asm/ptrace.h | 18 ++++++++++--------
>> >   2 files changed, 11 insertions(+), 9 deletions(-)
>> >
>> > diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
>> > index c4721ce44ca474654b37b3d51bc0a63d46bc1eff..ec6db1162021fbf4fa48fc87e7984266040aa7d9 100644
>> > --- a/arch/riscv/include/asm/ftrace.h
>> > +++ b/arch/riscv/include/asm/ftrace.h
>> > @@ -207,7 +207,7 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
>> >   {
>> >   	struct __arch_ftrace_regs *afregs = arch_ftrace_regs(fregs);
>> > -	memcpy(&regs->a0, afregs->args, sizeof(afregs->args));
>> > +	memcpy(&regs->a_regs, afregs->args, sizeof(afregs->args));
>> >   	regs->epc = afregs->epc;
>> >   	regs->ra = afregs->ra;
>> >   	regs->sp = afregs->sp;
>> > diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
>> > index b5b0adcc85c18e15c156de11172a5d7f03ada037..2910231977cb71dac3cc42f2dc32590284204057 100644
>> > --- a/arch/riscv/include/asm/ptrace.h
>> > +++ b/arch/riscv/include/asm/ptrace.h
>> > @@ -23,14 +23,16 @@ struct pt_regs {
>> >   	unsigned long t2;
>> >   	unsigned long s0;
>> >   	unsigned long s1;
>> > -	unsigned long a0;
>> > -	unsigned long a1;
>> > -	unsigned long a2;
>> > -	unsigned long a3;
>> > -	unsigned long a4;
>> > -	unsigned long a5;
>> > -	unsigned long a6;
>> > -	unsigned long a7;
>> > +	struct_group(a_regs,
>> > +		unsigned long a0;
>> > +		unsigned long a1;
>> > +		unsigned long a2;
>> > +		unsigned long a3;
>> > +		unsigned long a4;
>> > +		unsigned long a5;
>> > +		unsigned long a6;
>> > +		unsigned long a7;
>> > +	);
>> >   	unsigned long s2;
>> >   	unsigned long s3;
>> >   	unsigned long s4;
>> >
>> > ---
>> > base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
>> > change-id: 20250224-fix_ftrace_partial_regs-eddaf4a7e5ed

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
