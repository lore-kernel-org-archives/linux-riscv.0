Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB96ACD3427
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 12:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D2o+I0Rx7uDgpn33uWsqxIO9SgNkAwpVGxqOWzvaBaA=; b=PX/7yfXLTbfcyV
	dtIcqhVseLOIr++YQPJPJSFG0ieVy+X+j7aO9+JHd5ZeSSNukgMOYOEyruPWf3AJSXNlq6FoTnUPr
	n4lo4+1zYou3SAJTB1t47xJ9IRMENBG8cvkEploxCFJB8OcRWEmrAed1A2FpCDmmmTmiJNGBXkgED
	LpPNgwQKrWb560RRb0gZrs94d1ENMFuhhtycXZgYzEt/NZ4FlT0xiU9u6FC+cXVisCiQ6xks36Yw2
	bS5S4JFaQG1IbeuGizk76ujNfU0FzhDjN2A3FXUaVF0cJ4FNpD9iULCr/XwjITXDTB4DhM4ePcv3T
	o4oqdU4P8h3eilxRa7DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFGK-0000000GEsg-3o1M;
	Tue, 05 May 2026 12:52:32 +0000
Received: from shrimp.cherry.relay.mailchannels.net ([23.83.223.164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFGI-0000000GErg-474a
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 12:52:32 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F15B2640319;
	Tue, 05 May 2026 12:52:29 +0000 (UTC)
Received: from pdx1-sub0-mail-a203.dreamhost.com (100-96-37-59.trex-nlb.outbound.svc.cluster.local [100.96.37.59])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 384DA641DE9;
	Tue, 05 May 2026 12:52:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1777985549;
	b=mVSWc6mTGg+wiyJUI18CGjYO8PVQg3toNqFX0dyDMY3BAfhQ491rHC2tg1k6QTMODfjSHs
	gipfdzaBvj3Xi2s5wKrRhVe/wCo+a6uyFQdMbod1SsE2x+Q9/p15ierT6AGW3qiQQGBR4n
	fJiUjyQoVjetvt2uZdOvyu+26fA//NjwAFoJ3HVeYEENYVFJPLtG5S0IsDWok5K4Tv5Bzl
	yBzvou+ltG6GBAxNhnoo/4ekMS4v1aZ3l+lHqgnkKwPzOSv3ZRyBgVyuE5hqoFsn0PTtPb
	sHkfgD4N/YrfFJWn3XxyYNMN8MQFp47SBMppennZJ88DxQo1/raRyzeSUmQ4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1777985549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=tvcP63PpJTRCsldzoS7GQR0FGgnsc/i9NsamSdKaaGw=;
	b=YlJxbFVOfVqLk0sKBAXJ7DoLwowDXP8VQi+gcf87GfizDqIz+iZs9v0WXpTGQAdYMPFqgu
	mn5w49h/Aw1OdRE/EJHzBrvYr3k4U5PWfl77E6Ve8zqpUHNn+QBOX3O0XGsWK4GcLIbNoV
	k6Qftn0U5FAKVniZprhdohk06L6WpIma7xsHVNfKQpEpgcZUFcY65QD77/KME/xEwLwLrO
	1zMJXe/A7/cZkh6lOInX5MdxcJ6cX/sENks3yLWoG5G/xQ1XQhcG4TiPblnw3t/tMaL/NB
	3q+g4NF/om84ic+qzxm+5VPWtgc+wfoNCAcLEzclOdtUFv1kSkDO095azjufTA==
ARC-Authentication-Results: i=1;
	rspamd-7766795c76-5hwl9;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Name-Shade: 789e912a78d2b0fb_1777985549872_3292064370
X-MC-Loop-Signature: 1777985549872:92822838
X-MC-Ingress-Time: 1777985549872
Received: from pdx1-sub0-mail-a203.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.37.59 (trex/7.1.5);
	Tue, 05 May 2026 12:52:29 +0000
Received: from localhost.localdomain (unknown [213.147.98.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a203.dreamhost.com (Postfix) with ESMTPSA id 4g8z1k1BQ7z20;
	Tue,  5 May 2026 05:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1777985549;
	bh=tvcP63PpJTRCsldzoS7GQR0FGgnsc/i9NsamSdKaaGw=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=nrMhEXA6GE7QSle04dEmcHOwGFUd7YYh5CtTH+SpqjhsUzh8yjfupOED3eFe9UwFb
	 GcnkZi3vdNbnJ1JhVNLWLR0ztYRbQc10oB/p5iWaTcSX2gBS8msgqGLUhQJeIKb2rn
	 LijTea+DRV0ApEtaYf3jw6WNS5jjOpdiyU9y557O09T3LbuuCU5uVvsQfYLOYKiJLu
	 e0W9LIKIWItmmnznJ4udsh8iVlgyDSl6JxinpAw/XuuFXpsysVCzcAppmNpgTAtfJ2
	 ZX9vMGqaZPXfWdwwl2tWTJImXDJaCpHeOKtQsPh8MefQqbo1bBah5uBKYLorgR7hEJ
	 R3x+NKJA+0V2A==
From: Davidlohr Bueso <dave@stgolabs.net>
To: pjw@kernel.org,
	palmer@dabbelt.com
Cc: aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	dvhart@infradead.org,
	andrealmeid@igalia.com,
	dave@stgolabs.net,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv/futex: Bound number of LL/SC retries in cmpxchg
Date: Tue,  5 May 2026 05:52:04 -0700
Message-Id: <20260505125204.999119-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_055231_177562_76DA4C85 
X-CRM114-Status: UNSURE (   8.70  )
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

futex_atomic_cmpxchg_inatomic() does an unbounded LR/SC retry loop while
(minimally) holding the hb lock + pf disabled. This can lead to pathological
cases from unpriviledged userspace pi operations.

Bound the retry loop to (arbitrarily) 128 iterations and bail: drop locks,
rechedule and retry the operation, similar to the arm64 variant, as of
03110a5cb216 ("arm64: futex: Bound number of LDXR/STXR loops in FUTEX_WAKE_OP").

Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
v2: patch now applies (and removed a whitespace change).
Compile tested only.

 arch/riscv/include/asm/futex.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index 90c86b115e00..be69d4211248 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -13,6 +13,8 @@
 #include <asm/asm.h>
 #include <asm/asm-extable.h>
 
+#define FUTEX_MAX_LOOPS 128
+
 /* We don't even really need the extable code, but for now keep it simple */
 #ifndef CONFIG_MMU
 #define __enable_user_access()		do { } while (0)
@@ -79,6 +81,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	int ret = 0;
 	u32 val;
 	uintptr_t tmp;
+	unsigned int loops = FUTEX_MAX_LOOPS;
 
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
@@ -88,12 +91,17 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	"1:	lr.w %[v],%[u]			        \n"
 	"	bne %[v],%z[ov],3f			\n"
 	"2:	sc.w.aqrl %[t],%z[nv],%[u]		\n"
-	"	bnez %[t],1b				\n"
+	"	beqz %[t],3f				\n"
+	"	addi %[lp],%[lp],-1			\n"
+	"	bnez %[lp],1b				\n"
+	"	li %[r],%[eagain]			\n"
 	"3:						\n"
 		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %[r])	\
 		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %[r])	\
-	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
-	: [ov] "Jr" ((long)(int)oldval), [nv] "Jr" (newval)
+	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr),
+	  [t] "=&r" (tmp), [lp] "+r" (loops)
+	: [ov] "Jr" ((long)(int)oldval), [nv] "Jr" (newval),
+	  [eagain] "i" (-EAGAIN)
 	: "memory");
 	__disable_user_access();
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
