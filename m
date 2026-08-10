Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E20C5B56A
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 14:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7r8k7u8EwvbDMkB4rlk5mccvVGNOaJqOGIqreWhrG0M=; b=UTl8cwTzy9rVUO
	7FJQDmse8SyxdSEUtjlUkIib0sBrD+nKVNWXWnakdKZ/JfZgnWJvLEV3LSvJf0b9UG0kEAKGl7Jmi
	0fG+xgXWWgf5LIN1zuGmvhYGSTd3veuB5DMMWF5LvQ+D6f3ITeD2I2UWamPFbu+4J8/en4RwO1yKk
	UdFPgMZ6fKHwAawXcXERMfI7Wy6VPsJs3bcivEWxk5lrm260rihSK+VqZCC8h6Fw2jBAIM19xCxrI
	wMHu7T/B8KNkFQFHtAVcbAeh/XMYXu2Bv5P9Zoxh7+9O3cCl7l61ccAfEdiIetoO+KBg8XruZPMyZ
	W0gHqMQFOncyueU6FpFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR4R-0000000C1MD-0rhM;
	Mon, 10 Aug 2026 14:33:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR4P-0000000C1LR-2uf7;
	Mon, 10 Aug 2026 14:33:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6886E40BB0;
	Mon, 10 Aug 2026 14:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241771F000E9;
	Mon, 10 Aug 2026 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786372421;
	bh=hvqH9zZ0i4FPAUMO7qs3uRLITXvW0VP0smlftrvm8ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q6eYx7auuQQBo0fTkxCZn47vcAUPbK53UbhiJTjVpgzAx4C7ES7Rh0RjFCmScVITv
	 pbSMZEkDr8HpmGzsnfXBW8kVdwTK2gUrTAUfoVfn/fJRK9ffbR5MWlQoeL/WIne6lv
	 CVSRnkHCT5k1Twnr66dVu6EM87yr2aPRvPXN1Bb6EmA2x6qDpur79/bDfieq5s83My
	 NiA3UwYj+eH9mfWgHJ9Kmy5HF4Lj0aj9Mod6WzEvBG5eJQPXO6KSAe1tMY2EV03Jk/
	 HeC+gL4wEh4XJ6CIxKsQeJd1nj6khJfip6BIq64yBLNSrKjYtpl9EjJQbYyFt5TU0s
	 VN4+deX82Opmw==
Date: Mon, 10 Aug 2026 09:33:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cody Kang <codykang.hk@gmail.com>
Cc: linux-clk@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Haylen Chu <heylenay@4d2.org>, spacemit@lists.linux.dev,
	Michael Turquette <mturquette@baylibre.com>,
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org, Simona Vetter <simona@ffwll.ch>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, Yao Zi <me@ziyao.cc>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Guodong Xu <docular.xu@gmail.com>, linux-riscv@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Brian Masney <bmasney@redhat.com>, David Airlie <airlied@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v2 04/17] dt-bindings: soc: spacemit: allow eDP/DP PHY
 PLL pixel clocks on K3 APMU
Message-ID: <178637241975.1573687.15895967704569553501.robh@kernel.org>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-4-327d7910bf71@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260809-k3-display-v2-4-327d7910bf71@gmail.com>
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


On Sun, 09 Aug 2026 21:14:13 +0800, Cody Kang wrote:
> The APMU's eDP pixel-clock muxes select the DP PHY PLLs as parents, so the
> K3 syscon takes two clock inputs the other variants do not have.
> 
> Gate them behind the K3 compatible instead of widening the shared clock
> list, so a non-K3 syscon cannot silently accept clocks it has no mux for.
> 
> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> 
> ---
> v2:
> - drop the redundant minItems: 4; four is already the minimum
>   (Rob Herring)
> ---
>  .../bindings/soc/spacemit/spacemit,k1-syscon.yaml   | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
