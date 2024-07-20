Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33032C3DA64
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 17:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0UB1GlTGIeoVCwOQWDdajSxrrLlMJZA/ZmkME5ala4=; b=vzSNIFRJyaVi7j
	p0x/nXWbHngAlK2G01mxvcxdt2dKEIKrjLI+hmfT4tLcj4OgRHEYc5DITbzbGt7nJ9lek8xzLdf8G
	Ktfjdh5uWSJvg+qrjLWzcvAR+rXiC/i3yF06ngLRcr+H4HWmgfJQYoidTBh01/4v5tIJDhjxYupsB
	V7aZsWXYCuHcBGnBkZWPIIP20PNbHsdUtLKvx9v9xI4D+dqTk42iFddHlGqeQ+PWQpzQ48O26trWw
	MrUGOng/lJWzQHakAPACM/CFgtC5x5APGkVjUGjZh12CwpWQeNG5H2A4k4hCJ0EgXvaEXS44rUaYt
	MNvtBP0n0DkxUQqbjW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDrI-00000005Qau-1KMX;
	Sat, 20 Jul 2024 17:27:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDrC-00000005QXm-36GD
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jul 2024 17:26:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 888D7CE010F;
	Sat, 20 Jul 2024 17:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E95C4AF09;
	Sat, 20 Jul 2024 17:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721496411;
	bh=NCFdc/pkut4LwN+MrcPmxA5eUoeddsannScPQZtdY/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hvlTkTWXkGaIxigUYa1gwQar5xanhbF93SHCip2ilWq5sLv5uxDeIy8BPjMTDtNRO
	 80D+AfczK9MoaU8hayhUVOcKkecYo114IlB7xBsFuQj1f1uc2UJwjZeYGFu5Rt6ycV
	 1yzyTb8oUNS8Tr1PYk8LjNALSCij22dli9rSGZGa6E/0qS0DjYzKTLdf7iUm4TPqBZ
	 lhxdComq3ce51D2+v9CZUsbaLcLLkXWqlUu11XOlhN5siC3kcPRVhCk8FoA0SJluuJ
	 Us5Hc+/eSm3qupIEKSBT3LkHnvKe3u+eamNdnwE7Lwjd7oSdMV5OxSOqMYUPos5aY1
	 toGQ3Pzc5Ca1A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Clement Leger <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] riscv: traps: staticalize handle_break()
Date: Sun, 21 Jul 2024 01:12:26 +0800
Message-ID: <20240720171232.1753-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240720171232.1753-1-jszhang@kernel.org>
References: <20240720171232.1753-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_102654_983081_B0720FCD 
X-CRM114-Status: UNSURE (   9.13  )
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

handle_break() is only called in traps.c, make it static.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/entry-common.h | 1 -
 arch/riscv/kernel/traps.c             | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index 2293e535f865..1458a41c6536 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -23,7 +23,6 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 #define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
 
 void handle_page_fault(struct pt_regs *regs);
-void handle_break(struct pt_regs *regs);
 
 #ifdef CONFIG_RISCV_MISALIGNED
 int handle_misaligned_load(struct pt_regs *regs);
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 05a16b1f0aee..84dff89f435d 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -270,7 +270,7 @@ static bool probe_breakpoint_handler(struct pt_regs *regs)
 	return user ? uprobe_breakpoint_handler(regs) : kprobe_breakpoint_handler(regs);
 }
 
-void handle_break(struct pt_regs *regs)
+static void handle_break(struct pt_regs *regs)
 {
 	if (probe_single_step_handler(regs))
 		return;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
