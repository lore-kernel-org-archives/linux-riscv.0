Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53774C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 22:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdqjPJ0jVTH8bCUGG2/hmayXGINUqeKdEL4ukkV3nbY=; b=DczxxjWk2Z1iqF
	VvoQ8NpV0dcIQuNSBuwLrAMI41oFmomjvUVW2zPM6pmyWfZY20cadM1zGeK2Yb9M60PpyEMckOgR/
	hF9uTStZIOJnAie4azuxGQwG9SLBJtM6ry8nveJGrutzZI2EWt/XXFfsxaUKGflzU/umYBhSOlRUy
	MxjT/eF0XN1Xm+rzqs05aJ2fUO9eS2UlJ2mosgDk7t5ytIq6pe3fyZAsrvAvezzHsBLA9Z3lIr+gJ
	ofhjLGcGxSZBXhZXUWla4/2DmE79gOI0qGaJVLISfa+msalT1EF93uwn3JMdUwZq8nnxeiU7Vowat
	OskOC4u3K7y3wd8V1GQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxEDI-002Bq9-1F;
	Sun, 29 Oct 2023 22:24:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxEDF-002Bp3-14;
	Sun, 29 Oct 2023 22:24:54 +0000
Received: from [192.168.1.90] (unknown [188.24.143.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F5D166072BB;
	Sun, 29 Oct 2023 22:24:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698618289;
	bh=CceHk5gunNkmS5xqnTyMOvT/5Ea2c+1CgMjho/nsIsU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uh9alWGouQ7U6jJthpEGwuVHe+CmdXjzGtc0aY68TODT29nPU4vrPOt4UnOKnhPYl
	 1//sMVxcYVCTnIY8joZ85xDL5cS4E1Od5si2MlzQW7T2HNYzOWO1zppZstlFmSmt64
	 hwZphy/RqXi9zkJNfzKRY5Xkv3ZdDA+cFBmkeXg3DB2CiCzxqIISPfiVuM5+Qwh1wX
	 Rb7kDregtZwbcFKuaz0sppThi5rjy7iIrmURUp+uuFD1A4I6LDUwRLRsavbF2F73HP
	 B9/fO78eoxmE4ZROfBb5EqpUTR/hEDnPyv4jGOzlL1cHBPq8wpxAX8VYKWNnzMtLsH
	 SfX2djN/7cteA==
Message-ID: <05186c62-fcad-4d56-8ae8-d802f87a39e2@collabora.com>
Date: Mon, 30 Oct 2023 00:24:46 +0200
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
 <3016eff2-fce5-4b5e-bbb2-d56cbb45df85@linaro.org>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <3016eff2-fce5-4b5e-bbb2-d56cbb45df85@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_152453_501550_DF8DA249 
X-CRM114-Status: GOOD (  14.94  )
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

On 10/29/23 13:25, Krzysztof Kozlowski wrote:
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
> Also, this makes sense only with patch #4, so this should be squashed there.

I added this as a separate patch since it changes the generic schema
which is included by many other bindings.  JH7100 just happens to be the
first use-case requiring this update.  But I can squash the patch if
that's not a good enough reason to keep it separately.

Thanks,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
