Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EB6C74A5B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Mar 2023 23:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQFEstk1/oWi4ReAPnmzvCmKGvnvhuiyLk/n604bOZo=; b=R9m+G53Q6Pfn4I
	CVavLc+/mgniniYT59WAAK5zyJI99c1v5feo1D20AQgXrJzLMMNfoQoxHlLI2z1dFKbgUX9rX/EVa
	N15BCxG6CieBPU9B9HMxgBT7DhFs3x7oSSm4x4PAfEB8vh+lcEm6uifzWFqIehx0x4SYNr/mEksEw
	bGZ1W4BHNOEEQ4yPw9xj76iMOCBq1yNOi8xxUtVxeAUBQIikLLIfuDLuh1sjGVwc4VSYZzEC1vo1D
	81rQKFYDpLjBgTGPxl/JcT2Lzgl3xhj+NubVT8qTsj+yl6SesPpt4w1hQKl/DW3PJO7Oi+hvaqZ6C
	UCbVysjadb0dq9NIihXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgZMG-009J0y-1Y;
	Sun, 26 Mar 2023 23:01:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgZMC-009Izb-2p
	for linux-riscv@lists.infradead.org;
	Sun, 26 Mar 2023 23:01:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A98CBB80B72;
	Sun, 26 Mar 2023 23:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1A0C433EF;
	Sun, 26 Mar 2023 23:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679871650;
	bh=x6Z12fR83Gq7xvHh4mr/kK1h0Pqkf36AjClyCalvXdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SGfFZOdeUl4Q3V2nqRr8Faa166YY3OMTZvTTTKGep0HBYvNL0t8UoBVascmOqEEaf
	 nY2njkFdimiBcdxkLLFmaTBtR8e6Lcce5ytX75LGlib2rSXCCHebF0d5XGMr+27OaX
	 oYsogxgI8rkquV0yXO7jn5+4to9HCCojzktZUbihun88ds5DLsK2MpNo6x4l1P+Qfi
	 4Qk5tINCyUsUx+tYHp/2+k85iYk+G2JF5i7d+p6sSlgia8jrY19MGMURnnVWvnLYE8
	 DmYE2oztHeB5TRT/XHIEQlzHlspsh4gO6AXvCgn1o4wR5OQ3fIBRuZwhThd34wwcd8
	 oOYTYrPt1LEOA==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] riscv: dts: canaan: drop invalid spi-max-frequency
Date: Sun, 26 Mar 2023 23:59:41 +0100
Message-Id: <167987156176.153791.15260217411572025430.b4-ty@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326164751.104789-1-krzysztof.kozlowski@linaro.org>
References: <20230326164751.104789-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=436; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=0zFLew1NsRZR2Xph0On5u79GHzMJx5S7s4zUw+ZVKAU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkK5yKv3fpp3PKfge+Mu/UylUM/q/aYckkXvth7skRmT a8HU92RjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzEVJWRoSFMuHy3icO+syvV Wuv2/5vwVNCB//EXdw6N4+3XxV+cvsTwV8pLiztfOmpJ+w6VWZMWnDpTc2H5QuW4j1einyRwuy9 pZQQA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_160101_074736_E6091A04 
X-CRM114-Status: UNSURE (   8.64  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Sun, 26 Mar 2023 18:47:51 +0200, Krzysztof Kozlowski wrote:
> The spi-max-frequency is a property of SPI children, not the
> controller:
> 
>   k210_generic.dtb: spi@50240000: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
> 
> 

Applied to riscv-dt-fixes, thanks!
I'll make sure to add a test for the !mmu dts in CI too.

[1/1] riscv: dts: canaan: drop invalid spi-max-frequency
      https://git.kernel.org/conor/c/8056dc043d7f

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
