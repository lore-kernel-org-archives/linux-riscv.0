Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2BDC5479D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 08:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VLutfv2hWt4IDTQjleccmX3xqAI2W68orcYjKTqB5W8=; b=2bWy4108GseR5w
	JAGx9myZ2Ozc9thJgQ89MO+/AOs+sTzo+FRCZBcEQIPILWI+T7X7KOjIe8YPi7JyNkUQEKBb/0OP0
	ZHGeKjDQclT+DJKYEkdA2ndJqNZRN2sFIpOqNIOCjpVfoW9AMKnZ7PBZ4+a/rUnjctYAnAyywdAii
	PjXntuCLutNoKYyL3u1iUfLKqX0Ipa5Iytf+m6ySRvUzh0xx70gVtLaGcBIVRpWl/yXSLlNTiLPYG
	rc3jp59vzHRIvL3qDtm5+Yye8H9PogsVw8cvunoFNiAwLB4yK3/7nIu/QE0PiFbH4tLNqFm51v0rc
	aeZmysWWuS5PEN47xNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDiL7-006jnk-9f; Fri, 06 Jan 2023 08:44:37 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDiL0-006jb0-Gw
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 08:44:36 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 73D6924E292;
	Fri,  6 Jan 2023 16:44:07 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 6 Jan
 2023 16:44:07 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 6 Jan
 2023 16:44:06 +0800
Message-ID: <d1c4fb2f-3a88-ef02-f929-77c0e15a6a17@starfivetech.com>
Date: Fri, 6 Jan 2023 16:44:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/3] StarFive's SDIO/eMMC driver support
Content-Language: en-US
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, <linux-kernel@vger.kernel.org>
References: <20221227122227.460921-1-william.qiu@starfivetech.com>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20221227122227.460921-1-william.qiu@starfivetech.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_004430_949928_BB35C7AC 
X-CRM114-Status: GOOD (  17.91  )
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



On 2022/12/27 20:22, William Qiu wrote:
> Hi,
> 
> This patchset adds initial rudimentary support for the StarFive
> designware mobile storage host controller driver. And this driver will
> be used in StarFive's VisionFive 2 board. The main purpose of adding
> this driver is to accommodate the ultra-high speed mode of eMMC.
> 
> The last patch should be applied after the patchset [1]:
> [1] https://lore.kernel.org/all/20221118011714.70877-1-hal.feng@starfivetech.com/
> 
> Changes since v1:
> - Renamed the dt-binding 'starfive,jh7110-sdio.yaml' to 'starfive,jh7110-mmc.yaml'.
> - Changed the type of 'starfive,syscon' and modify its description.
> - Deleted unused head files like '#include <linux/gpio.h>'.
> - Added comment for the 'rise_point' and 'fall_point'.
> - Changed the API 'num_caps' to 'common_caps'.
> - Changed the node name 'sys_syscon' to 'syscon'.
> - Changed the node name 'sdio' to 'mmc'.
> 
> The patch series is based on v6.1-rc5.
> 
> William Qiu (3):
>   dt-bindings: mmc: Add bindings for StarFive
>   mmc: starfive: Add sdio/emmc driver support
>   riscv: dts: starfive: Add mmc node
> 
>  .../bindings/mmc/starfive,jh7110-mmc.yaml     |  72 +++++++
>  MAINTAINERS                                   |   6 +
>  .../jh7110-starfive-visionfive-v2.dts         |  25 +++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  38 ++++
>  drivers/mmc/host/Kconfig                      |  10 +
>  drivers/mmc/host/Makefile                     |   1 +
>  drivers/mmc/host/dw_mmc-starfive.c            | 185 ++++++++++++++++++
>  7 files changed, 337 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
>  create mode 100644 drivers/mmc/host/dw_mmc-starfive.c
> 
> --
> 2.34.1
> 

Hi Rob/Jaehoon,

Could you please help to review and provide comments on this patch series?
Thank you in advance.

Best regards,
William Qiu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
