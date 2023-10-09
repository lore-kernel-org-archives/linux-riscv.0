Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9988DE95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 08:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XUuR1Zhhc+oNpE1Pykj+D+jD4UBMFTmEg4t15mOfhAM=; b=rcfkFqaSigN2HE
	WmdQ2Lk/3qFrPNdAYdJPqCwWqNafl5cAgJ8ybNFBb/Fm0O9ukhnh3h66/pF6FjN/uTEH2t/QXxUod
	QDTo4qe3hyU1BJW+bVEAqIqaevQcMSCp7emzZxwkFkahLRTuDj+5h5jOffERWVe72jgBufRMz+9+R
	xglW0AKX/2pcMDRCrH9u0yzUe6lub7PN7c6fARP9MU41IQtrk+ZizSyQtYggGWRm7nKyLkMQFtMrf
	RBXLsd9mrdyOfV8hkILo1++7teLkvfpP53k5G1cvjy7/kdgbc9ztWvT+O3wbv7CJxfv/AzcJWPIuG
	I8MSsO4CmFWfYMQ2Lgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qplN0-009x8u-1c;
	Mon, 09 Oct 2023 08:12:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qplMw-009x7s-1K
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 08:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696839123; x=1728375123;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E3CND1oVozdmN9W0JejJjJ0D+lE+Z95291t40RDveyk=;
  b=r6u+Rgc0EUc7JDA3HagBDWNil0NvK64/PQCROKC2qD/WcNzRIHy3bFZo
   fma1uht4cWtueicALhpwXlLqtx5V+xDxc3BFkx1dpNN0IfE0qDWvVVOAC
   uakS6Nf/y8IGd1FHBtlYcaCA8uNYprHHXxXvgzOhwthfTh7EZOLHg8nHk
   upmgSoNJYhPjv+GTR02wBmfkZb6GvLdnz6d44LQEm+E54FmkxkiuW19oj
   hdS3Ddsrnk86IbsKt+X1bwpm4nf+JjFq0xpY9xY5V5ia5aCSq7TTd79vQ
   9Itx2dtHpGcVE7JYEykeMVZ6EwbOS5s9sjyt14hJUYGRfhetlcw0rdse1
   A==;
X-CSE-ConnectionGUID: XpXTSLP4Ty6wgcE8HJnZgw==
X-CSE-MsgGUID: yVezVkv5TO2viORuFs6tnw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="9261218"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2023 01:11:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 9 Oct 2023 01:11:47 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 9 Oct 2023 01:11:44 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-renesas-soc@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Randy Dunlap
	<rdunlap@infradead.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	"Magnus Damm" <magnus.damm@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "Lad Prabhakar"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH] soc: renesas: select ERRATA_ANDES for R9A07G043 only when alternatives are present
Date: Mon, 9 Oct 2023 09:11:16 +0100
Message-ID: <20231009-sandbar-botch-0f398fd2e289@wendy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=E3CND1oVozdmN9W0JejJjJ0D+lE+Z95291t40RDveyk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnKWxdas1qKH/XSOb61bOl0g6X/+VtfGpRu+1zZzRZ8eHLs XIPtHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIjXRGhiadnbuvN0UoHa+p3dK8Om +5MPdH/h3CKgHam3+nuj0un87wvy4039TNcUHL6SjF8Nh7SeIxv6rXy/sxJqzr3zaV90ESCwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_011202_566991_89F8853F 
X-CRM114-Status: GOOD (  11.66  )
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

Randy reported a randconfig build issue against linux-next:
WARNING: unmet direct dependencies detected for ERRATA_ANDES
  Depends on [n]: RISCV_ALTERNATIVE [=n] && RISCV_SBI [=y]
  Selected by [y]:
  - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && RISCV_SBI [=y]

../arch/riscv/errata/andes/errata.c:59:54: warning: 'struct alt_entry' declared inside parameter list will not be visible outside of this definition or declaration
   59 | void __init_or_module andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,

On RISC-V, alternatives are not usable in XIP kernels, which this
randconfig happened to select. Add a check for whether alternatives are
available before selecting the ERRATA_ANDES config option.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/all/09a6b0f0-76a1-45e3-ab52-329c47393d1d@infradead.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: linux-renesas-soc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
---
 drivers/soc/renesas/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 7b74de732718..a97bf8e897cd 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -343,7 +343,7 @@ config ARCH_R9A07G043
 	select ARCH_RZG2L
 	select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT
 	select DMA_GLOBAL_POOL
-	select ERRATA_ANDES if RISCV_SBI
+	select ERRATA_ANDES if (RISCV_SBI && RISCV_ALTERNATIVE)
 	select ERRATA_ANDES_CMO if ERRATA_ANDES
 	help
 	  This enables support for the Renesas RZ/Five SoC.
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
