Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C3EEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 07:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IpwcWVfLe5tFflGeojugJRSs3kV+uoeynFhui2irZ9k=; b=PaY8QpQ3A4T8uc
	gNrDlIDn2eyJsq0GKNCJPQjyWxf3Fq6UYHQbw6sOgzkmcOXOgbzqtQR+pV6z4bIeESDJ5ib55McEq
	SWR9MoMCZzqWZ23Xo506FWAkAosHbqe9z60YsyNAbfNCx6Mqw6+8W4FMvRS3bZOnp0k8gk2PP5ECD
	ThXTbbIjmCZ1jwy/FmBFvtrduVlTgCsDI3i1RFQXCff8Al624+5m+IQT+7K6CIoU1TNH9IcAkSeQL
	OaYyYTOxTAHk5GVy5cYjrLNp8IJTE6ihqGVjm/OtNOH+4s4xvybDcIA9NqMocEzu1ogF/pR35gsCa
	zRlA34Mnvve38T6eVSxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGa90-00COb0-2C;
	Tue, 04 Jul 2023 07:08:14 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGa8w-00COZf-1q
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 07:08:13 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 570B78159;
	Tue,  4 Jul 2023 15:07:45 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 15:07:44 +0800
Received: from [192.168.125.128] (113.72.144.31) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 15:07:43 +0800
Message-ID: <61120362-6b19-3683-db18-8d703ae278eb@starfivetech.com>
Date: Tue, 4 Jul 2023 15:04:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 2/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Conor
 Dooley" <conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20230704020239.288500-1-xingyu.wu@starfivetech.com>
 <20230704020239.288500-3-xingyu.wu@starfivetech.com>
 <c2edda13-c674-df56-d1a2-cb47b405b896@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <c2edda13-c674-df56-d1a2-cb47b405b896@linaro.org>
X-Originating-IP: [113.72.144.31]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_000810_797619_468482DB 
X-CRM114-Status: UNSURE (   9.42  )
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

On 2023/7/4 14:30, Krzysztof Kozlowski wrote:
> On 04/07/2023 04:02, Xingyu Wu wrote:
>> From: William Qiu <william.qiu@starfivetech.com>
>> 
>> Add documentation to describe StarFive System Controller Registers.
>> 
>> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> 
> I don't think there is a point in reviewing bindings which were never
> tested. I hope you agree with me.
> 
> The patch just introduces errors. :(
> 

Sorry, it was my fault. I tested it but found the example uncompleted.
And I forgot to test it after completing it. Sorry.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
