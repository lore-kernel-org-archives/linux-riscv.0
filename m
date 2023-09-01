Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFC6CA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 12:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SYWI0AZkAvp9ZEbagjNrjukPEwQ+lbx98h9z3/0dTAs=; b=CnE0XInBIyE85j
	EdZbJgFHCVCl9R+E8pAvKcIO353Ustp423UGSGMzZirTXS8wxf/rUVyToz5xIeI+AdP8E1qi4Lggg
	/FrCW9gNDIY9DK3JjhrxqeMG70v+vbrgn4DxcgIRjogAnU1Xub1y+v8bStKh3ayaQ2otUPKNED/zX
	LX0YTI05hQnm3Q7Qgv0g+JCDZ+/IUoKogyaFiB4gXY9y1AhMAodaztQONVNYy4wVAVTOtPqin8vBt
	aEvxmZw0hsoVqIB35botjLyU1cyyVQA6WGrr4Ntxq1VoWkW9KPZwRNkslhOFpu3cTKTWs4amEOaK5
	XHQv7Rp5MCFgiTFBrMDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3Rm-00HTY9-1m;
	Fri, 01 Sep 2023 12:40:22 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3Ie-00HQLp-0c
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 12:30:57 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-68a56401c12so1572488b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 05:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1693571455; x=1694176255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2OQC+A17dBwkV5biq6l7N28Il7bmSGqCXLaMTa2BoUI=;
        b=iB8ctvC9skXQHmqZSwz0iX8LFNhj9V5UL2gXSZgJzvYjDABWM/uHt97dyfS+PLKVss
         oepIMOPcK0C75RoRvG3QhG1Jt4SHJhqEFY7WxgSaLFXcC85j4MesX/SSVzSCwIPg3Od4
         pZTxk3REmFZB8s1XEkv/DceSAJYw72z3H0GXiD9CN1Q+QVz+TCsJRMgscub78gsPcN0+
         ysw0e9RdXVxyrw48Od1X7acUaQ74/u4tIKjSt8ppfnmL8LkESy+UkZzOX5kOHrUB9ARV
         DE7nPCCPpJ7eEXfu3TMPP/cWveIOWcP/UqWeXjlN95L3FQHDpuS+Jx6FNvc6PgXtd4go
         hmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693571455; x=1694176255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2OQC+A17dBwkV5biq6l7N28Il7bmSGqCXLaMTa2BoUI=;
        b=j+2XIIxONb0m9RsJEFdMHR72yYiZTheElbUYiNoeN3g+qwfgw1zLwKqMT3J+5rpIQt
         u4DqKHETld/qHTadUXx+QXC5eXItkYLhP7XHRFS3DLErnt13ld6UJ5cqPASoX9h8bgir
         1HWoAS7XAx3MVBvYphhHTf7ajmCfgNGs2PnumQNChBrCxTBa95Vcrccf8kgMK6kC6PZm
         cBt/YBIfLpTqeOsgM8IURULR5g+u8/cWSp21HC7oBYRTCPGMHVs6Td2BgBaqopjFPl8Y
         Gz/liV8fpEu4YmY/OE67RK58O9q/xxOKxwtuzGGbAJveZUxP6lokVjLk0KNIMYF4qdjV
         J/Rw==
X-Gm-Message-State: AOJu0YxILm8N46Sp0LpVaikFtCX6Uzd6GIPnSkOVJ9RRycspasYAXIz6
	XaKHp1ADjKhF/bO8CykimdNmIw==
X-Google-Smtp-Source: AGHT+IFpH9TYzbvlVnhSRXGMUYD2omRkS3XxiP6OjYn9bZEgjSIYmWkrlFuNTdgydF6T77aIplkZIw==
X-Received: by 2002:a05:6a21:3390:b0:147:fd40:2482 with SMTP id yy16-20020a056a21339000b00147fd402482mr2974232pzb.44.1693571454993;
        Fri, 01 Sep 2023 05:30:54 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id s19-20020aa78293000000b006889081281bsm2861184pfm.138.2023.09.01.05.30.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 01 Sep 2023 05:30:53 -0700 (PDT)
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
Subject: [PATCH v5] riscv: add userland instruction dump to RISC-V splats
Date: Fri,  1 Sep 2023 20:30:43 +0800
Message-Id: <20230901123043.73700-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_053056_494733_6BA791D9 
X-CRM114-Status: GOOD (  12.08  )
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
 arch/riscv/kernel/traps.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f798c853bede..923b49c38985 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -33,7 +33,19 @@ int show_unhandled_signals = 1;
 
 static DEFINE_SPINLOCK(die_lock);
 
-static void dump_kernel_instr(const char *loglvl, struct pt_regs *regs)
+static int copy_code(struct pt_regs *regs, u16 *val, const u16 *insns)
+{
+	if (!user_mode(regs))
+		return get_kernel_nofault(*val, insns);
+
+	/* The user space code from other tasks cannot be accessed. */
+	if (regs != task_pt_regs(current))
+		return -EPERM;
+
+	return copy_from_user_nofault(val, insns, sizeof(*val));
+}
+
+static void dump_instr(const char *loglvl, struct pt_regs *regs)
 {
 	char str[sizeof("0000 ") * 12 + 2 + 1], *p = str;
 	const u16 *insns = (u16 *)instruction_pointer(regs);
@@ -42,7 +54,7 @@ static void dump_kernel_instr(const char *loglvl, struct pt_regs *regs)
 	int i;
 
 	for (i = -10; i < 2; i++) {
-		bad = get_kernel_nofault(val, &insns[i]);
+		bad = copy_code(regs, &val, &insns[i]);
 		if (!bad) {
 			p += sprintf(p, i == 0 ? "(%04hx) " : "%04hx ", val);
 		} else {
@@ -71,7 +83,7 @@ void die(struct pt_regs *regs, const char *str)
 	print_modules();
 	if (regs) {
 		show_regs(regs);
-		dump_kernel_instr(KERN_EMERG, regs);
+		dump_instr(KERN_EMERG, regs);
 	}
 
 	cause = regs ? regs->cause : -1;
@@ -104,6 +116,7 @@ void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr)
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
