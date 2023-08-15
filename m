Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A629C001E0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 10:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DM84MLnKzwNxDiK5ov/hXMeMFycIfBzobEZHVMC1b+c=; b=o85Bhn0o7uAoUM
	sRkucMyy9BH5r4cbyUodDtWcSxQEbW5caQBO7kUxZEq7Lj0bDS3V/AFI/prAO4qlbfhBo7IgBrC5Q
	1iOwTDAOliI2v6xaqXX3tsQMNttdhemS5xcpzdMZ7e0tUc2dGphgYp3MAKuFzWCgk8+VM356dllzB
	SReCTWE/A2FIM2LzOy6h7jgBl/sZLYYREUBZa53fAHfBym9Yl/iP5oj5UXmjhae3dcILnK5qDLv+U
	CWKUDsL3gTn72WPMPY22w2TsHy2eK/pGGc6V7eT96oaedp8foI2o4jZFtv4XSn2mhhjIRmVw5WEoB
	L+fEzn1uvqQDRY5iXKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVr5F-001HBd-0i;
	Tue, 15 Aug 2023 10:15:29 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVr5C-001HB0-2V
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 10:15:28 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7B80F24E271;
	Tue, 15 Aug 2023 18:15:04 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 15 Aug
 2023 18:15:04 +0800
Received: from [192.168.125.127] (183.27.98.20) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 15 Aug
 2023 18:15:02 +0800
Message-ID: <34c8ac7f-243f-ed15-6f93-3d153b6315b5@starfivetech.com>
Date: Tue, 15 Aug 2023 18:15:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 08/11] PCI: microchip: Move IRQ init functions to
 pcie-plda-host.c
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
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
References: <20230814082016.104181-1-minda.chen@starfivetech.com>
 <20230814082016.104181-9-minda.chen@starfivetech.com>
 <20230814-everglade-nibble-af545e75b635@wendy>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230814-everglade-nibble-af545e75b635@wendy>
X-Originating-IP: [183.27.98.20]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_031527_127570_8094C1BD 
X-CRM114-Status: GOOD (  10.17  )
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



On 2023/8/14 21:57, Conor Dooley wrote:
> On Mon, Aug 14, 2023 at 04:20:13PM +0800, Minda Chen wrote:
>> Move IRQ init functions to pcie-plda-host.c. mc_handle_event
>> merge to plda_handle_event, Add get_events functions,
>> PolarFire PCIe uses get_events function pointer to get
>> their events num.
> 
> Just a nit, could you add the () when referring to functions in
> changelogs please?
> Other than the comment I left on the last patch, this looks fine to me,
> but I'd definitely like Daire to take a look at these patches that
> modify the interrupt handling.

OK, Thanks. 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
