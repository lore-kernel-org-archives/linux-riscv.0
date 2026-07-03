Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26156C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 17:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0C5h5Vg3ghs1yCkBGbliczYylnI2Y7FJrVsgDBL0OSU=; b=iXaXkSuYlSYs1p
	GtfSHuOjz4X3pp1wbeKau02fXRkRe9mh4bkn5b8fjucUDY+e/G37QzHLbE4dLtABmxdYoWj1eH+5v
	WE2rHhzLff9olyA6RbiuevHjkO7d0taqEI9fWJsGdFYQ6Pd941JzS89bMM+PRPp6K4TlecTMRowd8
	KrCVBeAVZd0SKmOCb+XRAvpd6WdQG+sSBfU2gN8B8z1ukzCAny7o2vlxb5CyeUUHJAJsPBhK3BR/y
	rSr+7wJPJwkM5zEueYIehxp9XJUl3Xa6M0xyo1VDr+TNn/D4yZ52z8QOjobFXRwUmxB4aOXyIvN2f
	FIhqcIZ3/uK8QxGnzJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhRo-00000007aqu-2CqU;
	Fri, 03 Jul 2026 17:13:04 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhRl-00000007aqA-3NpF;
	Fri, 03 Jul 2026 17:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=P0tPEngGB69/ViXzlastUZSeIBDc5NlmASuyBxp/sKg=; b=mWPKHCqjQiLOPiIKGP797yKAT2
	k4NTJkDZm2SFKYc6mKLQnly6dnsorUJIepBxEIEw1Z1Q2ApwYgf7rFOnpawAnrQYrA8MRPSFEny9m
	NmEcTuqLlHmD3ySt4/vsjZ56WnWHKMIPCiNN2FNVFm9IDQCnuwud+pzFC0VdyTY8GOJph67Hk/FCy
	krjVKQIT/yMWsNeg1rcTqA6jSq67RyUc7SXIutYqYMa/z0XGlX3QN0OiYongVzKi8ZKZkiULT8mu/
	LYgu9WxEuhWAhKlsh9T3B5Oy+jmoqTE8A6FQwmeC/q13SvB+BQ1kptMeWuWVbHBEQT/9eghYyhEPT
	4KJcE/tQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wfhRb-000000008UP-05Pd;
	Fri, 03 Jul 2026 19:12:51 +0200
Date: Fri, 3 Jul 2026 19:12:49 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>, Ze Huang <huang.ze@linux.dev>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 2/2] phy: spacemit: Add USB3/PCIe comb PHY driver for
 Spacemit K3
Message-ID: <akftkeI9Wbr0xL-5@aurel32.net>
Mail-Followup-To: Inochi Amaoto <inochiama@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>, Ze Huang <huang.ze@linux.dev>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260703021024.495433-1-inochiama@gmail.com>
 <20260703021024.495433-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260703021024.495433-3-inochiama@gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_101301_868693_D85FD6E1 
X-CRM114-Status: UNSURE (   9.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2026-07-03 10:10, Inochi Amaoto wrote:
> The comb PHY on K3 requires to configure a syscon device for the
> right mux configuration. And it requires calibration before any
> usage.
> 
> Add USB3/PCIe comb PHY driver for Spacemit K3.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/phy/spacemit/Kconfig         |  16 ++
>  drivers/phy/spacemit/Makefile        |   2 +
>  drivers/phy/spacemit/phy-k3-combo.c  | 252 +++++++++++++++++
>  drivers/phy/spacemit/phy-k3-common.c | 391 +++++++++++++++++++++++++++
>  drivers/phy/spacemit/phy-k3-common.h |  27 ++
>  5 files changed, 688 insertions(+)
>  create mode 100644 drivers/phy/spacemit/phy-k3-combo.c
>  create mode 100644 drivers/phy/spacemit/phy-k3-common.c
>  create mode 100644 drivers/phy/spacemit/phy-k3-common.h

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
