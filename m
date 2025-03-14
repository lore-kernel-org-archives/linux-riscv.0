Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64937C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 22:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8i2T4kGBP/My5ahgJcibXbYY7i3OoAt+iwC4R1Hgns=; b=3dkCsIPoP65ETW
	STb+F9In3ZByCMZxBJ3vzjk5q7i1PB/BUvKMKYSrrFnjLoAK7S7eClpwoEgFtfUbqcJy1SAFuub8P
	mx9ipTAI0OZDamR2ltdudXKQia4klxxAS8hHIIVhXpVaCr65FE4RPniMULLhyTTIKBVE1ss7J3zKa
	30u0GAfMOvOEAWFmXi4eDCbr1xe8cjhOTgeh0NViEwUR64gmqt7+hgqkGb69C8Al/WYn7IQCqvfIb
	5hHbPg4ERR2B4Kf4Cjlwjry5OaatNKj/minLDGBHVWVjYy8LV/JrFH/mOC9wz8LQCGBBf5bkcyudg
	sYu/fBx7KiinZvc+9fQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDrx-0000000FSsq-11tr;
	Fri, 14 Mar 2025 22:51:09 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCl7-0000000FKpl-2Snk
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:40:02 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-224171d6826so63847825ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988401; x=1742593201; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onO6gV+gwl07vxhB4is21Yez1q3KjrVLviDZSIMIBso=;
        b=biopbiGHmCjBVFOH0EHCKoQ8UUwsYGKTACvVUBZkBR2dkPc5+JzCRq5Kxx3XSUbQ9N
         5geybf/gYYEu+am5stK/nNrp4lRe5vuhTwwXAwmxrJlAy8/UvMC/eXAfbImSyYPCJvfN
         YkHEqw/kOazUlXa8mn8SsigiGfYgvLvEk6+63v1He9oT6pqeZYqOPmC5UKcKkCUq9cUx
         7XKT0QHLmKG+L8kOw5nqdkMpzMY8a6vxeFuXaPzsHNMNNICHQZbrnC7NGol5dgWDIUKq
         UUKfnMRgIQh18Gy3vf1hz6yET1qVNR6IUpE2JC6D/G8hJvJmFaQdwdkZhzL6hAFJJEV3
         uMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988401; x=1742593201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onO6gV+gwl07vxhB4is21Yez1q3KjrVLviDZSIMIBso=;
        b=HmHaaEnJ9mJm50rA00anSL326PswF7H91RXnJ3GqnCj74BW0pdE5z02lmGfo8igg6h
         c3XEZ05ZpKnjMRPpB/vLLRIuasGZtSHST+vBSD9grmNCZtIKNXxbZ47t6TZpePtCyuhf
         vV1GR6i3re7hBIqMdL58JU1tGylVOAiAyDAkV5jHglxJKK+RDYny8KVF1Z/V0BP1F1Eb
         GgJA6tbpDeqRYNrg4hTp0tHdztiIJiIL8IPgROGl56O75GutjSiTLWo4ZEySrbpcNsJ2
         JhbxkC7X5de8gIB4BTk5kv58qTrmb2c2w7hvY359qsBfL86deQgpPuosA8M3JYTTJUWD
         ooFw==
X-Forwarded-Encrypted: i=1; AJvYcCVYpVq4OPTjXexSPAF/V37egiFtSR5EX3njmHIHSLe/tf3Og6JCzUH6a/YOp2MLtuSPX/c6KAglOdJJTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEm0HUFW3yNTj20tZbaL9sqfgGlblqytGe3Ain2nWgY5FhvUUm
	t3QMFx2sy6UEVKc01g2ynFGng0vzkrjb+bS4mQjLzIAfEIAwVYPnHRkvUVV1sb4=
X-Gm-Gg: ASbGncu29P8vszUsT5IFjjIe+gCXNzf+/gBRYAknscvMx9BkuIrjPqucN7bFrYy05pr
	U/d/k3bGgmkRvpeIGk6xgJ09PnKyGLPhbAHPHdo3Ik+Xr+9w47R4oyuUPj/ncuLuhielEAAR5Yl
	9LzspOAL9z2y/F7/Sn5x85yrAbVAV8sbqlRfvVei/yX5rCa9mbzPtFQm9vtJVdz3D+u8iMTDG+g
	aySbCN3eE/47SqUHlctwhFReYx434DrR5bi6PNO/dDmbSKE5Ww9z+D2hHCyAxBgrhoj11k5Lh2i
	7xRhTfT9lQqZ470CULjzrMUqBwf6+yhfMW/vZaVwXxGZ7ap/GJemi20=
X-Google-Smtp-Source: AGHT+IFRRNpqWVi1Ekf4KJDdZ9UetFfwRyekdTeabqYxkLE9P/UbVTlwOASvnLTEKfIF4erNHXNXJQ==
X-Received: by 2002:a17:902:ef51:b0:220:c143:90a0 with SMTP id d9443c01a7336-225e0aaf01dmr67336755ad.24.1741988401012;
        Fri, 14 Mar 2025 14:40:01 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:40:00 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:32 -0700
Subject: [PATCH v12 13/28] prctl: arch-agnostic prctl for indirect branch
 tracking
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-13-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
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
X-CRM114-CacheID: sfid-20250314_144001_651569_896ABE2D 
X-CRM114-Status: GOOD (  14.03  )
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 include/linux/cpu.h        |  4 ++++
 include/uapi/linux/prctl.h | 27 +++++++++++++++++++++++++++
 kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 6a0a8f1c7c90..fb0c394430c6 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -204,4 +204,8 @@ static inline bool cpu_mitigations_auto_nosmt(void)
 }
 #endif
 
+int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status);
+int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status);
+int arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long status);
+
 #endif /* _LINUX_CPU_H_ */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 5c6080680cb2..6cd90460cbad 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -353,4 +353,31 @@ struct prctl_mm_map {
  */
 #define PR_LOCK_SHADOW_STACK_STATUS      76
 
+/*
+ * Get the current indirect branch tracking configuration for the current
+ * thread, this will be the value configured via PR_SET_INDIR_BR_LP_STATUS.
+ */
+#define PR_GET_INDIR_BR_LP_STATUS      77
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
+#define PR_SET_INDIR_BR_LP_STATUS      78
+# define PR_INDIR_BR_LP_ENABLE		   (1UL << 0)
+
+/*
+ * Prevent further changes to the specified indirect branch tracking
+ * configuration.  All bits may be locked via this call, including
+ * undefined bits.
+ */
+#define PR_LOCK_INDIR_BR_LP_STATUS      79
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index cb366ff8703a..f347f3518d0b 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2336,6 +2336,21 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
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
@@ -2811,6 +2826,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			return -EINVAL;
 		error = arch_lock_shadow_stack_status(me, arg2);
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
