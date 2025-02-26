Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA70C021B8
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 15:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YqzzYy9teoPz0nI3BuQnAglqKOmFMZD321fOzIELoaI=; b=w2vTMZ9jKyzm+D
	xJnO040Nu8l6ZLGpnwvVowmVY6bjD0JMwZUz8tXk9AbUMNOqfbRg9FQxxITHU3FB0pk8Yrt8zEOyu
	zleDMQ2MQjBeiPUR5XLMNSRvTbC/Q9F/WHwVuuxngU5lAyEivAeouUzt9Az+qBBTf5iUMfd4QSTl6
	IVmoyNTznFeSPKeicQ/ls0whgbilNG+lDnNRouL87rRDe2veD9EZMkcmCuLZAglZFGZcutgwuaVvi
	0v0OWD+O1MUmV5A3hu7nXyp1llYLqY0UgeaLSjq7F5jaLFj3D0G6yf6YBI1l5D285j2GdHTlxgJxK
	X1d6gc9bABQ/rzFTtkDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJlN-00000004QUG-3CkG;
	Wed, 26 Feb 2025 15:55:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJlL-00000004QTA-2JfN
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 15:55:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F63B5C727B;
	Wed, 26 Feb 2025 15:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880C5C4CEE9;
	Wed, 26 Feb 2025 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740585354;
	bh=2b/0jmiET26RzTFkTnCeyD691GwyGBvbl6ZzIxxMzBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DCvVLYNl/BDsnaShGUmbG2XfXhp7YkwSQPo2z31Zh+BrguxCktqVKeTxq/nCVPSV7
	 yrH8LApkaemi3jyzNA8FJIbyi/WOfZSF5oEYnphgr5mPDmAgzIsR3EX7i31YGK7kG6
	 sC01lAwwrqlEXvKb3FXFz4lUT7BB6T+dEGU/78Hrv6d6Wv3e5diyU/v8Miwnc9I0Lg
	 Yj4i2icq3VyziG/Z3uTdQRPAOJuExBbLP3KCHxa62ogm0wc7XR3aPGEVh1OLBKGHqD
	 qhCvmfTo5PlRk2mhcEmV7QH1AqRGaBRk78vS+mvYTXlB/PHSuwtGZbW7jbeTOD2Ftn
	 PQCd2eAg4QyVg==
Date: Wed, 26 Feb 2025 09:55:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v7 1/4] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <174058535208.2501613.753521033662405764.robh@kernel.org>
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
 <20250226-03-k1-gpio-v7-1-be489c4a609b@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250226-03-k1-gpio-v7-1-be489c4a609b@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_075555_630478_BE03DC5D 
X-CRM114-Status: UNSURE (   9.22  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, linux-gpio@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Wed, 26 Feb 2025 08:41:17 +0800, Yixun Lan wrote:
> The GPIO controller of K1 support basic functions as input/output,
> all pins can be used as interrupt which route to one IRQ line,
> trigger type can be select between rising edge, falling edge, or both.
> There are four GPIO banks, each consisting of 32 pins.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
