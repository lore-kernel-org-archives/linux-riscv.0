Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A84DECAAD4
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 18:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NmtBobFiH7r+ProJaW79McZXMAzF1c91qTAisFHeB9o=; b=s2VaniKy2ohJ+a
	xLEFnMQfAB3KTHrQR9DRBz4vpKsRo8bLzDC/6RDhusLpJipK4633FRUEcVWIIoRTq4pnv7d7STacj
	ZB7VNa44fl0rjkxm+Q2uF+nY704QgW3VnQeawv+LcWDjCvXRl0iyHYdJO32VkJWJmD0gE1ZNBRijr
	zhmua8PskMKhGHA8P4kdE/2/0Dr2nzE+FkBzfPFofv72doLOv+6GaDnsqF/QchBMPzt5vTNXLzxVY
	9IhX8rMd7dMoyiBz+rdIT4cUm/j07U0HfFSbSiHAlqqnMlaMvJWyUthd1ZwyR0/5JwdDgozw9JB8Y
	3j7ABW8rSIegtYlMWBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTS8n-007VNz-UG; Wed, 31 Aug 2022 18:08:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTS8l-007VN6-7G; Wed, 31 Aug 2022 18:08:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF8C061BF0;
	Wed, 31 Aug 2022 18:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A15C433D7;
	Wed, 31 Aug 2022 18:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661969318;
	bh=X2tPBwFu7XVmB6phIN9skedNXoCQvadtocOI5Ou7AtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=si7DSIRhdsRxBzfyCLDLcXGbY1zTdbsvSoQNoYlvoMOxZV8UzkgMKlyg+KlNF8K6N
	 znqPMfNc9gFbGi8sCI/zLztp3m7txw6R3E9ls0XQ6+Ifz5vj0aSW27KuWYW1mazaaV
	 TOUvOm9jJzeE6j90fHZTZtVe/YVHbcOai80JCMc1bQIdjzzl3TnBcKO8I58+LQO5Pe
	 ES5Pa5R1TA3akb7Qt3xtzvG3Cu7gGpv+XGulOubH6iNkKTCGdwzRerFQB4Lcmcnjxy
	 V+K7uuoLvu4anO3dJU+cIL79zUJJ3SW0FKetDPROyhjZ1Icd9562xCLQrzqNetnRFB
	 zqNaBhb+kRMLw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 1/5] RISC-V: KVM: Record number of signal exits as a vCPU stat
Date: Thu,  1 Sep 2022 01:59:16 +0800
Message-Id: <20220831175920.2806-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831175920.2806-1-jszhang@kernel.org>
References: <20220831175920.2806-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_110839_319765_213D9A30 
X-CRM114-Status: GOOD (  11.52  )
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

Record a statistic indicating the number of times a vCPU has exited
due to a pending signal.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 arch/riscv/kvm/vcpu.c             | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 60c517e4d576..dbbf43d52623 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -67,6 +67,7 @@ struct kvm_vcpu_stat {
 	u64 mmio_exit_kernel;
 	u64 csr_exit_user;
 	u64 csr_exit_kernel;
+	u64 signal_exits;
 	u64 exits;
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index d0f08d5b4282..3da459fedc28 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -28,6 +28,7 @@ const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	STATS_DESC_COUNTER(VCPU, mmio_exit_kernel),
 	STATS_DESC_COUNTER(VCPU, csr_exit_user),
 	STATS_DESC_COUNTER(VCPU, csr_exit_kernel),
+	STATS_DESC_COUNTER(VCPU, signal_exits),
 	STATS_DESC_COUNTER(VCPU, exits)
 };
 
@@ -973,6 +974,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		if (signal_pending(current)) {
 			ret = -EINTR;
 			run->exit_reason = KVM_EXIT_INTR;
+			++vcpu->stat.signal_exits;
 		}
 
 		/*
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
