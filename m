Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DA9C71143
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 12:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07r3TxM4vUbhR1iROZ1QN6wl0CKnknEWUd3b/kVhDoA=; b=zz8OZLgGOL9iPV
	KeBxIwjdqXr/qKGq+OAA+REjAFFM59CU6xhvgmc2iCGxCXjPDBiCpTBOxgYPJI+hrh1oteE88JOpB
	ioGCY10O+c/Dm4jjGSnaRZ5PnX/4BXIW7v/7cKwRt5tJDdVNkEtX60hPTj8+j5ujgoy5TKjEvogeJ
	uOeh9TjEOIcC8r5O6Rhu52db9wrmpYwUcU5mJmBqTTeUf9RRiSBzFwMZRq2FjwP+W9VCTfs4QjZDe
	rJA811USoRZI2ktv+DOm7S/gVTmixx5zaax8jXtqBHFEbK4mDLX6hBWDiBsMZMMyXXqZUChKiZzMM
	yxZlcyoPReDN33Gdm/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWyn9-009LPw-2g;
	Fri, 18 Aug 2023 12:41:27 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWyn4-009LDT-1D
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 12:41:25 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 459737FD3;
	Fri, 18 Aug 2023 20:40:44 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Aug
 2023 20:40:44 +0800
Received: from [192.168.125.62] (183.27.97.249) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Aug
 2023 20:40:43 +0800
Message-ID: <e47c92c9-c57b-83b1-c444-0fce41164fe1@starfivetech.com>
Date: Fri, 18 Aug 2023 20:40:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 0/2] Add dma and tdm nodes for StarFive JH7110 SOC
To: Conor Dooley <conor@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Emil
 Renner Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Walker Chen
	<walker.chen@starfivetech.com>
CC: Conor Dooley <conor.dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20230724065158.925-1-walker.chen@starfivetech.com>
 <20230726-upriver-net-8490aa69df8a@spud>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230726-upriver-net-8490aa69df8a@spud>
X-Originating-IP: [183.27.97.249]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_054122_603009_0AAA9683 
X-CRM114-Status: UNSURE (   8.91  )
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

On Wed, 26 Jul 2023 17:21:39 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On Mon, 24 Jul 2023 14:51:56 +0800, Walker Chen wrote:
>> These patches add dma and tdm nodes for the StarFive JH7110 SoC, they
>> are based on linux-next. I have tested them on the VisionFive2 board.
>> Thanks.
>> 
>> Best regards,
>> Walker
>> 
>> [...]
> 
> Applied to riscv-dt-for-next, thanks!
> 
> [1/2] riscv: dts: starfive: jh7110: add dma controller node
>       https://git.kernel.org/conor/c/ac73c09716c3
> [2/2] riscv: dts: starfive: jh7110: add the node and pins configuration for tdm
>       https://git.kernel.org/conor/c/e7c304c0346d

Hi, Conor,

You had deleted the `status = "okay";` of usb0 by mistake in this commit.

 &usb0 {
 	dr_mode = "peripheral";
-	status = "okay";
 };

Could you please help fix it?

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
