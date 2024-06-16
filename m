Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05724C27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 17:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cr+s8l1l6MQj9E6VhHRp0x28NCzIYnxsnMjeTMvofus=; b=id1IW3G9FMf+zr
	84wuL5sE0P7y+4NtZgfbmG2TI5A3ikwd7dHOt2Fiatca9e/0KiMGpxRdoAHrct3rC4g5KNBbZQsLI
	8/FPkO1ZNCcB2Gxce4sgFajLp1MUZIy9GnjjCXFfOq+HBc3OKbccNihOtHeyB+o4NoHsmDMZlH7Oa
	EtQ9YHkrrTn6VmrqSC1OQ/uMzvoG6OZkMB6qhrtRyNgcUtMRxkPIkW0kER+UnsbloEYApH9g7UOeZ
	ydCjZi1rc9l1lhOwIxiWOJnATiu7XzJiuT86/nWkQyw8RXjOoJCK/FxggsLxUDoumL3kTe2LKluif
	Ul5W+KS2mKmnXJxlILQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItXp-00000007xEo-1Rv3;
	Sun, 16 Jun 2024 17:19:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItXk-00000007xCK-1LME
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 17:19:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8249560E9F;
	Sun, 16 Jun 2024 17:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2520EC4AF49;
	Sun, 16 Jun 2024 17:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718558391;
	bh=4oPVcX+dnWixdoqxyDdXAghWvga3v3Kc2JLR+Blj82Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CLiRO/PQh7a2ZWQyfdC4US0mVkLlJ6HO5eO2UarMxrnSElqTkb/0AS8JgQyaCPhsb
	 f6Rnisd+06F259/wK4wls00MfcNsQl7NQV+Mhfnv88IgCcvrGU3EWPRqLTVQk7dVYB
	 aSa1Ei/lYBm1EJcUUArXAUixCItAFX3YYfgToXU01t7FQ5c3d5eN5w5k0PhprfrDfz
	 EtwdhL3f2ERamE7jYlaP9xncBE9/iJy0AMReS0P4PhkD7Tf12bJtFn1GRiJrMvsBcd
	 78n1RdSgzcAUv2HGdJF9Lu3B/cxSeuKOnUwNtjb8Z0Wd/djOm7Effpd6bH3OtDgeL1
	 peEGAE0Ub3qjQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] riscv: avoid corrupting the RAS
Date: Mon, 17 Jun 2024 01:05:49 +0800
Message-ID: <20240616170553.2832-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240616170553.2832-1-jszhang@kernel.org>
References: <20240616170553.2832-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_101952_439159_30614082 
X-CRM114-Status: UNSURE (   8.93  )
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

Inspired by[1], "modifying the return address of to point to
ret_from_exception will corrupt the RAS", so modify the code
to remove the code of modifying ra.

Link: https://lore.kernel.org/linux-riscv/20240607061335.2197383-1-cyrilbur@tenstorrent.com/ [1]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/entry.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index c933460ed3e9..81dec627a8d4 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -235,8 +235,8 @@ SYM_CODE_START(ret_from_fork)
 	jalr s0
 1:
 	move a0, sp /* pt_regs */
-	la ra, ret_from_exception
-	tail syscall_exit_to_user_mode
+	call syscall_exit_to_user_mode
+	j ret_from_exception
 SYM_CODE_END(ret_from_fork)
 
 #ifdef CONFIG_IRQ_STACKS
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
