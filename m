Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153CDC3DA59
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 17:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Utw4Bt2j5AE9hpsjcAXWbeFXph1wUGyQ51AsSw1LymE=; b=cDuYQUD0dpO9x6
	RqGOPR9RyFYPJoH0SZQfCOIxkLonhR/Nm0lz63WW8rmo+uUwMmQHSui+QD9ZzQzMGnwKX0O2o5uMD
	1rm7NvjQtXYIl/S3RxvHM1Lf0F7N7bz+GgAz50fKJUiMiTgK2p/STCsBrbURki7Nq2qo87VvcySoe
	v3Bztolo2dVqttNg3X+RqCSqwIIaeS9Ssl9bIg6cjqlSjX/n/qXomxDkor5WK6Wjm4D5VwOYoNoAT
	+4iay31fOTWbIaqSD1xdxZ6uNtENzH/Bg24fUpx8g9Pc1Rk42EAPKpQ7rWS46/IWwTC4O2VaosVEW
	1wiSd7yqY8MeBXpvujkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDrS-00000005Qj0-316g;
	Sat, 20 Jul 2024 17:27:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDrL-00000005Qdh-3Lc8
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jul 2024 17:27:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2439861171;
	Sat, 20 Jul 2024 17:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCEFC2BD10;
	Sat, 20 Jul 2024 17:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721496422;
	bh=8YWEf7rK4+5tGsSPanUmb4XQE9I8vrOKfPCp7u9NCeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Re7GD1nJZkP6/TKDh5zaK6UJbwlRjD13WrXU+U/uWsoCTIPCz+KkS+FWe8qzlMP59
	 wlaMSl5RD1er1zJPgMqSYWPvsRLTM2wGkplZ1jJf3w9Yv4HlMpoV9jdkNRSlb1bdiS
	 W0Z/iKOvCHmdepNmvdU10tVh0iDJuzMb4asXBIb36F+00MK6omqL5EqD3KHJ3eG9M6
	 Ib8eUV8z3NHnirkWteJ6P3BCBfD2UasMSk6lEjEzNX/qKJYolpbyxvDk1QsCPgq1jX
	 WZx2mswB0I3ykRY//D+kMEiNz+QxYkm6s7EEKaloqxysN9SlVnZ8impwwvBZnQAzL2
	 yz5VoNN3s1ktw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Clement Leger <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] riscv: traps: mark do_irq() as __always_inline
Date: Sun, 21 Jul 2024 01:12:32 +0800
Message-ID: <20240720171232.1753-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240720171232.1753-1-jszhang@kernel.org>
References: <20240720171232.1753-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_102703_990241_023EFA35 
X-CRM114-Status: GOOD (  10.49  )
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

Since do_irq() is only called in traps.c, so mark it as __always_inline
this will allow the compiler to get rid of the stack setup/tear down
code and eliminate a handful of instructions.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index dc1bc84cfe15..030c50cb4e78 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -378,7 +378,7 @@ static void noinstr handle_riscv_irq(struct pt_regs *regs)
 	irq_exit_rcu();
 }
 
-static void noinstr do_irq(struct pt_regs *regs)
+static __always_inline void do_irq(struct pt_regs *regs)
 {
 	irqentry_state_t state = irqentry_enter(regs);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
