Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5293C47258
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 04:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SLU6IUDP5yhmUyl+ZPTv7ao3G4zxlPy6hi84rhcLIo=; b=ZHuRXhb0LOI8ls
	+g1iJgjmxo7GjONHedsazPBKSbVG2gXNCEozFZmeVMupKyXYWtyd82r0/8xa/H+LBhxcip9mMY2KN
	8VLseo8MeQVRbweLlyBPyZehKtJtJhqjCrvb39EJnh3raMV5ZpuTOrBhdQM/bbrwy0BE7gCR/nBWM
	f4f4F+OBLAFgINF06Foe9Mn/Mz2j+LRv/LjLy1lDfaxyrTQmU/pXNt0tCIxcyfScz+ApQrurBEcHJ
	RLDVmvN8t1VAYkWHRmHt0BijuxuLjyeh21MSdI0Ucje2ev8Bljd0tb7IjWdlJbu0EXzxUi//G+jUF
	A9/PmMlr3rqGA1mvVgdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVla8-0000000AD2I-0x9I;
	Fri, 02 Feb 2024 04:55:16 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVla4-0000000ACzn-474O
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 04:55:14 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3bfbb51ac70so391699b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 20:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706849710; x=1707454510; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ELOUzOOhC9OHyQkXGZvP+NJh1VjcNaclpZjQdZoL1A0=;
        b=HkW6KS+55uGttXl4YehakE6MvPHl2qC/G8hLC0fqpJiv/yiDQ/E9pPhIjA8gdKtnqk
         mSxMedUHjfSTbPrCFO+T7T0LZ0s0CrSjatXHvHbLO3DXh+JNvwBA72ojBiOubOU2TqsG
         aJuxkLOprr6/iXp0b4bWxAIVHTy3T9G0a2vGGzTNdz6W0dZGCDA+8gN46uAQPSEIemAL
         bt8SNbnljW62JMIqFJl1tr7N21T8UscndbqFmXK3ZiXi9yezQjfEwiSMb+Qd2dnpjeAq
         OvDY/Ue0m6jWsWqgUY9bhoD+OFZ7qKB2D03mdldijMbQ1VddfLq5VNZU9WHfzlcKHz+l
         4Q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706849710; x=1707454510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELOUzOOhC9OHyQkXGZvP+NJh1VjcNaclpZjQdZoL1A0=;
        b=ki09F2a00c06VEvwUFgN7NgPldh7Gl4jmEgXYX/wLuzYl1DZ2TvMrgDthSC9xTTVXI
         2yKKz9eNeuQjanHY9PUkqpp/zznSpmC8Ootso+pUz9lPvmWTdKyiIrKAoHKzO4Gd1SEf
         pamJXtD32ZxSgNlNc+aavwnW6TW0+zKKGtVRy6EjgA6XdLC3pp1nCE7sZhTln5X/rSPZ
         +e3yyD16+q41JK6YVaNSZPUuX8aRtLEeDKICaVTBJ7ipp1HLHPGiMDFvtw91+blm+ikD
         iC44DdRoy6xzJ8Nu8R8pLSaysdyuGqtIKR4TvQqBpMiUTzZ0mgSrrgt0DCl8f/pDVX1B
         issg==
X-Gm-Message-State: AOJu0Yxo7iZxjaB8UmnTQq4GK/PByUOZeTZ94QehZk3Z47H9zdlNGBn/
	vt06YiRb0piBP/dxeDLr2L92p2zXPIynqzSVOVz5rFXbFC4o/gxxN1NLmJpfD5Q=
X-Google-Smtp-Source: AGHT+IEt/9wko6Cibn+dwmpNKmXyDK48EPa2pWVscYQC2nlerGRXrHP67I5NFVgtquib0f23Ev+JDw==
X-Received: by 2002:a05:6808:15a4:b0:3bf:bc6b:ffe2 with SMTP id t36-20020a05680815a400b003bfbc6bffe2mr1626440oiw.38.1706849710167;
        Thu, 01 Feb 2024 20:55:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXaIf8VPRQDhUIzj9+k0XKjsZEiQYNzBqS4trMRWGdzWHRfcc5fnSubNMHCLB+ryltPFubGHu/4zhzI9lj4QStL/fLyHWw6PrWOsa6ex5MyDoZ/mIFU8HIo6AC33CxXKahoaWNJTpytH1PApkRRMjt1wOqnvCOwIQq9g6DIabmrLG4ZKljwS7lvit5Hb9M36Bgwj4Nb/Rty7QvZ+5PX1nTCdMb0Ia8VOdaEomzdshXyYwriOTp4y6rujYkM+6TlbnZ+8Z6XyT+uGp9PfzLEn9Zt7aTcRQ==
Received: from ghost ([2601:647:5700:6860:e95e:e3b9:1925:927a])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b006dd850bbd21sm617636pff.36.2024.02.01.20.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 20:55:09 -0800 (PST)
Date: Thu, 1 Feb 2024 20:55:06 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: Disable misaligned access probe when
 CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
Message-ID: <Zbx1qlcfWJIBLobb@ghost>
References: <20240201-disable_misaligned_probe_config-v2-0-77c368bed7b2@rivosinc.com>
 <20240201-disable_misaligned_probe_config-v2-2-77c368bed7b2@rivosinc.com>
 <gtwet3x2fokbne5642vleyp5u7pqjl2lbtbngjjfavmgvvytzg@z2gx6xoa3hvl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <gtwet3x2fokbne5642vleyp5u7pqjl2lbtbngjjfavmgvvytzg@z2gx6xoa3hvl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_205513_260497_3BC812F3 
X-CRM114-Status: GOOD (  16.75  )
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

On Thu, Feb 01, 2024 at 08:31:10PM -0800, Elliot Berman wrote:
> Hi Charlie,
> 
> On Thu, Feb 01, 2024 at 03:30:46PM -0800, Charlie Jenkins wrote:
> > When CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is selected, the cpus can be
> > set to have fast misaligned access without needing to probe.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/Kconfig                               |   1 +
> >  arch/riscv/include/asm/cpufeature.h              |   7 +
> >  arch/riscv/include/asm/misaligned_access_speed.h |  29 +++
> >  arch/riscv/kernel/Makefile                       |   3 +
> >  arch/riscv/kernel/cpufeature.c                   | 255 ----------------------
> >  arch/riscv/kernel/misaligned_access_speed.c      | 265 +++++++++++++++++++++++
> >  arch/riscv/kernel/sys_hwprobe.c                  |   4 +
> >  7 files changed, 309 insertions(+), 255 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> > index f71910718053..8be7f17da9ab 100644
> > --- a/arch/riscv/kernel/Makefile
> > +++ b/arch/riscv/kernel/Makefile
> > @@ -62,6 +62,9 @@ obj-y	+= tests/
> >  obj-$(CONFIG_MMU) += vdso.o vdso/
> >  
> >  obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
> > +ifneq ($(RISCV_EFFICIENT_UNALIGNED_ACCESS), y)
> 
> Should this be CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS ?

Oh thank you Elliot! Yes it is. I was going back and forth on whether I
wanted this to be CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS or
CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS and I must have mistyped when I
was changing it. I settled on CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
everywhere else so this should also use that instead. These two configs
are effectively the same since the only way to select
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is by selecting
CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS.

- Charlie

> 
> > +obj-y	+= misaligned_access_speed.o
> > +endif
> >  obj-$(CONFIG_FPU)		+= fpu.o
> >  obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
> >  obj-$(CONFIG_RISCV_ISA_V)	+= kernel_mode_vector.o

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
