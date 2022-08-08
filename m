Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8E0C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 08:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Kyrs4xvxRx2HZEYd9NPL6WSXW9rIvCGOj1nPl38jls=; b=EDhFjgFmf1XkbF
	vyLbfKhJu0tjUb9G6jpMQHySR2FTuPs9pDfVLOSlJr6XajgXlLQY67aNMLcL5fU9+9RYYIgktxyMK
	jNnB7UZa+6lPmYP+nZIRHh5LbN3tJee5B+hqdZvEry3zZE5fHlhSzxBzH6ZKqfg/M4MIx/O4s2KUT
	VgLvDr80Aj/9rS6ifYsxPYLPniWGjyCZ7yeiGaZpeedcBwI6FoR4ME1Xb128vL8FAOl67cpp5eypC
	MPMyVm9ljEA+k9IYd0raeHoV4ixtBHeuO8Qzv3ZrCuO+bqm6mAbDHni9SWtwj1bfpp9JyF9PnzD27
	tb12VyAYHv/DVZAvJvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxmW-00CIri-5f; Mon, 08 Aug 2022 08:06:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxmT-00CIov-4U
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 08:06:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B03EE60EBD;
	Mon,  8 Aug 2022 08:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACD2C433D7;
	Mon,  8 Aug 2022 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659945992;
	bh=oWHU2Ny0CiPTyM5UPNfWTzYpuhtDEvS9sEcV0SmxrWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K+G5/KlKkwLY6Ebo0r9E4N9FTGmZ3uTMDSuv6U5mVHrwZNbrUvgGeha8qE07emesC
	 AxKPZwDNHOJ55bTsRJj1B/IMUBmJ6GmRHn/ocEqzyL+oQCmraI6vWcbeDuk9CVuwhW
	 lSMe3UykOCmyl3FoFMv8HolaRexAg50Y5cqmRZvFSRhrboZEBa38LgHhDyLLFweBeD
	 baRNoe+3NxAne8mCvrm2Ycw426nWoJYE4Osn+UmQw7iWDSY1QEjPEfjRotALSX/kmP
	 Kum5pUZJ92+uJ0ahWtd71O4QR+uGf6bZF56r0QT4CiKRUKeayXfKf2J4ID+0DbmMlJ
	 werEzzwgbePQQ==
From: guoren@kernel.org
To: tj@kernel.org,
	cl@linux.com,
	palmer@dabbelt.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	peterz@infradead.org,
	arnd@arndb.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [RFC PATCH 4/4] riscv: cmpxchg: Remove unused cmpxchg(64)_local
Date: Mon,  8 Aug 2022 04:06:00 -0400
Message-Id: <20220808080600.3346843-5-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808080600.3346843-1-guoren@kernel.org>
References: <20220808080600.3346843-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_010633_242688_5248AC8D 
X-CRM114-Status: UNSURE (   8.27  )
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

Only cmpxchg64_local is used in drivers/iommu/intel/iommu.c, and
cmpxchg_local has been deprecated in common part. So cmpxchg_local
is unecessary to riscv.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/cmpxchg.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 12debce235e5..0407680b13ad 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -345,19 +345,10 @@
 				       _o_, _n_, sizeof(*(ptr)));	\
 })
 
-#define arch_cmpxchg_local(ptr, o, n)					\
-	(__cmpxchg_relaxed((ptr), (o), (n), sizeof(*(ptr))))
-
 #define arch_cmpxchg64(ptr, o, n)					\
 ({									\
 	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
 	arch_cmpxchg((ptr), (o), (n));					\
 })
 
-#define arch_cmpxchg64_local(ptr, o, n)					\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
-	arch_cmpxchg_relaxed((ptr), (o), (n));				\
-})
-
 #endif /* _ASM_RISCV_CMPXCHG_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
