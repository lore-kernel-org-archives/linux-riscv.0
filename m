Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B25EC55174
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ge6gbxZsf0zL1nM73tCP1ghG9Q1DSSi2Ssy31c+cc4s=; b=dsvqiJqvl2eApc
	hyQJBj/3AwYFROMQMpzWOHn46FSZXj+xyjok4sY4XvJilpajuJUOYSXvliayqlUbczTZCe9j+1BXh
	Xiwu/FW0Trdcxjalt1OIVgEw6oHQL62IVOFeoAvmJ19Z7jOMja6lFnc2cRsWmWnJ284zrzR78I8kl
	at3Cj+TzOWfRoHLhmVfrh9rI0P//9JTem56KkMm23RsFfaDL3uuF+c5l6FpJaJYoPnnLTsMksOROK
	FJsGu9Z5psJR1RA89mipz5UMUjjxi8iKeyc2+kaOrBk6FTw2eVJUr1deY3FJp43L5vYJDJl9PSbgs
	4XaDUnj8Vj/O0XRpOPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsglr-00000009NGG-19n8;
	Sat, 08 Aug 2026 13:07:27 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsglo-00000009NFX-2vPS
	for linux-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 13:07:25 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-380feaa05dcso258429a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 08 Aug 2026 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786194443; x=1786799243; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=izR+Nrw48bEezTRpqIz/ECOoUps8WA+iQCICJD/Q9lE=;
        b=JGNcK7spc6tThxPVwyEJTxS3zObzf/wC2VLULTCl8gJrfiEu4Qm5qMUbIOxK6IIuMj
         LwbNGSJ3TpToSr7Csw/4TkkY3FOWgctySGAhLJXPWPcrE2AlCtm80J9mPqrWmbsNbrGm
         zaQtTOlBSJ1a4YURP+LJYxyQ3H6PPmkMZy5YaNBKQQhJKiWKOokLL5DuQDbyuLOsTsCO
         aDxHN8wBAQs8PdYmafDaBiENnEKkEaeVXBMflYbHpgvzNLzwzGyy1QJ5ElsiQrk4vQpA
         VedaPq+Stnk9YxGP7qeBzaEzHd7/Qmbfd2pZS07sX6hgrwbZsMkVhiMaSViTSGxQVCn+
         EQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786194443; x=1786799243;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izR+Nrw48bEezTRpqIz/ECOoUps8WA+iQCICJD/Q9lE=;
        b=Wre/hwePNPDg1DKmbdCd+NCXq+vYESsp6STcX3BVSBP7Nl+Pa4yCYblI7O4m0xlHxJ
         YUtO6DPDWy8DsJ78ZUklb0TWhe6zV8cypKF4AQlVWHasGkcLmfOEs8Nc3nOhYc32Ydus
         m/X0yT8aM/PIdMkb5PR3lLPjy4bnnIj3BQIP0eA/tSADHl9mBJzPKqm+Hx2FypzNqaIB
         l2eXBaF9qkceK4dUM/6SgnUsd6Lvr5UKuWi4JkbaNi2S+r7BrSUsHypfT0eaoAQEzdR7
         aA1NwkMPglt3QQo/JBMaxWA7ITbeDL2Ze4DwDOCTIOkhOniOTcACAnjm/03fKKVoCwLm
         0J7g==
X-Forwarded-Encrypted: i=1; AHgh+Rrs8dQuzbLokQ3mZ6QLC51Y3Xh5d26COOZF43B/BzSkNcT0HGE8YOQAgTFd16SJtuaXqehjL4J/B3C4xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJKNHNeF3+mLt2LwhyA8HahEyDjk8lyNtq/smOaPrGRcSMNgzt
	vyTrS1J9YSSC2StVEgIAulDL7n0Ip6EXwSfNgQWNL/BFjXkXqKyUS+8ZkyQdrZ5s4wz9BQ==
X-Gm-Gg: AR+sD13iFJV1z832bHhY2dHO4OSStaRtKTfpzLzuquz/TPsTjU0ZDjW0Nk3D7q2vfJ0
	xY1wBMoxImxNO29PXXUNWkrbnliBc6RFjqxUazqvsx3lbn+g99spTknDnhQbK4Hmr+dKnspz2J2
	4Crj093TJv3yeF+wZWMqDfaJmOIhIfDURczdvOlCLl7hHyXl2XD7uHP2h1cHKfitvusu5/O7/nr
	Qh05dOGpp5qomi8iy1M/5VUktw5MJvA9qI/gFt6u1qsxNHRTsBzkB1LXL5JtX7Dho2ZktZKxq8u
	qDDl1tw/xPKLI7g2ePJkXET4PNO7p5jicCTqOlRicAywy2D7wZpybN12Db/qIl12e3XR9sAkgqi
	CjYDVDmi9ad8EQz1qC4oYrxYDu+DNj5q4crtBGneaywA6RzOOE7b9qVBV8ed254fZISUpTm0wKd
	XJb0r6XDRuv3TyU2j7FroNeJrVeoWFudvXIhzbm0w=
X-Received: by 2002:a17:90b:1811:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-3903bb0ab77mr26378580a91.0.1786194443454;
        Sat, 08 Aug 2026 06:07:23 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm6117441a91.2.2026.08.08.06.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 06:07:22 -0700 (PDT)
Date: Sat, 08 Aug 2026 21:07:20 +0800
Message-ID: <c8634d5b486e8d9eaa1a46aedb853438.codykang.hk@gmail.com>
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
Subject: Re: [PATCH RESEND 08/17] drm/spacemit: add Saturn DPU core types,
 cmdlist and display MMU
In-Reply-To: <3d4204dbd1c73d50193144d1944d8237c625f6e3.camel@pengutronix.de>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-8-6de34d80e86c@gmail.com>
 <3d4204dbd1c73d50193144d1944d8237c625f6e3.camel@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_060724_742634_CDC21F9D 
X-CRM114-Status: GOOD (  18.03  )
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

On Mon, 27 Jul 2026 09:35:35 +0200, Philipp Zabel wrote:
> On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
> > From: Cody Kang <codykang.hk@gmail.com>
> >
> > Register programming of the Saturn DPU is batched: the driver builds
> > per-module register lists in memory and the hardware command-list
> > engine replays them at frame boundaries, while scanout buffers are
> > mapped through the DPU's private address translation unit (DMMU)
> > rather than scanned out by physical address.
> >
> > Add the shared driver types, the MMIO field accessors, the trace
> > events, the command-list builder and the DMMU table code. Some DPU
> > configuration registers are write-only, so a read-modify-write would
> > corrupt neighbouring fields; byte- and halfword-aligned fields are
> > therefore written at their native width instead.
> >
> > Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> > ---
> >  drivers/gpu/drm/spacemit/dpu/dpu_saturn.h   |  35 +++
> >  drivers/gpu/drm/spacemit/dpu/dpu_trace.h    | 350 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_cmdlist.c | 304 ++++++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_cmdlist.h | 146 ++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_crtc.h    | 259 ++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_dmmu.c    | 103 ++++++++
> >  drivers/gpu/drm/spacemit/spacemit_dmmu.h    |  40 ++++
> >  drivers/gpu/drm/spacemit/spacemit_dpu_reg.h | 108 +++++++++
> >  drivers/gpu/drm/spacemit/spacemit_drm.h     |  68 ++++++
> >  9 files changed, 1413 insertions(+)
> >
> [...]
> > diff --git a/drivers/gpu/drm/spacemit/spacemit_cmdlist.h b/drivers/gpu/drm/spacemit/spacemit_cmdlist.h
> > new file mode 100644
> > index 000000000000..d5acdbeb3b0e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/spacemit/spacemit_cmdlist.h
> > @@ -0,0 +1,146 @@
> [...]
> > +struct spacemit_crtc {
> > +	struct device *dev;
> > +	struct drm_crtc crtc;
> > +	const struct dpu_core_ops *core;
> > +	struct dpu_mmu_tbl mmu_tbl;
> > +	int dev_id;
> > +	int irq_online;
> > +	struct timer_list cfg_rdy_timer;
> > +
> > +	bool is_1st_f;
> > +	bool first_modeset;
> > +	struct dpu_clk_context clk_ctx;
> > +	u32 aclk;
> > +	u32 out_format;
> > +
> > +	struct reset_control *mclk_reset;
> > +	struct reset_control *lcd_reset;
> > +	struct reset_control *esc_reset;
> > +	struct reset_control *aclk_reset;
> > +	struct reset_control *dsc_reset;
>
> Why are these duplicated from spacemit_drm_private?
> dpu_pm_suspend/resume() in patch 10 have access to priv.

You are right, they are plain 1:1 copies. Will drop the five
pointers from struct spacemit_crtc in v2; the reset sequencing in
spacemit_crtc.c and the suspend/resume paths will take them from
spacemit_drm_private instead.

Thanks for the review.

Cody

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
