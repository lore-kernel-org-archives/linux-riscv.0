Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5723EC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 17:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAjKx8fYqy/Y/wXB2YC04vB6gVT0OeiroDBEU0KCuDs=; b=0DfUO+qNIT2WsM
	djgfQ7la+ro+L3m3old7sh+HQznzxIincpW3GROEmsUCvjZNICanwW2edketfMQshRqKPaDp7dxlG
	0B/t7Uj9oOuTekbadjnJqUvGMAJDNzDzVE6u/D3S+iebSFxdnTnOyUIFTvrxEysyzb1NNk1eUlYFv
	WHKjHk3HSUe2UmMC36Fle7M6/3FHgXH5zqM63sLVPwuTl0qPItJUe1PGqjIaA4wf5Smp27gsEHwgr
	xVz+89zXMFxPpZ9lpEigN8vqjeHhKIOGV6hTYA+qLYtH0Dp+kVPszArSP6gT1flIQJbup/VE0XmO7
	GTVuat6Iha4LG3ybP76g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiJQy-005Npe-J6; Tue, 11 Oct 2022 17:52:52 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiJQv-005Noh-0J
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 17:52:51 +0000
X-QQ-mid: bizesmtp67t1665510739tbwjqr9m
Received: from [192.168.1.231] ( [113.72.146.141])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Oct 2022 01:52:18 +0800 (CST)
X-QQ-SSF: 0100000000200090B000B00A0000000
X-QQ-FEAT: eSZ1CZgv+JDpbz+8SZtFjGpBaoHZNJKphrrKecDmH7nFw9yOYamWc6tnUXtiK
	5hqBaXLrf5CuIHQTdb0xFyaOht6w2j/pHl/eluwYwBsXw/EYe1upcfnk8v/ClL+IhgLqg1D
	NQWyxjYe2HsuXrYs0WZNLcSpZYVdZC7iJCx0Pruqa/KnemRMSq9WYz9/OtaPqOrh8r+eFrn
	77a4bV7aFLfWOzNgU3oekYrgRNUegBHk8OhXbHqYfwIPeC6kkc1nuw7f+NPrXtWJIpCEjy+
	W+lDWWcd1xXRXOz8KqzeDSadVBRMPFcB3o8T9bdwfcYhDvuaEE8pihJHU/taIhOdmcCRC/r
	CpfCAVlKq4JPAfRbyNoY0rHYmdeAA==
X-QQ-GoodBg: 0
Message-ID: <6BB36B91BD2046FD+e637d229-f656-a548-c45a-8d62a0c7928d@linux.starfivetech.com>
Date: Wed, 12 Oct 2022 01:52:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 17/30] dt-bindings: clock: Add
 starfive,jh7110-clkgen-sys bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929222647.23816-1-hal.feng@linux.starfivetech.com>
 <c99f6552-db04-fe30-ed69-4a08b0af5276@linaro.org>
Content-Language: en-US
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <c99f6552-db04-fe30-ed69-4a08b0af5276@linaro.org>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_105249_386131_E8508F00 
X-CRM114-Status: UNSURE (   8.52  )
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

On Fri, 30 Sep 2022 12:58:12 +0200, Krzysztof Kozlowski wrote:
> On 30/09/2022 00:26, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> > 
> > Add bindings for the system clock generator on the JH7110
> > RISC-V SoC by StarFive Technology Ltd.
> > 
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> 
> (...)
> 
> > +  '#clock-cells':
> > +    const: 1
> > +    description:
> > +      See <dt-bindings/clock/starfive-jh7110-sys.h> for valid indices.
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - clock-names
> > +  - '#clock-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    syscrg_clk: clock-controller@13020000 {
> 
> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).

Will rewrite the bindings and test them. Thanks.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
