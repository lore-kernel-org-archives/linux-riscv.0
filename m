Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E198CC47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrznmeFMcG88aGxvBTEc6TdhCIXv5RnsDLh0vUkFXhk=; b=Qh7GSc87b1c61U
	2ITGXhb4Ewik0lZKBK6+O9iYKas8WxU1Ifmouk9B3W9+elRvTnTaAZsb7NCVOE7QqhIhPmeWc11op
	BdfHio8A5rj6PAU0uM+uAWutj7A8VlCVVerMYdV3PXsZgEk+XZrMB8PXhOMlpUJtOWp01fYPjPKvN
	Jl685q9Dok+DNCIxSi/XHsd17Jz/lNnydcgYqweoodIHJ+PhIkPKSJeG4abF2PZtkB7+IuOTrrBtA
	lNdlLy3Ue6WVcooY2spyDxneiIFnKpYY0WkI7m3/jQsFlHYY8jFLu7JqZB62wI4gNBDxkOhwc9XCB
	/M4XrHiG36lrQVHjP8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNzew-000p2x-0J;
	Thu, 11 Jan 2024 18:20:06 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNzes-000p2G-1U;
	Thu, 11 Jan 2024 18:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704997198;
	bh=rdyPLDn+13S8BwUHnP7YxTnuD0iUYoq80Xm8fz63qzo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f5f17p5iX/IKt6UN9Jwhpvty5sF74a26euidP8Pxt2/AltKRl6P2rYTZeD83Ejeds
	 /dMXSUYZNHdOLM6nKJPpCgQhPvzM0eBkPkFgeTBinDrx6Vs+BQbIbEkBoj0W3VVxR3
	 agxPbZcpLNRMMfn2q/p85xQq9cgf1sHxDs36uqkaW1DGrPl1hqnKf3bjEAti51u+IB
	 5JKTT4TlxopMAwm2pQ7vhXLIdpsdF6Lp17eVWH70y/matvJbG46IP3s3JkGtk+PEp2
	 oLqifpP4etBYdVOMdXc4kp4M64NZp7d8obqjLFjqFk0fz8qWtN+fg6x2JNi2n2yiXG
	 L7oJjibzUlfsA==
Received: from [IPV6:fd00::3:29cf] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 587143781184;
	Thu, 11 Jan 2024 18:19:49 +0000 (UTC)
Message-ID: <e821e651-2074-41c2-82c1-0fc88b3f5664@collabora.com>
Date: Thu, 11 Jan 2024 20:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: net: starfive,jh7110-dwmac: Add
 StarFive JH8100 support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Tan Chun Hau <chunhau.tan@starfivetech.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Simon Horman <horms@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andrew Halaney <ahalaney@redhat.com>, Jisheng Zhang <jszhang@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Russell King <rmk+kernel@armlinux.org.uk>
Cc: Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Jee Heng Sia <jeeheng.sia@starfivetech.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20240111025531.2875-1-chunhau.tan@starfivetech.com>
 <20240111025531.2875-2-chunhau.tan@starfivetech.com>
 <59bb488f-f2ad-44b0-87fa-206ae3b1c33f@collabora.com>
 <3c552324-2ebf-41c2-b310-70341ebfdd9a@linaro.org>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <3c552324-2ebf-41c2-b310-70341ebfdd9a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_102002_634083_3FEF5823 
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

On 1/11/24 20:15, Krzysztof Kozlowski wrote:
> On 11/01/2024 19:07, Cristian Ciocaltea wrote:
>> On 1/11/24 04:55, Tan Chun Hau wrote:
>>> Add StarFive JH8100 dwmac support.
>>> JH8100 dwmac has one reset signal instead of 2 resets as in JH7110.
>>>
>>> Signed-off-by: Tan Chun Hau <chunhau.tan@starfivetech.com>
>>> ---
>>>  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
>>>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 50 +++++++++++++------
>>>  2 files changed, 37 insertions(+), 14 deletions(-)
>>
>> [...]
>>
>> Please note this is going to conflict with the about-to-be-merged changes
> 
> They weren't picked up, so how they can be merged? If you mean applied,
> then you suggest your patchset has some kind of preference, but this
> needs explanation why.

I just meant they got reviewed and should be ready to be applied.

> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
