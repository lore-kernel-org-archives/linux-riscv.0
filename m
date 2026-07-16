Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CFCC44512
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 06:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v7P1Ee7arSQWZBArYl0Xt7di13ZsIN61dv3d6qWqeaU=; b=wxASJE+9OJXsr9
	hB7f/SqsFmJqIc7v0Hev1GqcRe/sHfoYApfPU1FI3fZ6A97ISdWRskfnwbyFfQWpTCW5lJm7nLdyi
	V5jVaAJ5drSUwQTetYaXa92eUiyFULawrQjgzPbrFqIUeAwvFsXlivT/US6URt2JlRoYgEcZaMnPY
	XNrAaYu219TOoCHT07Jo8ZILmvqbtm9tCwBgN3VsrTbJPR4NmxS0gRKyhyL0pfS7PLDFuI/8+IEpv
	WseIZtOIFmrASIkTF1GfbpN9Hx0Acam6T/rsxQXzE1Om8VT+QWicYqlYm7bf0BL2tVUIO6/5z60yD
	2CfNG35rAdljbRLonvwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFmk-0000000GYQm-1CLl;
	Thu, 16 Jul 2026 06:41:30 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFmh-0000000GYPk-3kCh
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 06:41:29 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-848743155bcso1240157b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 23:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784184087; x=1784788887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjQuW5mlyWifimpzaOD1tTXEImiFatMtZy5sO/KVJYY=;
        b=Ss+9qvwuCG77dMy6ySMQmdmocFQt61w71bCmC+K6ufQLyDsGlnQlcaGQ+a9hdFO2FN
         HJJjyUi2QOvjtnUKQbLb7+QyP5xmogStatFp+11Vg/AFO86fNV+qdFz9exVmdxxRYGoH
         xdPJZ76z8bmNpTd/TYfcn/ZJrwMiDov05AOtgKZHFS/ptO4w72uUuv1NAeRu3TS+ISB3
         REx//yUkPWw4BkN4/Qv4Rinwf4367fZUYXqtUO4XoZPjqzCM0/gALShXVulca0jurO4g
         JfuoESxEul4HnQ76i4FFua/ofV3Pu7sGDSO4+hmSuiLFv3M+gn7A0RFYwDq6IHkaRKFX
         p2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784184087; x=1784788887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjQuW5mlyWifimpzaOD1tTXEImiFatMtZy5sO/KVJYY=;
        b=SwiImjYMZnXB3/NR3D56jk/PrdbzwaDpE3PRclG8/TAza3/lde0jLHJbYUk5+hxSbj
         X3V+AKeyjcT2PgZTsp/RlyoyVCnI+NEV5r238iPw1X9olzViQVZX6STfi+iFeZ4uVWhP
         x5Q95FOV1uZ0xgFw248NQRaeZPuenFO/rQ4ZaFFZe1OY0+NxWylbVCqsLVWYDLG4aqea
         s7MtsgY/JIpTQFBwNaERZznteSDBAGwRAjwri6+rHPq0K7hQ5Btvj3Kdpb7eUQM0FTpq
         N9gn5kImhTWmPk7NKWzGCWzo9x8XyVb4HYiC+/rNG/dpHJIw6cS8QbaIwa5awY8T6KUm
         FJLA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+ICDECXp5PQckUPHpL6aFqADUumJtNzNPLktfqZJIBA2NEJFvZUrmpsGYpZc76+CwCWC6wGN/l5DriQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAUaZEna/zsH8YFC9uVX84NpHegtNVj9i7+ifO/cS9M9vg0XGQ
	jdcq7qhm48UAOvX8lnqRwAzbSHOgrpjB78BJC6FgXTmXUCOSVMRTtk/T
X-Gm-Gg: AfdE7cnGfqpKj29GCVosNMXLSl37w51NLv9p2ihgBBmEF/VqJSnHRaCswTT8G3YvMqE
	a3EQ4PMM28YyTVnwcmmu1e+agS5qLxL8KsvCWUUonE/QlLnouq7crt+csj05Dz260R1kllbJP/q
	p0joKo51xuLh7EECmEO6w+GB0L2h/xloU7XAoZ4EgeNX3+SdqZ5189ZlzscA2T7sLBNqp7YhQzS
	A2rLLTEydOPmEoPiZsBJJRxQGsZngDx71qXYhBmmCaXW3ScgYiZNCh4Sx6QAEM2YulJXbwN7iAK
	iEpgT+J+AR4rHnbuF80Fuv2vuzgr26mR9LHZoZrkXwPhS1vRq/TuGyovQDw26UCeQ6l4RkdMxIf
	jvRBzUJNvmaH8fHUNa18kOSR4dYwa4TEQVbb7MUAPZCM95HqY/oNcxzt2G93RblYhrju3w6qfxD
	jintUSU0ZefXpYZY/BbKtUxRaaERN766E=
X-Received: by 2002:a05:6a00:2991:b0:845:dfef:75b8 with SMTP id d2e1a72fcca58-848895db49fmr18808064b3a.15.1784184086792;
        Wed, 15 Jul 2026 23:41:26 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258ff402asm1254719a12.22.2026.07.15.23.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 23:41:26 -0700 (PDT)
From: yhchen312@gmail.com
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Yuhang.chen" <yhchen312@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH] RISC-V: KVM: Account VM-scoped allocations to the VM cgroup
Date: Thu, 16 Jul 2026 14:41:12 +0800
Message-Id: <20260716064112.2387938-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_234127_940557_B698AF89 
X-CRM114-Status: GOOD (  11.88  )
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

From: "Yuhang.chen" <yhchen312@gmail.com>

Charge the per-VM and per-vCPU allocations (stage-2 PGD, APLIC state,
IMSIC context, vector context, FWFT config, PMU snapshot) to the
allocating process's memory cgroup via GFP_KERNEL_ACCOUNT / __GFP_ACCOUNT.
Per-CPU module-init allocations and transient scratch buffers are left
unaccounted.

Measured results (KVM guest run in a memory cgroup; VM cgroup
memory.current after guest boot):

  VM cgroup memory.current    1044480 bytes

Assisted-by: YuanSheng:deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Yuhang.chen <yhchen312@gmail.com>
---
 arch/riscv/kvm/aia_aplic.c     | 3 ++-
 arch/riscv/kvm/aia_imsic.c     | 4 ++--
 arch/riscv/kvm/mmu.c           | 4 ++--
 arch/riscv/kvm/vcpu_pmu.c      | 2 +-
 arch/riscv/kvm/vcpu_sbi_fwft.c | 2 +-
 arch/riscv/kvm/vcpu_vector.c   | 4 ++--
 6 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
index 748107c347d9..be902ea6480b 100644
--- a/arch/riscv/kvm/aia_aplic.c
+++ b/arch/riscv/kvm/aia_aplic.c
@@ -581,7 +581,8 @@ int kvm_riscv_aia_aplic_init(struct kvm *kvm)
 		return 0;
 
 	/* Allocate APLIC global state */
-	aplic = kzalloc_flex(*aplic, irqs, kvm->arch.aia.nr_sources + 1);
+	aplic = kzalloc_flex(*aplic, irqs, kvm->arch.aia.nr_sources + 1,
+			     GFP_KERNEL_ACCOUNT);
 	if (!aplic)
 		return -ENOMEM;
 	kvm->arch.aia.aplic_state = aplic;
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index d38f5de0834c..507d82e5bc88 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -1108,7 +1108,7 @@ int kvm_riscv_vcpu_aia_imsic_init(struct kvm_vcpu *vcpu)
 		return -EINVAL;
 
 	/* Allocate IMSIC context */
-	imsic = kzalloc_obj(*imsic);
+	imsic = kzalloc_obj(*imsic, GFP_KERNEL_ACCOUNT);
 	if (!imsic)
 		return -ENOMEM;
 	vcpu->arch.aia_context.imsic_state = imsic;
@@ -1121,7 +1121,7 @@ int kvm_riscv_vcpu_aia_imsic_init(struct kvm_vcpu *vcpu)
 	imsic->vsfile_hgei = imsic->vsfile_cpu = -1;
 
 	/* Setup IMSIC SW-file */
-	swfile_page = alloc_pages(GFP_KERNEL | __GFP_ZERO,
+	swfile_page = alloc_pages(GFP_KERNEL_ACCOUNT | __GFP_ZERO,
 				  get_order(sizeof(*imsic->swfile)));
 	if (!swfile_page) {
 		ret = -ENOMEM;
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 082f9b261733..9b1d809daf2c 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -669,8 +669,8 @@ int kvm_riscv_mmu_alloc_pgd(struct kvm *kvm)
 		return -EINVAL;
 	}
 
-	pgd_page = alloc_pages(GFP_KERNEL | __GFP_ZERO,
-				get_order(kvm_riscv_gstage_pgd_size));
+	pgd_page = alloc_pages(GFP_KERNEL_ACCOUNT | __GFP_ZERO,
+			       get_order(kvm_riscv_gstage_pgd_size));
 	if (!pgd_page)
 		return -ENOMEM;
 	kvm->arch.pgd = page_to_virt(pgd_page);
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index bb46dcbfb24d..e5018784779d 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -452,7 +452,7 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 		}
 	}
 
-	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
+	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC | __GFP_ACCOUNT);
 	if (!kvpmu->sdata) {
 		sbiret = SBI_ERR_FAILURE;
 		goto out;
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index ab39ac464ffd..4984d3e54e23 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -377,7 +377,7 @@ static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
 	int i;
 
 	fwft->configs = kzalloc_objs(struct kvm_sbi_fwft_config,
-				     ARRAY_SIZE(features));
+				     ARRAY_SIZE(features), GFP_KERNEL_ACCOUNT);
 	if (!fwft->configs)
 		return -ENOMEM;
 
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 62d2fb77bb9b..d748e7d825e1 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -76,11 +76,11 @@ void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
 
 int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
 {
-	vcpu->arch.guest_context.vector.datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
+	vcpu->arch.guest_context.vector.datap = kzalloc(riscv_v_vsize, GFP_KERNEL_ACCOUNT);
 	if (!vcpu->arch.guest_context.vector.datap)
 		return -ENOMEM;
 
-	vcpu->arch.host_context.vector.datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
+	vcpu->arch.host_context.vector.datap = kzalloc(riscv_v_vsize, GFP_KERNEL_ACCOUNT);
 	if (!vcpu->arch.host_context.vector.datap) {
 		kfree(vcpu->arch.guest_context.vector.datap);
 		vcpu->arch.guest_context.vector.datap = NULL;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
