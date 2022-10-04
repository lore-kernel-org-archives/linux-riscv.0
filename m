Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E10C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 09:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2JDn+YIVgSftx4deiWa0yAxO9PDrd3Ka6G5jx88HNU=; b=DRIDtaGW71Rbyb
	oiDpqdfGPaxLZAuWqZnb+ems0IRDE3zagdHwy3x2LT2uXKQfFzPcqr+xbWVCYtZkoAge/1/M9hPCF
	SsbErpMff/AakqKZ5hBcvoIDlG92aNBjNlQ5+R374lK6gg1enEA6OyooioIBwhqnEK3J8a8gW6qF6
	qmdV+VGDJhlGg3wqVQFN+C6f20s3yhZdiYkUWWCXhxYt5MOx/JliqyvukGGH0r1ubyC3KmSDvCc0D
	MVZ6nK8BvdBgYDVxWvb1KHhaA3CJWvk06WjQmP7AxCaKv7rGfNtSh4FHH9CJvpiis3AM68aaykPJ2
	z+ytJGtf8qrPSgBIkNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofebf-009E5T-Ji; Tue, 04 Oct 2022 09:52:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofebb-009E3o-Ao
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 09:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664877172; x=1696413172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WDkyn/xwXddNppq/eAkPzbUNzHf3vyZHD7Cpir1HgaU=;
  b=mPP2OED+gPVkiwhQRaqt+HWYAA87hn1wuZhC8uN/DzJxCF8T3SbfZ7mV
   Sxj7hcrKe8O0XGKDhEjrG8vIGE+BdDfMiLDkDNMnCLD8WuGnpFeiK2aZv
   jrmlsy3BWFs+934JfBOOHlh6FaC2yoX6VaNFjS8qQsHljo24ciCzEZLN4
   u5pV8qilCNffPIWhzP9yp5TdKPz9H1XOU1loCfKGPT+TmA5dK2k0+QjKz
   rUlGtn6+gAtDrnauvCdZLuDonPeYy+vyN75vkDTdjFSWDTafDTrfZ4Xju
   /EkuaPwDCGlaDpdMqfwd52LpvcZ1H5nN7tOpMOQ612zhiXx0cXBGjlCeU
   w==;
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="176917311"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Oct 2022 02:52:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 4 Oct 2022 02:52:48 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 4 Oct 2022 02:52:46 -0700
Date: Tue, 4 Oct 2022 10:52:24 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Michael Zhu <michael.zhu@starfivetech.com>, Drew
 Fustini <drew@beagleboard.org>, Emil Renner Berthing <kernel@esmil.dk>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@collabora.com>
Subject: Re: [PATCH v3 0/3] Enable initial support for StarFive VisionFive V1
 SBC
Message-ID: <YzwCWDN4NyIQ8a46@wendy>
References: <20220908142914.359777-1-cristian.ciocaltea@collabora.com>
 <c5169131-486e-9808-ba48-b7abe1be6a99@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5169131-486e-9808-ba48-b7abe1be6a99@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_025251_485550_9FE4904B 
X-CRM114-Status: GOOD (  23.59  )
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

On Mon, Oct 03, 2022 at 02:06:32PM +0300, Cristian Ciocaltea wrote:
> Please let me know if there is anything else missing in order to get this
> queued for merging.

Hey Cristian,

LinusW has applied a conflicting change for 6.1 as he renamed the
pinctrl header that you have moved from one file to another in this
patch [0]. Could you rebase once that lands upstream please?

Thanks,
Conor.

0 - https://lore.kernel.org/linux-riscv/CACRpkdZmmMjVwpHxkJP+Ui0XJgrdZx8kpVybifbwkRB1_uMhAg@mail.gmail.com/

> 
> Thanks,
> Cristian
> 
> On 9/8/22 17:29, Cristian Ciocaltea wrote:
> > The StarFive VisionFive V1 SBC [1] is similar with the already supported
> > BeagleV Starlight Beta board, both being based on the StarFive JH7100 SoC.
> > 
> > In addition to documenting the necessary compatibles, this patch series
> > moves most of the content from jh7100-beaglev-starlight.dts to a new file
> > jh7100-common.dtsi, to be shared between the two boards.
> > 
> > No other changes are required in order to successfully boot the board.
> > 
> > [1] https://github.com/starfive-tech/VisionFive
> > 
> > Changes in v3:
> >   - Added Reviewed-by tag from Krzysztof in patch 1/3
> >   - Optimized patch 2/3 by enabling copy detection on "git format-patch",
> >     as indicated by Krzysztof
> > 
> > Changes in v2:
> >   - Simplified documentation by using 'enum' instead of 'const' in
> >     patch 1/3, according to Conor's review
> >   - Added Reviewed-by tags from Conor
> > 
> > Cristian Ciocaltea (3):
> >    dt-bindings: riscv: starfive: Add StarFive VisionFive V1 board
> >    riscv: dts: starfive: Add common DT for JH7100 based boards
> >    riscv: dts: starfive: Add StarFive VisionFive V1 device tree
> > 
> >   .../devicetree/bindings/riscv/starfive.yaml   |   4 +-
> >   arch/riscv/boot/dts/starfive/Makefile         |   2 +-
> >   .../dts/starfive/jh7100-beaglev-starlight.dts | 153 +-----------------
> >   ...aglev-starlight.dts => jh7100-common.dtsi} |   3 -
> >   .../jh7100-starfive-visionfive-v1.dts         |  20 +++
> >   5 files changed, 25 insertions(+), 157 deletions(-)
> >   copy arch/riscv/boot/dts/starfive/{jh7100-beaglev-starlight.dts => jh7100-common.dtsi} (96%)
> >   create mode 100644 arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
> > 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
