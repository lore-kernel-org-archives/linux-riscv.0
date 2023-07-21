Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CA5C001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7B77da25TRc5XyXpQInPKQtD9xvfoyg6fOQf7HenXGA=; b=vC7UhXzY3cai9O
	S59bZJLO8yKqhSZRxTu+kzDHqHz1T6KWqwJxdNpSjfOjZaWvdIEoO++vqUr1Gc+GOoyLjww4AhSLT
	DCKUkmnTpnHbu7fyjy8Rni2tYSyEASef0qSxhs4gKGzqWUMSkhYUqrcVtxEHrgOi7ojey1NsfksoK
	gLJnzuP4lUjSeqm2OfPWEKjwSvi9WzAS5O0oMM01Zftf68e8o+B1yenHU7I8mWliRzKl3GINrKXFt
	acjxtc0Es9QUfSdSXsPuitDPMbuK8VliegsSDp5LZMxcz4IIit18mBUafqJOaqp71VvwEjkdUpzR1
	NMCeafPYeIDDY/thYKdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMms0-00DcHX-2z;
	Fri, 21 Jul 2023 09:56:20 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMmrx-00DcDA-0K
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 09:56:19 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8E2A824DE03;
	Fri, 21 Jul 2023 17:55:53 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 17:55:53 +0800
Received: from [192.168.125.127] (113.72.147.86) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 17:55:52 +0800
Message-ID: <8e8a987e-f596-31b3-dfbf-69c285a1dfb1@starfivetech.com>
Date: Fri, 21 Jul 2023 17:55:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 0/9] Refactoring Microchip PolarFire PCIe driver
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Bjorn Helgaas <helgaas@kernel.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, Conor Dooley <conor@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
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
References: <20230719152626.GA502469@bhelgaas>
 <52ebc991-0e73-8df4-61b2-32989ab4e62c@starfivetech.com>
 <20230720-unkempt-bath-9d320d55577c@wendy>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230720-unkempt-bath-9d320d55577c@wendy>
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_025617_516647_EA649CB4 
X-CRM114-Status: GOOD (  11.65  )
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



On 2023/7/20 20:12, Conor Dooley wrote:
> On Thu, Jul 20, 2023 at 10:15:51AM +0800, Minda Chen wrote:
>> On 2023/7/19 23:26, Bjorn Helgaas wrote:
>> > On Wed, Jul 19, 2023 at 06:20:48PM +0800, Minda Chen wrote:
> 
>> >> This patchset is base on v6.5-rc1
>> > 
>> > Doesn't quite apply cleanly for me:
>> > 
>> I am sorry, The driver need stg clk and syscon driver, which are have't be merge to main line.
>> mainly dts is(patch9) rejected, Must apply this series patch first. (I forget add this link in cover letter)
>> https://patchwork.kernel.org/project/linux-riscv/cover/20230712092007.31013-1-xingyu.wu@starfivetech.com/
>> and this syscon patch 
>> https://patchwork.kernel.org/project/linux-riscv/patch/20230717023040.78860-7-xingyu.wu@starfivetech.com/
> 
> You could detach the dts patch from the series & send it independently once
> everything it depends on is in place. I'm going to pick up both of the
> patches you've linked for v6.6 in the next day or two.
Thanks very much. I have considered removing the dts patch. But I think Maintainers
also review the dts patch. So I add this.....

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
