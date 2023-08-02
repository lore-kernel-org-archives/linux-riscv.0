Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93A2C001E0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 16:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/8t827eAEK/HhpnSsVrH32ql0Dmf2igghZTaKSsCmg=; b=FkvKTbe2t3uO03
	zANeZOVGuoVkQDlgHB6Wc4JadlzQ9/vg0iALoVTHCR/JrBd7P6WbXLh/CVtpaFo7Kxlm4qLiENY/L
	X/4kI1qFG7jzPsalW64SsEv3FbxKg4JWMT4sQS5k3WRLp6KUqMpfXBUdeKlxZ9zFFvWljYQLUN01V
	d7kngNYEcjSCt9i6P5H8rJL6tV92ziP+g2QI8a7npS6n8HCEUluIWaE0T2uo0LR0a7w+wmBn5ila3
	Kyc7m5qdceR4izribnJeybIoAS8xlPJY4+7KVz5AE35ikirs1Qo7UEiDV//iW1ujdMPYQqY+2y6uR
	sSKW6QNBxzEzvkSl5BHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF2G-005OdM-2c;
	Wed, 02 Aug 2023 16:49:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF2E-005Obt-05
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 16:49:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7213861A3D;
	Wed,  2 Aug 2023 16:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E672FC433C8;
	Wed,  2 Aug 2023 16:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690994956;
	bh=zXadGqM9fefJG2o17N1iiWReM7OXWmGr0IUdQMbdNag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sDcnqDZRSZQ9uG7QJ0aVY5DisKCP515Eyzx7mvxzsL6P5Ul/fPNNvSb32twmSd8it
	 qieRnrGYw7HOj5JqJemsIUZpitoct9zldeVgAPk7BGpFg0GqYqJrv50b/Z50HtqDUp
	 XfHXw9O4jBEhAnsasVvlR0HBZpfDl0V9JUrXc6qihxYjkweOOXC8REcSnqv4d0waYU
	 Ty7CSFAQ8X4j0hWebV+aGG0czYf6lnmYjfkJgXTCQOf2LMxmrFOHxHh5eICKrAlpgx
	 5lH/Q2Jf841KXPYPQlDJkI+zB0CjAaKJphP5IvKA5WhjLlqlnxheOJQxLDirACCoiI
	 aGGEYb4YF7f3w==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	anup@brainfault.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	palmer@rivosinc.com,
	longman@redhat.com,
	boqun.feng@gmail.com,
	tglx@linutronix.de,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	rdunlap@infradead.org,
	catalin.marinas@arm.com,
	conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	keescook@chromium.org,
	greentime.hu@sifive.com,
	ajones@ventanamicro.com,
	jszhang@kernel.org,
	wefu@redhat.com,
	wuwei2016@iscas.ac.cn
Cc: linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V10 06/19] riscv: qspinlock: Allow force qspinlock from the command line
Date: Wed,  2 Aug 2023 12:46:48 -0400
Message-Id: <20230802164701.192791-7-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230802164701.192791-1-guoren@kernel.org>
References: <20230802164701.192791-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_094918_149449_C3A78717 
X-CRM114-Status: GOOD (  13.07  )
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

Allow cmdline to force the kernel to use queued_spinlock when
CONFIG_RISCV_COMBO_SPINLOCKS=y.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  3 +++
 arch/riscv/include/asm/cpufeature.h             |  2 ++
 arch/riscv/kernel/cpufeature.c                  | 15 ++++++++++++++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index be40bfbf4380..de6b7ee752cd 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4666,6 +4666,9 @@
 
 	quiet		[KNL] Disable most log messages
 
+	qspinlock	[RISCV] Forces kernel to use queued_spinlock when
+			CONFIG_RISCV_COMBO_SPINLOCKS=y.
+
 	r128=		[HW,DRM]
 
 	radix_hcall_invalidate=on  [PPC/PSERIES]
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 23fed53b8815..2bf0343661da 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -30,4 +30,6 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
+extern bool force_qspinlock;
+
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index e65b0e54152d..f8dbbe1bbd34 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -99,6 +99,17 @@ static bool riscv_isa_extension_check(int id)
 	return true;
 }
 
+#ifdef CONFIG_QUEUED_SPINLOCKS
+bool force_qspinlock = false;
+static int __init force_queued_spinlock(char *p)
+{
+	force_qspinlock = true;
+	pr_info("Force kernel to use queued_spinlock");
+	return 0;
+}
+early_param("qspinlock", force_queued_spinlock);
+#endif
+
 void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
@@ -331,7 +342,9 @@ void __init riscv_fill_hwcap(void)
 		 * spinlock value, the only way is to change from queued_spinlock to
 		 * ticket_spinlock, but can not be vice.
 		 */
-		set_bit(RISCV_ISA_EXT_XTICKETLOCK, isainfo->isa);
+		if (!force_qspinlock) {
+			set_bit(RISCV_ISA_EXT_XTICKETLOCK, isainfo->isa);
+		}
 #endif
 
 		/*
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
