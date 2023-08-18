Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5A2C678DC
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 12:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AeLBbhrx3dLarPA+IlUlnjOqriwpi8fwqwDMw9inuv8=; b=W+6AP9m2X9HxOw
	2a6feevHOqM12OVaFTSgVJuIkwDBXU01gE/3nNw7j4NDSeLudl4MgRRo8vcXyLSV3Ra9b4jaf4HxW
	by9ZPvLZS1Y/ICdHtmFs1H5gM9vuyRsdU1xx9S7sYpdvmVqL3slYhWnpxTcDW6X1QuI8PlrIr7eTk
	jjMI00lQc1gmMQHxo3ioC77DGLEvtzwqjaaXFfigjtWGSdsvw46vwJEhLXvn96GKNP+Z7vJJU/wWy
	OMUSo3znM05scayfefzM7TwRmeOiNMkvSaT+/kmuCFAcd8kUqQ6XgUYoRLqpuNzkJrvGnCiIsoTeX
	br1YLbn8thi4V+xKRN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWyNs-0097Oz-05;
	Fri, 18 Aug 2023 12:15:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWyNo-0097Lq-2O
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 12:15:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bc8045e09dso6359065ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 05:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1692360914; x=1692965714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/dyI2aIGIKCS+ZmVg3JhQYksxtHh82fOupuo38dlFco=;
        b=WJTZfyNTTyTH4r4oeSt4AHZQzdZjWqFzUSzv9rj9D4OL0eNFBUvg1q8GzvR+jMXLC0
         vAsoDEw/aay4UHBLfG3N8NWRhmLEHBpMwvT4ICoqDh1HpDfYBLd55xn0cYBugh50lSCM
         0X7nFy2hhJxkPuUitdxBZpbnVaCisPN6Y3RlOZ3YY3a2u2Hkiags1SrL34WpS79tVgBA
         tMJMfBeeNbbEXLGKOC47uq7zdj1uhGLX0JUDvjuqoIyndOl8ycGINBS+bvJyUooXJpnL
         6Y4CkMA/JddL3++heZ7MxX82QHyPYPglIyAc6dUB2ShNqIcH0YiMclTxXurqnqoOVJWr
         uNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692360914; x=1692965714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dyI2aIGIKCS+ZmVg3JhQYksxtHh82fOupuo38dlFco=;
        b=OH/xYVXkkjIvic6dzU7Fu9Ej1j3QaMgwNkmvONj6aqsHejVUl782o9N0OrgfE68sMq
         NOiZqKjoqCEiEUoLzvAon7sP44xYEKOdKFcTUkSayTZ21RAznBf+G9DtAVlMLgzEWNNc
         PWM5/NyrzozEiSXmZbGyCSSgg5k9Q8DRRnuhHbzBtKItruNOdC8R5TkLOZGTwPR/8TsH
         RR92iYtl7zRt5CUKPWf2fRFCP9wsECQNsjaVEzWr6dJ9c8wVbB/4g+CxQuXO8XNvBJJr
         K5NXPdQCTHQJR+bSCVGkFGNgHVajKF5rDZxXyuGbP3gZUJ31XnQ/OfSU9O44uxDDM+4v
         x0lg==
X-Gm-Message-State: AOJu0YwxTkb1VrI1nL604WFO9qTo0bVZ0bIDfz2MUcBedGahLum7NJpu
	Z23qypZ1d6/xzrxbw6aPHYXHOw==
X-Google-Smtp-Source: AGHT+IF4x0l2vVL+nxG6H5cavkuZZmm71zaxUrKPLSw9GFclzVfkj4quozYKMB8junpaZOjML9YJ4Q==
X-Received: by 2002:a17:90a:b017:b0:268:fb85:3b2 with SMTP id x23-20020a17090ab01700b00268fb8503b2mr2114803pjq.7.1692360914619;
        Fri, 18 Aug 2023 05:15:14 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.248])
        by smtp.gmail.com with ESMTPSA id js4-20020a17090b148400b0025dc5749b4csm3137540pjb.21.2023.08.18.05.15.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 18 Aug 2023 05:15:14 -0700 (PDT)
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
Subject: [PATCH v4] riscv: add userland instruction dump to RISC-V splats
Date: Fri, 18 Aug 2023 20:15:04 +0800
Message-Id: <20230818121504.60492-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_051516_781540_7E1B5CC1 
X-CRM114-Status: GOOD (  12.28  )
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
 arch/riscv/kernel/traps.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f798c853bede..69b5d18b5ae9 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -33,7 +33,24 @@ int show_unhandled_signals = 1;
 
 static DEFINE_SPINLOCK(die_lock);
 
-static void dump_kernel_instr(const char *loglvl, struct pt_regs *regs)
+#define get_user_nofault(val, ptr) ({				\
+	const typeof(val) *__gk_ptr = (ptr);			\
+	copy_from_user_nofault(&(val), __gk_ptr, sizeof(val));\
+})
+
+static int copy_code(struct pt_regs *regs, u16 *val, const u16 *insns)
+{
+	if (!user_mode(regs))
+		return get_kernel_nofault(*val, insns);
+
+	/* The user space code from other tasks cannot be accessed. */
+	if (regs != task_pt_regs(current))
+		return -EPERM;
+
+	return get_user_nofault(*val, insns);
+}
+
+static void dump_instr(const char *loglvl, struct pt_regs *regs)
 {
 	char str[sizeof("0000 ") * 12 + 2 + 1], *p = str;
 	const u16 *insns = (u16 *)instruction_pointer(regs);
@@ -42,7 +59,7 @@ static void dump_kernel_instr(const char *loglvl, struct pt_regs *regs)
 	int i;
 
 	for (i = -10; i < 2; i++) {
-		bad = get_kernel_nofault(val, &insns[i]);
+		bad = copy_code(regs, &val, &insns[i]);
 		if (!bad) {
 			p += sprintf(p, i == 0 ? "(%04hx) " : "%04hx ", val);
 		} else {
@@ -71,7 +88,7 @@ void die(struct pt_regs *regs, const char *str)
 	print_modules();
 	if (regs) {
 		show_regs(regs);
-		dump_kernel_instr(KERN_EMERG, regs);
+		dump_instr(KERN_EMERG, regs);
 	}
 
 	cause = regs ? regs->cause : -1;
@@ -104,6 +121,7 @@ void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr)
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
