Return-Path: <SRS0=/4Rd=NY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30526C432BE
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Sep 2021 05:38:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEF3E60238
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Sep 2021 05:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEF3E60238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVoESlXqzBy5et2NOfi1KzZKNIMp4E0MxHSxHBLTn/E=; b=aH/ff8RrykpQ7P
	fxxuJapc5BkKzfItwNqiO8re6YeLlvFCMl6vxZbd4l91jmosJqatDQC2OKhpybLOU2deAXWs+jovC
	AaJ+7Z313RUqbtbqZDTi5Va0g2efHzv3+YY9iHj93sDOpgRSGBf7iorw7ID5A4wz4DAcSdeYWRvKE
	s5SEwVMWo1BChbNpHnTQhzlXMKZiVJbSWVoe6XBnKEF5YoCv+orUS2CRT9Tz7m5zx3HMrVKHqx+UM
	alq40A1ijm+5RwIWck4D0GzBmYib1J/cVhbY2EHV52ClMgC8V5bNeleirjFUu3LkI+HqI75l1Q/Yd
	SBPH4DfiaxBjOMRFvO3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLfQM-008Zgo-E7; Thu, 02 Sep 2021 05:38:06 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLfQJ-008Zfc-2k
 for linux-riscv@lists.infradead.org; Thu, 02 Sep 2021 05:38:04 +0000
Received: by mail-wr1-x42b.google.com with SMTP id z4so878468wrr.6
 for <linux-riscv@lists.infradead.org>; Wed, 01 Sep 2021 22:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gWV9bLG/2yXnxhGxXYYM9ItVns0zZK7AGnCy4qIXCSc=;
 b=wS+RIKCKV2QUWDiVvVyaN+rSuO+rDjBROwlgxCzHSX8Hm6YowtBE3WZ08yT1eb0H4t
 mJX1/cwHzNdSy7jYHD4Dj18Ze4ssMXzv3GXqfhX4YguDQVLWenVhw60tFGGUVWvEEaMe
 rv/faXMpuPuWn1gdVcuFnWSXZ4wSxHKlMGtA8i9QW3VXnB8msMu7Kn3HFp5CstDFD0p5
 00r+yUn+g2rK3WzH69ou9SxBzsHAS82CNBDLxTeOHEDLEfkaAP/HG0kptP8elqeACAKV
 7CqEm9rQlYjjIZto5gJVQUUG0vfHY5iS0Nb5pYVzYsiQ9VxnutHX0DcM9BN2ZWfDjD/d
 gzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gWV9bLG/2yXnxhGxXYYM9ItVns0zZK7AGnCy4qIXCSc=;
 b=gNqsFk973ol8WkKVYtOSaxwJM2KIKrmTWfsAhaVU1x9+u1uTHn0cJBZNREdluQlpJl
 +iyfuVkh6BN/rHLfVWgMluDWI0/nn5V5MmtA4KNPxzWeOD1fZXFzmA+CCKFb4E96skrN
 kXRz8CMU/hgCNYtAiOU6tcylDf9oTDngDmXzM1aosz0L6ekbzMMo/ICHmLo9vR0Nh/4O
 hP9ekVocwkES9qlj93u3BoARPLcA1MPBxvrDXBRG45zyLna0DvN4bmguByAzhZxt1XKL
 VgDqRueUlsfHkCkNSUof4lWqkuN+h12BE+IAWhkVFqiZW2Mlx2H3Zn+VIkROoVCv40y0
 0+Vw==
X-Gm-Message-State: AOAM530Zjx0y6uSB+HgmhdlXKodzvUlHo0Nuj4MASPBRWknHIlCZmwUt
 WcHzolWid0bGa15kcI9CBPQpan41WRhhXVxuTKmUjQ==
X-Google-Smtp-Source: ABdhPJwOM1D55l6+NkGI52QGARqgqsCy0uArZ5990xPenEDFN+7yWV8AdcF3BU+g5/6zok2iR7fN9N5Pq54RtuA6e1U=
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr1517203wrw.390.1630561080772; 
 Wed, 01 Sep 2021 22:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210830041729.237252-1-anup.patel@wdc.com>
 <20210830041729.237252-7-anup.patel@wdc.com>
 <YS7Xk/Np2yc1/wrb@robh.at.kernel.org>
 <CAAhSdy2e8bPXkTodpbtNeEVX-iCxVeyNLYBkL0aCQBZ7wbSCzw@mail.gmail.com>
 <CAL_JsqJ_Uc5UqCFojUYioXYJycbcBCF-nGryJiTMkhkN5MJhpw@mail.gmail.com>
In-Reply-To: <CAL_JsqJ_Uc5UqCFojUYioXYJycbcBCF-nGryJiTMkhkN5MJhpw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Sep 2021 11:07:49 +0530
Message-ID: <CAAhSdy1A-2oPVfWioqc7JDsRTHEgwMNR5zuVg-O-X0K86-7Exg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 06/11] dt-bindings: timer: Update SiFive CLINT
 bindings for IPI support
To: Rob Herring <robh@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_223803_236335_4CE28DB0 
X-CRM114-Status: GOOD (  24.09  )
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

On Thu, Sep 2, 2021 at 5:48 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 1, 2021 at 7:00 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Wed, Sep 1, 2021 at 6:59 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Mon, Aug 30, 2021 at 09:47:24AM +0530, Anup Patel wrote:
> > > > The Linux RISC-V now treats IPIs as regular per-CPU IRQs. This means
> > > > we have to create a IPI interrupt domain to use CLINT IPI functionality
> > > > hence requiring a "interrupt-controller" and "#interrupt-cells" DT
> > > > property in CLINT DT nodes.
> > > >
> > > > Impact of this CLINT DT bindings change only affects Linux RISC-V
> > > > NoMMU kernel and has no effect of existing M-mode runtime firmwares
> > > > (i.e. OpenSBI).
> > >
> > > It appears to me you should fix Linux to not need these 2 useless
> > > properties. I say useless because #interrupt-cells being 0 is pretty
> > > useless.
> >
> > Linux IRQCHIP framework only probes IRQCHIP DT nodes which
> > have "interrupt-controller" DT property.
>
> Right, I believe I wrote that... So what would it look like to fix
> that? The simplest thing is just drop the check for
> 'interrupt-controller'. That's just a sanity check and we have other
> ways to do that now (schemas). Do you need this early? You can always
> implement your own initcall.

Okay, let me first try to fix this in the driver itself. Most likely,
we will not
require changes in this DT binding.

>
>
> > The "interrupt-cells" DT property
> > can be removed because as an interrupt controller SiFive CLINT
> > will only provide IPIs to arch code.
>
> The schema will disagree.

Okay.

>
> Rob

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
