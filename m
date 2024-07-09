Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307B5C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05Gy++cO+w5RuvD8jhHMqmu6qL1IWEsN0M6yH8qTGec=; b=lS+DN+50o1CSZ6
	Txgb7pCchrsQe/f1htloIWSnhG+WXJzp/v77ZJoMS0o/DlH4OJ9mmQ6BSRx/OSdHZY3xYKL+++Ckk
	fDiTctmrGn6uR0lG5TRZV6r1nbxY+mJBgIeqWGlTvGJYACaH0fxM/HQxvUvYLQf3OOcB6JW/gQBoy
	vnylwzaZZd3nNRhacy69JL2o/VgD2btjx2klpjMdJbqxUI+xdYw0U88DJKhh4RjGZ3cqmw9OVvO+Y
	Lxb0e3GBLZoSyLvD0rmlbzv4fsjqp/bLqys41XvFkVCQ5NiEIpKdLKXTRp5wIflzB70vskS+l3Eut
	NYADHe+yxMeu14tM3UcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRDZI-00000007uNf-35iq;
	Tue, 09 Jul 2024 16:19:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRDZF-00000007uLW-3e2T
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 16:19:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32656614B7;
	Tue,  9 Jul 2024 16:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1C7C4AF07;
	Tue,  9 Jul 2024 16:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720541989;
	bh=LxdHS/iVvGgXLX0NrhPkm37EW8j2G1mEgzmdRErP8WM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dc8+heEEUlEQjy70KsSTH6WNgfr8V+N9kGMBv9C35PjHVuocYJwbEBglMVi+o/lXM
	 YQvK7dBQ6xSpg91CLqMXNYHmFNGV+DoYdZN4OHwbm6hyAJ09+RgDpQtCnDHSoxxvvv
	 INGvM+JoJ/pGu/ERfbcj/ApJI8WRNiPeOv2/4aCdMYFIZ+zKfCdPSO5IwS/c8lmRxE
	 6G6tMM0SGzTm5PDxiAAXy2FUXjpqmpa8b65AL+QBvmYdJbTS5Q5M49Ge0uVrKeN2Zp
	 hOTCxHP+NjFM5oIxyaEmJqR+Lx8Dw+Dfn5cpJfgPF+wDWeQGr2NnB68SIctQrznvMy
	 5qm3bqaeOHyig==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] riscv: select ARCH_USE_SYM_ANNOTATIONS
Date: Wed, 10 Jul 2024 00:05:22 +0800
Message-ID: <20240709160536.3690-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709160536.3690-1-jszhang@kernel.org>
References: <20240709160536.3690-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_091949_993564_32A30D51 
X-CRM114-Status: UNSURE (   7.17  )
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

Now, riscv has been converted to the new style SYM_ assembler
annotations. So select ARCH_USE_SYM_ANNOTATIONS to ensure the
deprecated macros such as ENTRY(), END(), WEAK() and so on are not
available and we don't regress.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0525ee2d63c7..c51b32a8ddff 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -62,6 +62,7 @@ config RISCV
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
+	select ARCH_USE_SYM_ANNOTATIONS
 	select ARCH_USES_CFI_TRAPS if CFI_CLANG
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if MMU
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
