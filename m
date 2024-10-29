Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A85D7494F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 23:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hsn9MlnTVJ0CTilmbcBpgXOEP+YA1eX/TdG2jKbtrKA=; b=pd0/uiFu+kEDfQ
	x2nbqgLuMKOmEwUQXjHiiNYTlCdOTbUf9c7XJHmPc6R/3bFoJD14WfhND52hGfWcvYMvFB0JDKw2c
	LK8Gual459rUKn4ApuO2V77PUgHr6LE3QYSBgi7qZaPcRvoRRzocRLqxb2IuweQyamXTHVnh14mzf
	NJ8q8NpgRsba9t9lMs7CKXJrUTkdaTNnKsi5S0nkm8sMlOs6mFnc0W2iU5o+oz07vkFTJDDk0c1im
	3egloGN3Ko6oz864qpO5fll/U+mJZcu5i2TnXkgehepQ66H1apq9dvyG0j5OVULqvE2buyxMijGSQ
	7FdDfEfcKhY6f+8eb25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vug-0000000GEpV-1PH6;
	Tue, 29 Oct 2024 23:46:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vtx-0000000GECH-2onP
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Oct 2024 23:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GnRpg73oVkF58mc5nN4qjvbtKg9UllFNYh9JE289A1s=; b=lvIRhyMg3kD/VwRnv8/4jdNo0z
	9xHTqzVS950WaZ4ArKkLGD0pQtKhU39vSSxHhBe4IWg8ORKYrp41Uoih0S3MztY/RTRe/nL8nk/zI
	2pk73whts5E/rOccUmS32OWB7PvHTEWOvl/zDU8euxk5BPWQ8v+4XeuLVJN/Kd7f7cN9yPDNKawbv
	j8cSWYDdtuVssX4SODMV5wFgW1ZBPN8w3v3+wgMvk+KKLjMfAPe8SQEhvD4ag9XQDEOo/gjlzvVTv
	vW/vpZWYgE1r7bMIAAAkwuDNn/tKVSVIr145NVrav10zGtGrpoeDwwmXWvhfLY9PzCYlNzO/QwaZ8
	0AduZUEA==;
Received: from mail-pg1-f173.google.com ([209.85.215.173])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vtY-0000000A1JX-0yZP
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:45:23 +0000
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so4624777a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245501; x=1730850301; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnRpg73oVkF58mc5nN4qjvbtKg9UllFNYh9JE289A1s=;
        b=mlrSnGN/tktQgkJoNyjOlVaHsnPRMay47eeiU/pWpgtfGW0uPyiCFY2ed7vFZGgbdL
         bae/ePr6ZRgk30V270+SzwSBG8tnD+4sFSSnDHqjTv+Yv3mVjFL3ye8/0cvDBk5T0ZKP
         jgqtzz6daFo5tq+fQdrWdinkZ97tiZvw3beOgOxf9/W2l/gx7exxl783jXA69u0Re7bq
         by5Bg4l0ZKfbohaRb9Vty7n4qof6jIWuZKfl9xJrJWUDXW8WQ3OMHeoR3BY3zVmgKsEQ
         YqfnHLULBAZDYKNOwLRP/aqdfAukY4i63QYlh+wBf8BHpQizM1jO4kHNye6j6XXbBhW/
         0aBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245501; x=1730850301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnRpg73oVkF58mc5nN4qjvbtKg9UllFNYh9JE289A1s=;
        b=Lem47g9zBnxVyKggY0dyDBUUYGx98I2krMxx0BQhaAk+AENrP8j2TDWfQsZaglD/gV
         hlM9khFUCfsOj21lozortfjXkgo1YEyaBdanLybclHajyK7/eDMg7gJvnqi3mqPG45ys
         Kumc6p+JjoWat/s626fgO2VYIQwXR/PfxJOvlZYymnTFghLK93LMfD3H4ESOUNAM5T8q
         H1Ex42x8zSnr7IRyQO51aAlJS2epeCbw3nYGYdudK/TQHiUSiGfq8OBowXDbrWne8u1d
         pENRzsn8VV8LoXP8KhvekW+GZH4keKRFhhDYSqU3JfkvXlHECjhaCoX22xWuFmZp/Mfg
         hHwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXcywuCfjbjhmGzHlp7UAiEfg7jkwAagfRDBrcQkKJ6A7hRkOwEbGced+q0b8gbMDw36zewkLnxpC/+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0vvs8Hnni/CSBWaAuScCN18m2x03L4wtcASUCtq2U1Izbffd6
	xwQ5W8OrLWEr3pz+0u4mct1TfDlwlQmBBDjAMc+E0vlpo2lbnxd8hOlRjGQP6b4=
X-Google-Smtp-Source: AGHT+IGC3Qid8/qIQwFQKJjq9xjWWIqVoJYycU5kLlngrCggKnSEPnv8BOJ9Ejv3TGwjaCoV88BMQg==
X-Received: by 2002:a05:6a20:e30b:b0:1d9:2a76:e245 with SMTP id adf61e73a8af0-1d9a83cabf0mr17942587637.16.1730245500871;
        Tue, 29 Oct 2024 16:45:00 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:45:00 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:17 -0700
Subject: [PATCH v7 17/32] prctl: arch-agnostic prctl for indirect branch
 tracking
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-17-2727ce9936cb@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241029_234507_603239_C03EB1A0 
X-CRM114-Status: GOOD (  15.08  )
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
aarch64 landing pad instr - `BTI`
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
index bdcec1732445..eff56aae05d7 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -203,4 +203,8 @@ static inline bool cpu_mitigations_auto_nosmt(void)
 }
 #endif
 
+int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status);
+int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status);
+int arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long status);
+
 #endif /* _LINUX_CPU_H_ */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index b8d7b6361754..41ffb53490a4 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -349,4 +349,31 @@ struct prctl_mm_map {
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
index 3d38a9c7c5c9..dafa31485584 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2339,6 +2339,21 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
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
@@ -2814,6 +2829,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			return -EINVAL;
 		error = arch_lock_shadow_stack_status(me, arg2);
 		break;
+	case PR_GET_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_get_indir_br_lp_status(me, (unsigned long __user *) arg2);
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
 		error = -EINVAL;
 		break;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
