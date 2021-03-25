Return-Path: <SRS0=pLrx=IX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0566C433C1
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 08:00:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B191619FB
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 08:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B191619FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cl1izo7zt+50dnUuY37suwuqIbm0uYpGI3UGJdPvXXE=; b=lAO/0jXJuRWBBlbcI4EU2iminB
	S/1H2uA/TWB4x6hiUkR6v9y/UC7Fl7T7JIc/zf/pcPAsaFvzBtU5IxVpEyz2+zYxPdGTixu9raMEE
	q+SHCwhqKvPLwaOf/QCqiyK2OGxy7HFGVdoLJ2OgtKr6Jps6Nwv4uJ0gemDZYNBIN8yWBHX1wqzH8
	pudUOHLTRHPN/VgKRWTDF7HasuTQF9i1Q08jC+cliYHUC3Q1kacw1UmBTNZjorn6Vzco0AwyjSScf
	eIcwTCjDUGquW1trnfPBC1PqEaoj96xcntUmAX2+Mw8JTzQvVemmdRh+U+EEtI3AsnY1WXsEy6PH+
	O6H/1yLg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPKua-000rzE-Kt; Thu, 25 Mar 2021 08:00:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPKrZ-000r1b-E2
 for linux-riscv@lists.infradead.org; Thu, 25 Mar 2021 07:57:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3DFD61A1A;
 Thu, 25 Mar 2021 07:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616659023;
 bh=u9RL4LzT+WLWRXBJ9z//sx5hDHBEN+tPj2LL+JYE+O8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W0l/baDjx+xRV6jqmt0HGL2qQ6hcpoA/SSXCSx3D4FnpBEkUri0ZkT7Iyq9Irmh15
 8eIHcYW4l4aI8bp9zKxEiIKdk8JHnWbWx6+RNBSBc/j5aedp4Nv+2UwAHnCduaegbt
 PxbwwlrVHooRalO9w8wEK2aG7kBMI3xlcxP3UrUZL9sGYCPHzwnzvvgY2EaY2+TH01
 dUQ103wTcmTl2esthu0Mdi+6kEefGxuDUOzFmGTy6VReb43zL4b8scOP1OiqUtdnLc
 q3vCxF2ujaegsaYsgFXE4E1G8KnYNZrt7iswaR7vyycfqVj3CXKGR62D78494AA0/Z
 Qk1MNxMJrGltg==
From: guoren@kernel.org
To: guoren@kernel.org,
	Anup.Patel@wdc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 tech-unixplatformspec@lists.riscv.org, Guo Ren <guoren@linux.alibaba.com>,
 Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>,
 Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH v3 3/4] riscv: cmpxchg.h: Implement xchg for short
Date: Thu, 25 Mar 2021 07:55:36 +0000
Message-Id: <1616658937-82063-4-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616658937-82063-1-git-send-email-guoren@kernel.org>
References: <1616658937-82063-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_075706_968387_9DCB4464 
X-CRM114-Status: GOOD (  11.73  )
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

riscv only support lr.wd/s(c).w(d) with word(double word) size &
align access. There are not lr.h/sc.h instructions. But qspinlock.c
need xchg with short type variable:

xchg_tail -> xchg_releaxed(&lock->tail, ...

typedef struct qspinlock {
        union {
		atomic_t val;

		/*
		 * By using the whole 2nd least significant byte for the
		 * pending bit, we can allow better optimization of the lock
		 * acquisition for the pending bit holder.
		 */
		struct {
			u8	locked;
			u8	pending;
		};
		struct {
			u16	locked_pending;
			u16	tail; /* half word*/
		};
	};
} arch_spinlock_t;

So we add short emulation in xchg with word length and it only
solve qspinlock's requirement.

Michael has sent another implementation, see the Link below.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Michael Clark <michaeljclark@mac.com>
Tested-by: Guo Ren <guoren@linux.alibaba.com>
Link: https://lore.kernel.org/linux-riscv/20190211043829.30096-2-michaeljclark@mac.com/
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Anup Patel <anup@brainfault.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/cmpxchg.h | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 50513b95411d..5ca41152cf4b 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -22,7 +22,43 @@
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(new) __new = (new);					\
 	__typeof__(*(ptr)) __ret;					\
+	register unsigned long __rc, tmp, align, addr;			\
 	switch (size) {							\
+	case 2:								\
+		align = ((unsigned long) __ptr & 0x3);			\
+		addr = ((unsigned long) __ptr & ~0x3);			\
+		if (align) {						\
+			__asm__ __volatile__ (				\
+			"0:	lr.w	%0, (%4)	\n"		\
+			"	mv	%1, %0		\n"		\
+			"	slliw	%1, %1, 16	\n"		\
+			"	srliw	%1, %1, 16	\n"		\
+			"	mv	%2, %3		\n"		\
+			"	slliw	%2, %2, 16	\n"		\
+			"	or	%1, %2, %1	\n"		\
+			"	sc.w	%2, %1, (%4)	\n"		\
+			"	bnez	%2, 0b		\n"		\
+			"	srliw	%0, %0, 16	\n"		\
+			: "=&r" (__ret), "=&r" (tmp), "=&r" (__rc)	\
+			: "r" (__new), "r"(addr)			\
+			: "memory");					\
+		} else {						\
+			__asm__ __volatile__ (				\
+			"0:	lr.w	%0, (%4)	\n"		\
+			"	mv	%1, %0		\n"		\
+			"	srliw	%1, %1, 16	\n"		\
+			"	slliw	%1, %1, 16	\n"		\
+			"	mv	%2, %3		\n"		\
+			"	or	%1, %2, %1	\n"		\
+			"	sc.w	%2, %1, 0(%4)	\n"		\
+			"	bnez	%2, 0b		\n"		\
+			"	slliw	%0, %0, 16	\n"		\
+			"	srliw	%0, %0, 16	\n"		\
+			: "=&r" (__ret), "=&r" (tmp), "=&r" (__rc)	\
+			: "r" (__new), "r"(addr)			\
+			: "memory");					\
+		}							\
+		break;							\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"	amoswap.w %0, %2, %1\n"			\
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
