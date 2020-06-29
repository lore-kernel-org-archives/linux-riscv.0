Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C32C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 04:38:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89F4B20702
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 04:38:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AfAhzdH/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="DbOoHUOm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89F4B20702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xP3e5TI9QhaQjUpND7WBx2WZ8938mC21BQJ7rZoBRhY=; b=AfAhzdH/jkApVRsA3KmeQy4lw
	mTPb+mV78Y63x5LyTtU+6at9WC7TQ4Gdqp/t2qHmUnpLSkbCHn0nNr0BM1aWx0vX34JGqqwTftilq
	Lg3b5mIFiM7TLUGy0INXKSrlaD4gTYk/RFo5wm4ruOOb6JLKJM0DgunLObCHCIvLBZCCwkc0ubVYb
	WWZtjkfCJw/5KL21Lid8LmpLtWV/JWkgjUi8g6ZbRqEzaT/LHz98qihLmdXkB3iA1rF+qDezWqvg7
	3thHthFW/fTE7iqaaqunZOImee963If0uyyW2lmy0k7FCTlHZTKU1L//9CRDjXME3w3nlUT7Qx4sr
	fTvAZehlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jplYd-0004yH-CG; Mon, 29 Jun 2020 04:38:15 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jplYa-0004y2-Uh
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 04:38:13 +0000
Received: by mail-wr1-x442.google.com with SMTP id f18so7056192wrs.0
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 21:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w5TN/E+I/toiXQHven0Tzugxh2KMUYh+rGvqZtXPFqc=;
 b=DbOoHUOmfQBZBfBNFane+FwAaHv/bwA4VJs02OP7/NQNzlgmAGGz8UAXpjyqJYWkWO
 lm3GQYeLEBYB3MeEeqbQ8mIgKzaeoKai8O7tfiiBvcCtspXG+x/4tAOj78h5r6vHLvJi
 yWpC08Obs+4iBuqHftKl3Bn3SfBNIuigiw29OI0yJdgRBhoTj+or98IuAdcphVqfYb3m
 HGv2tyNo26cQpy9n3zw2l/Zt7w/Z/D9LFKvVh10U+JkrO8gIm2hm18bn7L1OyF4/x29E
 2bMCmsg58kYdvLQ7G4AexzjVTQyP9usYuuFQhVnufbsrxs7ANsbczV299xhg5jKhi7hE
 o2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w5TN/E+I/toiXQHven0Tzugxh2KMUYh+rGvqZtXPFqc=;
 b=RBbNApSU1+DnbtuKuzrAv0XzJKn3UQqAoEKxn4B44KJ2EwrUC9FOtScz5WpcKOYbs5
 aq29eO5NKjddj+Zrl2yosffzcg6Fy0ac+RLhvycc6CD/mvvTLSNSAtP91gZw6qPswPYX
 r9C3ngz1Orj1VOie3GuihuXPrwZaywjtSETd3go3m+YqOBmxuMxVr40AB8o0O5m2t/42
 2qAtHn4u0gvILESfQG4N+mLyTvCV2ewIViK8IRrB4i3Iqov+Y0hlg59MCLUAMM7u0JYL
 LK3W1DUVt0d2ra7D1ASfHa28pKT535YQe3Bh53w0CEE0USXeiEj2m4P3vaOoTfsQ31oD
 qjhQ==
X-Gm-Message-State: AOAM531xn8NK43yLF0HnIVsKG5Sh+GRSUU8LHbjNkREt7RM8KbBgleOq
 INu3yGPO3MWz9c3o/iutOL09C4Z7o8ZelxrFMzRK+g==
X-Google-Smtp-Source: ABdhPJy4WGmlk07GX6E9BZevxe5hBGPhKL9rkFE7Ij8SPwuxHaxD6xGk7gGNB8l0qXzYGYzsZnvtJDPKE2OVK9ewiCA=
X-Received: by 2002:a5d:4107:: with SMTP id l7mr15738900wrp.144.1593405491943; 
 Sun, 28 Jun 2020 21:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593397455.git.zong.li@sifive.com>
 <3de3a480517d167a3faae086aa8ab0c0c7141d99.1593397455.git.zong.li@sifive.com>
 <CAAhSdy3VBUTMg_b2tO12cTYuvHYtH=4dj9-qT-at35Whf3w_7w@mail.gmail.com>
 <CANXhq0pV87oSzyAt80ySoXGRXp26bCnahPW0r27J+wjj5yc=nw@mail.gmail.com>
In-Reply-To: <CANXhq0pV87oSzyAt80ySoXGRXp26bCnahPW0r27J+wjj5yc=nw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Jun 2020 10:07:57 +0530
Message-ID: <CAAhSdy3BUfPCS+LUWp9GKdnf960N-UkxtUtRArgkVd-1cGZxhQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] dt-bindings: riscv: Add YAML documentation for PMU
To: Zong Li <zong.li@sifive.com>
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 29, 2020 at 9:58 AM Zong Li <zong.li@sifive.com> wrote:
>
> On Mon, Jun 29, 2020 at 12:09 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Jun 29, 2020 at 8:49 AM Zong Li <zong.li@sifive.com> wrote:
> > >
> > > Add device tree bindings for performance monitor unit. And it passes the
> > > dt_binding_check verification.
> > >
> > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > > ---
> > >  .../devicetree/bindings/riscv/pmu.yaml        | 59 +++++++++++++++++++
> > >  1 file changed, 59 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/pmu.yaml b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > new file mode 100644
> > > index 000000000000..f55ccbc6c685
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > @@ -0,0 +1,59 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/riscv/pmu.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: RISC-V Performance Monitor Units
> > > +
> > > +maintainers:
> > > +  - Zong Li <zong.li@sifive.com>
> > > +  - Paul Walmsley <paul.walmsley@sifive.com>
> > > +  - Palmer Dabbelt <palmer@dabbelt.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: riscv,pmu
> > > +
> > > +  riscv,width-base-cntr:
> > > +    description: The width of cycle and instret CSRs.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +
> > > +  riscv,width-event-cntr:
> > > +    description: The width of hpmcounter CSRs.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> >
> > The terms "base" and "event" is confusing because
> > we only have counters with no interrupt associated with it.
> >
> > The RISC-V spec defines 3 counters and rest are all
> > implementation specific counters.
>
> As I know, there are 2 counters of spec definition: cycle and instret.
> What is the 3rd counter you mentioned?

TIME is a counter CSR.

>
> >
> > I suggest using the terms "spec counters" and "impl counters"
> > instead of "base counters" and "event counters".
>
> OK, they are good to me. Let me change it.
>
>
> >
> > Further, "riscv,width" properties are redundant because
> > RISC-V spec clearly tells that counters are 64bit for both
> > RV32 and RV64.
> >
> > > +
> > > +  riscv,n-event-cntr:
> > > +    description: The number of hpmcounter CSRs.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +
> > > +  riscv,hw-event-map:
> > > +    description: The mapping of generic hardware events. Default is no mapping.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +
> > > +  riscv,hw-cache-event-map:
> > > +    description: The mapping of generic hardware cache events.
> > > +      Default is no mapping.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +
> > > +required:
> > > +  - compatible
> > > +  - riscv,width-base-cntr
> > > +  - riscv,width-event-cntr
> > > +  - riscv,n-event-cntr
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    pmu {
> > > +      compatible = "riscv,pmu";
> > > +      riscv,width-base-cntr = <64>;
> > > +      riscv,width-event-cntr = <40>;
> > > +      riscv,n-event-cntr = <2>;
> > > +      riscv,hw-event-map = <0x0 0x0 0x1 0x1 0x3 0x0202 0x4 0x4000>;
> > > +      riscv,hw-cache-event-map = <0x010201 0x0102 0x010204 0x0802>;
> > > +    };
> > > +
> > > +...
> > > --
> > > 2.27.0
> > >
> >
> > Regards,
> > Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
