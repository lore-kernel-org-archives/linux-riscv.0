Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D708EC04AA5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 18:40:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC0D4208B3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 18:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BqOCH0tr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC0D4208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:References:
	In-Reply-To:Message-Id:Date:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3yJQKDpfOZO6REbBZjizmjNGqIIhChlMlWqmA3IgIg=; b=BqOCH0trVq4FPk
	6q7NqzV1ASOwnqLrpcSNxeJ4jhY7Qif0prDqG6/zn0sRri2wH8l3DWG00s4oxK+F9KpPaNqLINeHN
	nCvpko0cfjId9rbUM7s5QhbOWhXj0R/R+UjFZnYkbVrKSNuAz9YRvbpFXVKV9b88mQyPBhD41F+FN
	jBheLP20+P6BY13x+2YuFdgocBtFH5yAlqBtmIveakxvf+UTZqu7lKSNlQqGOP0/hjxgepbH0N0Ek
	AMq738ybu44AM3SuBLthMF84ecxW6k/llxiVL2ui5hR4eqXSVcL/QnXiEi71TeIqxUoxKWTaA86ve
	kYaat2TvfkrixcUcY6/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gC7n5-0006xB-A0; Mon, 15 Oct 2018 18:40:31 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC77R-0008In-Aw; Mon, 15 Oct 2018 17:59:29 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1gC77D-0002IJ-IV; Mon, 15 Oct 2018 11:57:16 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1gC779-0002Md-7J; Mon, 15 Oct 2018 11:57:11 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sh@vger.kernel.org
Date: Mon, 15 Oct 2018 11:56:58 -0600
Message-Id: <20181015175702.9036-3-logang@deltatee.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181015175702.9036-1-logang@deltatee.com>
References: <20181015175702.9036-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sh@vger.kernel.org, sbates@raithlin.com, palmer@sifive.com,
 aou@eecs.berkeley.edu, hch@lst.de, akpm@linux-foundation.org, arnd@arndb.de,
 logang@deltatee.com, mhocko@suse.com, vbabka@suse.cz,
 pasha.tatashin@oracle.com, osalvador@suse.de
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v2 2/6] mm/sparse: add common helper to mark all memblocks
 present
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_105729_790785_C9D70F99 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmer@sifive.com>, Pavel Tatashin <pasha.tatashin@oracle.com>,
 Stephen Bates <sbates@raithlin.com>, Michal Hocko <mhocko@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015175658.ceqWZsNXz4FeTx_0YxsGR8saZs2UYefN8qjGhavbToI@z>

Presently the arches arm64, arm and sh have a function which loops through
each memblock and calls memory present. riscv will require a similar
function.

Introduce a common memblocks_present() function that can be used by
all the arches. Subsequent patches will cleanup the arches that
make use of this.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Pavel Tatashin <pasha.tatashin@oracle.com>
Cc: Oscar Salvador <osalvador@suse.de>
---
 include/linux/mmzone.h |  6 ++++++
 mm/sparse.c            | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index d4b0c79d2924..26a026a45857 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -784,6 +784,12 @@ void memory_present(int nid, unsigned long start, unsigned long end);
 static inline void memory_present(int nid, unsigned long start, unsigned long end) {}
 #endif
 
+#if defined(CONFIG_SPARSEMEM) && defined(CONFIG_HAVE_MEMBLOCK)
+void memblocks_present(void);
+#else
+static inline void memblocks_present(void) {}
+#endif
+
 #ifdef CONFIG_HAVE_MEMORYLESS_NODES
 int local_memory_node(int node_id);
 #else
diff --git a/mm/sparse.c b/mm/sparse.c
index 10b07eea9a6e..90aec8331a03 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -5,6 +5,7 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/mmzone.h>
+#include <linux/memblock.h>
 #include <linux/bootmem.h>
 #include <linux/compiler.h>
 #include <linux/highmem.h>
@@ -238,6 +239,19 @@ void __init memory_present(int nid, unsigned long start, unsigned long end)
 	}
 }
 
+#ifdef CONFIG_HAVE_MEMBLOCK
+void __init memblocks_present(void)
+{
+	struct memblock_region *reg;
+
+	for_each_memblock(memory, reg) {
+		memory_present(memblock_get_region_node(reg),
+			       memblock_region_memory_base_pfn(reg),
+			       memblock_region_memory_end_pfn(reg));
+	}
+}
+#endif
+
 /*
  * Subtle, we encode the real pfn into the mem_map such that
  * the identity pfn - section_mem_map will return the actual
-- 
2.19.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
