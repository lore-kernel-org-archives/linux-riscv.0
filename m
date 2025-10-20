Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BD5CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 18:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cP2yfawiqNq/4DGP47U5WoCBGFiHA8wHubkDe/A7NB8=; b=JiKhEtBZwRrheU
	fIQbs+0RX2UBc7Mb4/XjR38XTUH4ET2jnwv2Y7wCeksfVH9TKdm7sZ1ofE4B5oyQMJS94scPvtFdn
	FPkXf5OVgxnZVjrcws8wxfuBz/aiZL0eTanKPMRF8ZzPqzNAQ/S1yMXpRK9HyEGOJcMbzMolKzR2k
	LwN1R0YE8S02gLW/TCusyWTt1FuDh2zBRz2fqh3wHakba3gMU8F8vpLs6JlMB8Pc5Drbhq7TMXteZ
	NnVKWfiA7O5bNdXknVxGrA90ynB8mxOWW0KxoSo+WBO28j9S+HttPM7B+6H+bOlbOpYzucK7qPDro
	Nn5pfaoLSmQ2T1YH1QCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuTB-0000000Ebnh-2E0e;
	Mon, 20 Oct 2025 18:18:57 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuT8-0000000EbnB-3qas
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 18:18:56 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so4220178b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 11:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760984334; x=1761589134; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J3wXXjw9bzD6MPVLbQ5doCpWIDPvan0gGJzfGLwRl50=;
        b=J4WndqYjb8T82ac+oXrgcNBKC8VwBEN+LsLXjH+2Dso6amDzU26V9Lzs1IiqCRkY03
         ZU6dVqjrm5/efku/dfemcf9U+0YcO/+e9eBeFEy7B6/t7S0MARtPxJoS6g4oDcxcx7Cp
         V6Omv7zwny+jP9KRz3TcJsDxyForiqVMtl8RvDcrRSB4fapC8/cnAJbXrGZJJiM3H70J
         neTUakL9wDK5NHEvVNtNEWee17oclgpSc9sdyo0t0nJl0QI5KBSRxLslKqIbhW1SkTIv
         lb1tHjsM4Ib9LHAox5ScTUobqZczgGHTSbQpHeKJUZeQFPii4XwoOoRj+57QvQAeV4K8
         H7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760984334; x=1761589134;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3wXXjw9bzD6MPVLbQ5doCpWIDPvan0gGJzfGLwRl50=;
        b=Hrymb5bRMsjxkP5c6ZSctEePrN5t3Y2gbZXBoqZrrnFyWnarnK3ttrPs9np0hUrUCp
         bGFTORInvtvR7rnfdCqb7cFxCCTqVtNiEQ6wVq7yyzGegbSyqqvpSsQ7vbd3xmjwXh2a
         GbEjJqfwHNk4qzcXbMaWO+Iiw+taeyw0YxMyDGZXMOsXivVkpSKq0km/Q1J1SaRYXfFQ
         mZicf19TlmkcyucKgGOtvsJsAjQuVdRLTN5wVjfE+upWtVY0Q3gXnErceEY8hmJy7kuC
         otgQXuPEWud7jq/RjAkU49Vs4VQhp8hD1ZjFi5Px234f2cEkBSKQHw4pUMNokTc8uCiI
         3DTQ==
X-Gm-Message-State: AOJu0YyQ+CkxooqEu6Ks8Rq/e2pblPLi7XM4qnK2Y1kv+GvEPs4lNKVz
	INCq4xeRwnZt8yzvCMkcUwE2FbOPPND6Dq029Gi0qFs4HBdhDbLM9XC2NWspcyHTZfI=
X-Gm-Gg: ASbGncsJJwLoO9+U7EJpd2kmqWiwH2Mi/IYIdeutSy3jY1XHRMLfWBWI3vAU52M4R2I
	DwbYFe0p/QzsMA2KshdvfC5BEArMFkrTkNjiHZkpBiOi9L+gMLMBHxH0uBNO+XfAqLBh8g2/v3K
	M0ALb2sPc0KskQK9KGUsCZNNByvMImA8cMNI2jhA0oCMYqLMgPu5yLpEg2pZnoFLTyTgih6+uPG
	/ry54E91KFGj0T0ZHeD059ARVd3kdyTgt8lkpestR7ayIYX9zTXEJnfMt8Iuono2GmBnocP2X7l
	TBa30fSLK8k++WmprUNtTfPqO+H+ceoXZ6MvaiEUtmLJ1k2ZVNuj6hU1mW5RbQflXb1fxj/IOZR
	a1looBUjRGBQWaosf/tdWtLafQw0QAi3UsD9PGCVhiar19X0V7XRDgsn3FgcSueJHDn5lM9RCAn
	T42ATgCBkk7PWwn77cN6Ft
X-Google-Smtp-Source: AGHT+IGTvGMOz93bZ6gvLfbDW2Z5HUTn/LhD3gZSIqP3hEuhNTUpAhz52wVhznRHxX8oqUHCbXBsgg==
X-Received: by 2002:a17:90a:d406:b0:32d:e027:9b26 with SMTP id 98e67ed59e1d1-33bc9d1a8e6mr20155181a91.13.1760984333589;
        Mon, 20 Oct 2025 11:18:53 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5df93591sm8775752a91.17.2025.10.20.11.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 11:18:53 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 11:18:52 -0700
Subject: [PATCH RFC] arch/riscv: add proc status (proc/<pid>/status)
MIME-Version: 1.0
Message-Id: <20251020-proc_status-v1-1-59d2c8ccd4f0@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAAt99mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Nz3YKi/OT44pLEktJi3ZQ0w8TUlGQL02TzZCWgjoKi1LTMCrBp0Up
 Bbs5KsbW1ABchsmtiAAAA
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
 alexghiti@rivosinc.com, cleger@rivosinc.com, zong.li@sifive.com, 
 heinrich.schuchardt@canonical.com, valentin.haudiquet@canonical.com, 
 jesse.huang@sifive.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_111854_964138_F5EC5CC6 
X-CRM114-Status: GOOD (  13.51  )
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

x86 has proc/<pid>/status to see various runtime characteristics
of running task. Implement same for riscv. This patch implements
status for shadow stack and landing pad state.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
This is just a one patch but sending it as RFC with cover letter to seek
feedback. x86 has `arch_proc_pid_thread_features` to enumerate status of
arch thread specific features on runtime. This can be done using prctl
as well but from quick/script perspective `cat /proc/<pid>/status` is more
desirable. In this patch, simply `arch_proc_pid_thread_features` is implemented
for riscv which queries shadow stack and landing pad state and reports back.
Thus it is dependent on riscv user cfi enabling series.

If this patch itself is self-standing and good enough, I can roll this patch
as part of riscv user cfi enabling series.

OR

If there is ask for other riscv thread specific features that could be
enumerated in similar fashion, we will need it to be done as separate series
(with `thread_features` added to `thread_info`)

Example output below.

Name:   cat
Umask:  0022
State:  R (running)
Tgid:   133
Ngid:   0
Pid:    133
PPid:   129
TracerPid:      0
Uid:    0       0       0       0
Gid:    0       0       0       0
FDSize: 256
Groups: 0 10
NStgid: 133
NSpid:  133
NSpgid: 133
NSsid:  129
Kthread:        0
VmPeak:    10788 kB
VmSize:    10788 kB
VmLck:         0 kB
VmPin:         0 kB
VmHWM:      1400 kB
VmRSS:      1400 kB
RssAnon:             116 kB
RssFile:            1284 kB
RssShmem:              0 kB
VmData:       92 kB
VmStk:      8324 kB
VmExe:         4 kB
VmLib:      2312 kB
VmPTE:        40 kB
VmSwap:        0 kB
HugetlbPages:          0 kB
CoreDumping:    0
THP_enabled:    0
untag_mask:     0xffffffffffffffff
Threads:        1
SigQ:   0/31771
SigPnd: 0000000000000000
ShdPnd: 0000000000000000
SigBlk: 0000000000000000
SigIgn: 0000000000000000
SigCgt: 0000000000000000
CapInh: 0000000000000000
CapPrm: 000001ffffffffff
CapEff: 000001ffffffffff
CapBnd: 000001ffffffffff
CapAmb: 0000000000000000
NoNewPrivs:     0
Seccomp:        0
Seccomp_filters:        0
Speculation_Store_Bypass:       unknown
SpeculationIndirectBranch:      unsupported
Cpus_allowed:   3
Cpus_allowed_list:      0-1
Mems_allowed:   1
Mems_allowed_list:      0
voluntary_ctxt_switches:        0
nonvoluntary_ctxt_switches:     3
riscv_thread_features:  shstk_enabled lpad_enabled
riscv_thread_features_locked:   shstk_unlocked lpad_unlocked
---
 arch/riscv/kernel/Makefile     |  1 +
 arch/riscv/kernel/cpu/Makefile |  1 +
 arch/riscv/kernel/cpu/proc.c   | 28 ++++++++++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f60fce69b725..b32c11667d81 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -71,6 +71,7 @@ obj-y	+= vendor_extensions.o
 obj-y	+= vendor_extensions/
 obj-y	+= probes/
 obj-y	+= tests/
+obj-y	+= cpu/
 obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
diff --git a/arch/riscv/kernel/cpu/Makefile b/arch/riscv/kernel/cpu/Makefile
new file mode 100644
index 000000000000..2b474fb49afe
--- /dev/null
+++ b/arch/riscv/kernel/cpu/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_PROC_FS)			+= proc.o
diff --git a/arch/riscv/kernel/cpu/proc.c b/arch/riscv/kernel/cpu/proc.c
new file mode 100644
index 000000000000..4661190c43d1
--- /dev/null
+++ b/arch/riscv/kernel/cpu/proc.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/smp.h>
+#include <linux/timex.h>
+#include <linux/string.h>
+#include <linux/seq_file.h>
+#include <linux/cpufreq.h>
+#include <linux/proc_fs.h>
+#include <asm/usercfi.h>
+
+#ifdef CONFIG_RISCV_USER_CFI
+
+void arch_proc_pid_thread_features(struct seq_file *m, struct task_struct *task)
+{
+	seq_puts(m, "riscv_thread_features:\t");
+	if (is_shstk_enabled(task))
+		seq_puts(m, "shstk_enabled ");
+
+	if (is_indir_lp_enabled(task))
+		seq_puts(m, "lpad_enabled ");
+
+	seq_putc(m, '\n');
+
+	seq_puts(m, "riscv_thread_features_locked:\t");
+	is_shstk_locked(task) ? seq_puts(m, "shstk_locked ") : seq_puts(m, "shstk_unlocked ");
+	is_indir_lp_locked(task) ? seq_puts(m, "lpad_locked ") : seq_puts(m, "lpad_unlocked ");
+	seq_putc(m, '\n');
+}
+#endif /* CONFIG_RISCV_USER_CFI */

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251017-proc_status-df1aedc85c7c
--
- debug


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
