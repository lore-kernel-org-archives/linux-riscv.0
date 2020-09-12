Return-Path: <SRS0=wYeJ=CV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796DCC2D0E1
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 01:35:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7A432220E
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 01:35:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rPWES/Eq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="BWa9ArQy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7A432220E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZbN93T42XD1eKJighw7OQGeBjNgosESeTTx6b5IpE4g=; b=rPWES/EqNpbxB6V5VYsh+Dbdn
	BZFUHhKyQzeDQUPTkmG9r3Plfr/GRtp4WAAkDU09EQZsDZ8gnbPfyHz5X/JltqnPoEAqfL2Yoq4e2
	XWyoY0VdcEm0LR3p2IVyFuyidIbEXFP525o8WN+CipS4adXa1QcZoZY2u8oPC5Vf4jg7lEYOAsvRT
	pJE3AIiMQcwKLYd74r8SwBM4YlrIBEVLbGoV/2Tys3OpbTVl28fTfTK/rUVP2pRvYnXQsSUgoepG/
	AyqdNR4T4LTOJGwmFeJeZ2Pzddy5GOZkf3P6zCPca17dgPQBIPkHKX4q46Ab4+KISfFjOeJUQJdLl
	eG6DNGppA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGuRI-0003wd-FQ; Sat, 12 Sep 2020 01:34:52 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGuRE-0003uR-L4
 for linux-riscv@lists.infradead.org; Sat, 12 Sep 2020 01:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1599874488; x=1631410488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UjeLYAGOcdXcIsgSttMVEHrk7RBdvzzoyHtETVrepjo=;
 b=BWa9ArQy/4KN2B4TkqZFZ/1s/aBD7sQCGDfNjfYAgUAeWwlkAKYJWC1T
 rO8K8bQ5OzPZ3UjJWmMYyi1BuBUcTeJVHiJAIBUhP3UFuWqpxUQRIcYJh
 7Uu39WhpIXUwxGO/hBu5ZDUbD9dX1cG7qFD2/DZb7TA9qOyY4eYddzuz2
 iwxSFL/6ZIX2LpwoaeO82/SpcO5fAdxCueL29/79gudc99rLBXvu6Iy5S
 F/dm7XHcL47lNFXz3XHQATKcv+zpYRFE3acRCcsMIqqfeF2z3XVIn9tZm
 KjmlTkrHJWWBRHgo6Mm1amJjd83aBeVtRW9/V/8yutwzcFcCnBIXgKbag A==;
IronPort-SDR: dHGD/avo7eSGSb1I6gty3mcR8Zyz9Ouh9rMUz86QH3Y09rOzq9Fkdyzgnx7L+7z3xYoRZtKEgY
 KT1Y15cu9TYhbcnveIjKkws8EWEYs+DVPA7Jw8EVL84FtYObofAWEogGC9hqLadI2OIFKirSOY
 4FcGW2F8ElM43E6TwYqPCSaQnLHAbSNA6AikoCCUSyTXi9TvRQk9fgSUizNRZa3IbP26LkqKrS
 qQJi9fmBpEIHPG1GdRvh3+ME7Blg7Rn9QW5cmQaEi/fVxJRcVAJO1Ikp8AZ5uOi6DkxsRCNH6z
 usA=
X-IronPort-AV: E=Sophos;i="5.76,418,1592841600"; d="scan'208";a="256787995"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Sep 2020 09:34:48 +0800
IronPort-SDR: L7Awe9GuB1umypdaxqdECzVk863431ablPVCWOalzZi+F75TGfnzNVjZUxplkerVMZGaB7NEVk
 m3ZKT2b8D2/w==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 18:21:09 -0700
IronPort-SDR: WVSo90k5RB/Op5MTYgcl3P06o6rSxyXsLjYI6RB1XlWinPa+NfnA15S7rPXmE06Vk6mVbeY/fl
 3iTlz6g4oEww==
WDCIronportException: Internal
Received: from unknown (HELO jedi-01.hgst.com) ([10.86.59.229])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Sep 2020 18:34:47 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC/RFT PATCH v2 4/5] riscv: Add support pte_protnone and
 pmd_protnone if CONFIG_NUMA_BALANCING
Date: Fri, 11 Sep 2020 18:34:40 -0700
Message-Id: <20200912013441.9730-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200912013441.9730-1-atish.patra@wdc.com>
References: <20200912013441.9730-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_213448_838212_0268A458 
X-CRM114-Status: GOOD (  14.25  )
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
 linux-arch@vger.kernel.org, Jia He <justin.he@arm.com>,
 Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Steven Price <steven.price@arm.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
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
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
