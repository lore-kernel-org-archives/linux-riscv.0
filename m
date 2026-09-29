Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70125CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 21:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z67seUYpSNH4R3bWj3sAnIZjaHyy35/ILU7jxbwKn2g=; b=OcicuV35snPJmN
	RPnZjk7HWwK8Uzs+GAQYlbvjpRokL8/8UtHSuIVCt41zZEbK1epQCTE6FLUd+1b2juK/iIv7VzrYe
	BhF2arfpTMAq/54aFn/a50xQ8FqKeRJC+a8wo69cJN54ZralgFuV4mZSTjvr0BLSR4XoTa6Y/Yu0U
	i1Qf0416qaREBBOPVPVoOizIxcnBLF1abPF2Di73bppz0S39dPzeoU97nb85So+X3Ok885+D8NgFr
	JJhpqJgYCleCRsXcCUqGfbHH6YZzpzB00Lm4S8yWo7OnsItmlXEN7hsW2ZZvckcTcf4PvsvXmCOmR
	2yqwGtVuUKPUcmrPSw5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfQV-00000004bHl-0k0L;
	Tue, 29 Sep 2026 21:31:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfQT-00000004bH1-1bBV;
	Tue, 29 Sep 2026 21:31:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 69A1A40698;
	Tue, 29 Sep 2026 21:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2BF31F000FF;
	Tue, 29 Sep 2026 21:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790717508;
	bh=R5j+6LYMMJZY9MNPTlC5mVgKgI6GPvSLq1ObM+lpJGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ImbjBSkcOU61+57dg13SS0sVfvDjpN/rEWW7THOLCk6E6Nxs4VPjJHzZO2j5+fDkX
	 TfTf75iO2Y6BdNjdUWXJWsbTiEqfWrlzQEGKOTe217sW/+R+PYhNrXc3Kcyn4uSv8L
	 fs4E52O2mRmO7rHKLqwREziJnRIT1RPwlGs7AfcUSZgH69XyPAlnNTaBt1qBZu1sCG
	 /E5HWQ6e7Sg5ocwxIL4R3qR7/vK5Y0ONLTtptiNdyacQ8N/KdUHTpQGL1naUUruJDc
	 8eIS+HB1CMJOiH2ZJxaQWnvcn9gSjrWtmkQkis5JDRoappoAHcmdmWK6Pho0jj1uu1
	 FYNlzkmofuYlw==
Date: Tue, 29 Sep 2026 16:31:47 -0500
From: Rob Herring <robh@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dominique Belhachemi <db@domibel.de>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Maud Spierings <maud_spierings@murena.io>,
	Graham Markall <hello@big-grey.co.uk>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v5 04/21] dt-bindings: soc: starfive: Add
 starfive,jh7110-hdmi-subsystem
Message-ID: <20260929213147.GA2831360-robh@kernel.org>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103210eucas1p2d7e77f1147a03dac0536f6069505ea51@eucas1p2.samsung.com>
 <20260929-jh7110-clean-send-v5-4-82b4d8e3c6c7@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929-jh7110-clean-send-v5-4-82b4d8e3c6c7@samsung.com>
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

On Tue, Sep 29, 2026 at 12:31:01PM +0200, Michal Wilczynski wrote:
> Add the dt-binding for the StarFive JH7110 HDMI subsystem.
> 
> The JH7110 HDMI IP is a monolithic block containing both the digital
> controller and analog PHY in a single register space. This binding
> defines the parent device, which holds the shared register map and
> populates its two children: the PHY and the controller. This is
> necessary to resolve a circular clock dependency between the HDMI block
> and the VOUT clock generator.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../starfive/starfive,jh7110-hdmi-subsystem.yaml   | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
