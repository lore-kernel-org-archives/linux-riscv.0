Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4327C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 18:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLaq8xhhKdYOuVVHLsUTkHzWx2o60pY0oeFEOYSMmwA=; b=GPb0tF4ChTKtmI
	cTMDlz4RE3x/h13++lMT/sXbnjwHVxF9YDRv1B/86T9ueyVlMJnrJldMkjbrqCdNcG2euVQKar037
	HHUgpz1BjfYuXNjHpBUaXwd+D6V3hE2qcxBAmtspM8vW9TxYGqii2/cJWxf/ERHALAtsmM8EKB8Zi
	KAEdXMCyCQaiiW6yz4eu3p1Qv8HEtCyEygWuLzpchi5nypS6SI1QYdoV4eiJVCr+BXJwqiYscuCzn
	hjeqxGzBwakf5EHKqVmLoBMYRjBmwq0uC3OrOXyrzefMlD0MEp/ivz8MimRFB+VvOxf47saYYqMWo
	pzEGfSJYkjI53vem9hfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rflHc-0000000EkkY-0UdM;
	Thu, 29 Feb 2024 18:37:28 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rflHY-0000000Ekk3-3yI3
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 18:37:26 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-29aa91e173dso678716a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 10:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709231843; x=1709836643; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3onkurgGwZnEhJcVtKriZJa3VO4hJPZAGQWDNhD7hV4=;
        b=J6P28deX2Jm5H3R8hMrYglpCC/q/iEJxTVhLFecAjS7jtW0JFUw12HRyL/+5X+zDgH
         muQJfQWKDA+ablm2s7mkSesS3V22+XpsebnIo6GJksgxX03l2xE96JvaUreukeHmZ25d
         5NidoE1/3D3p2j10dR9pWS3xMjHd7cy1ZQfSgMu2zfQKX2N0WBD4Wb2n3MeELMkKhFP2
         d2wQTj8juBXyG5am9SMUCY9/YSzKTdRLCagEkRUJ9qkEMVGH7BkBgUyQJvwJ7gNITPiq
         57G9ty7Oj5KeuNRB+Ses73UGKCEfZlqiBZ5Hx29U6FqEaR/bNNiNSjE2ZT1Xfbljupji
         oVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709231843; x=1709836643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3onkurgGwZnEhJcVtKriZJa3VO4hJPZAGQWDNhD7hV4=;
        b=dYNhEDG1gF9gcCxJuNQuj9rWBHiVx+zY3JGCVIT8+8AN5dFhji+nnysNUB/350zGie
         pZ2r0IJtHS15gYcqStd1ETkfgcwU33ZzY6WxKDcIaL/Czpbt7nczVd6F4YFZNZPiGo7j
         LotyCCFVSKQ5YaXcdkBf6UPJaPnG5X9QNzSOIYg7rtbXATXl5APm2FroIWxktInaiWKe
         lxn6rVIyQlu30WwPYlzwVkwyMSC9SmjTy6ofgy2hm6faRvcMKjDrqnA80d8UlYbfDSm6
         R+aPXAxDJU1amULlOSI767wSemN1z4E06SJFXfTsq+HSEA1kOgtwDClDyLwb0wiHhIbe
         W7qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQpCITVLxpjg4t1JP/MBu5gwxJ4FLh/FfwTDTcQ48BDrtaFdgk6re6KxaFpWBLcx2XndR5uOn8fic84X895PrpmYm3sJruqw+a+UL9MR4A
X-Gm-Message-State: AOJu0Yzq8nUPrplHEm1zzqi1dhDpb3ngxzZF4sbVsEO+olm8nslLuTrp
	euOidR/itHLJmaMqmdaqsr0V7K+seioSCEAFO5xpQ/k4DCiinDJ3H4BRq8jTuEs=
X-Google-Smtp-Source: AGHT+IGtuJS3MAvI4gpblQCoq0hyZ+R7ZzCqp75P0VIfk7XRT7G+I1gfdyMZoSlwNPIXcLTNBCc84Q==
X-Received: by 2002:a17:90a:fa8e:b0:29a:9a57:f367 with SMTP id cu14-20020a17090afa8e00b0029a9a57f367mr3266565pjb.2.1709231843596;
        Thu, 29 Feb 2024 10:37:23 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:b8d8:9761:53ea:51ce])
        by smtp.gmail.com with ESMTPSA id sb3-20020a17090b50c300b00299db19a81asm3919157pjb.56.2024.02.29.10.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 10:37:22 -0800 (PST)
Date: Thu, 29 Feb 2024 10:37:20 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v5 2/2] riscv: Set unaligned access speed at compile time
Message-ID: <ZeDO4CVOi6q4u8Lt@ghost>
References: <20240227-disable_misaligned_probe_config-v5-0-b6853846e27a@rivosinc.com>
 <20240227-disable_misaligned_probe_config-v5-2-b6853846e27a@rivosinc.com>
 <20240229-company-taste-daa305961e3a@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240229-company-taste-daa305961e3a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_103725_223169_4BC47BA1 
X-CRM114-Status: GOOD (  48.36  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 29, 2024 at 12:26:37PM +0000, Conor Dooley wrote:
> On Tue, Feb 27, 2024 at 03:13:14PM -0800, Charlie Jenkins wrote:
> 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index bffbd869a068..ad0a9c1f8802 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -690,25 +690,58 @@ config THREAD_SIZE_ORDER
> >  config RISCV_MISALIGNED
> >  	bool "Support misaligned load/store traps for kernel and userspace"
> >  	select SYSCTL_ARCH_UNALIGN_ALLOW
> > +	depends on RISCV_PROBE_UNALIGNED_ACCESS || RISCV_EMULATED_UNALIGNED_ACCESS
> >  	default y
> >  	help
> >  	  Say Y here if you want the kernel to embed support for misaligned
> >  	  load/store for both kernel and userspace. When disable, misaligned
> >  	  accesses will generate SIGBUS in userspace and panic in kernel.
> >  
> > +choice
> > +	prompt "Unaligned Accesses Support"
> > +	default RISCV_PROBE_UNALIGNED_ACCESS
> > +	help
> > +	  This selects the hardware support for unaligned accesses. This
> > +	  information is used by the kernel to perform optimizations. It is also
> > +	  exposed to user space via the hwprobe syscall. The hardware will be
> > +	  probed at boot by default.
> > +
> > +config RISCV_PROBE_UNALIGNED_ACCESS
> > +	bool "Probe for hardware unaligned access support"
> > +	help
> > +	  During boot, the kernel will run a series of tests to determine the
> > +	  speed of unaligned accesses. This probing will dynamically determine
> > +	  the speed of unaligned accesses on the boot hardware.
> > +
> > +config RISCV_EMULATED_UNALIGNED_ACCESS
> > +	bool "Assume the system expects emulated unaligned memory accesses"
> > +	help
> > +	  Assume that the system expects emulated unaligned memory accesses.
> > +	  When enabled, this option notifies the kernel and userspace that
> > +	  unaligned memory accesses will be emulated by either the kernel or
> > +	  firmware.
> > +
> > +config RISCV_SLOW_UNALIGNED_ACCESS
> > +	bool "Assume the system supports slow unaligned memory accesses"
> > +	depends on NONPORTABLE
> > +	help
> > +	  Assume that the system supports slow unaligned memory accesses. The
> > +	  kernel may not be able to run at all on systems that do not support
> > +	  unaligned memory accesses.
> > +
> >  config RISCV_EFFICIENT_UNALIGNED_ACCESS
> > -	bool "Assume the CPU supports fast unaligned memory accesses"
> > +	bool "Assume the system supports fast unaligned memory accesses"
> >  	depends on NONPORTABLE
> >  	select DCACHE_WORD_ACCESS if MMU
> >  	select HAVE_EFFICIENT_UNALIGNED_ACCESS
> >  	help
> > -	  Say Y here if you want the kernel to assume that the CPU supports
> > -	  efficient unaligned memory accesses.  When enabled, this option
> > -	  improves the performance of the kernel on such CPUs.  However, the
> > -	  kernel will run much more slowly, or will not be able to run at all,
> > -	  on CPUs that do not support efficient unaligned memory accesses.
> > +	  Assume that the system supports fast unaligned memory accesses. When
> > +	  enabled, this option improves the performance of the kernel on such
> > +	  systems.  However, the kernel will run much more slowly, or will not
> > +	  be able to run at all, on systems that do not support efficient
> > +	  unaligned memory accesses.
> >  
> > -	  If unsure what to do here, say N.
> > +endchoice
> 
> Thinking about this some more, you've got 6 different options here:
> 
> 1 probed with no emulation available (choice set to probe + RISCV_MISALIGNED=n)
> 2 probe with in-kernel emulation available (choice set to probe + RISCV_MISALIGNED=y)
> 3 in-kernel emulation only (choice set to emulated + RISCV_MISALIGNED=y)
> 4 no in-kernel emulation but report emulated (choice set to emulated + RISCV_MISALIGNED=n)
> 5 slow unaligned (choice set to slow)
> 6 fast unaligned (choice set to fast)
> 
> Out of these, only 2 and 3 are portable options, since 1, 4 and 5 will
> cause uabi issues if the CPUs or firmware does not support unaligned
> access & 6 will not run in the same circumstances.
> 
> My first thought here was about the motivation for the patch and what it
> has resulted in. Being able to support HAVE_EFFICIENT_ALIGNED_ACCESS is
> pretty nice, but it then seems like beyond that we are introducing
> configuration for configurations sake, without looking at what the
> resultant kernels will be useful for. Having 6 different options for how
> the kernel can be configured in this way seems excessive and I don't
> really get why some of them are even useful.
> 
> Take for example situation 4. Unless I have misunderstood the Kconfig
> options above, if you configure a kernel in that way, it will always
> report as emulated, but there is no emulation provided. This just seems
> like a option that's only purpose is setting a hwprobe value, which is
> a dog wagging the tail situation to me.

This goes back to my earlier comment that it would make sense for
somebody to select "emulated" even if the unaligned address is being
emulated by firmware. However, there may be no users for this and if
needed we can add that in the future.

> 
> The other thing is about what options are actually marked as
> NONPORTABLE, given it is done in the choice option - but whether or not
> something is actually non-portable actually depends on whether or not
> the in-kernel emulator exists.
> 
> I think what I would do here is simplify this quite a bit, starting by
> making RISCV_MISALIGNED an internal option that users cannot enable but
> is selected by the PORTABLE choice options. I would then re-work the
> choice options a bit. My 4 would be:
> 
> 1 probe: probe at boot time, falling back to emulated if not performant
> 2 emulated: always emulate it in the kernel
> 3 slow: don't probe or emulate in the kernel
> 4 fast: Your current fast option

Emulated doesn't mean that the kernel will always emulate the unaligned
accesses. It means that the kernel has the ability to emulate them. It
will only emulate them if the CPU traps on unaligned accesses. Kernel
code can choose to forcefully align an address it thinks may cause an
unaligned access, but that's slightly different from emulated.

Emulated is much slower than "slow", so it seems like it unfairly
penalizes "slow" to group the options for firmware emulated with a CPU
that actually just does slow unaligned accesses.

- Charlie

> 
> 1 & 2 select RISCV_UNALIGNED and are portable because they contain the
> emulated support and thus satisfy the UABI constaints.
> 3 & 4 are marked NONPORTABLE. I think 3 will run on systems that don't
> support unaligned accesses but it will have UABI problems. 4 for the
> reason mentioned in the Kconfig option above.
> 
> I think that that gives you 4 meaningful options, what do you think?
> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
