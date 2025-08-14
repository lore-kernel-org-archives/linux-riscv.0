Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87E1CA0EE4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 09:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7eA5VawWbhV0M8cObW6KbSI4D2cBVK8jVNJX+ahvc3E=; b=1hNGOJPEMexhUE
	bnzC0weOi4iEgoORY3PV9e16Jk7kUeoDhWc6aRwnLeAejOOG8I4xG8Tuuw4q1taDJqNnQ1JJSgz/P
	ewKkDm6XPhOCOe9yu/PP//vQREudPSl3dPnbzAOWyqJUO7O5hd2jf4zKNz5UZPZzQ35li50YMPhYn
	lYJP2cztmVF+0WQ/rP7tElxuFn6iL1Ww9rgEnfgeiU3WQWBhBsrrPPpXWlnaxlUSjtuhhDPSWUNbN
	HCUnWmvz3nfvrB6T1EnHByFtkF+UXT60kTO4BZ3P3GHTxGbB9KuGmd4EBoqlb6ZvH9Q/8PkON86vI
	kGU1N3Mu0DjUKUZFcc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUUb-0000000GRhF-324c;
	Thu, 14 Aug 2025 09:43:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTna-0000000GK4u-0ejK
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 08:59:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 56B1DA5574E;
	Thu, 14 Aug 2025 08:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5371CC4CEF6;
	Thu, 14 Aug 2025 08:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755161940;
	bh=UqiOEQj4i7jq9yn+tRZlkfQENRqT5RSvuuePfqVAfHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QlyaO6ZnyoFv5m2v+JvsKLu9jmln9w8fn0/ZeuMm9bjuEJ9t9v83UMBa+nsfIzP49
	 2wbVfS6OCrUi4p2lx0b36JyDfuqHX9pHAbGzm+F3oTFAuD8iZ4VVbIBKN2QO1HAS6Q
	 iebEJGom3+H/UQNbwPKNPAGmBF+/cXdzeTn0jm9smawZ2nNduSr+Z8JGAucPoYh5sw
	 Ea4ZyNkyyCwVT8Wz/GWGPhlMk9Wd67+sDP55nvJGcHDUZNB4TxyReslf3CNGrWR3V1
	 V2PkcCsSZ1t3us4Ov1SOTQK2511dHCuI3zegeBBQpr+Lqg2jxQpBOhfgnhWFA7Hxda
	 76yQhhVheEktQ==
Date: Thu, 14 Aug 2025 10:58:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: spacemit: introduce i2s
 pre-clock to fix i2s clock
Message-ID: <20250814-whispering-kickass-sunfish-be49ae@kuoka>
References: <20250811-k1-clk-i2s-generation-v2-0-e4d3ec268b7a@linux.spacemit.com>
 <20250811-k1-clk-i2s-generation-v2-1-e4d3ec268b7a@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-k1-clk-i2s-generation-v2-1-e4d3ec268b7a@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_015902_261618_C14DCE86 
X-CRM114-Status: GOOD (  12.54  )
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

On Mon, Aug 11, 2025 at 10:04:27PM +0800, Troy Mitchell wrote:
> Previously, the K1 clock driver did not include the parent clocks of
> the I2S sysclk.
> 
> Otherwise, the I2S clock may not work as expected.
> 
> This patch adds their definitions to allow proper registration
> in the driver and usage in the device tree.
> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  include/dt-bindings/clock/spacemit,k1-syscon.h | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
