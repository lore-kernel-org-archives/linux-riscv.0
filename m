Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42730C25B0C
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 08:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dU0mTYzGYIU47fvEGWBlAjQ0adnEajCYrSwWGAQZ310=; b=neNPiO4cKLyHyW
	YzwgfJfrb9JxkqIFSB2BSsdHuYVolx0UDBZjZRrVRqUwfL1fKLIcfztpi8iGIxYAGHduNgM2yqQW4
	S43abaYdcPMhqAoTw/l6T3FLwUPD3tWNt2JsQ8YtGznvRG8xgOWVnZShXlG/PEvE5BmUApLpoReTE
	g2b4yvosUeqb8GYmfo8ZD1tn36MOMsBgBMjLQz10yPPlKfIge4gLFq+e/BaJiTb19k0GmD9jiGYWy
	9n+9pp3eU4FLKbCTc2jHD5+Pfo9R3VWQTk2548rSvN3WZZoFXicudsZRuJV7GfvNU4+uV9fn7shTe
	eafHXNh5ofje7p3Qb0Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxmO-00CImE-Bg; Mon, 08 Aug 2022 08:06:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxmL-00CIjT-ND
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 08:06:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 671BCB80E06;
	Mon,  8 Aug 2022 08:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B85C433D6;
	Mon,  8 Aug 2022 08:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659945983;
	bh=88SuZrvyL3jeJFfiTyPwnClk88QEzLMNBQPdHR9UyV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l4y7FiXxZ/3MlZLfl2cFaqKyz++tjbho4X9H2WHIaHFWDO4xvCWc/zx2pMZCTmn1s
	 ckSQaw7NQ6Pqz1tTx6Tj19+TmTFv7OFhio/a29OboGFsDXyep7pzvjqsiQNxyO9FF8
	 p2aDspkgMOSU5FhziAy1LKzLPD2ko78xk4r2x57YV9o0MIoXHwXL96EdPbdabgQeAS
	 EdUXQszkHktiCCDhkjmXnsppif1V4ZcWpmuIL4c0cvc4Hj6+/4REakl2Cpfo583b+7
	 9UEzb9BTXhYAvRoSLdFQpCxHzQSmUyE+M/pct1EIEP/461VqY22RUwFR861/Tn25c0
	 mmkj+T+xM93yA==
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
Subject: [RFC PATCH 2/4] arm64: percpu: Use generic PERCPU_RW_OPS
Date: Mon,  8 Aug 2022 04:05:58 -0400
Message-Id: <20220808080600.3346843-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808080600.3346843-1-guoren@kernel.org>
References: <20220808080600.3346843-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_010626_094484_8974CECD 
X-CRM114-Status: UNSURE (   8.09  )
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

The generic percpu implementation also using READ_ONCE()/WRITE_ONCE().
And the generic even give a better __native_word() check.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/arm64/include/asm/percpu.h | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index b9ba19dbdb69..a58de20d742a 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -52,17 +52,6 @@ static inline unsigned long __kern_my_cpu_offset(void)
 #define __my_cpu_offset __kern_my_cpu_offset()
 #endif
 
-#define PERCPU_RW_OPS(sz)						\
-static inline unsigned long __percpu_read_##sz(void *ptr)		\
-{									\
-	return READ_ONCE(*(u##sz *)ptr);				\
-}									\
-									\
-static inline void __percpu_write_##sz(void *ptr, unsigned long val)	\
-{									\
-	WRITE_ONCE(*(u##sz *)ptr, (u##sz)val);				\
-}
-
 #define __PERCPU_OP_CASE(w, sfx, name, sz, op_llsc, op_lse)		\
 static inline void							\
 __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
@@ -120,10 +109,6 @@ __percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
 	__PERCPU_RET_OP_CASE(w,  , name, 32, op_llsc, op_lse)		\
 	__PERCPU_RET_OP_CASE( ,  , name, 64, op_llsc, op_lse)
 
-PERCPU_RW_OPS(8)
-PERCPU_RW_OPS(16)
-PERCPU_RW_OPS(32)
-PERCPU_RW_OPS(64)
 PERCPU_OP(add, add, stadd)
 PERCPU_OP(andnot, bic, stclr)
 PERCPU_OP(or, orr, stset)
@@ -168,24 +153,6 @@ PERCPU_RET_OP(add, add, ldadd)
 	__retval;							\
 })
 
-#define this_cpu_read_1(pcp)		\
-	_pcp_protect_return(__percpu_read_8, pcp)
-#define this_cpu_read_2(pcp)		\
-	_pcp_protect_return(__percpu_read_16, pcp)
-#define this_cpu_read_4(pcp)		\
-	_pcp_protect_return(__percpu_read_32, pcp)
-#define this_cpu_read_8(pcp)		\
-	_pcp_protect_return(__percpu_read_64, pcp)
-
-#define this_cpu_write_1(pcp, val)	\
-	_pcp_protect(__percpu_write_8, pcp, (unsigned long)val)
-#define this_cpu_write_2(pcp, val)	\
-	_pcp_protect(__percpu_write_16, pcp, (unsigned long)val)
-#define this_cpu_write_4(pcp, val)	\
-	_pcp_protect(__percpu_write_32, pcp, (unsigned long)val)
-#define this_cpu_write_8(pcp, val)	\
-	_pcp_protect(__percpu_write_64, pcp, (unsigned long)val)
-
 #define this_cpu_add_1(pcp, val)	\
 	_pcp_protect(__percpu_add_case_8, pcp, val)
 #define this_cpu_add_2(pcp, val)	\
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
