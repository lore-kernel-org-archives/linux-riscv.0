Return-Path: <SRS0=wsUA=OK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EB1C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  1 Dec 2018 00:03:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00DF420867
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  1 Dec 2018 00:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RUunLlzV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qex5YzYa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00DF420867
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5wJtlwhLtorxH9M9BYqX9q52986PmvNIP1I1cX8yTrI=; b=RUu
	nLlzVCg8O98kYU5p9HjjWtDrJTmq7GTy6dlLqaNd8ZpXOdjTc8oL9vSfO8ORCw6sTovMx6ztJw2ZC
	FSSpa+G9QIV3c0aJspLvIL18IqeE+d02DCZi/ubZS/JbjtC/lnqL8tDxmlzGiGg7b7m0m3705RB2G
	CGzvyXsAhgvA2i9TbPTj3TfEyS1cx/pkTDnIUj1/pyC5xOUeGlGnmsQM6pni0r4S2UF9mPxalcmAw
	/lSRfnP4xy8iqDiZl3SusmC7QZY7zyGlNj/N3LqEr8jmLgUFcSyuTuvo4g7/TPG5uO+dMwPhkPdCD
	xBmMdajZ/epqfyealRsiYreWDUnyoLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSskW-0000MK-U8; Sat, 01 Dec 2018 00:03:08 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSsjo-00084a-Ko
 for linux-riscv@lists.infradead.org; Sat, 01 Dec 2018 00:02:40 +0000
Received: by mail-ed1-x544.google.com with SMTP id h50so6216389ede.5
 for <linux-riscv@lists.infradead.org>; Fri, 30 Nov 2018 16:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=OLSeUXZWPiLpVNgtUryyQYdNnf4Rl6/UQHX0BL1gdBE=;
 b=qex5YzYaGMRrHTasV9FB5+MkLHaiBmJsFpacltp2AgyaGW7Ji1RnsyPTOcOy6EdjOm
 F2YCayAOE8NTRxvDSSpPe5cAAjwwjWEuG1oyKEBnnNstDUb1iltDGiTVl9svElLeBRh/
 xGonPs4lfNOD8cJumUXNnSlaeJEJ95/jWYbkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OLSeUXZWPiLpVNgtUryyQYdNnf4Rl6/UQHX0BL1gdBE=;
 b=Qa0fY63VIpsXT8lij2hAhJVtTyVYZJSBuM2Oyewv8yXZg5WnhEMTS6PzH4u6Tpta8K
 CYI0LTjczDEvzI1qdNAy9Kt4VXN0MiRSuzRR2uGQtuCHDC/oa68xsn5emYmlEsBdZUUS
 Hn0vneyapqW2g0BMhyew7sSl14hkzCspdZsqVHf0x11Olw8A5vSUP4oRLVmqLO5PEI3A
 xQ8byYKZzPd/9hJfTceaYwdezHxE+0HkKnTQJmbnJhjKWt0/6yiIQBIvAJz3eMcaYg+2
 gwR6RdMEWp4BDRzbigzfbcKgXtYYOu2mYmzpexaHHaSu95Kp4d2sOf9Yz1g2lJU6OAwK
 LfjQ==
X-Gm-Message-State: AA+aEWZsZg/+SVTGGg17rUVKzepf41JkJ/Ji1JmrT+aDGtN0meVt8WVt
 fbJ2dfCKQzNEE1lIRtnE5SGyJQ==
X-Google-Smtp-Source: AFSGD/VmwqdFJFgNvUHrmAOw/PNQJ+bheEpPhgYAPC0xAJY36zKz0q+iAm8PdEIzyiMwnH7WF6kzow==
X-Received: by 2002:a50:b2e1:: with SMTP id p88mr6719797edd.254.1543622532505; 
 Fri, 30 Nov 2018 16:02:12 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a00-1028-8386-da8a-eacb-c188-78b9-634c.ipv6.broadband.iol.cz.
 [2a00:1028:8386:da8a:eacb:c188:78b9:634c])
 by smtp.gmail.com with ESMTPSA id k32sm1764304edb.42.2018.11.30.16.02.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Nov 2018 16:02:11 -0800 (PST)
From: Andrea Parri <andrea.parri@amarulasolutions.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv, atomic: Add #define's for the atomic_{cmp,
 }xchg_*() variants
Date: Sat,  1 Dec 2018 01:01:56 +0100
Message-Id: <20181201000156.5366-1-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181130_160224_935033_CE6AF83B 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Andrea Parri <andrea.parri@amarulasolutions.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

If an architecture does not define the atomic_{cmp,}xchg_*() variants,
the generic implementation defaults them to the fully-ordered version.

riscv's had its own variants since "the beginning", but it never told
(#define-d these for) the generic implementation: it is time to do so.

Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
---
TBH, the delay was not intentional: I've just become aware of it while
working on moving riscv over to queued rwlocks.  There's currently one
callsite for the non-fully-ordered variants mentioned above for riscv:
for atomic_cmpxchg_acquire() in kernel/sched/rt.c:rto_start_trylock(),

[before]

     51a:	100726af          	lr.w	a3,(a4)
     51e:	00069763          	bnez	a3,52c <.L17>
     522:	1af7262f          	sc.w.rl	a2,a5,(a4)
     526:	fa75                	bnez	a2,51a <.L1>
     528:	0330000f          	fence	rw,rw

[after]

     51a:	100726af          	lr.w	a3,(a4)
     51e:	00069763          	bnez	a3,52c <.L17>
     522:	18f7262f          	sc.w	a2,a5,(a4)
     526:	fa75                	bnez	a2,51a <.L1>
     528:	0230000f          	fence	r,rw

---
 arch/riscv/include/asm/atomic.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index c452359c9cb8a..93826771b616a 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -303,6 +303,15 @@ c_t atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n)	\
 
 ATOMIC_OPS()
 
+#define atomic_xchg_relaxed atomic_xchg_relaxed
+#define atomic_xchg_acquire atomic_xchg_acquire
+#define atomic_xchg_release atomic_xchg_release
+#define atomic_xchg atomic_xchg
+#define atomic_cmpxchg_relaxed atomic_cmpxchg_relaxed
+#define atomic_cmpxchg_acquire atomic_cmpxchg_acquire
+#define atomic_cmpxchg_release atomic_cmpxchg_release
+#define atomic_cmpxchg atomic_cmpxchg
+
 #undef ATOMIC_OPS
 #undef ATOMIC_OP
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
