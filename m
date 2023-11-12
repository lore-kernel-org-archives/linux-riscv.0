Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2445C4167D
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcqj1iTdCKzk0Hp/0UVYeJD1xmqueL4LEUjzFGOWJEI=; b=Bu1hpQBxuEgPfO
	8J41qrb5OWj2cgvOFYJwRfI6EpsN9cdBaxyUdddzkhmd7XbavBKm0hqXjI/alkFNQJdpCPf9YfgtS
	r8NNnaJ1UsqjepB2eVWhLR8Tuw2pBwSkoYhx8sEMfG97ZqX+tpBUXv7ijQDiBiPhJdlApcZM2pgFu
	MciwRN+m5sjgbV2w/gO7CzE0elgQ7Ec2RQRIV/GAJawJjPqHKar+wDiq6JQPZc4vBQdmld3QyDiQf
	Ah2jxdbH3eIFR/9ZeteWnc6G7EjwrYIV/5tfmv7zn+Ip8M4Mm4tKx2JPaRRKb1oO+4gNOv8pohkcc
	ODOUrq8jnFfWLXilrVsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23ob-00Bli8-2p;
	Sun, 12 Nov 2023 06:19:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23oY-00Bley-2X
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:19:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6B203B80A27;
	Sun, 12 Nov 2023 06:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E562C433CD;
	Sun, 12 Nov 2023 06:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769960;
	bh=dK4ton2oM+HkEOBvpM4c5CJzMl0JR/DxER2w5fW1tdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uxp8Fc+vLd1OxaYU6JHEobJ9lYSoyT6mwQRrxVaQHLsmnTO1D4uf+oE/hQ8pZEfO9
	 pAJtj7VRnQ9zBG+TSXtv6eTkf37UxZfFA4Hk6LYgFrXIqwAxwW3ZQ4F6/k/0DduMCE
	 qlMYWbc751aEgRudX/rL7cUXLbpS/X1y9DOGeZanW1TTWYFUnokD9byjiEHodJcu/0
	 Iil9U3Uaf5n9IISv32EMhC743m6kyCSKZ0VQ8t5k6qmeNHW0AonN8PVg8eZ+kxeheI
	 GRPTmdj+kurQ+mOgDuTqewn0Cj7scDwDXghLYpCxYR1E7IYwBjETB1B1XU5saALSBk
	 f3A5BZh6NAhWg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 38/38] 64ilp32 v.s. 64lp64
Date: Sun, 12 Nov 2023 01:15:14 -0500
Message-Id: <20231112061514.2306187-39-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221922_972747_EFE0E3B7 
X-CRM114-Status: GOOD (  10.52  )
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

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/Kconfig            | 1 -
 arch/riscv/include/asm/page.h | 2 +-
 init/main.c                   | 2 ++
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5106eab17811..acd6aa60ed84 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -160,7 +160,6 @@ config RISCV
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
 	select UACCESS_MEMCPY if !MMU
-	select ZONE_DMA32 if 64BIT
 
 config CLANG_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_CLANG
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 7c535e88cf91..f9af3e6b6e21 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -106,7 +106,7 @@ typedef struct page *pgtable_t;
  * We override this value as its generic definition uses __pa too early in
  * the boot process (before kernel_map.va_pa_offset is set).
  */
-#define MIN_MEMBLOCK_ADDR      0
+#define MIN_MEMBLOCK_ADDR      0x60400000ULL
 #endif
 
 #ifdef CONFIG_MMU
diff --git a/init/main.c b/init/main.c
index ad920fac325c..f88f0227e398 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1496,6 +1496,8 @@ static int __ref kernel_init(void *unused)
 	    !try_to_run_init_process("/bin/sh"))
 		return 0;
 
+	show_mem(0, NULL);
+
 	panic("No working init found.  Try passing init= option to kernel. "
 	      "See Linux Documentation/admin-guide/init.rst for guidance.");
 }
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
