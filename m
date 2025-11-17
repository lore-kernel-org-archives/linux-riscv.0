Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57ABCEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 15:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybDjC11stCHYxOl1iw+BBPRnff6rMDjosONnvqIPvDM=; b=TnfrSq+O8duWXk
	Eb/NFscVXp6ywuFUtLwpTmNb06JFQ+M07fobg5ySR+FjURYn0k0ZYZAV7HlyBLm/70V4GIt2lIw9j
	4WQnhQVHsdwRscC6MGl00aAqpknwLLmbfPot8fou9JccJabZ4BVMTHR+u/nbbpKumajAuHNpT7axt
	AYfo30FRME/VMukSqUg/r0mdvVdI4zDs1cTvOLmijLV7Y8ez7hfRGWvDio0tsskAqb/BHSKpXkmnP
	g4IUF/IGiRG2IEXnvtRUaso/rT5EhOLB3k8OE8ZaX9SvUHkwlw5p5pWj86WQ+EQPPWlXt5zsiz/Bd
	hiMhlJ56BSdTIN/fFutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1S2-0000000GLoP-1rhT;
	Mon, 17 Nov 2025 15:47:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1S2-0000000GLoG-0EY0
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 15:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BE6C6023A;
	Mon, 17 Nov 2025 15:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C280BC19423;
	Mon, 17 Nov 2025 15:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763394452;
	bh=O7RWd2RNsJQ/yJb0uVw5IQViefyvHl39nqv+4xOuEPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZRD4iuCarUzxBRaBnuTC602o5vAuzZGq4hybHLLBHO/3a9tkbk/4a5jcaE0uaZma0
	 U+0Kt0LrVMhwEoqAYB8h34XrW6jD70lSSehVBHZzt99z+rJ/z56AfG227T72tnLVQE
	 VgiDqvzvcijJRqxTS+FpL7YDzwi34ZD/x+0W4j7G/Y8vNsK5+PjKWtRDV2ilm94JQ7
	 026QTd/KBBuGPPFx1GRHMaW6bT6cS3JpAL67BPkM4qKeLbkZwEpGY9bJeP8uNIfCbW
	 sCCPQRSQagXOvhTkRaBFw6d6kkFa+cEk3FDWB+CvvgQHfz2BASSXRCzUnx7kerSBB8
	 MGcWf33AC21Gg==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 2/2] mailbox: mpfs: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE
Date: Mon, 17 Nov 2025 15:46:56 +0000
Message-ID: <20251117-landline-grit-284cd8d6330a@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-screen-appointee-837a7296ca91@spud>
References: <20251117-screen-appointee-837a7296ca91@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=mmmDslZJHTrotXDe/3DO8bgQq1j/1loTEphrINLp7lU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSzrkugtn3O1bvLJDap8iTsl6x33zJB1brU6+s67eYx 9wU+hnUUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIloKjD8910YM6O4LDpvxvbv O/NUT8geZ1W6/UyrzdQw3PiNpHeoJyPD+nxdycO2AnekKmdtDrDs2Hs+/H3srSyRo9PiNkacdeF iBAA=
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

The ARCH_MICROCHIP symbol has been defined for some time on RISCV, as a
replacement for ARCH_MICROCHIP_POLARFIRE since there are now other
Microchip RISC-V products. Drop the POLARFIRE from
ARCH_MICROCHIP_POLARFIRE in the POLARFIRE_SOC_MAILBOX Kconfig entry
since the newly added pic64gx also uses the mailbox and it is one of the
few users of ARCH_MICROCHIP_POLARFIRE left in the tree.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org

 drivers/mailbox/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 29f16f220384..35bd402cadc9 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -199,7 +199,7 @@ config POLARFIRE_SOC_MAILBOX
 	tristate "PolarFire SoC (MPFS) Mailbox"
 	depends on HAS_IOMEM
 	depends on MFD_SYSCON
-	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	help
 	  This driver adds support for the PolarFire SoC (MPFS) mailbox controller.
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
