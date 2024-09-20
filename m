Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E747FCF9C68
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 21:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=358qBSX998G+BdD4QjEoDhd9G2WVpOZYzpVsfcEv8a4=; b=Yd/a8v/RedReYZ
	XvdrNdiLunRtYUXx62P43c4dYS7HB/buAGy/DzflqJsC7mKxVLhT3bCZv3aMi4ha3eVPEl3vM2AUf
	laK0OOWWtdSaE8/yFoEp0qpFnHhfWjE7cMktkeMqHWb6RWb8Ul6+LobyJKdL3/wn5X8J/sDdr8hzo
	o+rbF5jcTLqWVWWSsd2ftF8Eilt6Rg3RtAMyu+fXrUOrWCm1mUEacjpKEsPR0nyReQV+a6p0e84Wp
	or1FO2uED+F5we9490bCiafK+AeM9exctGg0i3hl+igL3+oMr8bW+ODS6EK8cRJtxh7KyvjJy4D05
	0z0KleXGAbpZeg2ogF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srlFL-0000000Cxdo-0tmo;
	Fri, 20 Sep 2024 21:32:59 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srlFH-0000000CxdM-3JWs
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 21:32:57 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2f761461150so32668011fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Sep 2024 14:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726867974; x=1727472774; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yedMi0rr2m7jZhDqBPtfn8qdlTLdCHVXIS1wYbW0HHw=;
        b=VRLhf3CJbmbmU8SZxhF1yhuuj5bkMhJASKkhZWN7l96b/NMrd8wamh17zgIL0Wwp62
         1LatxbJh0hmDWtsuVA+mqrOMSs+CNMAJeqe0xQF4Zf8tTKx38/qkEobkgluYrHrpbxmM
         julUpInIzXob8DxxGSRF/Of6D9wktqTd+7wzuwrLtUJS0DCfScxdjo8MshA1t5cJ9cLI
         amN134FN44CdeThneeYjlNZZ5e1fZ9YD6D/SmIJJyqSPsyXDy15pRfmGNZZrnCdWuuDx
         DavatRhZgaTNmA9qa57M3RpzryVLT9tmqTeY+Dd33xVxM3q4pfJTlntzjbDta0iObcgV
         GJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726867974; x=1727472774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yedMi0rr2m7jZhDqBPtfn8qdlTLdCHVXIS1wYbW0HHw=;
        b=RNIdsV/GkNXjtwhO0xK8cd3LpkvdpU8izgaR4E4hsvhvPH/72aOB2DqAGcw2rz6cPi
         YFK759OryyfErxmLRhMo6/eREcS54JWwo0+6Tu9GTJYUu+Unfbl3a5UvPB5FNBwYF0NH
         oO/h/s1mUa0HtSIWJD1pcRZgY6XWohWN50j4UP34psnTf59l3Z33p3oGSlRKR/Onioec
         KYp8I/jqyBHHVJx0Evz4RBYyTKCwufHpFkFiTkbCg6RCs3SsmAIU7dOM42FRWwVZwGNc
         GpmoBxvCuhduktQgYmM5khAn3cPZbA3RLmmjrRVRRhys/OZXO59pk9NFZeKeHAkMwsiA
         kM9g==
X-Forwarded-Encrypted: i=1; AJvYcCUGVK4IgdxR+FhZrMjHJeh6K9C3elBwXVelVYyRXP+NQwCMysVFhS9l5LANtGNa1LG7/EE6v4oXYIaRgA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9Sl3Z3ERTu6QTnJUdsYox90MCine13g9d3Ffy0UnmRqh852rO
	OIbnZRsoEGeqaCwBBjHxTjFE9C6czNuMvPrXVgRIokFSUak7BC5ixdcGBY/ajE8=
X-Google-Smtp-Source: AGHT+IEaFYnRpbuoQr3t3E0N+OSqX5dBzKegFela78N+6cNOl4laXXImQCFB5g8pd4nLbdJoGf0Uxw==
X-Received: by 2002:a2e:602:0:b0:2f7:6653:8053 with SMTP id 38308e7fff4ca-2f7cb31b975mr27279601fa.18.1726867973513;
        Fri, 20 Sep 2024 14:32:53 -0700 (PDT)
Received: from ghost (93-43-80-122.ip91.fastwebnet.it. [93.43.80.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b33d9sm887542066b.114.2024.09.20.14.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 14:32:52 -0700 (PDT)
Date: Fri, 20 Sep 2024 23:32:49 +0200
From: Charlie Jenkins <charlie@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: jesse@rivosinc.com, linux-riscv@lists.infradead.org, corbet@lwn.net,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Conor Dooley <conor@kernel.org>, robh@kernel.org,
	krzk+dt@kernel.org, cleger@rivosinc.com,
	Evan Green <evan@rivosinc.com>, ajones@ventanamicro.com,
	xiao.w.wang@intel.com, andy.chiu@sifive.com, ebiggers@google.com,
	greentime.hu@sifive.com, Bjorn Topel <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>, costa.shul@redhat.com,
	akpm@linux-foundation.org, bhe@redhat.com, apatel@ventanamicro.com,
	zong.li@sifive.com, samitolvanen@google.com,
	ben.dooks@codethink.co.uk, alexghiti@rivosinc.com,
	gustavoars@kernel.org, erick.archer@gmx.com, j.granados@samsung.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 0/6] RISC-V: Detect and report speed of unaligned
 vector accesses
Message-ID: <Zu3qAdGYJfNPTK15@ghost>
References: <20240820152424.1973078-1-jesse@rivosinc.com>
 <mhng-07137536-28ef-4262-a165-6388fffd2599@palmer-ri-x1c9>
 <Zu3illShBOscs+zN@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zu3illShBOscs+zN@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_143255_855353_DB4C9155 
X-CRM114-Status: GOOD (  29.82  )
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

On Fri, Sep 20, 2024 at 11:01:10PM +0200, Charlie Jenkins wrote:
> On Fri, Sep 20, 2024 at 05:57:22AM -0700, Palmer Dabbelt wrote:
> > On Tue, 20 Aug 2024 08:24:18 PDT (-0700), jesse@rivosinc.com wrote:
> > > Adds support for detecting and reporting the speed of unaligned vector
> > > accesses on RISC-V CPUs. Adds vec_misaligned_speed key to the hwprobe
> > > adds Zicclsm to cpufeature and fixes the check for scalar unaligned
> > > emulated all CPUs. The vec_misaligned_speed key keeps the same format
> > > as the scalar unaligned access speed key.
> > > 
> > > This set does not emulate unaligned vector accesses on CPUs that do not
> > > support them. Only reports if userspace can run them and speed of
> > > unaligned vector accesses if supported.
> > > 
> > > The Zicclsm is patches are no longer related to this set.
> > > 
> > > Changes in v6:
> > >  Added ("RISC-V: Scalar unaligned access emulated on hotplug CPUs")
> > > 
> > > Changes in V8:
> > >  Dropped Zicclsm
> > >  s/RISCV_HWPROBE_VECTOR_MISALIGNED/RISCV_HWPROBE_MISALIGNED_VECTOR/g
> > >   to match RISCV_HWPROBE_MISALIGNED_SCALAR_*
> > >  Rebased onto palmer/fixes (32d5f7add080a936e28ab4142bfeea6b06999789)
> > > 
> > > Changes in V9:
> > >  Missed a RISCV_HWPROBE_VECTOR_MISALIGNED...
> > > 
> > > Jesse Taube (6):
> > >   RISC-V: Check scalar unaligned access on all CPUs
> > >   RISC-V: Scalar unaligned access emulated on hotplug CPUs
> > >   RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
> > >   RISC-V: Detect unaligned vector accesses supported
> > >   RISC-V: Report vector unaligned access speed hwprobe
> > >   RISC-V: hwprobe: Document unaligned vector perf key
> > > 
> > >  Documentation/arch/riscv/hwprobe.rst       |  16 +++
> > >  arch/riscv/Kconfig                         |  57 +++++++-
> > >  arch/riscv/include/asm/cpufeature.h        |  10 +-
> > >  arch/riscv/include/asm/entry-common.h      |  11 --
> > >  arch/riscv/include/asm/hwprobe.h           |   2 +-
> > >  arch/riscv/include/asm/vector.h            |   2 +
> > >  arch/riscv/include/uapi/asm/hwprobe.h      |   5 +
> > >  arch/riscv/kernel/Makefile                 |   3 +-
> > >  arch/riscv/kernel/copy-unaligned.h         |   5 +
> > >  arch/riscv/kernel/fpu.S                    |   4 +-
> > >  arch/riscv/kernel/sys_hwprobe.c            |  41 ++++++
> > >  arch/riscv/kernel/traps_misaligned.c       | 131 +++++++++++++++--
> > >  arch/riscv/kernel/unaligned_access_speed.c | 156 +++++++++++++++++++--
> > >  arch/riscv/kernel/vec-copy-unaligned.S     |  58 ++++++++
> > >  arch/riscv/kernel/vector.c                 |   2 +-
> > >  15 files changed, 465 insertions(+), 38 deletions(-)
> > >  create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S
> > > 
> > > base-commit: 32d5f7add080a936e28ab4142bfeea6b06999789
> > 
> > I get a
> > 
> > arch/riscv/kernel/traps_smisaligned.c: In function 'check_vector_unaligned_access_emulated':
> > arch/riscv/kernel/traps_misaligned.c:591:9: error: unknown register name 'v0' in 'asm'
> >  591 |         __asm__ __volatile__ (
> >      |         ^~~~~~~
> > 
> > on rv32/defconfig.  Looks like just a missing Kconfg guard as this depends
> > on V support in the toolchain.
> 
> There was an interesting iteraction here!
> RISCV_PROBE_VECTOR_UNALIGNED_ACCESS was selecting
> RISCV_VECTOR_MISALIGNED but that bypasses the depends on check of
> RISCV_ISA_V. I'll send an update for Jesse with the fix for that one
> patch.

I take it back, I am not able to reproduce this.
RISCV_PROBE_VECTOR_UNALIGNED_ACCESS is hidden behind "Vector unaligned
Accesses Support" which depends on RISCV_ISA_V. This function that is
erroring has the code:

#ifdef CONFIG_RISCV_VECTOR_MISALIGNED
void check_vector_unaligned_access_emulated(struct work_struct *work __always_unused)
...

Since it is hidden behind CONFIG_RISCV_VECTOR_MISALIGNED, I am unsure
how it is possible that this error is leaking through. The error you
posted is also kind of odd because the first file you have is
"arch/riscv/kernel/traps_smisaligned.c" but the actual file is
"arch/riscv/kernel/traps_misaligned.c".

> - Charlie
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
