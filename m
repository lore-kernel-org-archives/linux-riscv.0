Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1C0C77B6C
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 01:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKasHoQguSngfWzpF0W88hcH4+2HEFod85tz3I9E9L0=; b=aySolVXotB519C
	OrnhofdsenJZMZW+SMAbMDmpurzv4o+C1jQi9HxV8NA4C6uny1GQyVSqVtXsn0Gwka4IrIAR5go2q
	9RZ9mf2jtkIg89Oe7KayinJ1c6v3OentgjQzz+Y2m3ZI5TlG8c0w7/84exNKBq02DwQ9k3d8Q94dO
	ZvdvBrnmO7WRL+eYEsz5S4/qksrwaHCWzWqN8og9+AGLs1xLo4YUqMWs/DSudYgdxhe9emxaGw+oa
	t6VVzR3OHFaoqGd5i7kzBYx6PQd98mn+5PBlhsxfbCd89XuTV2WDCW4dOEWL5EZBIt3PBRG3Wegg7
	4CjwEjI/JvMbEoQ//PYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmlmi-004l61-0f;
	Thu, 13 Apr 2023 01:30:00 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmlmf-004l5D-0G
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 01:29:59 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 751497FE0;
	Thu, 13 Apr 2023 09:29:25 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Apr
 2023 09:29:25 +0800
Received: from [192.168.125.109] (183.27.97.249) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Apr
 2023 09:29:24 +0800
Message-ID: <d68488a0-ad83-1d46-2143-eda557fcd20f@starfivetech.com>
Date: Thu, 13 Apr 2023 09:29:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v6 0/4] Add DMA driver for StarFive JH7110 SoC
To: Vinod Koul <vkoul@kernel.org>
CC: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230322094820.24738-1-walker.chen@starfivetech.com>
 <ZDbp8IVpIwFvNgFv@matsya>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <ZDbp8IVpIwFvNgFv@matsya>
X-Originating-IP: [183.27.97.249]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_182957_303338_15723123 
X-CRM114-Status: UNSURE (   8.85  )
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



On 2023/4/13 1:27, Vinod Koul wrote:
> On 22-03-23, 17:48, Walker Chen wrote:
>> Hello,
>> 
>> This patch series adds dma support for the StarFive JH7110 RISC-V
>> SoC. The first patch adds device tree binding. The second patch includes
>> dma driver. The last patch adds device node of dma to JH7110 dts.
>> 
>> The series has been tested on the VisionFive 2 board which equip with
>> JH7110 SoC and works normally.
> 
> Applied 1-3, thanks
> 
Vinod, thank you very much!

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
