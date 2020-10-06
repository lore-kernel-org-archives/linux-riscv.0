Return-Path: <SRS0=uiah=DN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44B7C4727E
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 00:18:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A56220760
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 00:18:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nK4fVySJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="MAIcQVZf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A56220760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=edeTmFDuPgYN86XCtypOgH+XoLjNQBxjFB040y6ngkI=; b=nK4fVySJLM/0uTk/+Esh32xMQ
	ieJQLaLb85StHAyfrSTxhl7zvq37VD0D1hYnKwqfcUzDHPk4wwdfHpjmZCbvEPR/K06bHNCuCWWTk
	/zf9ICpCxcqwHzCgovSMDfEXm80T6GN+5SLx3uCBM5S7UYU/P6sFGhzWN1F2Ppx3D4VSZbfnpWlFK
	RPJaLQvTY8Fi3z8UaAaOIgLKE5r7n4BunFjhuGQNV7gNa/FuS1OwdplvTYFNAXdijPoNf6Ha/2okd
	4gG56MNiTlbnFo72P30rm1W3LE7vCfFa5I+pe6ZOxfzWrM6KGg0arjDaNGM9kX+woZ7XhiflPJDHS
	LrTu7gpPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPagK-0006uD-WD; Tue, 06 Oct 2020 00:18:17 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPag9-0006oV-As; Tue, 06 Oct 2020 00:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601943485; x=1633479485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yFZiLxGXA9elMo70n32xkkNg4f+3DGRCZkaVt0joPmw=;
 b=MAIcQVZf3S7lRkmvt/lc2qSrRYh4wxbkUZpHPnBfbW0N944ANzAmN8Ss
 7xZwyGa7UEhml3e+BuNm0i9mmIIDMti8ktKaW47YGJo0ZbbeQpoieAN/O
 E6k8FA1WAKrj4xJtnBYfHIyAXZFttp0OSWfiEib24czVJXsrQeXJJ40UG
 2jvO8h+UiJcPpgtnmP2b02R8mwhXNdmbqqwsaJndCaFs0rPS/f32ZR0CI
 Hr/XsDDpyiaNunBWi90kcxrFazBfFuIRT48n3uKCVYS+4h5ccG1s8lsVL
 4DZP3LfG/qCnab5Dk8BlpJWk2x2mgSy4maql07Ies4c3pdFAhAHD1llLi w==;
IronPort-SDR: QIkijBYI2RuJ3HT4OF0se2qA/5KI5KPToLvZRRuEGYKCqKBJCmYqaOAxoJ0wssShB8YYFDK5Ir
 IhCphpzPp/hAM4hLgpKyyd3PlGJ0BzDFXiLquXoK3/pYVr1djlHOB6+tWLqqTq3bLTYRm/cEB8
 l88QraUGuG7b6i3H/mx7cO3iFTB5prFtXFznhqa/K2inf2faRBFo9Xbe8lAapiZaOrJX6Fbyli
 FMS8zNjd2elZbPWAGEr3QFi8WRzJl7ElpCjjh8/4SA+B0m+vbIOHBsE/bTt6I4c6FJnL5/LPJf
 gCU=
X-IronPort-AV: E=Sophos;i="5.77,341,1596470400"; d="scan'208";a="153530929"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Oct 2020 08:18:00 +0800
IronPort-SDR: 9inOiNd4Zqp0T+hyMh+MFr4WtPbSN9J4QwlnMmKiYzSfLmVYxBwk75vN/zHuEiPKYeO73uKZ8c
 K8Xejc0kVYYA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 17:04:46 -0700
IronPort-SDR: rD45YZG01rzAHCHeb+UWPggXpioB4z171xHwJ8hS9et3cvwetahVQCKI4OLiFEf7barKvGm8Kv
 6Qg7IhGQ58+Q==
WDCIronportException: Internal
Received: from b9f8262.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.253])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 Oct 2020 17:17:59 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] riscv: Add support pte_protnone and pmd_protnone if
 CONFIG_NUMA_BALANCING
Date: Mon,  5 Oct 2020 17:17:51 -0700
Message-Id: <20201006001752.248564-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201006001752.248564-1-atish.patra@wdc.com>
References: <20201006001752.248564-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_201805_569076_FA3C5983 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Jia He <justin.he@arm.com>,
 Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
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
