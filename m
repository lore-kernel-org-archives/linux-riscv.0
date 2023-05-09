Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1293C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 06:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+20uQJBQsMFhWDBvKjSu9KXAT4qpXn7gBnqica+j4rk=; b=B3Jjkc6uGXFAL8
	ICrRzE8AaFtXpSHM3bTBj0nk9sKZG3yneLBjFQI74lGBiUUDMfKojAvYgatBeMDo+SRN5EL6jBcrn
	TCH088zEPvgSNaIQHUZxzRcTvnWiW9vfEeUwj+LFAmKMR9+5Ryss82nPX++pXWzADIsmqoSrxfpQ0
	5ENukBfYUqPIVMdvGjBUcBZtbrqnoHnyNY0BuUKwg1YKAmEuN4qWCRpz9GnZBGghdHOFTZWy6fdoV
	WzvlI7zDQhMAON21PAyqnR1D3kgWQ9Do1ySoei19qJ1JKdT3RY1HExXRtrF4yS+ushBGDVQzkTun+
	YvGaHFiGWPBQhi6rV2PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwGnC-002P5I-2w;
	Tue, 09 May 2023 06:25:46 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwGn8-002Ozp-15
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 06:25:45 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 3293724DB84;
	Tue,  9 May 2023 14:24:46 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 9 May
 2023 14:24:46 +0800
Received: from [192.168.125.131] (183.27.98.219) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 9 May
 2023 14:24:44 +0800
Message-ID: <014dd7b2-9623-805c-97a6-5b3c5f120b79@starfivetech.com>
Date: Tue, 9 May 2023 14:23:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230414024157.53203-1-xingyu.wu@starfivetech.com>
 <20230414024157.53203-6-xingyu.wu@starfivetech.com>
 <20230424-footsie-compost-d6624c8ef4e8@spud>
 <20230508-margarita-fondling-c9b970ad73a9@spud>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20230508-margarita-fondling-c9b970ad73a9@spud>
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_232542_679590_0E59D6D0 
X-CRM114-Status: GOOD (  23.67  )
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

On 2023/5/9 3:24, Conor Dooley wrote:
> On Mon, Apr 24, 2023 at 06:15:47PM +0100, Conor Dooley wrote:
>> On Fri, Apr 14, 2023 at 10:41:55AM +0800, Xingyu Wu wrote:
>> > From: William Qiu <william.qiu@starfivetech.com>
>> > 
>> > Add documentation to describe StarFive System Controller Registers.
>> > 
>> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> > ---
>> >  .../soc/starfive/starfive,jh7110-syscon.yaml  | 58 +++++++++++++++++++
>> >  MAINTAINERS                                   |  6 ++
>> >  2 files changed, 64 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> > 
>> > diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> > new file mode 100644
>> > index 000000000000..de086e74a229
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> > @@ -0,0 +1,58 @@
>> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> > +%YAML 1.2
>> > +---
>> > +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#
>> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> > +
>> > +title: StarFive JH7110 SoC system controller
>> > +
>> > +maintainers:
>> > +  - William Qiu <william.qiu@starfivetech.com>
>> > +
>> > +description: |
>> > +  The StarFive JH7110 SoC system controller provides register information such
>> > +  as offset, mask and shift to configure related modules such as MMC and PCIe.
>> > +
>> > +properties:
>> > +  compatible:
>> > +    oneOf:
>> > +      - items:
>> > +          - enum:
>> > +              - starfive,jh7110-aon-syscon
>> > +              - starfive,jh7110-sys-syscon
>> > +          - const: syscon
>> > +          - const: simple-mfd
>> > +      - items:
>> > +          - const: starfive,jh7110-stg-syscon
>> > +          - const: syscon
>> > +
>> > +  reg:
>> > +    maxItems: 1
>> > +
>> > +  clock-controller:
>> > +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
>> > +    type: object
>> > +
>> > +  power-controller:
>> > +    $ref: /schemas/power/starfive,jh7110-pmu.yaml#
>> > +    type: object
>> 
>> My plan was to grab this patch after the merge window, but there's been
>> some back and forth [1] about what exactly should be a power-controller
>> here. Given the merge window is open & I know Emil wants to look at the
>> various clock bits for the JH7110, I don't think there's a pressing need
>> for you to do anything here, but figured I'd at least mention how things
>> are going on this thread too.
> 
> To follow up on this, it transpired in that thread that this node, not a
> child node, should be the power controller.
> 
> Up to you StarFive folk how you wish to resend, but I am fine with it
> being in this series, I shall just not pick up the soc driver patches
> until the resent binding is applied by Stephen.
> 

Thanks. I had discussed with changhuang.liang about this. And I will drop
the 'starfive,jh7110-aon-syscon' and 'power-controller' in next patchset.
Changhuang will take these in his patchset.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
