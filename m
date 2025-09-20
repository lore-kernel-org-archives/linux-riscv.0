Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABC6CAC5A0
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 05:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXOhVIfhfNAR9mqA02bzS+2Nf30wg8D5uFgzOgYS1XA=; b=27MbGYJB6Pfd7y
	e5TMlrV0LZuEkWM2FYKh1zEoSLl/ovdwQKgKIncPT0gbc3rKQ1vFT4BF7/H5a0L33la0PSONhL1Xa
	ztXFtjm/HPsTnQxKr9Gpo7Lhxu/AWFWLQxmUZNncbXhz/CyKIBYm4pE6I8TWoNjNJIraOApZB/X+t
	Y+Ka3WHnp6Vl1o54HQcJqcEm219kL1ArQ1l213rTYbheiPA+xCGqBKuxrLqQPmBsSG3npJzTI4Xrd
	4QKYOqAMm/AvzPl9mX8g2dlE6tlG2dpLPxGjKTitcMclZhZtzq8qi2pXSom6/2yDOfBCy/OxRNLc9
	cguu3hspZNbuxEpDctfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqZB-00000004q3y-3eJw;
	Sat, 20 Sep 2025 05:55:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqZA-00000004q3o-46GP
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 05:55:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BCB76013A;
	Sat, 20 Sep 2025 05:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 786F2C4CEEB;
	Sat, 20 Sep 2025 05:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758347723;
	bh=eSPIm+5TmCgbXgE5lwwUhgZEGgepcr9yXpb9e2Q4g6E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WSoZqo65cjmrXgVPnoj1mtMjc/3rDP8Hdwl47hmKURXdhUoeIjESkGd2LTI1uwwwb
	 jSMqr1pKW8JYrdUezAypJvgqMG4McauCg7Wi1EPN1wojwsbp+LCMxtoku34ib7ejdA
	 aKj7JvTrvZ9hlpCaYUxa6Leh2RzjjXN/tVFivcytaj5n6JYUT0Adja1A9xta/fa2D0
	 wPr9iouqRCMtdtDwGpHyjG9Ke1jtdNISR+1vRVa7Q5Aqa6E7jWzjkBGz6XAPDuzUm8
	 Kts6ZN60mdxaxYOQhDWxnPAQ4+S4WfUnw7KD1jQOPtGb/vxCdu1H+vR5FuX9pW/fUk
	 ilJjZ85yqB6ag==
MIME-Version: 1.0
In-Reply-To: <20250911-k1-clk-i2s-generation-v4-1-cba204a50d48@linux.spacemit.com>
References: <20250911-k1-clk-i2s-generation-v4-0-cba204a50d48@linux.spacemit.com> <20250911-k1-clk-i2s-generation-v4-1-cba204a50d48@linux.spacemit.com>
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: clock: spacemit: introduce i2s pre-clock to fix i2s clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Jinmei Wei <weijinmei@linux.spacemit.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alex Elder <elder@riscstar.com>, Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>
Date: Fri, 19 Sep 2025 22:55:21 -0700
Message-ID: <175834772190.4354.14570183719489742202@lazor>
User-Agent: alot/0.11
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

Quoting Troy Mitchell (2025-09-10 20:34:03)
> Previously, the K1 clock driver did not include the parent clocks of
> the I2S sysclk.
> 
> Introduce pre-clock to fix I2S clock.
> 
> Otherwise, the I2S clock may not work as expected.
> 
> This patch adds their definitions to allow proper registration
> in the driver and usage in the device tree.
> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
