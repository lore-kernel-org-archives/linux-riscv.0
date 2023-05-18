Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5DBC7EE2D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNGxLDDd0nM/TZ+gVMhQFH6LztnTEFxgfwMj23S+Urg=; b=U4ZbMPtEI5PPws
	4QSTAeluDKi4IKZP7Aix6A6r0aA9mi7WTu+BQ9grOWG+wgpi3s6cVOAonW/w4rtxcp6zQkS9fQ3jR
	q2d7TTUOa0cEpnBGBo7cNy1gC1PUZubihbD8i3jnKvQBwlBA5GB+/jia0uCdfhEMuR0094dD3nKpa
	x+LUYKnQwI2E6IhRYUuUykIMXuuRgrybvz6siYakndg/QlnIK/E706QFd77vJzCireFH8uFgsd5JO
	7CUcRfiHENt4Nz9QAsnJTSrNECuhUsvzfI7HB9dlS/dJPJQbNTRL1E0f1GnmX3EuNpLozYRIA+NOP
	DAtH4N2oKuYOjziVdxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdRu-00D2xR-0B;
	Thu, 18 May 2023 13:13:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdRr-00D2vs-2Z
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:13:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5BAB764F3A;
	Thu, 18 May 2023 13:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195B8C433A8;
	Thu, 18 May 2023 13:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415618;
	bh=fON6vf7tjch1Eg4H78YVWT75FX1UOvgM+cdcVq8dSsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u23kMThXHmJ++BOnqpsZjjQZeLcF6BmMabQ66dcskKDbNxmgadWJ009CTKZ0ZXFO8
	 9wmPSgVwfHWqv57McbVpBTo4mvjnqaZkcPO7fLJ/IhhKQuEryBsw7uMNKb+eIvL9IU
	 s/X2wT4/I5Nx02zvv6wVapEHBnLfFwa+m6DY4PlGXKNMlQooK2tjDYTvY17nN0DTyp
	 rQY4XIlND+PHAHUlGvtIWTP7eWyXNpXmhy4Fc3W23JN2nKnQlCbWZMvw1mM7dvdEMn
	 zqDiNXPmTMFKL29ygB/3ORIbk1AwJaKjrCswBNswWrSUibYKu7cMymqqkiU+dfD17L
	 16jkhw2h2BCUA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 15/22] riscv: s64ilp32: Enable native atomic64
Date: Thu, 18 May 2023 09:10:06 -0400
Message-Id: <20230518131013.3366406-16-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061339_871509_CCBE5517 
X-CRM114-Status: GOOD (  10.86  )
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

The traditional rv32 Linux (s32ilp32) uses a generic version of the
lib/atomic64.c, which are inaccurate atomic64 primitives and couldn't
co-work with READ_ONCE/WRITE_ONCE,  atomic_8/16/32. The s64ilp32 could
use native AMO instructions to implement accurate atomic64 primitives.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig              | 2 +-
 arch/riscv/include/asm/atomic.h | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 9c458496ec3a..33fe624ef6d3 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -60,7 +60,7 @@ config RISCV
 	select CPU_PM if CPU_IDLE
 	select EDAC_SUPPORT
 	select GENERIC_ARCH_TOPOLOGY
-	select GENERIC_ATOMIC64 if !64BIT
+	select GENERIC_ATOMIC64 if ARCH_RV32I
 	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
 	select GENERIC_EARLY_IOREMAP
 	select GENERIC_ENTRY
diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 0dfe9d857a76..edfa6a74fe04 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -16,6 +16,12 @@
 # endif
 #endif
 
+#ifdef CONFIG_ARCH_RV64ILP32
+typedef struct {
+	s64 counter;
+} atomic64_t;
+#endif
+
 #include <asm/cmpxchg.h>
 #include <asm/barrier.h>
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
