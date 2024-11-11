Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BAFD3ABF8
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 21:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rzj68IynnJSIoBorCC5Mg0sxR9WmrTDAiA5jNQ31d4s=; b=k1oaU5E9ErMtYe
	sKCgchfbywKpHckghSJJK8Z+KLdurZzcnDu5W4q4DZ/HhrQYMJ6iJ5IUXlvhPYLkfbT9CmnNe1Bx1
	j+I0o2pTHX25QEe0OKOoS0RwxhiTGr4g4pYMIjcjr2BkOWClMN0y/bGydiEF+wZLICTwKvUW8scNg
	m4+QWCRYDqBhCu2VI3EhFj6Lx8kHX6a0B61LG69Hv0U1wtqSwfFCCqX911OjkfUKebfLMuNOeHkWv
	+WXDudooBSV+LAHlgSgJcMLeWB/fFHEpgSctXc0cACoRYku+1MmzVgeJfjhA0NFDC7KqLiBiYMe/1
	8uWNYhqKQ+E2TneISXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbby-00000001Iz9-22Pv;
	Mon, 11 Nov 2024 21:06:14 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbQc-00000001Fza-3cWN
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 20:54:32 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e2c6bc4840so3928119a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 12:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731358470; x=1731963270; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zttDuuB8Jg0F5HVXQ122SU8MUC6GU3do+W5lCjsZcck=;
        b=hQEzbBN2BW4doCvmz8CyUb/GruonkhMsNby5SEeFCQtlj5sLBTK8m+RdRCJIB7ruDH
         9WbD9ZwXVeQ50X6BySNR66WhUUqHicR/U9FGQxtCzW9dZytxXgk2QQxJjfZlpzMsNKl2
         pYXNS2ZVbtVStFulKKJ8Efp4/HyGOB5+JEHhRGI6TPTYU2BWfV3FcpKU2Uk2K5oyQaXH
         BNk71QD8KDZRyGI1RW+B9nK5agUo7XrtdaCXJne42ohhGSeDaU6TVWlHIUKPnSmhxv00
         +f8eHHHGsf7ML5HC+Vm+FKIJ9it96GJrUmEyTjZoGC1Skcfv6RadUo4NYonz1cIIzlaj
         +tKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731358470; x=1731963270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zttDuuB8Jg0F5HVXQ122SU8MUC6GU3do+W5lCjsZcck=;
        b=gSWXF11ALFLOwttgqIwnVrwm+8cs6mjl8w6yzkWyGWyTbgxjRMdKSySxhhCGq7blBy
         NzF+q3MDh+1tEOMwf954UoYl8hzJBK73/js74mJKcEQmxOHwzM8yjeKj23B2a78TFc1x
         iUYr567mrjmvvtVZiEmZxefjywU+QVxqcFCHA88++oGYuN/0MTml/F0G4WFLwhVYkCIZ
         jYPFBOPOC3pGGG76ake4Ee0KWeqYdfxPDM3pFJQwTvtUDpC+E0cfUr29ngcZuLvGXXGV
         wfL7mny3RZlWgmHxovpRCfphbKZoSz2UMpeksbwUhI6KGopc42ED8SBoMAqUxzVGlb1T
         Tl3g==
X-Forwarded-Encrypted: i=1; AJvYcCXDfJNwI2q0U8F7+6oCOp+FHWKvUXuMSdDNMfGjM1/1YghnaybpWKXz5HyP8JQ1BjdVGcFEZNEkuUTx8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoGpSHuTV/YBeWddcL3ohOMrwc2WGO0uzAtsjZ3ZVRLuJZBAPH
	+/0PcKJQqkUYCy3N/MQ35q0Dhrm0OA5XT4PsTuFj+R4kFEovvhCV3mNRGGxfSsQ=
X-Google-Smtp-Source: AGHT+IFcd53uKcSM2vImgVUqVtCSgX2iqqP0I62SSblxY8DhVnmUdx3hmCD82D3gLR73X/oNRmz2JQ==
X-Received: by 2002:a17:90b:17d2:b0:2e2:d3e9:eb33 with SMTP id 98e67ed59e1d1-2e9b16fcabdmr19214158a91.11.1731358469615;
        Mon, 11 Nov 2024 12:54:29 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd1534sm9059974a91.42.2024.11.11.12.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 12:54:29 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 11 Nov 2024 12:53:58 -0800
Subject: [PATCH v8 13/29] prctl: arch-agnostic prctl for shadow stack
MIME-Version: 1.0
Message-Id: <20241111-v5_user_cfi_series-v8-13-dce14aa30207@rivosinc.com>
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
In-Reply-To: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_125431_049007_45ECF88A 
X-CRM114-Status: GOOD (  20.01  )
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
get and set status of shadow stacks and lock the current configuration to
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
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h         |  3 +++
 include/uapi/linux/prctl.h | 21 +++++++++++++++++++++
 kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 2291c02c74d2..772516264a38 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4147,6 +4147,9 @@ static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
 {
 	return range_contains_unaccepted_memory(pfn << PAGE_SHIFT, PAGE_SIZE);
 }
+int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status);
+int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status);
+int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status);
 
 void vma_pgtable_walk_begin(struct vm_area_struct *vma);
 void vma_pgtable_walk_end(struct vm_area_struct *vma);
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index cefd656ebf43..c42ed44e86bc 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -330,5 +330,26 @@ struct prctl_mm_map {
 # define PR_PPC_DEXCR_CTRL_SET_ONEXEC	 0x8 /* Set the aspect on exec */
 # define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC	0x10 /* Clear the aspect on exec */
 # define PR_PPC_DEXCR_CTRL_MASK		0x1f
+/*
+ * Get the current shadow stack configuration for the current thread,
+ * this will be the value configured via PR_SET_SHADOW_STACK_STATUS.
+ */
+#define PR_GET_SHADOW_STACK_STATUS      74
+
+/*
+ * Set the current shadow stack configuration.  Enabling the shadow
+ * stack will cause a shadow stack to be allocated for the thread.
+ */
+#define PR_SET_SHADOW_STACK_STATUS      75
+# define PR_SHADOW_STACK_ENABLE         (1UL << 0)
+# define PR_SHADOW_STACK_WRITE		(1UL << 1)
+# define PR_SHADOW_STACK_PUSH		(1UL << 2)
+
+/*
+ * Prevent further changes to the specified shadow stack
+ * configuration.  All bits may be locked via this call, including
+ * undefined bits.
+ */
+#define PR_LOCK_SHADOW_STACK_STATUS      76
 
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 4da31f28fda8..3d38a9c7c5c9 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2324,6 +2324,21 @@ int __weak arch_prctl_spec_ctrl_set(struct task_struct *t, unsigned long which,
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
@@ -2784,6 +2799,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_RISCV_SET_ICACHE_FLUSH_CTX:
 		error = RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
