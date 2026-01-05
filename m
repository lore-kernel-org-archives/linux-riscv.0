Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8D9C2A072
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 07:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R76d9DtcTqfROf5XNgdk4jqLBRvXZDAeDQSuN8+yG80=; b=V8P44bUqB4sJXL
	v5ZXGVGEIiPr4CTLjvqWxGQZ2aS6YmdmuGtrd4heFJjEU7z46PmuFFEUcWL8Yzc1ezCcvvemdv+Qk
	V2AWsZJA0mFioa7NF1DCcUmlU9RPBv4hTnaHFeV843tAsB5MVXMfqCFBI20SAztg3X/IV40HVNY52
	IVEFh4NLM3KHGQI3coF0ZEX5T7r4udoKBLe3DcsKKmLtx3mJEcqjOo8P9IVhauNVC3BDlM1mg4B5l
	MtMZf+oL5equLwPag5wCWQG31doPohkd4ta/mXvUai7ddKXuKwqO0yHfCFzhRBljUHvuBQYwQXPDj
	o+RL4SxF9Qmd0Os57DfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfR0-0000000AwBA-1Jur;
	Mon, 05 Jan 2026 07:55:26 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfQy-0000000AwAn-20aw
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 07:55:25 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4A6AD340F29;
	Mon, 05 Jan 2026 07:55:21 +0000 (UTC)
Date: Mon, 5 Jan 2026 15:55:10 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: soc: spacemit: k3: add clock support
Message-ID: <20260105075510-GYA2078702@gentoo.org>
References: <20260103-k3-clk-v4-0-4cccba2360f0@gentoo.org>
 <20260103-k3-clk-v4-1-4cccba2360f0@gentoo.org>
 <20260105-copper-warthog-of-mathematics-883f7c@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260105-copper-warthog-of-mathematics-883f7c@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_235524_543753_B9743C03 
X-CRM114-Status: GOOD (  14.26  )
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

Hi Krzysztof,

On 08:48 Mon 05 Jan     , Krzysztof Kozlowski wrote:
> On Sat, Jan 03, 2026 at 03:44:16PM +0800, Yixun Lan wrote:
> > Add compatible strings for clock drivers to support Spacemit K3 SoC,
> > also includes all the defined clock IDs.
> > 
> > The SpacemiT K3 SoC clock IP is scattered over several different blocks,
> > which are APBC, APBS, APMU, DCIU, MPMU, all of them are capable of
> > generating clock and reset signals. APMU and MPMU have additional Power
> > Domain management functionality.
> > 
> > Following is a brief list that shows devices managed in each block:
> > 
> > APBC: UART, GPIO, PWM, SPI, TIMER, I2S, IR, DR, TSEN, IPC, CAN
> > APBS: various PPL clocks control
> > APMU: CCI, CPU, CSI, ISP, LCD, USB, QSPI, DMA, VPU, GPU, DSI, PCIe, EMAC..
> > DCID: SRAM, DMA, TCM
> > MPMU: various PLL1 derived clocks, UART, WATCHDOG, I2S
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
..
> > @@ -28,7 +30,7 @@ properties:
> >    "#clock-cells":
> >      const: 1
> >      description:
> > -      See <dt-bindings/clock/spacemit,k1-syscon.h> for valid indices.
> > +      See corresponding file under <dt-bindings/clock/> for valid indices.
> 
> List two paths, better. Generic path to clock directory is obvious and
> not helping.
> 
ok, will do

> > @@ -39,7 +43,7 @@ properties:
> >    "#clock-cells":
> >      const: 1
> >      description:
> > -      See <dt-bindings/clock/spacemit,k1-syscon.h> for valid indices.
> > +      See corresponding file under <dt-bindings/clock/> for valid indices.
> 
> Same problem here.
> 
ditto

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
thanks, I will wait few days for incoming reviews, then update

> Best regards,
> Krzysztof
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
