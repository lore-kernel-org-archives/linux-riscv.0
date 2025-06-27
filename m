Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6109C7EE2A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 07:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NTH9jHbGKi5lDKhLdqosmbqCputdLT3FuYzdcfHUz0=; b=t+7osqltRqZBcN
	BAAyqPBu0oOFc68H2lrGBdOzTQQacE5sBMGMKNZ1Zw8X/xYm8i6Tq4pEGCHKbn7zG2R7jLVWQjrW9
	hHuRFjPXHT4AgAp2oHblAWh9HIwGBfuMt/kfmXacj2UxyTDHkydsp1yd4QeH6qo6pWHRxdgHdDiQb
	p9S9MjZX9sV7n0Va6mxs6La8LPNx8lYPpfMGGyVYQRQ8rOnfBlmE8EmxFQYc417TCJ34Fdatq6Oo8
	1elRP21eRU8tzkuopKp5urDhpF9UJGIcUBBMDj8elBdqE3V6XhK5KFWc/XWuC+bVbgbYg97TOpicZ
	XgmTSF5WhSLpm2Jiom8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV38v-0000000DmKe-22KO;
	Fri, 27 Jun 2025 07:05:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV38n-0000000DmH0-3xI9
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 07:04:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 67490449EF;
	Fri, 27 Jun 2025 07:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69656C4CEE3;
	Fri, 27 Jun 2025 07:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751007893;
	bh=wHRTKr2VmrGasuOExBXaGPc3GVwWpS6rGum/hpAQojw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzkJatIhdldH9AkFNKlH9+ImdxqmeOgD9DmKrKe+eReaB3bALWNRpFnDovccBjGoy
	 6cx4vkDM2zkvPj5P2Q9IR5ssftuZK4RUzox0ZbIjH+ii0MGQGRxs71WG//WxFTtDQS
	 3VJ5E6S0tqJtTM5Cj7Fbrgz+G/cInFWUY/1apSFFags1zo3SFePxxeb+xgvBt3SBjc
	 X7Q8SDEV4j1E5PNdUqPu7hi9Quh4kxEpxeKIhVFpIM3Apsz2oxZGPDrFA370/uyl87
	 E8cSz0RRPJsqgSrRY2s6O1pTqFyOVT0LG7LVzLtKmWninSyUyFam1I7dp2gAHaQrWO
	 nkyPdxDiSlBDA==
Date: Fri, 27 Jun 2025 09:04:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: sboyd@kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, pierre-henry.moussay@microchip.com, 
	valentina.fernandezalanis@microchip.com, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/9] dt-bindings: soc: microchip: document the
 simple-mfd syscon on PolarFire SoC
Message-ID: <20250627-portable-acrid-caiman-4ae73a@krzk-bin>
References: <20250623-levitate-nugget-08c9a01f401d@spud>
 <20250623-underwear-refinery-9203f771bc39@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623-underwear-refinery-9203f771bc39@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_000454_003620_609AC867 
X-CRM114-Status: GOOD (  11.83  )
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

On Mon, Jun 23, 2025 at 01:56:16PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> "mss-top-sysreg" contains clocks, pinctrl, resets, an interrupt controller
> and more. At this point, only the reset controller child is described as
> that's all that is described by the existing bindings.
> The clock controller already has a dedicated node, and will retain it as
> there are other clock regions, so like the mailbox, a compatible-based
> lookup of the syscon is sufficient to keep the clock driver working as
> before, so no child is needed. There's also an interrupt multiplexing
> service provided by this syscon, for which there is work in progress at
> [1].
> 
> Link: https://lore.kernel.org/linux-gpio/20240723-uncouple-enforcer-7c48e4a4fefe@wendy/ [1]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
