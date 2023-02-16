Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA679C636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 12:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xG1nfnkokvwc0kpoZamJD5gkccWQw4OUiMtUqF+RVYk=; b=GKgqWa048sYuZH
	axhmtAFkIVuY8EBlUTBzXo6FwYR4bY7rVlKVKvVyYL1k79e273J+ByaefPmmJDRjrPSOooGb/sxgf
	+/unYDuZ4kG+aZ/izjbXGC2pbptOa5sYyHNUzlJG2Kl307303YMgUasT7d712v88hqilCdawPYNja
	uFmV+GvKDLgVnRo7MjyzS9fk9/suUnExj4LdN93EtELu0kDg9KOWffP8Ljz0Rsiv000BgZA8pJeUX
	4bmpAGUa2SJpMoo3OD9brHkiGogiBs6WWsUSwwauOTFIzt+Em7FnHclZGQKYaQu731hfQlbf4Oly+
	Mdsu+ymtFRXO4hvhcNng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdNC-00A9aS-AU; Thu, 16 Feb 2023 12:28:26 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdN6-00A9Xp-Pi
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 12:28:24 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2A68224E391;
	Thu, 16 Feb 2023 20:27:44 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Feb
 2023 20:27:44 +0800
Received: from [192.168.125.82] (183.27.97.168) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Feb
 2023 20:27:42 +0800
Message-ID: <fbf82563-0b2c-d813-2c7c-08ea712ea91d@starfivetech.com>
Date: Thu, 16 Feb 2023 20:27:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 7/7] riscv: dts: starfive: Add StarFive JH7110
 VisionFive 2 board device tree
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor.dooley@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Conor
 Dooley" <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	<linux-kernel@vger.kernel.org>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-8-hal.feng@starfivetech.com>
 <CAJM55Z9Y_fF+4Dtu++C_jVS0+ohXp5U0GyuJCBpUh-SpTMGrVA@mail.gmail.com>
 <af42ed91-95aa-014a-1efb-6f70ee5a0433@starfivetech.com>
 <CAJM55Z-+Cz8d=YySRaFJSAffDfoZ4Madx322qCX100-nAcx+5Q@mail.gmail.com>
 <Y+38bT8cnahu19bw@wendy> <Y+4AxDSDLyL1WAqh@wendy>
 <CAJM55Z9M2xgNBRxG8cNefGt5hn4fbZmgHWzC2e8AfmKUq9Gw7A@mail.gmail.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <CAJM55Z9M2xgNBRxG8cNefGt5hn4fbZmgHWzC2e8AfmKUq9Gw7A@mail.gmail.com>
X-Originating-IP: [183.27.97.168]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_042821_189507_CED2D1D3 
X-CRM114-Status: GOOD (  34.32  )
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

On Thu, 16 Feb 2023 11:32:31 +0100, Emil Renner Berthing wrote:
> On Thu, 16 Feb 2023 at 11:09, Conor Dooley <conor.dooley@microchip.com> wrote:
>>
>> On Thu, Feb 16, 2023 at 09:50:37AM +0000, Conor Dooley wrote:
>> > On Thu, Feb 16, 2023 at 10:27:17AM +0100, Emil Renner Berthing wrote:
>> > > On Wed, 15 Feb 2023 at 15:04, Hal Feng <hal.feng@starfivetech.com> wrote:
>> > > > On 2/14/2023 5:53 PM, Emil Renner Berthing wrote:
>> > > > > On Tue, 20 Dec 2022 at 02:12, Hal Feng <hal.feng@starfivetech.com> wrote:
>> >
>> > > > >> +       model = "StarFive VisionFive 2 VB";
>> > > > >> +       compatible = "starfive,visionfive-2-vb", "starfive,jh7110";
>> > > > >
>> > > > > Hi Hal,
>> > > > >
>> > > > > I just want to double check, is "VisionFive 2 VA" / "visoinfive-2-va"
>> > > > > and "VisionFive 2 VB" / "visionfive-2-vb" really what you want? I
>> > > > > still think having these names match what is printed on the silkscreen
>> > > > > makes it a lot easier for everybody. Even your own releases calls the
>> > > > > boards "v1.2A" and "v1.3B":
>> > > > > https://github.com/starfive-tech/VisionFive2/releases/
>> > > > >
>> > > > > So I'd suggest
>> > > > > model = "StarFive VisionFive 2 v1.3B";
>> > > > > compatible = "starfive,visionfive-2-v1.3b", "starfive,jh7110";
>> > > > >
>> > > > > I haven't seen these "VA" and "VB" anywhere else, so if you don't want
>> > > > > the version numbers and can promise that there will be no incompatible
>> > > > > future revisions of the boards then maybe just drop the "V". Eg.
>> > > > > model = "StarFive VisionFive 2 B";
>> > > > > compatible = "starfive,visionfive-2-b", "starfive,jh7110";
>> > > >
>> > > > The version A board has reached the end of life. As far as I know, the
>> > > > version B board will not update also unless there are some important
>> > > > requirements and StarFive decides to update. Furthermore, it's too late
>> > > > to change the compatible as patch 1 was already accepted. Will it be
>> > > > easier to read if I modify it as below?
>> > > >
>> > > >         model = "StarFive VisionFive 2 vB";
>> > > >         compatible = "starfive,visionfive-2-vb", "starfive,jh7110";
>> > >
>> > > Oh, that's sad that the kernel will now end up calling the boards
>> > > something that's used nowhere else, even by StarFive :/
>> > > But yeah, I guess vA and vB are a little easier to read.
>> >
>> > Nothing has been released with that name so AFAIU we can change it
>> > still. If you sort it out today/tomorrow I'll try get it to Arnd before
>> > the merge window opens...
>> >
>> > I might've jumped the gun a bit here, I thought that it'd been changed
>> > to what you (Emil) had suggested.
> 
> No, I'm sorry for being late here. The below definitely looks better to me.
> 
> Hal, would you be fine with this change?

I'm fine with this. It will be more exact. Thanks.

Best regards,
Hal

> 
>>
>> -- >8 --
>> From 4d44e8a83716d1caa314f25a95bd21ac8904909e Mon Sep 17 00:00:00 2001
>> From: Conor Dooley <conor.dooley@microchip.com>
>> Date: Thu, 16 Feb 2023 09:58:22 +0000
>> Subject: [PATCH] dt-bindings: riscv: correct starfive visionfive 2 compatibles
>>
>> Using "va" and "vb" doesn't match what's written on the board, or the
>> communications from StarFive.
>> Switching to using the silkscreened version number will ease confusion &
>> the risk of another spin of the board containing a "conflicting" version
>> identifier.
>>
>> Suggested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>> Fixes: 97b7ed072784 ("dt-bindings: riscv: Add StarFive JH7110 SoC and VisionFive 2 board")
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  Documentation/devicetree/bindings/riscv/starfive.yaml | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
>> index 60c7c03fcdce..cc4d92f0a1bf 100644
>> --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
>> @@ -26,8 +26,8 @@ properties:
>>
>>        - items:
>>            - enum:
>> -              - starfive,visionfive-2-va
>> -              - starfive,visionfive-2-vb
>> +              - starfive,visionfive-2-v1.2a
>> +              - starfive,visionfive-2-v1.3b
>>            - const: starfive,jh7110
>>
>>  additionalProperties: true
>> --
>> 2.39.0
>>
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
