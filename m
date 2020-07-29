Return-Path: <SRS0=qsF3=BI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4BDC433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 08:12:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52ECD2070B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 08:12:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nUYeVjcJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=forissier-org.20150623.gappssmtp.com header.i=@forissier-org.20150623.gappssmtp.com header.b="q5m9FdpU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52ECD2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=forissier.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W5tPEspIA3H0xHmXX+QhSK5cnNZJj7uIjgBSamXe358=; b=nUYeVjcJ45Eq2e4XWxJiOyeIo
	OvV0tyLWDIIQLxaUB9zTBVYN9+jkH4FV3JbiokCs/7hQB7K7PbXiYZ3O23XoA63L7J8X0DU9bIWuM
	dBfnWxfNqypCesbyuqI0HiRTnrvZuuTWiPk5Jr+XE22TbhyHWgrYDBktJCDAzhvqjM/dKOYLstNAB
	Un1W+QRc5uFBi9hi1Uhw0IwKfUHeKNjRABXxnV5CeqFrYwvZf2uLOA+dLFRHEHZNCtiGk/JonnudK
	dLASXT9CKcPWuO7t0ZYQDTBCLR9If6lyV9P2tvF8Zv0ojvu0ND/t1aCuxN2fxKIFBNGexEk4czP0l
	y3zLV4Nvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0hBk-0001yI-7m; Wed, 29 Jul 2020 08:11:48 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0hBO-0001mg-BW
 for linux-riscv@lists.infradead.org; Wed, 29 Jul 2020 08:11:45 +0000
Received: by mail-wm1-x342.google.com with SMTP id g8so1866681wmk.3
 for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2020 01:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=forissier-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NWpc+EWO2ohEWOIGgE6KG6Fq2rn94AMObPWWnTrm8Zo=;
 b=q5m9FdpUxgsKg5J8B+rOsrFkP6jJbxCMVmf7CSV5nPPZfdkpoFv+ZtnRErnjUVdGqr
 MNR9ENYM1h4RxvgcROVDg414zEN7e4VuP4CholZD4KztBFDKv67EeeoWRwIG6IQy9uPd
 dgVrRj8FKBTbQrpyrwZPFppS8P9u9zr42IZAex4L8dpOBSJhv4Z8qbUBtFp69iAkBokD
 DEfKspL1FUW2A5Ngv6p9i8+PNGeXU4PCJZZOCC4FA7F2k6F6KsSagbHdYm5qpUt5AiMc
 8tiFX9b9rZ7codVW/qFc2nllIGLvGSi652et46emfPybjIIl0xgQ5F6p2swnUIEeTLr0
 7wSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NWpc+EWO2ohEWOIGgE6KG6Fq2rn94AMObPWWnTrm8Zo=;
 b=l/kC9YupGp1I4PhxMkPeAfwAhqfcjs45N3nqVII2u9pdvbM2X0gbhW7EIN82TUPUNG
 ND8QEFqStndT7GVE3aVc941FphGQ0dYPeXXe6vzR+CIh737jmQ9EGYmGFzuNlm9O3CtK
 XVL0V1pwwDYLcxf7FgsDt3uzih+EYJlACrRHwTUNr1moN3kWrYf3z0AS0FimpxAhIypm
 HNp7DLSU42M4tvM66I87/gkYEwAqkA5NAqUZTjT9gpChJT3pvUhEHyEhm9UcREvXuLEZ
 qKpmqYyiWSNnz3MvfHY9fbjWFrXSUXVyJ7rmnklXVsUPSAF7fN+0ukvsHcPy4aYe+JSU
 p6vg==
X-Gm-Message-State: AOAM5339k8uI5/jntspk0VSsqrBC9bn/si5zhiH3Vp82bJka2iWOrx1z
 13CvKwUPVS8VwV3lrjUgODjcgA==
X-Google-Smtp-Source: ABdhPJxmOQ8tBOr5XS2wTM9/tWtzgIG195sTwOUVtOTRbOFp1ZL1dIdvQDvNDupqtZJNmhhsFJ5cWg==
X-Received: by 2002:a1c:5986:: with SMTP id n128mr7117938wmb.112.1596010282526; 
 Wed, 29 Jul 2020 01:11:22 -0700 (PDT)
Received: from matebook.home ([2a01:e0a:269:e210:d805:7291:902e:33f0])
 by smtp.gmail.com with ESMTPSA id a134sm3739035wmd.17.2020.07.29.01.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 01:11:21 -0700 (PDT)
From: Jerome Forissier <jerome@forissier.org>
To: tklauser@distanz.ch
Subject: Re: [PATCH RESEND] riscv: don't specify -mno-save-restore when
 building with clang
Date: Wed, 29 Jul 2020 10:08:11 +0200
Message-Id: <20200729080811.12111-1-jerome@forissier.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200729044143.tzok6p3nctqzms4w@distanz.ch>
References: <20200729044143.tzok6p3nctqzms4w@distanz.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_041126_603279_46A97F5A 
X-CRM114-Status: GOOD (  24.91  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: jerome@forissier.org, linux-riscv@lists.infradead.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> On 2020-07-28 at 18:06:36 +0200, Tobias Klauser <tklauser@distanz.ch> wrote:
> > On 2020-07-28 at 17:20:45 +0200, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > On Tue, 28 Jul 2020 06:12:52 PDT (-0700), tklauser@distanz.ch wrote:
> > > > Clang doesn't support -msave-restore and -mno-save-restore. This avoids
> > > > the following message emitted by clang:
> > > > 
> > > >   '-save-restore' is not a recognized feature for this target (ignoring feature)
> > > > 
> > > > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> > > > ---
> > > > Resent due to infradead.org mailing list issues.
> > > > 
> > > >  arch/riscv/Makefile | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > > index fb6e37db836d..cd3720bc45e8 100644
> > > > --- a/arch/riscv/Makefile
> > > > +++ b/arch/riscv/Makefile
> > > > @@ -44,7 +44,9 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> > > >  KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
> > > >  KBUILD_AFLAGS += -march=$(riscv-march-y)
> > > > 
> > > > +ifndef CONFIG_CC_IS_CLANG
> > > >  KBUILD_CFLAGS += -mno-save-restore
> > > > +endif
> > > >  KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
> > > > 
> > > >  ifeq ($(CONFIG_CMODEL_MEDLOW),y)
> > > 
> > > Thanks, this one didn't make it the first time.  Is there a reason we can't use
> > > cc-option here?  IIRC that's what we use for the other compiler options that
> > > may be unimplemented, and it has the advantage of avoiding encoding specific
> > > compilers into the build system.
> > 
> > Thanks for the hint. I don't know how I could've overlooked cc-option.
> > Will send a v2 using cc-option.
> 
> Looks like it's a bit more complicated:
> 
> Using just cc-option still leads to the warning being emitted, so I
> think the CONFIG_CC_IS_CLANG check is still needed (checked using clang

Shouldnt cc-option be fixed instead? The warning effectively means the option
is not supported, so why should cc-option pretend it is?

-- 
Jerome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
