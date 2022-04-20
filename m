Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB62C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCnkeO826aYOGQsiwKLz57QNnGNys4NeYbsQwRj2bHs=; b=lrcILgbTpKcxlz
	eLAeQFv0yoczs7QTDmyCE0Pq1LxBt11+1BvyUiuAylfJsZCzFVSZpnUnjCZrfsiZdKaqyKe3GnK0S
	DIR8g5ite1k63YNI/RLcvlWPJ9CZ+BeyC07pRyCGn85KLczjkyfksr1+Fkkm5eP/to6nMHPcztwLj
	qtHUI4NQxSbQyhwAPErs74FbieYfXc2jAvi2B13AArAdc0HVoSOmoEpn9c9quwLAOy7T+7h5WHvEI
	ZCLyKwEVGu5C629jdkkjhHpOaCym0JvwM5gTLhYFLR16vMplGc/OyK+nDVDpHmhILpDuhAEunSsg/
	91teNiQLRDuVCmuMBOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhBZP-009RG7-VU; Wed, 20 Apr 2022 14:44:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhBZN-009REg-Ef
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 14:44:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E605F617B5;
 Wed, 20 Apr 2022 14:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221DBC385A1;
 Wed, 20 Apr 2022 14:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650465876;
 bh=b6/BU+/JNraTRFDMaX64ry4dRF+EjjQX1x14puzFLH8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=epm7esix1KLpCRzb1oPQOBHBiO+N5DARLDJVDiJJIvIquDNjLYxlRnBYP08cs7zRJ
 ljxRu5t3i1ct5Fyx484l/RXquo4+qw4FyOv0jFPIWyPO537Ng4k++hUQa9e19gFuw6
 OZlU1ZsNt3i+dExhS2OdNPSuDOHnlbph3TiKCHXcvJllvzATespTqYz7rvOHGJMzC8
 DIdXJEmI43HXjtoN/RyfvoyUnY5umHxa25u9lv/7KFNLLiGFUF7m+iyODFh+A7gS14
 kngWU6/XGXg5jJrrS9y5ZY1uWttSmxXacJc2UL6qklakB3pzf7fEiUTFumfDLCNkk4
 CLDemuRt8uiNg==
From: guoren@kernel.org
To: guoren@kernel.org, arnd@arndb.de, palmer@dabbelt.com, mark.rutland@arm.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
 dlustig@nvidia.com, parri.andrea@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 1/5] riscv: atomic: Cleanup unnecessary definition
Date: Wed, 20 Apr 2022 22:44:13 +0800
Message-Id: <20220420144417.2453958-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420144417.2453958-1-guoren@kernel.org>
References: <20220420144417.2453958-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_074437_568470_34010996 
X-CRM114-Status: UNSURE (   8.57  )
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

The cmpxchg32 & cmpxchg32_local have been never used in linux, so
remove them from cmpxchg.h.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Dan Lustig <dlustig@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>
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
