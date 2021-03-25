Return-Path: <SRS0=pLrx=IX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679EEC433C1
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 07:59:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D793A619FB
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 07:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D793A619FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZClBOtmakBvvcbtl15stU1bgx7StSx/WH55rHxovbs=; b=FkU3zPf9tC37Tuz+iHLgRF98fL
	f5xg2Lw+E1nYFYT/zaj0pl2CEXnt74FXFYQUnIlt+HT+p/lwGXZW1NHyBkfgm2bmmvGpt7Jgl56Ws
	k6XYD9shnaTz98FPGqUbrGUgLcQGAXpYD37I0yn5hfMErAUas5u2I889M9OPMOXR1BbLfDLf/hdce
	+E86Ffwkyvwdl5ltrhP89cDLxaacdPu3d91IVsBj3pmiCAI3h5Ac7RwNfgnzGCooiPwZVfjK8wtea
	FvVqu13+Zl8yWxKNfY+ELhrxelDMLcT1OhMOBD+qicT776S5IIym5nvdaqEdMV7dP+s+SWSS1H37k
	EycK0RWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPKtw-000rpH-Rz; Thu, 25 Mar 2021 07:59:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPKrQ-000qxy-05
 for linux-riscv@lists.infradead.org; Thu, 25 Mar 2021 07:57:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF121619FE;
 Thu, 25 Mar 2021 07:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616659014;
 bh=DsrHsPtWDnnHmn30NT+r18yNYxdqI6C4be+2gqhoyC4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D8E/I284jod7q+8Y+/9BmCwmitwO8rK9qSibRoUgHctFNXttpRnf38ztrhvhn2dC/
 s5C2Dp7z7ySkBRhAEbzmBomepzwOQ0MTttusBtDikgurx3mTh5NX5oINIUIaljkzq5
 jFQZkfXCjSowWxrFOjUw8aiEXgf3rI389qe/tXNfwyOEDyG910RbI1XrpuMi5CqP7A
 uu105HTuz7L9JT2jOaBjjFo1xD9g+4+NfMEiNBoT6dJlGf2sKpl+KllpTyssxQmCLh
 KsNdIjNavTd9EDiWwJTk31NN7AfUK4Jp1lnHM0VAe+rf6mbM0OeHG9fF5kaelrp3DX
 cJIZ/8kOBl92w==
From: guoren@kernel.org
To: guoren@kernel.org,
	Anup.Patel@wdc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 tech-unixplatformspec@lists.riscv.org, Guo Ren <guoren@linux.alibaba.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Michael Clark <michaeljclark@mac.com>, Anup Patel <anup@brainfault.org>,
 Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH v3 1/4] riscv: cmpxchg.h: Cleanup unused code
Date: Thu, 25 Mar 2021 07:55:34 +0000
Message-Id: <1616658937-82063-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616658937-82063-1-git-send-email-guoren@kernel.org>
References: <1616658937-82063-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_075700_100349_CD232EA3 
X-CRM114-Status: UNSURE (   7.63  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Remove unnecessary marco, they are no use or handled by generic
files (atomic-fallback.h, asm-generic/cmpxchg*).

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Link: https://lore.kernel.org/linux-riscv/CAJF2gTT1_mP-wiK2HsCpTeU61NqZVKZX1A5ye=TwqvGN4TPmrA@mail.gmail.com/
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Michael Clark <michaeljclark@mac.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/cmpxchg.h | 83 --------------------------------
 1 file changed, 83 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 262e5bbb2776..f1383c15e16b 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -72,13 +72,6 @@
 	__ret;								\
 })
 
-#define xchg_acquire(ptr, x)						\
-({									\
-	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg_acquire((ptr),			\
-					    _x_, sizeof(*(ptr)));	\
-})
-
 #define __xchg_release(ptr, new, size)					\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
@@ -107,13 +100,6 @@
 	__ret;								\
 })
 
-#define xchg_release(ptr, x)						\
-({									\
-	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg_release((ptr),			\
-					    _x_, sizeof(*(ptr)));	\
-})
-
 #define __xchg(ptr, new, size)						\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
@@ -140,24 +126,6 @@
 	__ret;								\
 })
 
-#define xchg(ptr, x)							\
-({									\
-	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg((ptr), _x_, sizeof(*(ptr)));	\
-})
-
-#define xchg32(ptr, x)							\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
-	xchg((ptr), (x));						\
-})
-
-#define xchg64(ptr, x)							\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
-	xchg((ptr), (x));						\
-})
-
 /*
  * Atomic compare and exchange.  Compare OLD with MEM, if identical,
  * store NEW in MEM.  Return the initial value in MEM.  Success is
@@ -245,14 +213,6 @@
 	__ret;								\
 })
 
-#define cmpxchg_acquire(ptr, o, n)					\
-({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
-	__typeof__(*(ptr)) _n_ = (n);					\
-	(__typeof__(*(ptr))) __cmpxchg_acquire((ptr),			\
-					_o_, _n_, sizeof(*(ptr)));	\
-})
-
 #define __cmpxchg_release(ptr, old, new, size)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
@@ -291,14 +251,6 @@
 	__ret;								\
 })
 
-#define cmpxchg_release(ptr, o, n)					\
-({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
-	__typeof__(*(ptr)) _n_ = (n);					\
-	(__typeof__(*(ptr))) __cmpxchg_release((ptr),			\
-					_o_, _n_, sizeof(*(ptr)));	\
-})
-
 #define __cmpxchg(ptr, old, new, size)					\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
@@ -337,39 +289,4 @@
 	__ret;								\
 })
 
-#define cmpxchg(ptr, o, n)						\
-({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
-	__typeof__(*(ptr)) _n_ = (n);					\
-	(__typeof__(*(ptr))) __cmpxchg((ptr),				\
-				       _o_, _n_, sizeof(*(ptr)));	\
-})
-
-#define cmpxchg_local(ptr, o, n)					\
-	(__cmpxchg_relaxed((ptr), (o), (n), sizeof(*(ptr))))
-
-#define cmpxchg32(ptr, o, n)						\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
-	cmpxchg((ptr), (o), (n));					\
-})
-
-#define cmpxchg32_local(ptr, o, n)					\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
-	cmpxchg_relaxed((ptr), (o), (n))				\
-})
-
-#define cmpxchg64(ptr, o, n)						\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
-	cmpxchg((ptr), (o), (n));					\
-})
-
-#define cmpxchg64_local(ptr, o, n)					\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
-	cmpxchg_relaxed((ptr), (o), (n));				\
-})
-
 #endif /* _ASM_RISCV_CMPXCHG_H */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
