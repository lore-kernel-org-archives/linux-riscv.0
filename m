Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DF5CCD199
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzG2nTN1Zk2ZN96ZJ/JLBX2r7KH4Ncs0eEt/CG/pcmk=; b=k7LJneBikQwRfZ
	uaqInupr4MqOaALpznfU3u/wkDCHmfJ4FOjEKjL43WZIX99hP64sGlNbcuRZIA7K204sI0Gr0kidx
	NJdzJQcTCXlkJErQ9kd7OQ2QugRmYfR/neyg8tCU8J5ruF7qwqPm70zBVErmd6zKu0FZrX2BhRO2d
	mPSoy78yGhl9QiJYPpHewrm6hOFceIRt7OTAaElplDv+V2Xtik8fwhZKNy8+oOb04m6dF9JEtk6Kg
	lEEKziv7POcVThxjuTFgnQj5NjUDr741pcVN21WkhfJxjAG/IeDgRerIbyiWB5/0KFGpCQSoulGcf
	ph1tvlt5gMoeAGudBu+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960z-00000002XQe-2CiM;
	Wed, 15 Oct 2025 18:14:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960y-00000002XNN-0U9t
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Oct 2025 18:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ujHqL1CkFocnxfBg/TilHgsDv7qqfxACnquN+j6SpiE=; b=lssxG0KQOVuxJDTEL0hixgqO2K
	2jB+6gk5Esf/XZZnRVblv3Xio5dMCtGd5l0suUv1BXjuVa45c9yUs31sTZxDcC3owdu4q+oGAqW0p
	QCDyIsnq4F5fNYilrl2qE/cyUMkR0tqFVlI2L73bxs0azs+/m+/c4H/FImtWiGomPkDNhayu6U2sc
	LVJdUsS6ZduxYP+WFIOwgKwOxp/d/AXgnfML9849E6jhQLpZJsnCiqTFEUzG3agj5UelMzaDdLiUe
	rcznF2js6W2YY1SLkmgQj0yIYmL/424j1xXQEtZ8V+IrEVWuCEwKZktbgYw14eKLSrZYskGsKh7vO
	W/5+k7KA==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960t-000000066D7-1PCG
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:14:18 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-28e8c5d64d8so64372785ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552053; x=1761156853; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ujHqL1CkFocnxfBg/TilHgsDv7qqfxACnquN+j6SpiE=;
        b=FQY63xFHY0bdk+9FH1k6CiQeAff3DQHn7k99vw8XDttxE6bYut6d0Fex9jvIVZ2GQw
         TkS3xDDYLTgte+U3oAI7XpGz6tJg20RbKjTII3B4TdRbQAZX5dSSsbVa1tKaLwF+aQKm
         OEjxZrPp4Exi1dGxXSpZyOxOqw+SzCt55ATuVQ9WrYv1zf6kELgbLeNmm2Zf6dS0wEBT
         +0S6W/dexTp2qoPBlp1QUNvOrDHbZbXyrz5l09dUupOwAyLU7biguqqJ/s0pFooc9EJ6
         HGpkst2d7ElymUaWqW+OVjykd1OO/ZuplfJwPeBX6Rnh2pBSkX3Z07THKi588I4t0eLR
         1EKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552053; x=1761156853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujHqL1CkFocnxfBg/TilHgsDv7qqfxACnquN+j6SpiE=;
        b=JynZ48XBQFzC3DUtM4lZEk6LWEu+yuYTHO/SHqTjLlOIlHk7AQtnSOUiVkUtBziA6o
         /ikbcC7LXHJvO33uEypOBp1GKvMb8Iohx+ea2iy0FNxLd1iVpY33fN/FXPRQO94FnOEr
         UafSkBjQUiKaI7cSTUyEJDQVn0zpCdxkGKXan//Gbf0s4BRj9WD+rh28uZf8s0fxDXYJ
         DA64hs6zSAnjr6l3gOfyabAt4XqV/T2uiPh2LiDGfn7T0eGotESwOuO0ARclcIDvk7g0
         Zaw5uMYhV5auhsePHtsdxmVlctwTtIzXsLI2bdfQhLjlG9UmTe+HjbFru2oH93AXcecS
         bwvg==
X-Forwarded-Encrypted: i=1; AJvYcCVFGXM1mLyzoK192CgfFcmqN71Tq1bD76z+ogs6dRONyGHok2KH4wdNzdEwkVwNkhI60729jwtP4F7U2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWsPiDfpywsGYdff+htD2o2yG9GTQ8O84hz0JjYjGHPG6v6MZj
	EhBn42xHiUPglt76JN2sfMeqbkcpa2RB0bGq7T5eWi9gXjx9c+PgwwfR67TX6p/aboE=
X-Gm-Gg: ASbGncugEE51ENTkn5+Eiti15ZrokofS9dfQbZ6+YZE6iYT2hyir6SM/4JSzTzSR6YL
	2E+0UOaLMRM8DGqXF1ITTCf+ElqZChjN+7sGzLo+Mdr5dNDEoeS2GJTOZj2XreNViuurUGfGwyZ
	0d1g9fqfdrsvSLbA5MHZarwb4pctqC01vV4VSYkWJ9JvWtUkOkLpIuLXLh4CfnUdVuKGgc2Wkb0
	WiSGD8har1mSnMAgvfXMoB6juVtBRCDbjjwB7Tz2OL/qPsgmksHd2kJf0e+CyDiGJRSiPPYYdKd
	CipvFQHsvZkKGHafVxBW1l1/FhsCapEjVNJMeIY2+M2VzjqKqUvauhB3Y4ddFoLe85MWI6xGCb1
	dXphaDnSOc/HIf5TPWKS+gFiZYGgVTSzrwgRaSyFG3mTRphNplHU=
X-Google-Smtp-Source: AGHT+IEtyiD3WhU3AZIwg9ZAqeLPEOFWz6yWPH91Ldn94tsOoz1L8MHcJbLdpw/vsRMNgw/AbSaIrg==
X-Received: by 2002:a17:903:1a06:b0:283:c950:a783 with SMTP id d9443c01a7336-2902741e42amr368451695ad.56.1760552053192;
        Wed, 15 Oct 2025 11:14:13 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:14:12 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:45 -0700
Subject: [PATCH v21 13/28] prctl: arch-agnostic prctl for indirect branch
 tracking
MIME-Version: 1.0
Message-Id: <20251015-v5_user_cfi_series-v21-13-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251015_191416_551868_0DD377BF 
X-CRM114-Status: GOOD (  14.47  )
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
