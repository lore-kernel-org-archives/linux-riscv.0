Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8AEF327CD
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 09:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sc3yjTgKrSj44hs5WReisT7g0bwhLtyfkv0+N2DH92A=; b=T4u+/JsSJTGCiV
	GpzKeIHELaNgYFP1Q7Cb9TJsAsSGNJ0MJAf6rOEXaDWVMy2sniuzLpQ1zIna419h9LcS3MtTK8DKy
	IR8dRa2yIVbqK1YjRfLKAL/aAknmcpK7JYqU3f124s3t6JCh62updlIYkeoR2SoS2lMKRdN2LALjT
	idT01JOLAJVLpJnQPJ7uPgORlK7OhV18BbjmPAoMEl94mXiwucqGiQM/pMASQUUIeNnESGqlz+wwx
	1e5CZS4TrViYwiYMS6yk+zHe9O1fKhooRyDI6k6CwrtLpn5nH1rhJ6GeIqXDKb1tgiBef6RqmhSOG
	e75vUzMhnvtg/fHqdtDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7NB-00000008KoB-2AOK;
	Tue, 21 Apr 2026 09:26:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7N9-00000008Km8-0SmZ
	for linux-riscv@bombadil.infradead.org;
	Tue, 21 Apr 2026 09:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=vuusCw6rlfDGFySSxpy3cAwZYM4fJMPSUnMyh4fNp+s=; b=SxcAnuYXwSKCWM2gwoNkU5r538
	30FA3LdEfg+bVE0CrmpMuaIPldwqARhvFl5Q2CPEIyqGngvLUBDObF5LUeK+42krAbh8hiFkXrz/g
	2FFh+KpFh8m4yB7XGwfM0FxgDW+p582+3VWkFzCFxB5y1UWMxAUZy/8SaOhVTrsSNCBLWIfhEguO0
	dvryxyMg0D7sAAknptkVSHxKltTFObZ/sDxdmoPy/HQRo2eVsI1a/P8jNgskEgEpqQ0Bnz4oFIdLy
	fE44Jcvac+Zth5qpUlJITM9WIh69pizIRr/ENpNI+yF62CEuho6d24faCzNNLcxQTxU5wuXgdDlxD
	b+AYfyPg==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7N5-00000009Ttd-0BVW
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 09:26:21 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so2683218a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2026 02:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1776763576; x=1777368376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vuusCw6rlfDGFySSxpy3cAwZYM4fJMPSUnMyh4fNp+s=;
        b=eNAzWiru5TA1n7cnbnRapWas+5W6fVA/jrXWRg42kaQ5eo0pCFUaApQ5zzw/HXbd73
         9HnKk4W04J+ZRh5b1LVsrcWcuZmn1TMuleJDz3p3Jp/r3MCDpiyL5WMV+z/Y6ZcVrYdi
         I8fKjy5tMfbQDDZw2R2y8RxfRuG1rYqOYXGWwyLsL2L0S5caVNisXj1lIHBdYhdIp4EE
         WZ4JZZ//8Poj9Y5fSarE8sj21LN4GoZL8w54oRL0ubDit6r3s8IgCL8enanTUII8abu7
         JWbo1ffeHKb6gn5m/DzMETwKBo1j2UNxw1BDcExip3ACzp1Fe+Rm/ckKHlQU42UQ1FRn
         pgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776763576; x=1777368376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vuusCw6rlfDGFySSxpy3cAwZYM4fJMPSUnMyh4fNp+s=;
        b=A+3y+sk81ENYdCJq+lLCAPrnm0H+qJJ9KrKfE2+rzruyHiruCDg8OiUCdVcbKlbFY3
         R1r+xLTi1aME0wkHa1B4YJ/xtJ77OJCRumAXQVnYZclYLm1UyhcxFI0hdDt9hScE7V+d
         8yE0C1YWqg+zmAoU44pioQV+MBq0PPiZ1JNtENSnSQMJFxz2yN4PTn9hA/9T6x7QvybM
         ftHBHozsMu9G1qige++UgInbDurgSTXfJNvP+zit5L3UG2PLGSr6lbYGNT38nkYysapS
         2p88UNBIgQq6nTGjP8lIxYncgOS0vPCWGSx366OJ5Xpj1KiAORuzU1EzzacD5p7/neVN
         lRSA==
X-Forwarded-Encrypted: i=1; AFNElJ+F7Zzyfw3W5ICjP8QM/c3Duqh+l32Jgpn2boiYoYt/OTvnCt6W4jW35nC1bs8wbZtyqgMB1JIRrGRyzw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2zgHa8mwZYsUmVdVG7oOkJ/Wn28anYAdBRPVgBA417K+pnzMI
	6yFSd0CuvuuMj7PmMUVnzqw/aXSCfTb3vVlENm0Sxsc7dIHBQ/lJZr15tzyiHAIFhAQ=
X-Gm-Gg: AeBDieuCxDHtAWq9OBdGuA4v6gJm7OypzAVSaBKoOnow2skeGyzlCC5rDixvoXFj4US
	fCrd0pDoj6iGTX/wTbxeThOx4iO3XH1UMXGLr4RtJsTDCiKGYusT0cxbCxO/ZjqRvgmv4PxHiFi
	wsoVIWeQja6nqeLa5Cvr74tLctR9qwCPuQff4IDaIOwpGNeKfDH0DQLJ2vG0Ge7gqd0HOhxsLQi
	vkDv8CpfpksLVP599bcPMd0SzczQkocL7icJXQnMdYyoZ0jPs51bIx6uvEd9AS5H7A358OWWLHp
	0x1N5i0eFFXa6nNyMXVIwI9VALUQO+mOxJDmEwmDZ9hzH/JO0iVQ5jecEuwFtABB8/8Ucu+tKTl
	iPq0ogblB5+htWnmLY7a1UOYEvfpB4y0wwhMmoDlbJIPzqO8xaFMw2jPco35I/PuYUOfKcy4aC3
	oFB6HnXGyty2tEfgDgzVXRXsOK9fUw1Tdue0+ZPkFn62jInhA6HiRmj/+AjvblNoL9jfXj
X-Received: by 2002:a17:90b:1809:b0:359:15c8:e8e1 with SMTP id 98e67ed59e1d1-361404a8241mr17256461a91.25.1776763575646;
        Tue, 21 Apr 2026 02:26:15 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff39csm131965105ad.4.2026.04.21.02.26.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Apr 2026 02:26:15 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	andrew+kernel@donnellan.id.au,
	andreyknvl@gmail.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	apopple@nvidia.com,
	ardb@kernel.org,
	atish.patra@linux.dev,
	baolin.wang@linux.alibaba.com,
	cuiyunhui@bytedance.com,
	david@kernel.org,
	debug@rivosinc.com,
	djordje.todorovic@htecgroup.com,
	dvyukov@google.com,
	elver@google.com,
	glider@google.com,
	ilias.apalodimas@linaro.org,
	junhui.liu@pigmoral.tech,
	kasan-dev@googlegroups.com,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn,
	ljs@kernel.org,
	namcao@linutronix.de,
	osalvador@suse.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rmclure@linux.ibm.com,
	rostedt@goodmis.org,
	rppt@kernel.org,
	ryabinin.a.a@gmail.com,
	surenb@google.com,
	vincenzo.frascino@arm.com,
	vishal.moola@gmail.com,
	wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn
Subject: [PATCH 7/7] riscv: add Svnapot-aware pte_batch_hint support
Date: Tue, 21 Apr 2026 17:24:57 +0800
Message-Id: <20260421092457.37649-8-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260421092457.37649-1-cuiyunhui@bytedance.com>
References: <20260421092457.37649-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_102619_512996_2A46C024 
X-CRM114-Status: GOOD (  11.94  )
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

Provide a Svnapot-specific pte_batch_hint() implementation so callers can
batch over a contiguous napot range without re-reading each PTE entry.
Keep the public wrapper in pgtable.h and leave the CONFIG-disabled case on
the existing single-entry fallback.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 19 +++++++++++++++++-
 arch/riscv/mm/contpte.c          | 33 ++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index db82253efb218..264af77392c6e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -872,6 +872,13 @@ static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
 
 #define __ptep_clear_flush_young __ptep_clear_flush_young
 
+static inline unsigned int __pte_batch_hint(pte_t *ptep, pte_t pte)
+{
+	return 1;
+}
+
+#define __pte_batch_hint __pte_batch_hint
+
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
 
 /*
@@ -886,6 +893,7 @@ void __napotpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, pte_t pte);
 pte_t napotpte_ptep_get(pte_t *ptep, pte_t orig_pte);
 pte_t napotpte_ptep_get_lockless(pte_t *ptep);
+unsigned int napotpte_pte_batch_hint(pte_t *ptep);
 void napotpte_set_ptes(struct mm_struct *mm, unsigned long addr,
 		       pte_t *ptep, pte_t pte, unsigned int nr);
 void napotpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
@@ -1056,6 +1064,15 @@ static inline bool ptep_clear_flush_young(struct vm_area_struct *vma,
 	return napotpte_ptep_clear_flush_young(vma, address, ptep);
 }
 
+#define pte_batch_hint pte_batch_hint
+static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte)
+{
+	if (!pte_present(pte))
+		return 1;
+
+	return napotpte_pte_batch_hint(ptep);
+}
+
 #else /* CONFIG_RISCV_ISA_SVNAPOT */
 
 static __always_inline bool riscv_pte_present_napot(pte_t pte)
@@ -1100,9 +1117,9 @@ napotpte_ptep_clear_flush_young(struct vm_area_struct *vma,
 #define ptep_set_wrprotect			__ptep_set_wrprotect
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
 #define ptep_clear_flush_young			__ptep_clear_flush_young
+#define pte_batch_hint				__pte_batch_hint
 
 #endif /* CONFIG_RISCV_ISA_SVNAPOT */
-
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
 {
diff --git a/arch/riscv/mm/contpte.c b/arch/riscv/mm/contpte.c
index 077ffa49e89d9..134b8c401cabc 100644
--- a/arch/riscv/mm/contpte.c
+++ b/arch/riscv/mm/contpte.c
@@ -187,6 +187,12 @@ static inline bool napotpte_is_consistent(pte_t pte, pte_t orig_pte)
 	       pte_val(pte_mask_ad(pte)) == pte_val(pte_mask_ad(orig_pte));
 }
 
+static inline bool napotpte_is_batch_consistent(pte_t pte, pte_t orig_pte)
+{
+	return pte_present_napot(pte) &&
+	       pte_val(pte_mkold(pte)) == pte_val(pte_mkold(orig_pte));
+}
+
 void __napotpte_try_fold(struct mm_struct *mm, unsigned long addr,
 			 pte_t *ptep, pte_t pte)
 {
@@ -391,6 +397,33 @@ pte_t napotpte_ptep_get_lockless(pte_t *orig_ptep)
 }
 EXPORT_SYMBOL(napotpte_ptep_get_lockless);
 
+unsigned int napotpte_pte_batch_hint(pte_t *ptep)
+{
+	pte_t orig_pte, pte;
+	pte_t *start;
+	unsigned int i, nr, off;
+
+	if (!napot_hw_supported())
+		return 1;
+
+	orig_pte = READ_ONCE(*ptep);
+	if (!pte_present_napot(orig_pte))
+		return 1;
+
+	start = napot_align_ptep(ptep);
+	nr = napotpte_pte_num();
+	off = ptep - start;
+
+	for (i = off; i < nr; i++) {
+		pte = READ_ONCE(start[i]);
+		if (!napotpte_is_batch_consistent(pte, orig_pte))
+			return 1;
+	}
+
+	return nr - off;
+}
+EXPORT_SYMBOL(napotpte_pte_batch_hint);
+
 void napotpte_set_ptes(struct mm_struct *mm, unsigned long addr,
 		       pte_t *ptep, pte_t pte, unsigned int nr)
 {
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
