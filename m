Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E99C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 11:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZOMX1FcWsEBUOxGltFKIU2LRYSfhp1026BM6zAd76I=; b=f2dU4c+QmQviD+
	ZrYJYr7Sy8dHz7Y9LGEUXQKryIFmjEhtoxn0l/u3H2HMyhojLoLEEv74jMil2Tgn/Yg1VeiwMeL9D
	2M8NTmCzOdi49vdXVI8L9TrHR4Wy8C3+XOYnxRrsIRydCRvKPhqLhhB1rGA8TTdWtPAU6lxghVaqX
	S9Zwe/cU3jdSH6OXUGsl61YGIprLHijxJ6ARV7y4WMvF3f3Kz+bsDQis8aMFtmL/TCehV9yvJ8B9k
	u52BnSNXQ8ga6G1DTkT8QmSHuUgYQnz9WN75c/0b8aCHDcYdbZAtmGqA+4P9v2qhUBDXTNQSMxjsk
	4afdX3mUi8SU91CNja/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFC6q-00ALRO-0R;
	Mon, 18 Dec 2023 11:48:32 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFC6n-00ALN8-0U;
	Mon, 18 Dec 2023 11:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702900104;
	bh=cGR57+CiG5a+3zirrKt+CQiAa44aj9FUBj5+rhcA9VM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QZ+3xWuH+hzguRihJ5wfmGV6IBQ4oy3RSHlbf/lRB2c+dNBkK6gAFqaUQ6BHgsYTP
	 B71E+s4hEd5cGoywoTQOe1kbaeb2ZZuJRNEKc7xVtBI27NWEjkyIprI5ph/sYpBynk
	 56SgJde7fgS+77iBGFoeFNn7K5bG3pw6727TJnyesSfgPpImLp45fRHI5h4eRxU/zG
	 F6znNG4DSGdyhKHM9Wol9Wj3ctEOWFnE/hDUofqYmpfQZzBPAc2CgfOhUgo5hgl4nV
	 RdaygF1EqXYMma/47DjheC66X6nCo4j7osbBxylPw3DRkgwlk6LH5UVhMd1Ip2MxKc
	 st6Q66gdTlKSA==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1609037814A3;
	Mon, 18 Dec 2023 11:48:22 +0000 (UTC)
Message-ID: <11f7fbee-4795-4d5f-a5f8-901bc17683eb@collabora.com>
Date: Mon, 18 Dec 2023 13:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] riscv: dts: starfive: jh7100-common: Setup pinmux
 and enable gmac
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
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
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-6-cristian.ciocaltea@collabora.com>
 <CAJM55Z-bg0EGPaLHtxcu2AzqN59zfuiT0eE7oCShrx7dG_QK1g@mail.gmail.com>
 <20231217-rippling-galleria-904152e41f95@spud>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20231217-rippling-galleria-904152e41f95@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_034829_328972_B9B52972 
X-CRM114-Status: GOOD (  12.20  )
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

On 12/17/23 23:03, Conor Dooley wrote:
> On Sat, Dec 16, 2023 at 11:38:53AM -0800, Emil Renner Berthing wrote:
>> Cristian Ciocaltea wrote:
>>> Add pinmux configuration for DWMAC found on the JH7100 based boards and
>>> enable the related DT node, providing a basic PHY configuration.
>>>
>>> Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>>> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>> ---
>>>  .../boot/dts/starfive/jh7100-common.dtsi      | 85 +++++++++++++++++++
>>>  1 file changed, 85 insertions(+)
>>>
>>> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
>>> index 42fb61c36068..5cafe8f5c2e7 100644
>>> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
>>> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
>>> @@ -72,7 +72,92 @@ wifi_pwrseq: wifi-pwrseq {
>>>  	};
>>>  };
>>>
>>> +&gmac {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&gmac_pins>;
>>> +	phy-mode = "rgmii-id";
>>> +	phy-handle = <&phy>;
>>
>> I'm not sure if it's a generic policy or not, but I don't really like adding a
>> reference to a non-existant node here. I'd move this property to the board
>> files where the phy node is actually defined.
> 
> FWIW, I don't like the reference-in-the-wrong-place thing either.

Yeah, as I already mentioned this was unintentional, will fix in v4.

Thanks,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
