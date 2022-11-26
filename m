Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B079C43217
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 23:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pSVRrK+LXmLLevgwvH7PHZIfDUJKQ+v4LVR1ZWajm98=; b=Pz5vlms3BGZaBm
	DhXYCaQszhq18WIjeX0V1yR9/dM/fkxaSh6szusCNThn86hLWzk2JY0yoS6BzihA85PjrDpaYyg08
	z3N5/I3ZyUN3YV/8U4sWW89W2nR75LWWQs2UGYHPjcxjF6TTB1TCsr+sYPNJTDC/13zVC/yh7Qxd8
	TM5BvcGalCYYxouYALA7ZWiLDIv4EMhf/KeuHuARAQYc5LjpwLfbbjRjj+gGx5/4n4Tc1tpXrpC9q
	IQBf6t+CdPWhM4B86vZWVtoBKFquZeZhWTZxHRLFHcKXj2MGJqtQKWASafH8KS1UcZ0kATZAd2EDz
	5HooeJeibF2QZXj/n68g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz4nx-008cGa-CS; Sat, 26 Nov 2022 23:41:53 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz4nr-008cAC-Og
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 23:41:50 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 8CFC05C007D;
	Sat, 26 Nov 2022 18:41:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 26 Nov 2022 18:41:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1669506096; x=1669592496; bh=w8La255xXVxnIR3cniemxgpr5
	Ih0kN7ITTRYd2se9fw=; b=sqf6qn2xRtMfNHG6XRPyhYmZkhWPE1aNEncXv+m69
	9zbjDacLmOYZJqbcXAw3jqQcIodP1xcLMJ22p9sxNk3XBEJ4uUjB/BBr7GWwgnY2
	ia+43kwWX20Su2xE4ZDbJ/LcQY3A6f+IRu/v8kathzas3fgfhnC4pumVUNC7oZyq
	JuG9vYvIPscBV5sEhfepk2zv1mpnG3W0YC5aNVNW0kXhne4pyGkiwqqaD1++g59k
	uzvRRtLdYJFPKOnAxuZbVRTbGc9CDEUTArR7TdDBjH5XQEQeD0P+b+g8Y5KKVx+s
	D2D+8onoYBqmKSYbudaI1vRxhJ8J8EZZ+cfObXfM5kHrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1669506096; x=1669592496; bh=w8La255xXVxnIR3cniemxgpr5Ih0kN7ITTR
	Yd2se9fw=; b=IbqWh3TaV6qKJQM08vxuTMuj3FyizQWqvb5brfdLWGbYOZlJPne
	wW7KmuLoGTGBoqeDQy3UN7vGsLMNysuqGlyANkXAgLTLy21NyykxEx8JMfVFAIsS
	kv9NIwm1lonJn3Pf3G7x4XUZCxh/ArpaI2mq/NH5KHFhzjYx8QKTfoppYXwXrMq1
	0TLremPYcnQxmvR/LpSIh2v9JDU1dYSMwIc5i2UCe9JgCwOyj2BMOZiV/dJacG0t
	lugpGyJv8rHDINidpMKTzRKj11+qOvJb8YEquvHW+xmZQw9ppeHLX1I76kjjntq9
	ae3XJ51TslXJ6k9eK8NFLsEl78fJ0Z6fSZg==
X-ME-Sender: <xms:MKSCY0rOhwgXOP_0jZY36oAHZcg2NFc3EgVVRmIZWgRdnoY7YoAyMg>
    <xme:MKSCY6ptV0WBzqWqmKc9BzOA-3ALwaRub-xYA3xZRahf0YJGcRj3qwMy97HwxlmR5
    DW94YBRIkWW3OhBvg>
X-ME-Received: <xmr:MKSCY5PF2I6wejzSAXzwPVEBYNwZOP1SS2MdIh2MFARhnUbpuWnW_b0cccCMmYjtMfiYoe00Ayl2MbHotSirJC1-9tuE-zqqtrA4cgBf5x4Ju3WiI84b_zwx8sX3EPwNy32M6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieekgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeekheffteehtdetfffgfeetteejvdefleeuvedufffguedtjedvheelvddv
    fffhveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdr
    ohhrgh
X-ME-Proxy: <xmx:MKSCY76dNXZPTT4FNdppGvplIpm4n07ijFJhABYDaISnB1Dlgpk06Q>
    <xmx:MKSCYz6i-OuOQulPLaZTMeUNtwHC_TbLvBHSykAY7AzFX5M5Aa4hfw>
    <xmx:MKSCY7hkr7BMIgXYnR_GURMZXDP6W4v1sZM8lr-oqdJ8OluZS4CtAQ>
    <xmx:MKSCY5QClTv7GAv9QTb2Ayly3zazOiioh9fPZrder1dcmg4fYoMPnQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Nov 2022 18:41:35 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] genirq: oneshot-safe threaded EOIs
Date: Sat, 26 Nov 2022 17:41:31 -0600
Message-Id: <20221126234134.32660-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_154148_459653_128E7DBC 
X-CRM114-Status: UNSURE (   6.99  )
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

This is the optimization that I promised back in
https://lore.kernel.org/lkml/20220701202440.59059-1-samuel@sholland.org/
and got back around to cleaning up. To quote that cover letter:

"A further optimization is to take advantage of the fact that multiple
IRQs can be claimed at once. This allows removing the mask operations
for oneshot IRQs -- i.e. the combination of IRQCHIP_ONESHOT_SAFE and
IRQCHIP_EOI_THREADED, which is not currently supported."

Or in other words, we reuse the oneshot infrastructure for EOIs instead
of masking.

There a a few functions/variables that probably should be renamed now
that I have muddied what "oneshot" means. I elected not to do that in
this version to avoid distracting from the functional changes.


Samuel Holland (3):
  genirq: Simplify cond_unmask_eoi_irq()
  genirq: Add support for oneshot-safe threaded EOIs
  irqchip/sifive-plic: Enable oneshot-safe threaded EOIs

 drivers/irqchip/irq-sifive-plic.c |  2 ++
 kernel/irq/chip.c                 | 21 ++++++++++++---------
 kernel/irq/manage.c               | 15 ++++++++++-----
 3 files changed, 24 insertions(+), 14 deletions(-)

-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
