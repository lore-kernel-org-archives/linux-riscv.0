Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EADC54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 05:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WwSsO1xdTozoAT27pO4Xh1/EsjLy7yPQixobkqJWDqE=; b=menWQACrwNhzDp
	NNweCksm0WDC5+rp7kueXLHZGB+p/B1FRM7jQ8+Mq4pNbqG1b7Arnz2gm9xgYBS9SviNj9cs6/P7j
	IuJsXe0LPUpFHfm+9IgSbpx4dVoMHt0sx3QtEDzrIbBe8ubdPx/WcMvDottIi8QrfoOxSct8uA0xg
	WicvZwZGQhGGLIl7ruJ1RWsQq4yPLB/X35pryNh6/xVRhmnfULam4KWhMWMezaXWQCv4X84pr0CBQ
	DDMTBToeeWlm3Zmvny5V6hL4rQAenoe1mEyAqOfQl1oQHG374Y1SfXiCnDbUXMm6+SVdBIhFG8KHv
	TTthgorU374LHJI/ruZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL0k-000000030Cy-1qxM;
	Fri, 23 May 2025 05:32:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL0i-000000030CB-4AiG
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 05:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Wqa+EnEmqD/WcxsFXdACBzGsJGhuUJWdKCVGNJwyc08=; b=K8/UWouF1gW2vmYwN2GQZrx66Q
	ZCzQpz6o7hJ5UBKIKCTCM8ZGkEzE1iglkIt/bP9zWhQ0aKXuoCs/2BD8QTZl9Yq0uhNeFIjCJiJ33
	8Jik8tp9kUErlPq+I+ZcBqAcBDsb7LSHSw3bzgVMcKzROxSJ4dyr94UcKjeqosuGAnzuyMw67C7dO
	CnY6bHuhihvSTh0DF2xs8oC3hBt6FvI+Nf3g3QiD5/iqGeTPQ/5SIHG1gBFwVShQo6XqUGzlBTaDa
	2n5sg4XuZ5C3/Th3Sgcdy5nTntEUU7sEBvZ0pHqmDcirVN0NOF9xkSqYe/iT+aBv5mTORDuQqx6Lu
	QMJCxmuA==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIL0g-000000018ik-0Ig6
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:31:59 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7398d65476eso419967b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978316; x=1748583116; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wqa+EnEmqD/WcxsFXdACBzGsJGhuUJWdKCVGNJwyc08=;
        b=dMkqztLjKQWbYBHYKwlD2WnBTyFGKCWkn+eCqJmfHxiDIdMIGI/QJfTrG5ZalDQq5E
         ecyr9pqyUmP3OLYX6DGvCU/T63oGd7zQWE7UFAwoQJ+PDgIGq0/bXT9vX4u7FiKJIgM4
         3PKWprDLMpHrBVCZXnTVaX4y3boy1gxKW+cpmbc1c9NI8qHNTa9jEv6X7gLDkrNGfBR1
         bzZVEMp7617Y1Z2DWntiulZ1p+G3RtTpiCoHebp4NTZBsCEm36YZyJ5HBOuJZBhnnmzc
         G2HQLiLnTUadSkKRkfezushg+pSaGHvUkpPtWyqAYWPAPWeh2rkG/dV78rGhy1Lem99Y
         UOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978316; x=1748583116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wqa+EnEmqD/WcxsFXdACBzGsJGhuUJWdKCVGNJwyc08=;
        b=FdISoeQSbXotJjvYaYwwEPo9dcgQ39T/TjcTeqhnUoiKXhsKEnukLaUxk8RyS3aGk5
         9hu+gdjduv75nJByZAsAawLfndRnmIPzdfZeHcV69iV5O5p/ZHwIykXvNn0Zp4YgA2Jy
         OWXJIwGrdBI5RwYc2hQr577sZPCcvXco19bAuWV1NbKpcxjwB4M8eaG9i2XQHk0GnZAO
         ifqqi3r/hrsz9EUO/g9+a+zpDKP6neNSInCyzDBSJg+lpmxZWFDdr1aj7h4vqLVmN1Jz
         jy/L7U+cNvVB/LUjHIuIQxQdKD8OUcCpG4WcEr5LDrbF2ywph17KLLJ4bYhTAIbast/V
         nUOg==
X-Forwarded-Encrypted: i=1; AJvYcCWp0kXdFAUYHaStn4nQ3Z+V6DsNeV7AZMU1s+HmTmT4pT7vNG6sAsj8lTQ/yw2+KRSy2j8lQA5pdEJy3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdEwDOkHT8Wo5oC3nGyeoMDP4RBvUNFBvemXB9iosGJgdm3Y+9
	9u0g2dcL2NBxBxscb2kc6fRTN32QcAXWU2S8jteN2Y2rBD8obHLv8Hh70CWBra6PWnU=
X-Gm-Gg: ASbGnctUvStkQT8IdUqzJNi0IU8bgbwWPYj7TdkZjScaBDevBxx4rXukCQ8aCLJpkgH
	/63bIZvQlhGMffQuZuTilSu1IvXNCCkTUcbcF/fHaNkLNMc7qOwGgSgoeMNkUshM/8ub+xmqq58
	9FlWMNWzU4hpILWcF2abumtBzT2bUoZdhFO5sZEHdZkwd/jBWQBfpo8y7YE0esqdeaix9Uc4ogb
	aWHcwGWV16UV0Co+9D+AwN6jMRLZ6dV6ss6u5CoV0URIunpVAoSL4smFzgub7fw6R3eW14DUBh7
	XYOSool6gvy9HoTw4BrnHRgilolDSgA1JzgvNdNQRatfmmv9OBa6VasZohYP8Q==
X-Google-Smtp-Source: AGHT+IGQc6IZJp5HAkHQYlyq1dVOD5fmS/7I583lCwYe7yctSptPmxrk/1ttbdxyBKVGijqawjtVpw==
X-Received: by 2002:a05:6a00:9294:b0:740:6f6:7338 with SMTP id d2e1a72fcca58-745ecdc83c5mr2853244b3a.3.1747978316020;
        Thu, 22 May 2025 22:31:56 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:31:55 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:16 -0700
Subject: [PATCH v16 13/27] prctl: arch-agnostic prctl for indirect branch
 tracking
MIME-Version: 1.0
Message-Id: <20250522-v5_user_cfi_series-v16-13-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
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
X-CRM114-CacheID: sfid-20250523_063158_270367_02E5E9AD 
X-CRM114-Status: GOOD (  14.75  )
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
index e3049543008b..ea8b351b5bc5 100644
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
index 15c18ef4eb11..2e09b19317a3 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -364,4 +364,31 @@ struct prctl_mm_map {
 # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
 # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
 
+/*
+ * Get the current indirect branch tracking configuration for the current
+ * thread, this will be the value configured via PR_SET_INDIR_BR_LP_STATUS.
+ */
+#define PR_GET_INDIR_BR_LP_STATUS      78
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
+#define PR_SET_INDIR_BR_LP_STATUS      79
+# define PR_INDIR_BR_LP_ENABLE		   (1UL << 0)
+
+/*
+ * Prevent further changes to the specified indirect branch tracking
+ * configuration.  All bits may be locked via this call, including
+ * undefined bits.
+ */
+#define PR_LOCK_INDIR_BR_LP_STATUS      80
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index c434968e9f5d..91a1dc093c2a 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2340,6 +2340,21 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
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
@@ -2820,6 +2835,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			return -EINVAL;
 		error = posixtimer_create_prctl(arg2);
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
