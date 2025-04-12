Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD12C369AE
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 13:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvP066mxu3lvGPRB36FlWH44X3Hb97r2Hx8BhXQxSu0=; b=btpmXvt8OR4+UW
	TddomzBUyyyNZFjeZD1joKNNPm0n+43Gc8V3a7N8OTuKanC3i/EDmdbKL/G3GppsLFeJfnCsabhTb
	mzRXMgvdcrJEIPamKT0Y8+ft1zHSHxxF4Hs0tONdT0CApJ/0tTokiElYZe8QW4CdZOEHixPMe3AFW
	xnj7OTppKRnaCMaPG5cg/I6QFF9MWpjXH/8sOyNiOWhsKu3ISVyTCXCrSn9zBKxCwUQT946eowuZO
	s2YnXBB0pDbBr5SQRSW7q4bp8GSPF80qfQ1ZJ1GI8bb9S0o49yO+nDhlOgr/2WvGQENYgLIG4/Ya3
	CzCOOwKtsh7eT5LKiuiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bMB-0000000FyCW-3YQa;
	Sat, 12 Apr 2025 13:57:15 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bKx-0000000Fy3H-0xTI
	for linux-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 13:56:00 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 443283439C7;
	Sat, 12 Apr 2025 13:55:56 +0000 (UTC)
Date: Sat, 12 Apr 2025 13:55:51 +0000
From: Yixun Lan <dlan@gentoo.org>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: spacemit: add clock and reset
 property
Message-ID: <20250412135551-GYA24603@gentoo>
References: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
 <20250412-02-k1-pinctrl-clk-v1-1-e39734419a2d@gentoo.org>
 <194dfb6c-d290-49f7-b060-3654307c4887@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <194dfb6c-d290-49f7-b060-3654307c4887@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_065559_286710_B11957CB 
X-CRM114-Status: UNSURE (   6.94  )
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

Hi ALOK,

On 17:01 Sat 12 Apr     , ALOK TIWARI wrote:
> 
> 
> On 12-04-2025 12:28, Yixun Lan wrote:
> > SpacemiT K1 SoC's pinctrl controller requires two clocks in order
> > to work propertly, also has one reset line from hardware persepective.
> 
> typo in commit message
> propertly -> properly
> persepective -> perspective
> 
thanks for catching this..
will wait for more comments, and fix in next version

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
