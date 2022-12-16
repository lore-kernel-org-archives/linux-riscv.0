Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00595C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 02:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8tq8cMI4JKq9kWkVU8P1//CQgI9jBS6VA+vAUQO0xkA=; b=eNCJttxJ2pQj6v
	x/kLBGOqeg3sxZkSIFlxPLwDME8+QwDZkkda1QMCA9x7AMtVBWYo5qN3PyTZNFFhk9CevDSoHLVjl
	oSGcOLuyOgw93huiv42Kk/jB6vDkGPy7IN11KAppi6CKm3xJmVICCmRHC0uBPm1qxojw3H9tW5hCh
	BRmnKWr9RuRoUv6/nGNpwVNtyYEWlEXe+Dwo+25gHfBhyf0NI0uxbbx01EEBYqUvgEjzkKNYVCVKq
	hZwI8kMhlZ7yaLipQbeCiYoX/QXpFz/5aRqGwdb9aDM82scvMSMc7y7CVpCfhGhPqG6ZHqSc+hzqE
	X2S84HkIfGwjz2oR/Vhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6041-00CKiU-Uq; Fri, 16 Dec 2022 02:03:05 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p603x-00CKZ7-DD
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 02:03:04 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1AD9E24E00A;
	Fri, 16 Dec 2022 10:02:06 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 16 Dec
 2022 10:02:06 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 16 Dec
 2022 10:02:05 +0800
Message-ID: <420d067c-665b-b247-b0cd-8ac242c19924@starfivetech.com>
Date: Fri, 16 Dec 2022 10:02:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 0/3] StarFive's SDIO/eMMC driver support
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, <linux-kernel@vger.kernel.org>
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20221207131731.1291517-1-william.qiu@starfivetech.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_180301_818731_2C0D3234 
X-CRM114-Status: GOOD (  14.43  )
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



On 2022/12/7 21:17, William Qiu wrote:
> Hi,
> 
> This patchset adds initial rudimentary support for the StarFive
> designware mobile storage host controller driver. And this driver will
> be used in StarFive's visionfive-v2 board. The main purpose of adding
> this driver is to accommodate the ultra-high speed mode of eMMC.
> 
> The patch series is based on v6.1-rc5.
> 
> -- William
> 
> William Qiu (3):
>   dt-bindings: mmc: Add bindings for StarFive
>   mmc: starfive: Add sdio/emmc driver support
>   riscv: dts: starfive: Add mmc node
> 
>  .../bindings/mmc/starfive,jh7110-sdio.yaml    |  71 +++++++
>  MAINTAINERS                                   |   6 +
>  .../jh7110-starfive-visionfive-v2.dts         |  25 +++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  38 ++++
>  drivers/mmc/host/Kconfig                      |  10 +
>  drivers/mmc/host/Makefile                     |   1 +
>  drivers/mmc/host/dw_mmc-starfive.c            | 197 ++++++++++++++++++
>  7 files changed, 348 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.yaml
>  create mode 100644 drivers/mmc/host/dw_mmc-starfive.c
> 
> --
> 2.34.1
> 

Hi Jaehoon/Ulf,

Could you please help to review and provide comments on this patch series?
Thank you in advance.

Best regards,
William Qiu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
