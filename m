Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B44C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 21:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Dia7AiJYp0RNIHwUr/KJe8ccbmTfSq+rTrvx5FO5io=; b=pV2qHCKDcZy9Qe
	DHsT4q7xA6hIKxwJVQ+5KapHJ5wUYTwPaM8YVCW43fS9YeIa/j0mP2KcyDylohOhZG+jKOYg5AR6G
	+sdUgfv+Amdt4iZPrEve1luyWgupkFVevmpGR03CWyGy1TkhoX7SjscBQ6QtlwLC5Y0MdDM95OyOn
	6B8JyI0V0g8ahMddxFk0WC38a5n5gwpCCXya9Tss28YrLExmLh84zRf9ToWFC+Bbpkq7rLHD7AkfO
	l8yMlCRmCOvj3DSLZuDKZBc/4LSc3v1kqzwsmACSg66DSTfGheR3Cw+wGrIWcmCDqvwR/VxS0bQTT
	zPLptLuzPr+AkUWDAzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxD1M-0027Td-0a;
	Sun, 29 Oct 2023 21:08:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxD1H-0027TA-1E;
	Sun, 29 Oct 2023 21:08:29 +0000
Received: from [192.168.1.90] (unknown [188.24.143.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DF7DD66072BB;
	Sun, 29 Oct 2023 21:08:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698613702;
	bh=GoWKvXVCI2rJHZaaMlrQGK5PE/qto64zo6wfdhb04jw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dT0wlb9v/BSZdRvWw2CB4dPGTr65xipwdJ1ig9xIKIAkNUTEUjjERuC4H1MnIlY7L
	 YHVqnak1wmwv0EXm0xnTWi6h/oWfJWDY9vPtUIdO/y35OgL539uSZKuLgBtMtu9rTk
	 4cVIDn1O4skrL+tY/cy51u/S7uRJicQ3YklzkLXhl/E4nYfPvmEK70+ZlVyidteCH2
	 JVAbU2ipAXoL76QnyMj1A+SF3e/bwJXaouX2NNzCnpSd7zCjZGoNEaJ/T62NU5EvA/
	 5WI6l6YnPrfxwo3Y8GIsGmZhcTKDsddwcdCeFdiFLUzhh8y8MSrAunK7jm3x1cVhQU
	 AyaCOohAvr+6A==
Message-ID: <77ea127f-1040-489c-8ee3-d27df16fb995@collabora.com>
Date: Sun, 29 Oct 2023 23:08:18 +0200
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
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <9c9120d6-dd28-4b6d-be8d-46c0cab8f26a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_140827_589910_68433D51 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

On 10/29/23 13:18, Krzysztof Kozlowski wrote:
> On 29/10/2023 05:27, Cristian Ciocaltea wrote:
>> The usage of 'select' doesn't seem to have any influence on how this
>> binding schema is applied to the nodes, hence remove it.
>>
> 
> It has. Why do you think it doesn't? You should see new errors from
> dwmac schema.

This patch came as a result of testing both variants (w/ and w/o
'select') with several different compatible strings and seeing
consistent output:

- "starfive,jh7110-dwmac", "invalid";
- "starfive,jh7110-dwmac";
- "invalid", "snps,dwmac-5.20";
- "invalid"

Did I miss something?

Thanks for the review,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
