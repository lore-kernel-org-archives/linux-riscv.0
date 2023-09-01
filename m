Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7930ECA0FE2
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 02:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9yvICPD0uUS0bsYwZUEhJsi38b6d9YRNDmcV29K9yk=; b=I12KoSsyPVpvhS
	drpbd4aI9E41Ow+s4dTZQGNPMxAEVZXQ0Uh6NWA1mrcBCnG3ZgztpAGK/HpfkcCSPYhWdfjoMd5EM
	ATbAnnP+km48kltTpcGHb8YuNi3Qy+XOd+6S46vUiK6yiqrLztcF719VfYjHBxGWuY4CWK9DNiZsM
	BaLluM9qe8tmy1tWY1Itcm5c2Tw/lPdu7vk2UnyWmaUWOnyOR4xUQF5qe5zHjxjcoMwTl28voQlQu
	Mevw/cOtPGDE4LCnY5hrSmUVRunQJD1lQEfrpwLV3JyapY39x49zoAjw97z8qSZPGzjIRpm3r6L+p
	81gVGR2I5unKpuTLQ9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbtzU-00GL1f-2z;
	Fri, 01 Sep 2023 02:34:32 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbtzP-00GL0K-20
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 02:34:30 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BC58224E2E6;
	Fri,  1 Sep 2023 10:33:15 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 1 Sep
 2023 10:33:15 +0800
Received: from [192.168.120.76] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 1 Sep
 2023 10:33:14 +0800
Message-ID: <efab6f52-4d7f-ea3c-0fc3-4e3ad03c14c7@starfivetech.com>
Date: Fri, 1 Sep 2023 10:33:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Drop unused properties
To: Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-mmc@vger.kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230830031846.127957-1-william.qiu@starfivetech.com>
 <20230830031846.127957-2-william.qiu@starfivetech.com>
 <20230830-commence-trickery-40eaa193cb15@wendy>
 <b375b88c-0d9c-30a9-21f6-283083cf3880@linaro.org>
 <20230830-procedure-frostbite-56c751f7c276@wendy>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20230830-procedure-frostbite-56c751f7c276@wendy>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_193427_966381_00BF6D32 
X-CRM114-Status: GOOD (  18.62  )
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



On 2023/8/30 16:34, Conor Dooley wrote:
> On Wed, Aug 30, 2023 at 09:29:20AM +0200, Krzysztof Kozlowski wrote:
>> On 30/08/2023 08:50, Conor Dooley wrote:
>> > On Wed, Aug 30, 2023 at 11:18:44AM +0800, William Qiu wrote:
>> >> Due to the change of tuning implementation, it's no longer necessary to
>> >> use the "starfive,sysreg" property in dts, so drop the relevant
>> >> description in dt-bindings here.
>> > 
>> > How does changing your software implantation invalidate a description of
>> > the hardware?
>> > 
>> 
>> Which is kind of proof that this syscon was just to substitute
>> incomplete hardware description (e.g. missing clocks and phys). We
>> should have rejected it. Just like we should reject them in the future.
> 
> :s I dunno what to do with this... I'm inclined to say not to remove it
> from the binding or dts at all & only change the software.
> 
>> There are just few cases where syscon is reasonable. All others is just
>> laziness. It's not only starfivetech, of course. Several other
>> contributors do the same.
> 
> I'm not sure if laziness is fair, lack of understanding is usually more
> likely.

For this, I tend to keep it in binding, but remove it from required. Because
we only modify the tuning implementation, it doesn't mean that this property
need to be removed, it's just no longer be the required one.

Best Regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
