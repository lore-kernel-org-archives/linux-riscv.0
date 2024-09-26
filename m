Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E22CCFA10
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 02:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGOvMb5dR1Ms7kH60ZGajttZ4iB6S2+BjtQ45J6NIaM=; b=aCK5mEpUh0Xhrd
	GTN2q14/L9oVOcnkAGTnR52T/mY8CJtvFO/V+4NzGt7RcFuavr62nL2GmiQHg/QN4Qg1jeQkOxtJ7
	cuAETNS0JiMYr+iBJrg5DVYmSp/85gbd1WjYfJ1O/SgTJOnMnjtLj0Govgw2owNkmx97jw7/nIyoI
	wE2X3AhIe7hfSHx6/J2aYyjQIvUGcekVQLzYcWHAVFydFj068D9UJjGJjeepqEWxC1J+tORQZhTo9
	B68AIvTTHLMVbNW+9YFNMN5V+00UlIVg+WcGeY1CHv+rm62S94jE7XL3HGL2v12qEad2f3kFBRuJx
	qlD7coDJKCK074F3UKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1steE4-00000006ziV-3pRj;
	Thu, 26 Sep 2024 02:27:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1steE2-00000006zi6-1exN
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 02:27:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6B81CA449EC;
	Thu, 26 Sep 2024 02:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C276C4CEC3;
	Thu, 26 Sep 2024 02:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727317645;
	bh=oAyorxBPm/Cikm3nZpdbR5EcjR6Sl2EVi3nU6qHTpJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MZVLq0Vy+vdaWyht46uOgx/XtHk9NtrDA9rxwmswKHp7HNhxpPntd6umjikaEY9+Y
	 sIRs3cmIPCvfEiK6DdfiNaIWy/3KyWSZHW58ApaDFvpuQSniX0qKqa8skFnZUbUczm
	 NIpURJkKWJMEHK/+CNqH8tpb1J4bUbo4qJteFxkIjM1cwWQU3pdeB/euIEMi19XJNW
	 nT8PX/OpxeYdQpLE4Q7tEsP22wBPKyEift32WVp6NFLJvG7R1x0ml8gRHLC1SZUFLp
	 +lZRxq7Wxgy6PzwfWItXQtcsBdgyoOF/MbAPyXRhKP8ySbb9OhxaBJJuxyE4WDvGMX
	 k6cN29VoFUUFQ==
Date: Wed, 25 Sep 2024 21:27:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Heiko Stuebner <heiko.stuebner@cherry.de>, huiming.qiu@deepcomputing.io,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Drew Fustini <drew@beagleboard.org>, devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, ams@frame.work,
	linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	yuning.liang@deepcomputing.io, Palmer Dabbelt <palmer@dabbelt.com>,
	dhs@frame.work, Emil Renner Berthing <kernel@esmil.dk>,
	gregkh@linuxfoundation.org, rafal@milecki.pl,
	Michael Zhu <michael.zhu@starfivetech.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] dt-bindings: riscv: starfive: add
 deepcomputing,fm7110
Message-ID: <172731764343.2408451.17518519713927654729.robh@kernel.org>
References: <20240925053123.1364574-3-sandie.cao@deepcomputing.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925053123.1364574-3-sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_192726_522842_1EB218A5 
X-CRM114-Status: GOOD (  12.35  )
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


On Wed, 25 Sep 2024 13:31:22 +0800, Sandie Cao wrote:
> Add deepcomputing,fm7110 into compatible list.
> 
> DeepComputing is creating a RISC-V Framework Laptop 13 Mainboard
> powered by a StarFive JH7110 processor.This is a developer-focused
> product, aimed at making tinkering with RISC-V more accessible.
> The Mainboard is under development and we'll share more on functionality,
> compatibility, and availability as the program progresses.
> 
> For this Mainboard, the Model name in Framework is Framework FRANME0000;
> the Model name in DeepComputing is DeepComputing fm7110.
> 
> The board features:
> 
> - JH7110 SoC
> - 8 GiB LPDDR4 DRAM
> - 1x Type-c(PD3.0:60W Max;usb3.2 Gen1;usb2.0;DP1.4:4K@30Hz/2.5K@60Hz)
> - 1x Type-c(PD3.0:60W Max,usb3.2 Gen1;usb2.0)
> - 2x Type-c(usb3.2 Gen1;usb2.0)
> - 1x eMMC slot Support 32G/128G
> - 1x MicroSD slot
> - 1x QSPI Flash
> - 1x PCIe Wi-Fi (Support AMD RZ616 Wi-Fi 6E,Intel Wi-Fi 6E AX210 No vPro)
> 
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
