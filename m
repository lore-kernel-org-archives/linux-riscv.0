Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948A4C54798
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 19:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekdX6en5tXjS5QQGBI1NY9mVmqole8cCDN8/hS3bXIo=; b=wV/uFQhvyx7SpS
	DhKkcbj3inkHdGCTq/LWTpgBcWKTadGDYp7T/seMl5y+OBIMTTq+SAQuakg/UUkBClyNpy3f3z5jy
	+ATfFlsezFucmVd/0Is8Gin4LiFzZug6YIiucIokscgWrvCKGrg8EdrLA3IVmuF2InMUF+MxZXgPm
	qATnkVTiOp0oiSE13EHms+X98sVHmaGLbthfOgMFvBtpwJ2f/y0Q1oA/Khmwoece2EEwb+gwnKqJi
	3QSjjqNVY/dim7WhDER/EU73GEwY3lyeBjs4bTwcR6BKBpNryA3CZzvg2g1R8goOYmqz8RyRPWV1j
	vpFd+/y+Km63dXw7WhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf2zo-00000006axs-3ZQz;
	Tue, 27 Feb 2024 19:20:08 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf2zm-00000006awt-08Uz
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 19:20:07 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e55afcf513so93305b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 11:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709061605; x=1709666405; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LjU6LlOMoMfkxYT5TjTMLLN7YZEywYOA9lg639yTU1E=;
        b=WtVF93gYMorOr1xcp5J9QJ4lebNUo9DNIwPeQxzn74Louu8dKeBizrZ10Yuow0KY2L
         ghmyEuWEov3yb1ZrMW9gALDLPbJNoXQnuSFZP9FyoiJPpP+SI4iHlqS3bK3OqxMA+hev
         BVBSWqYzkndvhhQDnFzBqPgjxEf5TFyfD/ZNh0voCfaqAKK+2cjpcSPKqK0/JarQKSWD
         S28B7VsFzKL6HavSZxYukRHQkBIA1eBz0lJvVkwhUIlLKSGKndZAzU62meojDP1tXEu9
         3+DV+uCQdDjihOXFSM01oMKau/bJBFW6hVrG/wf8N7AshYJ7bLcfXYpGQsJsKL1PVqPt
         rh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709061605; x=1709666405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjU6LlOMoMfkxYT5TjTMLLN7YZEywYOA9lg639yTU1E=;
        b=gzhc0QGnGQR5s+8u8bop58tFAH/+8Ra1VlUdnudc+u/X4PKkiAEmriasfWFgbUUbu+
         rZG/2/WHuRD0hRpXN7AQm4KwS/qzwG1lM4e8FhtxChnmXUNNg3vi01Uxh03MrXV6w1nv
         rZtnEN5nharCDQRGkuE6rSNQim5dqw1NDpbthb9BSdJenittTd0op8ZhuCw4+s1d6u3Y
         lp77/rYFIEF/ar/fzSyAOMHqVaixEQSoUaJzdbvtnPvUHm6UbshtuNJpnfhUzCrgpUBv
         rJKka7ksg0AZEuMwwrXbEdtaJy/zlFFcLc81QWRupo+Avr+kAjfCZ/2K6a2R/hQQhsdB
         ZWZw==
X-Forwarded-Encrypted: i=1; AJvYcCVTY1dJMe37tqydcA5CZZAbLLVUcIfgtLLmSGBgV+RpH/PnIm6IummROBMEngjY3G0rtEnMbNPn71ez9O+gwDtiykVI92Kw5NYtfFbG2U5R
X-Gm-Message-State: AOJu0Yw2UsVKvSjqjZFv1iWQCg07Z0bZ0RsAcx9dmakOYsaDr72SjhFH
	uBSFUM+lwwPrTHKcp/XA7p18xlVnQODIRgzIIg1QnK1KWO6mo0Mf0sqP4fOo9m0=
X-Google-Smtp-Source: AGHT+IGTsFO5Y+MUw+Dr+fwRnhGBCvict5u69UQFPCgZkAlJCy5uDoFE3U+pMRfAan3Q8Hi9tDNlUw==
X-Received: by 2002:a05:6a20:d706:b0:1a0:f7d0:e652 with SMTP id iz6-20020a056a20d70600b001a0f7d0e652mr3323640pzb.49.1709061605039;
        Tue, 27 Feb 2024 11:20:05 -0800 (PST)
Received: from ghost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id k25-20020a635619000000b005bdbe9a597fsm6128331pgb.57.2024.02.27.11.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 11:20:04 -0800 (PST)
Date: Tue, 27 Feb 2024 11:20:02 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>, Evan Green <evan@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Subject: Re: [PATCH v4 2/2] riscv: Set unalignment speed at compile time
Message-ID: <Zd414nBtjHcsYWnL@ghost>
References: <20240216-disable_misaligned_probe_config-v4-0-dc01e581c0ac@rivosinc.com>
 <20240216-disable_misaligned_probe_config-v4-2-dc01e581c0ac@rivosinc.com>
 <20240227-condone-impeach-9469dffc6b47@wendy>
 <Zd4nMa+x28omuhiF@ghost>
 <20240227-citable-scanning-1fd48c96b758@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240227-citable-scanning-1fd48c96b758@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_112006_097085_FE2F8890 
X-CRM114-Status: GOOD (  49.26  )
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

On Tue, Feb 27, 2024 at 06:48:54PM +0000, Conor Dooley wrote:
> On Tue, Feb 27, 2024 at 10:17:21AM -0800, Charlie Jenkins wrote:
> > On Tue, Feb 27, 2024 at 11:39:25AM +0000, Conor Dooley wrote:
> > > On Fri, Feb 16, 2024 at 12:33:19PM -0800, Charlie Jenkins wrote:
> 
> > > > +config RISCV_EMULATED_UNALIGNED_ACCESS
> > > > +	bool "Assume the CPU expects emulated unaligned memory accesses"
> > > > +	depends on NONPORTABLE
> > > 
> > > This is portable too, right?
> > 
> > I guess so? I think I would prefer to have the probing being the only
> > portable option.
> 
> I dunno, I think there could be value to someone in always emulating
> this in the kernel and I don't think that should relegate them to the
> naughty step, given it can work everywhere.

Alright, I will remove the nonportable.

> 
> 
> > > > +config RISCV_SLOW_UNALIGNED_ACCESS
> > > > +	bool "Assume the CPU supports slow unaligned memory accesses"
> > > > +	depends on NONPORTABLE
> > > > +	help
> > > > +	  Assume that the CPU supports slow unaligned memory accesses. When
> > > > +	  enabled, this option improves the performance of the kernel on such
> > > > +	  CPUs.
> > > 
> > > Does it? Are you sure that generating unaligned accesses on systems
> > > where they are slow is a performance increase?
> > > That said, I don't really see this option actually doing anything other
> > > than setting the value for hwprobe, so I don't actually know what the
> > > effect of this option actually is on the kernel's performance.
> > > 
> > > Generally I would like to suggest a change from "CPU" to "system" here,
> > > since the slow cases that exist are mostly because the unaligned access
> > > is actually emulated in firmware.
> > 
> > It would be ideal if "emulated" was used for any case of emulated
> > accesses (firmware or in the kernel).  Doing emulated accesses will be
> > orders of magnitude slower than a processor that "slowly" handles the
> > accesses.
> > 
> > So even if the processor performs a "slow" access, it could still be
> > beneficial for the kernel to do the misaligned access rather than manual
> > do the alignment.
> 
> Right. But, at least from a probing perspective, SLOW is what gets
> selected when firmware emulates the unaligned access so to userspace
> seeing slow means that the performance could be horrifically bad:
> 
> |     rzfive:
> |         cpu0: Ratio of byte access time to unaligned word access is
> | 1.05, unaligned accesses are fast
> | 
> |     icicle:
> | 
> |         cpu1: Ratio of byte access time to unaligned word access is
> | 0.00, unaligned accesses are slow
> |         cpu2: Ratio of byte access time to unaligned word access is
> | 0.00, unaligned accesses are slow
> |         cpu3: Ratio of byte access time to unaligned word access is
> | 0.00, unaligned accesses are slow
> | 
> |         cpu0: Ratio of byte access time to unaligned word access is
> | 0.00, unaligned accesses are slow
> | 
> |     k210:
> | 
> |         cpu1: Ratio of byte access time to unaligned word access is
> | 0.02, unaligned accesses are slow
> |         cpu0: Ratio of byte access time to unaligned word access is
> | 0.02, unaligned accesses are slow
> | 
> |     starlight:
> | 
> |         cpu1: Ratio of byte access time to unaligned word access is
> | 0.01, unaligned accesses are slow
> |         cpu0: Ratio of byte access time to unaligned word access is
> | 0.02, unaligned accesses are slow
> | 
> |     vexriscv/orangecrab:
> | 
> |         cpu0: Ratio of byte access time to unaligned word access is
> | 0.00, unaligned accesses are slow
>  https://lore.kernel.org/all/CAMuHMdVtXGjP8VFMiv-7OMFz1XvfU1cz=Fw4jL3fcp4wO1etzQ@mail.gmail.com/

If the accesses are horrifically slow then maybe they should be flagged
as emulated rather than slow by the probe.

> 
> > Currently there is no place that takes into account this "slow" option
> > but I wanted to leave it open for future optimizations.
> 
> I don't think you can really do much optimisation if you detect that it
> is slow, and since this option is analogous to detecting slow I dunno if
> you can do anything here either? This option really just seems to me to
> mean "don't do any optimisations for unaligned being fast but also don't
> emulate it in the kernel".

I am fine with that being the meaning of this option. However, on a
system that has misaligned accesses that are twice as slow as correctly
aligned accesses, the misaligned accesses would reasonably be selected
as "slow". However, something like the checksum functions would still
probably want to do the misaligned accesses because performing the
alignment would be even slower. This is all hypothetical and not a
"real" use case so maybe I am optimizing where no optimization is
needed.

> 
> > > > However, the kernel will run much more slowly, or will not be
> > > > +	  able to run at all, on CPUs that do not support unaligned memory
> > > > +	  accesses.
> > > > +
> > > >  config RISCV_EFFICIENT_UNALIGNED_ACCESS
> > > >  	bool "Assume the CPU supports fast unaligned memory accesses"
> > > >  	depends on NONPORTABLE
> > > >  	select DCACHE_WORD_ACCESS if MMU
> > > >  	select HAVE_EFFICIENT_UNALIGNED_ACCESS
> > > >  	help
> > > > -	  Say Y here if you want the kernel to assume that the CPU supports
> > > > -	  efficient unaligned memory accesses.  When enabled, this option
> > > > -	  improves the performance of the kernel on such CPUs.  However, the
> > > > -	  kernel will run much more slowly, or will not be able to run at all,
> > > > -	  on CPUs that do not support efficient unaligned memory accesses.
> > > > +	  Assume that the CPU supports fast unaligned memory accesses. When
> > > > +	  enabled, this option improves the performance of the kernel on such
> > > > +	  CPUs.  However, the kernel will run much more slowly, or will not be
> > > > +	  able to run at all, on CPUs that do not support efficient unaligned
> > > > +	  memory accesses.
> > > > +
> > > > +config RISCV_UNSUPPORTED_UNALIGNED_ACCESS
> > > 
> > > This option needs to be removed. The uabi states that unaligned access
> > > is supported in userspace, if the cpu or firmware does not implement
> > > unaligned access then the kernel must emulate it.
> > 
> > Should it removed from hwprobe as well then?
> 
> No, I actually suggested that it be documented etc. Originally
> "UNSUPPORTED" was "UNKNOWN" and nothing more than the default value but
> I suggested that it be documented since that would allow a system that
> did not have the same uabi problem to use all the same defines.
> Technically it is possible for unaligned access to be unsupported, if
> you have a kernel that does not have the emulator but does have the
> hwprobe stuff supported. I think there was about a 6 month period where
> this was the case, so combine that with firmware that does not do the
> emulation and unaligned accesses are unsupported.

Sounds great, will remove :)

- Charlie

> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
