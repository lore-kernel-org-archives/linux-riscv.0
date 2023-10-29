Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DCFC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 21:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2uoJBui9UBMPfMklgMyCk+2u2XwrlJW/CmdrNVt9NE=; b=f+X4AnZv3HlDg+
	Ka21PwFVAtlJVe4OslPiSiWGL+S8FL2f0HSVPlv+FDuPi2Q6i66LerFRlrIAKSq2ftJDpNTV3Rw+t
	AH/qgvEL72J/YZF6f4dd3gKEmMbonlgttKp/5EOHYKUBtVha00r1b9BTkbicEbJjqIewRiEFF4wmT
	naFRY/mb0zILwHkPL+zGVW4SF7XcT9whmJDEx4Gcc3eniKke0j07XYk82FN0HSbamIUvgmqYAo9z7
	rNPF+e0KpkBvQSfZI/dmx75AH9QTTuA5Pp6cFoYg0zBMNLgyWgWdcTNhPFXBJEbu500IvRZIucvAM
	eG1Zsn36Iwsv65d00YQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxDlS-002ALY-2r;
	Sun, 29 Oct 2023 21:56:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxDlL-002AL4-39;
	Sun, 29 Oct 2023 21:56:07 +0000
Received: from [192.168.1.90] (unknown [188.24.143.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EB42466072BB;
	Sun, 29 Oct 2023 21:56:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698616562;
	bh=9kXCuQh63U4MYAws1gRK8ESi0SHsl74/OxpK1M4Qxbg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KerkcdZsbuCGKGZ+GY+q3ScfNhttqTmD8XJ7fkwIciBDGHh7a0kQ6VPXsCFAZfuYr
	 KslM2+6J2wgomTQz5lPrdI8jjnfOXA6HFRZfnNnqe2U+Jv1rlKB1VlsxaNRKw5O4KL
	 DPGW9AHWr/DXBXXOVD4nGISz3YSorQMOeQMZ9PIli0bVDTLw/FRWIZISe81sYBMNmX
	 Bi5uA1gIH02uMhTCayLd1Ubk9h6JE+Otm7S0xsCcpYTGEmHeC2DXe1d85RkZeHi8K7
	 3LTYyzbGDXKbJTlKYTI3rI5doK6srRiMaBEIYFzy+xz5XXBtYZcLr6jiUUAyNY1mtI
	 NP6BQ4qOxSzJA==
Message-ID: <564503dd-b779-4e9f-851d-f34d9ea5fa65@collabora.com>
Date: Sun, 29 Oct 2023 23:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: net: snps,dwmac: Allow exclusive
 usage of ahb reset
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
 <20231029042712.520010-2-cristian.ciocaltea@collabora.com>
 <e2c65d01-3498-4287-a6dc-b926135df762@linaro.org>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <e2c65d01-3498-4287-a6dc-b926135df762@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_145604_206892_E3A5FDBC 
X-CRM114-Status: GOOD (  13.70  )
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

On 10/29/23 13:21, Krzysztof Kozlowski wrote:
> On 29/10/2023 05:27, Cristian Ciocaltea wrote:
>> The Synopsys DesignWare MAC found on the StarFive JH7100 SoC requires
>> just the 'ahb' reset name, but the binding allows selecting it only in
>> conjunction with 'stmmaceth'.
>>
>> Fix the issue by permitting exclusive usage of the 'ahb' reset name.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> index 5c2769dc689a..a4d7172ea701 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -146,7 +146,7 @@ properties:
>>    reset-names:
>>      minItems: 1
>>      items:
>> -      - const: stmmaceth
>> +      - enum: [stmmaceth, ahb]
> 
> Your patch #3 says you have minimum two items. Here you claim you have
> only one reset. It's confusing.

At least the following use-cases need to be supported:

- JH7110: reset-names = "stmmaceth", "ahb";
- JH7110: reset-names = "ahb";
- other:  reset-names = "stmmaceth";

Since this is the schema which gets included later in other bindings,
the property needs to be generic enough to cope with all the above.
[added actual content here for more clarity]

  reset-names:
    minItems: 1
    items:
      - enum: [stmmaceth, ahb]
      - const: ahb

Therefore, only the lower limit (1) is enforced here, while
starfive,jh7110-dwmac.yaml (which PATCH 3 relates to) adds further
constraints (limiting to precisely two items):

    reset-names:
      items:
        - const: stmmaceth
        - const: ahb

I understand the generic binding also allows now specifying 'ahb' twice,
but I'm not sure if there's a convenient way to avoid that (e.g. without
complicating excessively the schema).

Thanks,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
