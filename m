Return-Path: <SRS0=OENr=AE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8164C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2020 17:35:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B7AA20706
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2020 17:35:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ijS4X42J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1bbPmF9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B7AA20706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EPGmS40oSWEEmxHXj2samWNw0RMNyCGJgWoDE1x8FPI=; b=ijS4X42Jqmb3yVJxx+XhodG8L
	cLmp806Vmiaom9XTHfpHerm5r73yjoYoMEqW3YLjgXsRMLpf2sdtWjD0LovSlA/3zoQixk1V+vLOr
	2Ycj8iRhmMABFBzLNxTfZo/uFs884Pc0vOWRhuXAex3b3XN87qsFsqHd5I2NENpTj9doUoFFQbVro
	Mn2oXA0psjTh8gEDOulYNUCjwVEMPWrHx4mHZNVhFLZnxDiotWhHNM6J5KOb7KHcTootio79RrQwF
	huebCjV1YpPzHrb7Ma4a+lPDmTeGu/P9r2W896oC5rCa2ZG65+m/8kcflSxzek28hbRdPtx/7IaNH
	OdQHdMdig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnmpY-0003Ht-Hh; Tue, 23 Jun 2020 17:35:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnmpW-0003HL-1s
 for linux-riscv@lists.infradead.org; Tue, 23 Jun 2020 17:35:30 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10F7C20774;
 Tue, 23 Jun 2020 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592933728;
 bh=jCXcHNF4ffgYfk2J1Ar2eqA5w3GtOFqVWiURn6wkmOQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e1bbPmF9jCP7O4qlSZXCPFjlR3po77suMPhhKijPzPfPyVMxDJ0ljrfUt9HR0zidZ
 c+Khko/cuwHs0aGyzyZ0LgaGkH87bpto8Qf5T100riFt0iGyE5MJrzsQOV04RphvWO
 M4kTpCIdXdA76q4UPj6jod3P0iL/X2JGuNl+nMws=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 04/28] riscv/atomic: Fix sign extension for RV64I
Date: Tue, 23 Jun 2020 13:34:59 -0400
Message-Id: <20200623173523.1355411-4-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623173523.1355411-1-sashal@kernel.org>
References: <20200623173523.1355411-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, clang-built-linux@googlegroups.com,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Nathan Huckleberry <nhuck@google.com>

[ Upstream commit 6c58f25e6938c073198af8b1e1832f83f8f0df33 ]

The argument passed to cmpxchg is not guaranteed to be sign
extended, but lr.w sign extends on RV64I. This makes cmpxchg
fail on clang built kernels when __old is negative.

To fix this, we just cast __old to long which sign extends on
RV64I. With this fix, clang built RISC-V kernels now boot.

Link: https://github.com/ClangBuiltLinux/linux/issues/867
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/include/asm/cmpxchg.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index d969bab4a26b5..262e5bbb27760 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -179,7 +179,7 @@
 			"	bnez %1, 0b\n"				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
+			: "rJ" ((long)__old), "rJ" (__new)		\
 			: "memory");					\
 		break;							\
 	case 8:								\
@@ -224,7 +224,7 @@
 			RISCV_ACQUIRE_BARRIER				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
+			: "rJ" ((long)__old), "rJ" (__new)		\
 			: "memory");					\
 		break;							\
 	case 8:								\
@@ -270,7 +270,7 @@
 			"	bnez %1, 0b\n"				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
+			: "rJ" ((long)__old), "rJ" (__new)		\
 			: "memory");					\
 		break;							\
 	case 8:								\
@@ -316,7 +316,7 @@
 			"	fence rw, rw\n"				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
+			: "rJ" ((long)__old), "rJ" (__new)		\
 			: "memory");					\
 		break;							\
 	case 8:								\
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
