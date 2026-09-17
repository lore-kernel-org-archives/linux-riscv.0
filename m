Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0548EC982C1
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 06:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXNMmC5PwoK/xY4hBx92BgjW4JcTJhlSfFN8dKFnFuo=; b=zQsQwBkHCEbdBy
	aBhI9Kl7aiGBjaK1RKv332ojdHOdZHuPGwtT9P0HOyrct51AfYa5568CHvhhxqwlJPTGCqU1AAJUT
	83YGn9+5robYP74URnpR/7FTKoSAO2MZBATrAuNNKbKNdiriOQIk7JgYi2wnL/UrgVUnqu9iN75G0
	SVLzbuGIEg/07XLX7Z57SMlEsXeRWfExt+db64R1rlyBCxmQw7gCdu5UNlCAdk3vG4e3zUCnGpM5u
	oPObGww+xGMcE8rIr4xXBnuTOa6Jrt6ttMi1V1FvvrLVOIole+xiRqSMARhWPVTFlBoAFZW3DVv+9
	0F3yY9ZWWuh8cn3oWeGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x761e-0000000Aj4p-3gNw;
	Thu, 17 Sep 2026 06:55:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x761d-0000000Aj41-2mib;
	Thu, 17 Sep 2026 06:55:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9232360200;
	Thu, 17 Sep 2026 06:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC1C1F000FF;
	Thu, 17 Sep 2026 06:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789628116;
	bh=0cpgHu6US2Uily33ztbXw+ldbSJYhicXWHuvO/gNsVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K+tHetcK34nXqZBo42umrkNZLCznX3OoUq60qydN7AWoh72XWvcHTY/HcOOnlVtde
	 qVJDbPHGv5E5c68XcmAedHb6xb4daXvABWGiXNaLlYUpAdnbZogBFYd115b3AE+shz
	 lWQfEnWIe6toV9HtZ1f/1chhdhHOg6d1ZtV1Z8ZNoNEaXe+qazVRUDdYXl7shlvtfS
	 aR+wVMFKp+rYB+FgjNa7kjeoqO3gvs/tK0lWB37KVziPoHtKU2JdgCuI5gAlFSvgyp
	 TwNNJ7vybPmM2yKYtZzl/vGyfuN2r2q19v8Ma1zKH8xpqdbIND17H4cD4tByqqW3N9
	 jgF9iWc/O7F2A==
Date: Thu, 17 Sep 2026 08:55:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Maud Spierings <maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v4 04/20] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-syscon
Message-ID: <20260917-crazy-meteoric-trout-3c041d@quoll>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153220eucas1p1f5b0e03015500d9d66db8993426c8734@eucas1p1.samsung.com>
 <20260915-jh7110-clean-send-v4-4-f0e4fd6f2cc8@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260915-jh7110-clean-send-v4-4-f0e4fd6f2cc8@samsung.com>
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

On Tue, Sep 15, 2026 at 05:32:12PM +0200, Michal Wilczynski wrote:
> The video output subsystem has its own system controller, documented as
> dom_vout_syscon. Among other things it holds the mux that selects which
> DC8200 output drives the HDMI transmitter, so the HDMI controller needs
> to reach it.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml         | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
