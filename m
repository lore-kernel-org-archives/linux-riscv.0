Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE05C3DA6F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 09:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5aX/KzCLzQfnowoKPhtB0CCjJ9q5zdx6qeVraH/1CiQ=; b=bj7eXANgxKNgzo
	dtPGA9WBrgVSnF4RTFGRw8DR3bucYnVO7HznyQNFaNUzbfSHtAbTbqgymQySv9HA6xuAEaup04XGy
	EF1CbeEloOBvOG+9xz3yA0wd83D6XV8tNqU2z3fJ29xINkPxptzdM3hgjSh6ypM5XwQB3/3C2K+hz
	VXZhkQruyDo0xEnidAxGPCHDPOpUylz1gKFcbc5/PMPVZXPNzLO76KF2PRjEs5o8ddwurTf96EHAV
	JiCthdLJZk23QP6wvldtVEysAMMyNixjwz1GlsFzUlue0XRy/OJLW7aE9uWOBE90+GzSPaFOKxKRy
	ioBXR0LDcB7xzfQMW8Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZSmc-004h11-0t;
	Fri, 25 Aug 2023 09:07:10 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZSmZ-004gz9-0X
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 09:07:08 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 86D7681BB;
	Fri, 25 Aug 2023 17:06:43 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 25 Aug
 2023 17:06:43 +0800
Received: from [192.168.125.127] (113.72.145.205) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 25 Aug
 2023 17:06:42 +0800
Message-ID: <5450650c-3750-a0ee-72a1-bfa0a4545e0a@starfivetech.com>
Date: Fri, 25 Aug 2023 17:06:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 09/11] dt-bindings: PCI: Add StarFive JH7110 PCIe
 controller
To: Rob Herring <robh@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, <linux-pci@vger.kernel.org>, Kevin Xie
	<kevin.xie@starfivetech.com>, <linux-riscv@lists.infradead.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	=?UTF-8?Q?Krzysztof_Wilczy=c5=84s?= =?UTF-8?Q?ki?= <kw@linux.com>, Mason Huo
	<mason.huo@starfivetech.com>, Conor Dooley <conor@kernel.org>,
	=?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-kernel@vger.kernel.org>, "Emil Renner
 Berthing" <emil.renner.berthing@canonical.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, <devicetree@vger.kernel.org>
References: <20230814082016.104181-1-minda.chen@starfivetech.com>
 <20230814082016.104181-10-minda.chen@starfivetech.com>
 <169228685644.1140409.12427674208274594176.robh@kernel.org>
Content-Language: en-US
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <169228685644.1140409.12427674208274594176.robh@kernel.org>
X-Originating-IP: [113.72.145.205]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_020707_396597_7C541169 
X-CRM114-Status: UNSURE (   8.14  )
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



On 2023/8/17 23:40, Rob Herring wrote:
> 
> On Mon, 14 Aug 2023 16:20:14 +0800, Minda Chen wrote:
>> Add StarFive JH7110 SoC PCIe controller dt-bindings.
>> JH7110 using PLDA XpressRICH PCIe host controller IP.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../bindings/pci/starfive,jh7110-pcie.yaml    | 120 ++++++++++++++++++
>>  1 file changed, 120 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
>> 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
Hi Rob
Thanks. 
I see other PCIe maintainer have not reviewed PCIe driver codes(or no coments).
Could you help to review PCIe driver codes patches? (I just commit new version 4). Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
