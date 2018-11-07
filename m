Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83830C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:55:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 556DA2086C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:55:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aBt9FW6d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Esw7cTlN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 556DA2086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:References:
	In-Reply-To:Message-Id:Date:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ty68eIsqh+oo5KO/79FRW5occzBL91wSatW+M0UcbhE=; b=aBt9FW6dOhFTHW
	xSjkil9gN6730V6F1dDz0tHT19H0vWPmsT8aCP3tkbUac3QAiLzTnBzbXIwGIzoRPMOQfuxqD+oDn
	aOENDzS2PgaEq5DX417ucG8r3q1GS8B99dFLHOE3VuKYK4eaEtBvGyJxIoxDQc2RQCD7Tezb5h9DC
	QXPvrA+9jNK5lN/aXKWU7fNWBmHX4xE8PEw6x+V6ZskEcbkvH4VIk6qFJOePtrHgqctv/OzcdNFjF
	D3quN16e55JekNpDKtly5a3o2p8OocSGgAltfwLgRzH0NvZS5g7LqRQ8Eq5GtwYsZ/opxUHyDg/G9
	uj1YtDApYJvXRanORY7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKUqq-00071Z-Ks; Wed, 07 Nov 2018 20:55:00 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUqk-0006qN-LV; Wed, 07 Nov 2018 20:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Subject:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EkFCSae6iKJXGDcMb8cjAsUlI5kGVVrCG3uHoZ2SD4E=; b=Esw7cTlNMnC0BQQANMnB/h79h8
 gC4JANiaKqkBMG7ymR609LfNG2Q/YUkgoLy2lNVl5+UqwHY88aYRCIg0S18LFLPSgScTEjpZAwmXR
 wpQHLR+QTsYP9TYQPJkA51EBZbhLBBFhjXhJu9idtflRyNXEpoHWUmg8eHJB0HWoaDS0RMCU1w8+s
 dLVPgq2/qtC74l5Mq9lfR9vqk4R+Meq4cQrplaVV4sPDlqW9iI77ZGKJ0VDh/kUevKHJ5oN/4q6Qc
 mdf0ZhgKZdXlCDcRe0AdHsYCzBdKBkIbjvUgVW6iDlrFtYCxBmSStop7nhh3EOydD1z2mqK392Mbw
 dgPITGUg==;
Received: from ale.deltatee.com ([207.54.116.67])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUqh-0002pI-2Q; Wed, 07 Nov 2018 20:54:52 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1gKUqS-0005zI-Dz; Wed, 07 Nov 2018 13:54:37 -0700
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1gKUqQ-00011K-Ij; Wed, 07 Nov 2018 13:54:34 -0700
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Date: Wed,  7 Nov 2018 13:54:33 -0700
Message-Id: <20181107205433.3875-3-logang@deltatee.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181107205433.3875-1-logang@deltatee.com>
References: <20181107205433.3875-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sh@vger.kernel.org,
 akpm@linux-foundation.org, sbates@raithlin.com, palmer@sifive.com,
 aou@eecs.berkeley.edu, hch@lst.de, arnd@arndb.de, logang@deltatee.com,
 mhocko@suse.com, vbabka@suse.cz, osalvador@suse.de
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v2 2/2] mm/sparse: add common helper to mark all memblocks
 present
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_155451_619980_559AC64D 
X-CRM114-Status: GOOD (  12.92  )
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
 Palmer Dabbelt <palmer@sifive.com>, Stephen Bates <sbates@raithlin.com>,
 Michal Hocko <mhocko@suse.com>, Logan Gunthorpe <logang@deltatee.com>,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107205433.EhWcxAoIR-20rgL4HRjIRY9ZUdcag8rZTw1tBOlmIK4@z>

Presently the arches arm64, arm and sh have a function which loops through
each memblock and calls memory present. riscv will require a similar
function.

Introduce a common memblocks_present() function that can be used by
all the arches. Subsequent patches will cleanup the arches that
make use of this.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Oscar Salvador <osalvador@suse.de>
---
 include/linux/mmzone.h |  6 ++++++
 mm/sparse.c            | 16 ++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 847705a6d0ec..db023a92f3a4 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -783,6 +783,12 @@ void memory_present(int nid, unsigned long start, unsigned long end);
 static inline void memory_present(int nid, unsigned long start, unsigned long end) {}
 #endif
 
+#if defined(CONFIG_SPARSEMEM)
+void memblocks_present(void);
+#else
+static inline void memblocks_present(void) {}
+#endif
+
 #ifdef CONFIG_HAVE_MEMORYLESS_NODES
 int local_memory_node(int node_id);
 #else
diff --git a/mm/sparse.c b/mm/sparse.c
index 33307fc05c4d..3abc8cc50201 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -239,6 +239,22 @@ void __init memory_present(int nid, unsigned long start, unsigned long end)
 	}
 }
 
+/*
+ * Mark all memblocks as present using memory_present(). This is a
+ * convienence function that is useful for a number of arches
+ * to mark all of the systems memory as present during initialization.
+ */
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
