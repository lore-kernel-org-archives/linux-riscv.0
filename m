Return-Path: <SRS0=1V8E=AI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840AEC433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 05:40:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EDDA2081A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 05:40:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LeT5BzrX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="RnnpAQbj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EDDA2081A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pY0Ts4axn89TFflZiWbZVqcMIRl4jEVkhRgttu+IEJI=; b=LeT5BzrX0YzaXCSIwn5Aeh18K
	npcReLPJMs0khYE0q3zHFBshv3LO3y/KFfy8Zb6YJm0kWAG750sLFnO6qAzWx687lsxSqHUticclq
	mNVg8DxTPLpbVTWv2J8jJBmzqV1Pu6fMtCruwvoyHocQOudn8GkBoNXLDuBEbrpK8BxwbqCD8dzXG
	qlsL7UHyf0A4kL85XLuSYzlQVRDaCyJRHitGXuVQkrxMtT0GJmGJ89hH17yz/YdHy/XrUIpsBxxbR
	bhNBrd7nc3LjWqQ9S+SNfIc0dfQgZlKD9Kg11aOZlX59ygGQ+hrS9q9+uMRzl2tY3D+pI9YTwcJkP
	xDK503D/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp3Zw-0001j6-Es; Sat, 27 Jun 2020 05:40:40 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp3Zt-0001iu-N6
 for linux-riscv@lists.infradead.org; Sat, 27 Jun 2020 05:40:38 +0000
Received: by mail-wr1-x444.google.com with SMTP id z15so186299wrl.8
 for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2020 22:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D9XiOO31QvLzfIBv/Y4Ns3UZXurh+wrRF7dvs/mssCg=;
 b=RnnpAQbj/Mpa/ox57F0grfeSmok55pNA2xC/1/gJORl72A9n5GDziltMR52wjxYXdf
 IntKHqqXLfIyuYX02vi2sUF4nnG5wUtxdg3OimEd8NhsHKip4774WSvRxG+bM833SZc3
 Lto8nKIIzMSDd9aRMXsvHsFNvhUXh2LBDR9bKlcZJjQkBuW8t2JZYVqmA0U/wXutH9Ug
 Owk+UUc39vLakId+0ZWtKfaBTJK7sOkvU/6c4kBXFhGf3iMgRZ6QyIyxaxzctT5kOclF
 Sj7MWi1KuNE7PQ74RXJT6ffRTqvjm/7kYcDuceYnVep5rXc9TqOSZFyi5S54+KLGy5fx
 DCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D9XiOO31QvLzfIBv/Y4Ns3UZXurh+wrRF7dvs/mssCg=;
 b=NBD98Us086FX4at27UNOcCwSdMpg94GA5/a22hvNLiWA0+C1u2N5fN0NDolhIXJg96
 xd2kF4U1zanfckQv3rwsuH+VmJWlJWqytBBRZf1gmLrbQX+o7UGz2svtTcqtlK/K1kBl
 8QrvQqapxLlcUy8wDffULg7xk2P3KQBMK2jrONPPzaj6vXD/mui4fh0IsZx67syFeBSW
 eSSvtGAtuPohdth980z0FsSGYLYX2hEkNXqpWrpqB4hPUTqduWc+4+7lsE6CHoytf3SO
 s+tSbo2UjG7VfE/y/OR612tz42adXjbLSGnfWrBzuvlbhYpDSFuCrTSWVzg512gk0GyS
 fquA==
X-Gm-Message-State: AOAM531ES3QXvBdpigy+tUfBhriGI35wrYFlG3xMzbjWopJkVQUsqsq7
 ZWSJz6Z7YMxgcBkRQg34aSZT8fOBY+4JDwpxyeJWVQ==
X-Google-Smtp-Source: ABdhPJzYGaVMDSBVDkfEsq5XfhXWrNh+9mApzjZGgFy0P1MaF5t8wOkck1pjn1v/fDwwrTxADnPKO0fcea9ka2nhC6c=
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr6887951wrr.325.1593236433382; 
 Fri, 26 Jun 2020 22:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <c0e9e625-daf8-b72f-2237-06018ff5d8a0@gmail.com>
 <mhng-0995a264-b39c-4790-9aa5-b8c598b43ffd@palmerdabbelt-glaptop1>
 <20200528231803.GA847232@bogus>
In-Reply-To: <20200528231803.GA847232@bogus>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 27 Jun 2020 11:10:21 +0530
Message-ID: <CAAhSdy0J2MKR+WMp=sXJ6TaWd2TLLQoKJ5kr_XWUV6UowyJM8w@mail.gmail.com>
Subject: Re: [PATCH 5/5] dt-bindings: timer: Add CLINT bindings
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Sean Anderson <seanga2@gmail.com>, Atish Patra <Atish.Patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 29, 2020 at 4:48 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, May 26, 2020 at 05:32:30PM -0700, Palmer Dabbelt wrote:
> > On Thu, 21 May 2020 23:29:36 PDT (-0700), seanga2@gmail.com wrote:
> > > On 5/22/20 1:54 AM, Anup Patel wrote:
> > > > On Fri, May 22, 2020 at 1:35 AM Sean Anderson <seanga2@gmail.com> wrote:
> > > > >
> > > > > On 5/21/20 9:45 AM, Anup Patel wrote:
> > > > > > +Required properties:
> > > > > > +- compatible : "sifive,clint-1.0.0" and a string identifying the actual
> > > > > > +  detailed implementation in case that specific bugs need to be worked around.
> > > > >
> > > > > Should the "riscv,clint0" compatible string be documented here? This
> > > >
> > > > Yes, I forgot to add this compatible string. I will add in v2.
> > > >
> > > > > peripheral is not really specific to sifive, as it is present in most
> > > > > rocket-chip cores.
> > > >
> > > > I agree that CLINT is present in a lot of non-SiFive RISC-V SOCs and
> > > > FPGAs but this IP is only documented as part of SiFive FU540 SOC.
> > > > (Refer, https://static.dev.sifive.com/FU540-C000-v1.0.pdf)
> > > >
> > > > The RISC-V foundation should host the CLINT spec independently
> > > > under https://github.com/riscv and make CLINT spec totally open.
> > > >
> > > > For now, I have documented it just like PLIC DT bindings found at:
> > > > Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt
> > >
> > > The PLIC seems to have its own RISC-V-sponsored documentation [1] which
> > > was split off from the older privileged specs. By your logic above,
> > > should it be renamed to riscv,plic0.txt (with a corresponding change in
> > > the documented compatible strings)?
> > >
> > > [1] https://github.com/riscv/riscv-plic-spec
> >
> > Let's propose tagging that PLIC spec as v1.0.0 in the platform spec group, but
> > I don't see a reason why that wouldn't be viable.  Assuming that's all OK, we
> > can start calling this a RISC-V PLIC (in addition to a SiFive PLIC, as they'll
> > be compatible).
> >
> > > >
> > > > If RISC-V maintainers agree then I will document it as "RISC-V CLINT".
> > > >
> > > > @Palmer ?? @Paul ??
> >
> > The CLINT is a SiFive spec.  It has open source RTL so it's been implemented in
> > other designs, but it's not a RISC-V spec.  The CLIC, which is a superset of
> > the CLINT, is a RISC-V spec.  IIRC it's not finished yet (it's the fast
> > interrupts task group), but presumably we should have a "riscv,clic-2.0.0" (or
> > whatever it ends up being called) compat string to go along with the
> > specification.
>
> Whatever you all decide on, note that "sifive,<block><num>" is a SiFive
> thing (as it is documented) and <num> corresponds to tag of the IP
> implmentation (at least it is supposed to). So you can't just copy that
> with 'riscv,<block><num>' unless you have the same IP versioning
> and update the documentation.

I agree that "sifive,<block><num>" is a SiFive thingy. Unfortunately,
lot of RISC-V implementations (SiFive and non-SiFive) have DTS
generated from RTL (not part of Linux sources) where most of them
use "riscv,clint0" as compatible string for CLINT.

>
> Using a spec version is fine, but not standalone. You need
> implementation specific compatible too because no one perfectly
> implements any spec and/or there details a spec may not cover.

Sure, a generic compatible string "riscv,clint0" OR "sifive,clint-1.0.0"
along with an implementation specific compatible string sounds
good to me.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
