Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1F6CF042A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 22:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NHdBqjXGvXxyRzkbJbntJJQqD6lUEp3JvsZf/JDNgg4=; b=UJujGq0bj/f5FS
	EwvfJmwxAiY8tj0Xbaog2rlBJSauxc5ocOiraFsWwK/1c//bB8By4BWEoiWWyas6sTy3x387kcdrL
	ETS8mawQl9mIXlw1RIpZgIUTcEH97KloR5UEi/syhEj6EsIfMMAVnZjQQXdKlGNtVqzOuALnMXbX2
	1yKikVNwsXTJkn3V48fNHDmu3S0bV46PJKyy8i+ofZZbfo9WaU43SxR4qTFh/+uEwCU7l4fKQpryE
	N+OL4kKuC3Rxl7dLtp0ns2dUR31MbHpUlejCPGfeTkqMVzEFJtSasRzpjkl0YJofcbY3MdgZMOhs1
	p8cp1z2qn0Vd47nZLvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syIr2-00000007J6x-3lws;
	Tue, 08 Oct 2024 22:38:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqo-00000007It0-1euv
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Oct 2024 22:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1UgKthNvwCJdtX42RjeHROfs17OIsFbY3pdtzFTA+rQ=; b=L5v6gQSesLUnn0uITt8bstsWy7
	nxj6s5RSZp5/sBlEifUkna9zt5j53l6kPa41bISFwfTdhkOvSwygiXweVA4ZTav0IfHSPkdYn4+UH
	39WeDv+poxOr6YFsujH9QRjLSPbFDcrazvsXpOrfC5ubrU/QmQzEEN/KovQkxuyvlpn6iQb24VBeH
	fmE5IMI/AWy6MY7V9kyNKK1bx3Jq3flPFwXmmmtYn0Cxjgu80bP+bQfr82knDFOX7CoxNzFYJAHo7
	M4NYnhwkWfDJA/B9yugVgoQsVddgioqUiPvWTKquE6rdB2moWxFzBdMkfWTyRzNZitNxHSmI3lnAI
	k26vh00w==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqk-00000004hZR-0OjL
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:38:40 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71df8585a42so2704484b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427115; x=1729031915; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UgKthNvwCJdtX42RjeHROfs17OIsFbY3pdtzFTA+rQ=;
        b=EsaNq1ZFvVT3LvoyYuy6L0Jn39K2haAEDi8RK/9rGyGBxEcEwn1iedd6qcEKcvjGdS
         HPQYyR4b3wWHtTgo49LPSBcxcfEnhL6pNim23TVgqz04Tgq+L36C/P9B60Nnvz9Td/oR
         VfkzejIFLBCNVQVr7M03ApvsTj4cu1BcqgekaHuMTVF2cOSCzC4GQ94viGh+susgKna6
         PYqS4m0EgxiVCzH4ngMsn+YVv7H4IPhJSKoupvybCNgK6+EQ4Hkm9ERmCoK0WfnXPLHT
         NeEG+oHr4/mv+avA+fHbusc+95MXZJC6At9ahPnkuidtJ2qJT2SKPejbV3H/Zqig4grm
         3k6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427115; x=1729031915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UgKthNvwCJdtX42RjeHROfs17OIsFbY3pdtzFTA+rQ=;
        b=YA2i7XtdmMiE6XfGsYbwNBKF15RMZDiQTNlXuYEalX9mPA1vivM/QhYRi06uWd35PW
         AEKCfVV2W5rAFn/Xn/nqI5ULv1QvEXXceBSuTqC7lRVE+kWaMhcCOtJ9QkNjFW176Szg
         WKTP/DY0LhHmtjHBw6OfvSzF69e5Y/RW5GzJ99F1ay0RsFiVvxAP8DaJFHH/eJcdowc0
         c8AAWfp842OeKr9B9h7fA9S3Il3iWH5HZvCtR5b9jFVRbKsvsxh/hWFHvzXxWaIAD2K5
         H39xwhMOpYtbKN7imPkZma13pSFWF9VDprNpIldWK+rWtuWqej2N9hu9nTYPNGiTOT8D
         HdYw==
X-Forwarded-Encrypted: i=1; AJvYcCX4ES0EY67Ay/zPSmPVC9ydRH8DNtmiRcCnQJsOf25DP71JHorxgLO84XxOPeg4doP/lxlS94SrFgbQ7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YynQdsCj9eAqc3Mt4FngNm6Lgs02wtW85P/sddDIjqbi83Kj7xT
	H1PNl8//Nv8y9csXKcWD/NVnfKdiywJWTTG68ePSgWNNiguUklMAiHrhu3ISTjc=
X-Google-Smtp-Source: AGHT+IGY6A1n9vb88kLWbxlmOlKkbeCFyOVTdVthRp7tlV6ruNsdclzAw5LAouQ/eSKzZkmvFgjuWw==
X-Received: by 2002:a05:6a00:8d0:b0:71d:fe40:7e68 with SMTP id d2e1a72fcca58-71e1db647efmr649067b3a.1.1728427115200;
        Tue, 08 Oct 2024 15:38:35 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:38:34 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:36:59 -0700
Subject: [PATCH v6 17/33] prctl: arch-agnostic prctl for shadow stack
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-17-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241008_233838_500755_A667FB81 
X-CRM114-Status: GOOD (  20.38  )
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
