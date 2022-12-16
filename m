Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57ED2C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 09:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LmXIGF9415fJkaOD1fMiYR2csF4AWBdaVl5XAWH2b/w=; b=LO+qrWScg101nP
	3h8E4bPp+8mnPiGCp6FmFXuhPObcOuHNdNBn7hiu5plc7MgmgAFuSPKYXwmQXnKGslVkPXI5yXSv3
	23OlAfeJS0KUHM4qBN/y0T7JCThk3LRZ4w1xn53h3kxTyaW5lm3+VDnf3h1bV63xwKlE7QLsQe8Pg
	TpiZud+C3PGQFwaYegdx+Lp0w9THk/YlpzT4Aiy9jt7/BSDMs2nSGowuLv11S3HTe+xA8uycU2IkP
	GN+MoXFVaFpVqTTRlPuR4cEoil7v2luKKUoXRmit7/5CVUtSZEaCCkoYGpWhKpts4B2a1VAUcXEFY
	CMkLxTLBPnzG0JXTzL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p670A-00DnTz-T0; Fri, 16 Dec 2022 09:27:34 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6707-00DnRf-Iv
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 09:27:34 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 55FBE24E1AC;
	Fri, 16 Dec 2022 17:26:58 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 16 Dec
 2022 17:26:58 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 16 Dec
 2022 17:26:57 +0800
Message-ID: <e704e829-e67c-5458-0808-bc652c1e5620@starfivetech.com>
Date: Fri, 16 Dec 2022 17:26:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 0/3] StarFive's SDIO/eMMC driver support
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, <linux-kernel@vger.kernel.org>
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <420d067c-665b-b247-b0cd-8ac242c19924@starfivetech.com>
 <CAPDyKFoosrm9CSi4s=YSxdg4xqv118wOFUAc5QRcOgtMCiX=DA@mail.gmail.com>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <CAPDyKFoosrm9CSi4s=YSxdg4xqv118wOFUAc5QRcOgtMCiX=DA@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_012731_933338_FA170BE5 
X-CRM114-Status: GOOD (  19.68  )
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



On 2022/12/16 17:22, Ulf Hansson wrote:
> On Fri, 16 Dec 2022 at 03:02, William Qiu <william.qiu@starfivetech.com> wrote:
>>
>>
>>
>> On 2022/12/7 21:17, William Qiu wrote:
>> > Hi,
>> >
>> > This patchset adds initial rudimentary support for the StarFive
>> > designware mobile storage host controller driver. And this driver will
>> > be used in StarFive's visionfive-v2 board. The main purpose of adding
>> > this driver is to accommodate the ultra-high speed mode of eMMC.
>> >
>> > The patch series is based on v6.1-rc5.
>> >
>> > -- William
>> >
>> > William Qiu (3):
>> >   dt-bindings: mmc: Add bindings for StarFive
>> >   mmc: starfive: Add sdio/emmc driver support
>> >   riscv: dts: starfive: Add mmc node
>> >
>> >  .../bindings/mmc/starfive,jh7110-sdio.yaml    |  71 +++++++
>> >  MAINTAINERS                                   |   6 +
>> >  .../jh7110-starfive-visionfive-v2.dts         |  25 +++
>> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  38 ++++
>> >  drivers/mmc/host/Kconfig                      |  10 +
>> >  drivers/mmc/host/Makefile                     |   1 +
>> >  drivers/mmc/host/dw_mmc-starfive.c            | 197 ++++++++++++++++++
>> >  7 files changed, 348 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.yaml
>> >  create mode 100644 drivers/mmc/host/dw_mmc-starfive.c
>> >
>> > --
>> > 2.34.1
>> >
>>
>> Hi Jaehoon/Ulf,
>>
>> Could you please help to review and provide comments on this patch series?
>> Thank you in advance.
> 
> Hi William,
> 
> Looks like you have received plenty of good comments already and there
> are a lot of things for you to update. That said, I think it makes
> better sense for me to look at the next version instead.
> 

Fine, I'll do that then.

Thanks
William Qiu

>>
>> Best regards,
>> William Qiu
> 
> Kind regards
> Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
