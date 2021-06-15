Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4397FC48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:52:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F339561246
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F339561246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpbxRAePifCGaGEQa/42rp+YFXPgQNuhcYcTagEUqt4=; b=l0m5xhzo2aOYPC
	NZMe69yajkO4NLrVc7RPvQWQrRzDO5zIAsQ80JpNoltp8AaaOc/F0nzVuWn/lnb6iz+lwgO+8/HKU
	8WD+wWiIjUPQDBaiwRzR0rfhQWuuNMmsfhwyaPmRe9DH8HIWAekkaGOu7ULPycHWb6R9uiZAZFCgO
	COy/gOjfbnFK9jiGkA3pmVmm5bsGZOxTc7GdS9kM3melwCT2F+NpCXuDPA6qobwdkULcel+X79CG5
	SyIVQusuCmLiGzvQkCchWTp5iBmL9q1kZAwJ/3NGUDFE1zKJcm6EdTWa/b8oUttpFTfhzt294TCiI
	zfzWU7m5XKpgcdsbED8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGyr-003KUJ-Tv; Tue, 15 Jun 2021 21:52:21 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltDdD-0023Nt-94
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 18:17:51 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:bda0:7de0:767e:26f9])
 by michel.telenet-ops.be with bizsmtp
 id HWHf250034N5gS306WHffn; Tue, 15 Jun 2021 20:17:42 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ltDd4-00HYOR-Hd; Tue, 15 Jun 2021 20:17:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ltDd3-005qAT-P4; Tue, 15 Jun 2021 20:17:37 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] arm64: kdump: Remove custom linux,elfcorehdr parsing
Date: Tue, 15 Jun 2021 20:17:27 +0200
Message-Id: <169c69d085fc235592208d4669785a3f94248f28.1623780059.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623780059.git.geert+renesas@glider.be>
References: <cover.1623780059.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_111747_501988_91357D82 
X-CRM114-Status: GOOD (  10.76  )
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

Remove the architecture-specific code for handling the
"linux,elfcorehdr" property under the "/chosen" node in DT, as the
platform-agnostic handling in the FDT core code already takes care of
this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/mm/init.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 6e1ca044ca907cd0..af06bfb6e2838d0f 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -125,25 +125,6 @@ static void __init reserve_crashkernel(void)
 #endif /* CONFIG_KEXEC_CORE */
 
 #ifdef CONFIG_CRASH_DUMP
-static int __init early_init_dt_scan_elfcorehdr(unsigned long node,
-		const char *uname, int depth, void *data)
-{
-	const __be32 *reg;
-	int len;
-
-	if (depth != 1 || strcmp(uname, "chosen") != 0)
-		return 0;
-
-	reg = of_get_flat_dt_prop(node, "linux,elfcorehdr", &len);
-	if (!reg || (len < (dt_root_addr_cells + dt_root_size_cells)))
-		return 1;
-
-	elfcorehdr_addr = dt_mem_next_cell(dt_root_addr_cells, &reg);
-	elfcorehdr_size = dt_mem_next_cell(dt_root_size_cells, &reg);
-
-	return 1;
-}
-
 /*
  * reserve_elfcorehdr() - reserves memory for elf core header
  *
@@ -154,8 +135,6 @@ static int __init early_init_dt_scan_elfcorehdr(unsigned long node,
  */
 static void __init reserve_elfcorehdr(void)
 {
-	of_scan_flat_dt(early_init_dt_scan_elfcorehdr, NULL);
-
 	if (!elfcorehdr_size)
 		return;
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
