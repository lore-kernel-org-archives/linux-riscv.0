Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6924DEC8748
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhtEAIYtexGx+Oo6PvpEaNhGSfya4IQScCnN9klGe1M=; b=qpkqxNsGJPgzaa
	plKFuNOnFLHFPLGKvmxMejIPH9vmlxE98SxHlKuty9vwArJkwux2Pb2eYUIQHRHnwMY9MRFbk5+YE
	okRjWQH879qXZi2qHL/dWoTJqkp6N0Cgq8w5SIF1s+V/biF7Zk5VPplGR2eZnGdJGjBlz0w28m9hx
	YOkgjUEis1NyWY9XU+J4vwFeClg1nrxqzrIiH9Eos4ihNI/35hvNQJCUCDE27i5bUYZla/vR/RVfI
	UcDZXoEt/sLxt1HE5QBYw8kLmNXhBMo1lapp27/FUHQ/fn3L2ii2kr0+c0WQol51vJ2w2hLl3FSun
	FXZsvJ0RzTqo/XnMNojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFqI-00GHmS-1g;
	Sun, 10 Sep 2023 08:30:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFqF-00GHkh-1g
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 08:30:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E099B60BBF;
	Sun, 10 Sep 2023 08:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C15C433D9;
	Sun, 10 Sep 2023 08:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694334650;
	bh=SoZvKFZXtbiskPhol9IbrrRdWVVYxE0tEnebIhQLYjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cWrcngtzC02RvUnRT/XTeVpudmXjw3I1qeGhGggw3Iq9PSZxVJwmBblHZvCiFPaQc
	 1tKRdtRI/VPiltgsxVs7id5SPtt+CGH6TLvl7trrg/AD0PmC+/gyiabYMAJuYYpaND
	 BupmgNGxEAL3Lc/D+TS7Gxeacs2qGBGMSVfeIBlobhUCMbhKCmrLofJoAR27zMnAHD
	 MgUMuDrZY7p1ouq9HWZmI1LZR1gbRvDph7p5rjaYpNWRv/hYXfTYZmE/0kcKcvJ96H
	 qpbnT7fIx9lqxnOaeZ4XiPRWmmSK2nAc1C9FBmnpFD0BBm/Fk52hHbKi1xdE/YZIyg
	 Wl35o60jfaamQ==
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
	wuwei2016@iscas.ac.cn,
	leobras@redhat.com
Cc: linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V11 07/17] riscv: qspinlock: Introduce qspinlock param for command line
Date: Sun, 10 Sep 2023 04:29:01 -0400
Message-Id: <20230910082911.3378782-8-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230910082911.3378782-1-guoren@kernel.org>
References: <20230910082911.3378782-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_013051_844922_8C5B8649 
X-CRM114-Status: GOOD (  12.23  )
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
 Documentation/admin-guide/kernel-parameters.txt |  2 ++
 arch/riscv/kernel/setup.c                       | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 7dfb540c4f6c..61cacb8dfd0e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4693,6 +4693,8 @@
 			[KNL] Number of legacy pty's. Overwrites compiled-in
 			default number.
 
+	qspinlock	[RISCV] Force to use qspinlock or auto-detect spinlock.
+
 	qspinlock.numa_spinlock_threshold_ns=	[NUMA, PV_OPS]
 			Set the time threshold in nanoseconds for the
 			number of intra-node lock hand-offs before the
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index a447cf360a18..0f084f037651 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -270,6 +270,15 @@ static void __init parse_dtb(void)
 }
 
 #ifdef CONFIG_RISCV_COMBO_SPINLOCKS
+bool enable_qspinlock_key = false;
+static int __init queued_spinlock_setup(char *p)
+{
+	enable_qspinlock_key = true;
+
+	return 0;
+}
+early_param("qspinlock", queued_spinlock_setup);
+
 DEFINE_STATIC_KEY_TRUE(combo_qspinlock_key);
 EXPORT_SYMBOL(combo_qspinlock_key);
 #endif
@@ -277,7 +286,12 @@ EXPORT_SYMBOL(combo_qspinlock_key);
 static void __init riscv_spinlock_init(void)
 {
 #ifdef CONFIG_RISCV_COMBO_SPINLOCKS
-	static_branch_disable(&combo_qspinlock_key);
+	if (!enable_qspinlock_key) {
+		static_branch_disable(&combo_qspinlock_key);
+		pr_info("Ticket spinlock: enabled\n");
+	} else {
+		pr_info("Queued spinlock: enabled\n");
+	}
 #endif
 }
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
