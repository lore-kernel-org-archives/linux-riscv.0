Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AE3C8303E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 18:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9d2AJRSgKrs7AQcQr9hlWffas5RmIlr7HsUepYNia5o=; b=lUz1Hxv6Wop3Hn
	rXC92KbN7zDo7DEEiz/OInugssemF1IOoaToZaH13xMFcFDbqE+gvKsbwlvrQ3GXOzPLS+GMM9D7t
	G4aENLU0kM4DTJEZV+9fMXREouKWQS5kewqAX6lEeq1oXEtJNrmJjYA5EwpBL25puNeWAeaEsHXyK
	SgC60O6FzqsDttVrE8sFcm0Se/JMjVXXnPZKc4jeT/0jNq2UARA8L/YAzP/iCbjN0U6yPVc1yDBL9
	HAIVGVGCMYLeiqYlEtw5+upcO7JdDg9bbprfJyok34mIjJCra80D+Vsy7X8QsvdLRO8TQQXnceyqc
	uPXg5bVmcn4o8QfH5Kwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjk0C-00000003Cx1-1V3n;
	Thu, 29 Aug 2024 18:36:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjk08-00000003Cur-2C7r
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 18:36:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 71D8ACE1C53;
	Thu, 29 Aug 2024 18:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6647BC4CEC2;
	Thu, 29 Aug 2024 18:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724956565;
	bh=Mxgf/84Y368eJ01uALZl6+hxWNZdpBDsZMUdIPn0f5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ITgXofYmvTEoWUdQ+jq3yc3XOD7MH1h4mlishkA0S+AzZMScvyn11W1HoE4N/6do9
	 nUxWggFoDfbougAQ+SMo7yYHF75VQ/2Zw2gMSTkw2+Tfs1RUeMPSfrziSSqTTx3YE7
	 gI+nQc5qXP5SQ0bHWqyFiS6eX7Gu29w/GaGhBYmCEbClL8aG3KJ0AVeHZveus0SkrM
	 iymZOgHeteGlri8HkJ4YhTmoeyH1c6SJZR5ZRLECuusoWFcDbEmbXnPYVWhdj7RwGf
	 rD78oiKXQaLQkLvSaNzHhn4Z01TPuB+89QmRb6iUh1y6ff7cQQx0WXfvrUPMAZfbUz
	 +drnU7Bobk2Ag==
Date: Thu, 29 Aug 2024 13:36:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: spacemit: add support for
 K1 SoC
Message-ID: <172495656327.898546.917420601420420121.robh@kernel.org>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
 <20240828-02-k1-pinctrl-v3-1-1fed6a22be98@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240828-02-k1-pinctrl-v3-1-1fed6a22be98@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_113608_758542_13ADAFD1 
X-CRM114-Status: GOOD (  10.10  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, linux-gpio@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <jesse@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Wed, 28 Aug 2024 11:30:23 +0000, Yixun Lan wrote:
> Add dt-bindings for the pinctrl driver of SpacemiT's K1 SoC.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Changes in v3:
> - drop spacemit,slew-rate-{enable,disable} property
> - use drive-strength instead of drive-strength-microamp
> - fold strong-pull-up into bias-pull-up
> - format fixed
> - title fixed
> ---
>  .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 127 +++++++++++++++++++++
>  1 file changed, 127 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
