Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2792EC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 10:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBdfeV25TC9TYtkE2Vg317MJE2ZsrDFFwo+NPiWcMI4=; b=FvTL47RHvBQjtD
	li2GVqBlQruiUa47rMl/uD9IR5fhTE+2hn/TLb3Ta/BrryiElKmBZZwoEJDNDgU14JqxTmXOjs7+e
	LCMnmCYS5N9JcUrTNcBUmSlq7Ba5U5/7ECAxL+XphgHVRrrhrl6JHQzT/IxEtA4WTqC4JiXpg5C35
	BfFZat5NycI0eSrbCHhvwDTu8H+g5jmCimrtuI33f4C5SsfvpQ5FrR94vgwH2zQl0yXh+G60EMzuO
	QH+0npJxdbyOxPmM6SCHRh4vHxT9ipdaOhqEGGwUQoJg5E0B5T0FDbAg2VwqQ8PuZRcWik8jJ4gpF
	wRm+GfW0mSq5O6UR3Ydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ8CY-00CLbz-Er; Mon, 06 Mar 2023 10:36:18 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ8CU-00CLXV-AN; Mon, 06 Mar 2023 10:36:16 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 449AB24E2E3;
	Mon,  6 Mar 2023 18:35:45 +0800 (CST)
Received: from EXMBX071.cuchost.com (172.16.6.81) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Mar
 2023 18:35:45 +0800
Received: from [192.168.125.108] (183.27.97.46) by EXMBX071.cuchost.com
 (172.16.6.81) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Mar
 2023 18:35:44 +0800
Message-ID: <7c314cc7-0377-ac42-8925-79abc9dcb86f@starfivetech.com>
Date: Mon, 6 Mar 2023 18:35:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/3] Add JH7110 USB driver support
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Emil Renner Berthing <kernel@esmil.dk>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak
	<pawell@cadence.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Peter
 Chen" <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, "Aswath
 Govindraju" <a-govindraju@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230306095212.25840-1-minda.chen@starfivetech.com>
 <ZAW/DqprkKaop4bg@wendy>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <ZAW/DqprkKaop4bg@wendy>
X-Originating-IP: [183.27.97.46]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX071.cuchost.com
 (172.16.6.81)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_023614_695629_E5E2601F 
X-CRM114-Status: GOOD (  14.03  )
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



On 2023/3/6 18:23, Conor Dooley wrote:
> Hey Minda!
> 
> On Mon, Mar 06, 2023 at 05:52:12PM +0800, Minda Chen wrote:
>> This patchset adds USB driver for the StarFive JH7110 SoC.
>> USB work mode is peripheral and using USB 2.0 PHY in VisionFive 2 board.
>> The patch has been tested on the VisionFive 2 board.
>> 
>> This patchset should be applied after the patchset [1] and patch [2]:
>> [1] https://lore.kernel.org/all/20230221083323.302471-1-xingyu.wu@starfivetech.com/
>> [2] https://lore.kernel.org/all/20230215113249.47727-4-william.qiu@starfivetech.com/
>> 
>> patch 1 is usb phy dt-binding document.
>> patch 2 is the glue layer of Cadence USB3 and USB phy
>> setting. USB controller IP is Cadence USB3. 
>> patch 3 is USB device tree configuration.
>> 
>> Minda Chen (3):
>>   dt-bindings: phy: Add StarFive JH7110 USB dt-binding
>>   usb: cdns3: add StarFive JH7110 USB glue layer
>>   dts: usb: add StarFive JH7110 USB dts configuration.
> 
> Unfortunately, this patchset hasn't really landed correctly.
> Usually, in a series, patches are sent as replies to the cover letter.
> Git's send-email will do this for you if you pass it multiple patches
> and a cover letter (I do it by passing a directory, eg patches/foo/v1)
> 
> It appears that you have sent each patch separately, and to different
> recipients, which makes this harder to review.
> Please re-submit this with proper threading (and as v2 ideally, so that
> Greg's bot doesn't complain).
> 
> Thanks,
> Conor.
I am sorry about this. I will re-summit this patchset as v2 patch.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
