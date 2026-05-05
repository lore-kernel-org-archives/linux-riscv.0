Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D16CD3430
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 08:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ycq5s6jZ9SAXXKmMl1uRlX2OdtVrtAsvlw9HhaS2dL4=; b=CDMaVA+s6qY4gK
	81lmUz4SJOI2QLSQLAG81NCz7iC4iHKefM+3BeCc1O41TxjUnzbhWzYt6WtAEMFPfp24Ve5yfjiHW
	w1KfvkLpm4Cei2+ys45/dM7fXwyZffch0eQteGLG2y8unIk05EE//ziiskuyuf3lq1At4WMFGa0gb
	sr/C9s18Kh94nMIjSeqc2Bo4D7J9PoRpuPmNaF3XD2H7yUT+DQ8K2B5SfmKx+gYpzN25OqoagC9no
	bLBazM4ARXGzyVCw9B9gDagaDbfCMf0ChU2zTEKEbhB48axfKaL6UTxEhZF/AvE3L0zZCcYPC4Pz0
	lzy5H8eGjPkcMtr8m49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBcL-0000000Fb3G-2RG3;
	Tue, 05 May 2026 08:59:01 +0000
Received: from quail.birch.relay.mailchannels.net ([23.83.209.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBcI-0000000Fb2A-0cug
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 08:58:59 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 284BC401C7F;
	Tue, 05 May 2026 08:58:54 +0000 (UTC)
Received: from pdx1-sub0-mail-a219.dreamhost.com (100-96-8-23.trex-nlb.outbound.svc.cluster.local [100.96.8.23])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id B7ADB400C25;
	Tue, 05 May 2026 08:58:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1777971533;
	b=aENW6dPsBeaLGFHZjPmUKNZ8QMi17Z8gxxT3TdvReu6iW227b0582SFe84CaBrmKsKnq8d
	k13CQncv/nMODZYQMqvCxHlqGX5BPzvMQ8bX0N6VjwJQ+ORh3UbJJtXNNC7akvQmR1oSNS
	bT9O7Stz/awwVDAE3vZolwkpRB2w4Y+SFXgNnSGZOgolYvJDV69wwVuHgChHX1e0QTHONU
	LcGrvXFmWaauTqiphsdUF4PZNh5/I8+SozHWoqAEDikk5z30xot9C1jvNUvxahNVbw7C4B
	tbp6mL87bf9Alr4fm52BJS6K6TzURR32gRXSnHxWtWZd7AOOrFthhhX9RUbt5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1777971533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=5esMUj/TkuhJKus0H4DN/SnnF1H8yiY029Hg81dbmCs=;
	b=s+KkuwjfcYpcvcWUYrfyt50I92AsSu7LNdhsGzIAygrh0x+yOr9Wz8v5iidP/C+1fiQv/O
	3hJYraMXEZCSXTuQmw0ZO8N5hyAejebC81xpM6OvxmtyUhf+Shgd+KEiaTixmI70ND32k5
	F4HjnK1+oH++VQTGIiDRLHK55IxG8Q9l/olZT6gCMUFJ95kLq8+nVWO85gdiB0V19ykYpR
	A77kwugE01rUqiRCVoX5TYSHTkdPGx7Ek9QUvm3zGHl3QtF4UYfBYFRfRLxnVqsC1Llcpp
	ApRv61gjh5bQSMWtMDxIR8myPmc8k0lShKJ8gypaT2+1GzEQAjsWA8oYgItWBg==
ARC-Authentication-Results: i=1;
	rspamd-7766795c76-jv6d2;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Lonely-Tangy: 17f2964d55dcece6_1777971534028_988924832
X-MC-Loop-Signature: 1777971534028:3808556914
X-MC-Ingress-Time: 1777971534028
Received: from pdx1-sub0-mail-a219.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.8.23 (trex/7.1.5);
	Tue, 05 May 2026 08:58:54 +0000
Received: from localhost.localdomain (unknown [213.147.98.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a219.dreamhost.com (Postfix) with ESMTPSA id 4g8srB4zKfz1h;
	Tue,  5 May 2026 01:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1777971533;
	bh=5esMUj/TkuhJKus0H4DN/SnnF1H8yiY029Hg81dbmCs=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=k1uSlPHA/N4hJv9cT0MnKVN5TeQrG1D9vev1YJYXqOj7aVboICGBEqx9WCMkfyrLC
	 UAIEXkMp8STm6uaQGNDGoFUI6uywpnlp4Jg3HO5xo7CWhGk9/nJre9yBKfB2snl5LO
	 Q9W/ThNTqmvGDMEYgWz+OTL/zABungW8g82wDN1BzQvSkutVsPU1qD/Ysd01AA/TrJ
	 yI+E6gBg46aqUpOs0214gIOnz4dQ4AMPPfdbIzWkGES64eWqnftf0jsEx0psOFerDf
	 hAjTlXj14vzueuk1akLdnJar0+sV2TGYDb/xbUqD9rZVHFkwHAkknLP9lQRAXWvuKT
	 RJEg+uGZDmb3g==
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
Subject: [PATCH] riscv/futex: Bound number of LL/SC retries in cmpxchg
Date: Tue,  5 May 2026 01:58:35 -0700
Message-Id: <20260505085835.986669-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_015858_369564_52D26D84 
X-CRM114-Status: UNSURE (   8.40  )
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
Compile tested only.

 arch/riscv/include/asm/futex.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index 90c86b115e00..865701807014 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -13,6 +13,8 @@
 #include <asm/asm.h>
 #include <asm/asm-extable.h>
 
+#define FUTEX_MAX_LOOPS	128
+
 /* We don't even really need the extable code, but for now keep it simple */
 #ifndef CONFIG_MMU
 #define __enable_user_access()		do { } while (0)
@@ -77,6 +79,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 			      u32 oldval, u32 newval)
 {
 	int ret = 0;
+	unsigned int loops = FUTEX_MAX_LOOPS;
 	u32 val;
 	uintptr_t tmp;
 
@@ -85,16 +88,20 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 
 	__enable_user_access();
 	__asm__ __volatile__ (
-	"1:	lr.w %[v],%[u]			        \n"
+	"1:	lr.w %[v],%[u]				\n"
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
