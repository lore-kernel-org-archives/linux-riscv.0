Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F0EEE7FF4
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 08:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=agkUVqzuFRc/E2Mn1rf45vJcm/OmOUgw2PyUROVmfmU=; b=j25sLVdxLl9j4R
	gVzBQ2aX0WEKjSGVmjHdMSTdYeikGjDnt65ncaJ/sB7hWiLdJFXGPd0R5090YJoqkRZvUys/c5HFC
	7vS6OPFVCzemqH9ZV6p2hb+3Jw1wPYzPPQbr0sc4ApP6/wA2KRrFz1EEQsKnfW5aNXU6S6qmMY7UK
	5VM7VdSQL/azmDrw/Q1pV2VKXWCPZ7orAe6OkazTr7/Ux5VTbLeEeN5KAfRtTWmNespIk/grtpm8g
	L6qK8Z24rRz8E50VFJDGRNsqG7Ug0RFn59Q4No2YOx95Woc14TnNA14iMiPRw+9fhMK+1opZ3DYHr
	0lZtyVkUwEaYzM9BfKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFr0-00GID9-0X;
	Sun, 10 Sep 2023 08:31:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFqx-00GIAU-04
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 08:31:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B15C2B80AF6;
	Sun, 10 Sep 2023 08:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E823CC433C8;
	Sun, 10 Sep 2023 08:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694334692;
	bh=tGHFuxIP3SbPPf/Epb/Xnkxu5WfdeddjXtXxQeK/obc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YUKo/luMDwQ8ZTHKumNn75SdYE5FDukIjOgss5a5AbXFbueaYWrxKwu9Qkyj8QpzH
	 6ZTe9MLwdEREPEFTO+BHHd0E1QiUV/q/RCTlcE04SMv7lx+zDLCynlX3vKHZt2z7va
	 E/11VNyj8a4aIGWv24FBkPQordBCQuvBtQNul7krmNBWS3/gMvved/HvortUZXOw1B
	 HHCp8xJQaao+4BHm+WuJofLhiQSVvwQG3eqADFFZTcafRLFP/1waYYPh0PlZUpFy+J
	 VzQ8ykVD7bRApcaRbqsfoR8egd0/EE0OxCXQL4dsYaYUykxPJHUg9F7Cy83ImCsGQ2
	 qLELasFU6ESIg==
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
Subject: [PATCH V11 14/17] RISC-V: paravirt: pvqspinlock: Add kconfig entry
Date: Sun, 10 Sep 2023 04:29:08 -0400
Message-Id: <20230910082911.3378782-15-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230910082911.3378782-1-guoren@kernel.org>
References: <20230910082911.3378782-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_013135_193445_84AB5D0B 
X-CRM114-Status: UNSURE (   9.29  )
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

Add kconfig entry for paravirt_spinlock, an unfair qspinlock
virtualization-friendly backend, by halting the virtual CPU rather
than spinning.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig         | 12 ++++++++++++
 arch/riscv/kernel/Makefile |  1 +
 2 files changed, 13 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4bcff2860f48..ec0da24ed6fb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -813,6 +813,18 @@ config RELOCATABLE
 
           If unsure, say N.
 
+config PARAVIRT_SPINLOCKS
+	bool "Paravirtualization layer for spinlocks"
+	depends on QUEUED_SPINLOCKS
+	default y
+	help
+	  Paravirtualized spinlocks allow a unfair qspinlock to replace the
+	  test-set kvm-guest virt spinlock implementation with something
+	  virtualization-friendly, for example, halt the virtual CPU rather
+	  than spinning.
+
+	  If you are unsure how to answer this question, answer Y.
+
 endmenu # "Kernel features"
 
 menu "Boot options"
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 671ad85f28f2..114b29234c46 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -103,3 +103,4 @@ obj-$(CONFIG_ARCH_RV64ILP32)	+= compat_signal.o
 
 obj-$(CONFIG_64BIT)		+= pi/
 obj-$(CONFIG_ACPI)		+= acpi.o
+obj-$(CONFIG_PARAVIRT_SPINLOCKS) += qspinlock_paravirt.o
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
