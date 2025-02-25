Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA2BC021B8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 18:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scl2+kQlgQP3LyQISDAG6IfjlmUXxK9FHUEoUoujXXw=; b=ElP155H813biB3
	hzM9xYf91Fpz1s3ahP5pEtV8i6QJw4Mn6cjhdZaTYjgpaTqEVhl3GkxI0nS2N7Obbcffidkmhq/yH
	MV52HXSoDVQCAhlxvU3jU0k0YlD8B39jAqcDIOKOYsjFED2YWn6/fKcuIR7sWNHjJvwIAkUFWzBch
	n2U07hS9qaYLMrPr8N1hHKgth9of+MnO16abwU+pSj3iJBwfXsFaLFC5ruBR5tR04ARcv6S742TZo
	4jIvGL6Wi0mCPCmgYusppctg8UZG5S79ovVsOzQgOdncC7q2o7iVnWwFZoZjnd0S5cTjffY7RsqUw
	luoXqQKLOGp0tuZEUwiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzqc-00000000zOd-2804;
	Tue, 25 Feb 2025 18:40:02 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmz7c-00000000lYh-21ZS
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 17:53:34 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2fcff77ff9bso7020331a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 09:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740506011; x=1741110811; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M8ytOcimcOajPMmPbmHJ20XRT2ET7W0PdZC0CAWsNrs=;
        b=esOCSokLwP8XhYEUJWO9mUrXbwFbU+WzdmxJgEq5yjEkFKhKYdh/LVEuaIPdcihH4h
         aZpk/lvS84+bc7N/+SwnlAaEVBKMbZDCmWAQ/NvE9rE24yJWHExXnMgc2SV9/O0CPNhD
         58AFe61nTnJ9ScP19dK63T7RJfo7g21u3wO0X1YDksvKqgWzW5GptmZ6eempIFAslJde
         VCavKHxiu1HdeFdhKCHYbmXylRELDJKq4qJyqV/B0RDoxdntcTAL+V963SlkiGBC6oxC
         1neT6jRaNLH7jlb6nuAZdfPt6ai4LAHx3f6KdvLDJiMm3xHsvdN75mcoqnJ9uaeY4g+v
         0ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740506011; x=1741110811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8ytOcimcOajPMmPbmHJ20XRT2ET7W0PdZC0CAWsNrs=;
        b=YBRRP4D0YgsMI/pfQRqBEXivLe7Yj153Fp7xgtqYA8GlyrkXEaL6Of7GLLl0aRPPnA
         pM5yQfuvzgnPX5/EJAtjLle/SWZM8q5W2NZeFpSCA/BtU85cM6Y935K1GdNxnOcOJCc1
         1cDqr6PP9eL0cLXJ8lU3ZlMvl1U29RfwUjQkgPJFpRd3GtgT61f4zLhcyZQchGfUK8ZP
         Igds/qpchKQ2YjnOCW9UgzQpIGVDFpfpslA4677L6IR9CKkGFin2PLnUbv2ZyjnlNQg5
         USNIY2skIuZtXCv2BY9/3jrBadPJCNdKqBgpXD0zHT9e3dahuFv4gavOT6J0FW0EppKv
         fG1w==
X-Forwarded-Encrypted: i=1; AJvYcCVFuJL8nooYS7isl1m279dAEhwyulaeyQqugXGveQy+lzp4JuBtR1D998N2IjOPzX+C6vQDOB0OA/RNvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmNfkk22SFVMGkBrYc0pU2dHu/L5qOF8ZhUAtXJjeXb56g3PD+
	AkPfmUYLv+G05f3F1Yd34YgzYAb7c48Ew8NC8Cs7MIBGqsAudakfUGNUSt0wbZw=
X-Gm-Gg: ASbGnctqF2+s7itEGQFAu2HJMSZJregRWYeJ6vXeSY8I6E4jVEnJcAbj/76OmnLcBix
	MoOCItSU4mIzrF2URKHXI3V+tkuAkb3SrtHY+UqUAEX58z4iYp9huV9l65iBxDPoK5e18Vhczo6
	NNhSyMqnUBAsR4O/NkeQ9xta5TC66n+Y2Eqd8B5/CwjYTRV6twS7C3Vlu4aHD6fxTl1Ylnkx7N0
	5nDAItNNMwjkPVdGh0ro5ALuZKjotimMYCOgqQyVWoYxQGxtAG4QEZOR3TQL/uxEf9kDjSm1XxB
	Ue1dIePmV9SBNtsR
X-Google-Smtp-Source: AGHT+IGE1vlRW/ZqwQ5Dzm1smcnQLurLLpTK4sP2+b5ghrhOvAR+GUgf0qQALw30DxM3WGJrzHgVQQ==
X-Received: by 2002:a17:90b:54c7:b0:2f5:63a:44f9 with SMTP id 98e67ed59e1d1-2fe68d065e9mr5651684a91.23.1740506011483;
        Tue, 25 Feb 2025 09:53:31 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb10fb43sm8709371a91.35.2025.02.25.09.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:53:30 -0800 (PST)
Date: Tue, 25 Feb 2025 09:53:27 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Oleg Nesterov <oleg@redhat.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: tracing: Fix __write_overflow_field in
 ftrace_partial_regs()
Message-ID: <Z74DlyiSS75MrkqS@ghost>
References: <20250224-fix_ftrace_partial_regs-v1-1-54b906417e86@rivosinc.com>
 <b449aacb-f981-4907-af37-1ca5aea83bb4@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b449aacb-f981-4907-af37-1ca5aea83bb4@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_095332_779019_D41C2B6E 
X-CRM114-Status: GOOD (  21.40  )
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

On Tue, Feb 25, 2025 at 09:36:04AM +0100, Alexandre Ghiti wrote:
> Hi Charlie,
> 
> On 25/02/2025 03:42, Charlie Jenkins wrote:
> > The size of &regs->a0 is unknown, causing the error:
> > 
> > ../include/linux/fortify-string.h:571:25: warning: call to
> > '__write_overflow_field' declared with attribute warning: detected write
> > beyond size of field (1st parameter); maybe use struct_group()?
> > [-Wattribute-warning]
> 
> 
> I can't reproduce this warning with gcc and llvm, even when setting by hand
> -Wattribute-warning when compiling bpf_trace.c (which is the user of
> ftrace_partial_regs()).
> 
> Which toolchain did you use?

You need to have the configs:
CONFIG_BPF_SYSCALL=y
CONFIG_FORTIFY_SOURCE=y
CONFIG_FUNCTION_TRACER=y
CONFIG_FPROBE=y
CONFIG_DYNAMIC_FTRACE=y

I used gcc 14.2.0

- Charlie

> 
> Thanks,
> 
> Alex
> 
> 
> > 
> > Fix this by wrapping the required registers in pt_regs with
> > struct_group() and reference the group when doing the offending
> > memcpy().
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >   arch/riscv/include/asm/ftrace.h |  2 +-
> >   arch/riscv/include/asm/ptrace.h | 18 ++++++++++--------
> >   2 files changed, 11 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> > index c4721ce44ca474654b37b3d51bc0a63d46bc1eff..ec6db1162021fbf4fa48fc87e7984266040aa7d9 100644
> > --- a/arch/riscv/include/asm/ftrace.h
> > +++ b/arch/riscv/include/asm/ftrace.h
> > @@ -207,7 +207,7 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
> >   {
> >   	struct __arch_ftrace_regs *afregs = arch_ftrace_regs(fregs);
> > -	memcpy(&regs->a0, afregs->args, sizeof(afregs->args));
> > +	memcpy(&regs->a_regs, afregs->args, sizeof(afregs->args));
> >   	regs->epc = afregs->epc;
> >   	regs->ra = afregs->ra;
> >   	regs->sp = afregs->sp;
> > diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
> > index b5b0adcc85c18e15c156de11172a5d7f03ada037..2910231977cb71dac3cc42f2dc32590284204057 100644
> > --- a/arch/riscv/include/asm/ptrace.h
> > +++ b/arch/riscv/include/asm/ptrace.h
> > @@ -23,14 +23,16 @@ struct pt_regs {
> >   	unsigned long t2;
> >   	unsigned long s0;
> >   	unsigned long s1;
> > -	unsigned long a0;
> > -	unsigned long a1;
> > -	unsigned long a2;
> > -	unsigned long a3;
> > -	unsigned long a4;
> > -	unsigned long a5;
> > -	unsigned long a6;
> > -	unsigned long a7;
> > +	struct_group(a_regs,
> > +		unsigned long a0;
> > +		unsigned long a1;
> > +		unsigned long a2;
> > +		unsigned long a3;
> > +		unsigned long a4;
> > +		unsigned long a5;
> > +		unsigned long a6;
> > +		unsigned long a7;
> > +	);
> >   	unsigned long s2;
> >   	unsigned long s3;
> >   	unsigned long s4;
> > 
> > ---
> > base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
> > change-id: 20250224-fix_ftrace_partial_regs-eddaf4a7e5ed

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
