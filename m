Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57BEEB64DA
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X7pAX++kBMChMawA6/0/p4atY2gXQCzcTOc0nJTE1cs=; b=swfrzPk0BdrFn7
	S8rV380FbgaJ88LEiAj1AMQqlojGc7pwz9l486NHtcvNUUcCIzxqoE7Ma+veH4bM6mSD2Tph8hvE1
	EZINlsMV2VPzKnHo2ZRZXMjzdAwwXPbpcbaqftok0jJOAApZ4NT5c4cKbdIboYrAPp+ZQBNNKpmpu
	+um6U/B9d4fIpXfkjmFV7/03uTr81SDWzqSbi5wmO4k3hyjVmXwgN9teReSrflG2iC2Pcos9vXBoO
	cmUB4zf+F2oon2rM0+lR1Q0Le8oTfUNtNa+T+Ds59SsMhTnVNt6zx/GG74VO9lcsCmcCo+jUtVUM/
	tU0Wh3VOgvc1OFuD7fZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL3YJ-00CHhT-0h;
	Sun, 16 Jul 2023 15:20:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL3YG-00CHf1-0M
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 15:20:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0892560C64;
	Sun, 16 Jul 2023 15:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2D2C433C7;
	Sun, 16 Jul 2023 15:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689520846;
	bh=KuRdyUnvdhMI0IlJX5eClH8cwmGftUxt0A36mvY9HIo=;
	h=From:To:Cc:Subject:Date:From;
	b=ri48yWAptbDvfqa8raYqK0Qc1xMA0ks3kWOM4NUuo0b8ozl/Pc8U/qglksWNKcIuP
	 +vto7asvYvtXHZCUksExNLZDPgkHtp6nxvIKycIguLGReF1B+4k3mVAoRSIKScJJx1
	 SO5VL7v4wpz4YJ95lWZ2yoq3fY5zNsDLQcev9IpOAl/adKTR4w+4ApshXUixydSXvU
	 g98GVv+4C2M8m+pir8crYc9qrybXkNIVOHEatJuiGPfuhljXbckSn7Efxu6qWfD8mk
	 SH08O9qI5I5Mp87oicN/rNG1LHZxaCDjMcVDtyOV5g1DZ7EurVQX/anGucr7XxhCTI
	 Mypmwvjdhle0Q==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	falcon@tinylab.org,
	bjorn@kernel.org,
	conor.dooley@microchip.com,
	alex@ghiti.fr
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] riscv: Add HAVE_IOREMAP_PROT support
Date: Sun, 16 Jul 2023 11:20:33 -0400
Message-Id: <20230716152033.3713581-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_082048_250118_E5CD7611 
X-CRM114-Status: GOOD (  11.22  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Add pte_pgprot macro, then riscv could have HAVE_IOREMAP_PROT,
which will enable generic_access_phys() code, it is useful for
debug, eg, gdb.

Because generic_access_phys() would call ioremap_prot()->
pgprot_nx() to disable excutable attribute, add definition
of pgprot_nx() for riscv.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 .../features/vm/ioremap_prot/arch-support.txt     |  2 +-
 arch/riscv/Kconfig                                |  1 +
 arch/riscv/include/asm/pgtable.h                  | 15 +++++++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/features/vm/ioremap_prot/arch-support.txt b/Documentation/features/vm/ioremap_prot/arch-support.txt
index a24149e59d73..ea8c8a361455 100644
--- a/Documentation/features/vm/ioremap_prot/arch-support.txt
+++ b/Documentation/features/vm/ioremap_prot/arch-support.txt
@@ -21,7 +21,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: |  ok  |
     |       sparc: | TODO |
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c86..15900fa20797 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -117,6 +117,7 @@ config RISCV
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO if MMU && 64BIT
+	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 75970ee2bda2..c9552a161f90 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -415,6 +415,11 @@ static inline pte_t pte_mkhuge(pte_t pte)
 	return pte;
 }
 
+static inline pgprot_t pte_pgprot(pte_t pte)
+{
+	return __pgprot(pte_val(pte) & ~_PAGE_PFN_MASK);
+}
+
 #ifdef CONFIG_NUMA_BALANCING
 /*
  * See the comment in include/asm-generic/pgtable.h
@@ -573,6 +578,16 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	return ptep_test_and_clear_young(vma, address, ptep);
 }
 
+#define pgprot_nx pgprot_nx
+static inline pgprot_t pgprot_nx(pgprot_t _prot)
+{
+	unsigned long prot = pgprot_val(_prot);
+
+	prot &= ~_PAGE_EXEC;
+
+	return __pgprot(prot);
+}
+
 #define pgprot_noncached pgprot_noncached
 static inline pgprot_t pgprot_noncached(pgprot_t _prot)
 {
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
