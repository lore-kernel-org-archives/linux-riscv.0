Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F256C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 21:37:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C8812075E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 21:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rp+lCva2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C8812075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:References:
	In-Reply-To:Message-Id:Date:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovd7mzTJx/kGsMK4O1zzNnhO9AriZx8WwPBMkrD2XUs=; b=Rp+lCva2lf1yCX
	mwZefZSUWbfd1m4RSncw2PwIlnX5nAETnKcpDDjTLCO8hgrncGTrQvwGqve+X44oy5HLgtuZndN4A
	YWCeXWunkn7Y5SSqkMw1RrneSZ/CRw/YTQYno5amUowSiAzctFlZFHoR5tkYjtyTH52kEizHc8pAa
	mtODEVWZKx6lI3ooY+ZIwgWZpwN9Qj7ilzCroQ18Cw3YVcpVyw2wlkyyDbx7g6Ev9JkBM2jxbSc6r
	kcvVK3+s44twPheBTjPcmpjf6q++Z/C7Ejej+5wQj9OTk6fVhR+3MkOYFvgKUDiIJZH8XQ3tfgNLv
	iCHdhXhEPY/xGZHAScEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9GEI-0001Jt-7o; Wed, 27 Mar 2019 21:37:02 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9GEC-0001GU-OH
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 21:37:00 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1h9GE4-0006DN-EM; Wed, 27 Mar 2019 15:36:49 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1h9GE2-0006Cq-Is; Wed, 27 Mar 2019 15:36:46 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Date: Wed, 27 Mar 2019 15:36:43 -0600
Message-Id: <20190327213643.23789-8-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327213643.23789-1-logang@deltatee.com>
References: <20190327213643.23789-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, sbates@raithlin.com, palmer@sifive.com,
 hch@lst.de, aou@eecs.berkeley.edu, logang@deltatee.com,
 ldufour@linux.vnet.ibm.com, rppt@linux.vnet.ibm.com, anup.patel@wdc.com,
 zong@andestech.com, ren_guo@c-sky.com, sorear2@gmail.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH 7/7] RISC-V: Implement pte_devmap()
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_143656_978803_353A435B 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: Stefan O'Rear <sorear2@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, Stephen Bates <sbates@raithlin.com>,
 Zong Li <zong@andestech.com>, Anup Patel <anup.patel@wdc.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Guo Ren <ren_guo@c-sky.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Use the 2nd software bit in the PTE as the devmap bit and add the
appropriate accessors.

This also allows us to set ARCH_HAS_ZONE_DEVICE.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Laurent Dufour <ldufour@linux.vnet.ibm.com>
Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Zong Li <zong@andestech.com>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: "Stefan O'Rear" <sorear2@gmail.com>
---
 arch/riscv/Kconfig                    |  1 +
 arch/riscv/include/asm/pgtable-bits.h |  8 ++++++--
 arch/riscv/include/asm/pgtable.h      | 10 ++++++++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 2cb39b4d6d6b..d365d7e17ed2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -49,6 +49,7 @@ config RISCV
 	select GENERIC_IRQ_MULTI_HANDLER
 	select ARCH_HAS_PTE_SPECIAL
 	select HAVE_EBPF_JIT if 64BIT
+	select ARCH_HAS_ZONE_DEVICE
 
 config MMU
 	def_bool y
diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index 470755cb7558..9555d419a46f 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -30,9 +30,11 @@
 #define _PAGE_GLOBAL    (1 << 5)    /* Global */
 #define _PAGE_ACCESSED  (1 << 6)    /* Set by hardware on any access */
 #define _PAGE_DIRTY     (1 << 7)    /* Set by hardware on any write */
-#define _PAGE_SOFT      (1 << 8)    /* Reserved for software */
+#define _PAGE_SOFT1     (1 << 8)    /* Reserved for software */
+#define _PAGE_SOFT2     (1 << 9)    /* Reserved for software */
 
-#define _PAGE_SPECIAL   _PAGE_SOFT
+#define _PAGE_SPECIAL   _PAGE_SOFT1
+#define _PAGE_DEVMAP	_PAGE_SOFT2
 #define _PAGE_TABLE     _PAGE_PRESENT
 
 /*
@@ -41,6 +43,8 @@
  */
 #define _PAGE_PROT_NONE _PAGE_READ
 
+#define __HAVE_ARCH_PTE_DEVMAP
+
 #define _PAGE_PFN_SHIFT 10
 
 /* Set of bits to preserve across pte_modify() */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e071e2be3a6c..a0e6a5f8bbb5 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -248,6 +248,11 @@ static inline int pte_special(pte_t pte)
 	return pte_val(pte) & _PAGE_SPECIAL;
 }
 
+static inline int pte_devmap(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_DEVMAP;
+}
+
 /* static inline pte_t pte_rdprotect(pte_t pte) */
 
 static inline pte_t pte_wrprotect(pte_t pte)
@@ -289,6 +294,11 @@ static inline pte_t pte_mkspecial(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_SPECIAL);
 }
 
+static inline pte_t pte_mkdevmap(pte_t pte)
+{
+	return __pte(pte_val(pte) | _PAGE_SPECIAL | _PAGE_DEVMAP);
+}
+
 /* Modify page protection bits */
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
