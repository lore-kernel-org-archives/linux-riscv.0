Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE3FC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDt/TbT4aYoDHcvwBCOKSyE9dJBRcqH8jyPEZitSp9Y=; b=RGgOOX1WFVjLnE
	yL4IbL/IJ8K6jWmqwQp255e7o3AF9kiSZTYVzifwMEDQs71gM+j9Kc2t2UNR211XySK0NtFJNJ7Lc
	X20AmPkjkfAjm+5vGFGwE4eDY972IZ703bZgnflndhkL+byFA3vP0G04T4ekI+UoL4SWFTGXqoWOS
	l7TUjQgkI8puw5FiUMIDltZLmnWtvDEcCWNBfyo7PLUnbVfrFNoGg1bMOPkST+77Av+UtlwukslXc
	/X8abBkTpRy6EOXaLPvoThN0Q73EMLSCEozNKMPBGAxUSZ2OBeIIGCTMFIA5qJUIMckINPH8kcMsk
	/mSLqW1rPEqM1Po13CZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFaHS-00EDSz-2i;
	Tue, 19 Dec 2023 13:37:06 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFaHP-00EDSV-0f;
	Tue, 19 Dec 2023 13:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702993021;
	bh=FnY6knylJ3x5vm9CnT/Sy6SqYuEWSlZ8nKY07PB5N7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rr/fsctIrfTYaB6wwgAqsttKJXuqFEYeaGHdO+RJUJx6mCnkUHNcbAmTsAv6hHtz6
	 HWU/k63GGZPmCPkoC9UHuhiYM/WE4xnxpAp9lY7KOp/yy/aHG59CzEK6ae141k4iy2
	 ylfrB0Sl7xcYDxL0qJ/RiVjxDqBMokBKDX9oRNhd7F/jrw+TEr6sObE7JXzSWliHDG
	 O8B1yPGN20H3Pr4IuFPnN0jlNyfrnNfBFI0AtX2LFY6lPtKGxF1oOlnKYl60VAjjJL
	 BfCwuad1t7Mz4l63tcJxsvYvM7a+iquoBaxInwxx8kFCelNCoxO0SfT/b0kM9q/E7x
	 agTbnn5KDVMWQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A413B378145A;
	Tue, 19 Dec 2023 13:36:59 +0000 (UTC)
Message-ID: <50f0a002-f602-4cdb-ab18-e085adbf09bc@collabora.com>
Date: Tue, 19 Dec 2023 15:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] dt-bindings: net: starfive,jh7110-dwmac: Add
 JH7100 SoC compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
References: <20231218214451.2345691-1-cristian.ciocaltea@collabora.com>
 <20231218214451.2345691-3-cristian.ciocaltea@collabora.com>
 <c9225053-78f8-40b7-9453-dc3dabe44500@linaro.org>
 <d030f5b7-8d32-4a80-a3c0-98cfa1c0fe4f@collabora.com>
 <15077e1f-c13b-4424-9918-df441b56b695@linaro.org>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <15077e1f-c13b-4424-9918-df441b56b695@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_053703_406662_3272CFA3 
X-CRM114-Status: GOOD (  12.61  )
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

On 12/19/23 15:19, Krzysztof Kozlowski wrote:
> On 19/12/2023 13:49, Cristian Ciocaltea wrote:
>>>>    reg:
>>>>      maxItems: 1
>>>> @@ -46,23 +50,6 @@ properties:
>>>>        - const: tx
>>>>        - const: gtx
>>>>  
>>>> -  interrupts:
>>>> -    minItems: 3
>>>> -    maxItems: 3
>>>> -
>>>> -  interrupt-names:
>>>> -    minItems: 3
>>>> -    maxItems: 3
>>>> -
>>>> -  resets:
>>>> -    minItems: 2
>>>> -    maxItems: 2
>>>
>>> What is the point of your previous patch if you immediately remove it?
>>> It is a no-op. Just mention in this commit msg, that both resets and
>>> reset-names are coming from snps,dwmac so they can be removed from
>>> top-level entirely.
>>
>> This has been discussed during v2 review [1], where I also provided the
>> rational behind not updating reset-names. So the code was not deleted,
>> but moved under an if clause.
>>
>> Thanks for reviewing,
>> Cristian
>>
>> [1]: https://lore.kernel.org/lkml/f4d0b216-5bdc-4559-aabb-8af638d33721@collabora.com/
> 
> I don't see it being addressed:
> 
> https://lore.kernel.org/lkml/35556392-3b9a-4997-b482-082dc2f9121f@linaro.org/
> 
> Repeating the same and the same :/

I think this was just a misunderstanding, sorry for the confusion.  I
kept two sets of changes which were not directly related into separate
patches, so I'm going to squash them in v5.

Thanks,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
