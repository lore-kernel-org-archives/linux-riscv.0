Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678F8CD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 06:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ufbzqTBz2q5QEb7CAhvKUdp16y/5kwG4BaaBM07Tf4=; b=H0XN154iQgl7H9
	MYxDhDB6hqh3/rLI8QHFcmSGy9Wj7HJh1vu5ViQWqgR6qCUPL+UEo4fUBpjlbXT9ka+nldQGU7f6H
	XgIyzC5AwvFzBj5l6mlptzyyGagiz2z5xk+nuTFDywhqEGIzIrvNP1AZYmSwHlCxIZkFsBmy8N0en
	LsD7KP5Xf31pc48zeVE+FJNhwKyTOQpovJIuS5XYWWKMtHZKVyrJ/S/nr6pA2y+D6hRzi0CjiMl1S
	ncJ36XjSpzFKkBHlmM0ftjT/kOPYC1gq5k1DurTeBxrNEruL80+W22tThmLLStmnCgiiCPFkTGWLc
	4QgoCQsla+EFH+9SylZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4in-00000000WEW-2MJe;
	Tue, 09 Apr 2024 06:12:41 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iP-00000000VtJ-2pNR
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 06:12:23 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5d81b08d6f2so4275718a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 23:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643135; x=1713247935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjvFClKwy+BYaRIrausKimMcjFw1vT5hOqvdsQGe/rs=;
        b=UoDiUwjU/kU85Yn2p8BpwPIA2s+W+NAwgICU7ify7D3DeevbZThkqMpx0zy0DUPJ4E
         KaeHl6Mdyy36e37mH8Q40RjIOgqEaQH/9X1GaPd8BJdhe2eh9E4SUpxpH9v9kuAYEpKI
         sTIZ2MWRF0CpUGA//0LTib+D0vVJ5BEjI4O04NHyVuOAs0yHV4luZVIipDvQ12hQSzZm
         q/6+eGe7ZkJr6fqlyAHnEeQ+IXkdaLWVh3sUFuGhtfWwV/5ZqHdAZcXJaT+4Nep+aJkY
         tw4bVMkkA1gRSG1wxbt7h7v8p/kIi80/uem7mLOgnTbtPdDwuR+hPvdMDGohEQTIIp5D
         QglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643135; x=1713247935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjvFClKwy+BYaRIrausKimMcjFw1vT5hOqvdsQGe/rs=;
        b=H2LnCr5hZcmDS+CgiohEm4Z7vO/dPJOrG7WKcOrmveYjtOlRtW2Wu5RuoadbwYj0Ub
         1SUb83NhSzzPO1SBJIHkKbKd1Rl9JNxIqckpTENzdSyS5TEBAMC6CMATGT9b6pYsSD/G
         UN1vkew9ToUKErBw0UQxIJ0FIS99sGyPo8Y8fzig0JGH136EGlJkRgI1MacAuzrhRad9
         MQkBnd/LpNVTMQD8RgxDbw8oRgqWTNcnwTfeZGXzJkzkeD3EG7bTxbYG/qgI1aY5DLjR
         JBi0MrcxAHjY8pAsJF984woDZwafGsJobmuUMpTb0+gHZ8UPP2/y0Rc2I3zeiMyiCqHx
         7zag==
X-Gm-Message-State: AOJu0YySShrkK7Oofr1zolIKOPxr6AageuiobZHsEXDsKic+Ari+q4pw
	UMzvV+R77y3fJjOyya+goBTVn7kYweNGoMiD55+fC4fkB/R8pp6AXFd3sb9bdLtALMLGeGkt+Mk
	T
X-Google-Smtp-Source: AGHT+IEp8MmTA8LKx3GHOoxHTg1gStAegDNh1X4uTEZe5dJSLPSECO/RehYfY7RXVVoYxf41UDsgzg==
X-Received: by 2002:a17:902:ecd0:b0:1e3:dfdc:6972 with SMTP id a16-20020a170902ecd000b001e3dfdc6972mr9975664plh.9.1712643135531;
        Mon, 08 Apr 2024 23:12:15 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:15 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 09/12] scs: kernel shadow stack with hardware assistance
Date: Mon,  8 Apr 2024 23:10:40 -0700
Message-Id: <20240409061043.3269676-10-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_231217_956945_0ADAEF7E 
X-CRM114-Status: GOOD (  17.00  )
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

If shadow stack have memory protections from underlying cpu, use those
protections. RISCV uses PAGE_KERNEL_SHADOWSTACK to vmalloc such shadow
stack pages. Shadow stack pages on RISCV grows downwards like regular
stack. Clang based software shadow call stack grows low to high address.
Thus this patch addresses some of those needs due to opposite direction
of shadow stack. Furthermore, RISCV hw shadow stack can't be memset
because memset uses normal stores. Lastly to store magic word at base of
shadow stack, arch specific shadow stack store has to be performed.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/scs.h | 48 +++++++++++++++++++++++++++++++++------------
 kernel/scs.c        | 28 ++++++++++++++++++++++----
 2 files changed, 59 insertions(+), 17 deletions(-)

diff --git a/include/linux/scs.h b/include/linux/scs.h
index 4ab5bdc898cf..3a31433532d1 100644
--- a/include/linux/scs.h
+++ b/include/linux/scs.h
@@ -12,6 +12,7 @@
 #include <linux/poison.h>
 #include <linux/sched.h>
 #include <linux/sizes.h>
+#include <asm/scs.h>
 
 #ifdef CONFIG_SHADOW_CALL_STACK
 
@@ -31,6 +32,29 @@ void scs_init(void);
 int scs_prepare(struct task_struct *tsk, int node);
 void scs_release(struct task_struct *tsk);
 
+#ifdef CONFIG_DYNAMIC_SCS
+/* dynamic_scs_enabled set to true if RISCV dynamic SCS */
+#ifdef CONFIG_RISCV
+DECLARE_STATIC_KEY_TRUE(dynamic_scs_enabled);
+#else
+DECLARE_STATIC_KEY_FALSE(dynamic_scs_enabled);
+#endif
+#endif
+
+static inline bool scs_is_dynamic(void)
+{
+	if (!IS_ENABLED(CONFIG_DYNAMIC_SCS))
+		return false;
+	return static_branch_likely(&dynamic_scs_enabled);
+}
+
+static inline bool scs_is_enabled(void)
+{
+	if (!IS_ENABLED(CONFIG_DYNAMIC_SCS))
+		return true;
+	return scs_is_dynamic();
+}
+
 static inline void scs_task_reset(struct task_struct *tsk)
 {
 	/*
@@ -42,6 +66,9 @@ static inline void scs_task_reset(struct task_struct *tsk)
 
 static inline unsigned long *__scs_magic(void *s)
 {
+	if (scs_is_dynamic())
+		return (unsigned long *)(s);
+
 	return (unsigned long *)(s + SCS_SIZE) - 1;
 }
 
@@ -50,23 +77,18 @@ static inline bool task_scs_end_corrupted(struct task_struct *tsk)
 	unsigned long *magic = __scs_magic(task_scs(tsk));
 	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
 
-	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
-}
-
-DECLARE_STATIC_KEY_FALSE(dynamic_scs_enabled);
+	if (scs_is_dynamic())
+		sz = (task_scs(tsk) + SCS_SIZE) - task_scs_sp(tsk);
 
-static inline bool scs_is_dynamic(void)
-{
-	if (!IS_ENABLED(CONFIG_DYNAMIC_SCS))
-		return false;
-	return static_branch_likely(&dynamic_scs_enabled);
+	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
 }
 
-static inline bool scs_is_enabled(void)
+static inline void __scs_store_magic(unsigned long *s, unsigned long magic_val)
 {
-	if (!IS_ENABLED(CONFIG_DYNAMIC_SCS))
-		return true;
-	return scs_is_dynamic();
+	if (scs_is_dynamic())
+		arch_scs_store(s, magic_val);
+	else
+		*__scs_magic(s) = SCS_END_MAGIC;
 }
 
 #else /* CONFIG_SHADOW_CALL_STACK */
diff --git a/kernel/scs.c b/kernel/scs.c
index d7809affe740..e447483fa9f4 100644
--- a/kernel/scs.c
+++ b/kernel/scs.c
@@ -13,8 +13,13 @@
 #include <linux/vmstat.h>
 
 #ifdef CONFIG_DYNAMIC_SCS
+/* dynamic_scs_enabled set to true if RISCV dynamic SCS */
+#ifdef CONFIG_RISCV
+DEFINE_STATIC_KEY_TRUE(dynamic_scs_enabled);
+#else
 DEFINE_STATIC_KEY_FALSE(dynamic_scs_enabled);
 #endif
+#endif
 
 static void __scs_account(void *s, int account)
 {
@@ -32,19 +37,29 @@ static void *__scs_alloc(int node)
 {
 	int i;
 	void *s;
+	pgprot_t prot = PAGE_KERNEL;
+
+	if (scs_is_dynamic())
+		prot = PAGE_KERNEL_SHADOWSTACK;
 
 	for (i = 0; i < NR_CACHED_SCS; i++) {
 		s = this_cpu_xchg(scs_cache[i], NULL);
 		if (s) {
 			s = kasan_unpoison_vmalloc(s, SCS_SIZE,
 						   KASAN_VMALLOC_PROT_NORMAL);
-			memset(s, 0, SCS_SIZE);
+/*
+ * If either of them undefined, its safe to memset. Else memset is not
+ * possible. memset constitutes stores and stores to shadow stack memory
+ * are disallowed and will fault.
+ */
+			if (!scs_is_dynamic())
+				memset(s, 0, SCS_SIZE);
 			goto out;
 		}
 	}
 
 	s = __vmalloc_node_range(SCS_SIZE, 1, VMALLOC_START, VMALLOC_END,
-				    GFP_SCS, PAGE_KERNEL, 0, node,
+				    GFP_SCS, prot, 0, node,
 				    __builtin_return_address(0));
 
 out:
@@ -59,7 +74,7 @@ void *scs_alloc(int node)
 	if (!s)
 		return NULL;
 
-	*__scs_magic(s) = SCS_END_MAGIC;
+	__scs_store_magic(__scs_magic(s), SCS_END_MAGIC);
 
 	/*
 	 * Poison the allocation to catch unintentional accesses to
@@ -122,7 +137,12 @@ int scs_prepare(struct task_struct *tsk, int node)
 	if (!s)
 		return -ENOMEM;
 
-	task_scs(tsk) = task_scs_sp(tsk) = s;
+	task_scs(tsk) = s;
+	if (scs_is_dynamic())
+		task_scs_sp(tsk) = s + SCS_SIZE;
+	else
+		task_scs_sp(tsk) = s;
+
 	return 0;
 }
 
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
