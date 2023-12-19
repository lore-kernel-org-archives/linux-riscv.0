Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD89C41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 12:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/iRgpxcGqXKheH+1OAv7hMrotuhOsSvb2o1LplPaec8=; b=l0vO8G0DPTSTG8
	yEyy67kZUzuAhPvGT3kxLR/lNuW5kRLEoB5XJEIrNe2Jx70M7JURcccMn7lgO0amr/woZCqzUJBUW
	Vy3MWPU6cPMlwWrMZ0TF4wxxzPDESyqsBZWlBzqJrLu+y9IlnMvRYpCLmeC8GnOZXyBOZbhXdMsGS
	CCatDvvY43shpgSJq79VsNKY2xjS/D9q3JLOPCwhjrLYda37mgmEoVpFShzdVZA/Dv5vuBLSt1Ie5
	uNwYXuIhQSbbHRSsgvQ0UQno0QGMUcP7PzxqPpR500qDnbsqoemO+f8Ze1eXc1BLYf0Lr/5yXF/0w
	uOqjEX1Eq7178GpHv+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZcv-00E5sU-0h;
	Tue, 19 Dec 2023 12:55:13 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZcr-00E5rF-1A;
	Tue, 19 Dec 2023 12:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702990505;
	bh=P2iu3HxAjX4PHABsZdyr9+nUD7MSsfRwCcOrLhUn4Ao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HsSQ14a8Oao/Bw4hc5xP3VFQeqS8z+Xf/8ztCqd9FI7N9PIIUPBt7yHeQTMIzE8T3
	 shsvDXE6yuPaQ1WIlX2QCBkAgV3NIu7epB/d7hxLzll/95KqDiB3HawZ/2PdMLdaVu
	 Gg5VuXCGTDBGvo7TndZWSL7X1AmETN8NDdmKPw0XguDWSRlf2HQWG5ZpH1+ZInUtzI
	 1y/EoYISuYl24Gj8PkDSa5jJy9R79AOlSEidb1HPnewwGMPdcrkVcGEL+n1lrcKYjf
	 M+06ad84c6vKqHwQ8Jaeza2AO2tCj7y+XH7x5/Wr+zrip+jLYtl/hUDemcFp5j/fWT
	 dQUlZEKpYXo+g==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BE3DF37813EB;
	Tue, 19 Dec 2023 12:55:03 +0000 (UTC)
Message-ID: <5b6d78a6-4515-41c2-b94d-5c7df12dbb2d@collabora.com>
Date: Tue, 19 Dec 2023 14:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: net: starfive,jh7110-dwmac: Drop
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
 <20231218214451.2345691-2-cristian.ciocaltea@collabora.com>
 <92eb5f85-1241-429c-aca9-7a6a17f19ae5@linaro.org>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <92eb5f85-1241-429c-aca9-7a6a17f19ae5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_045509_529128_326634E1 
X-CRM114-Status: GOOD (  10.45  )
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

On 12/19/23 09:24, Krzysztof Kozlowski wrote:
> On 18/12/2023 22:44, Cristian Ciocaltea wrote:
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
>> index 5e7cfbbebce6..d90cb82c1424 100644
>> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>> @@ -55,9 +55,8 @@ properties:
>>      maxItems: 3
>>  
>>    resets:
>> -    items:
>> -      - description: MAC Reset signal.
>> -      - description: AHB Reset signal.
>> +    minItems: 2
>> +    maxItems: 2
> 
> Why changing only resets, but not reset-names?

Already answered in [1], but also discussed in the context of the 
next patch.

Thanks,
Cristian

[1]: https://lore.kernel.org/lkml/0ff7a905-d8f2-401b-a0ff-47947d12ce05@collabora.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
