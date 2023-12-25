Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90988C3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Dec 2023 13:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNYl//uVfrbsQtY8XaK/wdtDgqDUlOmIo09IunWbsBI=; b=monyZHX5Z3iQsm
	YF7ncdE52ZK1JRX39uMyEKgRzoov8Im7WPZ6jwma4XRrhGHsq39OQUFRUsn4HITqLZOu69/q+PNYn
	aLRDTWHfH1q/0c4r3bCxn5nXMn27IdzNa9MF0oFYMQR16q2kbPWIFcMQxo+APZk2TJAu9OXkQI7DT
	v3khAMc/XEaP50+vefwMEOMW1iwCcgppg/gH/zVr8iCWuSBr8P/6Vxmd/vKlySfk/HeHC7RPsodv4
	cY+ijaOkby/4PtGEdIQlDrsJ8l2dL3rmeWkBY93R503jWtQiXQYBCwYaDZEGk3MS72gi4DueEIJWv
	EIS6aa1TQZM3Luyd1Kxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHkYy-00Aslx-0b;
	Mon, 25 Dec 2023 13:00:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHkYu-00AsiC-1a
	for linux-riscv@lists.infradead.org;
	Mon, 25 Dec 2023 13:00:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 12B20CE0E7F;
	Mon, 25 Dec 2023 13:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F47EC433C9;
	Mon, 25 Dec 2023 12:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703509200;
	bh=ODSRlqemB7gRQiZhfDlWrTaT1uOIIWzSdyDrN4uUjz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HHLBBAnppN8o1pDLvfunhLB3Lt7KIVadT3NnTcn5SeCKjvTRQgM4K4iXQOFErew9F
	 ndXJaJGkSxgn856NCf4OewK7dyrSqkDQlE54srL+wIlNRs7pOZODCz4VUwGa6Xmf6+
	 bp+vPyCJJZYfGRt569xm7px0kHlXZOtgnipq7eozxtZM4ImLOAEwbhMAAXaRmPEzNq
	 Rki4RUiNkCK0vHj8j0j1huJYkDKcuGN0Q1v2LP/OGvHeytt2O+/tvNuF2pd6AeGDdb
	 St1pQ7BXZ7AreXCvnoA6IBJWYdBdFLfdHkFqR/ZEYRAToqSyeIX1YenPa9Dz0T1bpf
	 NZ6YmbH9G5kTg==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	panqinglin2020@iscas.ac.cn,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	leobras@redhat.com,
	peterz@infradead.org,
	anup@brainfault.org,
	keescook@chromium.org,
	wuwei2016@iscas.ac.cn,
	xiaoguang.xing@sophgo.com,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	uwu@icenowy.me,
	jszhang@kernel.org,
	wefu@redhat.com,
	atishp@atishpatra.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V12 12/14] RISC-V: paravirt: pvqspinlock: Add nopvspin kernel parameter
Date: Mon, 25 Dec 2023 07:58:45 -0500
Message-Id: <20231225125847.2778638-13-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231225125847.2778638-1-guoren@kernel.org>
References: <20231225125847.2778638-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_050004_717986_AC31B636 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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

From: Guo Ren <guoren@linux.alibaba.com>

Disables the qspinlock slow path using PV optimizations which
allow the hypervisor to 'idle' the guest on lock contention.

Reviewed-by: Leonardo Bras <leobras@redhat.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 +-
 arch/riscv/kernel/qspinlock_paravirt.c          | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b7794c96d91e..4aff81d741e2 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3927,7 +3927,7 @@
 			as generic guest with no PV drivers. Currently support
 			XEN HVM, KVM, HYPER_V and VMWARE guest.
 
-	nopvspin	[X86,XEN,KVM]
+	nopvspin	[X86,XEN,KVM,RISC-V]
 			Disables the qspinlock slow path using PV optimizations
 			which allow the hypervisor to 'idle' the guest on lock
 			contention.
diff --git a/arch/riscv/kernel/qspinlock_paravirt.c b/arch/riscv/kernel/qspinlock_paravirt.c
index 7d1b99412222..4b04c93c4b9b 100644
--- a/arch/riscv/kernel/qspinlock_paravirt.c
+++ b/arch/riscv/kernel/qspinlock_paravirt.c
@@ -43,8 +43,21 @@ EXPORT_STATIC_CALL(pv_queued_spin_lock_slowpath);
 DEFINE_STATIC_CALL(pv_queued_spin_unlock, native_queued_spin_unlock);
 EXPORT_STATIC_CALL(pv_queued_spin_unlock);
 
+static bool nopvspin __initdata;
+static __init int parse_nopvspin(char *arg)
+{
+       nopvspin = true;
+       return 0;
+}
+early_param("nopvspin", parse_nopvspin);
+
 void __init pv_qspinlock_init(void)
 {
+	if (nopvspin) {
+		pr_info("PV qspinlocks disabled\n");
+		return;
+	}
+
 	if (num_possible_cpus() == 1)
 		return;
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
