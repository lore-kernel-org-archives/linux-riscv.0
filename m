Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CF0C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 18:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMkq5BHxnMzmr6ukiaRCGyMt/OcYjYhWvO8YsnR/EGc=; b=xN0VnjC5VzL0L1
	cOFEuzs5xvccsOu6X1Ui26PecOlvAUELbU+VlYFaepY7MRZ0YzQ2Ds+eqOAGA1/UDHnCBGR6WHJoF
	r4tMmFSIth7AbZkXdtmcfs1/4O5+dHwviLVt3KqkGkSOxRsI5eKhmoAoHGNFdNVXsfnq8ujbdVD7q
	5/lHmFcZDnRUQudcDmjBxUNxVngQwqATgmHaVPbbUN6GGmMjhvZMyUc9Py9Ey3w5ZHvRK8G1A+9re
	4JP9+rUic9kNTsKhSIQt/Ag5IAyfxQu0rg5K+LmJ7a8TedsC4F2gl0RXuYDFIyMEWlUCjCH/qx4q/
	6Y7gBPbPs7llxeRClO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUR-008VQd-18;
	Thu, 04 May 2023 18:15:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUO-008VPk-0P
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 18:15:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B8C74635A4;
	Thu,  4 May 2023 18:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F164C433D2;
	Thu,  4 May 2023 18:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683224135;
	bh=bRs7J4f34G8kawlGhlKbnXWQPdGtTPzbSOGb3QMR/sg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GsnvLZutn/QZxNE3+xXh4pOzodr0smHZey7bOje5G3+yCTsreIVqKQUXk86byEP9f
	 dWe9EU0sb5+T8DqYizYk2mYMaAEKwaCAr1NWQF/I1i2SHl2roqnQsOqTwYy0FbUnrR
	 1eaAZ5PkL9H2LpXRAiGu+XuUUXACfyQ54GY9VR0yfsrLC1TVkiIbAcvH872F8hQ2Vj
	 tc8PbqbXrT3z6fDC75ipKL3P05VdCeWpH5gfId5T/Wsd5EHiXE/diTNvSBgqym0D6P
	 F1B6/0enxiw5xXuZJzMum2FVm5Xdi3D5nNP8HPgdb/MXQk2teT9jt8KDdXUDLl8Jom
	 iTbN4TCK1C6uQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v1 2/7] RISC-V: only iterate over possible CPUs in ISA string parser
Date: Thu,  4 May 2023 19:14:21 +0100
Message-Id: <20230504-simple-chant-c33c14cc9e4e@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
References: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2334; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=mi7xLokjgaadV28078ayulYwgY2St3rJD+0UZHLOoxA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnBX/+pHvhnYKvuc/vX1Au11eamU5U7lTrfWRfFzZUW1 OH603i8o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABM5qMPIcMo3RFBHj7mynP3I 1Hfyz0NrAyQmnjdflLTa766G5ooqD0aGTXEpz28vY3jNbrHYctukc8y/p3Gs/pS5ff10i3WzHsr cZAcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_111536_239945_7AB654F4 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

During boot we call riscv_of_processor_hartid() for each hart that we
add to the possible cpus list. Repeating the call again here is not
required, if we iterate over the list of possible CPUs, rather than the
list of all CPUs.

The call to of_property_read_string() for "riscv,isa" cannot fail
either, as it has previously succeeded in riscv_of_processor_hartid(),
but leaving in the error checking makes the operation of the loop more
obvious & provides leeway for future refactoring of
riscv_of_processor_hartid().

Partially ripped from Sunil's ACPI support series, with the logic
inverted to continue early on failure.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 00df7a3a3931..3ae456413f79 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -12,6 +12,7 @@
 #include <linux/memory.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
@@ -99,7 +100,7 @@ void __init riscv_fill_hwcap(void)
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
 	unsigned long isa2hwcap[26] = {0};
-	unsigned long hartid;
+	unsigned int cpu;
 
 	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
@@ -112,15 +113,19 @@ void __init riscv_fill_hwcap(void)
 
 	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
 
-	for_each_of_cpu_node(node) {
+	for_each_possible_cpu(cpu) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
 
-		rc = riscv_of_processor_hartid(node, &hartid);
-		if (rc < 0)
+		node = of_cpu_device_node_get(cpu);
+		if (!node) {
+			pr_warn("Unable to find cpu node\n");
 			continue;
+		}
 
-		if (of_property_read_string(node, "riscv,isa", &isa)) {
+		rc = of_property_read_string(node, "riscv,isa", &isa);
+		of_node_put(node);
+		if (rc) {
 			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
 			continue;
 		}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
