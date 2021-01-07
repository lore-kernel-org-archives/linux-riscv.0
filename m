Return-Path: <SRS0=n1sQ=GK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133C6C433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 19:22:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A427923444
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 19:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A427923444
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VktdiuwpNG+/KzX1aZ4kosUM01lOQoq/O2+jQUEMU/M=; b=kATPjWkEohKLbKENu/EfrVbr6
	vGGsCAwB/8q4WGPik30JlBj7UtKbsWe2mg7bYzIoAQrCxZVvjUcdmKkIwlGjNaR8CfRLc6T7cOkJh
	zUiQ7jGBkW9zNBF8ggIaUuTA41gqi02yimizxGMagVQXFEVD49qP/+wvy347uvIeFUn8sA2a0VzGQ
	lUa3Jp1TORFLMVGT7pCRPLSoGzEZt4jhA8NdlG1DP6+C0U83Fu2VJlCJJvfzezEXT/e++qguSTTxF
	U/eEDxtZf1S504ih0hXlk02n7svn4ZRUxMFNmQRDg+ZoAPXpyvEZqc3MzsuH7TvR5TNa3UGh0mGHv
	CYluKt45A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxarW-0001W6-EV; Thu, 07 Jan 2021 19:22:22 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxar8-0001VI-Pw
 for linux-riscv@lists.infradead.org; Thu, 07 Jan 2021 19:21:59 +0000
Received: by mail-il1-x12d.google.com with SMTP id n9so7870169ili.0
 for <linux-riscv@lists.infradead.org>; Thu, 07 Jan 2021 11:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LMmtmUjaLK/oDzSRX4xY8K8bKTjtoJFYEpkuZNYnKbQ=;
 b=ksz//DOqHNryrTsAi7EMMvOGgDzeULjdCyZ3SbRAeA5SnTu43DmAClxdZ0xV1w7zds
 4XFVyrrtuIukc7yMVDFBiT0AKZVYbOTic5nPP3aYhkvgjW1itYFXu84cYQOGhjLZHPTL
 oOzl5wk9VTu27v/FCPJEjnAMkqEENPk9YWJps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LMmtmUjaLK/oDzSRX4xY8K8bKTjtoJFYEpkuZNYnKbQ=;
 b=Nt74MWJ1LS7OnaZjaus353L+FIQELZHEdxmfGE23tyBBn3oU8euCCSp0Nygn0DH72Y
 wy8wkqQYXa8zRBokfb2eEANCJnC8Fnhe1de14Odn4h/tKB6J7OLa5II83gW3WRlFgio+
 R+8Lz8iIris7QWVatcgCqUF6MSmG1s7XZ9CygMrCe2md7j8jqoYsCimYsNigdGUSGgU9
 a65bvCy+vYXXKFq3M7UUHsxyj2kS/I40051jeCfE2YbtFj+BJf5fU2749n5xu3zAbfME
 0ZplUm8UUS9NqIkc39syhox3BPN96PGdixwoJI5nWrAcAF/gFxSRR3cntK77rcchl7nM
 DkYw==
X-Gm-Message-State: AOAM531zVLK/chbS/2ZYHkXPQ8m8h2+c8oE0nkbXdpkWWUPQ87VjmggB
 MULc0p5X4XVM0o46+Sk17CvjfD/U5JXpNHSaDdVz
X-Google-Smtp-Source: ABdhPJwOVkAYu414Omcy7kfayKuKewrcr2YcJxv0GFvSThHdqUxeL+ide93PZe552keZuBX+rkRMgj7/mT1PeJLzyAY=
X-Received: by 2002:a92:204:: with SMTP id 4mr381598ilc.79.1610047311610; Thu,
 07 Jan 2021 11:21:51 -0800 (PST)
MIME-Version: 1.0
References: <20201204085835.2406541-1-atish.patra@wdc.com>
 <20201204085835.2406541-2-atish.patra@wdc.com>
 <4655c810-e406-f807-d2dc-1b2e0198d945@microchip.com>
In-Reply-To: <4655c810-e406-f807-d2dc-1b2e0198d945@microchip.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 7 Jan 2021 11:21:40 -0800
Message-ID: <CAOnJCUKMNzzk-RxxGJQCqS_9HjdZnOFSDu1FG_oWeKh6Jzq+sA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] RISC-V: Add Microchip PolarFire SoC kconfig option
To: Cyril.Jean@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_142158_953039_E01EF06F 
X-CRM114-Status: GOOD (  19.53  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Anup Patel <anup.patel@wdc.com>,
 Daire McNamara <Daire.McNamara@microchip.com>,
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Conor.Dooley@microchip.com,
 Rob Herring <robh+dt@kernel.org>, Ivan.Griffin@microchip.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 7, 2021 at 3:40 AM <Cyril.Jean@microchip.com> wrote:
>
> Hi Atish,
>
> On 12/4/20 8:58 AM, Atish Patra wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Add Microchip PolarFire kconfig option which selects SoC specific
> > and common drivers that is required for this SoC.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Reviewed-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > ---
> >   arch/riscv/Kconfig.socs | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 8a55f6156661..148ab095966b 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -1,5 +1,12 @@
> >   menu "SoC selection"
> >
> > +config SOC_MICROCHIP_POLARFIRE
> > +       bool "Microchip PolarFire SoCs"
> > +       select MCHP_CLK_PFSOC
> Can you change MCHP_CLK_PFSOC to MCHP_CLK_MPFS to align with the v2
> clock driver?

Sure. Will do that.

> > +       select SIFIVE_PLIC
> > +       help
> > +         This enables support for Microchip PolarFire SoC platforms.
> > +
> >   config SOC_SIFIVE
> >          bool "SiFive SoCs"
> >          select SERIAL_SIFIVE if TTY
> > --
> > 2.25.1
> >
> Regards,
>
> Cyril.
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
