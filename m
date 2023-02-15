Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CD8C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 01:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dWs9CZPk9d6qq/YOQAKZv3KMSF2PqTG+GijV4TkHl14=; b=f94Qh3LDVZJ9b3
	CGqVBkDd7rS3X7tcgnPxSL6xd7PcIlIB/IoEuE4Ng6yJJbvRji2Wt+n1Ir7vaCDeQPPd93We8G9sr
	WJWtgwoL3dLP4511UNWbkytEMeQOW9uHHnQJnXNKLoT+vUjS0m7pZUHi0Y/WXbQAHJBF7WKIlixc3
	ftppq4ZY0rds3Ci3Pqo26gYxZkqyfIcFicrJefuIHsLtXLxH5Y687uZdh+P7OZqbDASwkYdH/68Xv
	LAHmTmR2ddNxo9QX76XJCTTUrqku/TjJpcQJautfXmQe1Qow3iBIWMZKictR9yftMsm726yBbB4Q6
	glL488MsxynkKxr47nCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS72e-004Kji-EA; Wed, 15 Feb 2023 01:57:04 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS72b-004KiH-4U
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 01:57:03 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id CE48E24E249;
	Wed, 15 Feb 2023 09:56:45 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Feb
 2023 09:56:45 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Feb
 2023 09:56:45 +0800
Message-ID: <c8e1e030-59a5-107b-d1a3-0ad7e289a419@starfivetech.com>
Date: Wed, 15 Feb 2023 09:56:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 0/3] StarFive's SDIO/eMMC driver support
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, <linux-kernel@vger.kernel.org>
References: <20230203081913.81968-1-william.qiu@starfivetech.com>
 <CAPDyKFqei-GjKpBUQnDZUbYnSyn-JS5f_EnTLOuA1U4PdYTyVA@mail.gmail.com>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <CAPDyKFqei-GjKpBUQnDZUbYnSyn-JS5f_EnTLOuA1U4PdYTyVA@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_175701_519638_374F7831 
X-CRM114-Status: GOOD (  14.19  )
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



On 2023/2/14 20:18, Ulf Hansson wrote:
> On Fri, 3 Feb 2023 at 09:19, William Qiu <william.qiu@starfivetech.com> wrote:
>>
>> Hi,
>>
>> This patchset adds initial rudimentary support for the StarFive
>> designware mobile storage host controller driver. And this driver will
>> be used in StarFive's VisionFive 2 board. The main purpose of adding
>> this driver is to accommodate the ultra-high speed mode of eMMC.
>>
>> The last patch should be applied after the patchset [1]:
>> [1] https://lore.kernel.org/all/20221220011247.35560-1-hal.feng@starfivetech.com/
>>
>> Changes since v2:
>> - Wraped commit message according to Linux coding style.
>> - Rephrased the description of the patches.
>> - Changed the description of syscon regsiter.
>> - Dropped redundant properties.
>>
>> The patch series is based on v6.1.
>>
>> William Qiu (3):
>>   dt-bindings: mmc: Add StarFive MMC module
>>   mmc: starfive: Add sdio/emmc driver support
>>   riscv: dts: starfive: Add mmc node
>>
>>  .../bindings/mmc/starfive,jh7110-mmc.yaml     |  77 ++++++++
>>  MAINTAINERS                                   |   6 +
>>  .../jh7110-starfive-visionfive-2.dtsi         |  23 +++
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  37 ++++
>>  drivers/mmc/host/Kconfig                      |  10 +
>>  drivers/mmc/host/Makefile                     |   1 +
>>  drivers/mmc/host/dw_mmc-starfive.c            | 185 ++++++++++++++++++
>>  7 files changed, 339 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
>>  create mode 100644 drivers/mmc/host/dw_mmc-starfive.c
>>
> 
> Patch 1 and patch 2 applied for next, thanks!
> 
> Note that I fixed some checkpatch errors/warnings. Next time, please
> run ./scripts/checkpatch.pl before you submit your patches.
> 
> Kind regards
> Uffe
z
Hi Uffe,

Sorry about that, I'll check the patches before submit next time.
Thanks for taking time reviewing this patch series.

Best Regards
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
