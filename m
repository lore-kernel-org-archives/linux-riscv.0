Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A3BC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 21:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPWQi5G64vU+GYPUGTBFHMQ7S32t+LXzqLonez1f0gA=; b=IUjqNfTA5A4DLi
	/mcDybT+V3dqc669Nx4nCjS31w4jTaARWmagNXLYAPGarEc4EpKyqbRJGYhil6sSQnDYrFD1J61Sv
	FVOVyzxTljXs5+GBb8uF/GvUYenOVs/5wGxaCzsGmUn7yac4MkSxeKeP6n53IdzjqM8lrHNcwkAKx
	Xfm6RI2DJub3Hpfi8EHF8+Du9hAqhUOmOEd6evFwzw8TrI3BMw9HEZb7HSRWPoQBmcNPUQh1/gcOB
	acUwH3v/jAx4piBa/T3lmqiFfAirk/+O9+Xh0XQgccoieMbTjdIYnbq2CBiVr3N6NF/EMn9XhIZuZ
	YmXZ7f1b8Urkd/jV5oQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxDGI-0028FC-24;
	Sun, 29 Oct 2023 21:23:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxDGF-0028E1-0K;
	Sun, 29 Oct 2023 21:23:56 +0000
Received: from [192.168.1.90] (unknown [188.24.143.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 679A566072BB;
	Sun, 29 Oct 2023 21:23:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698614631;
	bh=SGq6QPRGIBNn7gbJ2EgKHoDNWHX9rvAA0k7+HWJtVnc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=abdE6pR/zA982y8K9cNxgC1xlpp75ZzB8caxA2ixKDYqj+NQC6wKEfhwy4PQfUYyY
	 j7WDCREK3Wzhi4Ti+raoR5XlLz7rgd52QgBzcnc0FcTl4IXNxPMCtbx+FoFLPGFche
	 bHGVyDAabwMjuh+DsixN6oiDYSjCYYzF46mgU7MGiViIPrNQ9QzlwdPvR2AAZXOuxj
	 BJsXPR/uB7cYb23tyMWk9rCrtc2ulZZUWUTaa7ZBHQDpjpXap2Q7DPhDaSYOZlZTLt
	 eo+eLURddzhlIk5zq1l7hsnLgH1veVvb72E9mbnnvTfqFS41c1xEExhuYJwsOSWKIW
	 LVkKtidAvTyrg==
Message-ID: <0ff7a905-d8f2-401b-a0ff-47947d12ce05@collabora.com>
Date: Sun, 29 Oct 2023 23:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] dt-bindings: net: starfive,jh7110-dwmac: Drop
 redundant reset description
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
 <20231029042712.520010-4-cristian.ciocaltea@collabora.com>
 <ad023e4d-51d2-4fba-bf85-0c8ba358ab39@linaro.org>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <ad023e4d-51d2-4fba-bf85-0c8ba358ab39@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_142355_324573_0EA3FE24 
X-CRM114-Status: GOOD (  11.25  )
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

On 10/29/23 13:19, Krzysztof Kozlowski wrote:
> On 29/10/2023 05:27, Cristian Ciocaltea wrote:
>> The reset description items are already provided by the referenced
>> snps,dwmac.yaml schema, hence replace them with the necessary
>> {min,max}Items.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  .../devicetree/bindings/net/starfive,jh7110-dwmac.yaml       | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>> index cc3e1c6fc135..44e58755a5a2 100644
>> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>> @@ -46,9 +46,8 @@ properties:
>>      maxItems: 3
>>  
>>    resets:
>> -    items:
>> -      - description: MAC Reset signal.
>> -      - description: AHB Reset signal.
>> +    minItems: 2
>> +    maxItems: 2
> 
> You must also update reset-names. They must have same constraints.

reset-names explicitly lists the items and we need to keep them as such
because the order is not fixed, i.e. PATCH 1 allows using 'ahb' instead
of 'stmmaceth' as the first (and only) item.

        reset-names:
          items:
            - const: stmmaceth
            - const: ahb

Thanks,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
