Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F1CCF885A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 19:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2ouNHSQtEYK9n4bhs1liiXSGmts3t3XWE56q9Id30E=; b=vG4NisaO7+xLWg
	gSX7uK3JC/GZiLUS7YiTZWPmHrsMHo08BRWkEb0g2sdY/ekffHcGgpvkzLIrs/Rbyb12gUQvEqvts
	xaX7RYrJs6A2bb+nXt04C3cwEVvpY+nkA+omegW17pOeP6PME1wt83fs0coJ8PxO6nJl3tZ7o9Xe/
	x4Oaatpw5sjrQUVsQ0P/f4RnU5dNSxykvo5ze0c8Vu8qI3AVNvHW9NZsM4ZyUFJUuLfHM3GrP7Ow7
	/UDuwVnl/DIV2jqNISXIbNCZjZDVsEvKKisC8R3dTkm+iA4NuT5D79DF2HIFi6shkzEhU/sg8Dl+Q
	SMinsg1d8JX40e3kULZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swo22-0000000DueY-39kQ;
	Fri, 04 Oct 2024 19:32:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swn05-0000000DhGF-2bwz
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 18:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF5DE5C12A9;
	Fri,  4 Oct 2024 18:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288A7C4CECC;
	Fri,  4 Oct 2024 18:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066360;
	bh=KEHGx5ZxOwmv3mqRRP4gulTwHNAd9PJT3vm70lAVmY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GMhwOui6NifvV0XMnaswzCogywNQ3ugAmVOhFFYu19hf2Da/RyF6pVYdUOqniqVs8
	 wsaC0GjhyE0JQzKY+BqE5dzv2nVK++UZgYbbbMVuc38HMgS/uu60Djcv2Yxl1iNSvX
	 ReVrBu6ZUHgOXWcK46C3XkrC40mcACe3RoRH3FAaydjHTM8z4lKCa3QnMq5gogPRGv
	 KBG8IIxkTLWvlDpFLB10CksvOjSByYhaShfirlZ7FzFtCWRbpdJlIIIZ5sqEYw0dQ5
	 DweFebealMUilmhzrk0XVQS+9iRKGDImPA7jDMGyWOYoZRyZrTTLYI7e052jmIJPkh
	 Z8EomJy/lpF7w==
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
	antonb@tenstorrent.com,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 32/58] riscv: avoid Imbalance in RAS
Date: Fri,  4 Oct 2024 14:24:05 -0400
Message-ID: <20241004182503.3672477-32-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182503.3672477-1-sashal@kernel.org>
References: <20241004182503.3672477-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.54
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_112601_727695_10FCEE2F 
X-CRM114-Status: UNSURE (   9.60  )
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
index ed7baf2cf7e87..1f90fee24a8ba 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -219,8 +219,8 @@ SYM_CODE_START(ret_from_fork)
 	jalr s0
 1:
 	move a0, sp /* pt_regs */
-	la ra, ret_from_exception
-	tail syscall_exit_to_user_mode
+	call syscall_exit_to_user_mode
+	j ret_from_exception
 SYM_CODE_END(ret_from_fork)
 
 /*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
