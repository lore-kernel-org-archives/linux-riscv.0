Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DF0C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 05:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LO9mD0nZbOTNuBPEKaXWcGZcgWUCDKFJmIlw48z/p8=; b=Lxr+j76J7nahYZ
	Aqb2Pg/Oft1sVKzm9aH/ZtIocbaLaut1OfQbaeTXcc4tCb/0DPbmgwoSp1mIc1yba0SdkFWCbpECK
	/mAiAc+TqK2IQiE014pL3TwgWWjZP1YWTsw9hvKulXZ6LcvrHjN3DpUzgaLD8fcw53WWklYuhwr06
	3zOSzX+m5Flkkw9EsNPhiJjtfkqzVWIrQU0tt9AZMzS08N8cE9LsBUs0XVxhYLSttigtVR7o6FqJf
	q+G+topDlULMnTVKFWq60fyQVdUCABjYq6BVnfzt9LFVtNDFzETFOvOu4nJ9WmERWd7aZzYLz9cYA
	Jw4qwShJDJSdhBDpX5oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV4XO-00FCZj-8o; Thu, 23 Feb 2023 05:53:02 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV4XL-00FCXX-1r
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 05:53:01 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 4F5FA24E1C6;
	Thu, 23 Feb 2023 13:52:22 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 13:52:22 +0800
Received: from [192.168.125.82] (113.72.147.165) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 13:52:21 +0800
Message-ID: <ef44a4c7-9fd9-5f33-a524-a91fb9ff793a@starfivetech.com>
Date: Thu, 23 Feb 2023 13:52:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v4 10/19] dt-bindings: clock: Add StarFive JH7110
 always-on clock and reset generator
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
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
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-11-hal.feng@starfivetech.com> <Y/T+3H8A7jrX+I9M@spud>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y/T+3H8A7jrX+I9M@spud>
X-Originating-IP: [113.72.147.165]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_215259_255170_B86EF2F3 
X-CRM114-Status: UNSURE (   8.36  )
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

On Tue, 21 Feb 2023 17:26:52 +0000, Conor Dooley wrote:
> On Tue, Feb 21, 2023 at 10:46:36AM +0800, Hal Feng wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>> 
>> Add bindings for the always-on clock and reset generator (AONCRG) on the
>> JH7110 RISC-V SoC by StarFive Ltd.
> 
>> +  clocks:
>> +    items:
>> +      - description: Main Oscillator (24 MHz)
>> +      - description: RTC Oscillator (32.768 kHz)
>> +      - description: GMAC0 RMII reference
>> +      - description: GMAC0 RGMII RX
>> +      - description: STG AXI/AHB
>> +      - description: APB Bus
>> +      - description: GMAC0 GTX
> 
> Ditto here, are some of these clocks, especially gmac0, also optional?

The clock "rtc_osc" and "gmac0_rmii_refin" are optional, the other
clocks are required. I will modify accordingly. Thanks.

Best regards,
Hal

> 
>> +
>> +  clock-names:
>> +    items:
>> +      - const: osc
>> +      - const: rtc_osc
>> +      - const: gmac0_rmii_refin
>> +      - const: gmac0_rgmii_rxin
>> +      - const: stg_axiahb
>> +      - const: apb_bus
>> +      - const: gmac0_gtxclk


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
