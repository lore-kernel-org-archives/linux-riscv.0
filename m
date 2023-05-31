Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0A9C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 06:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8VOB212SyHM8QDIpY6C5wwh/1fIZOeG/bvNQ0PivGU=; b=X7NI8GeIypGSbO
	4jP0v+CSIHNL1CYwnvoGPdJd3Jsdjf8AfaFQAoIG6aDOvSmz5m59J+wIh3hnxX3tpuUd4tg0Z9kk1
	u3Y6mq7yphup1MVhRyJ5tH2zSYQm1WTkz2Ldf02IZl9glQpucqYtZ35H00GBqTZqwMeIGvdEcfJ5F
	ZLHSrME6/qV8p2QgVLv8izT0Zy8DQeXDX+YAxwGS7AOR9zH1RlKdaPVyL8Aomw24nTAkzD+RDXbds
	+fDxhFnGrUcweXmrjQ5jHnykU7RB/YhaC1h5P3ZAUB1DTk5svGY18mx/bohWVKJdlQ/JKOaByio7r
	pOgKvKmzMcpsu7gQmcog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4FYH-00GKK6-30;
	Wed, 31 May 2023 06:43:21 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4FYD-00GKII-19
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 06:43:19 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8398024DDBE;
	Wed, 31 May 2023 14:42:51 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 31 May
 2023 14:42:51 +0800
Received: from [192.168.125.80] (113.72.147.198) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 31 May
 2023 14:42:50 +0800
Message-ID: <0308ad78-5aec-f51f-41d1-40364d87ddc3@starfivetech.com>
Date: Wed, 31 May 2023 14:42:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 3/3] riscv: dts: starfive: add the node and pins
 configuration for tdm
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Claudiu Beznea
	<Claudiu.Beznea@microchip.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Emil Renner Berthing" <emil.renner.berthing@canonical.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230526145402.450-1-walker.chen@starfivetech.com>
 <20230526145402.450-4-walker.chen@starfivetech.com>
 <dbb7ca72-fb21-6cc4-0f10-0f17818689db@starfivetech.com>
 <ed0a36ff-c497-9bb3-05d2-ea93285f4d1d@starfivetech.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <ed0a36ff-c497-9bb3-05d2-ea93285f4d1d@starfivetech.com>
X-Originating-IP: [113.72.147.198]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_234317_742397_340B8B95 
X-CRM114-Status: GOOD (  11.02  )
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

On Wed, 31 May 2023 14:30:19 +0800, Walker Chen wrote:
> On 2023/5/31 14:23, Hal Feng wrote:
>> On Fri, 26 May 2023 22:54:02 +0800, Walker Chen wrote:
>>> Add the tdm controller node and pins configuration of tdm for the
>>> StarFive JH7110 SoC.
>>> 
>>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>>> ---
>>>  .../jh7110-starfive-visionfive-2.dtsi         | 40 +++++++++++++++++++
>>>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 21 ++++++++++
>>>  2 files changed, 61 insertions(+)
>>> 
>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>>> index 1155b97b593d..19b5954ee72d 100644
>>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>>> @@ -214,6 +214,40 @@
>>>  			slew-rate = <0>;
>>>  		};
>>>  	};
>>> +
>>> +	tdm0_pins: tdm0-pins {
>>> +		tdm0-pins-tx {
>> 
>> Use consistent naming, so
>> 
>> 	tdm_pins: tdm-0 {
>> 		tx-pins {
>> 
>>> +			pinmux = <GPIOMUX(44, GPOUT_SYS_TDM_TXD,
>>> +					      GPOEN_ENABLE,
>>> +					      GPI_NONE)>;
>>> +			bias-pull-up;
>>> +			drive-strength = <2>;
>>> +			input-disable;
>>> +			input-schmitt-disable;
>>> +			slew-rate = <0>;
>>> +		};
>>> +
>>> +		tdm0-pins-rx {
>> 
>> 		rx-pins {
>> 
>>> +			pinmux = <GPIOMUX(61, GPOUT_HIGH,
>>> +					      GPOEN_DISABLE,
>>> +					      GPI_SYS_TDM_RXD)>;
>>> +			input-enable;
>>> +		};
>>> +
>>> +		tdm0-pins-sync {
>> 
>> 		sync-pins {
>> 
>>> +			pinmux = <GPIOMUX(63, GPOUT_HIGH,
>>> +					      GPOEN_DISABLE,
>>> +					      GPI_SYS_TDM_SYNC)>;
>>> +			input-enable;
>>> +		};
>>> +
>>> +		tdm0-pins-pcmclk {
>> 
>> 		pcmclk-pins {
>> 
>>> +			pinmux = <GPIOMUX(38, GPOUT_HIGH,
>>> +					      GPOEN_DISABLE,
>>> +					      GPI_SYS_TDM_CLK)>;
>>> +			input-enable;
>>> +		};
>>> +	};
>>>  };
>>>  
>>>  &uart0 {
>>> @@ -221,3 +255,9 @@
>>>  	pinctrl-0 = <&uart0_pins>;
>>>  	status = "okay";
>>>  };
>>> +
>>> +&tdm {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&tdm0_pins>;
>> 
>> 	pinctrl-0 = <&tdm_pins>;
>> 
>> Best regards,
>> Hal
> 
> OK, I'll update these node's name in the next submit.
> Thanks.

With that fixed,
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
