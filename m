Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD7CC76196
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 02:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73KQGTJoe5aK0Ur0tfRnRKWdCLoRo1Eh7datVQxcmS8=; b=2uT8IL/Fx65Kdq
	ziSd6FBZD5a/Pt74fZtMsldr7uAXz2HEqQJQoTVQH+234YRmzzGCO0+PVZdsPwaXXC410Otv9cIwA
	M5lkA7v8pQt0sgdgPEbi9YN+GPFs/ZmFKc2mOM2CwUCpdnu3XSMRHBt6xVkQgp0wtUe35llLmFMvf
	g559Z1+L9/VZ4lZmx4wY3BOtBd4/4eTtOvSifKGQu2vSWad2LtmO7nf8WqeVuozMQsZ0TT8E0a34O
	Z4AD6AfR/Fbol9L4SOfjK6G3gRWRtqv1UG3zZzgU7hRgKyB6so9u5OontC6/U+FR0XfdR7hNrU8RO
	8EP5KywiI6FEKennHszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmPzM-001b9Q-0x;
	Wed, 12 Apr 2023 02:13:36 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmPzJ-001b6s-1R
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 02:13:35 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 6CE4324E053;
	Wed, 12 Apr 2023 10:12:46 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 10:12:46 +0800
Received: from [192.168.125.87] (113.72.145.176) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 10:12:45 +0800
Message-ID: <91855baa-88cb-96b1-d571-4881ea6d24c8@starfivetech.com>
Date: Wed, 12 Apr 2023 10:12:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 00/22] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
To: Conor Dooley <conor@kernel.org>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>,
	Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "Marc
 Zyngier" <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20230401111934.130844-1-hal.feng@starfivetech.com>
 <20230405-wharf-rejoin-5222e5958611@spud>
 <ce311dcf-67a5-bf15-d0da-88967baf4ee9@starfivetech.com>
 <20230411-gleaming-parasail-34e2b7c3de2e@spud>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230411-gleaming-parasail-34e2b7c3de2e@spud>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_191333_803794_CBC05CB5 
X-CRM114-Status: GOOD (  11.04  )
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

On Tue, 11 Apr 2023 22:35:04 +0100, Conor Dooley wrote:
> On Thu, Apr 06, 2023 at 03:03:14PM +0800, Hal Feng wrote:
>> On Wed,  5 Apr 2023 22:30:45 +0100, Conor Dooley wrote:
> 
>> > Hal, can you get your folks to resend whatever dts bits that are now
>> > applicable? IOW, the dt-bindings for the entries are in a for-next
>> > branch for some subsystem.
>> 
>> Of course. As far as I know, these nodes include trng / pmu / mmc / qspi.
> 
> Just FYI, you can get the lads to resend them whenever, but it's too
> late for v6.4 now.

I knew it later that, trng depends on stg clock dt-bindings, mmc depends on
syscon dt-bindings which will be merged into the pll clock driver, the
dt-bindings of qspi need to be fixed due to the actual number of clock
inputs it need is 3. Walker plans to resend the pmu bits these days, but
sorry to hear that it's too late now.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
