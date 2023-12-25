Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D34CC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Dec 2023 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHomQUgH0cHJuh6iK1QiaL3SCstFJ/kwHvip6OHB4K4=; b=CzsTPy+VSq/pPQ
	fAehvgCpTCCIp7+pLEd5agE62rPmVJI4nuDMUrO4tf0aY+cC691C4ZoXacpZpKrIZS4/RAFjsYphE
	pOFhOgw+lMwxiS1Zmhpacceh/mf4rXbPnFA1tM807ZXD5m8IWPw1v+eV3KDt4/g0ng705Db9LCwxe
	JkBjCvupkpE7Feamxu3QiF0JS9c6fb3UQyk6V7BfSWWYvP8WD5tzP3iL6m1JaRtylGt+g+Y9jnSdh
	FexPdTu9MA2KheNWN58BqoeK4n6gjvIdUAHJjFl1yf/ReHxwqG/N/QWO+Ia8IaMWYKLcL/Sq/KClz
	eHnciKi7svqitwG/5uKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHkZ2-00AsoJ-0d;
	Mon, 25 Dec 2023 13:00:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHkYx-00AskE-0U
	for linux-riscv@lists.infradead.org;
	Mon, 25 Dec 2023 13:00:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9C1B3B80B02;
	Mon, 25 Dec 2023 13:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B638FC433C7;
	Mon, 25 Dec 2023 13:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703509205;
	bh=StaFuzcUuHAmdOS1W5kvlQVaB4JSpyMdgCSoJ5pjJQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sYOnsCqwgW1tcB47qW116GGBQZB/reWYmeKv8UYPQHedatg3VxtJfbdBfVGXMQevr
	 JeywBCUgiEQ3YDWKXmC6KX2u2QKvcmgG9DWgQj7ygvxrpF99qol9yCZrgIg0tJZ38w
	 RygQO05nm3btR9KtQ9RSuhb+KX474IW6gTMveqDA0D92U8yTKieklcIcwsz1Rxngwe
	 Nqq4IW5JlgtqZh5FI+f4t1Oen+Q/EgnW2Cx+hx5SEW5sOEYCL3p94rgX59YmVKukbk
	 s3HQ08nKf8P5EWFKjk8tAXFqELPR5S1t26WTmTy+BbHx4uXCoyk7ATebs4LR3cBS+l
	 2a9uuVpXNhkLw==
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
Subject: [PATCH V12 13/14] RISC-V: paravirt: pvqspinlock: Add kconfig entry
Date: Mon, 25 Dec 2023 07:58:46 -0500
Message-Id: <20231225125847.2778638-14-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231225125847.2778638-1-guoren@kernel.org>
References: <20231225125847.2778638-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_050007_323832_BEF2543C 
X-CRM114-Status: UNSURE (   7.88  )
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

Reviewed-by: Leonardo Bras <leobras@redhat.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig         | 12 ++++++++++++
 arch/riscv/kernel/Makefile |  1 +
 2 files changed, 13 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b7673c5c0997..7df3d50733c6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -780,6 +780,18 @@ config RANDOMIZE_BASE
 
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
index fee22a3d1b53..2e0754e422cf 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -102,3 +102,4 @@ obj-$(CONFIG_COMPAT)		+= compat_vdso/
 
 obj-$(CONFIG_64BIT)		+= pi/
 obj-$(CONFIG_ACPI)		+= acpi.o
+obj-$(CONFIG_PARAVIRT_SPINLOCKS) += qspinlock_paravirt.o
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
