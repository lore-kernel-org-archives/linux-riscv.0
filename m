Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA48C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sB5REbYZXG7Ri07ovz1XZ0J2zp4BULEungcfGc45uVE=; b=V1iSZb7PBVcEsJ
	I4+JN2x0zEQxQYbvY+HsHIRA+PYJ2OgsNVwXVmEos2Q9xwpXL5Nhixy/1uwUnxGwlNo0Oldcw68zI
	01LN4aJEDp2gFuBgkAy7/Hv+v0P5VCjUNWDxy/tLcS/Nf92AX84RQ1fTuXBaqsjKNWdBaCOOfB352
	H1lDz5nqf1IxsWt5hjcajj/PQjIUQ0vqwhs/8zFOFAiO5jG5497sleoy+GPNeRWl/Ab1jCnrkhRav
	aUdPdUJ/4sXOn3H8WyKywi1BqAyrb/3I/F3/HGEKQlG9HZRsgauoiVC5R3d/e46cN4h0mIWEDEUys
	4UHH8MZFzVfzjGQzgWMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9UBi-00FSNm-N3; Mon, 17 Jan 2022 15:44:54 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9UBg-00FSMS-9n
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 15:44:53 +0000
Received: by mail-qv1-xf35.google.com with SMTP id iw1so18819415qvb.1
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jan 2022 07:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MY35t/sGCjknDi4hTsrGfNGKuQt3p93XQ6aOci+nLL4=;
 b=g9wm8Lw3WVrky+tnBekhR0ffK8hd+/1w60cTe4CcaydzdS+dZwVEMaRlfS/R9iwVSL
 X7l3VVQFlPOrM2Y74lgnlrBHlCXFNxkDL5lYCAOeIBCEZZPTVOrm+6b4e8hJKC+BZsgW
 Fw018n91TCf7bvIAKXTjaAEFGR3A/tkburZFWwlAoJAF8BmguCRfwnQytUzxRqNYW1VI
 OimsBZ3RP0f+5sRtUnqbpL2WNukFEePmkZTDzYenjwFLOMBssGm7WrXh9Y8dropYpV+r
 ysbpfqveYeYwwbt6CAM/sZP9z+lOHh6z9HQ0sNA6lUTMGZ32OG/zKmAjcsZmQWQJiGU8
 I2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MY35t/sGCjknDi4hTsrGfNGKuQt3p93XQ6aOci+nLL4=;
 b=tZvnOZxm8zVHKicb4v+d27a3GIZoBRdgPH0dZhlneiglGOr4KNoEIsjJ39ZJsCVe9H
 xghvNANAM12f2SE1rTA+p3bQSYdlaN01xvS2W59eEI5yRI9ux0+iLFFW1LsBsEFWNe89
 alq+G/IxfeFhVhwb9IeCVL2Z7haQc7RTdQnfz4GJ+LHqQMA1lmy1tzXqGSaPtzNE+ut5
 A92h9rBjREmfsGwnGKecYy8/VjzE9+qeFRM/JEapshp7X9gh2ZHPMOvFF1hcNvImuthD
 8VrvL2gU25HKQVKY6whe3AZl6zLgEbXo+QMim5Hd59q1HSdb0w4/8KiLRMZkOjRqzUBR
 l9rQ==
X-Gm-Message-State: AOAM530Fclo80NKt87yxSw0wWWRzwme1G045dphlbih/aBeH1wPwpKKQ
 nVP8lVB3xgfuOlKlqpINCeI=
X-Google-Smtp-Source: ABdhPJxYJuBxBWIneGwnFame4xgpvZ9ADMOTgUdeh8A+Ln+EBHDhdY9snDS+9CwOmALjfmUUbnAdUA==
X-Received: by 2002:ad4:5e8b:: with SMTP id
 jl11mr18704294qvb.128.1642434291010; 
 Mon, 17 Jan 2022 07:44:51 -0800 (PST)
Received: from WRT-WX9.. ([207.246.89.135])
 by smtp.gmail.com with ESMTPSA id h7sm8857551qkb.109.2022.01.17.07.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 07:44:50 -0800 (PST)
From: Changbin Du <changbin.du@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Changbin Du <changbin.du@gmail.com>
Subject: [PATCH] riscv: eliminate unreliable __builtin_frame_address(1)
Date: Mon, 17 Jan 2022 23:44:33 +0800
Message-Id: <20220117154433.3124-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_074452_371624_1D5C55D5 
X-CRM114-Status: GOOD (  16.19  )
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

I tried different pieces of code which uses __builtin_frame_address(1)
(with both gcc version 7.5.0 and 10.3.0) to verify whether it works as
expected on riscv64. The result is negative.

What the compiler had generated is as below:
31                      fp = (unsigned long)__builtin_frame_address(1);
   0xffffffff80006024 <+200>:   ld      s1,0(s0)

It takes '0(s0)' as the address of frame 1 (caller), but the actual address
should be '-16(s0)'.

          |       ...       | <-+
          +-----------------+   |
          | return address  |   |
          | previous fp     |   |
          | saved registers |   |
          | local variables |   |
  $fp --> |       ...       |   |
          +-----------------+   |
          | return address  |   |
          | previous fp --------+
          | saved registers |
  $sp --> | local variables |
          +-----------------+

This leads the kernel can not dump the full stack trace on riscv.

[    7.222126][    T1] Call Trace:
[    7.222804][    T1] [<ffffffff80006058>] dump_backtrace+0x2c/0x3a

This problem is not exposed on most riscv builds just because the '0(s0)'
occasionally is the address frame 2 (caller's caller), if only ra and fp
are stored in frame 1 (caller).

          |       ...       | <-+
          +-----------------+   |
          | return address  |   |
  $fp --> | previous fp     |   |
          +-----------------+   |
          | return address  |   |
          | previous fp --------+
          | saved registers |
  $sp --> | local variables |
          +-----------------+

This could be a *bug* of gcc that should be fixed. But as noted in gcc
manual "Calling this function with a nonzero argument can have
unpredictable effects, including crashing the calling program.", let's
remove the '__builtin_frame_address(1)' in backtrace code.

With this fix now it can show full stack trace:
[   10.444838][    T1] Call Trace:
[   10.446199][    T1] [<ffffffff8000606c>] dump_backtrace+0x2c/0x3a
[   10.447711][    T1] [<ffffffff800060ac>] show_stack+0x32/0x3e
[   10.448710][    T1] [<ffffffff80a005c0>] dump_stack_lvl+0x58/0x7a
[   10.449941][    T1] [<ffffffff80a005f6>] dump_stack+0x14/0x1c
[   10.450929][    T1] [<ffffffff804c04ee>] ubsan_epilogue+0x10/0x5a
[   10.451869][    T1] [<ffffffff804c092e>] __ubsan_handle_load_invalid_value+0x6c/0x78
[   10.453049][    T1] [<ffffffff8018f834>] __pagevec_release+0x62/0x64
[   10.455476][    T1] [<ffffffff80190830>] truncate_inode_pages_range+0x132/0x5be
[   10.456798][    T1] [<ffffffff80190ce0>] truncate_inode_pages+0x24/0x30
[   10.457853][    T1] [<ffffffff8045bb04>] kill_bdev+0x32/0x3c
...

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 arch/riscv/kernel/stacktrace.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 201ee206fb57..14d2b53ec322 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -22,15 +22,16 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			     bool (*fn)(void *, unsigned long), void *arg)
 {
 	unsigned long fp, sp, pc;
+	int level = 0;
 
 	if (regs) {
 		fp = frame_pointer(regs);
 		sp = user_stack_pointer(regs);
 		pc = instruction_pointer(regs);
 	} else if (task == NULL || task == current) {
-		fp = (unsigned long)__builtin_frame_address(1);
-		sp = (unsigned long)__builtin_frame_address(0);
-		pc = (unsigned long)__builtin_return_address(0);
+		fp = (unsigned long)__builtin_frame_address(0);
+		sp = sp_in_global;
+		pc = (unsigned long)walk_stackframe;
 	} else {
 		/* task blocked in __switch_to */
 		fp = task->thread.s[0];
@@ -42,7 +43,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		unsigned long low, high;
 		struct stackframe *frame;
 
-		if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
+		if (unlikely(!__kernel_text_address(pc) || (level++ >= 1 && !fn(arg, pc))))
 			break;
 
 		/* Validate frame pointer */
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
