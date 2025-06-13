Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DA2C71148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 15:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xwpc3vRQZs4P+UBkWhXjcCaIX44P4hyK5o1vX9c5J0k=; b=ITQkRd30Q67Rs3
	VHyusoSNyvvsA/UV5k4tdNV1PUnTvC3pxbCQ3gBxqARVnq6jHExUsZTeJqRTJuc1W7efYMudnWoaM
	PCIiTpIoc0uM5DOib7VmGNelvd+MBaAB0TgwSBh2avTL/7HhTQuh7v0qId2u2L7Q2nRxTg3i4SIfz
	9CJwfeSLP0vuvxBItslTDvZNmQ/ye879/T2L2pQJ6f5e25xlm/uzTA2P+pUjbf8uiZfcclTy2EPKL
	jMoCUv98WoHcVGcmu0cd/LqDN94gApXgljMPE2d1pDBL0/tBXUPQ32AuZWZx1XxuPwrPpch9YU+8t
	0YjmOnxZZ5wauyWgRj2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6Xg-0000000GuqA-16WP;
	Fri, 13 Jun 2025 15:42:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5Zt-0000000GirA-2PCw;
	Fri, 13 Jun 2025 14:40:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85A744AA49;
	Fri, 13 Jun 2025 14:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F4BC4CEE3;
	Fri, 13 Jun 2025 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825620;
	bh=ITZFyS21U+zCOStvhgK2RHhgm5QwQidWMeeety/ts8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d5+6qd3P1WztJuri2EhMxUbC311PrDjV6+k7vmYn5h9vsxp9hWZmJ3UByPxlb6DIx
	 rheKtGV6B0v7/rTXW1cEwu2QwD0ggEKqEje7dGOcyg/chHtMvq0rRhoaljeztbANlz
	 LGocFuU0OX5ovZ9PJ20vb4mbdA71niDR2s4I6RonOo9tVOClMTh8k3LYSLbqPIkQ2p
	 /4Smqm/74Jc73703K3dngeLNzy9mTCQ2c8ClYWV9wuGZ9+g0MdOZf6PuVnnYbdzWt6
	 o6JnIrM0lkPjg27vCTy5W1Cmx3M6Xe6eu2fEKnD7WElgytQV/Gp1gTvR+DUd1EhXMV
	 s3SA2Iysdr5PQ==
Date: Fri, 13 Jun 2025 16:40:11 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 03/12] gpio: moxtet: use new GPIO line value setter
 callbacks
Message-ID: <lekcp6p4s5hbkrul2aq4ukmc722qajitvpxs7mtrqg5nlmfxd5@b5c7zzh2lb5u>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-3-3a9a3c1472ff@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-3-3a9a3c1472ff@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_074021_629709_502FC199 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jun 10, 2025 at 02:33:13PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> =

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> =

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Marek Beh=FAn <kabel@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
