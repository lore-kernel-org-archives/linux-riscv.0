Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BA2C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 18:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kt431nEo6P6P8nhsdrKnoZCrE/WWCUzP+2sV2UM1K7s=; b=bx+Cb7h8lInYAH
	jDwAfcbccPgLBIqb+xeJ6T7V1DUoqa3kqXAEBnPwCLHkIrkwEHZ8gpVDHITGYYevH6q7qJQJ12hbH
	aCpqhKTd0Ti5IEuqk29LtCcTz/vpvwV9LWnXFyDmFDjWjTaSe4DHJY4c2YmYFSRmhB+nqLkaBpPOU
	9+DnT0h1UW/R83g35WBaG8Xma27Ns99FHnDOhnw0d8u2sH9DNNJGQCVorAC1Oa3Waiw4r7grxVthx
	05g/b8j5xsT9Arp145tTQTMv4BYKFML/D2AvDkPOZlamGETe6Vxrtnb3VWodff0Iw1eL75lxKDakG
	9cKDhz+kSSh7KevAtdVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiJZX-005OhT-J2; Tue, 11 Oct 2022 18:01:43 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiJZU-005Og5-Mc
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 18:01:42 +0000
X-QQ-mid: bizesmtp76t1665511278t5i75y1k
Received: from [192.168.1.231] ( [113.72.146.141])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Oct 2022 02:01:16 +0800 (CST)
X-QQ-SSF: 0100000000200090B000B00A0000000
X-QQ-FEAT: Xz3VOcA7Mr1IeMy5YkFr3EQysBY1c40hmsRb8FmCb9HYXwFMzxuV3pNPfW+Oo
	Yy88ZEliVWGfuHpA9UsW0WR3SsrAgYJ/mLN08uP1rAii9nv3hF0/fAVMKfE3oSRBi5IuKh1
	U6iVYMZ3Oc63DZX1BtdGiS6TE0gZ/iCK7uw8lKbdAavr8+ly9R+pW+ggB1N5PXseqyAuvtP
	CQ5imFaDSqNGkNvpJomvgk7Yuz920GfcMiAaVEb9dS2p81f/c1PCl1SnWT6u2mFa2/jR0OI
	ZLu6IQl++hK59OYWwKDqXiBU88HgVfhBH1w3vnz3X3JsZGmpxtML80nMfBf8/QW6eFJzT60
	IDiKhi5WSKdJtJ5KxPm5ABHVKtfOqPAfUvAblZJzbb5ix17+Uo=
X-QQ-GoodBg: 0
Message-ID: <950768A5571BD396+4cf106df-5127-4646-5879-a516a002760c@linux.starfivetech.com>
Date: Wed, 12 Oct 2022 02:01:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 20/30] dt-bindings: clock: Add
 starfive,jh7110-clkgen-aon bindings
Content-Language: en-US
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
 <20220930055632.5136-1-hal.feng@linux.starfivetech.com>
 <ff493398-7786-db0d-ae94-b52207e2a56c@linaro.org>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <ff493398-7786-db0d-ae94-b52207e2a56c@linaro.org>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_110141_063806_61F09582 
X-CRM114-Status: UNSURE (   7.59  )
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

On Fri, 30 Sep 2022 12:59:01 +0200, Krzysztof Kozlowski wrote:
> On 30/09/2022 07:56, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> > 
> > Add bindings for the always-on clock generator on the JH7110
> > RISC-V SoC by StarFive Technology Ltd.
> > 
> 
> (...)
> 
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/starfive-jh7110-sys.h>
> > +
> > +    aoncrg: clock-controller@17000000 {
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
