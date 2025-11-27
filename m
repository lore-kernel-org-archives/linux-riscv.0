Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AABCFD2F6
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 12:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8w9Ffecrnz3fqbOKbdauz4gvqPesaTHw4/EGkUiaQSs=; b=TPcqNN2fH8HCfQ
	C3EVWaSzqZJ2Wr4H80osC6LBmk/KH4YKYNQFDKWqAq1IMHgHK6FmmQ3nfRn+e6yN8jousWPKF9qJm
	84gtYb6G2ckfUSICigy+gtJaTk9TTdPrRDYuRYJ5Iu6rdbFkqVL91Si7TxWXAKIu4UPcoBnZqCw0T
	kvHgEgt3H8KK8f04mIwAJQDP+b/HDYxtj4koN20TzpI/KV24LG+kfd6c4ormILapzg4G80Y+G6qCC
	QhiEK+jdreOdv4lwwxNdlhJJyiecr+nuDyxKNyDl2zDuIAMvTSgGstdF4w/NulhGEDs5gDi+sGI4C
	nSx+9mLJO0N7dXOvE3PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObVK-0000000GbQQ-3AHB;
	Thu, 27 Nov 2025 12:53:46 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObVI-0000000GbOC-1hdQ
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 12:53:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29812589890so10278915ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 04:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764248024; x=1764852824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yk19cubzYI59vS2m7ARmuI6dwPXbjagJNzaP0UWxsjY=;
        b=aEcPtIwZIkZxDRBT4dLbGiadEtXMC+p9ai77PQ6xti4N9yF8Q41PPn1NOfvhxFjVEd
         b70F+0mf6vfWgubzs0xn9ZF6sD4zllrZ2zWYYy3Kd5xemJcYbWhd0G55Oc7BV4T7j9tD
         G63q2QcVTSpNKw5KplVTwPATChTZ7XhGPR46nBQsTFwj1JW08qMOsEnPDkdsVZRKea/p
         pBPRPho2+8+6GTVI2HDGrWgC/q96fiiiRpxquppN9lZibjl+vUleAHtA4ujvgF/3IWPH
         KVPy4NPu7uEBwbzPvIpNkf5Et+4ZZUzzapvtRVZPHVklCSA7+BjoLkYvHBBaJ+ZNFkkB
         m8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764248024; x=1764852824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yk19cubzYI59vS2m7ARmuI6dwPXbjagJNzaP0UWxsjY=;
        b=eCBJw/pvIJRX88xgkwjz2vTGp6JVcj6CvKRmy/Cayn08OaAWp1+swgjbQKTX6sRqwn
         HDOoBfaSQYrbbykZCOYgAfAG5bHX8r1yk7DVelYaEdTbl2jyoGzFAIYhkpV+C8tYQwc/
         zFUpW8uE2sXv/UaALA/SVBLwOeh5Sty6I/RT/nl8EEvLJ0NLI8ITu/U7QPNGPbdNntMc
         kriPXJZt0cYaunU0e4PF8BIXKJzGwOvkOo92vZjKncV67ZxKF8Z+rdO96Xk3k8+wCEAb
         9kHfga32VDUzgbleSF2Qu/RzgkXxQ5na4yO9iWU86lNJ+L6lQEIdM2hx9HxiYcDZbfNN
         C9SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFrv79EgevoEtdlpB6rFnPwDa1DFIDBWPxx9FZ9kuepo30Iz3imHGOF4ABP6zLsgxMj9jUK0f4lZr6KQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQyJbBERMWMDoCN//go4TrEl9SWp2NNJEm+tuq4r1gA6SfB6wo
	UfQZsxNlFeA57bN+uPV6gEtv/LEbT38TSgMcQ9op7IEVbRKUPJtz8iL7oqej0MHzNLp9K6ueGlc
	Kp0iolXY=
X-Gm-Gg: ASbGncuvnRtPKGUTh/CiLHHA5klzQtfNT84oxFwrxIPw3ZzoZJ5Myg1mzw2WOpxrA4K
	DBVrF5C6S/8EFfx6ZRCV86l8UzUGTvoPpojJQZetXj9zfSSebZhpDLgXt8l3wU4Nc0dZa4IMIe1
	HSc71w+tXxWaDVur8n3OrLE84zporZOJBZeHxGBFEmY6zwil46Sq9AAybm+hS5Vr4JXaPSFgpg+
	nFq10pTLmWzzKBHYY4d+/uf6IRgYdojdk7pbu4V0MM5mKzOhRbjXhrF1x7uxp0M821Sco6hQ2M4
	CBTJA2NfRRRfd2jMLshE5XRke6HnJN1fiuWHJbHJFbQqfJGh0YT5And8KF3qonyjbSGYYgrbgX2
	zSJT5MpK4A2rQ4FViXBCf6kHde39VB2A7/64gBC0xuBO/sz2PxKUMluAwZleBoBMP09myO6Bl3W
	Q/O1RKhPE54S0dy56xPe/jXMhAQ2/gPoi8oGDZL3IpziM5YbyN00DnTrM=
X-Google-Smtp-Source: AGHT+IFWj/Ge/LlTmUk4BGvK2jv7sYmbYypwkakcaLNVvSYRcxAzMelD2Tv37gWsl3Gu0g8hT2LecA==
X-Received: by 2002:a17:903:98d:b0:297:fec4:1557 with SMTP id d9443c01a7336-29b6bfaf6c0mr239034795ad.60.1764248023704;
        Thu, 27 Nov 2025 04:53:43 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm17771255ad.41.2025.11.27.04.53.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 04:53:43 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	arnd@arndb.de,
	kees@kernel.org,
	tglx@linutronix.de,
	viresh.kumar@linaro.org,
	boqun.feng@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	cleger@rivosinc.com,
	atishp@rivosinc.com,
	ajones@ventanamicro.com
Subject: [PATCH v3 3/8] smp: move num_other_online_cpus() into smp.h
Date: Thu, 27 Nov 2025 20:53:00 +0800
Message-Id: <20251127125305.89961-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251127125305.89961-1-cuiyunhui@bytedance.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_045344_454723_DE517A21 
X-CRM114-Status: UNSURE (   9.53  )
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

Remove duplicate definitions from arm64/riscv, add unified
implementation in smp.h.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/arm64/kernel/smp.c | 11 -----------
 arch/riscv/kernel/smp.c | 11 -----------
 include/linux/smp.h     | 11 +++++++++++
 3 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 68cea3a4a35ca..2d1e7839dc9b0 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -1171,17 +1171,6 @@ void tick_broadcast(const struct cpumask *mask)
 }
 #endif
 
-/*
- * The number of CPUs online, not counting this CPU (which may not be
- * fully online and so not counted in num_online_cpus()).
- */
-static inline unsigned int num_other_online_cpus(void)
-{
-	unsigned int this_cpu_online = cpu_online(smp_processor_id());
-
-	return num_online_cpus() - this_cpu_online;
-}
-
 void smp_send_stop(void)
 {
 	static unsigned long stop_in_progress;
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 9dbcb9a06a96d..669325e68a21a 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -272,17 +272,6 @@ void smp_send_stop(void)
 }
 
 #ifdef CONFIG_KEXEC_CORE
-/*
- * The number of CPUs online, not counting this CPU (which may not be
- * fully online and so not counted in num_online_cpus()).
- */
-static inline unsigned int num_other_online_cpus(void)
-{
-	unsigned int this_cpu_online = cpu_online(smp_processor_id());
-
-	return num_online_cpus() - this_cpu_online;
-}
-
 void crash_smp_send_stop(void)
 {
 	static int cpus_stopped;
diff --git a/include/linux/smp.h b/include/linux/smp.h
index 18e9c918325e5..5300c5c14232b 100644
--- a/include/linux/smp.h
+++ b/include/linux/smp.h
@@ -275,6 +275,17 @@ static inline int get_boot_cpu_id(void)
 #define get_cpu()		({ preempt_disable(); __smp_processor_id(); })
 #define put_cpu()		preempt_enable()
 
+/*
+ * The number of CPUs online, not counting this CPU (which may not be
+ * fully online and so not counted in num_online_cpus()).
+ */
+static inline unsigned int num_other_online_cpus(void)
+{
+	unsigned int this_cpu_online = cpu_online(smp_processor_id());
+
+	return num_online_cpus() - this_cpu_online;
+}
+
 /*
  * Callback to arch code if there's nosmp or maxcpus=0 on the
  * boot command line:
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
