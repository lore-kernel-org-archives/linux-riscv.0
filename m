Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD396070F54
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 14:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B2OKmOLH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KqziPh8l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sxPDRsXZ5eqTDfCz/6yT8g2uun5A7/HkT4sc3TEsPr8=; b=B2OKmOLHhJEcuig3XzwLHamr7q
	9EOE4OEfudw/uBJtXRqG2ssN+Jswuw3vjAsCkmRlZVRi4ikG6xJcHLk7672XDEvS/9TOyhoCjEyQH
	jzdx9H5ykkMbb6be3gjWTVm1yBm1VsxihHH2aaXuk6mgsiOK9vZAlJI81/tgyvfRRQ03iqu3vYHhw
	SgrX0v0ZDrlJCpV6FV4oAaP7JCpgYHxCCtNz1wZSW9gxM5gY5Xt5iJg+8XNfvv+7JyJhE50okHs4I
	Uc3NE0QmEELRrN/SJ7AowuwAUxlZlQ31I4dwpWV7NQkpghWj3sxxQq6GOWDfByIFfiBvtNecwrA9d
	+KFTJuSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwsC-0000000GNsJ-32dD;
	Fri, 27 Nov 2026 14:24:24 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwrv-0000000GNSU-133L
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 14:24:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 429AAC2AC4E;
	Fri, 27 Nov 2026 14:24:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72CDF6049C;
	Fri, 27 Nov 2026 14:24:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C07811E69006;
	Fri, 27 Nov 2026 15:23:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789439; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wxfJPUKHoAB+1K3wnXPXnqak814WKCu5TUfSaAEjIso=;
	b=KqziPh8ltiM8u5+b6eKfqHjpZwwL1tuSrz9B43KqmDBcTFYtGFxkYvIYsXji0ngHmJfQMz
	HMYknla3frw6GZAIimkPVVve5WfMCll0ltxhioVlYXjqQK8QDtC+0X4nyAizs1G2E8mjSx
	QEmiP3NpEAk1JuFMrlPs/jHoMSE3uRpjOgOXUHCyiijgIHx9/ZQG0DU/2WZILymrbq1sRP
	qgX5ttf/7/I1Ei7RuCVq0X1p4AtlqgzQ5mCqeZFZYv+l14QKJWryXuh/kRwtSZXUH+2o/P
	Br+32uJQRsmzsk7ElCYdt/m/ZNr1crLvAtt1D58vA61ocIx1A+3fg26Xcipd3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 27 Nov 2026 15:22:27 +0100
Subject: [PATCH RFC v2 05/35] spi: spi-mem: Sanitize mixed buswidth
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-macronix-upstreaming-spi-mem-cycles-v2-5-5c93f5e5d630@bootlin.com>
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
X-CRM114-CacheID: sfid-20261127_062407_452040_656E4636 
X-CRM114-Status: GOOD (  10.08  )
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

Buswidth is allowed to evolve over phases. Many controllers strictly
apply the settings passed by the core. In practice for an X-Y-Z
operation where X, Y and Z represent the buswidth of the command,
address and data phase, respectively. We do not support:
- Y < X
- Z < Y
- Z < X

Make sure those conditions are sanitized early by the core, to avoid the
feeling that these needs to be checked in controller drivers. The
implementation also covers the dummy.nbytes case with the same logic.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 25f795d5e9ba..a1f129c47698 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -216,6 +216,15 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 			return false;
 	}
 
+	/* Bus width can only grow across phases, ie. 1-4-1, or 1-8-4 are not allowed */
+	if ((op->addr.nbytes && op->addr.buswidth < op->cmd.buswidth) ||
+	    (op->dummy.nbytes && op->dummy.buswidth < op->cmd.buswidth) ||
+	    (op->data.nbytes && op->data.buswidth < op->cmd.buswidth) ||
+	    (op->addr.nbytes && op->dummy.nbytes && op->dummy.buswidth < op->addr.buswidth) ||
+	    (op->addr.nbytes && op->data.nbytes && op->data.buswidth < op->addr.buswidth) ||
+	    (op->dummy.nbytes && op->data.nbytes && op->data.buswidth < op->dummy.buswidth))
+		return false;
+
 	if (op->data.ecc) {
 		if (!spi_mem_controller_is_capable(ctlr, ecc))
 			return false;

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
