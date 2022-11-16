Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A25C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 17:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftTADaAXFTBJE5N5h5qyWG4r/eRhIaa+m1dN2tl933w=; b=2dkDZJvpue5NsI
	x4cT9pThN3s4J4SDhv4NsHG3dQCY5ngBg55yffdg2NhRmeMaZhIKLfn4DV7G1V7oZn9aJJgcD7XH4
	Kv9yYLfDLamV1mX/bJlRHlT6UcSTB1ibkVHDXpBSjFwbrcVUu3bPfeyLVIpE43FyAY4rhDP84VZJR
	8O6IoI+Lh0A7ez4bxQ5TQsuq/H4IAmH3wrD8O+ul5o4KgTGeJy8HqEO/GkoLpFb3TKJm7evD/W4st
	oMeaLIVyY7/aTJkjahW2JBunpKXvY7moh+KTkm6gJEzA9wiwdwkKNDqWKPNqCpEXXE8Px/sg8Ncwu
	JgGHpdl91C5CeivcmywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovMYt-006ee1-5b; Wed, 16 Nov 2022 17:50:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovMYq-006eYc-6a
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 17:50:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B5A2461CED;
	Wed, 16 Nov 2022 17:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0DEC433C1;
	Wed, 16 Nov 2022 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668621052;
	bh=sYfpAzVzPlK94TgXFu2w+4Eiy5UZCKxlvYioVQA7W0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+3Lf+uCHADtE0GCia3d2ky8ujiTrrIkuWOscMc1Cx8X0BK1qmCSc1aV7TqKmEOCN
	 AMmYUBsKkYe9F9DxfJGNnCXIe3WsLjwmtXiYB90z5c2X84kn4J4ojXQPjU97SNi70l
	 o8RtNTw/E28f7NQvVTLAufSyE9kBlDvvsmkFj71UPdg6Pg3Sw8mk7tYHdDrVQPe9gx
	 5v66uBM0i9fUkn81nwfz2KSfeGtkkOdJ7fwv2piNLIqusmdUAZqshABU5ppTHexBjn
	 PXO9AvKapEFQtHfzfB8R4TswHruXb66mGk9qwHGzAiLC13RFTJZBPlYJKlX/l9WcrV
	 m5do2id/2zeYg==
Date: Wed, 16 Nov 2022 17:50:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v4 0/3] Enable initial support for StarFive VisionFive V1
 SBC
Message-ID: <Y3Ui9mmcvuWMw2AL@spud>
References: <20221017210542.979051-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221017210542.979051-1-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_095056_336758_955724D7 
X-CRM114-Status: GOOD (  21.62  )
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

On Tue, Oct 18, 2022 at 12:05:39AM +0300, Cristian Ciocaltea wrote:
> The StarFive VisionFive V1 SBC [1] is similar with the already supported
> BeagleV Starlight Beta board, both being based on the StarFive JH7100 SoC.
> 
> In addition to documenting the necessary compatibles, this patch series 
> moves most of the content from jh7100-beaglev-starlight.dts to a new file
> jh7100-common.dtsi, to be shared between the two boards.
> 
> No other changes are required in order to successfully boot the board.
> 
> [1] https://github.com/starfive-tech/VisionFive

Hey Cristian,

Apologies for the delay here, we've been sorting out re-routing RISC-V
DT stuff via the SoC tree. That should be sorted now, so I have picked
the series up. Should be at:
https://git.kernel.org/conor/c/a3fe69160c7328a284ebc711ccb689f3beec42dc

Thanks,
Conor.

> 
> Changes in v4:
>  - Rebased onto v6.1.0-rc1
>  - Fixed a conflict in patch 2/3 as pinctrl-starfive.h has been renamed
>    to pinctrl-starfive-jh7100.h
> 
> Changes in v3:
>  - Added Reviewed-by tag from Krzysztof in patch 1/3
>  - Optimized patch 2/3 by enabling copy detection on "git format-patch",
>    as indicated by Krzysztof
> 
> Changes in v2:
>  - Simplified documentation by using 'enum' instead of 'const' in 
>    patch 1/3, according to Conor's review
>  - Added Reviewed-by tags from Conor
> 
> Cristian Ciocaltea (3):
>   dt-bindings: riscv: starfive: Add StarFive VisionFive V1 board
>   riscv: dts: starfive: Add common DT for JH7100 based boards
>   riscv: dts: starfive: Add StarFive VisionFive V1 device tree
> 
>  .../devicetree/bindings/riscv/starfive.yaml   |   4 +-
>  arch/riscv/boot/dts/starfive/Makefile         |   2 +-
>  .../dts/starfive/jh7100-beaglev-starlight.dts | 153 +-----------------
>  ...aglev-starlight.dts => jh7100-common.dtsi} |   3 -
>  .../jh7100-starfive-visionfive-v1.dts         |  20 +++
>  5 files changed, 25 insertions(+), 157 deletions(-)
>  copy arch/riscv/boot/dts/starfive/{jh7100-beaglev-starlight.dts => jh7100-common.dtsi} (96%)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
> 
> 
> base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
> -- 
> 2.38.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
