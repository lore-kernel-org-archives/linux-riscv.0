Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF51D4A5F4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 17:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXWF9UOwdFcNGYu8iq+9ANDjDWF74SjSwwwLJcS6qpQ=; b=0YYhRP/Q1BGy9e
	rlhGw4aozJP38mZhlx+pS8cQbySyGQUe3po8UW8iXah+N3sBt5oSGIJ3TeZMlykVGL7xkOZzICqHj
	mKPgu5cTBZq8HvS3J4VvXf/Fap8nSBEd1xrCq7J/Oxrwbb2t/LzNtdebE8I5w3qa+p7EVhvnu0j5z
	fD9aEzAm919YTAI8T02LptgrhSMtxdEq2B3Vvkmei3rg6D6ga0+669peKhx7avMjUPO7BmdZfd0Ii
	zoOZE6Ohee9m6+3xwxUe241CQx++Y67OQ9Cedmnn7Nr9X6/Z2Xhb4cBR3YNNJfT+TYFRvj77n9F+I
	+OJAs5dc66Vm6Vv8+WzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhWde-00000000bnw-0pM5;
	Sun, 18 Jan 2026 17:32:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhWdb-00000000bn8-2kp6
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 17:32:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8455A409E3;
	Sun, 18 Jan 2026 17:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312E8C116D0;
	Sun, 18 Jan 2026 17:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768757550;
	bh=0kTRKH5PaljDGxLy90Sgh1dSRT8to08dWqQtVquwlcM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=oMhudOhryWaF5MpCw884aJNkuQw5mQs4S9WtpwCqG2nypQto5ph3aqhjsOiOQlt91
	 oru67127ULWlaMjJsji8ktKOhi6sPL5RNIeb3kcgjUNv0FEwDbpJDIllAiP6nHia/z
	 oQnR9ueYqJ3zEEQBUtCdk4xYdrEjL2jWOj6etESn/DRgxxV3lbAGEUMi7BLbAQqyh6
	 Siv/J/SNvJLNLTH+r8jBxHMT78Di97kyImEgZ0IVK/qk6diH00/C0elNsl9DDWMKaM
	 LB09Tw6VqNvA+8YWwCIt7cF4QTDLlYtgJvqEbm8KHlx80BdHWowt9rX0RW5oC28GtJ
	 z5ca0d+IR78+w==
Message-ID: <37bbd795-a0b1-462b-bf0a-2713f79ef2b8@kernel.org>
Date: Sun, 18 Jan 2026 18:32:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-1-d10055f68368@gmail.com>
 <20260118-famous-magnificent-peccary-474ba8@quoll>
 <aW0SikDtd0HIrT4v@anton.local>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aW0SikDtd0HIrT4v@anton.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_093231_764787_E68A4B68 
X-CRM114-Status: GOOD (  11.00  )
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

On 18/01/2026 18:07, Anton D. Stavinskii wrote:
> On Sun, Jan 18, 2026 at 11:14:34AM +0400, Krzysztof Kozlowski wrote:
>>
>> Please use subject prefixes matching the subsystem. You can get them for
>> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
>> your patch is touching. For bindings, the preferred subjects are
>> explained here:
>> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> dt-bindings: sound: sophgo,cv1800b: add I2S/TDM controller

No. Read again, I even gave you DIRECT doc link!

> 
> Is this anyhow better? Also in the documentation directory should go
> first but I didn't find such examples in git follow. 

Huh? How so? Where are you looking? 99% of commits have correct prefix.
Where do you see sound:

b7d53fe53cb5 ASoC: dt-bindings: rtq9128: Add rtq9154 backward compatible
35bffbe49dfd ASoC: dt-bindings: Convert realtek,rt5651 to DT schema
70d95c5d2081 ASoC: dt-bindings: rockchip-spdif: Allow "port" node
f66e7da2a6b1 ASoC: dt-bindings: realtek,rt5640: Allow 7 for
101b982654ac ASoC: dt-bindings: realtek,rt5640: Add missing properties/
b540b4e157c4 ASoC: dt-bindings: realtek,rt5640: Document port node
25b858474497 ASoC: dt-bindings: realtek,rt5640: Update jack-detect
66b47b9c069f ASoC: dt-bindings: realtek,rt5640: Document mclk
9ebc914acd32 ASoC: ES8389: Add some members and update
fd9a14d233fb ASoC: dt-bindings: everest,es8316: Add interrupt support
af4c0b951b18 ASoC: dt-bindings: realtek,rt5575: add support for ALC5575
85a6544777e0 ALSA: hda: dt-bindings: add CIX IPBLOQ HDA controller
270d32cd0efc ASoC: dt-bindings: cirrus,cs42xx8: Reference common DAI
bb52dc1d0342 ASoC: dt-bindings: ti,tas2781: Add
4980df101676 ASoC: dt-bindings: mediatek,mt8189-nau8825: add mt8189-
22e9bd51e518 ASoC: dt-bindings: mediatek,mt8189-afe-pcm: add audio afe
0b2333183ade dt-bindings: Remove extra blank lines
bcc357c8e061 dt-bindings: Update Krzysztof Kozlowski's email
c2561572031a ASoC: codecs: lpass-macro: complete sm6115 support
675f41b8d167 ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115 LPASS VA
5a0438622b49 ASoC: dt-bindings: qcom,lpass-va-macro: re-arrange clock-
65d03e84d8b8 ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115 LPASS RX
4acbfcf11cbe ASoC: dt-bindings: consolidate simple audio codec to
7a381e373a42 ASoC: qcom: q6dsp: fixes and updates
aa897ffc396b ASoC: dt-bindings: ti,pcm1862: convert to dtschema
c4e68959af66 ASoC: dt-bindings: ti,tas2781: Add TAS5822 support
3cd523ba2706 ASoC: dt-bindings: cirrus,cs4271: Document mclk clock
5e5c8aa73d99 ASoC: dt-bindings: pm4125-sdw: correct number of soundwire
6ddcd78aa7f8 ASoC: dt-bindings: allwinner,sun4i-a10-spdif: Add
67e4b0dfcc67 ASoC: dt-bindings: allwinner,sun4i-a10-i2s: Add compatible
bb65cb96f64e ASoC: dt-bindings: sound: cirrus: cs530x: Add SPI bus
9957614d2b79 ASoC: dt-bindings: sound: cirrus: cs530x: Add cs530x
ee4407e1288a ASoC: dt-bindings: qcom,sm8250: add QRB2210 soundcard
8c465b1669bf ASoC: spacemit: add i2s support to K1 SoC
2880c42a0de6 ASoC: amd: ps: Propagate the PCI subsystem Vendor and
6a4f29bc6629 ASoC: dt-bindings: don't check node names
73978d274eba ASoC: dt-bindings: Add bindings for SpacemiT K1
15afe57a874e ASoC: dt-bindings: qcom: Add Kaanapali LPASS macro codecs
367ca0688e42 ASoC: dt-bindings: qcom,sm8250: Add kaanapali sound card
62ef9b2a01a0 ASoC: Add QCS615 sound card support
fcd298fdc2a3 ASoC: dt-bindings: Add compatible string fsl,imx-audio-



Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
