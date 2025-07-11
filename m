Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F572C83F26
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 20:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Be6vFcijrp0OA+6jlz2nZ0SpSBxiVGNHQdTf9t/VYE=; b=TuNrcaGOy7bX6t
	K2ExgS3Xd1MouaDnE5HJadn3aq5FzlWaL/dpwLczot+ZXs2ysmIYKNUJzskneDOJm/86EbjMQMNHF
	7TGzLJFLeYPSaxDrfaS15DGJOZWeYEAidPcBXZeoxz560rbrWz7ZrAQ92C662N6/UppEWcaH48dJf
	pxVgRM7NapFs4+jQM3ccmbVCupXLbz/2yqVlHI115XHE5n11IMCgjUBHkPrU/C7FS7UMkxNY+/ZSz
	X8RHa4+kKggJE5uYoHsVKoy3ZQAIyxv3YEtLE1Xt/gA7Q0VXipQSu9KO9jYgtUrllXxLosd/g0EbH
	HWN5YTG7uo1IfM3TtKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKeT-0000000FoUB-3NGN;
	Fri, 11 Jul 2025 20:47:25 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJhu-0000000FgS7-36ES
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 19:46:55 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7481600130eso3071552b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 12:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263214; x=1752868014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Zc5n/fmBFqSLzd2InHh+oo1/6vhMJLkVEGctgWUI64=;
        b=f7TSf4El/fynC23Xj4+uNxgYlxWYGL/WyN//YyNJ+cY9lO+lFLAL2ZnzcJHSOGlqDy
         CnSANAvJz8sZPMTnwZxVnU43eqUrZMA2dids/MTF/GqKFhro1eNDi/HjxvyZkgQ9B8TK
         APaiC7QWUb0Jbj8+I99YR7pF6iFZwhXTjS+1d2s07lbdtsplQf1IQCd4ZOLy7qgqU9sL
         z88IR4CX/jVqLOmJNtpxa7gKAHH93gSR3DW3XlL7h8pnY9fIpAUw4z+0DWS++mRIcLGv
         hC4igrJsWc9K0ZSZmmK/77AX7JqoNrPUThEdB37tyEsuTNLsX0/vuNluL/7GkM3axOiJ
         8lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263214; x=1752868014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Zc5n/fmBFqSLzd2InHh+oo1/6vhMJLkVEGctgWUI64=;
        b=dCS/29FOucOq4m0gS6Ttf2iXGN5zW4V38EFnopRjMBhH74sJBMH88/nvO9GLGai0i/
         4H4uKJLtojON4FaluBfN/kIdPftbBUf+QA1LCeiydCBOzjbsHsGIGgeEDRa6fAeFBgmx
         S17sLMl/INrcKc5Tg+5V7CNe6tACRgAFPxGjvUZxVlf53NMo3mOYFYNrxs9xb3bbT6M8
         AJXPtCEYdyFS+VVs0quS/SCPbRwAtY8UzzLUXS7ifaratw8nDX7YP3Cv1k+2nIxkO7D4
         5OlRTijEWX95fq2ruLqu/aQsh5DJMDKgX9FcrdLZZlNAb68C/sGQES20neJaCwS35Mon
         OTfg==
X-Forwarded-Encrypted: i=1; AJvYcCWN19RAC5PBSPFRWmdfTx3fntT/9YFnUSu8b9GqgWgcpmCkoXUP71IpABqgD2rgy55DKIuiyFxOo65Ciw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxU+54k5bZ9vlM6A3toGFiUvC/ZbTK8x7uKxi68Yv8c9VemC/HO
	DjKpTj2FDOETpNXydwuylELVeIDFx6EpXqZz3FbON5LmZIQScyiWFxQc5VnFh9/D3ws=
X-Gm-Gg: ASbGncvNKlZeQ/2IRIiil1CYYrFzi6AbktycFQ1FdXAnJweP139LWcXVpiBPUZ3wxfl
	w0HuHq4Vf8Ld6lVWkljyRrrwV0KOM4FQFl7jphkHPUkt7FCZJGfw/a7bnfrjgJkRMi6L19OtI1j
	DsdFEkfx3vg53FChuNa1/n7TjMo5yowSVLQ8mBNU1z+HRoif0q4dPOEB4XfoblICycPQcgT6bst
	KFon+/2qLGBj+gLgXN9h6Mhr3Gl0WlwpF1R721/wFTik3B+C45bbHPVeRl0IblMV5c/M84mezTx
	rWQTZe6NJgnp4WewWQ5tBr8T2SSHNJ3JPMElMbwCOod1gL947hA9czjrj8rsoGprxcHHm7FVo39
	uUh7zgbX/Uy8VIOXQ6CUluU/F/y40aS4T
X-Google-Smtp-Source: AGHT+IG9YESao8E3E+NAefGQdBa7e8A7i1d/GjNrpQQsGCEH+wr+b7VKqJz9UJMRxEMoKnBp2VxK8Q==
X-Received: by 2002:a05:6a21:689:b0:230:d674:e906 with SMTP id adf61e73a8af0-2311f61b48bmr9002009637.34.1752263213908;
        Fri, 11 Jul 2025 12:46:53 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:46:53 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:18 -0700
Subject: [PATCH v18 13/27] prctl: arch-agnostic prctl for indirect branch
 tracking
MIME-Version: 1.0
Message-Id: <20250711-v5_user_cfi_series-v18-13-a8ee62f9f38e@rivosinc.com>
References: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
In-Reply-To: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250711_124654_802515_8D8ABCDB 
X-CRM114-Status: GOOD (  14.61  )
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
index e6089abc28e2..e94cd69825e2 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -208,4 +208,8 @@ static inline bool cpu_mitigations_auto_nosmt(void)
 }
 #endif
 
+int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status);
+int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status);
+int arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long status);
+
 #endif /* _LINUX_CPU_H_ */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 43dec6eed559..9cbb37afccda 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -371,4 +371,31 @@ struct prctl_mm_map {
 # define PR_FUTEX_HASH_GET_SLOTS	2
 # define PR_FUTEX_HASH_GET_IMMUTABLE	3
 
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
index adc0de0aa364..af6c28dc6b71 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2341,6 +2341,21 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
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
 
 #ifdef CONFIG_ANON_VMA_NAME
@@ -2824,6 +2839,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
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
