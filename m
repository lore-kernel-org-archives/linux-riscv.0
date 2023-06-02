Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD04C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 16:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0t4R4TUsvfT5PR+8UGhIlvL2KErBfgpI7SvJLAj8nJ0=; b=J3Ie7EC/FgY8c7
	nTyOlkzwy1EvnQSSabnnCt4SC15legg/52TUiE/vSDF0zlgB5J8d61IDCF4PNW59jzhCjZlJzdACz
	QBpxFTKIfUcAFjMGkMJ5SWBrBp8m7sv631cP4FtMXOY2QxsI56hn/vf/FHwB9jFtZJ9UYrVvr015r
	ZFloEk7h8FImuTFFKdpmhHta+VuzCNM/ZReiMNILBsD3uMvRuqjNQeTcw3RZY00pibInZUxJS/W2r
	sLMLTPlkJjji9m4OBb9IRFvgBvYw8Ag1w1VGw69BYO0byc01o8cWJF9X/Q1/3UZCvE0/4xMV+Afvq
	sKI1vwABvVmqfnEbWktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q585X-007TYl-1t;
	Fri, 02 Jun 2023 16:57:19 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q585V-007TYQ-1t
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 16:57:18 +0000
Received: by verein.lst.de (Postfix, from userid 2005)
	id 92B1B68AA6; Fri,  2 Jun 2023 18:57:13 +0200 (CEST)
Date: Fri, 2 Jun 2023 18:57:13 +0200
From: Torsten Duwe <duwe@lst.de>
To: Conor Dooley <conor@kernel.org>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	yanhong.wang@starfivetech.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Add StarFive JH7110 PLL
 clock generator
Message-ID: <20230602165713.GA27915@lst.de>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com> <20230512022036.97987-2-xingyu.wu@starfivetech.com> <20230519135733.GA10188@lst.de> <20230519-smokeless-guileless-2a71cae06509@wendy> <df43411e-8982-74f5-6148-e7281c37dada@starfivetech.com> <20230602183922.649b8e88@blackhole.lan> <20230602-drained-wheat-b6c5ea009f16@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230602-drained-wheat-b6c5ea009f16@spud>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_095717_771193_53CA4468 
X-CRM114-Status: UNSURE (   9.32  )
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

On Fri, Jun 02, 2023 at 05:43:25PM +0100, Conor Dooley wrote:
> > 
> > Can you _please_ point me at that "PLL driver" "in Linux" ?
> 
> It's patch 2 in this series:
> https://lore.kernel.org/linux-riscv/20230512022036.97987-1-xingyu.wu@starfivetech.com/T/#m4b2d74c36b3bb961a1187ec5cda1a0a0de875f0e
> 
Unfortunately, it's not, AFAICS. I'm looking for the driver that
will control the PLLs' parameters, grepping for "pll" should yield
results, to start with. The thing should act on the SYS_SYSCON iomem,
at 0x13030000. Ideally, a DT node should point it there...

	Torsten

 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
