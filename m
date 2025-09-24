Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF9DCAC5AE
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 18:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOuUPCJ5MTPlup3Si8/9ly7QSGZ2DXxCgNAP1W2YdJ8=; b=Dv1JmsA55A4LiU
	Bk2Al3MX8tZgg9YThm4fA/cn2dAlasm/gpvFX4SEiwxVwmVE96TP9M3YrfJ7oJdngPWh+5W7jC++J
	xFJUnlEBcSnCEeLkDOOgIbaRHKvrEis4K5tFOLOQHPbmFG8Qfv7VspMWNH8kOzJAAM3Z6mkZpYwAL
	BMxEca6Pyve+KjPGRguhoBiw0RMZVWnrgS52mi3xi3SEQWE9ABjF8e5sb41/CxLD8nV/x15s8O0mp
	MLhomM5wDfW5kiBnh61YnTmV2U48GLqI8VKXVFO0a0WEl2w2LJLuFC+tW5nafv29o+hGleXbq4vyi
	TgfsuhD3/uBzWzh09R5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1U26-00000002Uzq-0xM8;
	Wed, 24 Sep 2025 18:16:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1U23-00000002Uy4-3jVP
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 18:16:01 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so103737a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 11:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758737759; x=1759342559; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JcbuWi+Io8bnFro7IRwuS3doRGB03OgebBpyHP3b0As=;
        b=Y1pzbS2jdY4d/WeQvyIGwBcLJEBpACiQENEpIDE3K21ZqqvXJ5QLFX80mRaLYDUvnm
         1dV+hlOMhg+uv9jplpL0LIn+2aEGdPhZuNY1mI0raofWaq3AmUC+UV9zu9PKGj3E8BDN
         zj/jrl1KXdzuQhtZawO5obhAyKBcsyaV0U0/bX5JpKHfNUzOyTfdsbiL3aDSX1/eD3zI
         ZKQpru3CYJ3XsHn8VjKgW7jR8LbV+iOOgC0M9cZN/cMhKiDZdk12K8fIwC13uHGs5HGA
         UrleQDUovvgHcsYFV8ZbOpWsynJvtZaAapkTlZy5P+RHcbXGAXKd/6AnskpXGQua8LzO
         3jBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758737759; x=1759342559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JcbuWi+Io8bnFro7IRwuS3doRGB03OgebBpyHP3b0As=;
        b=liktXrAsivj/AlXIzWptW2pWlkyD3r+gWTmAm9d+lAFZmUsz5NRSNIUjCsqS8F39y+
         U8QKMWJCvCoslSuaHszt6BiqqMLlP7yATZQS7UuN4gHqnZSV/cSTGIS6/Wx+tifPbDoi
         HWOktC73XnOSOnzJksJbCvbsWGz5EdAXrsPEpqa1R/tkrXYH96IPMi0G0pXGHU/pMdkT
         zcMMRmrHlapx4R6R6Ot2b+lkIROaZibw8h43m9V+BBI7QDsES/fhhLmI70Ct1T2t5vuO
         wK05UNiRGbmLzMcVJF3j3FrP19StXR39+QzYgaDwHGe2MxQqV2JBEi0J2XCxSFUe4mPw
         0G9w==
X-Forwarded-Encrypted: i=1; AJvYcCWDqCvNQIt1L9a08aiXW99+9dxVTrnRwyu2XrQVFAtIX+ruSJKE0ailaTKBceF3zFWQlH0KLBqzCiwZEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhT0P/EaRZpL/WEqvvU63crjhdDsyTCHSgYRxL9L5OIeUgFGrh
	z5LjHEHJ6ZjHiZ/+XMC7Qz2WAlsNJD/2nT9mAdNkzpk+z8mmfIXcvq4sq+YVqdbX3+yvHRRZN1g
	CPb0RD7HTDdFeYNo2F+k3nJCTZTwcnqk=
X-Gm-Gg: ASbGncvu2ORd5mmjxxzDWhihIWD2jN06GPxqUPWuIBROU747Uy17ZhZPS/fNpFPMFmu
	TiUdUKi5rLnVaIS3kkH7l6YB6Z3fo6yhg/wBVgBUjtV5CJdI3U46X9tli7Xd+6sfK0ToKHNfp/F
	PQXwGLsv61U2CC7tfriww9fOwri6Njfx94DAqq78JBFO1gN0K4p9VSYn+isNaEpow1/9fuhB3Y8
	rroSQ==
X-Google-Smtp-Source: AGHT+IHrp5tqgdua1ITAPTFT5OarXplhOLiXY7sra+HIubTWu73xvhsas1hF0kW3xyrfI+mCZzmHvrcV1fNmRv3INHM=
X-Received: by 2002:a17:90b:2786:b0:327:e59d:2cc2 with SMTP id
 98e67ed59e1d1-3342a24776cmr760319a91.10.1758737758707; Wed, 24 Sep 2025
 11:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250921083446.790374-1-uwu@icenowy.me> <20250921083446.790374-3-uwu@icenowy.me>
 <20250922204349.GA1290045-robh@kernel.org> <1ac8c72206abf9f3e0a13e1fcf44be5c605f6372.camel@icenowy.me>
 <36040a0a40311cb1e871075f0c5ad175342ed5db.camel@icenowy.me>
In-Reply-To: <36040a0a40311cb1e871075f0c5ad175342ed5db.camel@icenowy.me>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 24 Sep 2025 20:15:46 +0200
X-Gm-Features: AS18NWCvbmWm8Uh8k0eTkgon1YhYqcVgJtn1frt8RyZne-mAquU2_sGmtRcjlzM
Message-ID: <CAH9NwWdx-Ut35RvhmNsdQbC4vfm3rH1VPN7H2uDBRsmsFjZU_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: display: add verisilicon,dc
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
	Russell King <linux+etnaviv@armlinux.org.uk>, 
	moderated for non-subscribers <etnaviv@lists.freedesktop.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, 
	Yao Zi <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_111559_932398_0240CE29 
X-CRM114-Status: GOOD (  29.31  )
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

> > > > Verisilicon has a series of display controllers prefixed with DC
> > > > and
> > > > with self-identification facility like their GC series GPUs.
> > > >
> > > > Add a device tree binding for it.
> > > >
> > > > Depends on the specific DC model, it can have either one or two
> > > > display
> > > > outputs, and each display output could be set to DPI signal or
> > > > "DP"
> > > > signal (which seems to be some plain parallel bus to HDMI
> > > > controllers).
> > > >
> > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > ---
> > > > Changes in v2:
> > > > - Fixed misspelt "versilicon" in title.
> > > > - Moved minItems in clock properties to be earlier than items.
> > > > - Re-aligned multi-line clocks and resets in example.
> > > >
> > > >  .../bindings/display/verisilicon,dc.yaml      | 127
> > > > ++++++++++++++++++
> > > >  1 file changed, 127 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > > b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > > new file mode 100644
> > > > index 0000000000000..07fedc4c7cc13
> > > > --- /dev/null
> > > > +++
> > > > b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > > > @@ -0,0 +1,127 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/verisilicon,dc.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Verisilicon DC-series display controllers
> > > > +
> > > > +maintainers:
> > > > +  - Icenowy Zheng <uwu@icenowy.me>
> > > > +
> > > > +properties:
> > > > +  $nodename:
> > > > +    pattern: "^display@[0-9a-f]+$"
> > > > +
> > > > +  compatible:
> > > > +    const: verisilicon,dc
> > >
> > > This needs an SoC specific compatible. Generally licensed IP
> > > compatibles
> > > are useless because the specs aren't public and there's always
> > > integration quirks.
> >
> > This mimics the GPU IPs by the same vendor, see gpu/vivante,gc.yaml ,
> > which contain the exact same set of identification registers
> > (including
> > a "customer id" one that can differienate the same configured IP on
> > StarFive JH7110 and T-Head TH1520).
> >
> > If we can get vivante,gc to work w/o SoC specific compatible, then we
> > should be able to get verisilicon,dc to work too.
>
> Well maybe I should add etnaviv people to the recipient list, to allow
> them to tell us the magic behind vivante,gc .
>

Vivante GPUs are special because they contain registers that allow them to
be fully identified - see etnaviv_hw_identify(..).

We can read out the following information:
 - model
 - revision
 - product_id
 - customer_id
 - eco_id

This information, in combination with a hardware database (hwdb) in
kernel/userspace, is enough to support these GPUs/NPUs across
different SoC vendors.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
