Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0182A60A2608
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 08:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sj8sADUG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dtaQkDEs;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=LMjOxSD6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Subject:From:
	References:In-Reply-To:Message-ID:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=O+L4cG3lkxLAslx5Q4sLm6/5pTOGo9JMLsYFRyexhe4=; b=Sj8sADUGYvKyj7x5zasW1QPEEw
	HuanHvkgkY/Yza2RVDdr3Lbam8TY3rk9hBq/xoI2oDMG2YSnE+CM5EPx6I2zq8kNM2C6PB17LB4Kn
	JAGSvyxfKte+iLvQfW/KsAdMlNVtcv1DIPq6qSW5DY9g+RGBaHAlxrTOwkdWCAKX54sziXw1rjWry
	TTLdAodxMjdn5FXMZU+lS1gSPZGxnMPPKVlrXETlxjhKwfYeWmL4JA/hZlNC6KNC/rYIPvsr8It+2
	XtQ8B7uw5hZEmNKq6lbCVoNHFvpJjQ61pfBou+vBHHDaUJruip5Hh2hCvElpiSD26kmTn86D7ToB4
	jR1kEKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmn5-0000000C5Um-1Wax;
	Fri, 13 Nov 2026 08:37:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmp-0000000C5LZ-2VDI
	for linux-riscv@bombadil.infradead.org;
	Fri, 13 Nov 2026 08:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Cc:To:
	Subject:From:References:In-Reply-To:Message-ID:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gEzmF9s3oRqFQx1peFT0I39gTTaUDMkIiUegklzJqx8=; b=dtaQkDEsJqX6bYM2pkcFy0JAGU
	2f9KDswUrz0UR337QO79jXPGwG/h5UtTJyF0u7JI/UTRFukMD/GSxEG/G82l44R9/npUbl1bpVtqQ
	foT7wSb9y9Ei7sr9RKeElYRlI/1N+9Mz03/t3zIJWE3jceLQSGOIf3yoyTcJgSLA8lxa80OEjAFhZ
	Ov9lXxDn+VXMqvGHMrf75dP8t35sV0Z+9AC7TU6dcimOvPC/OBWeA+Dov3fDjNbZbbkOvqqvM6/tk
	hUrRERL1QO9eebRhIzJP1K0hXcNfGGB64pUtN2H0qep6G77aeE4Jipp4UgR4GNAlHwVJYLI6EO/wN
	ad/W42fg==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmml-0000000B4mN-1tEF
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 08:37:30 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3b17cf2fa0aso1494881a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 00:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559045; x=1795163845; darn=lists.infradead.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gEzmF9s3oRqFQx1peFT0I39gTTaUDMkIiUegklzJqx8=;
        b=LMjOxSD6IKyNqDY+ZZzX0kmHm3dkIpP0kyTysTFWejoSJvMSqt1nfVvNiwf4XCSuV4
         S6h3/G7YyPF2C1T/mfbbXvGXnTLV0hdPK7Py9rdH1CHezs9hniUpU4lPacNAezjL5MBg
         UtEzIx9HzNcL4Y376wv2czOBRIkljqX/w911c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559045; x=1795163845;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEzmF9s3oRqFQx1peFT0I39gTTaUDMkIiUegklzJqx8=;
        b=rd/ugvylTG9/X7TRLSXF5RGPA2bKDoYMYE2QUMbjw8VyHohshVwstlcjSnNHSyfiZo
         9fWvg9sgCxsIsr6d/+jquWb64fuQVh3xuWJpcpGpL3TOXi/XwaBOUcWd7f1teK7Ep45Z
         lFiWodAXeTKk+8XPWXaNICH5AvLcP6gOFFV0VQtHgM26wz6SrosnKEcNX/JCh9q4szeR
         WZsIb4oDK4rIHW0KYYFN6jEGFxRBMe/gDtTLbLajxypYdl+4EsqwxDwYBZvymgFn5mit
         gDN5oxSEXLiPIyYSLpbNxlsdm51F7dMYnJbdcP/FHdCujRSFJgthMVoK+urb+NSUvLM7
         5S9A==
X-Forwarded-Encrypted: i=1; AL+hErH0+997M9886izggJ2DD+JP2mPmgP9VxeloJIZtCm0EJ7XPMSsBGQg3kzAXf3tEn3faiLpj8db9p8c96A==@lists.infradead.org
X-Gm-Message-State: APuU4Z9RrsYhgm2L1ZZzz9OpYmbaiC3bRZbVO1dIqfMkE29F7qBoUIQO
	FNAUn46c+jk5Y7DQpiPel03O6CA6CQwT/Hp7nuCeWXwdhaWEfBYxOEUp9dhI+DPB5R0=
X-Gm-Gg: AYBFou0kp82+QMOFtVg2rE2/PXX+s/6k2MkIs7jZ033XELVqJj6b5qgeDZc/AvBbfKC
	YsXDP3u63Qq2UEp4mHKAD7XJJMh9FgoxAI3KZMDcVU99ebz3UB0k7L+T9GYQkOTa+lk/NxxqYR6
	zNT3yQxRe6vT8UAFp7GuUBiX4It2IR4q3uerF08MpFBuqIsXW03Vj1T1ClV23alTzPl6N9xptR7
	jTuquLZelKWA6hzd/FewkpXfHvyGiUZVN63+M/tKIfUq+DSZSqFjsca/DUFJQ53DRZ9pA/wi8DJ
	C9pIxXNhkhnSLexBhvDgrlymYCSFWGNmeQi/tNbennmf897YkqT+lw19TROURMoCw1Zh1K6udCw
	vD3LT7EqVzvR7KXWPbThh4CpGBgVUp0LTCglipy3tZEv3vpD6DBNO5PK+eIYV6B9d256SdKKqEE
	a17PmEniIEWAwKYptga0fZqUHrnbJVkgh83hgnuIuBrIeh0Kf8UTtm5js5pOBPv2uNIPpuS986U
	4CCE5tCeORLDqaf5AyZJJXwWEAUjyUffUEiVCJgDbgJZ9kabk9afbHlRkjp3ghT/xNOalE3eDDa
	tAIcyR1wPXoPmSZsWtXdvQ6VKUGSaGvEFF8FBumpTF/6ey1FGefIZ7Cg6gptVsq7VwN9zGrNu2p
	jADaXLuQdduJ2REsw70G0dWj5ovQ+ev3MaEhTGcWthWsSGFZiaJYhpGSSU2uVOX2R0EIhTt0/C7
	XBKZzEEgeaGz65OHCRCffiNaQr0e9BS5wJbvSKwJR1GGkxENUxyQzzZ+jHOFo=
X-Received: by 2002:a17:90b:4d0b:b0:3b0:b03b:699f with SMTP id 98e67ed59e1d1-3b1b089e039mr1673991a91.1.1794559044956;
        Fri, 13 Nov 2026 00:37:24 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm1085683a91.4.2026.11.13.00.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:23 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:21 -0800
Message-ID: <95e5cba24df5d646f1baff74016a1a224f92aa13.1794554867.git.chris@chrisdown.name>
In-Reply-To: <cover.1794554867.git.chris@chrisdown.name>
References: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 2/3] sched/core: Add sched_stack_end_check= boot parameter
To: Peter Zijlstra <peterz@infradead.org>,
    Ingo Molnar <mingo@redhat.com>,
    Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
    Vincent Guittot <vincent.guittot@linaro.org>,
    Dietmar Eggemann <dietmar.eggemann@arm.com>,
    Steven Rostedt <rostedt@goodmis.org>,
    Ben Segall <bsegall@google.com>,
    Mel Gorman <mgorman@suse.de>,
    Valentin Schneider <vschneid@redhat.com>,
    K Prateek Nayak <kprateek.nayak@amd.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Will Deacon <will@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Arnd Bergmann <arnd@arndb.de>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Paul Walmsley <pjw@kernel.org>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Albert Ou <aou@eecs.berkeley.edu>,
    Alexandre Ghiti <alex@ghiti.fr>,
    linux-arm-kernel@lists.infradead.org,
    linux-riscv@lists.infradead.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_083727_490805_A567706A 
X-CRM114-Status: GOOD (  20.52  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Make this configurable at boot time with sched_stack_end_check=, and
keep the Kconfig option as its default. In benchmarking sched pipe and
sched messaging performance is unaffected.

The other callers of task_stack_end_corrupted() are left as they are.
They have never depended on CONFIG_SCHED_STACK_END_CHECK, and they only
look at the magic once an oops or a might_sleep() report is already
being printed, or when the stack tracer records a new maximum.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  8 +++++
 kernel/sched/core.c                           | 33 +++++++++++++++----
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..c106f744b5a4 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6825,6 +6825,14 @@ Kernel parameters
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
index 175b52a7ea79..9e5b3c62c697 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6144,18 +6144,39 @@ static noinline void __schedule_bug(struct task_struct *prev)
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
+		return 1;
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
 
-	if (task_scs_end_corrupted(prev))
-		panic("corrupted shadow stack detected inside scheduler\n");
-#endif
+		if (task_scs_end_corrupted(prev))
+			panic("corrupted shadow stack detected inside scheduler\n");
+	}
 
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 	if (!preempt && READ_ONCE(prev->__state) && prev->non_block_count) {
-- 
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
