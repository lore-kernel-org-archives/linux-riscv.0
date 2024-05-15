Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE24C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 16:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+WdmYU2H+/Uty0XHYToRHnSPOP5ZB9is6p2IjwuWiQU=; b=HZ2bqcbFKzDtZz
	s443rfUTVuyCWAe6XlVgcGZj9Xus9+1DoLLPFEwOwMJWLps3RuvsqRlXBSbq+Hap4cEVeaKdfoHiL
	K6iB92Y/9yhan/NYFmLHq8TnN/W/xSqmr7npyUw8qMYf5pJAmUieuHnnhoNn+gc0c096+14OwQzYs
	hztmSlIUug30CA/EDjuYoK3Bb1lQCvFRdOwCgwT2sClsvCYUAYLRUYh1fIwroxMjUayvlOzqYXmDd
	8RkQY3dwpsCtD20yP0I6K8tUZJe2pRvnVFIKcgEs1U51nAHo5eD9k9OIaibvBoAHUYxxyQiGC+eyv
	G0KMliVtBDYBEfmtYhXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7H5g-000000022NW-23sL;
	Wed, 15 May 2024 16:02:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7H5c-000000022MX-3cBc
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 16:02:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1D1E2CE1396;
	Wed, 15 May 2024 16:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2C2C116B1;
	Wed, 15 May 2024 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715788963;
	bh=AFgzPFaBHoRhzogGDzm865PJZzrfFEUfkq5R7FJmT2Y=;
	h=From:To:Cc:Subject:Date:From;
	b=dphlepJNhL0bOPCUtBmG4GlrBuXCoF/B6/azMgXpEC3VX/xg0rSrFYAGn56s2/A7m
	 QErfAf5aceJk50052JVAU+fiYyAYohWIAnoSzl1SrT2rNYTBaz4i0Sq3XWBzAykNZR
	 6fK966EJ3cyu1Dmabgti8rXPi4tVKXLp7X3tesxr0HfTR58IFAxhaQeO6ANisZPq9/
	 RxhRm8PxdC8V97yW+LSMUPqAsxGpWBJxCAloqlNWZZ+S1tSnLhEyBgGYvP8l4bgDsd
	 ZJlrEUHZhG5KzqFLnwKh4rdvq2VKsokk42gEM36jHCXzvlbY0CIz6yhzIfVRmVDVWU
	 gDfswjliJ9JJA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] RISC-V: fix Andes errata build issues
Date: Wed, 15 May 2024 17:02:28 +0100
Message-ID: <20240515-shimmer-retake-37033de08096@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=MhlCDrRGZxXwwiDuOFsO1SNCrGR0xpsno+lxxYP+x90=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGkud6Zuv7D4usZkNhOR7y6dXWc/rDj29tyiPyvefJ/lW 97krn2bq6OUhUGMg0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQATudrK8D9n38V9H/Y2qKVP N352/lgV4+uQdfO07ysvS/1Y3O39IfwUw1957dcip2ZLckvazGkS8iwMeBHbcfuxEvMZeZegrp1 Vf7kA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_090250_089033_A3E1F967 
X-CRM114-Status: UNSURE (   8.56  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Commit Fixes: 589e2fc85850 ("riscv: Convert xandespmu to use the vendor
extension framework") added includes for the new vendor_extensions.h
header in the T-Head and SiFive errata handling code but didn't do so
for Andes, resulting in allmodconfig build issues.

Fixes: 589e2fc85850 ("riscv: Convert xandespmu to use the vendor extension framework")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Charlie Jenkins <charlie@rivosinc.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/errata/andes/errata.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
index a5d96a7a4682..fc1a34faa5f3 100644
--- a/arch/riscv/errata/andes/errata.c
+++ b/arch/riscv/errata/andes/errata.c
@@ -17,6 +17,7 @@
 #include <asm/processor.h>
 #include <asm/sbi.h>
 #include <asm/vendorid_list.h>
+#include <asm/vendor_extensions.h>
 
 #define ANDES_AX45MP_MARCHID		0x8000000000008a45UL
 #define ANDES_AX45MP_MIMPID		0x500UL
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
