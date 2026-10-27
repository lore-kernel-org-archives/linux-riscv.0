Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B292606A31D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 06:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FsW0A5PV;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=MaI5+MYi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/xRTNPZ0phsoeBHakhxHsBV8fPH3E4ozBpobCG5+ktY=; b=FsW0A5PVvCgMjF1fQLva3RZa/Z
	eLL9TDpe6qsXRFw37lSh2IFrTFrADV+Q5utkXQi8weq0wbs6+/UAQQ7bRjkARvkQoh7Nhc/T0Bf+f
	3Sbhk+/jRwP9Alm5LzCzRp0+EN+WA6Ct2b/F/2Z7smXxYvV6aVsfDBdYhrTvl2PiLT+OvTnJeBO1x
	YV99qDn9GFEFOQcnzkY5lsDvsS8kS9sELbgd0LgFG2lyuEen2Q6P91+V9mktoOD0sQpSsD5DDLDEU
	oYeCjMSu09s4XlzR/ho94TZ1YvLOSV4aN+SranW9PuaFVfCAr5v//aDCMb2+Df8JRygbHvm2ePjhq
	k2Eir0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLanQ-00000003qT0-3iUh;
	Tue, 27 Oct 2026 06:36:32 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLanL-00000003qPK-37AY
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 06:36:31 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ea759cc9b6so14200065ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Oct 2026 23:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082987; x=1793687787; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jw0B9wUqj1NgmgC61ADFFOy+zq/xWh/Ds6uCN7rNkRA=;
        b=MaI5+MYiOxM1qWepHPRd3ylPvIzwO8cMYblsnfW8gT6wxhu+96iIbdkIO9qvugI+g8
         5TVcE7VV8MghdiqHpLquMofe3GEcnOSe+aH1dQJzZJNLMQ2UilaFPTKFGTnUEc2TqSBd
         r5wquhkchSfvEBGE5sYy0DDwPhyzf+h2J4chE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082987; x=1793687787;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jw0B9wUqj1NgmgC61ADFFOy+zq/xWh/Ds6uCN7rNkRA=;
        b=WHrQJ666PSGJzUWbRBKmTsVSZxEPL9KllMhnYbS0yWH8Yt4eOLaiDJgm9JCQorP9Q8
         8MhiQ3rzCcjuvjWDJSshatZCsglsNicRHuDwxOZ209QYlYZL/xYt76mDAwzNocAjwGGi
         dMo2rLOnELEtS8CMIbsPs6YYr2KzvTl4xQKtCV84HzjDszOmLoVqCwmuq4ZhxJsCUl9r
         e84phlF9rAb+xIltUhCzD503GzfRrNO8c5sGbGEKRARyK+PE8glupiR4VuY//oaodRgo
         UPncvYp1ZDt+MTPDZ7NAj54mlbJNbfM3ZoesnFZUwMiGeBWyAr1Fg6wXbqJf4RC/q7eq
         ztcw==
X-Forwarded-Encrypted: i=1; AKwUvBzWEvruG+OUCKXvyHHJVKe9uvdLNSuUg7oRmaQ3/9h9rMZLDtvH9/DpWHNncc1x3afm/6g3AOjULcqWAQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLtIc481Cy8zavXe9QMyXzMHbACqHTJRK0tuzE9HzlpQDvqzvCl
	41LxsocnwziCgldTuO2pyC4rhwiHqAzRF+xu7TeAAKtxO2Nu0JR97iMFk7kuU0YVFYl5BIfvT7a
	wJzwx+enT0vP+UdQ=
X-Gm-Gg: AYBFou3WgvPbDZFyMkuOAplEjkPkfTyS0NYN6RKXIybPGMrvvEaVNcifwHDQOHsMMFu
	h1D0f6+PEsTtQpM75dVh9IzleY+v3EfZr2auenZzz99EImrc3PSvyTnh8SOT3Vovi4S7KVwTIf9
	oZbL6Izj0ZG+KsGkkBLPxtkJLsO1sASqlOhTPBRJHJeFAG8UIpmCQ0TdFPrBot3RuurKSNNZfHu
	+zYLgaIlbLJrtMYZyVGMjM35u3EJghTutI8hOGDOLRMuizqML7QTQDaiOm8jURx5f3gQCP2y26d
	x7EDANfj3nxpYzr23RN57emdTujfFvX8TzcNvsRc+jf36xbb5d5KJti0+VibilAuTAFcB22kzSH
	f4of+5SeXD0GuCwtkXDpjBAilAPWAgVIwZAz99mIiLTareYtUi/+HfSmQrYJliQdQuEgJzUwb9+
	DVop9nivJqZB/ws1dzSEtUrFhUaaPXrnU+wCdtj35AS4Dk47HJ0UTBGJHTh5mpjWQyJx59HLQIE
	SJQlkIPyIMEO8SPOOtT20jW+VndZF0wXuvG9gPxqsSTn1akdi+WUg+vDvTotUDrB4ihT7DhdrSQ
	7td3Ml5obea1yvNAGlJY5pzywzFCvkHCbFJA1luXXVTr8DFZFtQHa7Lf/I69Z3FOzoe1j9IlwqC
	72lXPQ/3wv5nVBb7B9mwk7jjLKBeP2XM6cQ6L8k3nIfwPok1WZAJxKtN94Um6vx5qwHNZIadN
X-Received: by 2002:a17:903:3806:b0:2e9:5175:2eb with SMTP id d9443c01a7336-2ea9c0f388fmr74433055ad.1.1793082986640;
        Mon, 26 Oct 2026 23:36:26 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b768ffsm4180085ad.24.2026.10.26.23.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:25 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:21 +0800
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
Subject: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
Message-ID: <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name>
References: <cover.1793082868.git.chris@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1793082868.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_233627_790180_02E13A51 
X-CRM114-Status: GOOD (  19.88  )
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

CONFIG_SCHED_STACK_END_CHECK makes schedule_debug() check the magic at
the end of the outgoing task's stack and panic if it has been
overwritten.

Right now this can only be configured by setting the Kconfig option at
build time. At Meta we have it on for some hosts and off for others,
since it is helpful but adds cost on context switching. That means today
we have to build separate kernels for each, which is less than ideal.

So let's make this configurable at boot time. In benchmarking sched pipe
and sched messaging performance is unaffected.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  8 +++++
 kernel/sched/core.c                           | 33 +++++++++++++++----
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fbee7b544903..95911d33c0fe 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6811,6 +6811,14 @@ Kernel parameters
 			core priority to both SMT siblings, so this option
 			does not favor either sibling.
 
+	sched_stack_end_check= [KNL]
+			Format: <bool>
+			Check the magic value at the end of the outgoing
+			task's stack (and its shadow call stack, if any) on
+			every call to schedule(), and panic if it has been
+			overwritten.
+			Default set by CONFIG_SCHED_STACK_END_CHECK.
+
 	sched_verbose	[KNL,EARLY] Enables verbose scheduler debug messages.
 
 	schedstats=	[KNL,X86] Enable or disable scheduled statistics.
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index fc269fd10192..c1fb86b813bb 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6143,18 +6143,39 @@ static noinline void __schedule_bug(struct task_struct *prev)
 	add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
 }
 
+static DEFINE_STATIC_KEY_MAYBE_RO(CONFIG_SCHED_STACK_END_CHECK, sched_stack_end_check);
+
+static int __init setup_sched_stack_end_check(char *str)
+{
+	bool enable;
+
+	if (kstrtobool(str, &enable)) {
+		pr_warn("Unable to parse sched_stack_end_check=\n");
+		return 0;
+	}
+
+	if (enable)
+		static_branch_enable(&sched_stack_end_check);
+	else
+		static_branch_disable(&sched_stack_end_check);
+
+	return 1;
+}
+__setup("sched_stack_end_check=", setup_sched_stack_end_check);
+
 /*
  * Various schedule()-time debugging checks and statistics:
  */
 static inline void schedule_debug(struct task_struct *prev, bool preempt)
 {
-#ifdef CONFIG_SCHED_STACK_END_CHECK
-	if (task_stack_end_corrupted(prev))
-		panic("corrupted stack end detected inside scheduler\n");
+	if (static_branch_maybe(CONFIG_SCHED_STACK_END_CHECK,
+				&sched_stack_end_check)) {
+		if (task_stack_end_corrupted(prev))
+			panic("corrupted stack end detected inside scheduler\n");
 
-	if (scs_is_enabled() && task_scs_end_corrupted(prev))
-		panic("corrupted shadow stack detected inside scheduler\n");
-#endif
+		if (scs_is_enabled() && task_scs_end_corrupted(prev))
+			panic("corrupted shadow stack detected inside scheduler\n");
+	}
 
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 	if (!preempt && READ_ONCE(prev->__state) && prev->non_block_count) {
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
