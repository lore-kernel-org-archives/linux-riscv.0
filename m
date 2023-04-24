Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25477C6FD18
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 03:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYeGv9AmyAiBtZtZViYJEaK9JPE91Qf7BTzEWvSKHGc=; b=IIp1Uvz+DC8/KL
	c2CNQFCApS1MDu7zspMbjTNWRx/o6HEKsTwWksG5P1/BaH6giqM3PWK/2HpNvLE/1VGihpk5dpE4O
	+X1mv1T/vOwrxbEKruFfQLdtBObDHs9lLxBUzfONSFi/zTRtEQ/69G1kDpNMU5a6hLByQJppIUSpB
	ikWLancGWhQpPgdb/U8gImztudzjD2IRJVpA4oy+2zsQaqhwflil778uuiQd8/p1RZyoKYYbLh9p/
	Hwu0ggSdq3PWsGbqY9j/dJ+Xi5mLn7SGxCe7/yymTjh6zcR3QKX6niYiCn4N46mEy5KUqYFqU9j0g
	4hcErgpf0Rv1Jk70l0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqmly-00FBlP-05;
	Mon, 24 Apr 2023 03:21:50 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqmlt-00FBjV-2b
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 03:21:48 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1951B807B;
	Mon, 24 Apr 2023 11:21:13 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 24 Apr
 2023 11:21:13 +0800
Received: from [192.168.125.124] (113.72.145.137) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 24 Apr
 2023 11:21:12 +0800
Message-ID: <607f3604-056c-6f3a-b154-0f298b870811@starfivetech.com>
Date: Mon, 24 Apr 2023 11:21:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 4/4] riscv: dts: starfive: add tdm node and sound card
To: Conor Dooley <conor@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230420024118.22677-1-walker.chen@starfivetech.com>
 <20230420024118.22677-5-walker.chen@starfivetech.com>
 <20230421-dropper-upstage-200ae7e47092@spud>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230421-dropper-upstage-200ae7e47092@spud>
X-Originating-IP: [113.72.145.137]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_202145_997519_99860A41 
X-CRM114-Status: GOOD (  14.51  )
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



On 2023/4/22 0:50, Conor Dooley wrote:
> Hey Walker,
> 
> On Thu, Apr 20, 2023 at 10:41:18AM +0800, Walker Chen wrote:
>> Add the tdm controller node and sound card for the StarFive JH7110 SoC.
> 
> Is this one of these waveshare things + a visionfive 2?
> https://www.waveshare.com/wm8960-audio-hat.htm

Hey Conor,
I'm glad to receive your comments.

Now we are using this board + VisionFive2 :
https://wiki.seeedstudio.com/ReSpeaker_2_Mics_Pi_HAT/

> 
> I'm a bit lost as to why this needs a whole new board, should it not
> just be an overlay that you can apply to the existing dts?
> 
> Taking this to an extreme, should I expect to see a new devicetree for
> everything RPi hat that you decide to use with a VisionFive 2?

For your response, I did some thinking. Because wm8960 codec is not integrated
 on the VisionFive2 board, perhaps using overlay is a better way.

> 
> Also, it'd be nice to provide a Link: to where someone can find more
> info on this combination of items. Google for "wm8960 visionfive 2"
> gives me nothing, nor does "starfive audio card" etc.
> 
> Thanks,
> Conor.
> 
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---

Best regards,
Walker




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
