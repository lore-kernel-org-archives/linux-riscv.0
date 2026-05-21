Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF57CD4F3D
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PK+E89pb70rInwVIUsgNcWhak1hU7VhD08QmekSb8N4=; b=y7rJPLgZd6aXhH
	wNdp2eEDaTscnzdbrdwHnf5bPb058x/2xn0ORLeWQLVy5BbtdauI2T1fCxw9Ckb24o5B+wwj37UAa
	J4qkpUlShHw6sE/jdnAfNEhOzmJISSsC+hOWJJqjCk3evAJLqQu4yWMX1VQQdIHiBsuys4AnVba+C
	SwULJCcf55xHTduFPSERhk1qCNR7U0+7dPk2lTg7fF0Tc0qqAmyhzIb1yMG3Zdtj6o5MMuwPa5v+L
	pSJGqKZjB6wYP2D07yLWChnQxvy2Tlv5tS4dK5Brn9EVuQDckKnSKfu211vYbfOP3QGck6qPKHg+k
	9JY3lOU6/wA+tyobsveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4GX-000000082R7-1ByJ;
	Thu, 21 May 2026 14:20:49 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4GU-000000082OP-3Vn4;
	Thu, 21 May 2026 14:20:48 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAA3UNewFA9qSZHSEQ--.27615S2;
	Thu, 21 May 2026 22:20:32 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH] RISC-V: KVM: Fix TOCTOU race in SBI system suspend handler
Date: Thu, 21 May 2026 14:20:30 +0000
Message-Id: <20260521142030.1560861-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAA3UNewFA9qSZHSEQ--.27615S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF1fWrW8uF4DJry5Cr1fCrg_yoWrCF4DpF
	Za9FsY9r4rGr1xAwnFyF4Dur4YgFs5Kr43ArWDurWrXr4YyryrXrsYkrW7XryDJFWFgF9a
	9F1jka15uF15JFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU6c_3UUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCRELCWoLKrae5wABsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_072047_250892_53742345 
X-CRM114-Status: GOOD (  13.96  )
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

The SBI SUSP handler kvm_sbi_ext_susp_handler() checks that all other
vCPUs are stopped before entering system suspend, but it does not hold
mp_state_lock during the iteration. A concurrent HSM HART_START from
another vCPU can start a target vCPU after the SUSP handler has already
checked it, violating the invariant that all vCPUs must be stopped
before suspend.

Fix this with a two-phase approach:
1. Set a VM-wide suspend_in_progress flag before the iteration to block
   concurrent HSM HART_START. The HSM start handler checks this flag
   under its existing mp_state_lock, closing the race.
2. Hold mp_state_lock during each per-vCPU stopped check so that
   mp_state reads are ordered against concurrent power_on/power_off
   writes on the other side of the lock.

The flag is self-clearing: it resets when any vCPU re-enters
kvm_arch_vcpu_ioctl_run after the suspend-resume cycle completes.

Fixes: 023c15151fbb ("RISC-V: KVM: Add SBI system suspend support")
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Assisted-by: YuanSheng:DeepSeek-V3.2
---
 arch/riscv/include/asm/kvm_host.h |  3 +++
 arch/riscv/kvm/vcpu.c             |  8 ++++++++
 arch/riscv/kvm/vcpu_sbi_hsm.c     | 11 +++++++++++
 arch/riscv/kvm/vcpu_sbi_system.c  | 10 ++++++++++
 4 files changed, 32 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 75b0a951c1bc6..c4e710ec40f90 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -93,6 +93,9 @@ struct kvm_arch {
 
 	/* KVM_CAP_RISCV_MP_STATE_RESET */
 	bool mp_state_reset;
+
+	/* Set by SBI SUSP to block concurrent HSM HART_START during system suspend */
+	bool suspend_in_progress;
 };
 
 struct kvm_cpu_trap {
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a73690eda84b5..ea6f14244addb 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -838,6 +838,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	/* Mark this VCPU ran at least once */
 	vcpu->arch.ran_atleast_once = true;
 
+	/*
+	 * Clear stale suspend flag from a previous suspend-resume cycle.
+	 * The flag was set by kvm_sbi_ext_susp_handler() and persists
+	 * across the userspace exit; clearing it here ensures subsequent
+	 * HSM HART_START operations are not blocked after resume.
+	 */
+	WRITE_ONCE(vcpu->kvm->arch.suspend_in_progress, false);
+
 	kvm_vcpu_srcu_read_lock(vcpu);
 
 	switch (run->exit_reason) {
diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index f26207f84bab6..2f88d93768bc8 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -31,6 +31,17 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
 		goto out;
 	}
 
+	/*
+	 * Reject HART_START while a system suspend is in progress.
+	 * kvm_sbi_ext_susp_handler() sets this flag before checking
+	 * that all vCPUs are stopped; checking it here under
+	 * mp_state_lock closes the race.
+	 */
+	if (READ_ONCE(target_vcpu->kvm->arch.suspend_in_progress)) {
+		ret = SBI_ERR_DENIED;
+		goto out;
+	}
+
 	kvm_riscv_vcpu_sbi_request_reset(target_vcpu, cp->a1, cp->a2);
 
 	__kvm_riscv_vcpu_power_on(target_vcpu);
diff --git a/arch/riscv/kvm/vcpu_sbi_system.c b/arch/riscv/kvm/vcpu_sbi_system.c
index c6f7e609ac794..b79c1cff7a996 100644
--- a/arch/riscv/kvm/vcpu_sbi_system.c
+++ b/arch/riscv/kvm/vcpu_sbi_system.c
@@ -35,13 +35,23 @@ static int kvm_sbi_ext_susp_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			return 0;
 		}
 
+		/*
+		 * Set the VM-wide flag to block concurrent HSM HART_START
+		 * from racing with the per-vCPU stopped checks below.
+		 */
+		WRITE_ONCE(vcpu->kvm->arch.suspend_in_progress, true);
+
 		kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
 			if (tmp == vcpu)
 				continue;
+			spin_lock(&tmp->arch.mp_state_lock);
 			if (!kvm_riscv_vcpu_stopped(tmp)) {
+				spin_unlock(&tmp->arch.mp_state_lock);
+				WRITE_ONCE(vcpu->kvm->arch.suspend_in_progress, false);
 				retdata->err_val = SBI_ERR_DENIED;
 				return 0;
 			}
+			spin_unlock(&tmp->arch.mp_state_lock);
 		}
 
 		kvm_riscv_vcpu_sbi_request_reset(vcpu, cp->a1, cp->a2);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
