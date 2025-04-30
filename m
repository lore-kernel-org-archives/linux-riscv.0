Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F177CC369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 20:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkEURa2dv6MpswyWu5r0zI2RGW10zlnt8QwYHJuS9YU=; b=RmoN9MLpSNCCNS
	ikPXuKX7uscVFInM/q/tTkHUGbIJLVGicXc/nEuYXeL4qy2ZxPMepHvDodjFE6aGjvfGe6uOjN8mM
	ro2hEifWTtLtxcRWRp19yMTUZZpxde3TmWM0bdb5KDlSa0jIO+2IkY3KC0mBged6MzxzhAdYbAroc
	jlx3RjyUseiWPXgOzTe/ribs1lnWvx8ahnmwwbw6YFhed18NV5J4brXu4DTuCdIcChubqoUoxhEre
	Hnx9hZMmDxxw9j9+9fhvUXQFBlvkNOKaXD+HVfgduo7W2fY7Ok5B/TJxRTqMmsigsSZFGrXms2lmk
	TVg1wZUYuJlqSMac3/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAEL2-0000000DyDO-1JCk;
	Wed, 30 Apr 2025 20:47:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAE5D-0000000DvNj-1Cf0
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 20:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+MZvmRfCtI61m/XdI87EqyqLvZ2yGHt28AUm8pnJCIE=; b=pE0dsMk0QJ7p3DD+T8RBgRGL1w
	iG9Soha2qRi0IKLzxtjXWHpNxQznloNKKutmn0tFaYcLsYccN0fKV8aqXoGgKH14R/Jux4/57MjNQ
	IajoCTeGh89LsuO/x+jSxHx7b2z156Y5yJPzcKxHEzKbXzNeGxBF+0Dd4fi5IevA9rGs/oxrjUeC/
	vrWyEXhJMizfRWDSAcw2pfXN6fMo83oDm4XY+SgJWNG6y6/90c8eiCo5BQqLLWXKZsETJD4RuhQ1r
	r/894TauQOPIvlaZ+goZaH5kcRFAwa21cLhJhtCSIrUtCI2hcm/1/aNB50hTCfhDcqvd/n6fdFeo5
	LQRiDUfg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAE59-0000000Dpvz-4Bh1
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 20:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+MZvmRfCtI61m/XdI87EqyqLvZ2yGHt28AUm8pnJCIE=;
	b=IZh5SiW0XbgKTnYpy2aFGIF9aVla9PeHJzEiswpsP/OcvRHIWpP+18OvE0ahwK6FRctdBW
	PuumUv96L1N6lwp8cp3TY9XCQkozM3SpZI27vbjC5d80xdpWp/L43/3iC7O2cyG3OQrI+3
	Pz7arrUVgu8vxDeNdIhiakuFDp42ZFY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+MZvmRfCtI61m/XdI87EqyqLvZ2yGHt28AUm8pnJCIE=;
	b=FoaRNP+I0rfaj5tTzilAcpPZl3qLW8lP635CDTyrfL5M3rTM8THgZTbeKntZlCljM9Uqyx
	4K1BZaeyfyyklw0jdRtYVbADnHz/As4db1SOHtZBSuSLIxe5Tuu0ko6daETkuFW+GKraLa
	45PdnpMGFcVCHZP6bYre+gHHfG5ngy0=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-44-gYJXFO_UNeOIXNgOfeawgA-1; Wed,
 30 Apr 2025 16:30:57 -0400
X-MC-Unique: gYJXFO_UNeOIXNgOfeawgA-1
X-Mimecast-MFC-AGG-ID: gYJXFO_UNeOIXNgOfeawgA_1746045053
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9DC291956094;
	Wed, 30 Apr 2025 20:30:52 +0000 (UTC)
Received: from intellaptop.lan (unknown [10.22.80.5])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 61B781800365;
	Wed, 30 Apr 2025 20:30:47 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Potapenko <glider@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Andre Przywara <andre.przywara@arm.com>,
	x86@kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	kvm-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jing Zhang <jingzhangos@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Sebastian Ott <sebott@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shusen Li <lishusen2@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marc Zyngier <maz@kernel.org>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v4 5/5] x86: KVM: SEV: implement kvm_lock_all_vcpus and use it
Date: Wed, 30 Apr 2025 16:30:13 -0400
Message-ID: <20250430203013.366479-6-mlevitsk@redhat.com>
In-Reply-To: <20250430203013.366479-1-mlevitsk@redhat.com>
References: <20250430203013.366479-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_213104_200910_40806934 
X-CRM114-Status: GOOD (  18.06  )
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

Implement kvm_lock_all_vcpus() and use it instead of
sev own sev_{lock|unlock}_vcpus_for_migration().

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/sev.c   | 72 +++-------------------------------------
 include/linux/kvm_host.h |  1 +
 virt/kvm/kvm_main.c      | 25 ++++++++++++++
 3 files changed, 30 insertions(+), 68 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 0bc708ee2788..16db6179013d 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -1882,70 +1882,6 @@ static void sev_unlock_two_vms(struct kvm *dst_kvm, struct kvm *src_kvm)
 	atomic_set_release(&src_sev->migration_in_progress, 0);
 }
 
-/* vCPU mutex subclasses.  */
-enum sev_migration_role {
-	SEV_MIGRATION_SOURCE = 0,
-	SEV_MIGRATION_TARGET,
-	SEV_NR_MIGRATION_ROLES,
-};
-
-static int sev_lock_vcpus_for_migration(struct kvm *kvm,
-					enum sev_migration_role role)
-{
-	struct kvm_vcpu *vcpu;
-	unsigned long i, j;
-
-	kvm_for_each_vcpu(i, vcpu, kvm) {
-		if (mutex_lock_killable_nested(&vcpu->mutex, role))
-			goto out_unlock;
-
-#ifdef CONFIG_PROVE_LOCKING
-		if (!i)
-			/*
-			 * Reset the role to one that avoids colliding with
-			 * the role used for the first vcpu mutex.
-			 */
-			role = SEV_NR_MIGRATION_ROLES;
-		else
-			mutex_release(&vcpu->mutex.dep_map, _THIS_IP_);
-#endif
-	}
-
-	return 0;
-
-out_unlock:
-
-	kvm_for_each_vcpu(j, vcpu, kvm) {
-		if (i == j)
-			break;
-
-#ifdef CONFIG_PROVE_LOCKING
-		if (j)
-			mutex_acquire(&vcpu->mutex.dep_map, role, 0, _THIS_IP_);
-#endif
-
-		mutex_unlock(&vcpu->mutex);
-	}
-	return -EINTR;
-}
-
-static void sev_unlock_vcpus_for_migration(struct kvm *kvm)
-{
-	struct kvm_vcpu *vcpu;
-	unsigned long i;
-	bool first = true;
-
-	kvm_for_each_vcpu(i, vcpu, kvm) {
-		if (first)
-			first = false;
-		else
-			mutex_acquire(&vcpu->mutex.dep_map,
-				      SEV_NR_MIGRATION_ROLES, 0, _THIS_IP_);
-
-		mutex_unlock(&vcpu->mutex);
-	}
-}
-
 static void sev_migrate_from(struct kvm *dst_kvm, struct kvm *src_kvm)
 {
 	struct kvm_sev_info *dst = to_kvm_sev_info(dst_kvm);
@@ -2083,10 +2019,10 @@ int sev_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
 		charged = true;
 	}
 
-	ret = sev_lock_vcpus_for_migration(kvm, SEV_MIGRATION_SOURCE);
+	ret = kvm_lock_all_vcpus(kvm);
 	if (ret)
 		goto out_dst_cgroup;
-	ret = sev_lock_vcpus_for_migration(source_kvm, SEV_MIGRATION_TARGET);
+	ret = kvm_lock_all_vcpus(source_kvm);
 	if (ret)
 		goto out_dst_vcpu;
 
@@ -2100,9 +2036,9 @@ int sev_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
 	ret = 0;
 
 out_source_vcpu:
-	sev_unlock_vcpus_for_migration(source_kvm);
+	kvm_unlock_all_vcpus(source_kvm);
 out_dst_vcpu:
-	sev_unlock_vcpus_for_migration(kvm);
+	kvm_unlock_all_vcpus(kvm);
 out_dst_cgroup:
 	/* Operates on the source on success, on the destination on failure.  */
 	if (charged)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 10d6652c7aa0..a6140415c693 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1016,6 +1016,7 @@ static inline struct kvm_vcpu *kvm_get_vcpu_by_id(struct kvm *kvm, int id)
 void kvm_destroy_vcpus(struct kvm *kvm);
 
 int kvm_trylock_all_vcpus(struct kvm *kvm);
+int kvm_lock_all_vcpus(struct kvm *kvm);
 void kvm_unlock_all_vcpus(struct kvm *kvm);
 
 void vcpu_load(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 834f08dfa24c..9211b07b0565 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1392,6 +1392,31 @@ int kvm_trylock_all_vcpus(struct kvm *kvm)
 }
 EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
 
+/*
+ * Lock all of the VM's vCPUs.
+ * Assumes that the kvm->lock is held.
+ * Returns -EINTR if the process is killed.
+ */
+int kvm_lock_all_vcpus(struct kvm *kvm)
+{
+	struct kvm_vcpu *vcpu;
+	unsigned long i, j;
+
+	kvm_for_each_vcpu(i, vcpu, kvm)
+		if (mutex_lock_killable_nest_lock(&vcpu->mutex, &kvm->lock))
+			goto out_unlock;
+	return 0;
+
+out_unlock:
+	kvm_for_each_vcpu(j, vcpu, kvm) {
+		if (i == j)
+			break;
+		mutex_unlock(&vcpu->mutex);
+	}
+	return -EINTR;
+}
+EXPORT_SYMBOL_GPL(kvm_lock_all_vcpus);
+
 void kvm_unlock_all_vcpus(struct kvm *kvm)
 {
 	struct kvm_vcpu *vcpu;
-- 
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
