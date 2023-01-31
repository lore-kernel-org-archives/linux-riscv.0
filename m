Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59484C636CD
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 06:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMvXG8rwidokBQy01qLc32QGV6phZWn1a1kxZ0ZDGCI=; b=cQ5IlYqsW5Ndg+
	7hOtWGQr30njn65wrt922Sr0xnuxHfH9n36ggYYbLxXB0JEICIwK5VllS/ia4GL9Y0A5iWJslUkLV
	k7FgRCuKx7vuyUpeD3Q5MxWu+6azpIwR1Beeq1D46oOza6ATe8itXNmetDSjnpGYEnu40IfnqrwsH
	5TwDfm6AlY1qAaOmQUIBD7+2Xtj3P9LkZ357rX/YpoifZZYHl3yB7599lUGRKUvvUDD99nXHjQaI2
	v6o45KU7rXn7klwOacPqQ23wzuCdJUIO8s2QS78OgJuHD2Z+AMuP1pJtdA0hr7xMbs2qNW0i+GGYl
	eFHt7QXTcT8//xZXKVsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMjxR-006RSo-J5; Tue, 31 Jan 2023 06:17:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMjxO-006RRf-QE
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 06:17:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 25942B819DB;
	Tue, 31 Jan 2023 06:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17996C433EF;
	Tue, 31 Jan 2023 06:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675145842;
	bh=GMEUHLupoK0SLnzwoNrELALifXu7rHL8trakhBe60h4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=uxfkiJCiW5WhOuRBS4BNgeXUffWbsrOlGizOBCGS/UIl5arVe+6S/Nf0jw56N0f7C
	 XsQ2rlXcU9la577QEiw/swtUUqciaPxKIVzZzd60BpNODNekhVK4OX4RAuL9QU9UsV
	 fpz2+DDVjEprzKZ47BJgswq9feotRSfR8FH7TduQdYOXAdiisKiGEUiTki22Mk/v9+
	 Elc12LkVYARdHIqcZuu8aK+3FOSGyekfBQZSEU8ujP0bBGB5L+4hHJy4HY3PzeVFJJ
	 YkoG+RDNzk82i8gV4sDgp77pWQKxce2xU4b8/WF4anVRs7q7wajjsL4rRyQFuNWWP6
	 sn8aOoDnWg+Ag==
Date: Tue, 31 Jan 2023 06:17:17 +0000
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
In-Reply-To: <0db7824b-184d-dfae-f61d-3048392c9895@starfivetech.com>
References: <20221220011247.35560-1-hal.feng@starfivetech.com> <20221220011247.35560-7-hal.feng@starfivetech.com> <0db7824b-184d-dfae-f61d-3048392c9895@starfivetech.com>
Message-ID: <39F228FA-2298-4813-9BDE-7100DE920213@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_221727_042403_01E93023 
X-CRM114-Status: GOOD (  10.97  )
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



On 31 January 2023 02:00:26 GMT, Hal Feng <hal.feng@starfivetech.com> wrote:
>On Tue, 20 Dec 2022 09:12:46 +0800, Hal Feng wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>> 
>> Add initial device tree for the JH7110 RISC-V SoC by StarFive
>> Technology Ltd.
>> 
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 411 +++++++++++++++++++++++
>>  1 file changed, 411 insertions(+)
>>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110.dtsi
>
>I wanna add i2c nodes (i2c0-6) in the next version, so someone else
>can use them when they submit i2c driver patches.

All of the other series depend on this one for enablement,
so unless the binding for i2c is already upstream I'd advise keeping it separate.

Cheers,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
