Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A23FF8868
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 16:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttxs25amB+nVy8NiAo97YfMDAX0jcb72gUWLeqcdzRM=; b=r1E5tCVQYEG0Qk
	F4kTH8OcC7lBBWj/msj8+W0C6leqbVWzRE3KZ9OZ5fzYU3pUtboP1DU1f0DBnvmGSBR1kB6ShsOp7
	rYIaJpiHsXfdDFOQF46718q3ASFQe3VA4MFvabq86BUjlOX+zScn0K2Ny9Qz9eH34E/nPrJzDwhBg
	Ei4mekduknphlJLqdb3X0aNBf3PEFZCO/Sj8S0WXdqb2ooGivIJiF/Gwfm5Zu4nv+tt4W9WIcbcJP
	Gs0+qLBPZvIejxNb14KTZhEy2EJCLoU5dErSNbzh2mBkSwv8J607fEYCRWoEHy6rNWpi9Ztcr0bJQ
	AbCyKEXYI9g1ap/By1ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl3E-00000001sLr-0hlI;
	Tue, 28 Apr 2026 16:12:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl3C-00000001sLI-3Sqt
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 16:12:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AFEF60008;
	Tue, 28 Apr 2026 16:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B8EC2BCAF;
	Tue, 28 Apr 2026 16:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777392762;
	bh=dhffF3ZrJYq66Fq83zPDuRzj54IhmH5nUsYS1m4ih+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=osTcUcN2LylikR7wp+pHUM0f5BPypaqsCxDAv4lNwPeg6bvKUnv8V3vjCNQSPAxer
	 t2X7bg9YKhl+dF9Z5lgmYdc3iZEy8qeNItQa2kwaDguXMX0vSBCsxLfuDU0qSRTSWv
	 Vn+1qvWWMHzdP7Ty2EROcCHTH2OV5Oh9QcW5h14Dx3iCekOWCLq/iOyG3ZzOJPYuvx
	 VtDMrKGhkCJw4ZqKRITnHarI1y9Uz/HV5uzwzZrzpruCZe/sMtux5ViTN9t8iDiT08
	 ljCmQcVsSLVNiTXkM/8DgqKpA+9uY2wDnoqALkpmmDGwwK/jugci+OCg70wGnPFInW
	 nE6AAh6nxoMfQ==
From: Conor Dooley <conor@kernel.org>
To: broonie@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] spi: microchip-core-qspi: remove some inline markings
Date: Tue, 28 Apr 2026 17:12:07 +0100
Message-ID: <20260428-acting-yearning-24bfa6d66c7e@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428-plexiglas-smith-6ae4e9ba8abd@spud>
References: <20260428-plexiglas-smith-6ae4e9ba8abd@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1848; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=/xpbTb3+/lPBLIXkcANfDJ1Gn4CZegvxDmd2/FsdDZk=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkf7iTWWf5Zw69usvn0twVldVf4/848NO+Z6Q+9mqYbd 56ukxH/1VHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJzJBjZNh5gS1BmvHYgVVJ +Yk3ltxgFexL0blwu2bxe41iR4YrEhsYGd5feq1stOfEtpPFN0NXahVpmm79HCj5ok9M1brER4G 5hgkA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

Remove inline markings from a number of functions that are called as
part of mem ops callbacks. None of them are either particularly trivial
or sensitive to overhead of a function call. Just let the compiler
decide what to do with them.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/spi/spi-microchip-core-qspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-microchip-core-qspi.c b/drivers/spi/spi-microchip-core-qspi.c
index dd3644ee80c6f..d15cf5664da5e 100644
--- a/drivers/spi/spi-microchip-core-qspi.c
+++ b/drivers/spi/spi-microchip-core-qspi.c
@@ -200,7 +200,7 @@ static int mchp_coreqspi_setup(struct spi_device *spi)
 	return 0;
 }
 
-static inline void mchp_coreqspi_read_op(struct mchp_coreqspi *qspi)
+static void mchp_coreqspi_read_op(struct mchp_coreqspi *qspi)
 {
 	u32 control, data;
 
@@ -236,7 +236,7 @@ static inline void mchp_coreqspi_read_op(struct mchp_coreqspi *qspi)
 	}
 }
 
-static inline void mchp_coreqspi_write_op(struct mchp_coreqspi *qspi)
+static void mchp_coreqspi_write_op(struct mchp_coreqspi *qspi)
 {
 	u32 control, data;
 
@@ -264,7 +264,7 @@ static inline void mchp_coreqspi_write_op(struct mchp_coreqspi *qspi)
 	}
 }
 
-static inline void mchp_coreqspi_write_read_op(struct mchp_coreqspi *qspi)
+static void mchp_coreqspi_write_read_op(struct mchp_coreqspi *qspi)
 {
 	u32 control, data;
 
@@ -422,7 +422,7 @@ static int mchp_coreqspi_setup_clock(struct mchp_coreqspi *qspi, struct spi_devi
 	return 0;
 }
 
-static inline void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi_mem_op *op)
+static void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi_mem_op *op)
 {
 	u32 idle_cycles = 0;
 	int total_bytes, cmd_bytes, frames, ctrl;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
