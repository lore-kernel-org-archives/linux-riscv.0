Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F05606A6B9
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sh5SZ7D3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=K5f7lKnd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2DIAHSPlthfqVZKGWUpAzIy0qv6qY2a1PuA0iGJAaTM=; b=sh5SZ7D3oBWjY/gk9Sotfdts59
	+JCBXx8v6+eS+v+QguFocLD0tViN2tX4MmyhmAv/JsZUg/5dNnaW/lN8r6MdK6+K0BUQ821D9t5lg
	wNb0q70JjeSBdht0gAjDVPSEeJ8Ne/JziL5q2veJKzslePre3+NdZhH591NEKVvnBVQFe5g1dQIpO
	41aGtg02ujcqGDAoEzOdrxLj2AsD0RdgYIjA21sSV9S/Ff88stotrMyl5zJ82AjTYYP4jnSfRXn1Z
	UJFfsD+CdCu6Ztd9C6jAaYun5J9Yx7rdEfhVonzHuSjSGUPn0i1P8BE6GJlSvJSy9ZM5rCsxBIHs3
	q8Ly90sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHBc-0000000Apw8-4BgV;
	Wed, 25 Nov 2026 17:53:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAY-0000000Ao2Y-2PlB;
	Wed, 25 Nov 2026 17:52:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B24084E40B00;
	Wed, 25 Nov 2026 17:52:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8543A60480;
	Wed, 25 Nov 2026 17:52:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36F4D11E6B0D0;
	Wed, 25 Nov 2026 18:52:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629150; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ixszZ7M0PTlVyltcKUJakePlFubDowyK1dd2rUosb7c=;
	b=K5f7lKndckyVqW7Oldk429u4bv4WzY7Lj1lCMkhTI/QOdQr/M87qeBuLpSAFZQUr+8xpl5
	loh0VZBh2Fm2JaBcNjnlEOq91CpycSzoMnzKKE6e50Dg70I0ydm32AlBhvhypCjWu+8vdk
	hU6H7TWfF2PZjJawR4wTFH7ZZvIw+gnWs5PFfl4dTgknS4z8MeldZPh7JWxNo2KUqy20Ig
	LeIuWWuLCeYQzPUWfLiMJvjhNUw94ohk26HqHQbttU/vVfU2FTf2azJ2Cyx/wuLVe7FAA2
	JGPFzq96IcuSF2HZAiSCxemes67V2qyv7kJnf2BdhG33b0mWY9F30Yn+qgRBug==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:23 +0100
Subject: [PATCH RFC 09/16] spi: microchip-core-qspi: Consume dummy cycles
 directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-9-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Han Xu <han.xu@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_095237_787957_CECCA238 
X-CRM114-Status: GOOD (  11.01  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The spi-mem layer is now capable of providing the dummy phase in cycle
units rather than bytes, provided that drivers advertize the dummy_cycle
capability. Since this controller is consuming cycles and currently
converts bytes into cycles, flag it capable to consume cycles directly
and drop the extra conversions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-microchip-core-qspi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-microchip-core-qspi.c b/drivers/spi/spi-microchip-core-qspi.c
index c0ea65014d2e..2fc1df738062 100644
--- a/drivers/spi/spi-microchip-core-qspi.c
+++ b/drivers/spi/spi-microchip-core-qspi.c
@@ -420,7 +420,6 @@ static int mchp_coreqspi_setup_clock(struct mchp_coreqspi *qspi, struct spi_devi
 
 static void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi_mem_op *op)
 {
-	u32 idle_cycles = 0;
 	int total_bytes, cmd_bytes, frames, ctrl;
 
 	cmd_bytes = op->cmd.nbytes + op->addr.nbytes;
@@ -459,11 +458,7 @@ static void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi
 	writel_relaxed(frames, qspi->regs + REG_FRAMESUP);
 	frames = total_bytes & BYTESLOWER_MASK;
 	frames |= cmd_bytes << FRAMES_CMDBYTES_SHIFT;
-
-	if (op->dummy.buswidth)
-		idle_cycles = op->dummy.nbytes * 8 / op->dummy.buswidth;
-
-	frames |= idle_cycles << FRAMES_IDLE_SHIFT;
+	frames |= op->dummy.ncycles << FRAMES_IDLE_SHIFT;
 	ctrl = readl_relaxed(qspi->regs + REG_CONTROL);
 
 	if (ctrl & CONTROL_MODE12_MASK)
@@ -601,6 +596,7 @@ static const struct spi_controller_mem_ops mchp_coreqspi_mem_ops = {
 
 static const struct spi_controller_mem_caps mchp_coreqspi_mem_caps = {
 	.per_op_freq = true,
+	.dummy_cycles = true,
 };
 
 static int mchp_coreqspi_unprepare_message(struct spi_controller *ctlr, struct spi_message *m)

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
