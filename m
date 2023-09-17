Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08362CD37B3
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 08:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uJRE92kaRMC+5XEebjJCgfaJFlw3jIl7AFw4uDjEGYQ=; b=YMqz/gC1E+6mB6
	wTCyBFtj8qlx1tJBk/3jvTLz9JX4TNQ9vWmz5CFZcDow9dYMNdyb1PDY5Mh0ZfWUBPG7pcrjVYzLe
	dDfBjaZR67TAqFh3r0ChvVZhMx7Srl8CjH0tlb11lNc2wNEE9H3CckXuwtZMcvickaSsZu5yg/xBF
	NE7cpqIJRRNA7Lu3X1pSlYkAqu72yV9uBUSpUTv0OT7pwaE1/TaWWJoU3Ct7QvBRTh6k6W8oBJ9EA
	MrTGAn2kaPJlEJQ+K3PngwvB2QKafuLzbEQ60h7cI0boeL0jGLd+zkuYsFiBx+qe4XokAP01fa74z
	KkJzeKjqu32WA+PTrvrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhnTf-00DLK7-0f;
	Sun, 17 Sep 2023 08:50:03 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhnTc-00DLIE-0U
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 08:50:02 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 6C53224DCA6;
	Sun, 17 Sep 2023 16:49:20 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 17 Sep
 2023 16:49:20 +0800
Received: from [192.168.125.57] (113.72.144.67) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 17 Sep
 2023 16:49:19 +0800
Message-ID: <0ce30520-7286-dfa0-2e16-e5145b950945@starfivetech.com>
Date: Sun, 17 Sep 2023 16:49:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 02/19] PCI: microchip: Move pcie-microchip-host.c to
 plda directory
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel
	<p.zabel@pengutronix.de>, Mason Huo <mason.huo@starfivetech.com>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, Kevin Xie <kevin.xie@starfivetech.com>
References: <20230915102243.59775-1-minda.chen@starfivetech.com>
 <20230915102243.59775-3-minda.chen@starfivetech.com>
 <20230916-outcome-obedient-fda7043bcca7@spud>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230916-outcome-obedient-fda7043bcca7@spud>
X-Originating-IP: [113.72.144.67]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_015000_490158_4F557F63 
X-CRM114-Status: GOOD (  12.62  )
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



On 2023/9/16 8:09, Conor Dooley wrote:
> On Fri, Sep 15, 2023 at 06:22:26PM +0800, Minda Chen wrote:
>> For Microchip Polarfire PCIe host is PLDA XpressRich IP,
>> move to plda directory. Prepare for refactor the codes.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  MAINTAINERS                                        |  2 +-
>>  drivers/pci/controller/Kconfig                     |  9 +--------
>>  drivers/pci/controller/Makefile                    |  2 +-
>>  drivers/pci/controller/plda/Kconfig                | 14 ++++++++++++++
>>  drivers/pci/controller/plda/Makefile               |  2 ++
>>  .../controller/{ => plda}/pcie-microchip-host.c    |  2 +-
>>  6 files changed, 20 insertions(+), 11 deletions(-)
>>  create mode 100644 drivers/pci/controller/plda/Kconfig
>>  create mode 100644 drivers/pci/controller/plda/Makefile
>>  rename drivers/pci/controller/{ => plda}/pcie-microchip-host.c (99%)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 90f13281d297..b1050804e6d2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -16647,7 +16647,7 @@ M:	Daire McNamara <daire.mcnamara@microchip.com>
>>  L:	linux-pci@vger.kernel.org
>>  S:	Supported
>>  F:	Documentation/devicetree/bindings/pci/microchip*
>> -F:	drivers/pci/controller/*microchip*
>> +F:	drivers/pci/controller/plda/*microchip*
> 
> The riscv patchwork automation is complaining that you have added
> maintainers pattern errors with this patch. If you run
> ./scripts/get_maintainer.pl --self-test=patterns
> it'll tell you what the bad pattern is. Not sure why I never actually
> dumped the output of that test into the failure report, so I can't
> immediately tell you what is wrong.
Okay. I will check this.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
