Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42BA606EE83
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 14:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q9bEXoRU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PenNTOM3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=npMl5fBHNEx+zIF1A5FIlRH1MXic6cIDjFlGFjCm4p0=; b=Q9bEXoRUY2d9jM8lkd1t/mjCQg
	FKoHmEbzF1D/ApweIWObzKpO/BwtLLxCUdAK5ipAiGS4oQTbApvgvH9mGxkzzXaevc3y186laVts/
	87DUnlHGCl0TUro+t2gGbnHeFClNO9K41/2BDQJ1tvbkeqEdCKRSoQJpKiFs8w0yBL3MZxyfBJSB/
	zjWHVchuElXZMp5w0/tQOqAgRbflTHBlVcN9gjEF3mkdeIrz15XVGvIiM4e0aSztpoleHg/dZJrEO
	L3cn2Vi6WNqyHrvFwMJEH8Zrhf7gUt6HTdrz8Dx7YhmlCzbWGFx0dYxY2LQSGvMEIfTkyPIm5yOJ8
	ZyyefUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKXE-0000000Cafh-1kjb;
	Fri, 06 Nov 2026 14:03:16 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKXC-0000000Cad5-1Nsp
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 14:03:15 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so958638eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 06:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973793; x=1794578593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=55So9WQ/WyrADhzVx1hdq8ywmTf+r85oSbdNInvKBS8=;
        b=PenNTOM3ADluaRg98iIBjV8UWwUK1l/BGJj+6SZxmLJ6ETSKBugOiaY3umvPBipeQP
         oi25sD42UtCgGtCYGpx43uR3VPWLBo260wRVCCF+3pcEma6f+XsELTsfd7dWcqCHaJq1
         Q8qEsNW6v+Q4Y6aUJ8VU3jl0fPgTDXw7839F1DnfdbQnqCPbG6mxwtmwCE+DurIguXMo
         ceUM/JWcWmpvuomi939Pr7iF9P3lZC2EnItClQtu1CSYNzqbhxARKUIEWzULMnHEJPsC
         eKU76g3Du4aIUvrYW4yRZMUb03m1To1q0o95jv2tMfT2XlAQc4yGmjaOVeWnG4jiTuLS
         k9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973793; x=1794578593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=55So9WQ/WyrADhzVx1hdq8ywmTf+r85oSbdNInvKBS8=;
        b=T1X+ox5c1Cs660Cr12CGe3Zm5hqUGqqUEpE5NtQENrZaEz7Doq35wZ3OoBdj3XXyfy
         ec1eHp1K9WXxEZQM4pFKA5dWNmnu3b+qW31vKu1v6/ZyZcBUHqdh2Hau7yizk2WDNes5
         sFwPvS9Ox0BnabmnVuYASUawnKpgupXvXAC9nXNcp0Ys5xUHSiJ1YI1nB+X3DIrDte9g
         t3zyO8C/xkIs0LBgPN7S5XrWBaNJxg+2/EthdWXrKCxAuIFruTcw3tOZUBFBTZGkRX/n
         HmTUPEqHWWu7TCRLqSwO0py0VpFspYP5qOZ+P8Psiz7Km0GiJsd7vPTCL7h3MASV/MbU
         LUPg==
X-Forwarded-Encrypted: i=1; AL+hErFhDhmGMiOkjviIUd23lC8Xgt1YdqjARNYXiKVP7jaE3VbutqiEXkt/PRH4/TqWiAe3kPgBCFDgcMWEGQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+GAeQ5VxnaDL8igwPQ9jsNF0Yj3e1v2vo4mfUa7ZGKiPpxv8y0
	5IlbvpnS3I2FVy7zFTeu2sEIG3zBNb5EIXaRmZxwCFFok8W06/9qTxcS
X-Gm-Gg: AYBFou2FlIftHVlDayBtlaYqHQuNy05Zj2Br4V/mkG5h7Csr8MfjOGxpJLM2C3lMG6W
	Qais3kFDHGeLnw3LNh2720v8BBRm5nuPLvksJIaX6AhJAn5cE06hVqLdn2if5q2yZRJXyHF9i+P
	TWz+Lwv5tOpT4MrtWptNNzXHRzse+isZUycKi3GptQDYi5OjF+caKv+F6V8i6p2H1INSSS+rFM4
	LMU11wI/T1pb6+L0xiJEUmuoKDnxhXV7KH0xmGTauLfSlNxyGNk+I+8KHUgt/q5tMkrrwW6OK6h
	wQvE8CDZDOK1g3OtYPai1fTE19k1U0l5X24/pjYY459CQ+LuAseWLth5kj2KcdlZzN1ci2XYi87
	czMinxA2ceii9tmi/boEzkPMavUqX58iPZlN/x1xtpSB3eVwNG0MwWQbf/Fvu1qP6NUCW31wKXz
	3NsjPwx0EK0Y5VVVNnub50ZuBk7wjaEy7y6LlNiJrZi/yjnTfjx2jP8biO+AH6AmvgFGpOzoVJM
	XV3oSUkf+iW283lVsbrZbIC/HUIN+R22cnWC/NeljU/siDdoNiKaSIWWbNOMcuFpsx6jh8AbVir
	d4k5W8gZObCNbfOaMnHA6/M99uCROVcU+LxhQhYUW4sMw4H62XTY
X-Received: by 2002:a05:7301:1887:b0:361:6884:78b1 with SMTP id 5a478bee46e88-36f7671a78cmr3700143eec.28.1793973792971;
        Fri, 06 Nov 2026 06:03:12 -0800 (PST)
Received: from fedora ([124.51.157.51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b4680sm7004358eec.20.2026.11.06.06.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:03:12 -0800 (PST)
From: SeungJu Cheon <suunj1331@gmail.com>
To: anup@brainfault.org,
	atish.patra@linux.dev
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jinyu.tang@linux.dev,
	inochiama@gmail.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] KVM: riscv: Only fast-path dirty-log write faults on host-writable leaves
Date: Fri,  6 Nov 2026 23:02:47 +0900
Message-ID: <20261106140247.155817-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_060314_372629_7888865D 
X-CRM114-Status: GOOD (  17.81  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The dirty-log write fault fast path sets _PAGE_WRITE without checking
whether the backing page is host-writable. A read fault can install
a read-only mapping to the shared zero page. A subsequent guest write
then takes the fast path and writes into the zero page instead of
going through the slow path to break CoW.

Use RSW bit 9 to record host writability before dirty logging forces
the mapping read-only. Preserve this bit across write-protection and
fall back to the slow path when it is clear.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-174168@kernel.org/
Fixes: 7705be59eb2d ("KVM: riscv: Fast-path dirty logging write faults")
Cc: stable@vger.kernel.org # 7.2+
Reviewed-by: Jinyu Tang <jinyu.tang@linux.dev>
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
v2:
 - Pass host_writable to kvm_release_faultin_page() as well
   (Inochi Amaoto, Sashiko)
v1: https://lore.kernel.org/all/20261017030927.345454-1-suunj1331@gmail.com/

Testing (v2, QEMU -cpu rv64,h=true, 4 vCPUs):

  A selftest makes the guest read an untouched page, then write to it
  with dirty logging enabled. Before the fix, the host zero page is
  corrupted (0x5a5a5a5a5a5a5a5a != 0). After the fix, CoW allocates a
  private page and the zero page stays zero.

  dirty_log_perf_test -v 2 -b 128M -i 3 completes for Sv39/Sv48/Sv57
  with no warnings in dmesg.

v1 was additionally tested on a HiFive Premier P550 (no noticeable
regression in dirty_log_perf_test -v 3 -b 256M -i 3). The board is
not available for v2.

This patch applies on top of the Accessed-bit fix [1].

[1] https://lore.kernel.org/all/20261016101458.221648-1-suunj1331@gmail.com/

 arch/riscv/include/asm/kvm_gstage.h |  5 ++++-
 arch/riscv/kvm/gstage.c             |  5 ++++-
 arch/riscv/kvm/mmu.c                | 17 ++++++++++++++---
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index aaf080ba1b7..0d19ad6d7df 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -35,6 +35,9 @@ extern unsigned long kvm_riscv_gstage_max_pgd_levels;
 #define kvm_riscv_gstage_pgd_xbits	2
 #define kvm_riscv_gstage_pgd_size	(1UL << (HGATP_PAGE_SHIFT + kvm_riscv_gstage_pgd_xbits))
 
+/* RSW bit 9: the host mapping behind this leaf is writable. */
+#define KVM_GSTAGE_PTE_HOST_WRITABLE	BIT(9)
+
 static inline unsigned long kvm_riscv_gstage_gpa_bits(unsigned long pgd_levels)
 {
 	return (HGATP_PAGE_SHIFT +
@@ -61,7 +64,7 @@ bool kvm_riscv_gstage_try_update_pte(struct kvm_gstage *gstage, u32 level,
 int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 			      struct kvm_mmu_memory_cache *pcache,
 			      gpa_t gpa, phys_addr_t hpa, unsigned long page_size,
-			      bool page_rdonly, bool page_exec,
+			      bool page_rdonly, bool page_exec, bool host_writable,
 			      struct kvm_gstage_mapping *out_map);
 
 bool kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index be70607a33e..d9bfd0c6d5f 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -207,7 +207,7 @@ static void kvm_riscv_gstage_update_pte_prot(struct kvm_gstage *gstage, u32 leve
 int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 			      struct kvm_mmu_memory_cache *pcache,
 			      gpa_t gpa, phys_addr_t hpa, unsigned long page_size,
-			      bool page_rdonly, bool page_exec,
+			      bool page_rdonly, bool page_exec, bool host_writable,
 			      struct kvm_gstage_mapping *out_map)
 {
 	bool found_leaf;
@@ -246,6 +246,9 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 			prot = PAGE_WRITE;
 	}
 
+	if (host_writable)
+		prot = __pgprot(pgprot_val(prot) | KVM_GSTAGE_PTE_HOST_WRITABLE);
+
 	found_leaf = kvm_riscv_gstage_get_leaf(gstage, gpa, &ptep, &ptep_level);
 	if (found_leaf) {
 		/*
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 5664383a1a3..b41534dd500 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -586,6 +586,12 @@ static bool kvm_riscv_mmu_dirty_log_write_fault_fast(struct kvm *kvm,
 			break;
 		}
 
+		/* Let the slow path handle host-side write protection and CoW. */
+		if (!(pte_val(old_pte) & KVM_GSTAGE_PTE_HOST_WRITABLE)) {
+			ret = false;
+			break;
+		}
+
 		if (!dirty_marked) {
 			mark_page_dirty_in_slot(kvm, memslot, gfn);
 			dirty_marked = true;
@@ -630,6 +636,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	bool is_hugetlb;
 	bool unused = false;
 	bool writable;
+	bool host_writable;
 	unsigned int vma_pageshift;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct vm_area_struct *vma;
@@ -714,6 +721,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	if (is_error_noslot_pfn(hfn))
 		return -EFAULT;
 
+	host_writable = writable;
+
 	/*
 	 * If logging is active then we allow writable pages only
 	 * for write faults.
@@ -739,10 +748,12 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	if (writable) {
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 		ret = kvm_riscv_gstage_map_page(&gstage, pcache, gpa, hfn << PAGE_SHIFT,
-						vma_pagesize, false, true, out_map);
+						vma_pagesize, false, true, host_writable,
+						out_map);
 	} else {
 		ret = kvm_riscv_gstage_map_page(&gstage, pcache, gpa, hfn << PAGE_SHIFT,
-						vma_pagesize, true, true, out_map);
+						vma_pagesize, true, true, host_writable,
+						out_map);
 	}
 
 	if (ret)
@@ -750,7 +761,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 
 out_unlock:
 	kvm_release_faultin_page(kvm, page,
-				 unused || (ret && ret != -EEXIST), writable);
+				 unused || (ret && ret != -EEXIST), host_writable);
 	write_unlock(&kvm->mmu_lock);
 	return ret;
 }

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: aea68332f05283074bb715e7dde093a2a316a51a
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
