Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E07C48295
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 23:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wWiIzFvCsLPQDuLRPi2ATlRMc/wZb9ZWrRmI+ksPlE=; b=40Pw8RSNdKEo7C
	r2PwOlye5pf+9Zwg/RoB1gPz0UmsoTu9IzmIAYeZRn/uo+s9F5I00yRoGBRTxx2nypt0P2LbdPw8M
	X831G9qDE+3sFwkoOKHff3I6I25aCri4mXLeWVcFkQn/VbBrClfU37CWX7E+2n6tJGiltRRP83VCq
	tQoc0/rcU4LM+Dqxer21cvp4Qp3bf/CuQSbZ0oB1t4e6kgrfDVfA/aTDfZ5RvZ5CHzY4flfrrZ9fM
	CNdwuFj2hcaj/9rdiKAC/0OJdY6rVFwx9fqjDh7eH2Xowevi4hq2BQI/VlXjRDtoFr+yku3wOYxD9
	CdLrM7f2eSzt8ydfIjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW2j4-0000000Dldk-1kBf;
	Fri, 02 Feb 2024 23:13:38 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW2j2-0000000Dld9-0MDR
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 23:13:37 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so2195144a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 15:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706915614; x=1707520414; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2TsmrtpZilFHjgl5uRHHuRHDPg55n9buxc3ptU+YVsk=;
        b=RpsVCK3qs0FZX3kwqpReGeT5davtLa9WovJnpAqlJ0jT7ECM2CY1iwRu+OnT9HfFCR
         HwriOAuaw/70ILbpbH9fZ2GzqG9MXVyfuIZtgWERhtgBsb6xGLhTO954diKZoZlJTYjb
         rzSeENUp2RCIY5ohu4x6GgR9r8qVRhOonkPapp9umv5WaPPFazOiRyOQ1UEn08GMvA2b
         8VBSVtQVD52GLLMyJvuINcAHuEpcVdzcLiZzbWAioSsFeoTteXQB0kwAF2LUwPrNEzxx
         aIjvn1oyKzZXkzEl74ZiiKgg/F269I3eqaJ7Z/xw5o/NfYVECaqzINFVkXD5z8fxXe6e
         hfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706915614; x=1707520414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TsmrtpZilFHjgl5uRHHuRHDPg55n9buxc3ptU+YVsk=;
        b=Tq2tW60CB83E6DAW2AfbJHpCYsMzxs6h/ofLSu6CM5e3pPN1BpcPJQAon93SxcC846
         /4iLGtiNv2mfdhhXIXuCYoENPsSKKz/9gvRJPCGxyJPCyjTEoSsinoUCPgiXIZpS1Uwv
         xL6DMSRFFyZOlh0LnpDvrCK+cOgN3cCnzedbi8HlR8BFCl8dH0NBbwf2jiavOXvF96sN
         D5IuMHXXhndui39YS4ifZNonc8+Ch+aTCVKbZJP5c3ia/zSIsr9wO4Gk4c1ICy3Nc3dS
         rhTswCUlKozl2DD3UmDmpwC+hnwTheANTnE+6QH/9bTtS5N8WEyqCql4aX0vj7F+r6mG
         4/ow==
X-Gm-Message-State: AOJu0YyJ6GvuGA/UuOWyGiZKlDoojKZ2lgOkaTJC9tCyKL5UTlpXkfkg
	PL0Qd2Q18/+66InDcoiA/w0YhOXuP0A4lItxLRHrv9iNNgLbEEw7p6tPZA+uodUc77+QfmWSZdr
	Af3Q=
X-Google-Smtp-Source: AGHT+IH8nwiq4NK5BqTN1VawRr1fSln7uMlRP6FsI8/AgF5/rnSGgmpgRr29akVnyYbZ/pdsMqXwXA==
X-Received: by 2002:a17:903:248:b0:1d9:657c:2769 with SMTP id j8-20020a170903024800b001d9657c2769mr5780377plh.19.1706915614379;
        Fri, 02 Feb 2024 15:13:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU+SGgqwEfx19PBs8fHvAMKLSdqMYN36KZd3TpRH+cEFO4JT9WvVgr1NS9UwGhtPQRRDToWcP66E+L9gqzeNj3KoooChAVA/doSfKB1LmUp9aSZkRa0yeWvwmQEiHMpjOxQnWzZnzLV0ehGjfsGmN3us7dxEtEZaRiUyqcsBTjQUoBjfocy2+YmjPRPrEuBtrU7D87vVFr+36JhiI93fkl5m4PRrkRWFoD9r4GTg9AZze5L3YyvoHZbw8JHa59g3lDkbuf470vKVEk0dUpkuaFx+XtWtg==
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902ef0500b001d8ee46170dsm2139216plx.84.2024.02.02.15.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 15:13:33 -0800 (PST)
Date: Fri, 2 Feb 2024 15:13:31 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: Disable misaligned access probe when
 CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
Message-ID: <Zb13G6ESgxCa4vhG@ghost>
References: <20240201-disable_misaligned_probe_config-v2-0-77c368bed7b2@rivosinc.com>
 <20240201-disable_misaligned_probe_config-v2-2-77c368bed7b2@rivosinc.com>
 <20240202230101.GB2055@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240202230101.GB2055@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_151336_148146_8E2B5080 
X-CRM114-Status: GOOD (  15.02  )
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

On Fri, Feb 02, 2024 at 03:01:01PM -0800, Eric Biggers wrote:
> On Thu, Feb 01, 2024 at 03:30:46PM -0800, Charlie Jenkins wrote:
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > index eb3ac304fc42..3a29d8e30e05 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -51,6 +51,7 @@ static inline bool check_unaligned_access_emulated(int cpu)
> >  static inline void unaligned_emulation_finish(void) {}
> >  #endif
> >  
> > +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> 
> #ifdef..#else..#endif is more readable than #ifndef..#else..#endif.
> 
> > diff --git a/arch/riscv/include/asm/misaligned_access_speed.h b/arch/riscv/include/asm/misaligned_access_speed.h
> > new file mode 100644
> > index 000000000000..81df2aa6fa6b
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/misaligned_access_speed.h
> 
> This new header file isn't included from anywhere.
> 

I thought I deleted that...

> > diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> > index f71910718053..8be7f17da9ab 100644
> > --- a/arch/riscv/kernel/Makefile
> > +++ b/arch/riscv/kernel/Makefile
> > @@ -62,6 +62,9 @@ obj-y	+= tests/
> >  obj-$(CONFIG_MMU) += vdso.o vdso/
> >  
> >  obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
> > +ifneq ($(RISCV_EFFICIENT_UNALIGNED_ACCESS), y)
> > +obj-y	+= misaligned_access_speed.o
> > +endif
> 
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> 
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> > index a7c56b41efd2..3f1a6edfdb08 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -149,6 +149,7 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
> >  
> >  static u64 hwprobe_misaligned(const struct cpumask *cpus)
> >  {
> > +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> >  	int cpu;
> >  	u64 perf = -1ULL;
> >  
> > @@ -168,6 +169,9 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
> >  		return RISCV_HWPROBE_MISALIGNED_UNKNOWN;
> >  
> >  	return perf;
> > +#else
> > +	return RISCV_HWPROBE_MISALIGNED_FAST;
> > +#endif
> 
> #ifdef..#else..#endif is more readable than #ifndef..#else..#endif.
> 
> - Eric

Thanks for pointing these out, I will send a v3.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
