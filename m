Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397F5C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 19:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBteJwEJLzy4bB2z75xaNL/UP6xGbfhoIXJ2fIClvBE=; b=BypWFvos+cqjkm
	C5+syZ9z0mXhy3NNLKsg4P8MDy6J+zSqyhRBpkxC7gqKiQWL30SYpu1F7BdOYsp1ykwuRTDsbT3zT
	kKxCI30G263e7y78osb5WCFL1EEI7nCQiaTk5VcKsX+vl9EM6DWJmUhZeCji04SZ3hvFn63BBxkJn
	fvt14wIIZKeX+u90DpICY9/17HdMx+Q9pVh8errmsfQA0ICk9K+J83ETKeuy2aT2nXB0QF3zf25vw
	wSfoLy5wWITCMs1rcn/ukPg21S27h/HI++nawmRTWGtt/tniMUbr7iTCtVN5VmcssT7zZwa6Dn705
	jHoumJrw6/wjq2YHWoVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxXtS-003vD0-0C;
	Mon, 30 Oct 2023 19:25:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxXtO-003vCH-0W;
	Mon, 30 Oct 2023 19:25:43 +0000
Received: from [192.168.1.90] (unknown [188.24.143.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4741D6607391;
	Mon, 30 Oct 2023 19:25:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698693938;
	bh=6na0ZR9aRO2R+DcqR2Kg6XuMNOs2U7/usUJoSt63Jgo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LmtduLEBohoIBG17lrvwaFniYQs/4Q5D32PuptdSL5aD2RAX16HbMTi+8EipJ+IQC
	 Pzftnslukemi/OoXAbwqDIgklKwAqidK7OXx/Ro1P8Vv1sUl7Te6vHnz+CObirBhrS
	 4m29csR86buGnD8lU5+3qgV/0Eg4XBkgpfuspHu21ocwhtpmftwBrpyQNA6xFJD89G
	 OIa1Bxluoq/aIC6QzFqKx/u5U0xGhMpUC+iKjDGGUvXlhCcTbhE7qrldVA0j2pumUZ
	 Lj5hczfNdPAYj+lW3amRKLQ6ce8584wbGU7BUWxHvzmzhAkzNiUaId7bsEd/rdtICZ
	 1fOk7dLUtWHiQ==
Message-ID: <e70fda8c-a924-44ab-be76-292f315b852a@collabora.com>
Date: Mon, 30 Oct 2023 21:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] dt-bindings: net: starfive,jh7110-dwmac: Drop
 superfluous select
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
 <20231029042712.520010-3-cristian.ciocaltea@collabora.com>
 <9c9120d6-dd28-4b6d-be8d-46c0cab8f26a@linaro.org>
 <77ea127f-1040-489c-8ee3-d27df16fb995@collabora.com>
 <6b91a6df-4549-4ca8-9659-c6107f4f8c75@linaro.org>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <6b91a6df-4549-4ca8-9659-c6107f4f8c75@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_122542_336687_58D6FD17 
X-CRM114-Status: GOOD (  10.61  )
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

On 10/30/23 09:27, Krzysztof Kozlowski wrote:
> On 29/10/2023 22:08, Cristian Ciocaltea wrote:
>> On 10/29/23 13:18, Krzysztof Kozlowski wrote:
>>> On 29/10/2023 05:27, Cristian Ciocaltea wrote:
>>>> The usage of 'select' doesn't seem to have any influence on how this
>>>> binding schema is applied to the nodes, hence remove it.
>>>>
>>>
>>> It has. Why do you think it doesn't? You should see new errors from
>>> dwmac schema.
>>
>> This patch came as a result of testing both variants (w/ and w/o
>> 'select') with several different compatible strings and seeing
>> consistent output:
>>
>> - "starfive,jh7110-dwmac", "invalid";
>> - "starfive,jh7110-dwmac";
>> - "invalid", "snps,dwmac-5.20";
>> - "invalid"
>>
>> Did I miss something?
> 
> Testing all bindings? The select is there to prevent matching unrelated
> bindings.

Indeed, my bad, as I've been using DT_SCHEMA_FILES to restrict the scope
during initial testing and missed to include later other schemas for an
extended validation (note that since [1] it's possible to specify a list
of file paths separated by ':').

Will drop this in v3.

[1] 25eba1598c8e ("dt-bindings: Fix multi pattern support in
DT_SCHEMA_FILES")

Thanks,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
