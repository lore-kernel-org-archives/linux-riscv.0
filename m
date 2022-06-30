Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61119C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 10:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fhqFOpFWT16ufEMJWj9Za9RJXt0BrBttnE64VbuWHNg=; b=sUjr0lXuykeMk6
	Vmq9oAuUAc+qobE0CTzihh8wQUnL4BFYha7Do7XdJcubFjiu5BQyw+pNr6/uOzsKot5qL5uZHqKM5
	5mWKWO3LxwbFY9VG62UZB6J1hGJCVaLQ28iQG8GzRlQS+jm5kxkkKwAYo1CJFQbjBYVvTsu8OQxxn
	RCkj+mqhv0WfmJXevxk4xs1X3e46pK7U4YyiqNHJQj2pHh5BVe889YWIGUaowOW0kF5sbTX8xqBIt
	lxqhkT8a7swasC1BqgYM8nRe9IBNZICyubP6apE4k25JzZ796v7PqtOndNGIboJVdkp63e1CyqM93
	TCyVDm/+KDhzOor+2+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6r0o-00GQdf-R1; Thu, 30 Jun 2022 10:03:02 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6r0d-00GQWK-TI
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 10:02:54 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 17EE65C02FC;
	Thu, 30 Jun 2022 06:02:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 30 Jun 2022 06:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1656583364; x=1656669764; bh=TAIcAgNNAp
	8QIpHYtRSOz7CgB2mDvAl/qh8TqyK3DN8=; b=kAh6BD1/2JQxR0GOot/3t8mSpi
	vycaf/hQi7/JQ4dG4h4VMpo17DAf8hfCNrN1inbvsJ7YxLvtAh12DTTQ4biXxQmS
	cQO9j5i0GRD1WVJbznGceotDIOfy40F2kbY3ou9mynkfUWYMQbHmrBHyGFry/fBZ
	Kd31DppBoaPDw9Hp0Y5CZRFvAmxlsJcvFKFtnAF+rWBKReDoTZfSBIfWiE+a4K0l
	c1eRcACljbAavkOfLoNpHaZPx0cs78wUWOBse/HuHge4rRC/Kok23I6xSY9x5IAZ
	YwUltXKxvO3mDWDQRwq1wY4Axiw9MGL7dJ99VoWLTZGNeeH/DS+Lfst0KLQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1656583364; x=1656669764; bh=TAIcAgNNAp8QI
	pHYtRSOz7CgB2mDvAl/qh8TqyK3DN8=; b=DY8j6Sphwo6tsraAxL0XaL+iqKHvo
	SECDDRp1VCzTl/FX6UcQJtjXfNR+4we5qVwkcrfntQpzcuDTcJ69Ndpa8n2PA+2r
	x8Ny1TYPZvMyjH+oCTxOyKSBbUfzGp/JShj2ZH02VHERWvvorzxRqvYz17L/s2aq
	GTQge0JbZ9duyX7u3grnE+9SzxBGvny5VnL/mBUKVsi4CFM35g4oSbjXIm+sAZFb
	shQCKsyCcqHx2349tLpSzLQ/u52klDz6ga/ULao6UkpKF3V7QVwpgkOrxAfxZLGX
	LGh/DA2WJKEdZz/WoSGY+aM39DWO0eQPOyVneWuXgNfZLr+5ZQXc0vJmg==
X-ME-Sender: <xms:w3S9YkZxbMdgdMdH7ND4D-gjocW3k7dZLXI5f19oDYa9L7ZuhBTBzg>
    <xme:w3S9YvY6b7-Z3c7dO9bDRQduPp3XVdAj3eAdHstSNLASoRudMCT7nLwIg--YiSfiU
    dyy1B9-ChOXl-ByrQ>
X-ME-Received: <xmr:w3S9Yu92fReuoFg6kXGhyaWcbP7v3V5g-RgMKatddj-QYpJhcuDwWB_ud-nvAK6-JIY7wRI4-A1_1zEifXERD24AVf79EQLXzk1t_LRhNJet-1ukzo2Ym-6LRq6uVFK6cbK6jQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehuddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeefkedvudekfeehgffgteekieehhfekfeegteefgfduhfffvdehvdet
    keegfefgteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:w3S9YurJfeQX2H8_wCkg5sdfNMLGcHSD09xum9Shj7UYN-msPa0haw>
    <xmx:w3S9Yvr48pi_BoW0cksUsZsuWPwu_fheEygwvQu43DvFBDF0S5BFew>
    <xmx:w3S9YsQ6gz4R6bl5pOwfWUjfEMmQEsn4wAsgLVwMoc6W0Vqb0LKBXA>
    <xmx:xHS9YvbemzsULfjHqmtTw3WTUNcwSByu2lDc_D36bJ44S0UF9pLXnA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 06:02:42 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Samuel Holland <samuel@sholland.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/4] Add PLIC support for Renesas RZ/Five SoC / Fix T-HEAD PLIC edge flow
Date: Thu, 30 Jun 2022 05:02:37 -0500
Message-Id: <20220630100241.35233-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_030252_060533_6DA07E02 
X-CRM114-Status: GOOD (  11.30  )
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

This patch series adds PLIC support for Renesas RZ/Five SoC.

Since the T-HEAD C900 PLIC has the same behavior, it also applies the
fix for that variant.

This series is an update of v2 of the RZ/Five series[0], and replaces
the separate T-HEAD series[1].

[0]: https://lore.kernel.org/linux-riscv/20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1]: https://lore.kernel.org/linux-riscv/20220627051257.38543-1-samuel@sholland.org/

Changes in v3:
 - Add a more detailed explanation for why #interrupt-cells differs
 - Add andestech,nceplic100 as a fallback compatible
 - Separate the conditional part of the binding into two blocks (one for
   the PLIC implementation and the other for the SoC integration)
 - Use a quirk bit for selecting the flow instead of a variant ID
 - Use the andestech,nceplic100 compatible to select the new behavior
 - Use handle_edge_irq instead of handle_fasteoi_ack_irq so .irq_ack
   always gets called
 - Do not set the handler name, as RISC-V selects GENERIC_IRQ_SHOW_LEVEL
 - Use the same name for plic_edge_chip as plic_chip

Changes in v2:
 - Fixed review comments pointed by Marc and Krzysztof.

Changes in v1:
 - Fixed review comments pointed by Rob and Geert.
 - Changed implementation for EDGE interrupt handling on Renesas RZ/Five
   SoC.

Lad Prabhakar (2):
  dt-bindings: interrupt-controller: sifive,plic: Document Renesas
    RZ/Five SoC
  irqchip/sifive-plic: Add support for Renesas RZ/Five SoC

Samuel Holland (2):
  dt-bindings: interrupt-controller: Require trigger type for T-HEAD
    PLIC
  irqchip/sifive-plic: Fix T-HEAD PLIC edge trigger handling

 .../sifive,plic-1.0.0.yaml                    | 65 +++++++++++++--
 drivers/irqchip/irq-sifive-plic.c             | 80 +++++++++++++++++--
 2 files changed, 135 insertions(+), 10 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
