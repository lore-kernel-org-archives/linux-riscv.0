Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEB3C48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:52:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A881611AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A881611AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNynIcir8teegOx9vGR+muEuvOx86fxwmaKKOw3YqGA=; b=s2NnWcC4Ak3D4O
	B4m44aPPHc79qOY2csu/K9rs6e3kkXoHHonY7N/Oy50FlkABgYWSNuCwOA3tm0Krdslhpvs5Yh8CC
	U5+yKEF5VlExpV0wNZpHhK56qdgdgA9n/WGLjOp5TxYKMXPGvhPNdPldCxVZV4ZvYbg4EXx2ZbN7W
	Qt3itzeGW6Ht3S+434wI4NOdOAXWSl3pM2t1RAfvEarnGkDmJZuTCDDNQ+c/f8lS2wpiM58kMiVpt
	nZJCOGoa6odOhvO0FBuzc4pOPqNfsxoIsU/VUsHqprsPdPT4gCBQ4+kMuKMFfIci71KHUdXZmVwc/
	ne9N6kBgIhdY1Wy7R2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGz0-003KXM-L4; Tue, 15 Jun 2021 21:52:30 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltDdD-0023Nf-Ja
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 18:17:52 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:bda0:7de0:767e:26f9])
 by laurent.telenet-ops.be with bizsmtp
 id HWHe2500T4N5gS301WHe97; Tue, 15 Jun 2021 20:17:42 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ltDd4-00HYOQ-8S; Tue, 15 Jun 2021 20:17:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ltDd3-005qAN-OS; Tue, 15 Jun 2021 20:17:37 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] riscv: Remove non-standard linux,elfcorehdr handling
Date: Tue, 15 Jun 2021 20:17:26 +0200
Message-Id: <bcc5c666f4ada9a8bbc26f559751f0da67f769f8.1623780059.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623780059.git.geert+renesas@glider.be>
References: <cover.1623780059.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_111747_809246_FEC21122 
X-CRM114-Status: GOOD (  12.72  )
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

RISC-V uses platform-specific code to locate the elf core header in
memory.  However, this does not conform to the standard
"linux,elfcorehdr" DT bindings, as it relies on a reserved memory node
with the "linux,elfcorehdr" compatible value, instead of on a
"linux,elfcorehdr" property under the "/chosen" node.

The non-compliant code can just be removed, as the standard behavior is
already implemented by platform-agnostic handling in the FDT core code.

Fixes: 5640975003d0234d ("RISC-V: Add crash kernel support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/riscv/mm/init.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 6fd36af52a8520b3..2c5c8a24199002a3 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -839,26 +839,6 @@ static void __init reserve_crashkernel(void)
 }
 #endif /* CONFIG_KEXEC_CORE */
 
-#ifdef CONFIG_CRASH_DUMP
-/*
- * We keep track of the ELF core header of the crashed
- * kernel with a reserved-memory region with compatible
- * string "linux,elfcorehdr". Here we register a callback
- * to populate elfcorehdr_addr/size when this region is
- * present. Note that this region will be marked as
- * reserved once we call early_init_fdt_scan_reserved_mem()
- * later on.
- */
-static int __init elfcore_hdr_setup(struct reserved_mem *rmem)
-{
-	elfcorehdr_addr = rmem->base;
-	elfcorehdr_size = rmem->size;
-	return 0;
-}
-
-RESERVEDMEM_OF_DECLARE(elfcorehdr, "linux,elfcorehdr", elfcore_hdr_setup);
-#endif
-
 void __init paging_init(void)
 {
 	setup_bootmem();
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
