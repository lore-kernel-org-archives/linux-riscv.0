Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266B7C64EC4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 01:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zfc2wQOrQa6AUzRUJzFoNR4dTVzx6ydIYXLCkc7ltR4=; b=JEMoFTSMssHNnG
	65zI1IcHuz97LZxplE6jrYk58I5NExR803DmAYT4DcHH1LegzppFenUVX7FB/n/5K5bSVUFzM5jJ0
	xWzstXBc09uxAfy/hLEhN7fIhXZMCaA+TweyMe7m96RlpRKAwCyin/qnaKKZZpYeRB8r53nlyRZYu
	//C1zPoBU0lA7OMSxATqeqrFYRUnHK4gmzs/zECrxDjTBQYluc7igU2Eq9vA8Fcl/LZeKRTUw/Ap9
	9tZ6tPQQ9U1aRIfy+bmbKXadRUt6jzxDhm0aZRwF5izBnW1zD2+kW3P6bclY0V5Z82oc3tlQznXL8
	dWBkN7WzcHxEa8a8v6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZMN9-00FlqJ-DG; Tue, 07 Mar 2023 01:44:11 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZMN3-00Flji-72
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 01:44:07 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id C2A8424E13A;
	Tue,  7 Mar 2023 09:43:13 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 09:43:13 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 09:43:13 +0800
Message-ID: <b650c07c-b19c-6e58-9b77-f55ee2ccd6f6@starfivetech.com>
Date: Tue, 7 Mar 2023 09:43:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 4/4] dt-bindings: syscon: Add StarFive syscon doc
To: Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	<linux-kernel@vger.kernel.org>
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-5-william.qiu@starfivetech.com>
 <41bcc545-6eda-6c30-c600-d97ef009abf2@linaro.org> <Y+4Fbrz8EYIGyjVj@wendy>
 <8388695b-98f9-223b-1e15-86aaefec2d6f@linaro.org> <ZAXzCfs7wkxaUWN7@wendy>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <ZAXzCfs7wkxaUWN7@wendy>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_174406_177321_5E0E63D4 
X-CRM114-Status: GOOD (  18.85  )
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



On 2023/3/6 22:04, Conor Dooley wrote:
> Hey William,
> 
> On Thu, Feb 16, 2023 at 11:31:45AM +0100, Krzysztof Kozlowski wrote:
>> On 16/02/2023 11:29, Conor Dooley wrote:
>> > On Thu, Feb 16, 2023 at 11:23:00AM +0100, Krzysztof Kozlowski wrote:
>> >> On 15/02/2023 12:32, William Qiu wrote:
>> >>> Add documentation to describe StarFive System Controller Registers.
>> >>>
>> >>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> >>> ---
>> >>
>> >> Thank you for your patch. There is something to discuss/improve.
> 
> Could you please submit a v5 of this, with the bits below fixed,
> whenever Hal sends their next version of the base dts series?
> There's no maintainers coverage for a soc/starfive subdirectory of
> dt-bindings yet, so please CC conor@kernel.org &
> linux-riscv@lists.infradead.com on the patch.
> 
> Thanks,
> Conor.
> 

I'll do it today.

Best regards
William
>> >>
>> >>> +properties:
>> >>> +  compatible:
>> >>> +    items:
>> >>> +      - enum:
>> >>> +          - starfive,jh7110-stg-syscon
>> >>> +          - starfive,jh7110-sys-syscon
>> >>> +          - starfive,jh7110-aon-syscon
>> >>
>> >> Maybe keep them ordered alphabetically?
>> >>
>> >>> +      - const: syscon
>> >>> +
>> >>> +  reg:
>> >>> +    maxItems: 1
>> >>> +
>> >>> +required:
>> >>> +  - compatible
>> >>> +  - reg
>> >>> +
>> >>> +additionalProperties: false
>> >>> +
>> >>> +examples:
>> >>> +  - |
>> >>> +    syscon@10240000 {
>> >>> +        compatible = "starfive,jh7110-stg-syscon", "syscon";
>> >>> +        reg = <0x10240000 0x1000>;
>> >>> +    };
>> >>
>> >> Keep only one example. All others are the same.
>> > 
>> > With these fixed:
>> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> > 
>> > @Krzysztof, I assume the location of the binding is okay with you since
>> > you didn't object to it & I suppose this one is up to me to apply if so.
>> 
>> Yeah, generic sysreg devices go to soc. If their primary functions were
>> different (e.g. clock controller which also is syscon), then they should
>> go to respective directories, but it's not the case here, I think.
>> 
>> Best regards,
>> Krzysztof
>> 
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
