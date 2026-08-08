Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCEFC55174
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 13:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CuUNG4km9KCqSW9nGzey2tR+K/wHeA0+SBCmHbtCf84=; b=lKfX2pLWPuZQ7V
	ENPvsR1LthEBFuU5UHhz3Q88TNu4PmcZvJcVVtnfRyILmO9dtW+Jh96hdOu0OOCEaoMurq9HV8ng3
	a7ltDiNEJ/tgQ0OG8wVmAeoMXAEWe6CiNnA6qNwrmcdvrs/cn1wBo8yek2ViKODbNRP4IFbCQiheO
	H+gEqN6msrUZa+SW5N0Lczwfm/6miDDB+EtYcCsxJi28HoND3xPRW4extSiehrpdopxINvhkQr5Ns
	5nPur1rjkzUEgJeNw78B5qRLsRTY/3ZvcEEBrT1JeyvnVYpWz+BaTSg+h4f96dT2IVH7dkCsfmsNV
	P1shqBDXGqDkF9iRk/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsh01-00000009OgP-2Qra;
	Sat, 08 Aug 2026 13:22:05 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsgzy-00000009Ofd-33bk
	for linux-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 13:22:04 +0000
Received: by mail-pj2-x0a.google.com with SMTP id 98e67ed59e1d1-38dc4f9462cso263046a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 08 Aug 2026 06:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786195322; x=1786800122; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=li/c4+/312t4GgA151ifIixBtg8Isry/It3D3W9Em4A=;
        b=Zk6iBzD1+UtWy+n5HTeQCPn9oDCVKvBirzMQUDJqB1ryf8dfX+V06Zr20qJjPlAWWr
         VP5WJtuSmi2EaOWpH0NS0bRrt3yrk1Q1rwLq2xL1FraTmWttVKETOr6vbUd12whS7Fp0
         eZv2g6e/eBNgVC1jACnMVKWv7mZOTFzdXW6FENXwdv4gjObBL6uLyZbK4w5yDijt4+pu
         CAQ81cFeNqKJbucNvir4dBcO3E0215p4F6lxI7IgrvoLcZQnlc+eY476CGWcZOq/KhwE
         6SXGuKGQkpvZ59tOUNnkVgEh1WUwJ/mzgB6EeVJ17LMzzNkZLbS4YKDGLt6LpRiqW27F
         MQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786195322; x=1786800122;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=li/c4+/312t4GgA151ifIixBtg8Isry/It3D3W9Em4A=;
        b=Y1yr/Ire5Skl9L+ctCf25Ft6FGsl+rL7QXXp8SXLb1ZOwFzaFCdDRyNTzku7ayX4HY
         0yueXkvEfiJOMYAMCvVlUoO1RiuY4FFvs1AttBvPwPgBVCcL7+Y0bXiNC/Ljdx+KG+R+
         r6h6CwWedlKtmmx3mz7mkO+/Oz69CS5sg+3Vjl/skUJsPtgQdah5EtxlJtMbyX1MvKSR
         ND1VuaNoNXyej1UFq6JyX13Wk4UNJNOd/zbyLnpNOU3YWPJ7MeDMspDQWFY/wrWnpd3A
         aRULCcFDnLhQKa4GfL+KQwQvuMOy7ZVKsq2oYz/NiFlh27ijogQ5iTFOXXsO0GrnhEIZ
         CxuA==
X-Forwarded-Encrypted: i=1; AHgh+RoeaHu/kLL8HtJjLeCccwv7j1aB5yYYSmuqv8wUTYp3qhUi4FF15MbQPrZ/pLzVNt2lCKotACwvcRTB6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdO0CpUZhgGOJDvshvirhYGXq4xib0GWCTApX6RefvuOLcrujq
	wdA8PQ9xKP9HiDWgmJ8qqjmetDTABgaxhKSgSjpAN+hiq/AuNszsEkUFssoZzMl+o7CyMQ==
X-Gm-Gg: AR+sD10I93r8rTQ/eotzbgHIH39HMQHa1iBDAYyAeX4crfaZ6LLFRzcTokgBrizcDti
	AQa3XJckWVYNPK/3f6pFVRrT8NhpRS9xAqCTdS78xA64/dIGK9trTT4qZzyGVBjqIhpxE76ujHW
	UcZU/UUws3WxsOEDhroSl4HkQI+emJjC6ziRohuEsNBpRaOspzHIVUuzZME9bFy/znSto31S/I3
	OJEXQi3zXS+4yPRWnS73ymbDZz1HhW96+e1tA8Ci756hmKrE4RbK8xFEM393OkMF5xiTjG+Ihco
	CC6KYLFYZasLV2kolKMEcy5+DBzrWYXtmHiSA72hsawxOKxWUPrtgJZZDBqk9k7OPNLM180I0OF
	lBzlDNyxJZ10yR6Zo39jYrTwR1yzydxZ8KJSeZRYU8m9eeX+2KH+OXFVPRNSgnz456HCappCy09
	TCxYj1P3jRzQxloaES+mQKio6p7jqWYWOvIjVxgVo=
X-Received: by 2002:a17:90b:17c5:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-3903b9f3ee3mr28104214a91.0.1786195321821;
        Sat, 08 Aug 2026 06:22:01 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b343e662sm2307387a91.2.2026.08.08.06.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 06:22:01 -0700 (PDT)
Date: Sat, 08 Aug 2026 21:21:57 +0800
Message-ID: <c73cc405df108dd7c3c5da95a1f8cddc.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 10/17] drm/spacemit: add Saturn DPU KMS pipeline
In-Reply-To: <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-10-6de34d80e86c@gmail.com>
 <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_062203_119995_387121BE 
X-CRM114-Status: GOOD (  22.03  )
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

Hi Philipp,

On Mon, 27 Jul 2026 09:35:38 +0200, Philipp Zabel wrote:
> On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
> > From: Cody Kang <codykang.hk@gmail.com>
> >
> > Add the atomic KMS implementation on top of the hardware backend: one
> > CRTC and one primary plane per DPU instance. atomic_check validates
> > the plane rectangle 1:1 against the mode and sizes the per-channel FBC
> > line buffer; atomic commit builds the cmdlist batches, maps the
> > framebuffer through the DMMU and arms the cfg-ready handshake, with
> > vblank events driven from the DPU interrupt.
> >
> > Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> > ---
> >  drivers/gpu/drm/spacemit/spacemit_crtc.c   | 815 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_planes.c | 376 +++++++++++++
> >  2 files changed, 1191 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/spacemit/spacemit_crtc.c b/drivers/gpu/drm/spacemit/spacemit_crtc.c
> > new file mode 100644
> > index 000000000000..b75ff6320501
> > --- /dev/null
> > +++ b/drivers/gpu/drm/spacemit/spacemit_crtc.c
> > @@ -0,0 +1,815 @@
> [...]
> > +/*
> > + * The assert and deassert orders are not mirror images: the hardware wants
> > + * these.
> > + */
> > +static void dpu_reset_assert(struct device *dev, const char *name,
> > +			     struct reset_control *rstc)
> > +{
> > +	int ret = reset_control_assert(rstc);
> > +
> > +	if (ret)
> > +		dev_warn(dev, "failed to assert %s reset: %d\n", name, ret);
> > +}
> > +
> > +static void dpu_reset_deassert(struct device *dev, const char *name,
> > +			       struct reset_control *rstc)
> > +{
> > +	int ret = reset_control_deassert(rstc);
> > +
> > +	if (ret)
> > +		dev_warn(dev, "failed to deassert %s reset: %d\n", name, ret);
> > +}
> > +
> > +static int dpu_pm_suspend(struct device *dev)
> > +{
> > +	struct spacemit_drm_private *priv = dev_get_drvdata(dev);
> > +	struct spacemit_crtc *a_crtc = priv->a_crtc;
> > +
> > +	/*
> > +	 * Assert before gating: a reset asserted into an already-gated block
> > +	 * has no clock edges to propagate on and leaves the register file
> > +	 * untouched.
> > +	 */
> > +	dpu_reset_assert(dev, "lcd", a_crtc->lcd_reset);
> > +	dpu_reset_assert(dev, "esc", a_crtc->esc_reset);
> > +	dpu_reset_assert(dev, "mclk", a_crtc->mclk_reset);
>
> It looks like these three are mirrored, and could be handled by
> reset_control_bulk_assert/deassert().

Thanks for the review. Indeed, reset_control_bulk_deassert()
walking the array in reverse gives exactly the mirrored order the
hardware wants. Will fix in v2.

Cody

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
