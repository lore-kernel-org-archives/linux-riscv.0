Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B862C25B50
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 22:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DWBtEqdNRy9k5PWagEBlhk6VteakKTXPsbLQtPXeh4=; b=el44w0FyyyNckO
	4VkkmpMI9QOn6hSvvepBAKwJh2qJfkFkZ3C1nmfDCSZbWJADJCdq1LvByN9wRpYzDdJtdbYa39vt5
	yk/T5RQqjFRPzFt3UVJpbCMSvgH2uVHMCMqSnR2vwzkN06TYCkfhMkuRQ9qOfTkHMRDBd3K3pmy1t
	tKfu7f+xh1btQt6zw8wHm2SKC4tiBpeEC3i6nMKA+u/GkASzVITDrt166ttLX/ZJBiWO7mmA0Pf8R
	U5ohJU0l+MlTcG3GNC3MuJpcogAtB5GVwmUZdskSJd4Gz1Yr063cIH3yGqWXedoTiPyEbFRlRROu4
	2ll6ssXARuaRmvRHoh5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIzmL-00CV8S-Mr; Fri, 20 Jan 2023 22:22:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIzmF-00CV7w-5m
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 22:22:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C031CB82A93;
	Fri, 20 Jan 2023 22:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C46C433D2;
	Fri, 20 Jan 2023 22:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674253343;
	bh=9OjnS/bRAi/5W+hIXcDofIIjRCnP/2WUXpYZhPCsffI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r8c+Vgbg0gXKK2v++cEaCOiFG9cw8sctDwGC/5pwtDUk9Vm446YSQY9Ks6s43+nuJ
	 8Y5mblJKCof5iiySfzNGqJXzdnUtXVMHbBzd/lulNRgVEUN8cZcD6Zmlb0C3twNMlD
	 P1uMVv4YnazpQzTzsd1eTFWQ7CNzW490ZbHTr2nzzNrTnFx1zBlBvvHKRtkhIgk7ui
	 sw3YvgV9jlXw7s+9hTEMapRzTgLGyDskQGu80kQm7KytkZl5CmsLcORge5vjK2Gdtq
	 dFmL+LyJ5pFHaTwX+v1KYAK9SFyZtob7Xe96bcZmY1X/8TCqCQ/ivtQLt7815u1Exa
	 VaCCUfNRi+yyQ==
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: conor@kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add a devicetree for the Aldec PolarFire SoC TySoM
Date: Fri, 20 Jan 2023 22:21:52 +0000
Message-Id: <167425300253.196995.16704364734432203770.b4-ty@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111124106.2417152-1-conor.dooley@microchip.com>
References: <20230111124106.2417152-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=775; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=DSR4h5iLz5L38SehBa0AiU9UxY1CKS3u7gABR27mr2o=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMmnhf+89rUw155YOOW93NLnu8Q217Kq/HZNPOZVKupe6ZJy gHNvRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZy5xHDf38jhqreDe+euBbm96n6NJ tIqtnWbovIurS8tGr1d7kWF0aGv9d25whnHul8wrw76ujiDScVr2t0PJoTs/z+8yfXrs5fxgYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_142227_411454_36AA812E 
X-CRM114-Status: GOOD (  12.77  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 11 Jan 2023 12:41:04 +0000, Conor Dooley wrote:
> Hey All,
> 
> The board has 32 GB of DDR but the DT I have access to only has a small
> bit of that mapped. I tried accessing more DDR, but it was not possible
> with the FPGA design as things stand. I'd rather have the devicetree
> match what the vendor is shipping, so left the design/DDR as-was.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/3] dt-bindings: vendor-prefixes: Add entry for Aldec
      https://git.kernel.org/conor/c/f6beee9118c3
[2/3] dt-bindings: riscv: microchip: document the Aldec TySoM
      https://git.kernel.org/conor/c/ea913d8865fe
[3/3] riscv: dts: microchip: add the Aldec TySoM's devicetree
      https://git.kernel.org/conor/c/4f7d64156292

Removed the PCIe that I forgot to remove before sending in the process...

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
