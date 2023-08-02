Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8296C001E0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 16:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACrKO1m7tJSFIcjFeIiBnjuqRJcUPhhhqPxHAixeQbg=; b=bg/7BmKXF+587N
	lwjM8ln8qHl6Cb1LSc6ui8uUZwddv/IQSuN4XJHmZmATaEAW6HjYQv1FZhXnv4emZZ4rCDL8OgUi6
	ZCelk2jQ0XyD9WuFFcskyKzRQBIO7alZyLE+XSjFbZu5mdc16R95LfS7XE8WGcwhwVM+Zug5Koj3e
	G51JYTUsIIk0QNosrDyQoHBZ9Giid+u5v28oBg3ZIHt5HausCRNjdYpimUHs6iDFaQ1GNbozr5jGL
	mPw3HmYVV6nVvbnUxe8F+WIU1uYsRTWyOixRMX4PyFHL2DmBtZvA+dGnWlX7NhzRhPBMkNUlPo8EP
	X6AQePCGKSz0Oo2AYGnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF4s-005PfJ-0Q;
	Wed, 02 Aug 2023 16:52:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF4p-005Pdf-2w
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 16:52:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 671B361A40;
	Wed,  2 Aug 2023 16:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FD1C433C8;
	Wed,  2 Aug 2023 16:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690995118;
	bh=//LTBV3xtswilX9AAt8SaQJo9J60NYzf9Q4p8qd3nq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ec6jPCAuR3FS/NUe+ahVBDwwzJtZT0QQx4PS1ef6BZOb0kZD/ocsGIn873rcg1aCT
	 MWEqlqSuKzbbkoYLVzOfNKiPREf+rHk7IrgySkp7nO5mnusalgpof9DWuqunetYYtm
	 FaYi6LjVpusePPnVQMcBZPyO+I+2iyFf9vezvM+xOOsEFDvGSnVbvVxQNTA+WHssLO
	 VJFkpJfObVNT7vGwiRAg2HTPJG3CUOEhrh+yQDjMaKZMvsSV1dujW2vwC814Y+dRvJ
	 s9dCGuyyt9dVGl4bHJIrQXCVb8nVp8JDSzeLvom7te0x87nFPR7bmFcbiyikd54Nn+
	 G8435ns6CyMDw==
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
Subject: [PATCH V10 16/19] RISC-V: paravirt: pvqspinlock: Add kconfig entry
Date: Wed,  2 Aug 2023 12:46:58 -0400
Message-Id: <20230802164701.192791-17-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230802164701.192791-1-guoren@kernel.org>
References: <20230802164701.192791-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_095200_007233_012B0959 
X-CRM114-Status: UNSURE (   9.88  )
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
 arch/riscv/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 42ae45c42b4d..13f345b54581 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -770,6 +770,7 @@ config RELOCATABLE
 config PARAVIRT
 	bool "Enable paravirtualization code"
 	depends on RISCV_SBI
+	select PARAVIRT_SPINLOCKS
 	default y
 	help
 	  This changes the kernel so it can modify itself when it is run
@@ -788,6 +789,17 @@ config PARAVIRT_TIME_ACCOUNTING
 
 	  If in doubt, say N here.
 
+config PARAVIRT_SPINLOCKS
+	bool "Paravirtualization layer for spinlocks"
+	depends on PARAVIRT && SMP
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
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
