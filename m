Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D04EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vp3ZAKLSscg0/GN0YVM35tPXFsm7J3oAzBv2RqXImrY=; b=R+/WM+pPGXeBA5
	xfj3oKSEnoOdvtj9pROOkC3ofBgVPe5EjiW/a+dyDhNjS0zN0gUWmfGTxbp1ATu7NbKYmnry8WQHZ
	re59cAaKkUqXzL1aBY1Sgz+8wfCa9qC64H6V/KLUvGOg8DxW5SkVOjrUA9X5UmG+FTBvI3zMD0DIR
	UG8KiIrAl22S/5VdaHHeRD76a/1BMYVjkLZ/ZI1DLu/mY7gRnmbBXe+sHrog7x+MIaEDtOfQAKzl2
	m4zdNGVGH37Ie1ougbH61zK29/SjZCkh8xngXAtz4oCEmT75qjiniQDujyD4FnhMphXBm0E+9Xpr3
	LJA6Gau0vmD2SaN/Uv3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Mar-00B1Ze-20;
	Wed, 14 Jun 2023 09:15:09 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Man-00B1VJ-01;
	Wed, 14 Jun 2023 09:15:07 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E749E822A;
	Wed, 14 Jun 2023 17:14:21 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 14 Jun
 2023 17:14:22 +0800
Received: from [192.168.125.107] (113.72.145.34) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 14 Jun
 2023 17:14:21 +0800
Message-ID: <3c213435-12f1-2692-be4c-c1f5d43b76dc@starfivetech.com>
Date: Wed, 14 Jun 2023 17:14:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 0/3] Add JH7110 MIPI DPHY RX support
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: Jack Zhu <jack.zhu@starfivetech.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230529121503.3544-1-changhuang.liang@starfivetech.com>
Content-Language: en-US
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230529121503.3544-1-changhuang.liang@starfivetech.com>
X-Originating-IP: [113.72.145.34]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_021505_227449_7A0D0ECD 
X-CRM114-Status: UNSURE (   7.06  )
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



On 2023/5/29 20:15, Changhuang Liang wrote:
> This patchset adds mipi dphy rx driver for the StarFive JH7110 SoC.
> It is used to transfer CSI camera data. The series has been tested on
> the VisionFive 2 board.
> 
> This patchset should be applied after the patchset [1] [2]:
> [1] https://lore.kernel.org/all/20230518101234.143748-1-xingyu.wu@starfivetech.com/
> [2] https://lore.kernel.org/all/20230519060202.15296-1-changhuang.liang@starfivetech.com/
> 

Hi, Vinod and Kishon

Could you please help to review and give me some suggestions
for this patch series? Thank you for your time.

Best regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
