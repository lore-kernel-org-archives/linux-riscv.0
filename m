Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D43606A686
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wqym+VkV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kbYY6Pjj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XaxpBtto
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BA5iuUNl0t8isaioBQMMVuR0luqqqSwpFz4nPMXFtHQ=; b=wqym+VkVeFiBOndlUsA89HTlPm
	IyY0+JiWUAP0nSf7lVuGjffoiqLOpyXgSiKpNxn6bqtfknKnSZMCpveh/TylB6g7NgDVgJePfTIAM
	zH4q/BRLE9/wQmP0I/X9Pc2nUsJH++FeGdCNaFgSO6qzWgvjF/FVRFm0CaFH3KuCuH8px1SBBwykV
	WJc9Ga/0YFc9CqNda2BdhTFDCp7OdS/eYVFYYPKy2NsIMnAzraMu58/6J2pygVdmEpV67VsYAuN30
	ritRmwkAKALhYijX5BNiilEzMU7G04sOgMls8tnCP1fqhxBwB2sFd1j1QnQTdJRB8MqpshyUL0s5/
	98Qf3jwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwwP-0000000GVXs-1FfC;
	Fri, 27 Nov 2026 14:28:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwut-0000000GSuJ-1W6R
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Yz6ZHF4IiJQgqN5fGyCKopgkxnOtrQuXNS72mjrBGKo=; b=kbYY6PjjctnBXXgXi016VcnEwh
	23vvjeXmQwNdgcOS8TLBSdhmNG1Ye8mRZoPF11x9cbaKD9FFUmTZJryXfQVXBEMUb9I2aixApQNnT
	1y+wIEZWXViE6Dbg5FS+yLDCxuL4J3ImwfVhrr5mx1CUlG4hHqG5jfQvldCv1ZWYxH7gNqYcOhs+/
	yRG0hElGptqduLATwd14nLcPQpqAKblQdHcCPD8g+5SL66xvg6s+MLSYYo7FRqs/RPKWkNGfq2ZzG
	XOKnbIh/hrtNgGBVzOpR8K28uLBB4uOyYCjcrjdwnldWtEQjWU10iXiM6ozuwL7aBl5LFQUgQ1qpt
	sZWbKB1w==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwun-00000007nqz-3AcN
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 14:27:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A87F51A1838;
	Fri, 27 Nov 2026 14:27:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 739C36049C;
	Fri, 27 Nov 2026 14:27:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3B1411E68FF9;
	Fri, 27 Nov 2026 15:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789621; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Yz6ZHF4IiJQgqN5fGyCKopgkxnOtrQuXNS72mjrBGKo=;
	b=XaxpBttouWRivkGS5XBCoKMKjn9+r09abbOOcttCyqgQiDM47o2QC6SVNrFvwZBPSI60dJ
	XsMCzDDNjhx7H8L+HmQYdSmfxQGo0gWzZJ3aqyOs5wBZSk/O9s4UeoTuEluIkz7Kj4yfXD
	1MUrFpvv1HGNwcKhMLSZksf/tciwr2RDI12qctgPjNsotVQ24IADBG5mBAWgZ7Bw4xG9Sd
	RM6F+MsWSqAxEd27wlNxwmKGTOMQ0+PLCX9HURsBYqdGS0n8dwNyxveIh1us4fMaeyWf9u
	86oV9TcgN4S2eP+kPduNd4KKBgUcpBrfkkyNEVmiWZkMP7QRX/qgNpLcWdwTUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:50 +0100
Subject: [PATCH RFC v2 28/35] spi: spi-qpic-snand: Drop redundant check
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-28-5c93f5e5d630@bootlin.com>
References: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
In-Reply-To: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
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
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michal Simek <michal.simek@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 linux-trace-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_142705_665553_0B9D1AF1 
X-CRM114-Status: GOOD (  10.70  )
X-Spam-Score: -0.2 (/)
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

The core already sanitizes the spi-mem operations, this check is
redundant so let's drop it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-qpic-snand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index b03e2e4f0f0b..23f78171d27d 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1531,7 +1531,7 @@ static bool qcom_spi_supports_op(struct spi_mem *mem, const struct spi_mem_op *o
 	if (!spi_mem_default_supports_op(mem, op))
 		return false;
 
-	if (op->cmd.nbytes != 1 || op->cmd.buswidth != 1)
+	if (op->cmd.buswidth != 1)
 		return false;
 
 	if (qcom_spi_is_page_op(op))

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
