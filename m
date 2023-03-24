Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F192C76195
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 07:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqAx+8im8V3u6dy1jYQGhJ+/c8AqW9Y5ddQls1PmZBw=; b=o4Rh3MESejg45R
	lk33raqJcjRRCPt4QTYJ6A9cJF77FVM1fsuJnjiRX44aLYpM+feZv+uoGMAjnCQq/rKhL7TvajfT1
	+20FTnSKo9VRgpTual5RZK2X49a427z0sYYIEEh8F0Naj2/6IjDTrJScpAin+T+4R5dLZDPf7u/T7
	iFV9C0YTKIkOv4RGrbYutXTB6nEYU9YplG0trTTC7r/djH0lu7u0nUsdm4WcY3fsgq70Lilva2ddQ
	0gGz1SguE94x2zXvSzs7Wm1gBBgO7kkPzQVlq4jo9eMQUOdCGgGvzqrKSQpb1IFr++a2h4ddaxIZf
	SJhwDwFVu4Y1Ik4mVzgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfbT7-003iio-1u;
	Fri, 24 Mar 2023 07:04:09 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfbT3-003ihc-1H
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 07:04:07 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4220624E1E2;
	Fri, 24 Mar 2023 15:03:42 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Mar
 2023 15:03:42 +0800
Received: from [192.168.125.74] (113.72.145.117) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Mar
 2023 15:03:41 +0800
Message-ID: <0c9c19ad-815c-fb0f-3024-96ea55e7c6c0@starfivetech.com>
Date: Fri, 24 Mar 2023 15:03:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v6 19/21] riscv: dts: starfive: Add initial StarFive
 JH7110 device tree
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
References: <20230320103750.60295-1-hal.feng@starfivetech.com>
 <20230320103750.60295-20-hal.feng@starfivetech.com>
 <60359574-8bce-40f2-99db-6d81f6e6c5c3@spud>
 <6ce5b897-f1c2-4b58-9353-9d9e881ad237@spud>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <6ce5b897-f1c2-4b58-9353-9d9e881ad237@spud>
X-Originating-IP: [113.72.145.117]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_000405_787190_FF530E82 
X-CRM114-Status: GOOD (  16.48  )
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

On Thu, 23 Mar 2023 09:03:23 +0000, Conor Dooley wrote:
> On Wed, Mar 22, 2023 at 10:02:40PM +0000, Conor Dooley wrote:
>> On Mon, Mar 20, 2023 at 06:37:48PM +0800, Hal Feng wrote:
>> > From: Emil Renner Berthing <kernel@esmil.dk>
>> > 
>> > Add initial device tree for the JH7110 RISC-V SoC by StarFive
>> > Technology Ltd.
>> > 
>> > Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
>> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> > Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> > Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
>> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> > ---
>> 
>> > +		S7_0: cpu@0 {
>> > +			compatible = "sifive,s7", "riscv";
>> > +			reg = <0>;
>> > +			d-cache-block-size = <64>;
>> > +			d-cache-sets = <64>;
>> > +			d-cache-size = <8192>;
>> > +			d-tlb-sets = <1>;
>> > +			d-tlb-size = <40>;
>> > +			device_type = "cpu";
>> > +			i-cache-block-size = <64>;
>> > +			i-cache-sets = <64>;
>> > +			i-cache-size = <16384>;
>> > +			i-tlb-sets = <1>;
>> > +			i-tlb-size = <40>;
>> > +			mmu-type = "riscv,sv39";
>> > +			next-level-cache = <&ccache>;
>> > +			riscv,isa = "rv64imac_zba_zbb";
>> > +			tlb-split;
>> > +			status = "disabled";
>> 
>> Jess pointed out on IRC that this S7 entry looks wrong as it is claiming
>> that the S7 has an mmu. I didn't go looking back in the history of
>> u74-mc core complex manuals, but the latest version does not show an mmu
>> for the S7.
> 
> BTW Hal, if the dt-binding stuff is okay with Emil, I can just remove
> the mmu here if you confirm it is a mistake rather than you needing to
> resubmit to remove it.

I confirm that the S7 core has no L1 data cache and MMU, so some properties
should be deleted. I have submitted a new patch for the correction.

https://lore.kernel.org/all/20230324064651.84670-1-hal.feng@starfivetech.com/

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
