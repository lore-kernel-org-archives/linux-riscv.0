Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52503C54E4A
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 18:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGnBDpB8fPSJHvgRUIxyJ+bgBRW968oM3+Bhu8K69iw=; b=D2AGllmTHvVxrB
	IsrsxriCmWTQlzfAyv+sYzcwXRkBByQ6t88b5ZeXWiQEjVXaSMM9RgCbJsHrl56s4lTjz4FOq3+pr
	EXUQz+OjSnyGQdXVJtgyLETON9+nh1exh1C3LWPnJXR3go/HrQH9/OQbc+Vj+fQxmwUcJ5QmxFkHq
	mondCdFyUs8u+ne4HTnY1O5d70q3QB55A7957C/b0Ye/CMqITd7zPeGqa3FF4Y0W9S3RL133LCu51
	HD2NkLIftFNYESAgP7VSl8M3Pbsr+oOm5rgTjy+OXNw2TJQEdaCNnT+uPPY6A5iWd5nQlMKYer4Sb
	aHhGEINM3FuO/k0925vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rieam-0000000AgtS-2qvq;
	Fri, 08 Mar 2024 18:05:12 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rieai-0000000Agrp-1TBw
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 18:05:10 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2998950e951so1552055a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Mar 2024 10:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709921107; x=1710525907; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xLs3kZ5OblOBLvikyewkAB+57eMxN1fpqXGCrqHaNUI=;
        b=K3mkSj4E7lvZUjWnpEM6E+EsBS0ogxaKWs+Azyu+Q6X91cdp0l2sZae6/tRPh/XVkU
         L+rfFWqz3t41g4/QvtmN97ePp5ppoDK8q5qbvtcRVKsr4EwA/Y3m3/It0NQ9xnB93cR3
         i4nrglq1m32JHuCbS/3bi1i/W6GBS+h0SlHOJUgDySJnk73pLn7w/hfYBXcGp0DA9mp0
         SiWc/7ejZp2sAW5HdVBr1e9LdfhVRBxKyzPzdXke54198aQQJJUxKiZVGDJUtUxDWzQz
         m1uB2f88voCmBb3DS85OYAyeFmfhvGlxsgnfsx0EkDSjjl+O1bp6UTsNlRoEANrG7NmM
         314A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709921107; x=1710525907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLs3kZ5OblOBLvikyewkAB+57eMxN1fpqXGCrqHaNUI=;
        b=PRvY5fyqBrtw/4G0E3FJx4H6sRI+WmrReL7WunB8wThQXNkDfkGvkEGSfAb+Tx4mxY
         djGCp8wSakByOiGe2r0IJC06zvUKeLaUBeAwOOZ3o5zkCkxyysB15F5LTGv3Gs/dp+Mf
         vXkak4JBeXrBUhd0LhztO4IcpiI7PbibcLBEV/cHTEv3vigRDMdnkOScR4F37+vCRGpZ
         4JEmvStuzaM+5FD/+3brfRmNOgyyLQPdoVX8DSi2uSMkTY0Ai36SXd+3lJBR5Ily+PD/
         L6EEIAQ1ysmZkkMrXHzvMYZRIdeEhSlQhS3inNA+LW/Ksl+qJy3x5CYOQtbZstpvOx2M
         AIxw==
X-Forwarded-Encrypted: i=1; AJvYcCUkzuS9t+LX5Ei/swu57H1yYEucKI7c9Mx5Qh8+cVhjDtjbipis6EHQGEsiHxByITMu5rjs3RopJweQ2/NPFgsSnTZecADuXLLzY9/aMJJq
X-Gm-Message-State: AOJu0YwPAUNDsAe5qZ0UTxvXP+uO/2cIO61jcJ4uNLR+U6/JlGtZXYMX
	cWad28jVPycLaAbax4stGIC91fiAuF3rfbqsq7NKi3r8xomh8A+7RYac4px94hI=
X-Google-Smtp-Source: AGHT+IENQYcM6sGyM8j6pDoEai9UQoUvp+q5q0Z2Rg+MMx+kdD4QbDMnrmI/tcug7Njwiwm+KSu6Qg==
X-Received: by 2002:a17:90b:914:b0:29b:976d:b5b2 with SMTP id bo20-20020a17090b091400b0029b976db5b2mr758045pjb.17.1709921106862;
        Fri, 08 Mar 2024 10:05:06 -0800 (PST)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id a24-20020a631a18000000b005dc491ccdcesm14313052pga.14.2024.03.08.10.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 10:05:06 -0800 (PST)
Date: Fri, 8 Mar 2024 10:05:02 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>, Evan Green <evan@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Subject: Re: [PATCH v8 4/4] riscv: Set unaligned access speed at compile time
Message-ID: <ZetTThVgR0U29EN4@ghost>
References: <20240307-disable_misaligned_probe_config-v8-0-55d696cb398b@rivosinc.com>
 <20240307-disable_misaligned_probe_config-v8-4-55d696cb398b@rivosinc.com>
 <CAJM55Z9SYA=QMg0Wg-e0Q8nOTP6qSKkc+kxHMGOmmmWrEcVf7w@mail.gmail.com>
 <20240308-docile-pretense-b44c3a84d8b2@wendy>
 <CAJM55Z8EX5D0HZ1xKTkaQEL1RF46DrBynUoTSMP5q8kmDGY_=w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z8EX5D0HZ1xKTkaQEL1RF46DrBynUoTSMP5q8kmDGY_=w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_100508_707466_EAA43A6D 
X-CRM114-Status: GOOD (  44.97  )
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

On Fri, Mar 08, 2024 at 05:35:03AM -0800, Emil Renner Berthing wrote:
> Conor Dooley wrote:
> > On Fri, Mar 08, 2024 at 01:52:24AM -0800, Emil Renner Berthing wrote:
> > > Charlie Jenkins wrote:
> >
> > > >  config RISCV_MISALIGNED
> > > > -	bool "Support misaligned load/store traps for kernel and userspace"
> > > > +	bool
> > > >  	select SYSCTL_ARCH_UNALIGN_ALLOW
> > > > -	default y
> > > >  	help
> > > > -	  Say Y here if you want the kernel to embed support for misaligned
> > > > -	  load/store for both kernel and userspace. When disable, misaligned
> > > > -	  accesses will generate SIGBUS in userspace and panic in kernel.
> > > > +	  Embed support for misaligned load/store for both kernel and userspace.
> > > > +	  When disabled, misaligned accesses will generate SIGBUS in userspace
> > > > +	  and panic in the kernel.
> > >
> > > Hmm.. this is *may* generate SIGBUS in userspace and panic the kernel. The CPU
> > > could support unaligned access natively or there might be a handler in M-mode,
> > > right?
> >
> > Correct. The last sentence could become "When disabled, and there is no
> > support in hardware or firmware, unsigned accesses will...". That said,
> > this option is no longer user visible, so we could really simplify the
> > hell out of this option to just mention that it controls building the
> > in-kernel emulator.
> >
> > > > +choice
> > > > +	prompt "Unaligned Accesses Support"
> > > > +	default RISCV_PROBE_UNALIGNED_ACCESS
> > > > +	help
> > > > +	  This determines the level of support for unaligned accesses. This
> > > > +	  information is used by the kernel to perform optimizations. It is also
> > > > +	  exposed to user space via the hwprobe syscall. The hardware will be
> > > > +	  probed at boot by default.
> > > > +
> > > > +config RISCV_PROBE_UNALIGNED_ACCESS
> > > > +	bool "Probe for hardware unaligned access support"
> > > > +	select RISCV_MISALIGNED
> > > > +	help
> > > > +	  During boot, the kernel will run a series of tests to determine the
> > > > +	  speed of unaligned accesses. This probing will dynamically determine
> > > > +	  the speed of unaligned accesses on the underlying system. If unaligned
> > > > +	  memory accesses trap into the kernel as they are not supported by the
> > > > +	  system, the kernel will emulate the unaligned accesses to preserve the
> > > > +	  UABI.
> > > > +
> > > > +config RISCV_EMULATED_UNALIGNED_ACCESS
> > > > +	bool "Emulate unaligned access where system support is missing"
> > > > +	select RISCV_MISALIGNED
> > > > +	help
> > > > +	  If unaligned memory accesses trap into the kernel as they are not
> > > > +	  supported by the system, the kernel will emulate the unaligned
> > > > +	  accesses to preserve the UABI. When the underlying system does support
> > > > +	  unaligned accesses, the unaligned accesses are assumed to be slow.
> > >
> > > It's still not quite clear to me when you'd want to choose this over probing
> > > above. Assuming the probe measures correctly this can only result in a kernel
> > > that behaves the same or slower than with the option above, right?
> >
> > Aye, mostly the same - some people don't want the boot-time overhead
> > of actually running the profiling code, so this option is for them.
> > Maybe that's not such a big deal anymore with the improvements to do it
> > in parallel, but given how bad performance on some of the systems is
> > when firmware does the emulation, it is definitely still noticeable.
> > I know we definitely have customers that care about their boot time very
> > strongly, so I can imagine they'd be turning this off.
> 
> Ah, that makes sense. So maybe a help text more along the lines of "Disable
> probing and optimizations for CPUs with fast unaligned memory access" would be
> a better description of this choice?

It does cause probing/optimizations to not be enabled, but it does not
"disable" them. For maximal optimizations for fast unaligned accesses,
the user must select RISCV_EFFICIENT_UNALIGNED_ACCESS before and after
this change. For probing, the user must select
RISCV_PROBE_UNALIGNED_ACCESS.

- Charlie

> 
> > > > +
> > > > +config RISCV_SLOW_UNALIGNED_ACCESS
> > > > +	bool "Assume the system supports slow unaligned memory accesses"
> > > > +	depends on NONPORTABLE
> > > > +	help
> > > > +	  Assume that the system supports slow unaligned memory accesses. The
> > > > +	  kernel and userspace programs may not be able to run at all on systems
> > > > +	  that do not support unaligned memory accesses.
> > >
> > > Again you're just explicitly saying no to the optimizations the kernel might do
> > > if it detects fast unaligned access, only here you'll also crash if they're not
> > > handled by the CPU or M-mode. Why would you want that?
> > >
> > > I'm probably missing something, but the only reason I can think of is if you
> > > want build a really small kernel and save the few bytes for the handler and
> > > probing code.
> >
> > Aye, just to allow you to disable the in-kernel emulator. That's
> > currently a choice that is presented to people, so this option preserves
> > that. IMO this is by far the least useful option and is locked behind
> > NONPORTABLE anyway. Maybe we could delete it, and if someone really wants
> > it, it would not be all that much of a hassle to add back in the future?
> 
> Yeah, if noone really needs this less config options is better, but I don't
> feel strongly about this option either way.
> 
> /Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
