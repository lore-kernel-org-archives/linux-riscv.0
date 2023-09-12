Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCC8CA0EC3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 02:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L4mriFLNQcbUMrGbOKnpAzpu69DIxfDs/BqqTH3hW5o=; b=lMclj4fdL7YokC
	xF/EO06DxGqx3NY+YF1mTuPjVleWwRd5mfk6EZpx7zBudcIhsM9qX+EAIsg97L1gcd1tC5gCPwDjM
	Nhu47RUCfO4YepMixk13uu6vekO6gEmKTb/euxHlQgK94rmhWsgxI58mMkwkpmPsqEI9AasRjBZpe
	3+c2YE5wEa9OQhjPXBWennAx91C3ZaPhbAc28XR5eq7GNrKsupfNRwX55M3qEytaDy8oDnju/iWiW
	SAv2wChbcd2RBjmbCjwoJO2a1wVWWK6PqFdyqVW26raZLuWZ+kySTzv7pPJDEfevAxznOit/R82FV
	P4OxS/tXcipPjBboQzNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfsuw-001spk-1V;
	Tue, 12 Sep 2023 02:14:18 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfsuu-001soK-0I
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 02:14:17 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-68fbd31d9ddso1345964b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 19:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1694484855; x=1695089655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMdI++gNYIzHXCNz0NYasP3u8jZS+14rJqhqLVImQDs=;
        b=I3HBom/bhjMxLVALIrvY4fkmYj+El6GNDFOLE69yrh9NF4UAgndb96EaCzoawtM4eU
         jIpmGunlckFCPQWmGMgag0WYALSO1rcO7WQNjXKfIRsxKfJVAf3nvDXMMR5pgvfBfiRM
         VxsDJWyKHBa1dnkkowvuArutAi8HRWan1Vp6Za5uYXYJ5HI05sKlCZeV9vaSGkoqwOU2
         LN6AyQQeMzXs0vR6SgfZwhXzuBChgaRaVAE5Zca1ZbJ8t1X3KtTywmF7t1S5N5V/NZpm
         dkvVubINbm+wj8NQekwcrZVXX3MAvMr6lJqV2SZvmYd1L/9s60L5vwdgPY8epr2Q/cKb
         1c6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694484855; x=1695089655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMdI++gNYIzHXCNz0NYasP3u8jZS+14rJqhqLVImQDs=;
        b=UgJkf39khkedzIqPvV3Xc3OrtTYw8V0R5ZaQVaFdtMFikIT6xuPyoDVtlFP6RtcTS2
         tH8XkEle0NalQMk6G+Coi/SpEpnU+QhIkMCGoioC32FUhf4ZSZ5dCRZh0Bj7ww4aQ2pX
         AKNEg+3fTvZ2btUqeTO5XSQQ/e4k+rBXI5KBI2FWJvapUfjnBue5UtNHR7gXcgnefzZp
         aBJx61kvI9220EK+YBCi0C+Zu3s/Cah71hu9uBRHB6KUQT/21sj60TMqD0qYOXRrjRkG
         4jKSa7H+YeIS+Icrb8EzKmbhK+WwZwd92XC2Guq3AFlKHA8C2Vp9b3kk1wLQzJkrS8aB
         c4AA==
X-Gm-Message-State: AOJu0YzEkAi6RVn0a3a2A6FM+PLlr3Tw6QZ32oViGlXMimGb8Q5h4x0w
	Ors0kqEmPidIK/aK/Ks41w5D9w==
X-Google-Smtp-Source: AGHT+IFJ8bD5SV0c6ZwDJS8oPfnvL8ApGejDumlH0l8Gj0ZH3x4lpjB48U9RQa+O95ArOwni7dQVDw==
X-Received: by 2002:a05:6a00:4395:b0:68f:e0c2:6d46 with SMTP id bt21-20020a056a00439500b0068fe0c26d46mr1952828pfb.23.1694484855307;
        Mon, 11 Sep 2023 19:14:15 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id e17-20020a637451000000b0055387ffef10sm2991543pgn.24.2023.09.11.19.14.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Sep 2023 19:14:14 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	guoren@kernel.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	jszhang@kernel.org,
	andy.chiu@sifive.com,
	cuiyunhui@bytedance.com,
	dave.hansen@linux.intel.com,
	elver@google.com,
	glider@google.com,
	cyphar@cyphar.com,
	kirill.shutemov@linux.intel.com,
	keescook@chromium.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6] riscv: add userland instruction dump to RISC-V splats
Date: Tue, 12 Sep 2023 10:13:49 +0800
Message-Id: <20230912021349.28302-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_191416_130465_235112B1 
X-CRM114-Status: GOOD (  12.37  )
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

Add userland instruction dump and rename dump_kernel_instr()
to dump_instr().

An example:
[    0.822439] Freeing unused kernel image (initmem) memory: 6916K
[    0.823817] Run /init as init process
[    0.839411] init[1]: unhandled signal 4 code 0x1 at 0x000000000005be18 in bb[10000+5fb000]
[    0.840751] CPU: 0 PID: 1 Comm: init Not tainted 5.14.0-rc4-00049-gbd644290aa72-dirty #187
[    0.841373] Hardware name:  , BIOS
[    0.841743] epc : 000000000005be18 ra : 0000000000079e74 sp : 0000003fffcafda0
[    0.842271]  gp : ffffffff816e9dc8 tp : 0000000000000000 t0 : 0000000000000000
[    0.842947]  t1 : 0000003fffc9fdf0 t2 : 0000000000000000 s0 : 0000000000000000
[    0.843434]  s1 : 0000000000000000 a0 : 0000003fffca0190 a1 : 0000003fffcafe18
[    0.843891]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
[    0.844357]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000000000
[    0.844803]  s2 : 0000000000000000 s3 : 0000000000000000 s4 : 0000000000000000
[    0.845253]  s5 : 0000000000000000 s6 : 0000000000000000 s7 : 0000000000000000
[    0.845722]  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
[    0.846180]  s11: 0000000000d144e0 t3 : 0000000000000000 t4 : 0000000000000000
[    0.846616]  t5 : 0000000000000000 t6 : 0000000000000000
[    0.847204] status: 0000000200000020 badaddr: 00000000f0028053 cause: 0000000000000002
[    0.848219] Code: f06f ff5f 3823 fa11 0113 fb01 2e23 0201 0293 0000 (8053) f002
[    0.851016] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/traps.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f798c853bede..bd2e8fa25c43 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -33,7 +33,21 @@ int show_unhandled_signals = 1;
 
 static DEFINE_SPINLOCK(die_lock);
 
-static void dump_kernel_instr(const char *loglvl, struct pt_regs *regs)
+static int copy_code(struct pt_regs *regs, u16 *val, const u16 *insns)
+{
+	const void __user *uaddr = (__force const void __user *)insns;
+
+	if (!user_mode(regs))
+		return get_kernel_nofault(*val, insns);
+
+	/* The user space code from other tasks cannot be accessed. */
+	if (regs != task_pt_regs(current))
+		return -EPERM;
+
+	return copy_from_user_nofault(val, uaddr, sizeof(*val));
+}
+
+static void dump_instr(const char *loglvl, struct pt_regs *regs)
 {
 	char str[sizeof("0000 ") * 12 + 2 + 1], *p = str;
 	const u16 *insns = (u16 *)instruction_pointer(regs);
@@ -42,7 +56,7 @@ static void dump_kernel_instr(const char *loglvl, struct pt_regs *regs)
 	int i;
 
 	for (i = -10; i < 2; i++) {
-		bad = get_kernel_nofault(val, &insns[i]);
+		bad = copy_code(regs, &val, &insns[i]);
 		if (!bad) {
 			p += sprintf(p, i == 0 ? "(%04hx) " : "%04hx ", val);
 		} else {
@@ -71,7 +85,7 @@ void die(struct pt_regs *regs, const char *str)
 	print_modules();
 	if (regs) {
 		show_regs(regs);
-		dump_kernel_instr(KERN_EMERG, regs);
+		dump_instr(KERN_EMERG, regs);
 	}
 
 	cause = regs ? regs->cause : -1;
@@ -104,6 +118,7 @@ void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr)
 		print_vma_addr(KERN_CONT " in ", instruction_pointer(regs));
 		pr_cont("\n");
 		__show_regs(regs);
+		dump_instr(KERN_EMERG, regs);
 	}
 
 	force_sig_fault(signo, code, (void __user *)addr);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
