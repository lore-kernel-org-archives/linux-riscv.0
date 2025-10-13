Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832DDCCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 21:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzG2nTN1Zk2ZN96ZJ/JLBX2r7KH4Ncs0eEt/CG/pcmk=; b=wzInhOBVEJXI98
	De5FO9T2rrD0/NONTfQpBankmC3qV4AkOp5a5qWFw8kloADJvcgknZRq3IDtAG8R73ZBpAUULgsIB
	c46z2eoY3GXTTckKU5R80fe6O341pQohcA0jzPdF05z5t3/urw+vVS+LZFJ0+6GYD2bCtMew3UKuH
	wiBP7FYC/1RPbmdiCzL4TE3g8BsIR7kukMPJsoX0nO6I9MgtwWXq1eYtnPQTqzyQGIuKq3ahNkIkz
	V1xJst3zFmsi2EqT8nrCqO4/TOzn8OZAZWHTd+S1SGOVb3RitXm10WZxde09UcEwWs6UPFZ+9o7il
	2YAvQ1BZFJxSAMwY8Sow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QWt-0000000Eb0q-3we0;
	Mon, 13 Oct 2025 21:56:31 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QWq-0000000EasK-2vt2
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 21:56:30 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3381f041d7fso6103012a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 14:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760392588; x=1760997388; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ujHqL1CkFocnxfBg/TilHgsDv7qqfxACnquN+j6SpiE=;
        b=WuNRlklmucsB9lB4ibEphZDlzSXyrWZrDGa9D2HFuJUGncQFLH1yF0iYOhsJBKJbt/
         dVrgEDq8gHiaFrfTTuAQJPujgCsBEbUWSEBjme2vEiptEWmqmuHUzcr2/AnYPDUq6cgI
         5ztB5/RhfcCh4h+v7slcdnyV5954zidG9ZZCoxn5Ctjg+BtbEqu86LDtBDwxXL1rw8Ba
         ehssz1JCoZDd8WDssNT+zA543OtawYuTLxaaWvF5Rl/loXmibB9S3R1mbnN9cKMaCsHr
         Ib+sdYfcL/kO/06RpOzQy3kImAA6GnZkNWevm+eA54pMRfVmiL7m8tg5Lgt09c9+3YuW
         XDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392588; x=1760997388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujHqL1CkFocnxfBg/TilHgsDv7qqfxACnquN+j6SpiE=;
        b=PEvcEMdPtOZhEVtfOi9J9/3U725+CnMaimlABuj8pQjXQiuVAXWn/EBDBbeB36Rl9T
         PZzYw/lDuNfJXYB2VdrElGOgjHbK4Gn4efK2jWXe7mm+Bpuo+ETKEpiv/kCFWwZlwxT+
         IfqkGze/yPNhhL03xcvxgCzG9YZGjY2UpEAAGeAtnghXl4LTYzyzAo4DGO/ARuE+2xGQ
         XTgOo5+iu5r2R9eHHKKZo2oAUBHN9jFtYWL+EFL10AkRXihJnLWoYdfW+PKbUNvYot0b
         Xtqe+n2vSEjs+U2yuqtCcuvL2fm7gefOY3Q0yHossYUvo52vc4oi8aGBjHhp9D788g4F
         U7Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUv55X0GKgghVLUZ8hOfc3SsYU9qsYgzLW8t2deuoIYZXdkk+rr8N2ChcSuR70VyZQpz/UZUo/g++gqgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTS/nwG32NcpA3aU3pk3ZOudADr/46s09YqwAhXrbhhbV9OLuU
	g8gCWQiMXCXCrgbqEj4BeiUqu1VLCRiUnVeiiXQ8WkNwDqVxjt45JVG++lsgoonIlX0=
X-Gm-Gg: ASbGncv1fRWlTziza066dE5jOvqwendV8Yk+NsjLDOuB5x0bnTDhd46nJ1eKduz714l
	euqOh6u0yxqdp36FI/fVlQiChErhkj22bSF8YCsKVnZAxCykmVYOBajPVGb/FelCALMHPnd0v/N
	Oc8mC1qX0kuZHGVH0HcTxkRCJAanA4iRSKf6BHiT38HjpVz+omNLRsCwx5SwkFk0CDIwKTHeWGw
	1a/tHesUCzA8MyhJHSvtUX0Jy5J82VKTEky2BgHarfp/umJ5VK58TGV6vR4f57RLvBqIbOXp76g
	LtDsx/etTOVJ/gTRWoQiG3p/ypjLOkFAEmx7OV1NOxRRKqm+XFCxs1+5Mn5EDKf5BiIWGJuwzLN
	PxcDANUitrBWu++F4YzRG/w7Qjyvr3/tZ6kzKOEd94X+4BVzKJ8I=
X-Google-Smtp-Source: AGHT+IHzrnjGtxJjRjy9iDbKJuxIo/nGd1V7rPMVlGrq9rf5a1cggdhBtK3oXV3eARlMl/WPRj8kzQ==
X-Received: by 2002:a17:90b:37cf:b0:335:2d25:7a7a with SMTP id 98e67ed59e1d1-339edaadd9bmr34454171a91.10.1760392587917;
        Mon, 13 Oct 2025 14:56:27 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:56:27 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:56:05 -0700
Subject: [PATCH v20 13/28] prctl: arch-agnostic prctl for indirect branch
 tracking
MIME-Version: 1.0
Message-Id: <20251013-v5_user_cfi_series-v20-13-b9de4be9912e@rivosinc.com>
References: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
In-Reply-To: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251013_145628_813482_AC22CC77 
X-CRM114-Status: GOOD (  14.44  )
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
