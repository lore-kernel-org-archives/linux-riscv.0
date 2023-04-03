Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA38C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 12:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9nkZjjAB9EzHrfbU7QZ72EBjVSOy4XPAmcNk/nGvdU=; b=apWFOFqJaMCbA4
	j4kyAOZmJrnTI8lrrQ0J5jIWEYfVX7VmmAA4DJy+nSEP/7isBRBfTAb4ZTtm+7dF8SUr5qc77qbzz
	0y+GP2Veh3aVwqiAsF69Q7s28HgxlxFDiAlTYzRiaw3+GTrbrB1LxFcT+IDUovEB5xjDjo+63w1VC
	vzpBiMadjhtigJ61xjPps+QEquIToqObYhlaW73mV3wXq1rA+ggk/zrfAI68hKf3QxFDz+ROtr1Lz
	+x5kkQChSF9rEf6iLQPzuvPY+KCWGaMlUOHqXpWiNIkog3Dn5DQSauhQuFTdUe/ZzII+yc3FHl07z
	Ai4AY/OqGuTTst+ly/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJ8R-00FF9J-1y;
	Mon, 03 Apr 2023 12:18:07 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJ8O-00FF7X-2z
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 12:18:06 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4C03824DFFD;
	Mon,  3 Apr 2023 20:17:41 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 20:17:41 +0800
Received: from [192.168.125.145] (183.27.97.179) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 20:17:40 +0800
Message-ID: <670fbeaf-334b-b6d7-d48c-0828c5f1d841@starfivetech.com>
Date: Mon, 3 Apr 2023 20:17:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 1/3] dt-bindings: sound: Add TDM for StarFive JH7110
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230329153320.31390-1-walker.chen@starfivetech.com>
 <20230329153320.31390-2-walker.chen@starfivetech.com>
 <c999da90-1cb9-c767-23bc-c28d37708cf2@linaro.org>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <c999da90-1cb9-c767-23bc-c28d37708cf2@linaro.org>
X-Originating-IP: [183.27.97.179]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_051805_124293_C4E8DD77 
X-CRM114-Status: GOOD (  12.47  )
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



On 2023/3/30 15:39, Krzysztof Kozlowski wrote:
> On 29/03/2023 17:33, Walker Chen wrote:
>> Add bindings to describe the TDM driver for the StarFive JH7110 SoC.
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../bindings/sound/starfive,jh7110-tdm.yaml   | 95 +++++++++++++++++++
>>  1 file changed, 95 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml b/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
>> new file mode 100644
>> index 000000000000..d65b9ed781ef
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
>> @@ -0,0 +1,95 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/starfive,jh7110-tdm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 TDM Controller
>> +
>> +description: |
>> +  The TDM Controller is a Time Division Multiplexed audio interface
>> +  integrated in StarFive JH7110 SoC, allowing up to 8 channels of
>> +  audio over a serial interface. The TDM controller can operate both
>> +  in master and slave mode.
>> +
>> +maintainers:
>> +  - Walker Chen <walker.chen@starfivetech.com>
>> +
> 
> Missing allOf: with $ref to dai-common.

Indeed missing allOf, thank you for kind reminding.

> 
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - starfive,jh7110-tdm
>> +
>> +  reg:
>> +    maxItems: 1
> 
> (...)
> 
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - dmas
>> +  - dma-names
>> +  - "#sound-dai-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    tdm: tdm@10090000 {
> 
> Drop tdm label, not used.

Ok, will drop it.

Best regards,
Walker



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
