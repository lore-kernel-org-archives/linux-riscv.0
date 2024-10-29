Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD611D7494F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 23:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0oAw3OlGBgGWvUZ1TdAPT8rOyyJ24+8lCLIV8lLxV6w=; b=GQHhT7ZdxBZjj6
	Pb4TCbSJKj/U9c0qSZQdMdfn2DDWhYEozTxXsipO9eWFCn7yyGhtVTHT074dDHKU2iq25f98sNsSz
	VlKQ1SZXyGzTK8N8H6y31qRqzyxSP7SSeiQC1EZlDe1felyRl8HjOxbd1727fxdwigno1qYD9tja/
	EAqLR7yTKKIMp/1yivA1pRdMQYTILYRBGG+P/RiFZpxYVMRNR6wn31bdieIbGPx44NIxUYifsv6bF
	WTt7z4Rpq7Vvr52bpn6logy6cYO9yHPm681rl2sgHAHdBNvyC6vYd1gSbJTaYlrAqTfXpT4C6ag1T
	nF7zaEJE/tVEzdLr4Pvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vto-0000000GE3l-23Ig;
	Tue, 29 Oct 2024 23:45:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vta-0000000GDqz-1lac
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Oct 2024 23:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=MX17XgayDE8GvInbCjC/4NqKFQNSI1sjKyctPVZ+mGg=; b=ebChvySVa5p9FYb1EzyOwAZMJl
	fX+IHmX6QcEYUdHqTV/hvGFG2ZnipyyxOnimKhUuRFvl9qExrFoDzdf/V14uHyNY7pcqoQOIZ5Aif
	hfoHHKDoZlT+nKV8yeHp80qR751d4Tn8yKCmziPFXUjAo/05zjjntrzEkp33FfH9JjOp98oSUOSRb
	NBnX2KECcHyg3z8kaTIwgEEDA+1YUg4a288K+V2UYxXlGcHmswyqEeKVJ0BmJspi+9ZJ06fpr34kv
	JaZY5F3SaBp/caSAKt3ASJJ3fRnJihNS2L8/cXl0W2x/nZzbaRMgj7Whhn1GSpiT+s18t4Dv5hs8E
	8X8DL8ag==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vtW-0000000B3Pn-1Uaj
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:45:05 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71f5208217dso4050639b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245498; x=1730850298; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MX17XgayDE8GvInbCjC/4NqKFQNSI1sjKyctPVZ+mGg=;
        b=trcWnAO8YaO79DauN2Uzaq3c7TkxA1gtofGvzKY+lX7PJ/vsoKICYZ6Et4lk1arO6v
         ladZ24ZU9EVpJqtc4nl4O/1jXqMc5w2xQrmoftfvVhnWNAB1i8Lh9rZ5Kv6oVAME+Y9J
         ySRetPTLHsNpNZ8zju2qCcDxdAnJ0S3YqvMKhvM6Rh63z7g0faxIgiKDbweVmm1QF/XC
         l2rvQVQRkTgWPVJnLyNzSmDla3HVZlzxSBAB2H8j/T89mJd+twKTP3HFFtbuPc9AVNex
         QaPehps3tLL2kWfg4sICRxPJQo3E8W0waJmVxXEaILGhEGKo3/wn5s1gfKIBZSYngZE2
         8tDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245498; x=1730850298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MX17XgayDE8GvInbCjC/4NqKFQNSI1sjKyctPVZ+mGg=;
        b=MiigNddKzBI5CKcvCwbI1ApKuJUJBPWXhcgeixNXe2L4sruv4coRN/oL/dndt/3JgP
         ZeWTLZJLWx3/d8N7dML0MDlEQ7YGX+a5aeafC4O2oOqI3LbbGo/W6Nly8cK/j3mUNFOq
         vveG0ssmJ8lQSYxACh9I+CMic0Ur01rrnINpp9LQaWq78zVEtz1tHEdY8klIBnohux4t
         7MHihNAYycWUUXLs9ThZCnRWH00Yrh+lNkV1TWRMYgWMOsNMMkElBd/tGsKbEKK8JziR
         LPIbqsDjFTbsch/z1MZ1iA1s4n8aiVDNw7QfsHEQ/YPP06HzFVAaWsy+Gl6ezOCsE6tg
         V8Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXEcwSbdJtY/kmIylIz8YHSEC2E1sOsNygUl4YXRJ9DCPHRZ0DoKhUYh8+U1fZQgOzO5xE2CqJOgLclYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKP47iPTmDSYzdR/i+BIpbzoO40jYqYtwWnsz8Qkk90hQ5zLaH
	9935FCd2UEgZEfVYLZewTTVWbPrgyqF6xqhFlnztwNQyASYRRkaCNSfAbEcJaG4=
X-Google-Smtp-Source: AGHT+IExoxYnLt1GvbT6MZVWFjKFOSbr7AEUolTL6dzHWvO6oME8gZh14LO3LJsC9IhYy2Z5JyMh8A==
X-Received: by 2002:a05:6a00:4610:b0:71e:4fe4:282e with SMTP id d2e1a72fcca58-72063096385mr19719551b3a.28.1730245498419;
        Tue, 29 Oct 2024 16:44:58 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:44:57 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:16 -0700
Subject: [PATCH v7 16/32] prctl: arch-agnostic prctl for shadow stack
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-16-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241029_234503_204807_B1E2C902 
X-CRM114-Status: GOOD (  19.15  )
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
index 57533b9cae95..54e2b3f1cc30 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4146,6 +4146,9 @@ static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
 {
 	return range_contains_unaccepted_memory(pfn << PAGE_SHIFT, PAGE_SIZE);
 }
+int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status);
+int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status);
+int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status);
 
 void vma_pgtable_walk_begin(struct vm_area_struct *vma);
 void vma_pgtable_walk_end(struct vm_area_struct *vma);
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 35791791a879..b8d7b6361754 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -327,5 +327,26 @@ struct prctl_mm_map {
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
