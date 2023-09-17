Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CA4CD13CF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 08:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fe6Mv8oxC4Sy44UesjRypQB6tOGj/iJcvjqaOPID05c=; b=u3/Jt1TyN8KSbt
	2IDyOwwk0hxJ9LzSLqjwQbwQn0SXyhTOEgKGqkVNcliiWl80rZR4AzU1EjnoZxKjuT5eAJ4JGtk87
	BvUBl2Vvbj1i9iIwqXDT09c7U/jJH8PO2hOdxO9ZrZhX6V2R1DlGj85n0BKPTipEU0PYySQBwx3tY
	lvvKTAh0gcjz34qzmle/zJ4ff/yJ2aPB8zwyZzGU1DvFWwZ2JaeyVoPM6aWAp5VQujqQZmFS2HbmZ
	/2ldzltQvwTDIlUEF5ozeTjlFWugrhKfitzTQp2t3Z3KHrjH0T+AsMvZXAhyqsVNnnToxrVPhkp2r
	FJstnxfPOr1i04pQqRlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhnU5-00DLPt-1c;
	Sun, 17 Sep 2023 08:50:29 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhnU2-00DLMZ-2X
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 08:50:28 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id ED7F224E161;
	Sun, 17 Sep 2023 16:49:53 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 17 Sep
 2023 16:49:54 +0800
Received: from [192.168.125.57] (113.72.144.67) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 17 Sep
 2023 16:49:53 +0800
Message-ID: <8d0e2d7c-c259-69fb-ce50-ca566172db64@starfivetech.com>
Date: Sun, 17 Sep 2023 16:49:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 19/19] riscv: dts: starfive: add PCIe dts configuration
 for JH7110
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
 <20230915102243.59775-20-minda.chen@starfivetech.com>
 <20230916-monitor-idiom-86d6894b1e88@spud>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230916-monitor-idiom-86d6894b1e88@spud>
X-Originating-IP: [113.72.144.67]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_015026_965688_A1774773 
X-CRM114-Status: UNSURE (   6.37  )
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



On 2023/9/16 8:07, Conor Dooley wrote:
> On Fri, Sep 15, 2023 at 06:22:43PM +0800, Minda Chen wrote:
>> Add PCIe dts configuraion for JH7110 SoC platform.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> 
> Not really important, but checkpatch whinges about the double signoff
> here, since both are you"
Thanks. I don't check this carefully.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
