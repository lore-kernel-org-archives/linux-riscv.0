Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C316C982ED
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 11:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKB90J4x1a1mrXL8QzReWBzV8i/pvqyklxh1LecDiok=; b=N7cn0srUkIG64y
	DBgUSAnMTdNZIjAqwPOhlQ8+0wBB5SnIHJ4ID4cl6ahSHfm08NhtPiQIrr2lZT6KEdazN6MEQSrPU
	K6NreAB4D6/VitUhKfO7exlV0X9pK0dqzJAJCx/xFkli12cw67OnKHhf1hLRjQV4EDuovEGV/Psit
	sU1F0Oq9DdkZVCXkYXkITvdAPulPwz3xjdTeKhuwgso4B5IxyZlQ33ezM3ZWchaI0YnuancNYfflQ
	I4BYeux8/o2OMymm6A/CBYdu4K9r0llJzmZnQMtL/4g7+vhbbu5q+mSerm9/0nJOJcfRSGgxytwU4
	9PRgyW8YqKXLcH1fPQeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c64-00000001tAU-2nZu;
	Mon, 21 Sep 2026 11:22:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c62-00000001tAE-46yR
	for linux-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6ef3phNMqqlA8Z4yqCL8AgS9AIUhshDlKUByQ4fToEc=; b=WQbqsEQgmvnZYPk7CKOr2plB/Z
	xIdNv1Tfu8UIDAjKSuUYZMHzJ3N1s9CnYLhFTH2D/nSkrNqtwR1gnXPbDEzLDKBHW0pXbLxt8/9rN
	i1Rv+ZEF6N+zJHzbpIC+gw5avJDg0cDAiAqUpF7AZTgeNLRwCeeWRExmgD7RGge/gbp+cnYBfDFej
	c4SMnRpnXVvQcSlM7ptLf+Oh0K7dq76SqYPrIb5cK+4cNUd3AQq3AXGNfWNM/gwm7VYZFqr8GUsOG
	jXWFj5VMBJZcoLmvtBZ3X6UeQAxfOtSqnFuIo05uRU7fG80gZhmg+Gu1J6NUVmJbSmqbanvGwO1K1
	juqyIsYw==;
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8c5g-0000000CC1g-1Xco
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 11:21:54 +0000
Received: by mail-qk2-x11.google.com with SMTP id d75a77b69052e-530c602630bso35470631cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 04:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989698; x=1790594498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ef3phNMqqlA8Z4yqCL8AgS9AIUhshDlKUByQ4fToEc=;
        b=LuRUm0D4Bdneg2v0S2plSIIsGarCgnYoVAZ18Dn2FQxm2lySUhbwF3obCrxAkq6Wcl
         npfA/M6DLL87BrPocqUpOVtFK/mZMUOdGQyMjJAtVKAd+GI7033cb0qGnsWabhbXP+uf
         DKkbmBkZ82yW94sW8pue4IXg0GxLZAKzk4IV1lJGmfykPgRWWG1/5XxTReFRg15moudZ
         6eEV0U6Tk/M+zUc/ETMuec4flnuA+Qyb3AQR8ft1NWBQdd0jeYX+Jmimj4eHW+6p1fUS
         FToSUCAXvnXmPohcrOCkXjZRWz5382C3M0kpIiLndtO/CNGTVxz9l1ta00CJZKA1vTtc
         ghKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989698; x=1790594498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ef3phNMqqlA8Z4yqCL8AgS9AIUhshDlKUByQ4fToEc=;
        b=jT9PFz+BCBcFH/NeHreMqRaujcQAnZnOJ3fIGuHcJB01r9l09ZKikWDWTpyHfdtHpG
         R59E3WghaACOnFoOhCEaw2doD2aEmHjd8M+GjRtXgmcx0mONGuBgaDrvR+g2A1ZPN0wb
         9IwPju4BQVMZxi+whPjsSzJewOliHzbmQZN8CfZbloC+0A4ClNnj/UAbZnS0vdwIt+Gz
         mrbjsUHItDwdMVkPX0nfHXbGT54a3SfyC++m17UiWPaR+dNaYBXuaWR+9RbashT5JQWb
         uzxVh/Q5RzbTcdlAW5F9hhSVvWubd45VcszV8IExgCSGYNxj3xsuGjdhwXC/1j+nbPvC
         z4Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzGdO7vqetQ1X82H4/j/qsWaBSsjJZqjXSNj5GD6rU3kKcfEHYDhbt21Un3hi5dLN4NaLe4QX82PkG2Yw==@lists.infradead.org
X-Gm-Message-State: AFuF++kGIlCtsPguBzGcEOZDV+WqBeTXAawvZhL6TQPAm+6WXWip1z2w
	E0G+vuHXLe3Mo0Qz042dGSNyM4WLXUcjDw1RyMAamcWK18lQ2pGjmj4qEgWEuA==
X-Gm-Gg: AYBFou2QrRRbeVoGaEgn2ot3Jp5xmTWpa7g7GUcTr+XhzMLicm3vZK4t0DzzK0wkgw9
	i861uDPe1bAUqiATXcJllogxVDQTa9i7a4LLUORRgCSj8ne+AbprlerYSF0jfRIz/asFNRSr0al
	nU+nsSpbIq7VLvimcxA1M298u2ZYLgoHy9qN6665dHHKbQFeQ0NE5uNZPMJiOBcB7WL+sjEvho7
	192kmxkeucBOKmRfjNe7YoyT8JcoCFzSGHXPzRkj8rVX8BCoRae2x7cB0BxeKtGtM9q3F9tgVMD
	Mgji02EfwXHr4q7kvbjemCWKd7KFNekx3eS+fiGjMJQhStv/LO+TbJXO/iXN1D+dxMbZB6Jd+ZZ
	5I33otTPy+kp+lHCBmZVplyF1163J/APxXljPKNa2Q0HKguWQanGMFfTyFJyG1mEsFLJ+grKpC8
	9QNz0xNJ2IieIlJ/rL0PxSWxH+jqK84K6fDbFcuSVhY36wcKkbGu6344gT4uf4gcJevM8NZ1mbs
	XhD3LYdVl0APtWOSfSMNg==
X-Received: by 2002:a17:90a:e18f:b0:39d:f5ef:b1d5 with SMTP id 98e67ed59e1d1-39e54aa347dmr15111936a91.7.1789989272818;
        Mon, 21 Sep 2026 04:14:32 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm13438703a91.0.2026.09.21.04.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:14:32 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jinyu Tang <tjytimi@163.com>,
	Wang Yechao <wang.yechao255@zte.com.cn>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 4/5] KVM: riscv: Free G-stage page tables after an RCU grace period
Date: Mon, 21 Sep 2026 20:14:01 +0900
Message-ID: <20260921111402.120911-5-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260921111402.120911-1-suunj1331@gmail.com>
References: <20260921111402.120911-1-suunj1331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_122149_222477_C2A623A2 
X-CRM114-Status: GOOD (  17.01  )
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

G-stage page tables are currently freed immediately after being
unlinked under mmu_lock. This is safe while all walkers hold mmu_lock,
as a table cannot be freed while a walker is using it. A subsequent
change will allow aging walks without mmu_lock, where a walker may
obtain a child table pointer just before a concurrent unmap unlinks
and frees the table.

Defer freeing unlinked page-table pages with call_rcu(). The parent
entry is cleared before the child table is retired, so new walkers
cannot acquire it while existing RCU-protected walkers can safely
finish using it.

Apply the same lifetime rule to the root PGD. Unpublish the root with
WRITE_ONCE() and defer its free with call_rcu(). Keep pgd_levels
unchanged so a walker that observed the old root continues to use
matching page-table metadata.

Wait for pending G-stage page-table callbacks with rcu_barrier() when
the RISC-V KVM module exits so that they complete before the module is
unloaded.

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/include/asm/kvm_gstage.h |  2 +-
 arch/riscv/kvm/gstage.c             | 16 +++++++++++++++-
 arch/riscv/kvm/main.c               |  3 +++
 arch/riscv/kvm/mmu.c                | 16 +++++++++++++---
 4 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index a03db1a10095..caeed6de6dbe 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -111,7 +111,7 @@ static inline void kvm_riscv_gstage_init(struct kvm_gstage *gstage, struct kvm *
 	gstage->kvm = kvm;
 	gstage->flags = 0;
 	gstage->vmid = READ_ONCE(kvm->arch.vmid.vmid);
-	gstage->pgd = kvm->arch.pgd;
+	gstage->pgd = READ_ONCE(kvm->arch.pgd);
 	gstage->pgd_levels = kvm->arch.pgd_levels;
 }
 
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index f7e4756ce15b..fc39d188b20a 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -22,6 +22,20 @@ unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 2;
 #define gstage_pte_leaf(__pte)	\
 	(pte_val(__pte) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
 
+static void gstage_free_page_table_rcu(struct rcu_head *head)
+{
+	put_page(container_of(head, struct page, rcu_head));
+}
+
+/*
+ * Defer freeing an unlinked page table until lockless walkers
+ * that may have observed it have exited.
+ */
+static void gstage_free_page_table(pte_t *table)
+{
+	call_rcu(&virt_to_page(table)->rcu_head, gstage_free_page_table_rcu);
+}
+
 static inline unsigned long gstage_pte_index(struct kvm_gstage *gstage,
 					     gpa_t addr, u32 level)
 {
@@ -406,7 +420,7 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 			flush |= kvm_riscv_gstage_op_pte(gstage, addr + i * next_page_size,
 							 &next_ptep[i], next_ptep_level, op);
 		if (op == GSTAGE_OP_CLEAR)
-			put_page(virt_to_page(next_ptep));
+			gstage_free_page_table(next_ptep);
 	} else {
 		if (op == GSTAGE_OP_CLEAR) {
 			set_pte(ptep, __pte(0));
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 89568ccce01d..5fcf425f7150 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -262,6 +262,9 @@ static void __exit riscv_kvm_exit(void)
 {
 	kvm_exit();
 
+	/* Wait for pending G-stage page-table RCU callbacks. */
+	rcu_barrier();
+
 	/* Unregister CPU PM notifier */
 	if (IS_ENABLED(CONFIG_CPU_PM))
 		cpu_pm_unregister_notifier(&kvm_riscv_cpu_pm_nb);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 342f606399e5..8aed69abf814 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -761,6 +761,13 @@ int kvm_riscv_mmu_alloc_pgd(struct kvm *kvm)
 	return 0;
 }
 
+static void kvm_riscv_mmu_free_pgd_rcu(struct rcu_head *head)
+{
+	struct page *page = container_of(head, struct page, rcu_head);
+
+	__free_pages(page, get_order(kvm_riscv_gstage_pgd_size));
+}
+
 void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 {
 	struct kvm_gstage gstage;
@@ -773,9 +780,12 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 		flush = kvm_riscv_gstage_unmap_range(&gstage, 0UL,
 			kvm_riscv_gstage_gpa_size(kvm->arch.pgd_levels), false);
 		pgd = READ_ONCE(kvm->arch.pgd);
-		kvm->arch.pgd = NULL;
+		/*
+		 * Keep pgd_levels unchanged for lockless walkers that already
+		 * observed the old root.
+		 */
+		WRITE_ONCE(kvm->arch.pgd, NULL);
 		kvm->arch.pgd_phys = 0;
-		kvm->arch.pgd_levels = 0;
 	}
 	write_unlock(&kvm->mmu_lock);
 
@@ -783,7 +793,7 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 		kvm_flush_remote_tlbs(kvm);
 
 	if (pgd)
-		free_pages((unsigned long)pgd, get_order(kvm_riscv_gstage_pgd_size));
+		call_rcu(&virt_to_page(pgd)->rcu_head, kvm_riscv_mmu_free_pgd_rcu);
 
 	kvm_mmu_free_memory_cache(&kvm->arch.pgd_split_page_cache);
 }
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
