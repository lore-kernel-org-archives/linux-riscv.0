Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03594C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 21:37:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C49D12075E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 21:37:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B4wVUVcY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C49D12075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:References:
	In-Reply-To:Message-Id:Date:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCU+obAHPWstld8K6rZFLXQJR4tzmw7A1kAMMkwIGm0=; b=B4wVUVcYLxYPrE
	J4CiPxZg2pAmcjgmx4sz2UWAbVDrkxZzdKWbbUpgBvQ1Bh057GC9+og2qYNRw2+AIgU3zRX4OdU2C
	qq4mouP4QRdSG8yVAGPHfWDge4/HbwhPELL0CY10m1nrHqRopWCCfWruf+O8VUGnLmr7l2ApmfJiN
	+eJOkiDpHO6sWKHZWmAjJ0FWSGjA9sWfCMBvf9/EDHxS/QJugbE2JYXtGJzLHlnv/mgEl0GmrMFu1
	JZumVk9aO8vk1sarMpODcnXBzs3Ihgo2C7Uc60CHoqBYDqvtPNGE7V17RVD+22ceTL0B2itw8cmGa
	QRiYsAUMHS6Dtcc6Kb/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9GEN-0001Og-D4; Wed, 27 Mar 2019 21:37:07 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9GEC-0001GT-Od
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 21:37:02 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1h9GE4-0006DL-EI; Wed, 27 Mar 2019 15:36:49 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1h9GE2-0006Ck-Bm; Wed, 27 Mar 2019 15:36:46 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Date: Wed, 27 Mar 2019 15:36:41 -0600
Message-Id: <20190327213643.23789-6-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327213643.23789-1-logang@deltatee.com>
References: <20190327213643.23789-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, sbates@raithlin.com, hch@lst.de,
 aou@eecs.berkeley.edu, logang@deltatee.com, rppt@linux.vnet.ibm.com,
 anup.patel@wdc.com, atish.patra@wdc.com, palmer@sifive.com,
 paul.walmsley@sifive.com, zong@andestech.com, ren_guo@c-sky.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH 5/7] RISC-V: Implement memory hotplug
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_143657_279113_FF6A7AE7 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 Stephen Bates <sbates@raithlin.com>, Zong Li <zong@andestech.com>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Guo Ren <ren_guo@c-sky.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

In order to define ARCH_ENABLE_MEMORY_HOTPLUG we need to implement
arch_add_memory() and vmemmap_free().

arch_add_memory() is very similar to the x86 versions except we
don't need to fuss with the mapping as we've already mapped the
entire linear region in riscv.

For now, vmemmap_free() is empty which is similar to other arches that
don't implement hot remove.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Zong Li <zong@andestech.com>
Cc: Guo Ren <ren_guo@c-sky.com>
---
 arch/riscv/Kconfig   |  3 +++
 arch/riscv/mm/init.c | 27 +++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d21e6a12e8b6..9477214a00e7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -83,6 +83,9 @@ config ARCH_SPARSEMEM_ENABLE
 config ARCH_SELECT_MEMORY_MODEL
 	def_bool ARCH_SPARSEMEM_ENABLE
 
+config ARCH_ENABLE_MEMORY_HOTPLUG
+	def_bool y
+
 config STACKTRACE_SUPPORT
 	def_bool y
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 315194557c3d..0a54c3adf0ac 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -238,3 +238,30 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 	return vmemmap_populate_basepages(start, end, node);
 }
 #endif
+
+#ifdef CONFIG_MEMORY_HOTPLUG
+void vmemmap_free(unsigned long start, unsigned long end,
+		  struct vmem_altmap *altmap)
+{
+}
+
+int arch_add_memory(int nid, u64 start, u64 size, struct vmem_altmap *altmap,
+		    bool want_memblock)
+{
+	unsigned long start_pfn = start >> PAGE_SHIFT;
+	unsigned long nr_pages = size >> PAGE_SHIFT;
+	int ret;
+
+	if ((start + size) > -va_pa_offset) {
+		pr_err("Cannot hotplug memory from %08llx to %08llx as it doesn't fall within the linear mapping\n",
+		       start, start + size);
+		return -EFAULT;
+	}
+
+	ret = __add_pages(nid, start_pfn, nr_pages, altmap, want_memblock);
+	WARN_ON_ONCE(ret);
+
+	return ret;
+}
+
+#endif
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
