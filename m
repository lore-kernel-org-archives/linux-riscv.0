Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F2BC624B4
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Nov 2023 08:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATkqwRnK0dhsw/L5ssx37WCHpZ8qxCckT5V4v8o+At8=; b=WIIwXeAsjP1vb8
	8WUVh7xig354+oWxqbtk6SvtehJt0lU1xyAq+fz7a1XK1FzPej+x0kRrDOC2F0ddt7OT3ZHk/VnTK
	cLZik3AGtoCH4sFC43m4fiWjWaaQZ1Ky//BZgUczBwYdDwd0xEMWZSH2mSkeeBJBh1FKVtoPq4jBx
	dqtfFFNN916E2i+s2Z8RWHvQC7UE5qjh/vXZJMCCrO78jArKR9nD+xOkOYFO2bpRLg/O+AL4QPWIu
	Qggo12xKQroxj3/vDG/x+cEmh5BjYPlaTRtGH2FVBGRKFEJmYfRuSuurVImvODQT07uPQ2BHRqB07
	HvfczQ5rN0EYVGkAGYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6o7F-008qt0-2C;
	Sat, 25 Nov 2023 08:34:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6o7A-008qq3-1m
	for linux-riscv@lists.infradead.org;
	Sat, 25 Nov 2023 08:34:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4CE0FB82F13;
	Sat, 25 Nov 2023 08:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFC4C433C8;
	Sat, 25 Nov 2023 08:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700901250;
	bh=f5wYmmEc/6YNMD4xeSRCsSaZscE5Ri2p04isx1ogm+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kgagQ40xuACQ9F/M71fFeTEUd/FiPgKGt+n61Bi5CgIuS/oGuUgESREinPeSmS7SY
	 4VYKpfyLTnWO2UvHFr2I93eTpClr7YgMYA9UG/8e2kLqDfXaoQn6+t1YjnagmomCvd
	 4h7VVrBlVC6EgbE6vnlgT3epFhtQHP36aiCNQJfSBCxEPYLv3XHwPhUsDVZ8ti0wyh
	 AWDR1IjFmfKsIo/wf0CmJ8aJ4rZxM6TACXKKb8YiiFIO9Uu9GD1OakQvfTMoHsgEms
	 WYhEQwW7l16E+TUhhZwkokQKShO6/fMe/HPqoGUzYh9I/hzgUi7rxlLgdEv7F/eyZC
	 5+McLgb7GFhvw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: cmpxchg: implement arch_cmpxchg64_{relaxed|acquire|release}
Date: Sat, 25 Nov 2023 16:21:44 +0800
Message-Id: <20231125082144.311-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231125082144.311-1-jszhang@kernel.org>
References: <20231125082144.311-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_003412_744693_208FF461 
X-CRM114-Status: UNSURE (   9.79  )
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

After selecting ARCH_USE_CMPXCHG_LOCKREF, one straight futher
optimization is implementing the arch_cmpxchg64_relaxed() because the
lockref code does not need the cmpxchg to have barrier semantics. At
the same time, implement arch_cmpxchg64_acquire and
arch_cmpxchg64_release as well.

However, on both TH1520 and JH7110 platforms, I didn't see obvious
performance improvement with Linus' test case [1]. IMHO, this may
be related with the fence and lr.d/sc.d hw implementations. In theory,
lr/sc without fence could give performance improvement over lr/sc plus
fence, so add the code here to leave performance improvement room on
newer HW platforms.

Link: http://marc.info/?l=linux-fsdevel&m=137782380714721&w=4 [1]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/cmpxchg.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 2f4726d3cfcc..6318187f426f 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -360,4 +360,22 @@
 	arch_cmpxchg_relaxed((ptr), (o), (n));				\
 })
 
+#define arch_cmpxchg64_relaxed(ptr, o, n)				\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	arch_cmpxchg_relaxed((ptr), (o), (n));				\
+})
+
+#define arch_cmpxchg64_acquire(ptr, o, n)				\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	arch_cmpxchg_acquire((ptr), (o), (n));				\
+})
+
+#define arch_cmpxchg64_release(ptr, o, n)				\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	arch_cmpxchg_release((ptr), (o), (n));				\
+})
+
 #endif /* _ASM_RISCV_CMPXCHG_H */
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
