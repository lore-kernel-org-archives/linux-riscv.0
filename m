Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839C1606A31B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 06:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z/BO+aWO;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Odr0VIDB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qTUBNo+hb6J/Tuo2oxcrBE0SjU6nx02SR0HyUma3J5I=; b=Z/BO+aWOXqCrVGTePeqGuymPsG
	bHT/Umjqdrwx3YMG4aith4/blfLXdZucA+ah+J+aIwDAiWgcb80wmwPWeUZ8jdnB2N01bYvyhYQr4
	LpIRrxAt5L0Y+Ox9VBRWmVRsYHcgu1VlY+3KVaaOhUtOVltqnQ38gOllL5+q/juIFMEx+wNUU2DK6
	mVAfScK7R0AMNJe+eb03FAJ9/xLV2Gbi/9LZJXU2LB32S9Ht4s5NOKenG/s1G+5A4UeI4WRvwnRan
	h1Mp8xW2ofrX7K8RuH607lT8VSXzul1M76Ht4H6uYAHGivALA4OnyUAKh9ksr0ir5fDhYiC9ovjxa
	cx2mzIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLanB-00000003qKT-1kYJ;
	Tue, 27 Oct 2026 06:36:17 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLan8-00000003qIo-0uwe
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 06:36:15 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so2497051a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Oct 2026 23:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082973; x=1793687773; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/4xZBRPqWoqmG3ZLUyWqQC80cb8SEBhLFlhSnr0xrG4=;
        b=Odr0VIDBDDF5haK485dSktldqca2oXKasd/KUMLwZpq33oW3jwMnF5zDhJExes4xda
         ByvFyOPQRc1zwNiV5cCHUqmogZeBGolSM/qSfHF792zzdk1uIP8PFO7sXyik2L2aezzc
         bpDVv00AP+cPjcFHjyFlZscGpORTPicYI7h8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082973; x=1793687773;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4xZBRPqWoqmG3ZLUyWqQC80cb8SEBhLFlhSnr0xrG4=;
        b=vWLTcBaTzapvssqlN6CqeVgKWuuiETwtdQb/jmmlOxgWn2I/g8GlNashS88/CKLPOg
         0su8SMiQISYoryF4hdVmI6goYsSbyUwzRUnU4l+mMhMw8xl8lDCLOBI5Bywz6EpOaB0r
         thS+0n5N8nSZThyyv7rfb9yLJwjjRRMHwl9ji/PX6FonUPMcQbfqK7gAddEVb268yjwv
         +wQxxwQretvfWAZ3gvrCPC+4/HfdRjoIUg49LvDk4XzHfB78hySm7TKsLuzVMNrYdJ49
         0F4j1ZtkpGIsR4907BBr+XM7kqr+XtNb0fgo4dFOz+z0uoP6ORB4fq2DxYAdKSgVjQlA
         HN0w==
X-Forwarded-Encrypted: i=1; AKwUvBzVt154bW49p86TVLnwqIic/+ODOOlfGcGticxa/6MXXLgGKFY12dtALO2oD2RPCjVnBvFOi7WWXT3hNA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLnAO+LlIyuaA1LzJG9CbBiPfNSb7+cxXsScuk+Yq8rI584+rmt
	amddwtmpundzNuyeLgggbCQYQkpTAvhlMoKP5FavmBV2xT0JVSsXpdMnnwjbqnqFHqA=
X-Gm-Gg: AYBFou3WE9OEqxd2Ivvt2ZiL8w2YqoFa1uJIzFTpb5EhZaOrb9nfbFw0An8iaHS6qJq
	vmZZH51DitnsEQ0gT42T9Mb0kKszqFJ8oHr1z4vKyeVqhyQjDTMQ+DVWP15ZmlwIVJjGJ//Tmfg
	uDT8OToIlPwbuYyLInLu1DkVirFNclnlfjxTBxb3qffiA1UGeQzOamFdXDyHTTvXsGhJvZXKtLn
	EQCOJ8A60TOEuyyt+F7wltu83O1UKJ3QOKzknqaAMRTdUTy8Hk3sXIXh/xyS0VBkp5aNAC0wGb+
	B0lQELNP/9089BljbyswnVKLM6QMW1J1V5WycqoSw4CV77JBa0uoSR7yNszXYO7PcEr1lvzpeOC
	Vd8bFz9mgINl4ug/L4Bkrqh4OsH3VwOdEsmIHrwacumY2DPBfSRZ/8ySDzRH3y8WoBv4s5H1nIL
	nX1wAnEeOO8GhMqOUAY3AdBsNIsPbRvclIQI/kTs0MTXL2D14UzixnmP8MkGLcC7L8PoCS1+frc
	HwvC+PJUHbrHrc2O55LmV1/OtK/Hj2ow4rZKiSzDvAxgRJ6g8435PBKfgwnptrJkEusyoNzV6N8
	IGYueYZSHeBhu1QqdThJfu6i+pc+wL0anq6YJyveA0YTcuacRBAUOxoxYumBZ8+yu1qpoXII4uC
	F/ciUtwBxfOX0YfdpxcIoDPQ=
X-Received: by 2002:a17:90b:1c0b:b0:3ac:9e5e:d19c with SMTP id 98e67ed59e1d1-3adea8990f5mr7512458a91.17.1793082972994;
        Mon, 26 Oct 2026 23:36:12 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614daasm2254704a91.4.2026.10.26.23.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:12 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:09 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 1/3] sched/core: Skip the shadow stack end check when SCS is
 disabled
Message-ID: <0e607d3aa7c2c4cc1b5b8ba7b0e25ebdb55726af.1793082868.git.chris@chrisdown.name>
References: <cover.1793082868.git.chris@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1793082868.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_233614_283164_8AA50B45 
X-CRM114-Status: GOOD (  15.80  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With CONFIG_DYNAMIC_SCS, shadow call stacks are only used when the boot
CPU lacks pointer authentication. scs_release() already checks
scs_is_enabled() before it looks at the shadow stack since commit
9beccca09840 ("scs: add support for dynamic shadow call stacks"), but
schedule_debug() does not.

With CONFIG_SCHED_STACK_END_CHECK=y it therefore checks init_task's
unused shadow stack on every context switch. That is harmless right now,
but the check is redundant and costs a load from an unrelated cache line
in __schedule().

So, let's guard on scs_is_enabled(). It is a static branch, and it folds
to true when CONFIG_DYNAMIC_SCS is not set.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d7c3b43158de..fc269fd10192 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6152,7 +6152,7 @@ static inline void schedule_debug(struct task_struct *prev, bool preempt)
 	if (task_stack_end_corrupted(prev))
 		panic("corrupted stack end detected inside scheduler\n");
 
-	if (task_scs_end_corrupted(prev))
+	if (scs_is_enabled() && task_scs_end_corrupted(prev))
 		panic("corrupted shadow stack detected inside scheduler\n");
 #endif
 
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
