Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CACBCD1288
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 04:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IQF6YmbbAoXAJTl+T3kwinwRQI7N+/hD25WXmII0bs=; b=xnLTo6wcXP9FOu
	hjkzBwZcNDQsoMu1W8QFBb8Tae2g38vEyDup/znI02yTkPSEVSQE7q5lW10zeVBH2SGRGj2xtOP7J
	TLTcjcr2n/zKYwuqcfIGHWsapahU61pquQZ44/HtLW0gy5zpMgtd9vbCyspUcXTuTm/OlrRNCZ6Qf
	TcHKwdVFsJyUxV+BtyIRuKFdYYL4nR1ygG56ftCJi7HGK0lsbyb1g7X6bT0WH6d9rpDaLTyjALuoo
	BbqIv3XfA4bU7/s8jYqatuiEZ7cFdDfncDEzc7lywdw9L0HvYJmHe4MHfL0xVBbRbY4vrj7QJRq/E
	EgGJK2bMuVkyLEFUUp5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48q-0000000GnsW-1gCN;
	Fri, 29 Mar 2024 04:47:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48W-0000000Gnic-02Ko
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 04:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RhhwcNmyZsW8Rn+io2bmrU6vZaKqFl7C8RSpnBjD5D4=; b=MhLXiEqkm/ZZ3oyXwvB2RV+XRW
	Q5JV+bnCnUoVhhnEAnjLDylAeatrMnNi911Z2nllLsw4OKOME8s7XR1LsNxmVNxav4eam3rOMojRP
	mYlK0We6gfzDyUnzbBgnly0jv/hZMJduLaHppn7tJlbwMJ6oFo7spAcwjmc/4HFAvIUA5YHa1qiDD
	vebvAj6O2gJs2RAfLwvfwCTO6TQCBoJV6pP+BHVt3B+fWX9dgHh1LaALq4gCfJ4EdGWbtSvloL1dA
	wCLiD6gyRpL9gYvCIMLU6FUv3jZX1RQA7RBULgPWGNGfVXNw64sNRetVfoXIgUlvv7ixndo2hZ8PS
	MDz/gofg==;
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48S-00000001MUA-1j6s
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:46:38 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3c38eced701so1018123b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687594; x=1712292394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhhwcNmyZsW8Rn+io2bmrU6vZaKqFl7C8RSpnBjD5D4=;
        b=my0uid5RK/1P8R1r2S0zPkiL1ZPMUN4brDJIURAv+WTF9X52wkEgTWOPRk4SJxy5iR
         KvOwvUaNaLpLtisKQzEEmlkyDgzPDqXdTStxPRW+ch5jriumU0HV0AHss2sk+MBOT1tj
         91DcAOJpYhLLsO4sq9eienJ7/iM0M88CVpdXFBcehoQ6UtVVK+8nmRlMrZzrvjxAriSc
         PVSirA3Q0DNszyGxFAwpXSumfvZx4R3J07D7jPEOUURGooVxE4eIxo24SMipEL7FrNzc
         4w+bDKgOzrDaX/j+7UiwC3QFHXQXKWEoArNyzJ+1ikToOYRlfC6PJdLrayfeUkK3oakz
         97Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687594; x=1712292394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RhhwcNmyZsW8Rn+io2bmrU6vZaKqFl7C8RSpnBjD5D4=;
        b=F/xLoYvmq4KB1TQ0IiunsTJ/+xvWM0b0EitfK8jsxhs6w08Ei46KGvoFs3Rm/7hXbq
         7WUmPscst90Wa4xeDLNCYWgz9i61ZiPmIWvnZ169R2ZzWcggAqsU5gkZ3QsF/hEmcTiA
         bDRsRmIpgNWjtQ8M7KZKFyRpeSOEaok3ws+nOhMllBTklUhdZ46Y4U8jLLQa0R2frG7n
         TKy9VO1KumPRAL2ZtRUNwB8cOmVnT7sY8ZJqvxol8+TN9SktsEZkPL4byaYtXvHt19Xr
         F2CqAuDCScKSiGfs9xhZdf7459ytT4SPVzYpM5ccgimJOC/p/b5TDR6PZGuWI5EXVBar
         ZQfg==
X-Forwarded-Encrypted: i=1; AJvYcCXA7BittNyupk35M1SYhWQPgN9q00uTpuOYHYSoMoOqDmdn/SyIdrW5/G6Q+pFwuEB1v+SHV4GcijH4w+RZPJXY3/9bl4wGB7BTSTLlbVx5
X-Gm-Message-State: AOJu0YybesGLLqnM5pqjfSs/BFl2enYac3PnFkfGRJCbF/5lV5Rhr7uj
	4cGzB1Lzs0qoRONsbjvXrv5E6Np8LEmT8j46sfavban0N2cFzBxzJLvqHmtr1CY=
X-Google-Smtp-Source: AGHT+IHzCsJ/EULMJ2X0/zuKDOZ5gM2wFJf32HTwGAn7YaJ1oTsNWG5xRVVZi9OrlqC1Skwk/hVE2A==
X-Received: by 2002:a05:6808:2d4:b0:3c3:d6d7:e57e with SMTP id a20-20020a05680802d400b003c3d6d7e57emr1229439oid.15.1711687594157;
        Thu, 28 Mar 2024 21:46:34 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:33 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v2 15/27] prctl: arch-agnostic prctl for shadow stack
Date: Thu, 28 Mar 2024 21:44:47 -0700
Message-Id: <20240329044459.3990638-16-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_044636_818626_7897AD41 
X-CRM114-Status: GOOD (  16.82  )
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

From: Mark Brown <broonie@kernel.org>

Three architectures (x86, aarch64, riscv) have announced support for
shadow stacks with fairly similar functionality.  While x86 is using
arch_prctl() to control the functionality neither arm64 nor riscv uses
that interface so this patch adds arch-agnostic prctl() support to
get and set status of shadow stacks and lock the current configuation to
prevent further changes, with support for turning on and off individual
subfeatures so applications can limit their exposure to features that
they do not need.  The features are:

  - PR_SHADOW_STACK_ENABLE: Tracking and enforcement of shadow stacks,
    including allocation of a shadow stack if one is not already
    allocated.
  - PR_SHADOW_STACK_WRITE: Writes to specific addresses in the shadow
    stack.
  - PR_SHADOW_STACK_PUSH: Push additional values onto the shadow stack.
  - PR_SHADOW_STACK_DISABLE: Allow to disable shadow stack.
    Note once locked, disable must fail.

These features are expected to be inherited by new threads and cleared
on exec(), unknown features should be rejected for enable but accepted
for locking (in order to allow for future proofing).

This is based on a patch originally written by Deepak Gupta but later
modified by Mark Brown for arm's GCS patch series.

Signed-off-by: Mark Brown <broonie@kernel.org>
Co-developed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h         |  3 +++
 include/uapi/linux/prctl.h | 22 ++++++++++++++++++++++
 kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 9e6a4fbfccac..5ea49b9232fe 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4209,5 +4209,8 @@ static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
 
 	return range_contains_unaccepted_memory(paddr, paddr + PAGE_SIZE);
 }
+int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status);
+int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status);
+int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status);
 
 #endif /* _LINUX_MM_H */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 370ed14b1ae0..3c66ed8f46d8 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -306,4 +306,26 @@ struct prctl_mm_map {
 # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
 # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
 
+/*
+ * Get the current shadow stack configuration for the current thread,
+ * this will be the value configured via PR_SET_SHADOW_STACK_STATUS.
+ */
+#define PR_GET_SHADOW_STACK_STATUS      71
+
+/*
+ * Set the current shadow stack configuration.  Enabling the shadow
+ * stack will cause a shadow stack to be allocated for the thread.
+ */
+#define PR_SET_SHADOW_STACK_STATUS      72
+# define PR_SHADOW_STACK_ENABLE         (1UL << 0)
+# define PR_SHADOW_STACK_WRITE		(1UL << 1)
+# define PR_SHADOW_STACK_PUSH		(1UL << 2)
+
+/*
+ * Prevent further changes to the specified shadow stack
+ * configuration.  All bits may be locked via this call, including
+ * undefined bits.
+ */
+#define PR_LOCK_SHADOW_STACK_STATUS      73
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index f8e543f1e38a..242e9f147791 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2315,6 +2315,21 @@ int __weak arch_prctl_spec_ctrl_set(struct task_struct *t, unsigned long which,
 	return -EINVAL;
 }
 
+int __weak arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	return -EINVAL;
+}
+
 #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
 
 #ifdef CONFIG_ANON_VMA_NAME
@@ -2757,6 +2772,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_RISCV_V_GET_CONTROL:
 		error = RISCV_V_GET_CONTROL();
 		break;
+	case PR_GET_SHADOW_STACK_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_get_shadow_stack_status(me, (unsigned long __user *) arg2);
+		break;
+	case PR_SET_SHADOW_STACK_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_set_shadow_stack_status(me, arg2);
+		break;
+	case PR_LOCK_SHADOW_STACK_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_lock_shadow_stack_status(me, arg2);
+		break;
 	default:
 		error = -EINVAL;
 		break;
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
