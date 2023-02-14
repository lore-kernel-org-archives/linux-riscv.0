Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6840C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 17:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofmMJSktcfsalFku0ngY5rU1tRT3QHqc9Z92bNkweDM=; b=kj21KAe3cybLa5
	ugRim0fcvsbEaeJDO5+B/6SrPorxea7IjOjfrqNYySSpOX7bj3sFLrjzoa90b1dNWwPn46WLWiBlu
	fHHctBkb3MixEwrO93J4xQlgC5ayfatLZQt1B2MM/v2pOujmkpbWm5PteGgDbfcx7icuzcOp3V/72
	QCGKaBq7MSLlkielZCjCsSycREANVVRD/4buk1Gy/N8hjQMlOG9JRYZGKFsoZIU+R4U6yxR0wPqG5
	c373leOAxSEUHVAFJGW7q21Q3EYN8wR6k1FXDUqdx0FY+De6hyutuwr2Jg6ew8K9B7T1pSPzBYzYO
	0OyiDaWJ+DdzhnjMHspw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRzZd-0034dc-CO; Tue, 14 Feb 2023 17:58:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRzZS-0034af-JR; Tue, 14 Feb 2023 17:58:28 +0000
Received: from [192.168.1.90] (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A0E866020A4;
	Tue, 14 Feb 2023 17:58:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676397501;
	bh=Y4hHrvH1B5sqY1by0xSyqs58y8vsVlrsUYCjBXVOzgQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rgmm1hRkkv36vX6S4kwZIjU9y/lgmTGeV1Ia4edMQzQc5k1JaZ8iGWswYiuLBwi9Q
	 2uK87DtWhOESGqcYttatohf6TdFHjHCqmroabZKzcKSZZjXHXeIVL7gpG0KEEUN0kp
	 RtFBlMdQYBo434oxLBE1oz9KusXyFiOHVzBJXqc9lVWBYGJrsh28lgG6PdFHhbzej+
	 d8ILeq6tvjsKxNTqduLQD83xIa6iQQr/O3N3oobNAqdQJl9hrjQuSfCj2kDCnClnaH
	 YRt2b1788WywrxWnTLmmsJ8ZIK+ImFPwx+8FUQwuNyvJMaM1FrR9iAB6rfnpusp7NT
	 DFVnRoNAD2Mww==
Message-ID: <bed5244c-fcb5-1f95-9ff8-81c3a96ecff9@collabora.com>
Date: Tue, 14 Feb 2023 19:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 02/12] dt-bindings: riscv: sifive-ccache: Add
 'uncached-offset' property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
 Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-3-cristian.ciocaltea@collabora.com>
 <c895f199-2902-4c22-2453-829d946a8d11@linaro.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <c895f199-2902-4c22-2453-829d946a8d11@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_095826_821412_81C150E3 
X-CRM114-Status: GOOD (  10.07  )
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

On 2/13/23 11:23, Krzysztof Kozlowski wrote:
> On 11/02/2023 04:18, Cristian Ciocaltea wrote:
>> Add the 'uncached-offset' property to be used for specifying the
>> uncached memory offset required for handling non-coherent DMA
>> transactions.
> 
> Only one offset can be non-coherent? If this is for DMA, why
> dma-noncoherent cannot be used?

As Conor already mentioned in [1], the handling of non-coherent DMA on 
RISC-V is currently being worked on, so I expect this patch will be dropped.

[1] https://lore.kernel.org/lkml/Y+d36nz0xdfXmDI1@spud/

Thanks for reviewing,
Cristian

> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
