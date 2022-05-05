Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A68C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 03:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUKtrJ6mXyChb5OTj94Ledsx5/hbwDdCS7hTYE3vmsE=; b=LYg7ThAX9Cq4C8
	8/oK5r2bmdN6KR3ruVE/QxRt42K9Kb2uD348/PB16NTGVP3XlxF8CvKNO8MvwG+MTaWTkcMi9DJAQ
	/T7c9PLxc9ULENq0Cp9cel8FSGf+/c8Z4pC5MBMUR5oSVLtaVhlO2sNjgQIfv20VlIjWRTRXscDtf
	ngcH+rb5fdgih0Mw2OSvao8d1gmyO+T1XFkxRYIs6eNCi2wWEwot4NfxWJ/v/Zg6exehJqRpdM/nx
	j2kH3/Y0Ax8+VNEwmQqnWEJnWqrK+nKlhXrvuMUBnMAks3eZhwZ5+G2pufQmhcbt8Vxey/6cdUIqQ
	xEu4LXghVisZnI5ow7oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmSaj-00Dqnq-M4; Thu, 05 May 2022 03:55:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmSag-00DqmG-OE
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 03:55:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 593A66135D;
 Thu,  5 May 2022 03:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6ACC385B0;
 Thu,  5 May 2022 03:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651722945;
 bh=ycOArejrZ4wjdQN/FwZtyJLMUvQeie7e/tBekexR1Pg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n9eEqytqxgDf0VPmrt6zlMu3c3irjitX/I2CI49aa+hS/g1MICM9/XdXsivNJGBGy
 eOWEYo89jXAp2I2QUDSedMGcTmjIQFKuwPiAizJBpTZ1L94tLPFYveMynIfrGyZScf
 e4X2rd/1kz9Tiv6R9vJsWyPlzCgJKWwJkw+D+AcQb0U+4kV2bniiyUxstme5+NFTYv
 AeW7uEDY0y0gAbJJkKc4p3TdQVldYDf7bz15iKb8XW3cZuHn9XzCGUeiKweCc5Ui0C
 2UTjBQEhDYWHWd4ztlXKgwfj//hcXg/xljSr4rNmJqIjPLLdt1F42Lbj5j+SMY6P5x
 bUKi9mEBMIsuQ==
From: guoren@kernel.org
To: guoren@kernel.org, arnd@arndb.de, palmer@dabbelt.com, mark.rutland@arm.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
 dlustig@nvidia.com, parri.andrea@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 1/5] riscv: atomic: Cleanup unnecessary definition
Date: Thu,  5 May 2022 11:55:22 +0800
Message-Id: <20220505035526.2974382-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505035526.2974382-1-guoren@kernel.org>
References: <20220505035526.2974382-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_205546_871514_1DE4C970 
X-CRM114-Status: UNSURE (   9.04  )
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

The cmpxchg32 & cmpxchg32_local are not used in Linux anymore. So
clean up asm/cmpxchg.h.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>
---
 arch/riscv/include/asm/cmpxchg.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 36dc962f6343..12debce235e5 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -348,18 +348,6 @@
 #define arch_cmpxchg_local(ptr, o, n)					\
 	(__cmpxchg_relaxed((ptr), (o), (n), sizeof(*(ptr))))
 
-#define cmpxchg32(ptr, o, n)						\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
-	arch_cmpxchg((ptr), (o), (n));					\
-})
-
-#define cmpxchg32_local(ptr, o, n)					\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
-	arch_cmpxchg_relaxed((ptr), (o), (n))				\
-})
-
 #define arch_cmpxchg64(ptr, o, n)					\
 ({									\
 	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
