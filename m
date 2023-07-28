Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C5FC41513
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 08:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JcpQfrY/cFEw8sr0gHc0wgTWUiznW92PFzuBy3A7/ac=; b=x48Y56W1ReqX4N
	y+9vczT2PlKH/9QcD7DlSXqYMNLHj7VOB3c0B3CwFm0eDz117QF8qc5eCzaujV27Idfq+dq3NSqV2
	GCB7ddomXHodNaDeOKlV+MdnwLzXsI8qyCTz9kGgHLhrWFDoFr3uvFtiiVTla+ytZL1XSp3hk9ZrX
	sDB3iUHMSamR+Mf4yG8PbZ4bDyJxDgcPad8u+f5UztkdTRMBlhiX7erXge+FUUbqX12jQVIzTOIlv
	Z5tf5uQ0L9S1nCBm87ztnJi/n0JxiCeLqlJTDItwSmNyPfOx6QrQBNKJj0tSf45ks8iFPXW6E5rFA
	dxHW3wL0KdFUPB5aDB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJ94-002ScB-2Y;
	Fri, 28 Jul 2023 08:48:22 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJ90-002SEy-2M
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 08:48:21 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 561BF24E355;
	Fri, 28 Jul 2023 16:47:30 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 28 Jul
 2023 16:47:30 +0800
Received: from [192.168.120.59] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 28 Jul
 2023 16:47:29 +0800
Message-ID: <51547f1a-4eb4-2ccd-1e06-8adb2b4b70bd@starfivetech.com>
Date: Fri, 28 Jul 2023 16:47:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 0/3] Add initialization of clock for StarFive JH7110
 SoC
To: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu
	<ziv.xu@starfivetech.com>
References: <20230719092545.1961401-1-william.qiu@starfivetech.com>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20230719092545.1961401-1-william.qiu@starfivetech.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_014819_192840_89693628 
X-CRM114-Status: GOOD (  17.93  )
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



On 2023/7/19 17:25, William Qiu wrote:
> Hi,
> 
> This patchset adds initial rudimentary support for the StarFive
> Quad SPI controller driver. And this driver will be used in
> StarFive's VisionFive 2 board. In 6.4, the QSPI_AHB and QSPI_APB
> clocks changed from the default ON state to the default OFF state,
> so these clocks need to be enabled in the driver.At the same time,
> dts patch is added to this series.
> 
> Changes v4->v5:
> - Rebased to v6.5rc2.
> - Changed the way to initialization the clocks.
> - Changed the layout for the SPI flash.
> 
> Changes v3->v4:
> - Added minItems for clocks.
> - Added clock names property.
> - Fixed formatting issues.
> 
> Changes v2->v3:
> - Rebased to v6.4rc6.
> - Renamed the clock names.
> - Changed the variable definition type.
> 
> Changes v1->v2:
> - Renamed the clock names.
> - Specified a different array of clocks.
> - Used clk_bulk_ APIs.
> 
> The patch series is based on v6.5rc2.
> 
> William Qiu (3):
>   dt-bindings: qspi: cdns,qspi-nor: Add clocks for StarFive JH7110 SoC
>   spi: cadence-quadspi: Add clock configuration for StarFive JH7110 QSPI
>   riscv: dts: starfive: Add QSPI controller node for StarFive JH7110 SoC
> 
>  .../bindings/spi/cdns,qspi-nor.yaml           | 12 +++-
>  .../jh7110-starfive-visionfive-2.dtsi         | 36 ++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 19 ++++++
>  drivers/spi/spi-cadence-quadspi.c             | 67 +++++++++++++++++++
>  4 files changed, 133 insertions(+), 1 deletion(-)
> 
> --
> 2.34.1
> 
Hi everyone,

Could you please help me review this patch series to see if there is
anything that needs to be modified?
Thanks for taking time to review this patch series.

Best Regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
