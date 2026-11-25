Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C05C606A334
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 06:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hBmloEv9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ui3q4Thb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=tbGk3wOECBfmpFEnOvlhg9P+v7WIfshemtA3+W1tmWw=; b=hBmloEv9YA5abbDVx50FkzTpZi
	/PIFJtiAlrYZF1WJki7xzI8GqB/pfCphbThuZpYWTLfGkN5ukav9Ap4Oy9cQCuloW3ffr6IbiCuKP
	U6G+zmxa5Tp6yh5G+rgBX0qNLBdwsJQ1PcLhAauZcHPz8cNzzP1p+N6KbhEttaF0LGjvM/nh3zh3q
	HBDj+mLpwL4+5DRHj3tVMYVN0HWmVt2+c47RaEtbRMJe4/bWT6ZWst/wecfBa4qqNhw189VeGL4x+
	NmMD7hAlsNVWWdzZg2SQfKMSZbe164+pD9We6Z3h6oD5HgunukZRkKMg4u3An9XDkC4cJdGf9zEQN
	UtXnIZsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Ja-00000008Zb3-1F87;
	Wed, 25 Nov 2026 06:17:10 +0000
Received: from mail-dy1-f197.google.com ([74.125.82.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Il-00000008YfY-2F2o
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 06:16:28 +0000
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso7370457eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 22:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587377; x=1796192177; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09MAmcu0nJvDv2rEHeASXKSxzXy8pllt4XI/+xpi/1s=;
        b=Ui3q4ThbxfvphGYCGfeJmlgoCFggiQBTG8nbKggXVIDhPFCE5p0+qZYL2xB7y0CC1Y
         CqXhVlaQl+DHYBfLoXEfXLDuuAzUcgOPwWwICMUnSDpxn66Ev2xALvDufyxzgNWR9abe
         i3ajQXeJg5XAMKXFWN04Q6fvWd4mdqP2olmoV1mL4v4d4r2xSff82tjMIK0xVCPYd4h0
         6Im7Zpkt7uUc+CLXM7LEIFmF/sxxtYStutFhuON36rrrie5suvo+4fXV464x9++8adwq
         WlpdMD7wGud/KEYxKHEUDaI5R4xAZk5C/FrEZLEyjzSONOnkNQf6z5fo8rGMigxeIoSv
         6QPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587377; x=1796192177;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09MAmcu0nJvDv2rEHeASXKSxzXy8pllt4XI/+xpi/1s=;
        b=082q1wvSVzTcHg1s/+yvQV8yfLI0qYlyLAB+NiWrZifLFaUKxAmiRSUYNQShSQdlAN
         mEeNX8SQpWXse2W+PwHxFrT2pd8D8yH4KB+yiLDE1AwW75MXn9CKEWUsVIyX9xCvM9If
         2X9w3glH4EUtAWi8lG/XMI4yH6ngj32pvzr1DAXjN+t9lm/OQye4zeC84mUMMWsrdow9
         PObaS68URDA1Y9vJX3NEboghhcqCZDWbrCKpFYYueJt9GNuMM1H08UQ97to/yt3aeNTF
         /yzrCaYXSDVm3VU2X7KZQJ6Ro/Bs4FsbcnywWfH+4a0esNUj0dil4ClbESfNa3s7efKR
         kXjQ==
X-Forwarded-Encrypted: i=1; AL+hErGFTUtZEygV505Rz0P7MG9IZ7Z8Wdlx7ZsIiAhGAhcohj/D5y3eJuFkZ8EOwysP2hLFcPwaX7qcxjbyBQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8Wj29Q2rAgg/JuoCzNeHCopzABW8+MLQwu70oExxmkNSLbJB76
	sbacDSf0/XNPVcOCyCVmdX2iCiYJzCp3xN8uR+cjkVLaq3uX09PluMYlt73de7HGTI/Xql/pzfj
	6i/PRfbzs2A==
X-Received: from dyba9.prod.google.com ([2002:a05:693c:63c9:b0:386:a06c:3241])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c72d:b0:369:f9c4:1fda
 with SMTP id 5a478bee46e88-38570845628mr15750428eec.27.1795587377097; Tue, 24
 Nov 2026 22:16:17 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:03 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-11-irogers@google.com>
Subject: [RFC PATCH v2 10/30] tracing: Skip internal ftrace frames under CONFIG_UNWINDER_DWARF_CFI
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_221619_605946_DB1573F5 
X-CRM114-Status: GOOD (  11.13  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Calibrate ftrace internal stack-trace skip counts under
CONFIG_UNWINDER_DWARF_CFI alongside CONFIG_UNWINDER_ORC so stack traces
captured from tracepoints and function tracers omit internal ftrace
wrapper frames consistently.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 kernel/trace/trace.c                | 4 ++--
 kernel/trace/trace_events_trigger.c | 2 +-
 kernel/trace/trace_functions.c      | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 65b9d67647e5..6d36c790c2b0 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -2156,7 +2156,7 @@ void __ftrace_trace_stack(struct trace_array *tr,
 	 * Add one, for this function and the call to save_stack_trace()
 	 * If regs is set, then these functions will not be in the way.
 	 */
-#ifndef CONFIG_UNWINDER_ORC
+#if !defined(CONFIG_UNWINDER_ORC) && !defined(CONFIG_UNWINDER_DWARF_CFI)
 	if (!regs)
 		skip++;
 #endif
@@ -2258,7 +2258,7 @@ void trace_dump_stack(int skip)
 	if (tracing_disabled || tracing_selftest_running)
 		return;
 
-#ifndef CONFIG_UNWINDER_ORC
+#if !defined(CONFIG_UNWINDER_ORC) && !defined(CONFIG_UNWINDER_DWARF_CFI)
 	/* Skip 1 to skip this function. */
 	skip++;
 #endif
diff --git a/kernel/trace/trace_events_trigger.c b/kernel/trace/trace_events_trigger.c
index a2487ad7fef8..c79df5b526e5 100644
--- a/kernel/trace/trace_events_trigger.c
+++ b/kernel/trace/trace_events_trigger.c
@@ -1597,7 +1597,7 @@ static __init int register_trigger_snapshot_cmd(void) { return 0; }
 #endif /* CONFIG_TRACER_SNAPSHOT */
 
 #ifdef CONFIG_STACKTRACE
-#ifdef CONFIG_UNWINDER_ORC
+#if defined(CONFIG_UNWINDER_ORC) || defined(CONFIG_UNWINDER_DWARF_CFI)
 /* Skip 2:
  *   event_triggers_post_call()
  *   trace_event_raw_event_xxx()
diff --git a/kernel/trace/trace_functions.c b/kernel/trace/trace_functions.c
index acaba990aaaa..d601fdedceaa 100644
--- a/kernel/trace/trace_functions.c
+++ b/kernel/trace/trace_functions.c
@@ -251,7 +251,7 @@ function_args_trace_call(unsigned long ip, unsigned long parent_ip,
 	ftrace_test_recursion_unlock(bit);
 }
 
-#ifdef CONFIG_UNWINDER_ORC
+#if defined(CONFIG_UNWINDER_ORC) || defined(CONFIG_UNWINDER_DWARF_CFI)
 /*
  * Skip 2:
  *
@@ -602,7 +602,7 @@ ftrace_traceoff(unsigned long ip, unsigned long parent_ip,
 	tracer_tracing_off(tr);
 }
 
-#ifdef CONFIG_UNWINDER_ORC
+#if defined(CONFIG_UNWINDER_ORC) || defined(CONFIG_UNWINDER_DWARF_CFI)
 /*
  * Skip 3:
  *
-- 
2.56.1.831.g720f3f5937-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
