Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DB5C5AD2B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 23:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRuX39u3vRfyTKn2ha0RkRcWmmiQ/imysXVub77EOp0=; b=GJSnPxq2P3vO4V
	9nUQc+Pcpu9IVZpXvqtGwPDV4Lq7nNtPK+lCNnZ8z13SmtCxPWi1SKTUZDQRN4yGQwI/N8rxF68KI
	DcUW1JRElgSR5xbnjNjDcIsIKwsY+MFPXeKoKh0WG0ivcr5WYxqBhv6LKnhz7NU3rFsBzNLazZp1c
	2OAp2x3DR6IO6xapGiUk0ymlrNGfQjTJpZ7UyYAHsn0HFYzfgsQHDQ0AdfiSlKFY6IGwnvYszDMKI
	KRjBaduOnOS15FdbJubpDIt9aLIz1ahYMrw4JBk6r0FP2rFaUjr56rLCmt30Ug5VVPSl94/wKlVzI
	cDMfRkTdS8d8pD/GfkEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTYl-00000008qdS-0MJU;
	Fri, 07 Aug 2026 23:01:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTYj-00000008qct-0vub;
	Fri, 07 Aug 2026 23:01:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C4714412DF;
	Fri,  7 Aug 2026 23:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFA31F000E9;
	Fri,  7 Aug 2026 23:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786143660;
	bh=80WwaWF3koU49E/sRFCnvP1FuEZ0SDdFnVmZ11ugSq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TKvsulIiESdBbBvXgonJJwAOAKG8TSVt2FgsLIZaPCONt51BEhO4suy5xyN4sNNwD
	 X243TXYp14/zmjAfI38a/A5ckjfvIFLlKY95IUN3e6ED/DjGcZlrNctEFqQhy8FiAn
	 /a+rH1pK0F9aIGaDOxj/XXMWkUeNSZkFOoTnlJZqes1q9ukqlI2PPHq4J8XHD3FE5P
	 j0v/G5+5xXhzDSDbHJUWwiBcmXUxAZMI2Vj/kdQl5+Nt4KU/pOp7W78LSJgGUJaFWO
	 9flqrtndIoebvI8BUbZZmZxACXKgsq3guEr2np2LBSUoB5Y3TiAnbKECkqUMqXzBxt
	 zW/Pbxfiwt5TA==
Date: Fri, 7 Aug 2026 18:00:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cody Kang <codykang.hk@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Vinod Koul <vkoul@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Haylen Chu <heylenay@4d2.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	David Airlie <airlied@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	spacemit@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>, Brian Masney <bmasney@redhat.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH RESEND 02/17] dt-bindings: phy: add SpacemiT K3
 Innosilicon DP PHY
Message-ID: <178614365931.2211151.16636336802948226214.robh@kernel.org>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-2-6de34d80e86c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260725-k3-display-v1-2-6de34d80e86c@gmail.com>
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


On Sat, 25 Jul 2026 00:51:11 -0400, Cody Kang wrote:
> The SpacemiT K3 DisplayPort controller drives its four transmit lanes
> through an integrated Innosilicon DP PHY, one PHY per controller. Add a
> binding so the controller can reference its transmit PHY and the pixel
> clock the PHY's PLL sources.
> 
> The PHY's registers are interleaved with its parent controller's inside
> one MMIO window, so it owns neither a reg nor a reset and is modelled as
> a child of the controller.
> 
> It exposes its PLL-generated pixel clock through #clock-cells, so the
> APMU pixel-clock mux can select it as a parent through the clock
> framework.
> 
> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> ---
>  .../bindings/phy/spacemit,k3-inno-dp-phy.yaml      | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
