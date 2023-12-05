Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77135C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 01:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjbuqkDyT1pY0RdboZ+l5njjiaqWSrUqLszOOrX9MAM=; b=UHRSexs7JmLy+U
	Fuxg/8qXrBxp7ZU2sVQ0Khnhvth+MmrqiPTZ00xob9FJi9W+mmVGkbQVfo1lKMx6ACSJVo8rY+pxD
	18JgE4aiQj66X32qPtHNlZ3x2XAwOSofnoeDLTCYtmVmWlB1hDzPZmyEvxfnOPzkXwogCh6NSOFUu
	YKTSLAN+GOt64y5g4g+bU3aEPa+SeRtcd+jEPB6OLhUEcvGZTYgk5uWq/VtYWpPOeGOXS6LtVD1Os
	LCAuutnIwW1pqRSqOnpV/toidONk3/yMO0tW9fIdszDbYrw+mHSVIKkiVjl+iqplazGqhcqRIuoIX
	6kclm2+X63XkXYgAF1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAK8n-005wxB-0F;
	Tue, 05 Dec 2023 01:22:25 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAK8k-005wvV-05
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 01:22:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 765B324E2AC;
	Tue,  5 Dec 2023 09:21:47 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 5 Dec
 2023 09:21:47 +0800
Received: from [192.168.125.85] (183.27.97.199) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 5 Dec
 2023 09:21:46 +0800
Message-ID: <bf902215-8188-4592-ad9a-3417c4950cb2@starfivetech.com>
Date: Tue, 5 Dec 2023 09:21:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/20] Refactoring Microchip PCIe driver and add
 StarFive PCIe
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
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
References: <20231204212807.GA629695@bhelgaas>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20231204212807.GA629695@bhelgaas>
X-Originating-IP: [183.27.97.199]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_172222_225045_ECDBDF99 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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



On 2023/12/5 5:28, Bjorn Helgaas wrote:
> On Sat, Dec 02, 2023 at 09:17:24PM +0800, Minda Chen wrote:
>> ...
>> Please check this configuation.
>> CONFIG_PHY_STARFIVE_JH7110_PCIE=y
>> CONFIG_PINCTRL_STARFIVE_JH7110=y
>> CONFIG_PINCTRL_STARFIVE_JH7110_SYS=y
>> CONFIG_PINCTRL_STARFIVE_JH7110_AON=y
>> 
>> BTW, Maybe you can reply e-mail to me only.
> 
> There's usually no benefit to replying off-list.  The list archives
> are very valuable for future maintenance because they help us
> understand the reason things were done a certain way.
> 
> Bjorn

I am sorry about this. I thought this have nothing to do with codes review and disturb the maintainer.
Now Damian can work with PCIe in VisionFive v2 board.  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
