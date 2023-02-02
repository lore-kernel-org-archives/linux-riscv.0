Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B89C636CD
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 02:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSC08NrEZmd1AG3+BVbSyw0eIrcXWwgm+W/uyUlil6A=; b=DBOvnC5J5g+nGN
	eAUO4wQcSQ7BEjBbwLqLoyE6UZshYgOOSGPMiQJB51Ch4XlozRghtPS325/az9JDVoBPv6IjMats0
	bs3Eo21eJ7ruE5QLHVSAkdAMBa+mA4C8eoqnBh59D4TSirKciKPgurDvGYaWe6Jjg/LG2JDHUNCPW
	zJdqRj9JeKWuQj56J5gcx6pPE59GITbGVIQ75xYL2dewet3wqLJslHs2rQOrDOvdZDHtKjsNV4QYj
	YAH/AQpKz1Sp+IfaIdxMRPhK6bgGe4OXMxNRGaopZOz9nqeLUIMEwvhURTeHXG2M31SAReCZMCH3O
	Y/xZogQ3ttzXFyAOCp9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNPZ6-00EAbF-VS; Thu, 02 Feb 2023 02:43:08 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNPZ2-00EAa5-Ts
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 02:43:07 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DC29024E02F;
	Thu,  2 Feb 2023 10:42:33 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 2 Feb
 2023 10:42:34 +0800
Received: from [192.168.125.110] (113.72.144.84) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 2 Feb
 2023 10:42:32 +0800
Message-ID: <0ff800a1-5e90-64bc-af53-2736e698c9e4@starfivetech.com>
Date: Thu, 2 Feb 2023 10:42:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
From: Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v3 6/7] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
To: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-7-hal.feng@starfivetech.com>
 <0db7824b-184d-dfae-f61d-3048392c9895@starfivetech.com>
 <39F228FA-2298-4813-9BDE-7100DE920213@kernel.org>
Content-Language: en-US
In-Reply-To: <39F228FA-2298-4813-9BDE-7100DE920213@kernel.org>
X-Originating-IP: [113.72.144.84]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_184305_168520_9A869ACB 
X-CRM114-Status: GOOD (  10.18  )
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

On Tue, 31 Jan 2023 06:17:17 +0000, Conor Dooley wrote:
> On 31 January 2023 02:00:26 GMT, Hal Feng <hal.feng@starfivetech.com> wrote:
>>On Tue, 20 Dec 2022 09:12:46 +0800, Hal Feng wrote:
>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>> 
>>> Add initial device tree for the JH7110 RISC-V SoC by StarFive
>>> Technology Ltd.
>>> 
>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>>> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>>> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>> ---
>>>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 411 +++++++++++++++++++++++
>>>  1 file changed, 411 insertions(+)
>>>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110.dtsi
>>
>>I wanna add i2c nodes (i2c0-6) in the next version, so someone else
>>can use them when they submit i2c driver patches.
> 
> All of the other series depend on this one for enablement,
> so unless the binding for i2c is already upstream I'd advise keeping it separate.

The i2c IP of JH7110 is from Synopsys and the same as the i2c IP in JH7100.
The binding and driver for i2c are already upstream. It works as long as we
add the i2c nodes and configure pins for i2c in device tree. It will simplify
the dependency if we do that.

By the way, I am checking the ISA of U74-MC on JH7110 with someone else.
I will reply you today.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
