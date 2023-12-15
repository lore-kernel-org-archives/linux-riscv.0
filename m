Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469B6C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 21:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKeUpBnrkeRD5xCyhIFOlfPTrgGy1RCGoN73R6a+Gbo=; b=ep8B6P6+WyLqw7
	5CniEXABt3IbZsuW4DzwUccDAnlxUtUHz/OsGvufPgVLFsbCW5t4d7uX9YmrJCgceyCQ+igVyc/ZU
	Ahm3d4ByDu40VWrkySJP0E0PjuYVkqxQyV+TcKwDrlQ6OtNjbJpHNfuL4X9ryBkHLlsUccczTGueb
	t4ULUDqBnUpOoMqhmrqWL6yXTSH81Fc9lK2MJdL6+SrmOXS1YucXmAxgAlGaKN8TmKZuD1AkD/nrf
	TAYM2QdM3jPTJ3bPzgOyEF2IpSjKwyKEUNXsCWKad2smNZlv7J0lMtBOmN1eP9siqjHVTscZ4qYGl
	Po3i1M7hvolIi/qkoqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEFUm-004adE-0n;
	Fri, 15 Dec 2023 21:13:20 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEFUi-004acl-2B;
	Fri, 15 Dec 2023 21:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702674794;
	bh=4Z0A8i3BQDX4XSWXqY1AsxNZ2UXBxVUatce/rv4lcqQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=aQQW59ioaNIQdMzt2vbe1pPJEASAIpZfAf6FHXhPw68vkAGU+ykS3yUhdCPVM1NSb
	 9wwk6IO6HDR5/myECbvSXLfKm5Tu1Iabzgg5CNmFx4rW+jmjwj80FBF83uWeDme4E6
	 1tGMZeRLjHm0LxPxHWvry3YxYPwwEWoHSeQ6LPFtKaDgt7FqT1Ls1jV3RGzxpIXezZ
	 vDrQdzgzA2tZNIFtHVeEXRklDATFU6vLymVPKRTOAIMhrGbCxZsXxCzX8B/wwE5wnL
	 SjuVBwV09aKtYTSaLrHp/5ZV+wzmPZtj2vSaXlJ30rCvmJRVYltyXoTaZsyioLFSMq
	 jNgqz9s408vhw==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 66C133781489;
	Fri, 15 Dec 2023 21:13:13 +0000 (UTC)
Message-ID: <698fbb5d-0750-4f2a-857f-5429e5f589f9@collabora.com>
Date: Fri, 15 Dec 2023 23:13:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <CAJM55Z9e=vjGKNnmURN15mvXo2bVd3igBA-3puF9q7eh5hiP+A@mail.gmail.com>
 <2f06ce36-0dc1-495e-b6a6-318951a53e8d@collabora.com>
In-Reply-To: <2f06ce36-0dc1-495e-b6a6-318951a53e8d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_131316_909106_F2EAE39F 
X-CRM114-Status: GOOD (  10.43  )
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

On 11/28/23 02:40, Cristian Ciocaltea wrote:
> On 11/26/23 23:10, Emil Renner Berthing wrote:
>> Cristian Ciocaltea wrote:
>>> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
>>> RGMII-ID.
>>>

[...]
 
>> You've alse removed the phy reset gpio on the Starlight board:
>>
>>   snps,reset-gpios = <&gpio 63 GPIO_ACTIVE_LOW>
>>
>> Why?
> 
> I missed this in v1 as the gmac handling was done exclusively in
> jh7100-common. Thanks for noticing!

Hi Emil,

I think the reset doesn't actually trigger because "snps,reset-gpios" is
not a valid property, it should have been "snps,reset-gpio" (without the
trailing "s").

However, this seems to be deprecated now, and the recommended approach
would be to define the reset gpio in the phy node, which I did in [1].

Hopefully this won't cause any unexpected behaviour. Otherwise we should
probably simply drop it.

[1]: https://lore.kernel.org/lkml/20231215204050.2296404-8-cristian.ciocaltea@collabora.com/ 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
