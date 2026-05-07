Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC994CD342C
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 01:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVCAPU0+G95pcv/Boa0S6VTqpjdytwvmqEV6BLz2s28=; b=wcCO2kSm6U6/x1
	WRwifVysnbAUSrc8eL0GdXCS5DFF74YmdP328fA2tTtK2wxYg0a7ob781dx7kTAZ4Wq+rnB4DGXcf
	ZnOVjw5lPhT868P3hrs9UEYvLz1TKFeQtKQXspV3SSzkAmH5HLXPX+g8sFrh9Tv8nuAmRM0/TM/9R
	yVPQbYskihimPZNf7rk1BLanghr9oXR3zZEspuBBaEORyAZOJUJCwVcpzvfsA+0rA3JonQ5tTnIgw
	jbWmOBITCsnrOeRSzYMMYsYNIoTK6SebDCQDSmM8nUX3YGYS6rNLAP5dnYqZ96XyLF38JzcptJnhR
	ZKmiWHMFGUYlvKQIpllw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKnxw-00000002TUX-47wV;
	Thu, 07 May 2026 01:55:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKnxv-00000002TUF-3h5m
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 01:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09C3760181;
	Thu,  7 May 2026 01:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F5CC2BCB0;
	Thu,  7 May 2026 01:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778118950;
	bh=HmSssX1mkmHZczuAQsHC8mpZvxjJ8ykpKqPzUDK6R8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s7E72tRfcpgr6klSGp/xQF8CXOa2Yr3ciYm2R3qmVK7PIXH+5vvbHvNOuyimAGGm9
	 PLLnosaUmwCqEfxH9ux94q9IoqxKJILYjL0vs2P19wKxC6bq7vJou0OeQu6iWY9qUa
	 19iCXoyhqZed4b7063deHKSh1YunU0Sc8+N/kf6TShC4n+J409YH5O21wyjAb0gEvr
	 ICn3Dtat/b9PdvFBK/g5/BOeO+EdRMnpzfYK1H2t+hIzJi1XzUMMcI9QkAJENfP/GL
	 D9mJjGe6DIIVXgy/KfQaiqaQRNskqrXgyd2CrDXplUrOHxFvogYjo4sUn8SlLmqSNX
	 qWHBER3uhJQOQ==
From: Yixun Lan <dlan@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <guodong@riscstar.com>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Elder <elder@riscstar.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: (subset) [PATCH v10 0/3] spi: support the SpacemiT K1 SPI controller
Date: Thu,  7 May 2026 01:55:39 +0000
Message-ID: <177811891149.2316511.8217429551447102118.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502-spi-spacemit-k1-v10-0-f412e1ae8a34@riscstar.com>
References: <20260502-spi-spacemit-k1-v10-0-f412e1ae8a34@riscstar.com>
MIME-Version: 1.0
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


On Sat, 02 May 2026 21:30:50 -0400, Guodong Xu wrote:
> This series adds support for the SPI controller found in the SpacemiT
> K1 SoC.  The driver currently supports only master mode.  The controller
> has two 32-entry FIFOs and supports PIO and DMA for transfers.
> 
> Starting with v8, I am taking over from Alex Elder to shepherd this
> series upstream.  Alex developed versions 1 through 7.
> 
> [...]

Applied, thanks!

[3/3] riscv: dts: spacemit: define a SPI controller node
      https://github.com/spacemit-com/linux/commit/c580774185426ea316396b1dc3f1737a3ad3800a

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
