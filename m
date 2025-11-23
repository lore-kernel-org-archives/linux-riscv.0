Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47530CFC518
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 12:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qSA7CEDBp/FrwgahCcxGkgEXurrHrzkfThHNZuB0LM=; b=O3XRgMgAGUy4oM
	eoJDbslspqLN6zQmUJ8cEbtVERN81/rnr2FzvnlGw/EmatgmvXGEGx5DsFgRYdlOR+u+msM9Dd3Tn
	us+9fBuU8/DOc43uZNadUe4Bt9q0FSSIMSoB29xTBQPsU8PRcxKfk8/zBSd9TqUEDReD87SSfP2ph
	ZG674aYYpgMidrghHUu2vtjt5+7QrY50CXTgYf0nMmsdfqdoCjhEcEtQMftnfojFAPzMUSaUTjYbw
	2RPKOQR6I7hcm2EgDnk3+lykeLDlE+0DdD6mvZ55cM83rq95bL3wokFN03GQWOLovCANAl01mFGZT
	NEkn/Sy4Kvtkec5x899w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN967-0000000AP43-0gv7;
	Sun, 23 Nov 2025 12:21:43 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN964-0000000AP3F-1cMa
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 12:21:41 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7ba92341f83so4820450b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 23 Nov 2025 04:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763900500; x=1764505300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gehuDY8hCnCk3Q8zSl7CeP6iDX7lw6Gp8zKZT6EL4m4=;
        b=KL7b8rcTo3bAaamwGdyDotf9sOmbUzuAwkIuvclhD+fjUDjVzjsBVGzZPXc0NqCElZ
         YloiplLim1moLPHEFIPAIIpP1PwwcjpqNEQOUx36q7OApnY5ilI6Quk9XOnBEVjOjz1T
         7jxlahFhUJ/bnEADlfsNWnlF88XSkkolSi73Fmlo3cmp7oQBVCPU/BgRfr6yobCX+1ml
         ZSoVfQEUrb04Pozk/L3F8v0gkwcqhtdjZiC5CCe0Ocr5884aM5gC1I2Q/cpQeoE+shPG
         71RI9mthMqjvw8TuZZF6hbryHIRSgaszxH+BDT+RyIGrAhIoEOd8sQW5x5kaVGWR83ZT
         aV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763900500; x=1764505300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gehuDY8hCnCk3Q8zSl7CeP6iDX7lw6Gp8zKZT6EL4m4=;
        b=afm5ebEViJytKdwNLEkgmzXsJjOP4CvucBkSFHDJoByKs6RL9fIeyHN0CfLn/4Ih/q
         klB4a1QxdMmSEP4PcQnsk1v7UUg2CVsrjzNQABbo0UyINvxexfxFJ6SUbsKy5AfJh5IU
         rNeU6qkFAmv5A11AWut/z58R276EH+sr/sm8/ziWQlfWaV6B5GiJr/N7xHFnfwcpwFF1
         vVyMdP74NJNEP1F/BdBYC+rBp+FAvqO2+uniAmvRcM+izSYiLpi39QtIdfc91b7fCoIV
         fJ9+uv8wvR5LHEctRzsj0Kmg5jFCqVwFXeGnD7usrvIf9ZoNL2CqD+91fT8b6y02j0J0
         hAKw==
X-Forwarded-Encrypted: i=1; AJvYcCW8cC5gdX8BFO6UzCGq47yw1mk/0+tP3TooC8vCR8Q2vDxKvKwtKbcG7MMhBkfaUbKGVwKSv06WrWughg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUkGTyNgTRbp0t0ufnCGj59AyiYA01z6cc13HWAI8VO33Pf3di
	egWTPNgWBBoNq5YcDvImU+AtA2vKH8JygpIOoAlgDjUe47QKf6D2sryk
X-Gm-Gg: ASbGncskDt4QbDXJBJ1q0fyIAXCIHtJ8GBlNNKyVDvcSG1ZSADTNluZ7B9VwZwcfLXG
	I+2/L/wsdLnUPSTw5xhE1jb0F+fHIuAr1xCnwS+FGQZ/aYEPK8pUS5k2y0v5wGnyBgTeXL35Rvl
	e6cJjNrtcId2OqhKB+Skkf/rPoVJ46RCsPFPUDxa4TX9l008h+4qqrTkNwSdHxseq5U56h/ITk6
	lbRT0Lc/HuZL08wSw76MqXbanxeK7jLh8X8IhhycrIdUzh2/OyNSh3Q65sm49sy1ouXbbsqFyUz
	uTXXX7bbpJGz50voZjJyei39zp7racldSxiLOfSSfo6JEFsDrfKTDdNiw4dOSQ7Z8YFJ7heLYun
	h0dzYSvv9WrHbpb8KbLKudmKtTBuT7mTwZ5Nm5VLUbTfGCKUqchOllAEMZjviKhiFN09h+ZAY+8
	KK857BF3Aiccn4gRud2EG+m345wj5YdZBWWf/+gA==
X-Google-Smtp-Source: AGHT+IGKqRo5Rqn/7cYYbwvHMYFh4KwgapmQlfr3dLMTE6/Ihy9Y8y5GgtK/UfE6HYkuLUDpc/O0UQ==
X-Received: by 2002:a05:6a00:22cb:b0:7b9:d7c2:fdf6 with SMTP id d2e1a72fcca58-7c58e601920mr9501764b3a.24.1763900499427;
        Sun, 23 Nov 2025 04:21:39 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([45.121.215.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63aefsm11410178b3a.52.2025.11.23.04.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 04:21:39 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de,
	peterz@infradead.org,
	david@kernel.org,
	riel@surriel.com,
	segher@kernel.crashing.org,
	hpa@zytor.com,
	arnd@arndb.de,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	thuth@redhat.com,
	akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com,
	anshuman.khandual@arm.com,
	nysal@linux.ibm.com,
	max.kellermann@ionos.com,
	urezki@gmail.com,
	ryan.roberts@arm.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev,
	Xie Yuanbin <qq570070308@gmail.com>
Subject: [PATCH v4 2/3] sched: Make raw_spin_rq_unlock() inline
Date: Sun, 23 Nov 2025 20:18:26 +0800
Message-ID: <20251123121827.1304-3-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251123121827.1304-1-qq570070308@gmail.com>
References: <20251123121827.1304-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_042140_425227_F29C9FBB 
X-CRM114-Status: UNSURE (   9.69  )
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

raw_spin_rq_unlock() is short, and is called in some hot code paths
such as finish_lock_switch.

Make raw_spin_rq_unlock() inline to optimize performance.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rik van Riel <riel@surriel.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: David Hildenbrand (Red Hat) <david@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: H. Peter Anvin (Intel) <hpa@zytor.com>
---
V3->V4: https://lore.kernel.org/20251113105227.57650-3-qq570070308@gmail.com
  -- Revise commit message

 kernel/sched/core.c  | 5 -----
 kernel/sched/sched.h | 6 +++++-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f2931af76405..0f9e9f54d0a8 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -678,11 +678,6 @@ bool raw_spin_rq_trylock(struct rq *rq)
 	}
 }
 
-void raw_spin_rq_unlock(struct rq *rq)
-{
-	raw_spin_unlock(rq_lockp(rq));
-}
-
 /*
  * double_rq_lock - safely lock two runqueues
  */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index bbf513b3e76c..a60b238cb0f5 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1551,13 +1551,17 @@ static inline void lockdep_assert_rq_held(struct rq *rq)
 
 extern void raw_spin_rq_lock_nested(struct rq *rq, int subclass);
 extern bool raw_spin_rq_trylock(struct rq *rq);
-extern void raw_spin_rq_unlock(struct rq *rq);
 
 static inline void raw_spin_rq_lock(struct rq *rq)
 {
 	raw_spin_rq_lock_nested(rq, 0);
 }
 
+static inline void raw_spin_rq_unlock(struct rq *rq)
+{
+	raw_spin_unlock(rq_lockp(rq));
+}
+
 static inline void raw_spin_rq_lock_irq(struct rq *rq)
 {
 	local_irq_disable();
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
