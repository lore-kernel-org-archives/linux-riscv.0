Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A203CF8840
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 18:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F752wb2iyzTsxGbyI8aRZCQ8SDjpDxVNzzedvVTcUsI=; b=hco+otE+F3deQ6
	712Jlo1XZN6YY4wO2k1lEs+TwE3QOW83JWMl9pebXlha/LNIHovNO/XguEDl58Ab5u1uEd0MB0oho
	XKkRTfJauLfYaEQqEGg6gV3MFfQwL/eIuD+9hDHCeWck7Qv2qveueHLHuLXYBx2ll7g5gnAvRiP7U
	49db2C3bJio1qbsHl0Yypdety9Jg8UtcyKYM5KOton02tB71P+1OHn7BJ3NCC2L9qVDd0LQUQo0g2
	Zs9Ia3CbdVhiYzG/HC3P6KwHEJRR3t3DAlHcdouQYcubiHV/nTf/uB5+6pelb3pyqMiSMCf88PuD8
	whfA5MroItWEGocTifww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swmu0-0000000Df7z-2WZW;
	Fri, 04 Oct 2024 18:19:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swmty-0000000Df6p-16Kf
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 18:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9AF3B5C5DCD;
	Fri,  4 Oct 2024 18:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC948C4CECC;
	Fri,  4 Oct 2024 18:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728065981;
	bh=/B2Gc/EMzBDQckZ37mMVoHmmOAbe4wh83yczyv1hib4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QRpR0qAH6GYeq6glzx9ToEMJfToDw4n7+EdDkIbcHzr1A/OQgVsXzRf9AooKXMkRU
	 TTZJJp9qwPAS2sHtJ9t7PXSpmWUZqKLPI8vzZB//wlNdmqho4LIPvZd4PtaZX1xAK/
	 icGetN0JwzyZn4AVy6XBJfkyAy8wCbKb5FrXEBUBwH5dOdOHNAtERiSpNJX+6NIrDT
	 sxJQlBXnVkXIMQ9V1A/hDRegPYPqBj1XVykte4eSHwN4flwHir97fm/d8NPQYaSAHG
	 DGTyHaUVMJNFGJUrYlcQooc7t5s7LztOwCgYPpNvS00rEqqCui0DGnC96kMryY4dwX
	 t7hz8u2rzGpOA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Cyril Bur <cyrilbur@tenstorrent.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	guoren@kernel.org,
	namcaov@gmail.com,
	debug@rivosinc.com,
	antonb@tenstorrent.com,
	andy.chiu@sifive.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.11 38/76] riscv: avoid Imbalance in RAS
Date: Fri,  4 Oct 2024 14:16:55 -0400
Message-ID: <20241004181828.3669209-38-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004181828.3669209-1-sashal@kernel.org>
References: <20241004181828.3669209-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_111942_368901_4CE36A91 
X-CRM114-Status: UNSURE (   8.91  )
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

From: Jisheng Zhang <jszhang@kernel.org>

[ Upstream commit 8f1534e7440382d118c3d655d3a6014128b2086d ]

Inspired by[1], modify the code to remove the code of modifying ra to
avoid imbalance RAS (return address stack) which may lead to incorret
predictions on return.

Link: https://lore.kernel.org/linux-riscv/20240607061335.2197383-1-cyrilbur@tenstorrent.com/ [1]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Cyril Bur <cyrilbur@tenstorrent.com>
Link: https://lore.kernel.org/r/20240720170659.1522-1-jszhang@kernel.org
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/entry.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index ac2e908d4418d..fefb8e7d957a0 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -239,8 +239,8 @@ SYM_CODE_START(ret_from_fork)
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
