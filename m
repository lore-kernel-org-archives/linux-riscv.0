Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19E0EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 01:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3w66/IqoB/XrpE4c3LM7mdVIh1m4XEVqt7K0SkoOV8=; b=1SOXCkpUWOk8Wb
	G9pvl1LHC3s/kOPZYS7Pmc/UdOJSQwBs5+DUjq8kMjnx2k3OD7aebWA2WUkCh/zuGxQhzkFkctdJL
	SssWEmi+/24PckrZ2F3pji12i9XfQxVyMy3ajqPYydfQICkhvMYWEaa8oJQk+3yApRiea7Jp11HGs
	eFQ80ahnoDt/Fb+b5+kHo9cpSpP2U8eWSI1HNeBjCD6ZnImmLqsV5dFBExCpeQQPYBUDFv2Ma+dYd
	DzQ5k/yqqmzZNbay1+nKLU7eO/QC9HckKoHmyeu/Tp/MV7kq7NK25q8X+XjRy4EkctS+W+VWwCJBp
	WA/z8bMYoGt5MbFJR7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMei0-00CWDG-08;
	Fri, 21 Jul 2023 01:13:28 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMehv-00CWB6-0D
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 01:13:25 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id BD5868178;
	Fri, 21 Jul 2023 09:12:35 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 09:12:35 +0800
Received: from [192.168.125.127] (113.72.147.86) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 09:12:34 +0800
Message-ID: <e4668a72-b180-0b54-bf58-69b43ae0b529@starfivetech.com>
Date: Fri, 21 Jul 2023 09:12:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 4/9] PCI: microchip: Move PCIe driver to PLDA directory
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <20230719102057.22329-1-minda.chen@starfivetech.com>
 <20230719102057.22329-5-minda.chen@starfivetech.com>
 <20230720-exception-spectator-b48ecb9d4c39@wendy>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230720-exception-spectator-b48ecb9d4c39@wendy>
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_181323_481956_27C4504B 
X-CRM114-Status: GOOD (  10.03  )
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



On 2023/7/20 20:26, Conor Dooley wrote:
> Hey Minda,
> 
> On Wed, Jul 19, 2023 at 06:20:52PM +0800, Minda Chen wrote:
>> Move Microchip specific platform codes to PLDA directory.
>> Including clock init, interrupt event handle and platform
>> init codes.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> 
> Something else that I noticed, looking at what is not in the diff here,
> but is everything under the "/* PCIe Controller Phy Regs */" comment
> that remains in the microchip driver not also common to the plda IP?
> 
> Thanks,
> Conor.
I changed it to "PCIe Controller Reg" in patch8 ... It looks not the Phy register..
Maybe I don't change it. And I will squash this patch with patch3.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
