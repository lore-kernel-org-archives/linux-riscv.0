Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D943BC3DA59
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 17:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bguGaKc/Xoh5LahkA4viITeWAidylt4Pcp0NlY+z4jc=; b=3nfOHvo4jaDxjJ
	8XOlOkZOq9BtW5FVUFHpYyNOBN6uiqkNsSWLZMk/+U7e5MtiQdFDkdl3+t7Su9Ja5xhLNvBgLo56k
	XJRJLCCZpBC0dsSAqjGcYlEq8tja01ieIqr6nK8pKTTY50CX1yKDOTZczTj5DKDXR0ezb2/4wiApc
	3lIl6jCSGWvlesXt6mMH6C9xRrNQiBR6Y6pA1rmytoPIau9KUaqw8gpUO8693j7cXd0nBvDo6PU7L
	fO5HgCJWKil6Te0CEXtDghRbco6/ngMVHSXoeoxcHUgSYtzzqYdUya21Frk9z2qsXRCIpo/+/HpZY
	WMv404e/XqFmUAnmbZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDlu-00000005QFb-3nHC;
	Sat, 20 Jul 2024 17:21:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDlr-00000005QFF-2ZmM
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jul 2024 17:21:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A3F6C60DDD;
	Sat, 20 Jul 2024 17:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2041C2BD10;
	Sat, 20 Jul 2024 17:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721496082;
	bh=367A27lSeXo8TqISrQnpweAqbo/A/tUIu1oOBk5HfDI=;
	h=From:To:Cc:Subject:Date:From;
	b=oeT5VKlZLlYV4yW7bijIgfagrp5YcPf+Eneb7F4u/O3MEmnpPIVHDgsQE1puEB84f
	 pHAFMEHd7sp2NpNzNFftsfznN9APIKq/ig7WDra6jEDo6QKLpu7NwsbpR8m7TLDwaW
	 FN2MiKCKTwrd2CCaJs1TRvm9QTGhxCipAt3wNy6qcmOWjJtb8xDHJH3DysqBqWdqzP
	 k4mXOhPEEUmsIUelI1CeShWyC1wK4U0RTuJmf8TfhLYcXZdU8WaBTJJk4CtCzx7cbm
	 CIsYBnsko+HSBbyP/TSDkmYOQYlrAhszyCd0mNsE8NDlObuIiy3KEZIyGNYwwMFfR8
	 mHkPy6ZrqEwQw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyril Bur <cyrilbur@tenstorrent.com>
Subject: [PATCH v2] riscv: avoid Imbalance in RAS
Date: Sun, 21 Jul 2024 01:06:59 +0800
Message-ID: <20240720170659.1522-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_102123_727028_22821BD1 
X-CRM114-Status: UNSURE (   8.34  )
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

Inspired by[1], modify the code to remove the code of modifying ra to
avoid imbalance RAS (return address stack) which may lead to incorret
predictions on return.

Link: https://lore.kernel.org/linux-riscv/20240607061335.2197383-1-cyrilbur@tenstorrent.com/ [1]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Cyril Bur <cyrilbur@tenstorrent.com>
---

since v1:
 - make it a seperate patch
 - modify the commit msg, thank Deepak
 - collect Reviewed-by tag

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
