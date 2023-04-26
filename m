Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C64C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 07:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQsWYsfwd31VwH0EjkkaibxlzkqPCTwA/cgo29hkvQo=; b=QkxTolXSJCUiKa
	zewdYLdbwPi8WrNo1UFnkwV0ifsq4kC/vQhAeX9D7DtniKgE7e37yFAn67JJbjpEsC5y2iSkI4Zr/
	ybS8Rw75tGRsco8QBDEv6KK/js9NJYFpfo9XtF2dWn+cguNzh972v/a2xrZkes5TVM41Bc8IWXeg1
	esEz9CvsUC32ul7/OVabODZQtJ+hIAcgCzf9VJmPPb0x1JLbcLWbNeCWVt/Kiz/ElMQkgfqRbMlhU
	qy2GdIG3hfsvYrCwhdxBprQa2KwlrxvVPrfKqQdhP2PL1eeEr2R/zKxSUndR2xRLGjk4xBDR5ptkw
	OsJDaNRRhsi9pFjzX9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pra0l-0036eH-2Z;
	Wed, 26 Apr 2023 07:56:23 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pra0h-0036ck-2H
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 07:56:22 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 29180809C;
	Wed, 26 Apr 2023 15:55:43 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 26 Apr
 2023 15:55:43 +0800
Received: from [192.168.125.124] (113.72.145.137) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 26 Apr
 2023 15:55:42 +0800
Message-ID: <a55a9491-20a8-1f4a-200a-a0f1d7ae03bf@starfivetech.com>
Date: Wed, 26 Apr 2023 15:55:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 4/4] riscv: dts: starfive: add tdm node and sound card
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230420024118.22677-1-walker.chen@starfivetech.com>
 <20230420024118.22677-5-walker.chen@starfivetech.com>
 <20230421-dropper-upstage-200ae7e47092@spud>
 <607f3604-056c-6f3a-b154-0f298b870811@starfivetech.com>
 <20230424-roundness-everybody-659599d44963@spud>
 <CAJM55Z9a9N8Zm2cuh8gzZNcYBENO5WE6GmRXOsaYbOcv0srz-Q@mail.gmail.com>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <CAJM55Z9a9N8Zm2cuh8gzZNcYBENO5WE6GmRXOsaYbOcv0srz-Q@mail.gmail.com>
X-Originating-IP: [113.72.145.137]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_005620_055921_88E82E23 
X-CRM114-Status: GOOD (  22.55  )
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



On 2023/4/26 4:57, Emil Renner Berthing wrote:
> On Mon, 24 Apr 2023 at 18:27, Conor Dooley <conor@kernel.org> wrote:
>> On Mon, Apr 24, 2023 at 11:21:11AM +0800, Walker Chen wrote:
>> >
>> >
>> > On 2023/4/22 0:50, Conor Dooley wrote:
>> > > Hey Walker,
>> > >
>> > > On Thu, Apr 20, 2023 at 10:41:18AM +0800, Walker Chen wrote:
>> > >> Add the tdm controller node and sound card for the StarFive JH7110 SoC.
>> > >
>> > > Is this one of these waveshare things + a visionfive 2?
>> > > https://www.waveshare.com/wm8960-audio-hat.htm
>> >
>> > Hey Conor,
>> > I'm glad to receive your comments.
>> >
>> > Now we are using this board + VisionFive2 :
>> > https://wiki.seeedstudio.com/ReSpeaker_2_Mics_Pi_HAT/
>> >
>> > >
>> > > I'm a bit lost as to why this needs a whole new board, should it not
>> > > just be an overlay that you can apply to the existing dts?
>> > >
>> > > Taking this to an extreme, should I expect to see a new devicetree for
>> > > everything RPi hat that you decide to use with a VisionFive 2?
>> >
>> > For your response, I did some thinking. Because wm8960 codec is not integrated
>> >  on the VisionFive2 board, perhaps using overlay is a better way.
>>
>> Aye. I think so too. From my PoV, if this particular seeed audio board
>> is something you're bundling with VisionFive 2 boards on your storefront
>> etc, then I'm fine with taking it as an in-tree overlay.
>> If it is just a "random" RPi hat (that happens to be exactly what you
>> need for testing the audio drivers), then I don't know where to draw a
>> line for what is & what is not acceptable for inclusion.
>>
>> In both cases, it's Emil's call.
> 
> I'm not aware of any shop bundling the VF2 with an audio board. I
> agree: please don't add device trees for combinations of VF2s and
> hats. That should be an overlay.
> 
> /Emil

Since you guys agree, so let's do it this way.
Thanks.

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
