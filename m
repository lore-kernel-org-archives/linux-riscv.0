Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D788EC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 06:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqzWCJyuXKxOVe1EOHSlqaUmXtJIvFpXFvtF20wAfHg=; b=Ng/oZIOxzGbh3E
	0QbN+F8XHq0ptO/d1UgcG11B3Jint+IouPSogkbJmHbMxOcvXAMLlSKP5xR5jisrhxvaDK8FDkxj3
	gfYosk3oQ8+i1Gxr7BHw01rXiSFcjBwAiGNRf65vmTCWP7vACm0Vtkjk5/9Y3tyfBKAI3Y1vax8Ga
	8yv+zTul89dfZR9/Bmsgm6qf5sGX8GSSfJYuTPJOkXmza5HawiWndvSjRgyUaGumkiqi1avtYmYDi
	Gjdy3PCqhh2PGwTJRp0ReWeex8YApMbq9zxV0bbj1wjilfeRbHft4wMMB14546LcSNyrBH5Qc/Xzu
	in0f00PdpCTG3eAyu3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNSwF-00EX6F-Om; Thu, 02 Feb 2023 06:19:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNSwD-00EX52-A8
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 06:19:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B7247B824DB;
	Thu,  2 Feb 2023 06:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8E5C433EF;
	Thu,  2 Feb 2023 06:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675318750;
	bh=6xVy9dVamZI7gmmEzbNj10pwoYuJsIbEypFo0Ly+oSE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=MH2PlScttKkJ8L9i3MHuyqbOxDreiQ+KHwP6+kJufOqJi+UvsWmYFGJstE5pKFMDn
	 Q4oUKPf64y3OQx7ITz3jYZF9ivClKbAXbkheGYxtdwfZPfMXMPpHx41Wc5yqyyQWbi
	 OaAUZvC1+nqd03VSSznxGj/fH2IZmLiX8W6rC6xHUn30IRtkx4pGRhhxA0uTaxnTqc
	 F+TrO0RXbvl0FNxnKZw8aI9uq7ZccNe7gwcKSv7AHYgLIXlhUOwxa8PvRkaZlpG0ug
	 d7lE+y8cFhmdYstJO0doJlDMXgyYT4OjWDXHS3pLyhBLO0HzubJ006nQ+XuSDQAJOQ
	 Y6uhYGWaP6bjw==
Date: Thu, 02 Feb 2023 06:19:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
CC: Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_6/7=5D_riscv=3A_dts=3A_starfive=3A?= =?US-ASCII?Q?_Add_initial_StarFive_JH7110_device_tree?=
User-Agent: K-9 Mail for Android
In-Reply-To: <0ff800a1-5e90-64bc-af53-2736e698c9e4@starfivetech.com>
References: <20221220011247.35560-1-hal.feng@starfivetech.com> <20221220011247.35560-7-hal.feng@starfivetech.com> <0db7824b-184d-dfae-f61d-3048392c9895@starfivetech.com> <39F228FA-2298-4813-9BDE-7100DE920213@kernel.org> <0ff800a1-5e90-64bc-af53-2736e698c9e4@starfivetech.com>
Message-ID: <A6312791-75C5-478A-8B76-27F293B43DD6@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_221913_668031_BE46BC3A 
X-CRM114-Status: GOOD (  11.57  )
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



On 2 February 2023 02:42:32 GMT, Hal Feng <hal.feng@starfivetech.com> wrote:
>On Tue, 31 Jan 2023 06:17:17 +0000, Conor Dooley wrote:
>> On 31 January 2023 02:00:26 GMT, Hal Feng <hal.feng@starfivetech.com> wrote:
>>>On Tue, 20 Dec 2022 09:12:46 +0800, Hal Feng wrote:
>>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>> 
>>>> Add initial device tree for the JH7110 RISC-V SoC by StarFive
>>>> Technology Ltd.
>>>> 
>>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>>> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>>>> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>>>> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
>>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>>> ---
>>>>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 411 +++++++++++++++++++++++
>>>>  1 file changed, 411 insertions(+)
>>>>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110.dtsi
>>>
>>>I wanna add i2c nodes (i2c0-6) in the next version, so someone else
>>>can use them when they submit i2c driver patches.
>> 
>> All of the other series depend on this one for enablement,
>> so unless the binding for i2c is already upstream I'd advise keeping it separate.
>
>The i2c IP of JH7110 is from Synopsys and the same as the i2c IP in JH7100.
>The binding and driver for i2c are already upstream. It works as long as we
>add the i2c nodes and configure pins for i2c in device tree. It will simplify
>the dependency if we do that.

Please make sure that you add a device specific compatible for jh7110 then, thanks.

>By the way, I am checking the ISA of U74-MC on JH7110 with someone else.
>I will reply you today.

Cool!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
