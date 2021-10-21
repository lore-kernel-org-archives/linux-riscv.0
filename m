Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1A7C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 16:51:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA0DC613A1
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 16:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA0DC613A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+1EYMdoend9DJ9sA2ToJaqBW65Ghy51qOdg6kM9wg04=; b=1CaGpqwkYOWtBX
	WBwfcP5OnTC9iv9a2k3UMy8HhBYNAmZzt6r6KTU7RaITYhc2qefgKX7ErUZjdd5Rtuf2qDmjyPWH7
	CyWKDvB8lVBTyr1gsVwn0r+Gg8AIm3K6jYlVCBQd7L0sDuPxQrSfAR68whOvxdd2dk6rJ4VJi5Bmb
	RQZA9yb828SimnrmBmsfSE7m6CVcXGCEkk7zsSZP9CucqN+Zy0EMv2+VJcMUpf4ZwOgxH2dgtRKkf
	d+yk0REvxMuW5Py42zR0q0hK7ULp0CeJ37l18zVlE+OKSV669yhPlRTeNRFfBzZRKrw/JguLwhtlW
	dHazEvZfurWciUmHmnDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdbIF-008QHv-3V; Thu, 21 Oct 2021 16:51:51 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdbIC-008QFT-5x
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 16:51:49 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso992748pjw.2
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 09:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=utoy+jQZzvRnzA1QWeuCmlU/QiIEQT6LKCT7U63qum8=;
 b=x8/aeoXyTGmp//1afH0+pe+lHvlkIprY9l6+jEEMrD9x/aw8fI1lNPBwex0dW1q0hF
 6GWTNfl5PefzN5QSEjiNqb/NkgWKFVXxiAY24Z2ttZN+NSPZ8ecr48c9Ep2zOFA85kDF
 PRsXpmhyhbo4GsT2Xgf9iifyDaB7045MsUQlaKHDqb5ggq8eKo9iEjG1N+5wbU11GJgn
 9DJz9SrYhm2cuzF7hXks8UUV1T26+6Ps4Qj8FNpsQdbnZzINWDMEhHcYWxNlggdJ2FqC
 qnICeOn9KcXcf9NyUo9mGy93lBg6SKTWkmiLpn0uW95FYEWmEeFVT0ytkGNohN0BKFAy
 NNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=utoy+jQZzvRnzA1QWeuCmlU/QiIEQT6LKCT7U63qum8=;
 b=Bv/iRyuJDN8Q566+P1dfg2/yPRiEeyt0uruxqJiaRoVqet66gal+DTDwEVAUYZzybT
 peg1q7ybNnKKAFVCj90OSNfiNSn5kRL3qjG3WNUCYZJzFBCt1j/pnymHdYr3UHWBN5Gq
 vKSPjzaCwnrfldizbtI0jpi+A2l+ThjH1/uJKivxXZ4zJ+L9S+sXhxbK1oOlTCo2OsGT
 FxRgKol3v70gH8wEOh2HX5L744RrvL7/1EUIk0saktIPb+DQ9UUULFhSfDjtZjE4Aolj
 HExlJXLpYAdJ1Kj2VGBJ1iywEp3IeKyYzla+WlCfSFMXMOh2jwd0+UUrNIDTeA/vraZ7
 ITtQ==
X-Gm-Message-State: AOAM530+faKEG09uT60QTIswOXUtz924515nV7EU/MoWWkquG3Ga6VWc
 L3usFJbfcPhoWtuuCvS7TUe1mQ==
X-Google-Smtp-Source: ABdhPJzPn1WnhmqY3wp2dc+1Jtbo+21IiUrqDsvcEMwzsRnJLaf4nWK/njw4aSEB0eHoBWNnGsJMGw==
X-Received: by 2002:a17:90a:2943:: with SMTP id
 x3mr7820076pjf.71.1634835104442; 
 Thu, 21 Oct 2021 09:51:44 -0700 (PDT)
Received: from vineetg-ThinkPad-X1-Carbon-Gen-9.ba.rivosinc.com
 (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id y4sm7553890pfa.90.2021.10.21.09.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:51:44 -0700 (PDT)
From: Vineet Gupta <vineetg@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Atish Patra <atish.patra@wdc.com>, Jisheng Zhang <jszhang@kernel.org>,
 Chen Huang <chenhuang5@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vineet Gupta <vineetg@rivosinc.com>
Subject: [PATCH] riscv: remove code for !CONFIG_FRAME_POINTER
Date: Thu, 21 Oct 2021 09:51:42 -0700
Message-Id: <20211021165142.444236-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_095148_250045_7607A937 
X-CRM114-Status: GOOD (  12.76  )
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

while frame pointer generates horrible code it is a necessary evil on
RISC-V as the only way to unwind stack.

In fact Kconfig unconditonally selects ARCH_WANT_FRAME_POINTERS, so
any code for handling !FRAME_POINTER is essentially dead weight.

And while here remove redundant setting of -fno-omit-frame-pointer as
this is enabled by generic code for CONFIG_FRAME_POINTER

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
 arch/riscv/Makefile            |  3 ---
 arch/riscv/kernel/stacktrace.c | 37 ++--------------------------------
 2 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index a0b8259c7098..a4329035c341 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -65,9 +65,6 @@ endif
 ifeq ($(CONFIG_CMODEL_MEDANY),y)
 	KBUILD_CFLAGS += -mcmodel=medany
 endif
-ifeq ($(CONFIG_PERF_EVENTS),y)
-        KBUILD_CFLAGS += -fno-omit-frame-pointer
-endif
 
 KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
 
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 315db3d0229b..63f471278401 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -16,13 +16,13 @@
 
 register unsigned long sp_in_global __asm__("sp");
 
-#ifdef CONFIG_FRAME_POINTER
-
 void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			     bool (*fn)(void *, unsigned long), void *arg)
 {
 	unsigned long fp, sp, pc;
 
+        BUILD_BUG_ON(!IS_ENABLED(CONFIG_FRAME_POINTER));
+
 	if (regs) {
 		fp = frame_pointer(regs);
 		sp = user_stack_pointer(regs);
@@ -65,39 +65,6 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	}
 }
 
-#else /* !CONFIG_FRAME_POINTER */
-
-void notrace walk_stackframe(struct task_struct *task,
-	struct pt_regs *regs, bool (*fn)(void *, unsigned long), void *arg)
-{
-	unsigned long sp, pc;
-	unsigned long *ksp;
-
-	if (regs) {
-		sp = user_stack_pointer(regs);
-		pc = instruction_pointer(regs);
-	} else if (task == NULL || task == current) {
-		sp = sp_in_global;
-		pc = (unsigned long)walk_stackframe;
-	} else {
-		/* task blocked in __switch_to */
-		sp = task->thread.sp;
-		pc = task->thread.ra;
-	}
-
-	if (unlikely(sp & 0x7))
-		return;
-
-	ksp = (unsigned long *)sp;
-	while (!kstack_end(ksp)) {
-		if (__kernel_text_address(pc) && unlikely(!fn(arg, pc)))
-			break;
-		pc = (*ksp++) - 0x4;
-	}
-}
-
-#endif /* CONFIG_FRAME_POINTER */
-
 static bool print_trace_address(void *arg, unsigned long pc)
 {
 	const char *loglvl = arg;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
