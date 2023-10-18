Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEFACDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 05:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGsCYe9xzSLbwtHHmNMiegcWdkZ4CTsoIKPBkXJ6EH8=; b=UAirzCzakpz327
	hqrDV1mpQLR1MnakhRXGbiU/rmRgdiiFKIRBx4E2VOBX1WhKZv94CTdaf3Vil1edFUgCDDBKin5zU
	oaMnuiY09aK94165ZeNT2jYLk8fUtx3mESmAinIjI5AVSEmqo4KUHXcQDvz0x23vILAzWKVebbH1B
	zU8JqZ8Ed/lsOggXaPoPppP/dgRh5T5QawCY3Ox51EKanfaXQQlnc+7M/530S5OvG/aIAIMk58Ya2
	A1qU8MrpV4fK+tSyvRlGGAmzDqJx0G/PPaJcj6nRImnGPGKGVQvOzpUK6soczoZ1GSs4haFTsdwGt
	ejeXFsWKavhu/uL3cYgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsz5G-00Dp4U-2r;
	Wed, 18 Oct 2023 05:27:06 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qsz5E-00Dp3w-1i;
	Wed, 18 Oct 2023 05:27:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 3/3] soc: renesas: ARCH_R9A07G043 depends on !RISCV_ISA_ZICBOM
Date: Wed, 18 Oct 2023 07:26:54 +0200
Message-Id: <20231018052654.50074-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231018052654.50074-1-hch@lst.de>
References: <20231018052654.50074-1-hch@lst.de>
MIME-Version: 1.0
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
Cc: Conor Dooley <conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, soc@kernel.org, Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ARCH_R9A07G043 has its own non-standard global pool based DMA coherent
allocator, which conflicts with the remap based RISCV_ISA_ZICBOM version.
Add a proper dependency.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 335251ff6e8214..624185e09c967b 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -341,6 +341,7 @@ config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
 	depends on NONPORTABLE
 	depends on RISCV_ALTERNATIVE
+	depends on !RISCV_ISA_ZICBOM
 	depends on RISCV_SBI
 	select ARCH_RZG2L
 	select AX45MP_L2_CACHE
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
