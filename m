Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A268CF9C69
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 21:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyHlVKw8tKvwF0qfPKp2Txukqkyl6oXwzsVoYDuAqBo=; b=O/1YOf1DSuyx2d
	Z6x5NtgtFllIFdfN8Qf3H6Y/baDr/tuTP2b0vThYEXz1CbZCMfG4ZjxwniodZaM+fckm5O7VkkvrK
	oBe3MQ2THV6X8PPePO0YqD6XZ1FMDLUFFfIM9YSKt1B3mL6UPaB2eAWVc0Ze2N3jhF9cHl0Al4X0l
	kyrbmE5HrPNdIG3qoQBL7qFqgF08qCt0eC84Xyd1FMej0x2P0wAI0ZnDcVzSqwV1uvPX+RCAQhUQ8
	9ncjK3qGBcdkeexssmwxfGqP6HwGgetBybbdcq3hGW/nnAqovhFHHat9SALDVUXIxm0bfYsSCK/Wx
	0u8Hdu/LgeWujs75HtDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srkkj-0000000CvzN-2ppd;
	Fri, 20 Sep 2024 21:01:21 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srkkg-0000000Cvys-1B3C
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 21:01:20 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a8ce5db8668so346180866b.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Sep 2024 14:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726866076; x=1727470876; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SHq5Ybd77fru22LRWAFMH7LcFDb7LOvBsmtZa3/3WKE=;
        b=cmwRXjljR1vVH21+1oyniGKfsW64G5FrsgmNk3Vq4dtMe55XaJwX5S9bTLLXfsDNnV
         aGCPWRKggKLytyi7pe0rpxUXzFRHSSU1jMNqo+BvWBFA+BwhBrLY+n0/NliAn8jJeKgu
         WYG0+pXPbiTbC6IE8Ed32B5YZ4QctmpCHGbFxx2YLu9olL9tmqTWuaYPy3gYRpBOMiOR
         GjOWZXLWrZfnTZl5z1jtnVwXej4+v2GN6ON8SOQeXsUzFzH+neSC2Wpt1FRjYFoyjfX8
         7V37IvOndvUWejfWLZzIzinyN0QZt4V6Soqc3DTEAhmmRY8bBfWi+vwHSh1py0dA5wrI
         N61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726866076; x=1727470876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHq5Ybd77fru22LRWAFMH7LcFDb7LOvBsmtZa3/3WKE=;
        b=Ru3wMo9oLvv+0ndCQxqDuq1lGT4oYq9ZwUBH5h74hcPZs2eXEEMSzOwQeGucVck3bW
         MUTxd35egY/uq39yeGkhghH16qid+gWJyRo9M+XAQ2A66DtHYm1vtQEqSj2j9xv9gS1F
         +IjGdsl4gcbsyOXVYNHrpkQwBvZkmULuSd/R/h4s/5MKTwLjRpnAkjoII1gP6Yqs4DjI
         iLW8q7MJk/4J84Dk88Po7IsqN02ULQB6/odlegWHRuT4rw9KWUyEvvusKtUPUeGg68QC
         mLop682hGIVnYH4SmmO0sQNQnB7f62Sy9kOIxjNgj7PmMzPC5Nx6nEKTGQTnvyxnyDOE
         F1dw==
X-Forwarded-Encrypted: i=1; AJvYcCXTAQ3A3crU7FwUmpvaqL7tzTtBJh5GT24UhjE33+1ddSwuCI6u2BPm+oNrMJHQXyIN1wRu6O14Melijg==@lists.infradead.org
X-Gm-Message-State: AOJu0YygaLleVAzqsOTXHE90x7rOc2JBV/SJ+FJhB3l0w1BM0/8vFrhM
	lKi6WnKWmBlSiKQKR6O0Ef9fc24jlX9IKKwKr79VhLVT91PI4QgmlmZle2pUbBU=
X-Google-Smtp-Source: AGHT+IFvZutMv3hAi7GK/HNuGy//IeO1PNm9K5DKXlfZOUXeDoDuBbV9l54Y+bWxkkeq8g13dd//OA==
X-Received: by 2002:a17:906:bc08:b0:a7a:a892:8e05 with SMTP id a640c23a62f3a-a90d56bcc1cmr337567866b.33.1726866076039;
        Fri, 20 Sep 2024 14:01:16 -0700 (PDT)
Received: from ghost (93-43-80-122.ip91.fastwebnet.it. [93.43.80.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9061116d67sm898128166b.94.2024.09.20.14.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 14:01:14 -0700 (PDT)
Date: Fri, 20 Sep 2024 23:01:10 +0200
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
Message-ID: <Zu3illShBOscs+zN@ghost>
References: <20240820152424.1973078-1-jesse@rivosinc.com>
 <mhng-07137536-28ef-4262-a165-6388fffd2599@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-07137536-28ef-4262-a165-6388fffd2599@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_140118_619786_04FFB064 
X-CRM114-Status: GOOD (  23.78  )
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

On Fri, Sep 20, 2024 at 05:57:22AM -0700, Palmer Dabbelt wrote:
> On Tue, 20 Aug 2024 08:24:18 PDT (-0700), jesse@rivosinc.com wrote:
> > Adds support for detecting and reporting the speed of unaligned vector
> > accesses on RISC-V CPUs. Adds vec_misaligned_speed key to the hwprobe
> > adds Zicclsm to cpufeature and fixes the check for scalar unaligned
> > emulated all CPUs. The vec_misaligned_speed key keeps the same format
> > as the scalar unaligned access speed key.
> > 
> > This set does not emulate unaligned vector accesses on CPUs that do not
> > support them. Only reports if userspace can run them and speed of
> > unaligned vector accesses if supported.
> > 
> > The Zicclsm is patches are no longer related to this set.
> > 
> > Changes in v6:
> >  Added ("RISC-V: Scalar unaligned access emulated on hotplug CPUs")
> > 
> > Changes in V8:
> >  Dropped Zicclsm
> >  s/RISCV_HWPROBE_VECTOR_MISALIGNED/RISCV_HWPROBE_MISALIGNED_VECTOR/g
> >   to match RISCV_HWPROBE_MISALIGNED_SCALAR_*
> >  Rebased onto palmer/fixes (32d5f7add080a936e28ab4142bfeea6b06999789)
> > 
> > Changes in V9:
> >  Missed a RISCV_HWPROBE_VECTOR_MISALIGNED...
> > 
> > Jesse Taube (6):
> >   RISC-V: Check scalar unaligned access on all CPUs
> >   RISC-V: Scalar unaligned access emulated on hotplug CPUs
> >   RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
> >   RISC-V: Detect unaligned vector accesses supported
> >   RISC-V: Report vector unaligned access speed hwprobe
> >   RISC-V: hwprobe: Document unaligned vector perf key
> > 
> >  Documentation/arch/riscv/hwprobe.rst       |  16 +++
> >  arch/riscv/Kconfig                         |  57 +++++++-
> >  arch/riscv/include/asm/cpufeature.h        |  10 +-
> >  arch/riscv/include/asm/entry-common.h      |  11 --
> >  arch/riscv/include/asm/hwprobe.h           |   2 +-
> >  arch/riscv/include/asm/vector.h            |   2 +
> >  arch/riscv/include/uapi/asm/hwprobe.h      |   5 +
> >  arch/riscv/kernel/Makefile                 |   3 +-
> >  arch/riscv/kernel/copy-unaligned.h         |   5 +
> >  arch/riscv/kernel/fpu.S                    |   4 +-
> >  arch/riscv/kernel/sys_hwprobe.c            |  41 ++++++
> >  arch/riscv/kernel/traps_misaligned.c       | 131 +++++++++++++++--
> >  arch/riscv/kernel/unaligned_access_speed.c | 156 +++++++++++++++++++--
> >  arch/riscv/kernel/vec-copy-unaligned.S     |  58 ++++++++
> >  arch/riscv/kernel/vector.c                 |   2 +-
> >  15 files changed, 465 insertions(+), 38 deletions(-)
> >  create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S
> > 
> > base-commit: 32d5f7add080a936e28ab4142bfeea6b06999789
> 
> I get a
> 
> arch/riscv/kernel/traps_smisaligned.c: In function 'check_vector_unaligned_access_emulated':
> arch/riscv/kernel/traps_misaligned.c:591:9: error: unknown register name 'v0' in 'asm'
>  591 |         __asm__ __volatile__ (
>      |         ^~~~~~~
> 
> on rv32/defconfig.  Looks like just a missing Kconfg guard as this depends
> on V support in the toolchain.

There was an interesting iteraction here!
RISCV_PROBE_VECTOR_UNALIGNED_ACCESS was selecting
RISCV_VECTOR_MISALIGNED but that bypasses the depends on check of
RISCV_ISA_V. I'll send an update for Jesse with the fix for that one
patch.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
