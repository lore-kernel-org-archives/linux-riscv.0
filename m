Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA23E7D0BB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 01:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kArAlKwPrG2eop5pIQSp1buOkN95BgJQ/rGSK3ioaA=; b=UkUT8HSI3ReJ0w
	0VYGSVUirQdoknLtW9lOf25mKqyYPnapCBz9zHaJqySFUn7v0p455i9B5wGxgS5NpmJCYbXqMzEU3
	wc9ve0VFrxGWJwsGESsrLQ5hhSn8wsAUuUNTCNZz/EOybTIptCZlPKFa1jzMOTrKjXEqI2TfzApWY
	HFZ3kOPEb0+kg+fjJwfvvyq99NaC4+cegLKBWHN5xzfAEQBVO1Dgk5RpRq1j4YnxqU3qF1WpCNEcU
	kgma1k5TIzcrIBkpCK16QP+XkLDWnHdZl7tuCA8GcBcA8Epgve4leUzszTwQf+/it5X4Pxk59tjHA
	/fgmyCnXASw0pFVdR1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjUu3-007XuJ-2t;
	Fri, 22 Sep 2023 01:24:19 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjUtz-007XsV-2c
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 01:24:17 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BF08C24DBC0;
	Fri, 22 Sep 2023 09:23:48 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 22 Sep
 2023 09:23:48 +0800
Received: from [192.168.125.57] (113.72.146.252) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 22 Sep
 2023 09:23:47 +0800
Message-ID: <1d29eea8-9053-2250-cff1-68b16436ba36@starfivetech.com>
Date: Fri, 22 Sep 2023 09:23:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 08/19] PCI: plda: Add event interrupt codes and IRQ
 domain ops
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Conor Dooley <conor@kernel.org>
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
References: <20230921150814.GA330660@bhelgaas>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230921150814.GA330660@bhelgaas>
X-Originating-IP: [113.72.146.252]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_182416_132897_7119D89C 
X-CRM114-Status: GOOD (  11.57  )
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



On 2023/9/21 23:08, Bjorn Helgaas wrote:
> On Sat, Sep 16, 2023 at 01:11:29AM +0100, Conor Dooley wrote:
>> On Fri, Sep 15, 2023 at 06:22:32PM +0800, Minda Chen wrote:
>> > For PolarFire implements non-PLDA local interrupt events, most of
>> > event interrupt process codes can not be re-used. PLDA implements
>> > new codes and IRQ domain ops like PolarFire.
>> > 
>> > plda_get_events() adds a new IRQ num to event num mapping codes for
>> > PLDA local event except DMA engine interrupt events. The DMA engine
>> > interrupt events are implemented by vendors.
>> > 
>> > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> 
>> Perhaps not important as they will go away in the next patch, but for
>> this patch the riscv patchwork stuff noticed:
>> drivers/pci/controller/plda/pcie-plda-host.c:114:36: warning: unused variable 'plda_evt_dom_ops' [-Wunused-const-variable]
>> drivers/pci/controller/plda/pcie-plda-host.c:118:36: warning: unused variable 'plda_event_ops' [-Wunused-const-variable]
> 
> Details like this *are* important because fixing them makes the
> individual patches more readable, thanks for noticing!
> 
> Bjorn
OK, I will solve this.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
