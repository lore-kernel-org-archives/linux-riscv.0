Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E18C05027
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 00:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTwBNaO8tb475/+c3NlstUn5L38mIHyfyJkg3lAa17I=; b=1yAFixd50hZZgN
	05VSUFzYZWIwTqYnkZyFVUwCrXkxtt7+/aCmDlWGxg5u69tDfeEieRU0sg8vSmn9xKjVITUgb/VDy
	iVH89o7aSJXx3rZ3ctSYvOPNYkVTsndf08dP5mOsAMMqSo93iHCBkHpz5OSPF90mxIPCge8s0CEIT
	0BduJQ8Jb7QpW0jlQExAc3JLG3+cj+fhVv/7q0lSrbm/mp5Ef+ho1DUFc+g9tk+V/lMar8+lFX4mA
	E2dLWuTNB9hKsvCwYHbeYXbbFiAcEBp/oWtrgHKLl5D/PhqbsGEsdRkuCSzN9MG1sT5L/c3z9C1AA
	IdJXd0olrclgSfnzmITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5ku-0044Qh-Ai; Wed, 15 Feb 2023 00:34:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5kk-0044O5-Fh; Wed, 15 Feb 2023 00:34:31 +0000
Received: from [192.168.1.90] (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 402C0660217D;
	Wed, 15 Feb 2023 00:34:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676421268;
	bh=GPRpB7l0KFvDAe90l47jGxlxu/5Kcdt9J/hi24/5C7w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KGwXRBM+CqsY8WuVEfFGb/3XE6k5Po4N/V7S5ZYtvlN9vFIQGjvcSa80xB+QIKeNu
	 nLP/oA1H5uIjgN/mRBN1QDxHG+RER1Q/j6jnvPPM6DdDMLZN8ieUtg3ARbQ8XGAKdQ
	 DuYxDMbfPlM5EsnNFnlIWZ7oQ4xKlwvvcxGsbJWrclFzyrD/zP7icr+xtrhCCBnY/A
	 Mi+ycV2kn42zsBBiGOr9OvgoXz6x2i0TQIfF0KdM4BO7RRYVK52qEsvnin9rSNKyn7
	 iXTQk09k1+rOU5CDn28q1vB64m62J9RTYcCCVFOLohT2yv+B+1K8P/TjbJktfwRRYX
	 B5LfeJ39Hm8Ow==
Message-ID: <586971af-2d78-456d-a605-6c7b2aefda91@collabora.com>
Date: Wed, 15 Feb 2023 02:34:23 +0200
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
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <Y+e74UIV/Td91lKB@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_163430_682119_A567840A 
X-CRM114-Status: GOOD (  13.31  )
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

On 2/11/23 18:01, Andrew Lunn wrote:
>> +  starfive,gtxclk-dlychain:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: GTX clock delay chain setting
> 
> Please could you add more details to this. Is this controlling the
> RGMII delays? 0ns or 2ns?

This is what gets written to JH7100_SYSMAIN_REGISTER49 and it's 
currently set to 4 in patch 12/12. As already mentioned, I don't have 
the register information in the datasheet, but I'll update this as soon 
as we get some details.

>> +    gmac: ethernet@10020000 {
>> +      compatible = "starfive,jh7100-dwmac", "snps,dwmac";
>> +      reg = <0x0 0x10020000 0x0 0x10000>;
>> +      clocks = <&clkgen JH7100_CLK_GMAC_ROOT_DIV>,
>> +               <&clkgen JH7100_CLK_GMAC_AHB>,
>> +               <&clkgen JH7100_CLK_GMAC_PTP_REF>,
>> +               <&clkgen JH7100_CLK_GMAC_GTX>,
>> +               <&clkgen JH7100_CLK_GMAC_TX_INV>;
>> +      clock-names = "stmmaceth", "pclk", "ptp_ref", "gtxc", "tx";
>> +      resets = <&rstgen JH7100_RSTN_GMAC_AHB>;
>> +      reset-names = "ahb";
>> +      interrupts = <6>, <7>;
>> +      interrupt-names = "macirq", "eth_wake_irq";
>> +      max-frame-size = <9000>;
>> +      phy-mode = "rgmii-txid";
> 
> This is unusual. Does your board have a really long RX clock line to
> insert the 2ns delay needed on the RX side?

Just tested with "rgmii" and didn't notice any issues. If I'm not 
missing anything, I'll do the change in the next revision.

>         Andrew

Thanks,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
