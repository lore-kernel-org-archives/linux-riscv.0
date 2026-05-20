Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4836CD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 11:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSTZBbGtuBPM9IKEgmfQBMZyytiWM+p93gE60AYe+K8=; b=uhIYi9P36F6IH7cnzi4CUK2d/u
	NlL8c1dY7+qxYETotqig6GrVGZJvDfEBkOh9d7xqG/Mi719wKO8vvWsRdnZV5ybk56GhOhJlWXI6V
	vhwG7XBfUJINvJgmTgowKb2Nz2ON84yRzck9TgVG4e64wlirI+dOZvf9f+Wyj8tKYxehWGUHP3zsL
	w3fnpZcV2vt7ToM/x2U9aTR+hGTm76tWkToqT08qfBH8WFKov1nuE4Xtmz5q3yJdYIQFTFtLzOdaH
	5gPJauUjpnzFBnzO3WAwQ6M9MFEVBn1SQzXwb7Xknwisq0kfrZq2FEgEcxh/1ngP317Zd960W6r6k
	dtJ6kUHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPepy-00000004Pto-1Jzq;
	Wed, 20 May 2026 11:11:42 +0000
Received: from mail-qk1-f179.google.com ([209.85.222.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPepu-00000004Pt8-2E7x
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 11:11:40 +0000
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-911501a99feso612074485a.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779275496; x=1779880296; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lIkzPbGJvuJiBs7z1ji9U2DALkh6krIE8tTV4POiT4k=;
        b=GEjfE9/IwubeA04rhvxYj/bk06H4mtYjNQ0g1kXu0bZ407jL7A+Mc2Qx63l+MzZrmJ
         sQGBRYl8HIrCQ9cSUl7O1EQDrELB9BYYuSbfTIWt59yXljLLciolsLwrM10V6OHxSTfC
         2h3F7CymurpAyciVXMD3ONxrRVWEe7aUs17tP3hEdtSTQGg3IGzF4AhNL+dCeMsnKFS9
         cRlcOPLJZ/RqfZSCXBE7lu6V073V9Q1h/CPZHOKQRn/5apYLi7CzGkIh977LJTVPN0ek
         ZK8FK4akyFysFKOKyJE9AP6A42fUvBuPQLhBxPzQMYMePHrcYe7SzQ0n0CF+yX7B2oyE
         V5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779275496; x=1779880296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIkzPbGJvuJiBs7z1ji9U2DALkh6krIE8tTV4POiT4k=;
        b=R4L1d/dA9o/WD2JJ4mhsKHhHtkKXZ9ljpulwBN/YOrNjQHHyXjNA11E6EAA/X4NK2A
         kHwSwlPNqjE8tuGcgQz7jN6tCYflWOF4+J3MvY01XQA0/k9Sk+cen9ryT5h8GhbHosM2
         60vVrG427kjIwlNjW+zcIEQ16MU1pfx9QUoRMAD2ddXFiDZsH0iBxO5SEw85eZLmAU2O
         yL1pIALCfFTGHMqyhTcGExpefbPr7/VD9LSTGrReMIP1DwEp0ZXAtLb9JQKjtM1zQnRu
         kPHRr9izQhYzslSVjwcqrr98gbJlwarX8RMl0UgybGrFIfakHpWLSW4QZvf0RwnHPZoT
         dhsw==
X-Forwarded-Encrypted: i=1; AFNElJ9luXreH0aAirjLdXxdOjcYmAtsFP7hLMO1HfzWyqoxiD+CQztm8n+GbkMDl4YanImpqTdJKxCfvU2Y7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXlpYF5V05eViaGfIogqrlWncDN8F6SJzdezMCM+sdvedMroFv
	b87Shc85XJYxJNqyGLtE9xsU8YvtSDDJE9ffqYKGJScr6zzdv3Wf6HdjAFgxmU+tays=
X-Gm-Gg: Acq92OFj6R69l9YoDdtW7Y15WSRrksgoi1HSZ0iYzb4lwp4y1thqQgSNIvfnFOfSflk
	YIHUkFOQIiIAK/i0cZwmefHT/lCaDGj58qvqTXtLLkX8oHuCVttIVY0xNARdFgd4Sf5D77XuGe8
	E8W7knOyQe7Tdq72/jseFCLlMV4wfD35JMOc2/kHFssgHYi/7Qtxj1d6hK3nEZd5+IP+GyyLipP
	tPFiZkekA6zIwt1H8UVXrUBPNHTelLIODmbcZ+AEoe9FUQA30Aadnn6kVFpPTOnPDDfqnvIw0SJ
	n1UGTOTgiOdAfiP+EoBl/k3mdMoV5XiYRqY+G7Crtd2cnO9nghDChOrErn3kV5mYpN0SscIoqOm
	CCazNaabxFl5+RlS9lam2UAFD2dpGQ8LXYCqUDXK8PcfEmkrkwy08O7UGXyLzROXkQSz1z9KNtt
	7AKULo+ViiPp8LEUeWl7Ud0EfksI96u6sEUuvDwSXgZfLOTMf743TsuGVguwVTemRN1VarDPkaZ
	X3Y
X-Received: by 2002:a05:620a:1a0a:b0:90f:6d8b:2654 with SMTP id af79cd13be357-911ce332987mr3395608885a.22.1779275496216;
        Wed, 20 May 2026 04:11:36 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:9cf2:2d6b:fbf2:991c? ([2001:1970:3847:e000:9cf2:2d6b:fbf2:991c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9138a830c89sm1320813985a.6.2026.05.20.04.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 04:11:35 -0700 (PDT)
Message-ID: <86ac46cd-b7bc-42cc-8c29-996ae21f3654@baylibre.com>
Date: Wed, 20 May 2026 07:11:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
To: Andre Heider <a.heider@gmail.com>, Yixun Lan <dlan@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ulf Hansson <ulfh@kernel.org>, Iker Pedrosa <ikerpedrosam@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
 <177889984452.2298656.1074391459031404894.b4-ty@b4>
 <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
 <6b945153-5a7b-415e-904a-1c350b7d52ee@gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <6b945153-5a7b-415e-904a-1c350b7d52ee@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_041138_680896_47C531F8 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: devicetree@vger.kernel.org, Margherita Milani <margherita.milani@amarulasolutions.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Aurelien Jarno <aurelien@aurel32.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2026-05-20 03:53, Andre Heider wrote:
> Hi Trevor,
>
> On 16.05.26 2:35 PM, Trevor Gamblin wrote:
>>
>> On 2026-05-15 22:57, Yixun Lan wrote:
>>> On Fri, 15 May 2026 12:48:58 +0200, Iker Pedrosa wrote:
>>>> This series enables complete SD card support for the Spacemit K1-based
>>>> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
>>>> high-performance SD card operation.
>>>>
>>>> Background
>>>>
>>>> The Spacemit K1 SoC includes an SDHCI controller capable of supporting
>>>> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
>>>> currently lacks basic SD controller configuration, SDHCI driver
>>>> enhancements for voltage switching and tuning, and power management
>>>> infrastructure.
>>>>
>>>> [...]
>>> Hi Iker,
>>> I've picked patch 1-3, for [4/4] I think it should be merged after
>>> https://lore.kernel.org/all/20260513071958.29574-1-a.heider@gmail.com/
>>
>> Hi Yixun,
>>
>> That makes sense. In response to your earlier feedback I had drafted 
>> a more
>> complete dts after another schematic comparison, but Iker and I 
>> discussed it
>> and opted to avoid changing scope too much. Andre's series includes 
>> the bits I
>> wanted to add and more, so that works out.
>
> I have 4/4 rebased on my series anyway, do you want me to send it?

If you have an update to make, please do!

Trevor

>
> Thanks,
> Andre
>
>>
>> Thanks!
>>
>> Trevor
>>
>>>
>>> Applied, thanks!
>>>
>>> [1/4] riscv: dts: spacemit: k1: add SD card controller and pinctrl 
>>> support
>>> https://github.com/spacemit-com/linux/commit/2d77e577109967ef65f269c1fc1d6a659d4260fb
>>> [2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support 
>>> with UHS modes
>>> https://github.com/spacemit-com/linux/commit/2585c60ce2f977b13f14a67d1e3ed9c73fd7f381
>>> [3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD card support with 
>>> UHS modes
>>> https://github.com/spacemit-com/linux/commit/c76e2f058cbcab84e4a703f26857a58bdf6a0042
>>>
>>> Best regards,
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
