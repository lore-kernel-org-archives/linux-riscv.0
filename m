Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A219C46CCD
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 11:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Bwu9sCfDHdEbHFGHtoisQCOrUygh4jQvCTQaQJVrxE=; b=fLOBVClUNfE1Jm
	Sebmr8wMi1cA2CmP7Cnb+p3hPmA6G4e9b2vgLcsSE7L5AQ9hxw4hF2IlggdqEGTaBOw+71lGR7xMT
	99lRjthsDMtykfPEjSiZ7MCbBDdLXH2tE0+ynMInwiJwzDDALG6yXJDwl9cji9bHU/U3HzMtJOtY2
	QELiWMB+xLmrGridGZa2ka0TkMvhkkicJ8CkSAHc39Iqh3qxKcfpzsprR0CtcGAhMJBnbdh7ONEvv
	gldqFgExp7lJxADKjD+UIq6KyTeqbEVqjRvqUipOAFf7YHwDWuCC/yMvc2aR9XDjf9TG/MO8GbD9J
	Ho3X2Ji51aOUUW7wSVpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFC2S-00AIEh-38;
	Mon, 18 Dec 2023 11:44:00 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFC2P-00AIAV-1i;
	Mon, 18 Dec 2023 11:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702899835;
	bh=+AE8FG87JjGXQZ7aKx+tpmHcDvNM6DDRUxk5MZqAb4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NnoaSKieHR6swMS1aHrusYDqLIPoqpaqKP+0jC7/bOhu9uyCuIBbR7GbjLOTqnVFQ
	 aofCGeAjJ4cerVlSp1kZIzTq3bqOY0m+r49v5ciHgqgMaU5T6cU4vZbLZG4vXANCbv
	 zuSyGf1s3hLfzDH5RWG9MP/vR06o1sHfa11g1uWVzclCVDk0a3F4hQgZhBx416FP3f
	 OL9eePgwTzMG11Djscu2MGXa5b2LVFdYhFoA757KG6Ink9K5ft8lu/cm6CSkRraR8x
	 aJFsfpEgK3Lr/z3MHNYgU1KRhR1N55mIB4UMHLrQrKHmqq4PRcinmK5BZCvn2yRC3H
	 OxPAyW3dxhFkA==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 696FF37814A3;
	Mon, 18 Dec 2023 11:43:53 +0000 (UTC)
Message-ID: <b65393f1-1c36-40e5-96f6-1e7f978cc185@collabora.com>
Date: Mon, 18 Dec 2023 13:43:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] riscv: dts: starfive: visionfive-v1: Setup
 ethernet phy
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
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
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-7-cristian.ciocaltea@collabora.com>
 <f8f9d454-6155-4b1c-b4b2-daf98267be14@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <f8f9d454-6155-4b1c-b4b2-daf98267be14@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_034357_744935_94C99F89 
X-CRM114-Status: GOOD (  11.79  )
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

On 12/17/23 19:55, Andrew Lunn wrote:
> On Fri, Dec 15, 2023 at 10:40:45PM +0200, Cristian Ciocaltea wrote:
>> The StarFive VisionFive V1 SBC uses a Motorcomm YT8521 PHY supporting
>> RGMII-ID, but requires manual adjustment of the RX internal delay to
>> work properly.
>>
>> The default RX delay provided by the driver is 1.95 ns, which proves to
>> be too high. Applying a 50% reduction seems to mitigate the issue.
>>
>> Also note this adjustment is not necessary on BeagleV Starlight SBC,
>> which uses a Microchip PHY.  Hence, there is no indication of a
>> miss-behaviour on the GMAC side, but most likely the issue stems from
>> the Motorcomm PHY.
> 
> I suggest you make a similar comment in the .dts file, just to explain
> the odd setting.

Sure, will do, we need a v4 anyway.

Thanks,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
