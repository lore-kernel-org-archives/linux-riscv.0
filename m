Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75DCCD6E44
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 11:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0nZJ2tZBXjUfdlTy5tW5BjQ5YRgz/HLUlfuPB93+FVI=; b=goajBFyqU/E60s
	UAPJwMvPmBrohaMY0mgXEvLLJRtqQPl9R6OA3V+2XUg++DEhk/0e6drHI+eElMJQsKZr/SL9ILUAB
	qIKF+BuiW6AO8/lLM4ZclhxujswbQJiC1So0Xxz7u1ZNubbWKVyFq/ThoEiIhE5ytb3lmSpLSlYny
	0BOPRe+5kWzDFAkW7Z4u/LAR77OBY3LQ29IeckpcAYjz4+FxfjJCkcqCfNOxfmkNQP+TydjeBWENL
	PneGPElImwZfIQm7r0eHtMKUfLXgEimbQ9I3Xq94N4PQzMLiTqpizDfMk+sQgVdUHpzuUVGRRSaCf
	H6o2CIgKZ3pfv76fv7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZ4j-00000005fx7-3WxH;
	Thu, 28 May 2026 11:38:57 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZ4i-00000005fwA-0Bsq
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 11:38:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2bd2051167eso63035345ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 May 2026 04:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779968334; x=1780573134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HQOVqn7f6Wpqd2/fSU+ahSddV1Hbd7ryZ20yjrjfDWg=;
        b=CFC07ySTihtviezZ3g/T4SLbKxSoP+qe3/UPigu/rMp/DCI3QqQasdmW7gdqWkyWBM
         lxFZNfQzu+7SBIwl+pf5IQxtwV1y0rvjE0dsz2hAZXvTMUOvrhe/kjHVlFL7f5kTXsUb
         an/o8zkUJwl3u0p/gWdLeOiTaV/m20TQYg2kGu/OUTpbhQetasmKsNSfA5lzJr9jmZBZ
         bJMHBlU9wTttIIvQ0bhPtJ85T30+ftBHoYS1PYuuSNiXi6pc3c9gIh9yodkg/aMynNef
         QjfdyK6+WbW+7ShcoisegJ8aMkNFvz1hV8ErNUSm0RdAiKI/bqc31UY61HP3SVOEbdWJ
         Dzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779968334; x=1780573134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQOVqn7f6Wpqd2/fSU+ahSddV1Hbd7ryZ20yjrjfDWg=;
        b=gPVV47MlLZj1B9jTKZ8xU7wn/xHhF6v6th9Hy6rvnVLmNy61kz8+uIsgnTaaVgxF6M
         E7Zknvi0ilB0VyO5wS8QsDa3pdGws3EsFTrRQz3Wh97ZgwIlqgsK/gPgUs4/qSpAFL+G
         /U3L0swok3gFLiMBWzxjHkfcOL5lB8JDBkUOk8AgfBt/gBDx8WbJC4dVx9g8+JDgseyu
         ffI2Vq8z3CmUd6yYCv6SMb1uuSYKnf+hVLebDMbzWXlbmqCkYKvpAcpGlGBylJbiuGx4
         pfExM1Y5H7FfZ23UDWMZD/TQ/8zkhEnJNLR6Y/KIoJ5LLv2Cg+GrqRCxutepcF/YyF0D
         +hGw==
X-Forwarded-Encrypted: i=1; AFNElJ8laGPF+XtylOEGEhcpFaWld0coyC5AOy6yJOZnzkhQ0PlYboHcZvyP9ZHF23J7O2r/Ng3Fml7k1gHJEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyY9Wn2Y+14/y83KZRyy2uAn/HCaM6WpGf4axT55OgQr7SldcIA
	kiSaLBdECD2kH/DnAz8Nwy4t0ZcyPckFdB3Kl31eeb+FnigwItU6A3JQMKiUtA==
X-Gm-Gg: Acq92OHRoBj63hqIhHYCjXjk02iz9LaeVRLxfdKGdFHUtl10TSRUmQ5VixYWlhmfzDC
	YpMPPbE83C28S1bSZkOtMdtnxJc9QVMdokyF5w06UjWDN28mDRM8J7grus5+TBTXTmfRzUfIMvm
	n2TErMF51/fCypUkMN5VhbkNleXy8y+CKOfFydzt57gm55dPdhhJ/Vpw0kQtdwING0Uce5vQIO0
	lZnd/9J3dU0N/J3xL20QtgbaCKfjH0ag8wWOrZ4ieYMkjv1vzCM+aCvLulJX9SDp6xrueEbaLnU
	6qFyI8W4l+9ZLnMcHCayOZY15mwWPhZkVU25qNEiu+JH7f0qpDAPEjPloX3U1rfnYQZqMvOPaOD
	VXNNr6qZHK9pmqQBQq7TUOhDUEVeDbK8/Gi8iyCcn4HoSFLLsDZbyOVx07ntZc3VyAimPta7Epg
	rPg1ZjPD2oXnoOueg/oO5gA+6J5QOoGuWJfA==
X-Received: by 2002:a17:902:cec7:b0:2b2:ccfb:8387 with SMTP id d9443c01a7336-2beb0613c3bmr312598815ad.28.1779968334356;
        Thu, 28 May 2026 04:38:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56958d3sm170611355ad.12.2026.05.28.04.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 04:38:53 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] RISC-V: KVM: Enhance the logging check for mmu mapping
Date: Thu, 28 May 2026 19:38:39 +0800
Message-ID: <20260528113840.2629186-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_043856_085571_F6E8C9FE 
X-CRM114-Status: GOOD (  12.98  )
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

When enabling dirty ring, the dirty bitmap is disable, and the logging
check is always false as the RISC-V architecture does not select
"NEED_KVM_DIRTY_RING_WITH_BITMAP". Although the dirty log is recorded
since the write path already trying to add the dirty log, the logic for
logging check is broken and some side effect will occurs.

Enhance the logging check for mmu mapping so it can check both the dirty
ring and the dirty bitmap.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/mmu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2d3def024270..b5873bca9dce 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -142,9 +142,8 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 				enum kvm_mr_change change)
 {
 	/*
-	 * At this point memslot has been committed and there is an
-	 * allocated dirty_bitmap[], dirty pages will be tracked while
-	 * the memory slot is write protected.
+	 * At this point memslot has been committed and dirty pages will be
+	 * tracked while the memory slot is write protected.
 	 */
 	if (change != KVM_MR_DELETE && new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
 		if (kvm_dirty_log_manual_protect_and_init_set(kvm))
@@ -433,8 +432,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	struct vm_area_struct *vma;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_mmu_memory_cache *pcache = &vcpu->arch.mmu_page_cache;
-	bool logging = (memslot->dirty_bitmap &&
-			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
+	bool logging = kvm_slot_dirty_track_enabled(memslot) &&
+		       !(memslot->flags & KVM_MEM_READONLY);
 	unsigned long vma_pagesize, mmu_seq;
 	struct kvm_gstage gstage;
 	struct page *page;
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
