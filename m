Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9075606A31A
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 12:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ywInB8p3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=COQR12yc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vNxmu+zv9ucQrdfN5mkXG7rQR1Cal4v1vNsQAaC8oyo=; b=ywInB8p307WKsX032SeDLqbK8M
	ZOWdqI9HnaI5Rw3UTRSnlk+U3zGP3k4jiRV/JfmVGdhAOxnTTcTTHuDpM+OhhohAp/OH4ZR4KUI2R
	YVMUSmmybCJDqOmH9YH0WwpC6V0QUiES4EaWqFE7lh1zj4tcpxSCui2GgXSQE/c/n/smMnzj8sddt
	ClD4Y6WVqHVa4C94SC/OC0C3O0hwn8zXXFJ/wcfhH66YvJVFLrZA02XcCLnrwRUJNfp5mJtO0I/SR
	VEq3kp/9UzAqt8z2tZxNyTTJlRZ7h3ZfNcbh+kUw8VAHw7LT01MH1BNy33HM97MAJk3pSRa79QHLO
	e83F/WSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSZ3T-0000000HUZj-14Nh;
	Sun, 15 Nov 2026 12:09:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSZ3O-0000000HUYh-0ZMK;
	Sun, 15 Nov 2026 12:09:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B4606136E;
	Sun, 15 Nov 2026 12:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E8E1F000C5;
	Sun, 15 Nov 2026 12:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794744589;
	bh=FNh/mYJ+0jsVySuFyl1eF/vkWOtkKDGeVp6wS/ZBews=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=COQR12ycgObj/tV9ywWCW5uOL6FzCyVdAqEyCCOkqcWAMBoIsZ8+0eCVe3GiqLntm
	 nxCHBsePYJaWCeZop9ugxWHjlb16dOzKOCe/vdsb9SoXo/+PSl2LmVwP8sIClw25XF
	 JEolYk1mjcto2obTzm2rdyLvpgzeIZuuHioWYMSnEuxfynPxTxrBIJlSnwQ9H7HLy5
	 slZnoZ191iSiPiHqeBLScoG3de8cv7HOonAFbGYzA6GSzB+idNwm6EP2Dr/tuOwF57
	 ZrHQ48I3rKqzYQqW2GBk4mUUICYx0nDCHzwRjdL/7uhZqERMPqjQuA4W4KowrbUeB4
	 zieXkY1lpVoyg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 netdev@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Enzo Adriano <enzo.adriano.code@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, Norman Herms <dockseed@proton.me>, 
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech>
References: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech>
Subject: Re: [PATCH v7 0/8] clk: sunxi-ng: Add support for Allwinner A733
 CCU and PRCM
Message-Id: <179474458449.3130971.12008198786411487989.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 20:09:44 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 15:11:49 +0800, Junhui Liu wrote:
> Add support for the main CCU and the PRCM module (R-CCU) found in the
> Allwinner A733 SoC. The clock architecture is derived from the previous
> A523 design, with the MCU_CCU removed and the clock tree extended for
> the additional functional blocks found on the A733.
> 
> The A733 introduces a "pll-ref" clock that normalizes the physical
> oscillator frequency, which can be 19.2MHz, 24MHz, or 26MHz, into a
> consistent 24MHz reference for the PLL clock tree.
> 
> [...]

Applied to sunxi/clk-for-7.5 in sunxi, thanks!

[1/8] dt-bindings: clk: sun60i-a733-ccu: Add Allwinner A733 support
      https://git.kernel.org/sunxi/linux/c/39e4303e8bbc
[2/8] clk: sunxi-ng: sdm: Add dual patterns support
      https://git.kernel.org/sunxi/linux/c/b213bddd53ab
[3/8] clk: sunxi-ng: a733: Add PRCM CCU
      https://git.kernel.org/sunxi/linux/c/2a5ae6df088b
[4/8] clk: sunxi-ng: a733: Add PLL clocks support
      https://git.kernel.org/sunxi/linux/c/93c637ce9f0a
[5/8] clk: sunxi-ng: a733: Add bus clocks support
      https://git.kernel.org/sunxi/linux/c/103168ac6eec
[6/8] clk: sunxi-ng: a733: Add mod clocks support
      https://git.kernel.org/sunxi/linux/c/4646c19620e6
[7/8] clk: sunxi-ng: a733: Add bus clock gates
      https://git.kernel.org/sunxi/linux/c/ed757071ac3d
[8/8] clk: sunxi-ng: a733: Add reset lines
      https://git.kernel.org/sunxi/linux/c/308e4087bbda

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
