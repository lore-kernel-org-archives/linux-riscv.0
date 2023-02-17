Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1D7C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20t9B8DOha5vkt05sm9UO234rS5+CqQRF7GuSJAAEnw=; b=LtlvkabWt9jLGA
	V5Sz6BVzZRB1RAS9qkJLouj6m0O7BUmctewgj+h/SJM+HP/wXb6y5tVdnuZD73lw2WCt4rlxbO3s6
	KWnWaNbgF1Zd3FFaNiiusaAX385xHQxDocykzVklmpWBIfFcmzHE8wuczly24l5PPhQ/OoYAIp0wp
	ybjWBQtiBcGRrLW06czs+VBw4fETIZJMSihSdJst5wSFSvh94QSCGzPS3nrEj5zPic1bcDRMqhTPT
	WMP+uG6s7Y7g+aLsHN/bvKTZ78+4x9QFDS8vwhK6Ex9wLsxtLxUdllP3wODtMGONbIGnKRCM5syyc
	7Hq5rpP3IFYDTrYS/hMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT2cA-00ErT9-P1; Fri, 17 Feb 2023 15:25:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT2bz-00ErPv-FU; Fri, 17 Feb 2023 15:25:25 +0000
Received: from [192.168.1.90] (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C11E866021B3;
	Fri, 17 Feb 2023 15:25:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676647518;
	bh=u3KoxZVrumBXHky7NSspaxJOp8H2j+XZUk4y1KNptJI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XNw8qC13BbGUvncrt5In0WQZMUFKRE5HdluJEsHVNO/neSDYGjDNHVgripQYaAWXh
	 JLCH4M8sJLPqpv6EhIGO909UOxpEdI2axn+OHveHwr29oR8BE/H7jsHms1I/v3et2N
	 dGNG3+th8t0XkQewAVreP1A+JMU2dUkccFzNhWbADg9zOxXurEaKiq0IG+gwqi1W+D
	 vrgwIw0q9wchaowLs+RDdpT2QpNRlRY7TvDK/6kka8eAWesC3yazUltbJ2NgAThB4k
	 EMxee89Oke3CkrbBA+JrMWIeSBhcvIWurXxoUNloMg9mjjcrMytfEdWH2wSHxjo1Rb
	 AsJkSUdQVLuuQ==
Message-ID: <350b400f-210a-a2cf-0828-25beb1b93a43@collabora.com>
Date: Fri, 17 Feb 2023 17:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 07/12] dt-bindings: net: Add StarFive JH7100 SoC
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
 <Y+e74UIV/Td91lKB@lunn.ch>
 <586971af-2d78-456d-a605-6c7b2aefda91@collabora.com>
 <Y+zXv90rGfQupjPP@lunn.ch>
 <cfa0f980-4bb6-4419-909c-3fce697cf8f9@collabora.com>
 <Y+5t4Jlb0ytw40pu@lunn.ch>
 <a824a7f6-0a62-7cab-180b-f20297311a2b@collabora.com>
 <Y++BZWhJm1LpdrA9@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <Y++BZWhJm1LpdrA9@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_072523_678099_F5CE0511 
X-CRM114-Status: GOOD (  22.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/17/23 15:30, Andrew Lunn wrote:
>>> I would actually say it shows we don't understand what is going on
>>> with delays. "rgmii" is not every often the correct value. The fact it
>>> works suggests the MAC is adding delays.
>>>
>>> What value are you using for starfive,gtxclk-dlychain ?
>>
>> This is set to '4' in patch 12/12.
>>
>>> Try 0 and then "rgmii-id"
>>
>> I made some more tests and it seems the only stable configuration is "rgmii"
>> with "starfive,gtxclk-dlychain" set to 4:
>>
>> phy-mode | dlychain | status
>> ---------+----------+--------------------------------------------
>> rgmii    |        4 | OK (no issues observed)
>> rgmii-id |        4 | BROKEN (errors reported [1])
>> rgmii    |        0 | UNRELIABLE (no errors, but frequent stalls)
>> rgmii-id |        0 | BROKEN (errors reported)
>>
>> [1] Reported errors in case of BROKEN status:
>> $ grep '' /sys/class/net/eth0/statistics/* | grep -v ':0$'
> 
> Thanks for the testing.
> 
> So it seems like something is adding delays when it probably should
> not. Ideally we want to know what.
> 
> There is a danger here, something which has happened in the past. A
> PHY which ignored "rgmii" and actually did power on defaults which was
> "rgmii-id". As a result, lots of boards put "rmgii" in there DT blob,
> which 'worked'. Until a board came along which really did need
> "rgmii". The developer bringing that board up debugged the PHY, found
> the problem and made it respect "rgmii" so their board worked. And the
> fix broke a number of 'working' boards which had the wrong "rgmii"
> instead of "rgmii-id".

Thanks for the heads-up.

> So you have a choice. Go with 4 and "rgmii", but put in a big fat
> warning, "Works somehow but is technically wrong and will probably
> break sometime in the future". Or try to understand what is really
> going on here, were are the delays coming from, and fix the issue.
> 
>        Andrew

I will try to analyze this further.

Regards,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
