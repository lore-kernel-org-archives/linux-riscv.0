Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBF7606A31D
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1KWQhV/U;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DIAb3eAK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=41NcH/Sx8M90a4R6Lt27y3s5djc5MA1Av094nwmuGq0=; b=1KWQhV/UXgE3pFjcqqf8pMYGVk
	U6U72TVYJM6cqWxajvOBnPru9a+9Tt+77wi4H5j8HrpashdCEwMTcPzC2wKExc02qESaqtD+naax2
	7qbHLyA/1H1OgUY5mIWY48NVjJSN3Lkr5NxeEQ1/ZWLwF4Ikafe5iXgCgfaBY2qxxuXWThvWQS/Wl
	QFnfl/QpIhHOrPhcdffzXg9NYevzd2IjCLxQLcYNyaQP8L+1CxIygnqmXnxsDTS1ek3/XZCFWssGf
	0bXaWrTyQmYX6mRRA3tSLW/uVlg9a0aH7yg/kuBkPMzqgsy5T4wXdt1zplVag7wc1R5DQ2+wQNoig
	1Ye/cwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSZ3L-0000000HUYD-0IMF;
	Sun, 15 Nov 2026 12:09:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSZ3J-0000000HUXz-4BGv;
	Sun, 15 Nov 2026 12:09:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A03676136E;
	Sun, 15 Nov 2026 12:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6001F000C4;
	Sun, 15 Nov 2026 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794744584;
	bh=2xp0eogThoE+rovAfkLgs59Clib+FqRuadwEreWDQ+Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DIAb3eAKgNniFbOJwEDkQkBz9z+WB2l6R5hN5iFMBnAOW9aV9DDBeCS8xb+bsLzLG
	 01csHw3w6kebtIozMHxRp4NBkp8f/r2SWC/YNRJz0Ehnv9z49A+UI6vae7UGHr1wFt
	 YchQYn2wB/ghIVce8v6DroPEUZzydvs0Hgc+iVpE7Ppkr7RtG4dKKcil/Wf9hntH48
	 RPI0BTeehAEno6IKUDAOc18O/aeDfYArcbemwj2SuuQZ4Pq6MP3+ciMpg9dB5ch6D5
	 X5HR0U3J0ybHdS3sLZxNFBatl0PnR0m85if88FfZphFen6Qdaa0IIZdTvx9Li3dPJc
	 eWZ9I+OMqzUNg==
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
 Andre Przywara <andre.przywara@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech>
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech>
Subject: Re: [PATCH v5 0/8] clk: sunxi-ng: Add support for Allwinner A733
 CCU and PRCM
Message-Id: <179474458009.3130971.4987693724545718972.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 20:09:40 +0800
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

On Wed, 30 Sep 2026 01:26:07 +0800, Junhui Liu wrote:
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
