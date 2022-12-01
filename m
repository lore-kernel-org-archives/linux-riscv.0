Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DBBC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 05:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mhbcKuHyJNg8nJtqIFMNZqFKGtkIQs1W548VbIxTRdQ=; b=TaHdtLvSAkdWEc
	xfkZ8VJ2FJKip/Y0PWOGo4K1bZPtUqvUdDqRQ0CNaohGBOlIm8xx8GYr83bIMn5D2RV6av12Niqws
	039ONoK/vCH98TfF3LqsjNyBs9BMYWX/9BpzjilG/O155y0OZHtdl+TV9aJzCNkk8UdZeRjAD4h74
	M28ecV0DdEjcqHjxpUNzGCIj1ZFLef3lAHjrKVJLgztw+69tc2shsEWqPs3cYzYATGYAv4cBl+k24
	iFOagTR92l+mAkdZBameeSptTkliBUvWmk9rz+BJ+/QxcmRB54lISGfKi60Dco/7YPSN0mkEfupVD
	AAI96PSSMfAeUQ4WK+tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0cUt-0051Kk-DK; Thu, 01 Dec 2022 05:52:35 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0cUq-0051EZ-1y
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 05:52:34 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 59DFC24E167;
	Thu,  1 Dec 2022 13:51:59 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 13:51:59 +0800
Received: from [192.168.125.96] (113.72.147.18) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 13:51:59 +0800
Message-ID: <da75445a-9bef-7f66-81b9-12c36ad19a37@starfivetech.com>
Date: Thu, 1 Dec 2022 13:51:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 2/4] dt-bindings: power: Add starfive,jh71xx-power
 bindings
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <20221118133216.17037-3-walker.chen@starfivetech.com>
 <99302e53-c0c9-cfe8-4e6a-c70e8428d9c3@linaro.org>
 <f21b0aa9-2ac8-ae28-755a-d530171f930a@starfivetech.com>
 <20221130152451.GA2192004-robh@kernel.org>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20221130152451.GA2192004-robh@kernel.org>
X-Originating-IP: [113.72.147.18]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_215232_271008_98EB9232 
X-CRM114-Status: GOOD (  14.89  )
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

On 2022/11/30 23:24, Rob Herring wrote:
> On Tue, Nov 22, 2022 at 09:22:03PM +0800, Walker Chen wrote:
>> On 2022/11/21 18:13, Krzysztof Kozlowski wrote:
>> > On 18/11/2022 14:32, Walker Chen wrote:
>> >> Add bindings for the power domain controller on the StarFive JH71XX SoC.
>> >> 
>> > 
>> > Subject: drop second, redundant "bindings".
>> 
>> Will fix.
>> 
>> > 
>> >> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> >> ---
>> >>  .../bindings/power/starfive,jh71xx-power.yaml | 46 +++++++++++++++++++
>> > 
>> > 1st patch should be squashed here. Headers are part of bindings file.
>> 
>> Will be done in the next version of patch.
>> 
>> > 
>> >>  1 file changed, 46 insertions(+)
>> >>  create mode 100644 Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml
>> >> 
>> >> diff --git a/Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml b/Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml
>> >> new file mode 100644
>> >> index 000000000000..2537303b4829
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml
>> > 
>> > Filename like compatible.
>> 
>> As mentioned in the previous email, the compatible in the driver should be changed to "starfive,jh7110-power".
> 
> Is the h/w block called 'power' or 'pmu'? Call it what the h/w is 
> called.

h/w block is called PMU, is the abbreviation of Power Management Unit.
It is more appropriate to change the compatile to 'starfive,jh7110-pmu'.

Best Regards,
Walker Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
