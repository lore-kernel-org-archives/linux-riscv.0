Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD531C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 11:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lgEtcwJrQLPmcOSsy8CLahXfEX/4AmVHVj3iCD/YTAE=; b=4WkMnURPNhvdbD
	UzYaxc+yMEY/pAHih0NSr6d0S7Cj8y42x8xEfUJWYu5aQko/rZcOBPLRuq0rUcVDuxBmb2pkGlnuo
	x+T9PkFCl0iLcJLi9zy4Dww4xtUL+ucrLpf5bxjK/rHoj7cXz7HXc/17hMgQYZPUzejBIkxAzeM2x
	kMgEthCdueTvm4dOEQJh0KYXBeZ31a0ApdFKMa79i220KQPzcp2aXWtqvAP2ii2nhzhf/2XecmkTi
	/fk1Rnq0RPCsyuN4Udzub3zKBar+PoQho0OSPhqe4CieAzeFZAM3xWLxMuM41oC3ne1KpNeN2nbfp
	MqlzxQd8i7NUURW+XssA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFC0Y-00AGgM-2G;
	Mon, 18 Dec 2023 11:42:02 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFC0V-00AGag-0l;
	Mon, 18 Dec 2023 11:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702899716;
	bh=Ay7Tt9dce00P1AFvH+VR0Quwph8t7Z1Zn8abP+bDKl8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=olpcJOvXtTBBpVcYE8PqF5uNLFcLGnlrd77Yy4U2M1CVK1OMCU44ovp8ox0ABd+vx
	 vMMIhpPKRjVYneLkb/RvRi7d4oSroIqe2BjDHoHmIw7nn6GftbYRPI/M/z5ce+U1Ax
	 Xjff2yIbY3xKiaYY9fcWh7LjjHnDZPqbswmEj2DvPmFUBoLeqwQvBZaPBfs9rzAc0I
	 349sA3zHVM5n127CwidQ+I2ZWhl4UpVTusm8MpYA//tJrf50cwyXU1NSx6rkRG4hhi
	 9F77N0ItNtAnDrl7xx1QDhAZsFIdKxvgmdmQxMGqqKHZv7I9w2FZ/Ps3gPOjIvAivu
	 CLedaHr2oRvJg==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 84CA537814A3;
	Mon, 18 Dec 2023 11:41:54 +0000 (UTC)
Message-ID: <cb18617d-e34a-4c3e-a37a-1b051587f8b5@collabora.com>
Date: Mon, 18 Dec 2023 13:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] riscv: dts: starfive: jh7100-common: Setup pinmux
 and enable gmac
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-6-cristian.ciocaltea@collabora.com>
 <CAJM55Z-bg0EGPaLHtxcu2AzqN59zfuiT0eE7oCShrx7dG_QK1g@mail.gmail.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAJM55Z-bg0EGPaLHtxcu2AzqN59zfuiT0eE7oCShrx7dG_QK1g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_034159_402684_1B13170C 
X-CRM114-Status: GOOD (  13.17  )
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

On 12/16/23 21:38, Emil Renner Berthing wrote:
> Cristian Ciocaltea wrote:
>> Add pinmux configuration for DWMAC found on the JH7100 based boards and
>> enable the related DT node, providing a basic PHY configuration.
>>
>> Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  .../boot/dts/starfive/jh7100-common.dtsi      | 85 +++++++++++++++++++
>>  1 file changed, 85 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
>> index 42fb61c36068..5cafe8f5c2e7 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
>> @@ -72,7 +72,92 @@ wifi_pwrseq: wifi-pwrseq {
>>  	};
>>  };
>>
>> +&gmac {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&gmac_pins>;
>> +	phy-mode = "rgmii-id";
>> +	phy-handle = <&phy>;
> 
> I'm not sure if it's a generic policy or not, but I don't really like adding a
> reference to a non-existant node here. I'd move this property to the board
> files where the phy node is actually defined.

Totally agree, I simply went too far while dropping duplicated code and
didn't realize the mistake.  Thanks for noticing!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
