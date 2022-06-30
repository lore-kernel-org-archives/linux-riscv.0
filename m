Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8217C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOJjGNEZTtMyCcOtVBikSZ7nvdz+GQYwaSY2TXdV9vk=; b=hOJysTTFfyXJ6F
	I1Wjze1APDco4NcnMdvl5kDqGCiWPrYlBeLHtMfV0BE9iHHInbOeB3NdDR3e7MxKKY3iQB/0qUh7N
	Y1RmfCUMHyz3JxDaiYWurnIc1JhcPh38FOpgJMYbZMgCarEwwCqwrslidKTU8C7Obb1mtzaBF9hYz
	CeGshBsORGV9ACe1ojhEEo8ZWKIMwZTrENhBFSGHMQyBz+4ERya2cZsPT6g373MyakXWzIXyyOOuT
	8RJS7N1589qsgIVPUA66yZtsBxzcHRVzuqjQ29LYHaqWIoGQfa1UoToA2/1z6SfygeLYoxvySi4jS
	aFiD5AwFrnbYNbo1iFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wcc-000TiD-AX; Thu, 30 Jun 2022 16:02:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wca-000TgN-Ar
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 16:02:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 499C760FC3;
	Thu, 30 Jun 2022 16:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8CCC34115;
	Thu, 30 Jun 2022 16:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656604942;
	bh=hwWzVmDS+Gn+ZGTxrGxGrVhSXn7V3fn4x4DATS7HEPE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hGlt1AE1GAEQ1udAHkqLsbPVLAANFrSQJyHnl1Gp6uB/WV7Z5/r7TECpRJ5VuY9EM
	 ykFlKGuENWnEsf5ktVfrUo7aIqSihmvThn4Ybio+0yD2wpErYIiD5gpW1s+XnQh0lt
	 zU7Tw8Lp0Hv75ZWDhud71GhnioD3rKUX5I8HZUBf1luOksx0n2LvAdNB6pI6A0y0Zc
	 iATfNeWSgfc4o/hzJhng+A6mFsw9lLoDXFvt7O4QYrsAKw19ElxwOa1p51j8UgyqZE
	 Mo1jogC/R7V8m8rHdpW3ba/q2Ag2tqoOwOcsRK8Sesr4PBDgVNvwcZ6BXQBGXue15q
	 5R+4ngfQY/fpA==
Date: Thu, 30 Jun 2022 09:02:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 "Daire McNamara" <daire.mcnamara@microchip.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 06/14] net: macb: add polarfire soc reset support
Message-ID: <20220630090220.7ee5c7a7@kernel.org>
In-Reply-To: <20220630080532.323731-7-conor.dooley@microchip.com>
References: <20220630080532.323731-1-conor.dooley@microchip.com>
	<20220630080532.323731-7-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_090224_456074_A7AF5646 
X-CRM114-Status: UNSURE (   9.89  )
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

On Thu, 30 Jun 2022 09:05:25 +0100 Conor Dooley wrote:
> To date, the Microchip PolarFire SoC (MPFS) has been using the
> cdns,macb compatible, however the generic device does not have reset
> support. Add a new compatible & .data for MPFS to hook into the reset
> functionality added for zynqmp support (and make the zynqmp init
> function generic in the process).
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Please repost 2 and 6 separately with [PATCH net-next] in the subject.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
