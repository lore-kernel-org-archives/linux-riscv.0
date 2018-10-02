Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09305C64EBA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:15:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A09D2064D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:15:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cQSFHPRw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="oNxoqq7k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A09D2064D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eyjaG+Gk3uHwiEr2aal1V5gfoK+lX1mxtl+C81UXK2E=; b=cQSFHPRwUXiD50p4ipkYTVq1or
	S7ozM/kkFIDYYM6ISblld5lOO8alfjX5nHtUpSyq3sH2rKE8eCyiIKIDkWaenM7uw06R7fkJL4oSr
	U8kE6XpnUiH8Zt3wDplyOisREteGumyWmR1gVMaC3lG2uMUyhbqwYhE0/MLBOWDLXB2LOGGwpfK8W
	dKDNptgeGdlg1RJOWbpIdCo0gvjU2rgFtkf9p2cOKSkLPal9U0HxiGmlDhFcGMxDhfnQ12ggBQZ15
	nKHK3MHrQb8AADh6tW8J0LW8NEcXQkdwnL2gKxACtGsSBtL6ViAHtj2Eq03rTWu4Nx1UlOCdhG+Kd
	mqmHmt2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Q8z-0005sn-KV; Tue, 02 Oct 2018 19:15:41 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Q8h-0004ir-2v
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 19:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538507724; x=1570043724;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=OuyFWfTkug3rB9AJbq2Ei8qu9NGd/jDUUCC71bRCdX0=;
 b=oNxoqq7kPCtFi+et45+yS+SEvcCr2sC9yj7B9skQhWmPY5CNYh1S4sVk
 7WFeEqCooH6vpdqB9wDFGbrCi4/F8Kk8PAkrCWdtIpptQMfzbxjZKFtCv
 BffH5R0k8GHzhGyPWhvZi2PvwCcopsGIJintkjd764A6reS7dYVK8+nT7
 4cB6z60IhuBdgCtDXpp0bigvgYhjjG7Pw7RZEZRieNgZUfdHVGxtR/l6/
 BFozrGEaVSTc1i4weSiNclbZii4MMtuIDJxS5BVwWlmJgsB1y2GuaIH/f
 fRpmjHkmcZwCC/c3dWfxXfPKqUZs765G5tCxUkNbLe39hVJ/x+S5AVUWw A==;
X-IronPort-AV: E=Sophos;i="5.54,332,1534780800"; d="scan'208";a="92147438"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2018 03:15:12 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Oct 2018 12:00:50 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Oct 2018 12:15:09 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org,
	palmer@sifive.com
Subject: [PATCH v6 03/14] RISC-V: Filter ISA and MMU values in cpuinfo
Date: Tue,  2 Oct 2018 12:14:56 -0700
Message-Id: <1538507707-22299-4-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
References: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_121523_288702_2E1962D6 
X-CRM114-Status: GOOD (  14.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org, anup@brainfault.org, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002191456.x8NNrW29RG3DxVTiCiBKPle--6zHwAid2NKDAHGzteU@z>

From: Palmer Dabbelt <palmer@sifive.com>

We shouldn't be directly passing device tree values to userspace, both
because there could be mistakes in device trees and because the kernel
doesn't support arbitrary ISAs.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
[Atish: checkpatch fix and code comment formatting update]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/cpu.c | 68 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ca6c81e5..1c0bf662 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -58,6 +58,63 @@ int riscv_of_processor_hart(struct device_node *node)
 
 #ifdef CONFIG_PROC_FS
 
+static void print_isa(struct seq_file *f, const char *orig_isa)
+{
+	static const char *ext = "mafdc";
+	const char *isa = orig_isa;
+	const char *e;
+
+	/*
+	 * Linux doesn't support rv32e or rv128i, and we only support booting
+	 * kernels on harts with the same ISA that the kernel is compiled for.
+	 */
+#if defined(CONFIG_32BIT)
+	if (strncmp(isa, "rv32i", 5) != 0)
+		return;
+#elif defined(CONFIG_64BIT)
+	if (strncmp(isa, "rv64i", 5) != 0)
+		return;
+#endif
+
+	/* Print the base ISA, as we already know it's legal. */
+	seq_puts(f, "isa\t: ");
+	seq_write(f, isa, 5);
+	isa += 5;
+
+	/*
+	 * Check the rest of the ISA string for valid extensions, printing those
+	 * we find.  RISC-V ISA strings define an order, so we only print the
+	 * extension bits when they're in order.
+	 */
+	for (e = ext; *e != '\0'; ++e) {
+		if (isa[0] == e[0]) {
+			seq_write(f, isa, 1);
+			isa++;
+		}
+	}
+
+	/*
+	 * If we were given an unsupported ISA in the device tree then print
+	 * a bit of info describing what went wrong.
+	 */
+	if (isa[0] != '\0')
+		pr_info("unsupported ISA \"%s\" in device tree", orig_isa);
+}
+
+static void print_mmu(struct seq_file *f, const char *mmu_type)
+{
+#if defined(CONFIG_32BIT)
+	if (strcmp(mmu_type, "riscv,sv32") != 0)
+		return;
+#elif defined(CONFIG_64BIT)
+	if (strcmp(mmu_type, "riscv,sv39") != 0 &&
+	    strcmp(mmu_type, "riscv,sv48") != 0)
+		return;
+#endif
+
+	seq_printf(f, "mmu\t: %s\n", mmu_type+6);
+}
+
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	*pos = cpumask_next(*pos - 1, cpu_online_mask);
@@ -83,13 +140,10 @@ static int c_show(struct seq_file *m, void *v)
 	const char *compat, *isa, *mmu;
 
 	seq_printf(m, "hart\t: %lu\n", hart_id);
-	if (!of_property_read_string(node, "riscv,isa", &isa)
-	    && isa[0] == 'r'
-	    && isa[1] == 'v')
-		seq_printf(m, "isa\t: %s\n", isa);
-	if (!of_property_read_string(node, "mmu-type", &mmu)
-	    && !strncmp(mmu, "riscv,", 6))
-		seq_printf(m, "mmu\t: %s\n", mmu+6);
+	if (!of_property_read_string(node, "riscv,isa", &isa))
+		print_isa(m, isa);
+	if (!of_property_read_string(node, "mmu-type", &mmu))
+		print_mmu(m, mmu);
 	if (!of_property_read_string(node, "compatible", &compat)
 	    && strcmp(compat, "riscv"))
 		seq_printf(m, "uarch\t: %s\n", compat);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
