Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC067C44514
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LNCmo3O0syXbCps1iBynmK/1yWoN25/SEBaN99ZObOE=; b=g1hhiB10Y+bZsz
	U/48QDal+B01yE7ottOZatBLFnBEX1/0qy+OD2nOxDs+fXjMjrXr673sJK4+V0FwE7zDCIi6WT3GB
	UZKrCPiB2KTukpGqaVZKRPi0tW5m3v3BsaDs3H9L+CXpLFs8Zi0gBlF+kwLuVX/1nodQYIuExnhKJ
	SCR8FkrcKpike2MkescN/jrVr9jTwPM0xxNU8sLWuzITkwRXmu7l0ipMIm6wWDsz1mcb3JhvTYyej
	963amTA/XgnDYFYnnl/awZSerrpbDSFaCwCF5DUnREDgWaPL335H8lqUbWl7MQlZwIC6dzjy2FD6g
	PDgV3YeXCvO2JXXq/FfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRf-0000000HJDa-3fhM;
	Thu, 16 Jul 2026 12:44:07 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRc-0000000HJ8y-3qGd
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:44:06 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so4804556a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205844; x=1784810644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVEhlrHEVqIN0Ar3D+s2eFCiOScwlS1S3mz2hTaXKkY=;
        b=UkvSIu4F+y6+lIIhCSdhh9YBCP4tsgHjMyHNUEnBvlkX5Lv1gU0piGw9bjjNtBEpKN
         rE0lWG2EsIPrzieEuGn/TniwkeIFlmXx0g7DmPTUwuoo5dj7B1eBOxKEw9t2yJkBqALv
         RpjAAA0b+8CnQQi6hx0vBXtaCcEi5xpmkPFFHYRY9kFWkM+vvoQxFU9pc1FHyPt9lifS
         qDNWqQTzUx+5qZqZtILpG7OkbqqhnMQDQF3rF3cXjrRx3y9+OF69D0OeRRfVU7oyu1Ix
         JyXjEERYNX7J1yzc/rgOA36V8OKY/vxMGLBQivLr+6QSKRdsfcYmfeuxOm9F4x51j9I4
         5eOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205844; x=1784810644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVEhlrHEVqIN0Ar3D+s2eFCiOScwlS1S3mz2hTaXKkY=;
        b=XWbgSIeFr41itB1ZlgY2HWA5HFwNz/9g6y6XYnQVTTh4sIQM60LNAzhQGtxa5HsvGK
         qhmv6YM4AMmE6T5oNQZJ1/w2dXPFqEd4vIyIaVqHqH2Usow/aeZIRYbTwOpY4Je+dKUz
         mh40k6Bx8YnYfgCTcDP0dEQYie9NvDm85AfaKjW2Y4DCwnpx8Kau4LHe/UeiG5lmYAxe
         xrnMbWIENu9jWXbk4XD8+kjcUtsbXsZQv8zFserHmp8g+3Lnj2RdlUCmeJWGFWH5YaiH
         05HhAHFFNpJdaVemWFaBfg6/RwfahxSXk21Z0A8Oxncm+uoyJFuN/YXzsYIANED3aT1R
         UhNA==
X-Gm-Message-State: AOJu0YzGMwGTcDMbtsAUUD/gGZe4gE6nt9EmBqHTIdtfpr7FyNKlhjCM
	/qU4pVZzlUJaQQpJxNSceCNzqHeJfkgo/aooEXZOlPKBoruUPIWp9NmpankQBX4UbSp/ZCa+SiW
	5n+nsa58=
X-Gm-Gg: AfdE7ck8YfLA37m3RtrDPeV0MNv+kyEfwn3E23nqodSak/qoK2bZ4XI97ZtFc71/jIC
	np7BKV+QJTAAJiV+HdJXKW3IhTpyoOrD1l9uVgpJC5LdWT/xAJJzssLeGKgmHpym4+Q27Z/40lL
	L/Yi/haH+RT+k5Dp+634n1R46RQhQOrZky1eWMRfmJvW7+ERG9QTuAc9kUC7zuEKlSz2jA34e2l
	DEbONnR5d+34FIXgl5QP7v/bH0AGzNKycgbKK9KCr/9KVgH4ICL7IuSdrpZ6COrpmHrAAaENmo7
	6tJ3iZ1blsFBKjsholwld4sTio3zOBGBWAa5Unp0Sk2fMWqc+s7sk0iN5lksWQtgW+a/c16z1bg
	cJzi0MLZnwICsRbmqTyrp/r0F6f8DhPk0xTA4/VyTb1pVvPw2NLH/HyJCkzLA1mxqwJnjQWk8gG
	JnsKqKFvGylOl9ZXlTtQuWvyY=
X-Received: by 2002:a05:6a20:4308:b0:3ba:cd5b:3dc8 with SMTP id adf61e73a8af0-3c36c1f1e9dmr7530059637.31.1784205844222;
        Thu, 16 Jul 2026 05:44:04 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.43.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:44:03 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 09/15] riscv/mm: avoid Svnapot consistency checks in ptep_get()
Date: Thu, 16 Jul 2026 20:41:44 +0800
Message-Id: <687dadf430c49a840e24976e37ba09f991bc3222.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054404_982230_67177873 
X-CRM114-Status: GOOD (  14.05  )
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

napotpte_ptep_get() builds the returned logical sub-PTE from the
initial PTE observed at the target address. Neighbouring entries in the
NAPOT block are only scanned to gather accessed and dirty state, so they
cannot contribute PFN, permission, present or writable state to the
returned PTE.

Drop the range consistency checks from this ptep_get() path. Callers
that rely on the block-wide A/D view are expected to hold the PTL. There
are generic lockless ptep_get() users, such as userfaultfd_must_wait()
and HMM walks after pte_offset_map(), but those paths use the present,
marker, write and PFN state and do not consume the gathered A/D bits.

Keep the consistency checks in napotpte_ptep_get_lockless(). That API
must return a self-consistent PTE snapshot to lockless walkers and fault
retry paths. napotpte_is_consistent() verifies that every scanned entry
still belongs to the same NAPOT mapping, ignoring A/D bits, and retries
if a concurrent unfold, rewrite or refold tears the range while A/D
state is being gathered.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h |  3 +++
 arch/riscv/mm/contpte.c          | 19 +++++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e4b9c05014c00..dd56c20a817bb 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -930,6 +930,9 @@ static __always_inline void napotpte_try_unfold(struct mm_struct *mm,
 /*
  * Public PTE helpers may transparently handle Svnapot-encoded mappings.
  * NAPOT-aware arch users should stick to the private/raw __pte* helpers.
+ * Callers relying on the block-wide A/D view from ptep_get() are
+ * expected to hold the PTL. Lockless callers that require a
+ * self-consistent Svnapot range must use ptep_get_lockless().
  */
 #define ptep_get ptep_get
 static inline pte_t ptep_get(pte_t *ptep)
diff --git a/arch/riscv/mm/contpte.c b/arch/riscv/mm/contpte.c
index 70f9a0668b50c..0f66426b0ecfd 100644
--- a/arch/riscv/mm/contpte.c
+++ b/arch/riscv/mm/contpte.c
@@ -294,6 +294,13 @@ EXPORT_SYMBOL(__napotpte_try_unfold);
 
 pte_t napotpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 {
+	/*
+	 * Gather access/dirty bits from the whole NAPOT range for the
+	 * ptep_get() view. The returned sub-PTE is built from orig_pte;
+	 * neighbouring entries only contribute A/D state. Lockless callers
+	 * requiring a self-consistent range must use ptep_get_lockless().
+	 */
+
 	pte_t pte, cur;
 	pte_t *start;
 	unsigned int i, nr;
@@ -307,14 +314,10 @@ pte_t napotpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 
 	for (i = 0; i < nr; i++) {
 		cur = READ_ONCE(start[i]);
-		if (!napotpte_is_consistent(cur, orig_pte))
-			return napotpte_subpte(ptep, orig_pte);
 		if (pte_dirty(cur)) {
 			pte = riscv_pte_mkhwdirty(pte);
 			for (; i < nr; i++) {
 				cur = READ_ONCE(start[i]);
-				if (!napotpte_is_consistent(cur, orig_pte))
-					return napotpte_subpte(ptep, orig_pte);
 				if (pte_young(cur)) {
 					pte = pte_mkyoung(pte);
 					break;
@@ -328,8 +331,6 @@ pte_t napotpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 			i++;
 			for (; i < nr; i++) {
 				cur = READ_ONCE(start[i]);
-				if (!napotpte_is_consistent(cur, orig_pte))
-					return napotpte_subpte(ptep, orig_pte);
 				if (pte_dirty(cur)) {
 					pte = riscv_pte_mkhwdirty(pte);
 					break;
@@ -345,6 +346,12 @@ EXPORT_SYMBOL(napotpte_ptep_get);
 
 pte_t napotpte_ptep_get_lockless(pte_t *orig_ptep)
 {
+	/*
+	 * ptep_get_lockless() must return a self-consistent PTE without the
+	 * PTL. Recheck that the whole NAPOT range still describes the same
+	 * mapping, ignoring A/D bits, and retry if a concurrent update tears
+	 * the range while A/D state is being gathered.
+	 */
 	pte_t orig_pte, pte;
 	pte_t *ptep;
 	unsigned int i, nr;
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
