Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33865C25B4E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 05:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jGuIUs5/+p5oEcVWUQNn/hni0WVpSKydYEZq9VoaMPI=; b=RGMDh3wdf/3dYh
	/ZPuRzwIGoNL8J+vWlu9y+HjC9tB0cxMR532TCW2Dys/6m41yUpEmynQZaC6o9djbXm1ourxzo7xy
	z5RhRP+Eglq6m1GeFIx86tqk4EtMuTdjDSlhDZIazsuemK5HdUeHx1QvGpwrFAvNHd+6gqlrwdFfj
	aMnhdxGgrEkjqUG+aPdZj7DYKAQkTYA3nOVf1/ZnWgPSGMYqc6Dt6CXOC1CP8V6EcEODgjW6JOoN1
	rlINWJblEEtYe55iq28J9vLeVH3DTA3N7z6HMbLC/+KD5rwDbaMpRxRezelFT1480ZouEnwc9Xw+/
	UDk5JTgEJR7gMzUbUkyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKBoE-002MVy-M6; Tue, 24 Jan 2023 05:25:26 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKBoB-002MVY-A4
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 05:25:24 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 34DCE24E250;
	Tue, 24 Jan 2023 13:25:11 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 24 Jan
 2023 13:25:11 +0800
Received: from [192.168.125.95] (183.27.96.38) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 24 Jan
 2023 13:25:10 +0800
Message-ID: <e1560151-f446-681d-ccb6-3d9d9ea3e7c0@starfivetech.com>
Date: Tue, 24 Jan 2023 13:25:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 0/2] JH7110 PMU Support
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
	<heiko@sntech.de>, "Rafael J . Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20230119094447.21939-1-walker.chen@starfivetech.com>
 <167425300253.196995.6414153954346182622.b4-ty@microchip.com>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <167425300253.196995.6414153954346182622.b4-ty@microchip.com>
X-Originating-IP: [183.27.96.38]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_212523_524475_981F9E87 
X-CRM114-Status: GOOD (  12.65  )
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

On 2023/1/21 6:21, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On Thu, 19 Jan 2023 17:44:45 +0800, Walker Chen wrote:
>> This patchset adds PMU (Power Management Unit) controller driver for the
>> StarFive JH7110 SoC. In order to meet low power requirements, PMU is
>> designed for including multiple PM domains that can be used for power
>> gating of selected IP blocks for power saving by reduced leakage
>> current. The first patch adds device tree binding for PM domain provider
>> and consumer. The second patch adds pmu driver and support JH7110 SoC.
>> 
>> [...]
> 
> Applied to riscv-soc-for-next, thanks!
> 
> [1/2] dt-bindings: power: Add starfive,jh7110-pmu
>       https://git.kernel.org/conor/c/1fc7606d5083f79a20eb9cfd77c0dbd9299421c1
> [2/2] soc: starfive: Add StarFive JH71XX pmu driver
>       https://git.kernel.org/conor/c/08b9a94e8654d402bfd1f5496b077503d69aa2cf
> 
> I modified the MAINTAINERS entry to remove the include directory that
> was deleted along the way.

Great news!

Thank you so much for your support, Conor, Krzysztof, Emil, Heiko, Rob Herring and so on.
Hopefully more and more drivers & modules of StarFive SoC will upstream to the open source community.

Best regards,
Walker Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
