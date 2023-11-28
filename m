Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3211C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 00:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A43iADiGU1xamyTmvMw4S4z8EmnNwDEKzZ3oEH3t1g0=; b=blVUn6+YN8fRZV
	BFzlgibl7/BnYSQEicEmmb0no75JdPMmGxwRd3TM1UkaYRSXSz0eCPP/PH5sEBs/PN8QQF2CK0j8p
	zHxtePvM8OVe21sRVMbX+AeEiiq2Qt+8MCx9VVxC3If3xEzyCFM9vN3anpuT+xslCkIQ44r0CuyAp
	6154lqd+3YN/mCUZpW+oPA1gbg+0+8i+zdQAi2zBUnpiW2MuMsd71Z76ZsWTkfFFaPMsZWwKfbJk2
	AVru7HA9jOnOQK8mIcyNnkhsBQFRiNsQd2ASa59LH2fIjyeMbgolDLkC3fhQxwb75zZFOICLZ9zQk
	zZZdsEVaAvK51dT84wMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7m9p-003lHR-25;
	Tue, 28 Nov 2023 00:40:57 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7m9m-003lGC-0d;
	Tue, 28 Nov 2023 00:40:55 +0000
Received: from [100.116.17.117] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EBEE06602F33;
	Tue, 28 Nov 2023 00:40:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701132049;
	bh=h7YSTfO06hlkQSwOKq0bWn+ONs0St86lF+pU8MQKvuI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VmzBZg6CWKaixb4KhvHQgi7BX64H30ILpSwJn84YmYWZ/X9EQUVAtEmmGPbQpqjCJ
	 HlT7k94u4qqZtBcttWVg+gCoMWQfTU58LRK9PgNINlDI92FYyfON2ZP2c7zMhbFGUq
	 VtsKwOMjNIUtJW6ZTM6LsA6pmm6EnetWS5jxDZ6wPURQsBAzHiCw+prW9MpZHFbbgx
	 D2IA6oWvtQXonHcb96Ec7wfwr49e/9EQCZ1huEjNJI0s2tbgruvzMtdY8cO8/g5kRd
	 IUJOvu14Vz0cBTusg/X8G9ZIeIgdyGUPNFETVGWOlhz5XnDIp9Z88xnPCahH5UHD8F
	 DW51oTFSIXKvQ==
Message-ID: <2f06ce36-0dc1-495e-b6a6-318951a53e8d@collabora.com>
Date: Tue, 28 Nov 2023 02:40:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
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
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAJM55Z9e=vjGKNnmURN15mvXo2bVd3igBA-3puF9q7eh5hiP+A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_164054_456170_C86BD3BE 
X-CRM114-Status: GOOD (  21.72  )
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

On 11/26/23 23:10, Emil Renner Berthing wrote:
> Cristian Ciocaltea wrote:
>> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
>> RGMII-ID.
>>
>> TODO: Verify if manual adjustment of the RX internal delay is needed. If
>> yes, add the mdio & phy sub-nodes.
> 
> Sorry for being late here. I've tested that removing the mdio and phy nodes on
> the the Starlight board works fine, but the rx-internal-delay-ps = <900>
> property not needed on any of my VisionFive V1 boards either. 

No problem, thanks a lot for taking the time to help with the testing!

> So I wonder why you need that on your board

I noticed you have a patch 70ca054e82b5 ("net: phy: motorcomm: Disable
rgmii rx delay") in your tree, hence I you please confirm the tests were
done with that commit reverted?

> Also in the driver patch you add support for phy-mode = "rgmii-txid", but here
> you still set it to "rgmii-id", so which is it?

Please try with "rgmii-id" first. I added "rgmii-txid" to have a
fallback solution in case the former cannot be used.

> You've alse removed the phy reset gpio on the Starlight board:
> 
>   snps,reset-gpios = <&gpio 63 GPIO_ACTIVE_LOW>
> 
> Why?

I missed this in v1 as the gmac handling was done exclusively in
jh7100-common. Thanks for noticing!

>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
>> index 7cda3a89020a..d3f4c99d98da 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
>> +++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
>> @@ -11,3 +11,8 @@ / {
>>  	model = "BeagleV Starlight Beta";
>>  	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
>>  };
>> +
>> +&gmac {
>> +	phy-mode = "rgmii-id";
>> +	status = "okay";
>> +};
> 
> Lastly the phy-mode and status are the same for the VF1 and Starlight boards,
> so why can't these be set in the jh7100-common.dtsi?

I wasn't sure "rgmii-id" can be used for both boards and I didn't want
to unconditionally enable gmac on Starlight before getting a
confirmation that this actually works.

If there is no way to make it working with "rgmii-id" (w/ or w/o
adjusting rx-internal-delay-ps), than we should switch to "rgmii-txid".

Thanks,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
