Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AE4C74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 08:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bt5qsu8wQ9G0k/0eYlLuM5PS+ty7kKNmLLZjq4C4wsU=; b=sMFbBRMM//Ch1A
	TvVyuLzT1vIDPt9VEckgHStO1wGgIdg3cwxyWq+6SnjYwo2yrosEiAA7EA/SxMj6ueIaDj5WZLJ9U
	FzA+g3yOXyZNZ2rBLduxIBUdpbZyqWalFeIcumSeEtga79Qe5PziT+2dLQgEFX2UXaS1OkkOpfOqR
	uSqz4gP9uQwTYHWTMVsxQlQBj9LpwcL51IvTQikAcSdl9RNsdEoYcVpdXtGv+EBZ82L4jPYCBnkoz
	JfLRF7SBPshlZdnHTdUAgw/gQOELrWnV53TmQ2/1ElWWx4dUjEnwlEL13JklDT4/41/18O58xdQ1I
	8DTcnUpX7j/ZVmZPp7eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phRCZ-00H7Ev-0u;
	Wed, 29 Mar 2023 08:30:39 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRCW-00H7EF-2S
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 08:30:38 +0000
Received: by mail-pg1-x52b.google.com with SMTP id z18so8782854pgj.13
        for <linux-riscv@lists.infradead.org>; Wed, 29 Mar 2023 01:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1680078634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=C1Or5bDbG7pY6oTZ/LXhOi2Wc2GzPwk9E7MW4Vddhkk=;
        b=SMOY6yF468+WcCeHsXCJ8Fzv6o84CIyGjKt/mmVuvvhHoiXzjAhLUoCc7MScSHQ4NS
         HcerTmICPy7F4FO9iZP+qItxyFMVyUTZGvTFkJ6/gpLuW5NTaKIoI/NxA7jKCDXVq2R/
         tvP40V5+Zmp3CLAeCjvXam/Bs+GOpGSwxFvyHAKWecLY/1br165z3TVhZ2YLAztyTX6I
         meV8hu/SI7c9TK9MDfnKEnekGew324t92Dem0pYNqC2dw57a9PT9LE765sKY34mmPQaz
         PpOF24nILD9MCWaUK2FhyqZokMtSsM2YT2UEAczTrVA92gopTzhGqE7Jk+/VEveo9PDD
         puaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680078634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1Or5bDbG7pY6oTZ/LXhOi2Wc2GzPwk9E7MW4Vddhkk=;
        b=qmfaNG1AyXxNawRDTsQSf3mIJ5v5mQZv5U8QlW8U1gPZWg7R7bceU+1i6ehVMBtcH6
         jQ50mQtHQcEogvZRcxvX0DOr1jBcu8CV1owXNKmMNEFpRP512dtSKZIxGASAPXwdCyU7
         gKNP1biEUIpFAMcVDvvlBy6GxNaJBDWwFtyN2Xh6a1IiQ7eymeCVIcfOHF2mE/pAO6Nb
         pyhkZq5FIs7wCuIDYkRWcEZksT0aGCymSSn4O5wede0wket+e/OtPgEUuZssWqowIZ+r
         tw5qjGAR752RfVonfKO8yl0zEt/eCUB5gNRb782UJHKlESe9RLB7OnfVe5atDKecfknN
         b9AA==
X-Gm-Message-State: AAQBX9eEFrrk6tC14O+BiwVWsBYylUFMsDxd/m0ZpHEW4mm7gB46iJJT
	bJbI6zBNCcSRwjMIuAWr9wgCqg==
X-Google-Smtp-Source: AKy350a/RT33ojzlmmiLVq9LXv3UGFykrkRXqZARMk0sJqJJmIIx1NaHDOg0tCERw2PtZt/2JjyiSA==
X-Received: by 2002:aa7:95a4:0:b0:628:cff:1440 with SMTP id a4-20020aa795a4000000b006280cff1440mr18379267pfk.28.1680078634640;
        Wed, 29 Mar 2023 01:30:34 -0700 (PDT)
Received: from PF2E59YH-BKX.inc.bytedance.com ([2408:8606:1800:501::1:3])
        by smtp.gmail.com with ESMTPSA id g11-20020a62e30b000000b006281bc04392sm845676pfh.191.2023.03.29.01.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:30:34 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor.dooley@microchip.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	peterz@infradead.org,
	mpe@ellerman.id.au,
	jpoimboe@kernel.org,
	mark.rutland@arm.com,
	svens@linux.ibm.com,
	cuiyunhui@bytedance.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	ebiederm@xmission.com,
	bjorn@rivosinc.com,
	heiko@sntech.de,
	xianting.tian@linux.alibaba.com,
	mnissler@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: Dump user opcode bytes on fatal faults
Date: Wed, 29 Mar 2023 16:29:50 +0800
Message-Id: <20230329082950.726-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.37.3.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_013036_803475_EF864FC6 
X-CRM114-Status: GOOD (  12.80  )
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

We encountered such a problem that when the system starts to execute
init, init exits unexpectedly with error message: "unhandled signal 4
code 0x1 ...".

We are more curious about which instruction execution caused the
exception. After dumping it through show_opcodes(), we found that it
was caused by a floating-point instruction.

In this way, we found the problem: in the system bringup , it is
precisely that we have not enabled the floating point function(CONFIG_FPU
is set, but not enalbe COMPAT_HWCAP_ISA_F/D in the dts or acpi).

Like commit ba54d856a9d8 ("x86/fault: Dump user opcode bytes on fatal
faults"), when an exception occurs, it is necessary to dump the
instruction that caused the exception.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/bug.h |  1 +
 arch/riscv/kernel/process.c  | 30 ++++++++++++++++++++++++++++++
 arch/riscv/kernel/traps.c    |  1 +
 3 files changed, 32 insertions(+)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..56dab998d05d 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -86,6 +86,7 @@ struct pt_regs;
 struct task_struct;
 
 void __show_regs(struct pt_regs *regs);
+void show_opcodes(struct pt_regs *regs);
 void die(struct pt_regs *regs, const char *str);
 void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr);
 
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 774ffde386ab..9ba9f8719605 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -83,6 +83,36 @@ void show_regs(struct pt_regs *regs)
 		dump_backtrace(regs, NULL, KERN_DEFAULT);
 }
 
+static int copy_code(struct pt_regs *regs, u8 *buf, unsigned long src,
+		     unsigned int nbytes)
+{
+	if (!user_mode(regs))
+		return copy_from_kernel_nofault(buf, (u8 *)src, nbytes);
+
+	/* The user space code from other tasks cannot be accessed. */
+	if (regs != task_pt_regs(current))
+		return -EPERM;
+
+	return copy_from_user_nofault(buf, (void __user *)src, nbytes);
+}
+
+void show_opcodes(struct pt_regs *regs)
+{
+	u8 opcodes[4];
+
+	switch (copy_code(regs, opcodes, regs->epc, sizeof(opcodes))) {
+	case 0:
+		pr_info("Opcode: %4ph", opcodes);
+		break;
+	case -EPERM:
+		pr_err("Unable to access userspace of other tasks");
+		break;
+	default:
+		pr_err("Failed to access opcode");
+		break;
+	}
+}
+
 #ifdef CONFIG_COMPAT
 static bool compat_mode_supported __read_mostly;
 
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f6fda94e8e59..892826234ee9 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -100,6 +100,7 @@ void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr)
 		print_vma_addr(KERN_CONT " in ", instruction_pointer(regs));
 		pr_cont("\n");
 		__show_regs(regs);
+		show_opcodes(regs);
 	}
 
 	force_sig_fault(signo, code, (void __user *)addr);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
