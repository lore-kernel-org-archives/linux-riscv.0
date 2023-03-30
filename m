Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BB5C761A6
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 15:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXlltRsN521WiU5wvH0iq9eXMRsJUq3VG64Mwdv1KpA=; b=JyGiXm9t++DTfm
	y29PmZk6lUPWAghQ1Xic/8//C/wmvobILohOYST082NJ3YziOnoVjDMoICJy2Wuyo8FcqHgcaK8xN
	OLnZqAS8i8OFhr6l+DbTahDWOkqoIIMytyoB+BiznkGj7H7WYyx8rxSoVvo8x7X/SlCnG2Vb5nHQu
	eqW+IucYkxuxp0eV9G8HAWPcg+AbJIGcc0NnrqVtiBEV3i9n2juWNhyRhcbi7SV4ZwEOrnZBvErDu
	SR+d9/S4cRxv3OF2og+X+4Ks/ZmmTBhAghRDH5/DLasz60SWVMU6Mqm2VEmTjtFx1Y6PRimt253Ql
	EejJnq1PM5W7BW/rDjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phu1G-004CbV-0u;
	Thu, 30 Mar 2023 15:16:54 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phu19-004CYn-28
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 15:16:52 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9596F24DEAE;
	Thu, 30 Mar 2023 23:16:09 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 30 Mar
 2023 23:16:09 +0800
Received: from [192.168.125.96] (113.72.144.76) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 30 Mar
 2023 23:16:08 +0800
Message-ID: <2d5a8dae-73fd-b1f8-089e-041637d66b0d@starfivetech.com>
Date: Thu, 30 Mar 2023 23:16:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: add tdm node and sound card
To: Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230329153320.31390-1-walker.chen@starfivetech.com>
 <20230329153320.31390-4-walker.chen@starfivetech.com>
 <d455a90a-7e63-2254-75cb-70cb26ae7483@linaro.org>
 <af015701-f1ff-4b1e-9b1b-c635fc684ce6@spud>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <af015701-f1ff-4b1e-9b1b-c635fc684ce6@spud>
X-Originating-IP: [113.72.144.76]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_081648_774391_22E5FF6E 
X-CRM114-Status: GOOD (  15.74  )
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



On 2023/3/30 15:58, Conor Dooley wrote:
> On Thu, Mar 30, 2023 at 09:43:10AM +0200, Krzysztof Kozlowski wrote:
>> On 29/03/2023 17:33, Walker Chen wrote:
>> > Add the tdm controller node and sound card for the StarFive JH7110 SoC.
> 
>> > +		compatible = "fixed-clock";
>> > +		clock-output-names = "wm8960_mclk";
>> > +		#clock-cells = <0>;
>> > +	};
>> > +
>> >  	i2srx_bclk_ext: i2srx-bclk-ext-clock {
>> >  		compatible = "fixed-clock";
>> >  		clock-output-names = "i2srx_bclk_ext";
>> > @@ -375,6 +381,27 @@
>> >  			status = "disabled";
>> >  		};
>> >  
>> > +		tdm: tdm@10090000 {
>> > +			compatible = "starfive,jh7110-tdm";
>> > +			reg = <0x0 0x10090000 0x0 0x1000>;
>> > +			clocks = <&syscrg JH7110_SYSCLK_TDM_AHB>,
>> > +				 <&syscrg JH7110_SYSCLK_TDM_APB>,
>> > +				 <&syscrg JH7110_SYSCLK_TDM_INTERNAL>,
>> > +				 <&syscrg JH7110_SYSCLK_TDM_TDM>,
>> > +				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
>> > +				 <&tdm_ext>;
>> > +			clock-names = "tdm_ahb", "tdm_apb",
>> > +				      "tdm_internal", "tdm",
>> > +				      "mclk_inner", "tdm_ext";
>> > +			resets = <&syscrg JH7110_SYSRST_TDM_AHB>,
>> > +				 <&syscrg JH7110_SYSRST_TDM_APB>,
>> > +				 <&syscrg JH7110_SYSRST_TDM_CORE>;
>> > +			dmas = <&dma 20>, <&dma 21>;
>> > +			dma-names = "rx","tx";
>> > +			#sound-dai-cells = <0>;
>> > +			status = "disabled";
>> > +		};
>> > +
>> >  		stgcrg: clock-controller@10230000 {
>> >  			compatible = "starfive,jh7110-stgcrg";
>> >  			reg = <0x0 0x10230000 0x0 0x10000>;
>> > @@ -601,5 +628,12 @@
>> >  			#reset-cells = <1>;
>> >  			power-domains = <&pwrc JH7110_PD_VOUT>;
>> >  		};
>> > +
>> > +		sound0: snd-card0 {
>> 
>> 1. Why card0?
>> 2. Where is this node located? In MMIO bus? Run some basic checks on
>> your DTS before submitting upstream.
>> dtbs_check
>> dtbs W=1
>> 
>> 3. Why this is even in the DTSI? This really looks wrong.
> 
> Excuse me for not following here, but Walker, could you point me at
> where in the schematic for the VisionFive 2 that this wm8960 actually
> is?
> I know ~nothing about audio, but good old Google tells me that this is a
> dedicated codec chip and I was looking at [1] and could not easily find
> it on the schematic.
> 
> Thanks,
> Conor.
> 
> 1 https://doc-en.rvspace.org/VisionFive2/PDF/SCH_RV002_V1.2A_20221216.pdf

Hi Conor,

The TDM need work together with external codec WM8960 by plugging the raspberry pie
 audio board into the 40-pin, which is found in sheet 21 of the schematic. Because the
 40-pin of VisionFive2 is fully compatible with the pins of Raspberry pie audio board. 

For more information of the audio board, you can take a look at the following webpage:
https://wiki.seeedstudio.com/ReSpeaker_2_Mics_Pi_HAT/

The schematic of audio board:
https://files.seeedstudio.com/wiki/MIC_HATv1.0_for_raspberrypi/src/ReSpeaker%202-Mics%20Pi%20HAT_SCH.pdf

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
