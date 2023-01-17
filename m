Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262EBC3DA78
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 07:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHfnKR+iHGq2+UQc1nI12hAY9oLEdvIeNkb+vHzTA1E=; b=QPC12CndRXS/Fh
	QmWpz4MF9wIi4nM4Yh7sXpxZ7ttV7zrZd00gW5FIwzoLUrkD58+wu5TI2ZaYqSFtvbNQ2eSgOip3T
	fL/WHcBtL57gfaugcztCi4W6mlvHiS/RrQuNd+buGZzgxn/IdHVp/3vCamffsxziC8uVX/7KhBqoy
	QBH1Acx/xpwdYZqbmUcX8yQnNZIo46JZNUrWT5miFQAcCZhZ7gHzrW2pnisq3JUQdabrkWeB8jpjb
	UC7ngFmaazrzcHuofJWO+pwQe5YoBiNIKUXGmen7x58j+kxyg4YIcS783hiSxwv0EEt9f1/XpLf6L
	E3+TtLSEInVli+GeK+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHgfM-00DEkB-Fe; Tue, 17 Jan 2023 07:45:56 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHgfI-00DEgI-6w
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 07:45:55 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 6E6D624E208;
	Tue, 17 Jan 2023 15:45:23 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 17 Jan
 2023 15:45:23 +0800
Received: from [192.168.125.95] (113.72.144.207) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 17 Jan
 2023 15:45:22 +0800
Message-ID: <02174460-87b8-bb1c-7b6f-39694fa416c3@starfivetech.com>
Date: Tue, 17 Jan 2023 15:45:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 0/3] JH7110 PMU Support
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230116074259.22874-1-walker.chen@starfivetech.com>
 <Y8WjKArEZH5zd5jb@spud>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <Y8WjKArEZH5zd5jb@spud>
X-Originating-IP: [113.72.144.207]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_234552_601764_F58DAAFE 
X-CRM114-Status: GOOD (  25.84  )
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

On 2023/1/17 3:19, Conor Dooley wrote:
> Hey Walker,
> 
> On Mon, Jan 16, 2023 at 03:42:56PM +0800, Walker Chen wrote:
>> Hello,
>> 
>> This patchset adds PMU (Power Management Unit) controller driver for the
>> StarFive JH7110 SoC. In order to meet low power requirements, PMU is
>> designed for including multiple PM domains that can be used for power
>> gating of selected IP blocks for power saving by reduced leakage
>> current. The first patch adds device tree binding for PM domain provider
>> and consumer. The second patch adds pmu driver and support JH7110 SoC.
>> The last patch adds device node about pmu to JH7110 dts. 
>> 
>> The series has been tested on the VisionFive 2 boards which equip with
>> JH7110 SoC and works normally.
> 
> For the series:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> I'm hoping that someone with knowledge of the power APIs will take a
> look now that the driver looks to be in a pretty good state (to my naive
> eyes at least).
> 
>> Changes in v3:
>> - Rebased on tag v6.1.
> 
> FYI, please pick something more recent than that.
> Ideally, the last -rc1, which in this case is v6.2-rc1.

OK, the next version will be rebased to the latest kernel. 

> It's helpful to do this, as when I went to apply your patch, there were
> some conflicts that needed to be sorted out. Because of your prerequisite
> patches, the usual `b4` commands would not usable. E.g.
> 
> b4 am -3 20230116074259.22874-1-walker.chen@starfivetech.com
> Analyzing 4 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   [PATCH v3 1/3] dt-bindings: power: Add starfive,jh7110-pmu
>   [PATCH v3 2/3] soc: starfive: Add StarFive JH71XX pmu driver
>   [PATCH v3 3/3] riscv: dts: starfive: add pmu controller node
> ---
> Total patches: 3
> Preparing fake-am for v3: JH7110 PMU Support
>   ERROR: Could not find matching blob for MAINTAINERS (85e8f83161d7)
>          If you know on which tree this patchset is based,
>          add it as a remote and perform "git remote update"
>          in order to fetch the missing objects.
> 
> Fortunately, this is just a driver addition so despite `b4` not
> helping it was easy to resolve but for other patches in the future,
> this may not be the case.
> 
> Assuming the dt maintainers are happy with the binding, ping me in 2
> weeks if no-one else has commented and I'll apply patches 1 & 2.

Could I drop patch 3 and rebase patch 1 & 2 on the latest mainline then submit as v4 ?

Best regards,
Walker


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
