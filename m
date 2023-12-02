Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B2CC4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 13:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVsGGmqWwYjy/T2XmmaLG1rXBYJCyWWBlL5OSwCl8pc=; b=rKd5YnCpOhLpUv
	p73Sg7a/6iH37m22TNKBmbW0SHwronkdCx8SX1+98wU7ZP/vp/QkSNrSs60cW6mVb4Z+gLPNBPW1F
	tcNdBr4sC3ARXBOaAd1IHhta/RdaaOsjyLYo4s1clfGyprPwvlgLWTG1AhcXdfEMXTy3lMTPhTWNC
	jr6K59NftPo7tV8AR2hQrEYWBfnqra5DL2SDSk0BjoKc4J/7RJzCwV7+ghthF9DVwvfsfrzmv47sQ
	kaJjbGrq6wSfjMaX9KkKoKcHBzoSm7oZOGlxa1wcIG77X1kTyeH4FWnnJt8QyK+oYrM3TKkXF+R/0
	zdz7clndlTMffEnnvzJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9Psy-00Fk1T-0U;
	Sat, 02 Dec 2023 13:18:20 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9Psu-00FjyZ-1z
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 13:18:19 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id AFCB27F98;
	Sat,  2 Dec 2023 21:17:25 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 2 Dec
 2023 21:17:25 +0800
Received: from [192.168.125.85] (113.72.145.176) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 2 Dec
 2023 21:17:24 +0800
Message-ID: <c4154501-5b93-4eaf-8d2d-690809d26c57@starfivetech.com>
Date: Sat, 2 Dec 2023 21:17:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/20] Refactoring Microchip PCIe driver and add
 StarFive PCIe
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
	<kw@linux.com>, Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Daire
 McNamara" <daire.mcnamara@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <20231115114912.71448-1-minda.chen@starfivetech.com>
 <ZWbcjKiSfvp-74CL@fedora.fritz.box> <ZWchVSO6iQbCFwkp@fedora.fritz.box>
 <1168e373-b049-4c17-9cbd-c588bf913bbb@starfivetech.com>
 <ZWn8ebtIDrGF9P5i@fedora.fritz.box>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <ZWn8ebtIDrGF9P5i@fedora.fritz.box>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_051817_002890_45CBBE4B 
X-CRM114-Status: GOOD (  12.26  )
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



On 2023/12/1 23:32, Damian Tometzki wrote:
> On Fri, 01. Dec 15:15, Minda Chen wrote:
>> 
>> 
>> On 2023/11/29 19:32, Damian Tometzki wrote:
>> > On Wed, 29. Nov 07:39, Damian Tometzki wrote:
>> >> Hello Minda,
>> >> 
>> >> i tried this Patchset on Linux-6.6.3 but boot with nvme doesnt work. Linux doesnt find
>> >> /root partition /dev/nvme0n1p4. 
>> >> I dont know if it has anything to do with this patchset ?
>> >> Best regards
>> >> Damian
>> > Hi,
>> > some additional information: 
>> > Begin: Running /scripts/local-block ... done.
>> > Begin: Running /scripts/local-block ... done.
>> > [   11.097653] /soc/pcie@940000000: Failed to get clk index: 1 ret: -517
>> > [   11.104147] pcie-starfive 940000000.pcie: error -ENODEV: failed to get pcie clocks
>> > [   11.111981] /soc/pcie@9c0000000: Failed to get clk index: 1 ret: -517
>> > [   11.118451] pcie-starfive 9c0000000.pcie: error -ENODEV: failed to get pcie clocks
>> > [   11.126371] platform 17020000.pinctrl: deferred probe pending
>> > [   11.132145] platform 16010000.mmc: deferred probe pending
>> > Begin: Running /scripts/local-block ... done.
>> > Begin: Running /scripts/local-block ... done.
>> > 
>> > Damian
>> > 
>> It is get stg clk failed. Did you enable CONFIG_CLK_STARFIVE_JH7110_STG=y?
> Hi,
> 
> it is now a little bit better now i get: 
> Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
> Begin: Running /scripts/local-premount ... done.
> Begin: Waiting for root file system ... Begin: Running /scripts/local-block ... done.
> Begin: Running /scripts/local-block ... done.
> Begin: Running /scripts/local-block ... done.
> Begin: Running /scripts/local-block ... done.
> Begin: Running /scripts/local-block ... done.
> [   13.916056] platform 940000000.pcie: deferred probe pending
> [   13.921668] platform 9c0000000.pcie: deferred probe pending
> [   13.927259] platform 16010000.mmc: deferred probe pending
> Begin: Running /scripts/local-block ... done.
> Begin: Running /scripts/local-block ... done.
> Begin: Running /scripts/local-block ... done.
> 
> 
Hi 
Please check this configuation.
CONFIG_PHY_STARFIVE_JH7110_PCIE=y
CONFIG_PINCTRL_STARFIVE_JH7110=y
CONFIG_PINCTRL_STARFIVE_JH7110_SYS=y
CONFIG_PINCTRL_STARFIVE_JH7110_AON=y

BTW, Maybe you can reply e-mail to me only.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
