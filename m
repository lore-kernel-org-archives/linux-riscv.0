Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C7DCCD1BF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 23:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzG2nTN1Zk2ZN96ZJ/JLBX2r7KH4Ncs0eEt/CG/pcmk=; b=Ppt1pL8+KN7YRU
	XLVZ4FAn3aTfw/fDgqcYBtkmEEpr23SqMkXLtVqVuTBNwZBA3U3V+AKP+TmznWaXTM9DO+bR1kVS+
	YLLrkaADMgYk0Ufy+bUruV+VNjLjgvo/Sm9l8cYvu0inR7+Gi/blFJiMNarJnZA8m5KBQ7I6f8IxL
	ZdbWByh9UcD1zH/s06hW6Kycy92tHmLP3hYvzoJmcnYXjG3sDGtUjS4kMt0Egg5WEmvtZowlt8qzq
	Yv+qjNtdsAt9cPwWmivUjZET2h0wT+wj0ivQxOxTdsfs71uiSPO/T+4o8jCmIVNm4GU3sfXHq1x3o
	2ivGLhiwnKgB01jssf0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBiHT-00000004YiU-3zi6;
	Wed, 22 Oct 2025 23:30:11 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBiHP-00000004Ybj-262f
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 23:30:10 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7810289cd4bso190053b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Oct 2025 16:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761175807; x=1761780607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ujHqL1CkFocnxfBg/TilHgsDv7qqfxACnquN+j6SpiE=;
        b=EXFtXTws+Nw+NPDej2VPuuJW1Ajp+G92JEpZMm5HzTa+VZXz2eW4wGEIU4cNhSn0a3
         B2Qb1kUjJSKZzF9j15qIDDK2qCqN3MdhTZMycVmTjqkWi+VuzyarE/VY5BSCQz0GxrDD
         +ccgdXPl8rWZ6eQiKnAaY1jaE4MW2tewsjqctjQ1RB6SC/5yLdwrtdF8OZBTSKo6n2gm
         vXQo0+hHpfbC2HbZCHZdnUsP+rFTgQj7fpRQFleyGOIZcjSyHKFNe2ZUr/G9h0HgXuIW
         DEPsgZEVlRxaUSA8mV9l9sfkjo7W0y8LdLYubVRtyGoy3CuAHklRrRmyEAsoZqVNpxdH
         Hlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175807; x=1761780607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujHqL1CkFocnxfBg/TilHgsDv7qqfxACnquN+j6SpiE=;
        b=Cmzn9/RWmtMPu3hKKwqQbqppCP4tNuk0LaieQbfGA6lGSvHlVSB3kJgtvcnDCk9jk4
         xagxbrFeogUk1ss41I7MYkZuiGQl/Obv5NEzv35X4art+2OD8Rg1p/5k2ZLCmPd1ssRR
         CmXqhY0F8Ki1KfJM64CuNnfFiK2qnMHP4GE+gA7Lk5/635EwnX5+7sqCdxe3eucZNNm4
         Gk5BzRMQBh1Mfjt1mlOf6ptfUx2oRWBDEaYZT5mer7iRGaJh0D+fXKivLArnyXNpz4J2
         Z4OBmCNMbD8pxP8cu/CTMXxdYqznpYLqOsPwGafwjaLTrS9vDw3MN0R/WmhtpQgs1L+G
         mlmg==
X-Forwarded-Encrypted: i=1; AJvYcCWuh0sIM9QHgA0CtRS+oga6F+mWoq2sGWtycSeXOK2WI+aPkQ3AQonnQDbnqUvVUDlS4aBYhkUt5mxpAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YznTvwTKXT3QajJ8T8WSHFvt6Clwpng4ECgzRQuPzgpmWRTm2ZA
	DYY31xc18Vo4Gtrwqsa9mAuVhv0buZEGue6Xrv69U4X0P/rDopvyQYufra7CxpWPy3M=
X-Gm-Gg: ASbGnctHkeHWBK+aeZM8ucJmpYvk6R/0asvvk26lRbS25QSXjlUtzaAYu1a00atrEnH
	/7pf+BXowJG/C/uWv6pUFJh4/j87t5uDep/6haxiPGxwmApOPLWuDK10As0Ea9mFqUcpUnsTA6d
	K3w2eDRS4TAqbPGJtHPkXksoUnodHbAMR0QHRR3y/10n4wJd5Z3H8TcNXgQRkUWfWjClMLj8onA
	ZIlRrMrCUq8luSrP2WDdQGnxeeoe2MZYEdJBTtYGrrHFeyAYYSNKOJAowz5JqS0/JXcNYXbosg+
	oG10sziK8D5BodOe7PGW1Ys1M4anAq6MPfJFnvP6jDxVbsI1oL0ck3grWsuGc20WMKnHPGfM+Mh
	RtWc0gVWnkzu4MNq6+jEI32xG+H3kD0vEb1KOvcWMO4PVDIQhW0RpjPwmogtLrvd9VwgOzIoA5u
	wQHOHRxH3P7eEfMlb0A0iQ
X-Google-Smtp-Source: AGHT+IF6gkZs32tv0Sc+yHY/6hVbkvNJoMtqK+eojdM3VMRuuvu79OFo4jjiqTiRVOGksRWCeTn0Nw==
X-Received: by 2002:a05:6a00:2e03:b0:7a2:6b48:535f with SMTP id d2e1a72fcca58-7a26b487089mr3870490b3a.12.1761175806653;
        Wed, 22 Oct 2025 16:30:06 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274dc12b2sm392646b3a.67.2025.10.22.16.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:30:06 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 22 Oct 2025 16:29:39 -0700
Subject: [PATCH v22 13/28] prctl: arch-agnostic prctl for indirect branch
 tracking
MIME-Version: 1.0
Message-Id: <20251022-v5_user_cfi_series-v22-13-fdaa7e4022aa@rivosinc.com>
References: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
In-Reply-To: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_163007_635550_18F3DFB4 
X-CRM114-Status: GOOD (  14.78  )
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

Three architectures (x86, aarch64, riscv) have support for indirect branch
tracking feature in a very similar fashion. On a very high level, indirect
branch tracking is a CPU feature where CPU tracks branches which uses
memory operand to perform control transfer in program. As part of this
tracking on indirect branches, CPU goes in a state where it expects a
landing pad instr on target and if not found then CPU raises some fault
(architecture dependent)

x86 landing pad instr - `ENDBRANCH`
arch64 landing pad instr - `BTI`
riscv landing instr - `lpad`

Given that three major arches have support for indirect branch tracking,
This patch makes `prctl` for indirect branch tracking arch agnostic.

To allow userspace to enable this feature for itself, following prtcls are
defined:
 - PR_GET_INDIR_BR_LP_STATUS: Gets current configured status for indirect
   branch tracking.
 - PR_SET_INDIR_BR_LP_STATUS: Sets a configuration for indirect branch
   tracking.
   Following status options are allowed
       - PR_INDIR_BR_LP_ENABLE: Enables indirect branch tracking on user
         thread.
       - PR_INDIR_BR_LP_DISABLE; Disables indirect branch tracking on user
         thread.
 - PR_LOCK_INDIR_BR_LP_STATUS: Locks configured status for indirect branch
   tracking for user thread.

Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/cpu.h        |  4 ++++
 include/uapi/linux/prctl.h | 27 +++++++++++++++++++++++++++
 kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 487b3bf2e1ea..8239cd95a005 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -229,4 +229,8 @@ static inline bool cpu_attack_vector_mitigated(enum cpu_attack_vectors v)
 #define smt_mitigations SMT_MITIGATIONS_OFF
 #endif
 
+int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status);
+int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status);
+int arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long status);
+
 #endif /* _LINUX_CPU_H_ */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 51c4e8c82b1e..9b4afdc85099 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -386,4 +386,31 @@ struct prctl_mm_map {
 # define PR_FUTEX_HASH_SET_SLOTS	1
 # define PR_FUTEX_HASH_GET_SLOTS	2
 
+/*
+ * Get the current indirect branch tracking configuration for the current
+ * thread, this will be the value configured via PR_SET_INDIR_BR_LP_STATUS.
+ */
+#define PR_GET_INDIR_BR_LP_STATUS      79
+
+/*
+ * Set the indirect branch tracking configuration. PR_INDIR_BR_LP_ENABLE will
+ * enable cpu feature for user thread, to track all indirect branches and ensure
+ * they land on arch defined landing pad instruction.
+ * x86 - If enabled, an indirect branch must land on `ENDBRANCH` instruction.
+ * arch64 - If enabled, an indirect branch must land on `BTI` instruction.
+ * riscv - If enabled, an indirect branch must land on `lpad` instruction.
+ * PR_INDIR_BR_LP_DISABLE will disable feature for user thread and indirect
+ * branches will no more be tracked by cpu to land on arch defined landing pad
+ * instruction.
+ */
+#define PR_SET_INDIR_BR_LP_STATUS      80
+# define PR_INDIR_BR_LP_ENABLE		   (1UL << 0)
+
+/*
+ * Prevent further changes to the specified indirect branch tracking
+ * configuration.  All bits may be locked via this call, including
+ * undefined bits.
+ */
+#define PR_LOCK_INDIR_BR_LP_STATUS      81
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 8b58eece4e58..9071422c1609 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2388,6 +2388,21 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
 	return -EINVAL;
 }
 
+int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long status)
+{
+	return -EINVAL;
+}
+
 #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
 
 static int prctl_set_vma(unsigned long opt, unsigned long addr,
@@ -2868,6 +2883,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_FUTEX_HASH:
 		error = futex_hash_prctl(arg2, arg3, arg4);
 		break;
+	case PR_GET_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_get_indir_br_lp_status(me, (unsigned long __user *)arg2);
+		break;
+	case PR_SET_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_set_indir_br_lp_status(me, arg2);
+		break;
+	case PR_LOCK_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_lock_indir_br_lp_status(me, arg2);
+		break;
 	default:
 		trace_task_prctl_unknown(option, arg2, arg3, arg4, arg5);
 		error = -EINVAL;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
