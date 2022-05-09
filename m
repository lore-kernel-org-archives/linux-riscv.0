Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F46C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 03:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3skmN2dV8gdQ/W/JIL6ivGE8tEdOtt1ckwDDsqXBRgE=; b=sdCG1dMMBNA155
	iLSI04HnrPszqR6JtO/q5btzBumY1GTnG9j3j784tyEevGr9q1EYygTLpTUzSS0Ai5gMU+okQH8Fi
	zyFvlDQRIN1g0Hgsapve5OF642sUV7QvLoJD/1UZ+3IdP5/6N5Z4+Noxm2U8Yupx51kTWUIdX42U6
	o1lXhx0EiqgBkVsQcXY4rsQJhQq89EA+9IxJ9SXF3KBOb7dljhRLcvy/UjpkqHQ6yl9EYk1OHu2VL
	ssjdrYHF++4F8xE6TYGp56aZpxyoWYsBYmbrIFxVuUzEp9ozWOWVlZjCD7nh9VeT9VTbxyI2JpO24
	UhWOeWuA1ELHyrg3vSBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnuJs-00CDtp-7I; Mon, 09 May 2022 03:44:24 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnuJC-00CDec-4T; Mon, 09 May 2022 03:43:45 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id F14E15C0107;
 Sun,  8 May 2022 23:43:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 08 May 2022 23:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1652067815; x=1652154215; bh=nG582K4noeUxWpsuv0Rzqrrhj
 CwgaWDqNW0bQwfFnVA=; b=i+lZR/vLOZ7l6H6J80E3KhbQ6mKbiedfZsJVspJO8
 YM3/aeOeVb4EUHTHGeWVxT3MKLvxYUrx7HZ0yKKtAV2haLZRQwQBgHwdQQKk/11p
 D5xNgtUgslVdKjn+mT830eYVJWeRi6jFg0I8pBAzExdL4wfo6xyZwRbTAxQ8tFjP
 ejq9zbSFWqR4znpYKeMtF0ECf/XRLGZp/Qan+bmZraPxgGaKo+Dzy18P7yo+A5vl
 FxVwAUju78BZVF7hZhoW8P+GxcSKKCmJfZ/tNBu0jXIMrUk2ZSa0ebFjXDim19+D
 K2MRIs4uzpbjLjDt+zN19mZCxvLSK5axz2FkeGdqdu9sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1652067815; x=1652154215; bh=n
 G582K4noeUxWpsuv0RzqrrhjCwgaWDqNW0bQwfFnVA=; b=Q5ALO86nXXK0ltJwo
 VJNcvDI+EukCCwKujZpklyW4Sj26KwpwJuQZNL1OdZsD1xl9R0+3RgvZ3qH/Lvsp
 tqgu6/jc/Irs6E3ypEmI/nbCsUa6WWi5zYF5qx9HkM5C2lu7ATMLQccdphaN5ERX
 hjEHGOBbCaEwFpXGaSEiSMtIJoX+WkGBUAd9Ko13sXD4u2xoOgZT3DB6Wu5pzovc
 mCd4Y+UxA2lzG3WL/3HojdftP0Del5KfS+9TtUBHD9M73bd5wQhFcW+a5HKVi5NU
 Y8gkQUnrhj3uQrHdYU+wsxGffJx63Mbrn7yCbUvL14CoSyZVkgMQ6Iy8Dd87sRfS
 ujnWQ==
X-ME-Sender: <xms:5414YjRZQRPISvciOddcMux8SbpZGVA9eAGY4p_A0NHqZxNyl6B3KA>
 <xme:5414YkzP3YRij9xyj1bRVYT__V9GGCmMrLkOUictYmLor4sQ1PDcW9zAg-NHF7pDb
 vmfw9v53ja99lv3Lw>
X-ME-Received: <xmr:5414Yo3jH9SCIEbcKec3F2APJf5gWr6CvqaOH2ql_kBCqaCo9USQgM8vDJuq5aHtkswBssewm_zyFawaxIgZyrKVBtwnkYDgvE02TU9eanyh-mlYQH6BS-hSDIrulx_ESbIMMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
 jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
 htthgvrhhnpeekveelhfejueelleetvdejvdeffeetgeelheeujeffhefgffefkeehhffh
 keekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:5414YjD940h3lkM_OpydnX6bcGwX772OfGtnWem4Q_hdEn4v6lPPyw>
 <xmx:5414YsixDyNMdGR0JhiPwDi7r_HrtplPyXiBKFLKtqM516doOgoIIw>
 <xmx:5414Ynr-rtw6v8C1TaPDFI0HAGSh_vDIkdhRBYPHwO2LIa8Nn9TldA>
 <xmx:5414YrRLag4J_YyiAxnhKnPsweK68wp4edlRqzQKoQGmCTJYnrAQZg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 May 2022 23:43:34 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Samuel Holland <samuel@sholland.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Guo Ren <guoren@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 Wei Xu <xuwei5@hisilicon.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH 0/5] genirq/irqchip: RISC-V PLIC cleanup and optimization
Date: Sun,  8 May 2022 22:43:28 -0500
Message-Id: <20220509034333.60017-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_204342_768856_87EA709E 
X-CRM114-Status: UNSURE (   9.96  )
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

This series removes the splinlocks and cpumask operations from the PLIC
driver's hot path. To do that, it first makes the IRQ affinity mask
behavior more consistent between uniprocessor and SMP configurations.
(The Allwinner D1 is a uniprocessor SoC containing a PLIC.)

A further optimization is to take advantage of the fact that multiple
IRQs can be claimed at once. This allows removing the mask operations
for oneshot IRQs -- i.e. the combination of IRQCHIP_ONESHOT_SAFE and
IRQCHIP_EOI_THREADED, which is not currently supported. I will send
this as a separate series, since it makes more invasive changes to the
generic IRQ code.


Samuel Holland (5):
  genirq: GENERIC_IRQ_EFFECTIVE_AFF_MASK depends on SMP
  genirq: Refactor accessors to use irq_data_get_affinity_mask
  genirq: Provide an IRQ affinity mask in non-SMP configs
  irqchip/sifive-plic: Make better use of the effective affinity mask
  irqchip/sifive-plic: Separate the enable and mask operations

 arch/arm/mach-hisi/Kconfig        |  2 +-
 drivers/irqchip/Kconfig           | 15 ++++----
 drivers/irqchip/irq-sifive-plic.c | 61 ++++++++++++++++---------------
 include/linux/irq.h               | 20 ++++++----
 kernel/irq/Kconfig                |  1 +
 5 files changed, 54 insertions(+), 45 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
