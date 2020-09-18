Return-Path: <SRS0=9SVT=C3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB0DC43463
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2020 20:13:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DE5B2074B
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2020 20:13:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oFtbvr1/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="GIReQb1Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DE5B2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=edeTmFDuPgYN86XCtypOgH+XoLjNQBxjFB040y6ngkI=; b=oFtbvr1/RSbVFZSVfxnE7JChh
	7IiZVK6cFcRC3U5FNtTtWTQPE5cfIdStFkaSiAU/JHdG54E8HN1wgkgk4WHJsllSpeqEbpvsQ5Khz
	iKX/Duy2OlhcgvA2U493HyzTH7g5yGvnM1OnNKeHyoY3wySOZZeDmU/eg05+wn1jeroM8dHddI7BU
	xOloP9mEi0Q/ig2Cy5FGtHGRgcuZvfwlBIhOzTVzvcA6qcktbGrfqfEHzyIonbNcRhYGZf6WA4Tyl
	fGL+c64AZZW9N2ROQHtbMnNV0QlAIVbZgr2u0okkJ8/w/ufW/uYrr5nBbep0p73iLMrKUhJzSZRPH
	JroeA2PJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJMkp-0006nz-R1; Fri, 18 Sep 2020 20:13:11 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJMkW-0006hg-UN; Fri, 18 Sep 2020 20:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600459972; x=1631995972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yFZiLxGXA9elMo70n32xkkNg4f+3DGRCZkaVt0joPmw=;
 b=GIReQb1QQ/qa5vOb4/oSjmZ6nSnJwX5dmlIcQTblKJ06yjlQ9UxrT82M
 /XLIqq9MvXxjIZou8S6WA7pYtJHW9dDibXLpfISPHKnzwaJFkGzzbnr3g
 3gPJEigK1ErGT2x3YWU0+WhE8YDRyhRFTLr8QaN1hxRIx5v6O3/usOT7a
 RBeLrRrfHSz+jK5NYQOIy27kft0x3FC01R8k9RjmZ9as/3CwzGHUldiNG
 uUZMEIRj/xEDPhXxyOOiN2d+wVMIg8Q0eoVPCje5V9g1zcr+21b/Q7NIL
 ujIqAme4zpN+7hlLf+8X6igZhXorhWq/lSxk5t1Z7X9+8agxldpuEXiC+ A==;
IronPort-SDR: bIRnue3EUuj3SKcRb3w306UdueTyspMH2LZa9JKOwh9U86TqzRVVo+LIGKfUoF6PcU+43Ytha5
 D0mBfSZJ2v8VyOC4tIakgCmqWxNgzOKkQKqNtrXe5g7lO1/DGJm+hr359294SuyfnmPWvaBkt8
 K0JgmLqaVxgWhBm/ksgZi7+mYh01BpJnepPIC4da+XTWVC2LyPVfaInrimFpMCJS1qUMHJw3nt
 +isfwsPi9nKJzMQCPnMokWgYEAwBO8h/rOCjIHoQlYg/3KrNKZfHduIz/AQ0joflRM/lP1hqoL
 XnQ=
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; d="scan'208";a="147671115"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Sep 2020 04:12:50 +0800
IronPort-SDR: ZV661a55jwf/88N514oJarnmO1vanwdlOtyTxtlSesg353BWOfrheuXPKbc7qrkLrupkf9jVRG
 wEosVmfptqWg==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 12:59:02 -0700
IronPort-SDR: nFg7iJKfhXph3l+76Ansy35dqHtaUlKkxiQMAKc1U64BmEUoqafedKZBwy+X4FreVqruthP5F4
 N/AvufJIo0Mw==
WDCIronportException: Internal
Received: from us3v3d262.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.69])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Sep 2020 13:12:50 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT PATCH v3 4/5] riscv: Add support pte_protnone and pmd_protnone
 if CONFIG_NUMA_BALANCING
Date: Fri, 18 Sep 2020 13:11:39 -0700
Message-Id: <20200918201140.3172284-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918201140.3172284-1-atish.patra@wdc.com>
References: <20200918201140.3172284-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_161253_133146_ED2D2C7A 
X-CRM114-Status: GOOD (  14.29  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Steven Price <steven.price@arm.com>,
 Greentime Hu <greentime.hu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

These two functions are used to distinguish between PROT_NONENUMA
protections and hinting fault protections.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/pgtable.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 515b42f98d34..2751110675e6 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -183,6 +183,11 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 	return (unsigned long)pfn_to_virt(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
 }
 
+static inline pte_t pmd_pte(pmd_t pmd)
+{
+	return __pte(pmd_val(pmd));
+}
+
 /* Yields the page frame number (PFN) of a page table entry */
 static inline unsigned long pte_pfn(pte_t pte)
 {
@@ -286,6 +291,21 @@ static inline pte_t pte_mkhuge(pte_t pte)
 	return pte;
 }
 
+#ifdef CONFIG_NUMA_BALANCING
+/*
+ * See the comment in include/asm-generic/pgtable.h
+ */
+static inline int pte_protnone(pte_t pte)
+{
+	return (pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE)) == _PAGE_PROT_NONE;
+}
+
+static inline int pmd_protnone(pmd_t pmd)
+{
+	return pte_protnone(pmd_pte(pmd));
+}
+#endif
+
 /* Modify page protection bits */
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
