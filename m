Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF020C197A0
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 18:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFgvEW3RZnDiDGgz0us+yRmdfS6dFOGgBHq6sCUZA3Q=; b=Zh437icsiEGYfZ
	hN/2ojWyqZBV8QnXzup0qqqUKL6yJ3ijLihHt69yRAv2BAIh4jHXX2KGtxOrp8VuHlfezb+Pt03A9
	furqhjUlA6sXmFxPt6qvx2BiXle+RTkHYUK8oHdEFqD5EWezt8YHaxghVn7AkYl85y7C5xoIVq88x
	vj2NJcmZwHf28oTYIJdsj2X23FZ4rDYGslNRmofonmUOBQ7nLeiwtvesqM+0lM4QaLL06ev60EIWA
	ANC/EHreh3i+1ICQwVswr0jfMjHESSSW4QVnqjExc2UOe3saaQ9DT6hHRSQB8j42z/BiLimqeOwnE
	B/RzhDX07PIgH9XZMxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3h8e-004Klo-27;
	Thu, 16 Nov 2023 18:30:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3h8b-004KkN-2j;
	Thu, 16 Nov 2023 18:30:51 +0000
Received: from [100.116.17.117] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 267BF6607355;
	Thu, 16 Nov 2023 18:30:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700159444;
	bh=SfQ0+hmvmWXxSEVa4mEfgSW3GKHJePtTDvpcPdZG1Uk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=maVewsrbypH3b7HVwPhXhJEqUkk1FTC2a2CT/5Zdw8v0VmZeg8+49dqvgBb32xiWM
	 azbq7XlRF2ladTSFgbsOB5dpUdbNs+4FMDF5xcR9fdEVZB/F+ulE6j4ZBRq0aVF6gd
	 Ur0OkuPWF55GWXqbMfJmoU650l9DTsr8+skMC8Zswxs2w1tuaiRCRlz0AGOeQXVE52
	 UXsV2fK1XsZojC5adNNbRtAUfgqGVyQA6/j/Ap8+LUXOiljEPcAB6Cgbz+1VDKrfA6
	 xfLdKthrk/vZguFVZXiDOIWS6Ls/26NP4+ih04LWU6pskf7c8KzkOn65cYI6vWsUU/
	 P7wAhHza3KzGg==
Message-ID: <dae6284f-b94f-45d6-a76c-20f173bf7978@collabora.com>
Date: Thu, 16 Nov 2023 20:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 geert@linux-m68k.org
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <f253b50a-a0ac-40c6-b13d-013de7bac407@lunn.ch>
 <233a45e1-15ac-40da-badf-dee2d3d60777@collabora.com>
 <cb6597be-2185-45ad-aa47-c6804ff68c85@collabora.com>
 <20231116-stellar-anguished-7cf06eb5634a@squawk>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20231116-stellar-anguished-7cf06eb5634a@squawk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_103050_029553_D83A5CCB 
X-CRM114-Status: GOOD (  17.50  )
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

On 11/16/23 19:55, Conor Dooley wrote:
> On Thu, Nov 16, 2023 at 03:15:46PM +0200, Cristian Ciocaltea wrote:
>> On 10/30/23 00:53, Cristian Ciocaltea wrote:
>>> On 10/29/23 20:46, Andrew Lunn wrote:
>>>> On Sun, Oct 29, 2023 at 06:27:12AM +0200, Cristian Ciocaltea wrote:
>>>>> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
>>>>> RGMII-ID.
>>>>>
>>>>> TODO: Verify if manual adjustment of the RX internal delay is needed. If
>>>>> yes, add the mdio & phy sub-nodes.
>>>>
>>>> Please could you try to get this tested. It might shed some light on
>>>> what is going on here, since it is a different PHY.
>>>
>>> Actually, this is the main reason I added the patch. I don't have access
>>> to this board, so it would be great if we could get some help with testing.
>>
>> @Emil, @Conor: Any idea who might help us with a quick test on the
>> BeagleV Starlight board?
> 
> I don't have one & I am not sure if Emil does. Geert (CCed) should have
> one though. Is there a specific test you need to have done?

As Andrew already pointed out, we'd like to know if networking for this
board works without any further adjustment of the RX internal delay.

This was necessary for VisionFive (see previous PATCH v2 11/12), but the
PHY is different (Motorcomm YT8521), hence this test might help us
understand if there's a potential issue with the SoC or the PHY.

Thanks,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
