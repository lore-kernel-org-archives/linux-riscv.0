Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6465BC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 10:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jPtDoDMaGMkMETPVD5jTjAgnXx+UodmjGRnKrlc1cAU=; b=Cs+aw2rrCvGuqN
	J7h/GzK9ofHLtnOTeZ37HqIIwJnQSLpWdtCXZX9eK6IqtMOltN7FxCHLcr0uWdkNUIEjhtf+CH/QI
	Z08NWtEVYRlBAT5GUWcr36+2K0kPA+NCr8nbfwDs+tSKXkHbnD0AqGXe6c4GRiAIHo2AMng9U2p1/
	tOYNpjXVJhnJ1pSNxonS3cNUY5YemB1SPS5ugAMoN+csuZys/1bGCx4BZVNLf1KdzPwzMu1KtkLLI
	vCzR/hnzXctDoOsHTCFPIVBaqZ1ky1r/Sju5JHbap1Y/F/bgWlakacX75vqEJQLDyX4xEEhWZXSFK
	EILReJO/uKpjING289UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6r0m-00GQcS-0U; Thu, 30 Jun 2022 10:03:00 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6r0e-00GQXI-07
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 10:02:54 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 6C45A5C0249;
	Thu, 30 Jun 2022 06:02:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 30 Jun 2022 06:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1656583369; x=1656669769; bh=RR
	JIdrAZofAfNPH9Ms80aUvsjV2YDmaSvFUGEVQFoI0=; b=MhFhECyTKDc6fKbJX8
	v6K6uLvYAy+WPV7z5+cM+mF8ZKDQM3KM2+HUCpdUHt+HclhTQ5oKXsZsOZXNuZhi
	3kJwOy+02A2YkQ22uf9Z6GhhAZF704H1vVjBCtQRB6jKatfiRJzLwMvaklox6UXp
	HukRMi4OSb3uWFxcR4nDRVEOuQLr4/azJ97y01o6ygZySkylznH9xqpYByUqQFVB
	Vb0zdLjOHygWjXBqT/x8zwtddAFUOB/oa7xVpvteBiXZLJRHbLqMlhdZZXJKJZtO
	OylRD++UrLbbXL5DOgct6zw4XliK9Un604lX9f7dVSJxfd/0nVGjFF9bt+MXPTrO
	0HoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1656583369; x=1656669769; bh=RRJIdrAZofAfN
	PH9Ms80aUvsjV2YDmaSvFUGEVQFoI0=; b=FwLCNgj8ef0QZbrz4RcGVYTl5wm2i
	FAT+kHCegEvqrgMI3bDELH/vSfe1yP/e+pNcWku4RrDk3/aVBDALQm9q0bY6hMty
	5xH2PxDGuhX1M6PIs+J1ueBBf6reRnVImHwotMYTIrajVzlFwbL4rNJYxGoXLUp4
	mC2bB7Og/GZX2hTMIK0yeEkGY5ZdZKheSYa30uS1z6NR4AFB5KA0hQ51sy7gqm/N
	C51+r48vP6nb7Qwsz2Rneft9HVyyPlAQiisvfs6SOSMmWq6o6/FyTm5odu1TwU8T
	o9TC8xmN2NSsOAUKizn+CM3yLOI1wxbcXjzXVm30A4uHbNSU4REDkxlmQ==
X-ME-Sender: <xms:yXS9YuvS0UKoN7QsKJ79BjTtmlhyA9eGZGptPZj6qYfK2c4ntXUcDw>
    <xme:yXS9YjcMcHl0s4RI86A5AmpbT4TIxraKL83hOmAd7DN50CNlAMjLSOvroM5mrszw_
    r0n7stQ2YccqMmrsw>
X-ME-Received: <xmr:yXS9Ypz1wkuWh8stqiNp0_wa8AKZ6c2a83i0PnECcPqAZuMoU1imgaFQV3U8GrElHcQOSfuFlK0fh_SUwrKb_dU3UMvWR8LYaErmidj8nVBd597OulntltWEbFWj8mszx-_eSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehuddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:yXS9YpMnYGNMKuHk9EAA-1jewKV76hQf6cJP_BSW69bWyBofB_H8Jg>
    <xmx:yXS9Yu-vRuXN3okDz-OCdE40D2lcNV7_nP1jIQaQ1JF3Fm7Bo6wGxg>
    <xmx:yXS9YhU_ZBTaCCv9xr7bjjdcwzAM71z5aPcZpA0dBQO3KJJqqssVtQ>
    <xmx:yXS9YpcRjg0fxvDznVJHYarskSV-1C9DSdQb6yCKfiT0F4NxNZLaMQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 06:02:48 -0400 (EDT)
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
Subject: [PATCH v3 4/4] irqchip/sifive-plic: Fix T-HEAD PLIC edge trigger handling
Date: Thu, 30 Jun 2022 05:02:41 -0500
Message-Id: <20220630100241.35233-5-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630100241.35233-1-samuel@sholland.org>
References: <20220630100241.35233-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_030252_160880_F747E4EE 
X-CRM114-Status: GOOD (  11.06  )
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

The T-HEAD PLIC ignores additional edges seen while an edge-triggered
interrupt is being handled. Because of this behavior, the driver needs
to complete edge-triggered interrupts in the .irq_ack callback before
handling them, instead of in the .irq_eoi callback afterward. Otherwise,
it could miss some interrupts.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v3:
 - Rebased on top of the RZ/Five patches

 drivers/irqchip/irq-sifive-plic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 90e44367bee9..b3a36dca7f1b 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -474,7 +474,6 @@ static int __init plic_init(struct device_node *node,
 
 IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
 IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
-IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_init); /* for firmware driver */
 
 static int __init plic_edge_init(struct device_node *node,
 				 struct device_node *parent)
@@ -483,3 +482,4 @@ static int __init plic_edge_init(struct device_node *node,
 }
 
 IRQCHIP_DECLARE(andestech_nceplic100, "andestech,nceplic100", plic_edge_init);
+IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_edge_init);
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
