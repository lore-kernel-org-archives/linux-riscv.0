Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF44C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 11:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PptYgAxHgjZrHwqFXmjVrExvF+0SPG8FuV1iXu3ECws=; b=prXRx6JTdwC+Gx
	WFFz4zmF0Y7Oke4DLP+147kQevxg03Q76emRtbyMmsNKA79q30wJHOLK/hBXkLhP+9IK5ENOeSqDd
	GRYmVP5w4gNHBuKsB1GUeKdssR9othgGmLS6icuFetRRqE2jUpCxkEO7Pkxgn5amYZr3RHUSsIVBq
	eWgc8a0OE1J1YZPoFh2VOXJYKD28ThxpoGF9D+N0vrMqRpbNjgU4b6JBC9utb9poqqAWNMnrhCs7J
	nLSh+0D0hiGk2P4MFIcjyVh5UPaaiSJ1SwVGFKhMr6GFAVcVZwo8AcWmhqa1BY/UEBz68+2UpjzsM
	2WKVfskRvxvOohcXT3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE6gp-00D2MN-0G;
	Tue, 27 Jun 2023 11:16:55 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE6gj-00D2Jv-1P
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 11:16:53 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-666ed230c81so3911147b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 04:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687864606; x=1690456606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ne0PfVTRcVEKKxj4M4FGiBreoIJtV1Je4xxVE1tvmME=;
        b=csDpxKTkeKlIZd1ZxV9bVmVvcOZzBlSSK9G20YV0iihRsK85x5dXSh8ZlyKFUbDdUH
         qfaRLEWNb407VgQMScSD4pdJ5KI+KQROQ9k40WhCHWYwDzbPcFl64wQqUveoDyCdCcGo
         yJERQPG0K9LMc8/tONvLSZAZMcRbK4CkgPN+o3jp7D5dOsGSOTuxtg2du6Pa6sTN2L6z
         OIbd2UFdSe5nmdJSH+hHGRUUUQnweL8xJc81YnFAwztsabVW56GntuKG2sttJgp/OaZE
         R/wLak3RIpWDAgyrnbftSHraraJ43Aq5oTdVxxIF4Q1K/VF8j5Duog41CmJydTbspLCE
         AXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687864606; x=1690456606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ne0PfVTRcVEKKxj4M4FGiBreoIJtV1Je4xxVE1tvmME=;
        b=B0XMJk8NL3jIh5mILet4wXeiB/s1TzPTkYNNwPdN2a8aWtkEW31WXSAsdW6eS9rgF1
         aYSb5skLdeiOLoW1fF86mefq6HNpxBJfYuElVCoO2ZJPzYb3zptK040EfnIi+mSftJiL
         vLEJz84LF62NtIb/JD3YkgLjCTGrAExx3ncBvMMfMM3HissV4kt+VjQUKx9BBfyWzgmf
         BiYSv5GjCV8+/RsXdSNPlhsQfKThwlqdQkwkZJL5MZcdNQ0rTuo+/3u6OWf4Z0bcA3JI
         8/ftC9SzomGLt3VkJweii+H61NalEhHfs2RvLAYqUEBwRZZ7ERMlcZ8HUgvl3FAkSK6/
         TiUQ==
X-Gm-Message-State: AC+VfDxbIIDO0iPAmKt3nOntFstBk8v7Dl2nZ6yOOteaDZokhKOHDjQ4
	nw6SIk/gqYwlXEX6zmdlVPw=
X-Google-Smtp-Source: ACHHUZ4oXZcb8Nk19kBuR0qLl7TVQDc3WCmmlEl4KaAJtE3CwtrguhJyvOlLyNRYjFiJyVh45TW/Bg==
X-Received: by 2002:a17:90a:19d6:b0:262:cef9:84f6 with SMTP id 22-20020a17090a19d600b00262cef984f6mr7992734pjj.22.1687864605991;
        Tue, 27 Jun 2023 04:16:45 -0700 (PDT)
Received: from localhost.localdomain ([58.240.82.166])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a004800b00262d6ac0140sm5438658pjb.9.2023.06.27.04.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 04:16:45 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	guoren@kernel.org,
	suagrfillet@gmail.com,
	bjorn@rivosinc.com,
	jszhang@kernel.org,
	conor.dooley@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	songshuaishuai@tinylab.org
Subject: [PATCH V11 5/5] samples: ftrace: Make the riscv samples support RV32I
Date: Tue, 27 Jun 2023 19:16:12 +0800
Message-Id: <20230627111612.761164-6-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230627111612.761164-1-suagrfillet@gmail.com>
References: <20230627111612.761164-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_041649_475154_8DA7F625 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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

Since the commit f32b4b467ebd ("RISC-V: enable dynamic ftrace for
RV32I") enables dynamic ftrace for RV32I, make these riscv samples
also support RV32I.

Link: https://lore.kernel.org/all/mhng-29a592bf-1b25-4c6c-8f37-0d05d39bc093@palmer-ri-x1c9a/
Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 samples/ftrace/ftrace-direct-modify.c       | 27 +++++++++--------
 samples/ftrace/ftrace-direct-multi-modify.c | 33 +++++++++++----------
 samples/ftrace/ftrace-direct-multi.c        | 17 ++++++-----
 samples/ftrace/ftrace-direct-too.c          | 25 ++++++++--------
 samples/ftrace/ftrace-direct.c              | 17 ++++++-----
 5 files changed, 62 insertions(+), 57 deletions(-)

diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrace-direct-modify.c
index e90ca7b68314..071cf4093a24 100644
--- a/samples/ftrace/ftrace-direct-modify.c
+++ b/samples/ftrace/ftrace-direct-modify.c
@@ -23,32 +23,33 @@ extern void my_tramp2(void *);
 static unsigned long my_ip = (unsigned long)schedule;
 
 #ifdef CONFIG_RISCV
+#include <asm/asm.h>
 
 asm (
 "	.pushsection    .text, \"ax\", @progbits\n"
 "	.type		my_tramp1, @function\n"
 "	.globl		my_tramp1\n"
 "   my_tramp1:\n"
-"	addi	sp,sp,-16\n"
-"	sd	t0,0(sp)\n"
-"	sd	ra,8(sp)\n"
+"	addi	sp,sp,-2*"SZREG"\n"
+"	"REG_S"	t0,0*"SZREG"(sp)\n"
+"	"REG_S"	ra,1*"SZREG"(sp)\n"
 "	call	my_direct_func1\n"
-"	ld	t0,0(sp)\n"
-"	ld	ra,8(sp)\n"
-"	addi	sp,sp,16\n"
+"	"REG_L"	t0,0*"SZREG"(sp)\n"
+"	"REG_L"	ra,1*"SZREG"(sp)\n"
+"	addi	sp,sp,2*"SZREG"\n"
 "	jr	t0\n"
 "	.size		my_tramp1, .-my_tramp1\n"
-
 "	.type		my_tramp2, @function\n"
 "	.globl		my_tramp2\n"
+
 "   my_tramp2:\n"
-"	addi	sp,sp,-16\n"
-"	sd	t0,0(sp)\n"
-"	sd	ra,8(sp)\n"
+"	addi	sp,sp,-2*"SZREG"\n"
+"	"REG_S"	t0,0*"SZREG"(sp)\n"
+"	"REG_S"	ra,1*"SZREG"(sp)\n"
 "	call	my_direct_func2\n"
-"	ld	t0,0(sp)\n"
-"	ld	ra,8(sp)\n"
-"	addi	sp,sp,16\n"
+"	"REG_L"	t0,0*"SZREG"(sp)\n"
+"	"REG_L"	ra,1*"SZREG"(sp)\n"
+"	addi	sp,sp,2*"SZREG"\n"
 "	jr	t0\n"
 "	.size		my_tramp2, .-my_tramp2\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct-multi-modify.c b/samples/ftrace/ftrace-direct-multi-modify.c
index 5a81af7b3af3..b754803d0a50 100644
--- a/samples/ftrace/ftrace-direct-multi-modify.c
+++ b/samples/ftrace/ftrace-direct-multi-modify.c
@@ -21,38 +21,39 @@ extern void my_tramp1(void *);
 extern void my_tramp2(void *);
 
 #ifdef CONFIG_RISCV
+#include <asm/asm.h>
 
 asm (
 "	.pushsection    .text, \"ax\", @progbits\n"
 "	.type		my_tramp1, @function\n"
 "	.globl		my_tramp1\n"
 "   my_tramp1:\n"
-"       addi	sp,sp,-24\n"
-"       sd	a0,0(sp)\n"
-"       sd	t0,8(sp)\n"
-"       sd	ra,16(sp)\n"
+"       addi	sp,sp,-3*"SZREG"\n"
+"       "REG_S"	a0,0*"SZREG"(sp)\n"
+"       "REG_S"	t0,1*"SZREG"(sp)\n"
+"       "REG_S"	ra,2*"SZREG"(sp)\n"
 "       mv	a0,t0\n"
 "       call	my_direct_func1\n"
-"       ld	a0,0(sp)\n"
-"       ld	t0,8(sp)\n"
-"       ld	ra,16(sp)\n"
-"       addi	sp,sp,24\n"
+"       "REG_L"	a0,0*"SZREG"(sp)\n"
+"       "REG_L"	t0,1*"SZREG"(sp)\n"
+"       "REG_L"	ra,2*"SZREG"(sp)\n"
+"       addi	sp,sp,3*"SZREG"\n"
 "	jr	t0\n"
 "	.size		my_tramp1, .-my_tramp1\n"
 
 "	.type		my_tramp2, @function\n"
 "	.globl		my_tramp2\n"
 "   my_tramp2:\n"
-"       addi	sp,sp,-24\n"
-"       sd	a0,0(sp)\n"
-"       sd	t0,8(sp)\n"
-"       sd	ra,16(sp)\n"
+"       addi	sp,sp,-3*"SZREG"\n"
+"       "REG_S"	a0,0*"SZREG"(sp)\n"
+"       "REG_S"	t0,1*"SZREG"(sp)\n"
+"       "REG_S"	ra,2*"SZREG"(sp)\n"
 "       mv	a0,t0\n"
 "       call	my_direct_func2\n"
-"       ld	a0,0(sp)\n"
-"       ld	t0,8(sp)\n"
-"       ld	ra,16(sp)\n"
-"       addi	sp,sp,24\n"
+"       "REG_L"	a0,0*"SZREG"(sp)\n"
+"       "REG_L"	t0,1*"SZREG"(sp)\n"
+"       "REG_L"	ra,2*"SZREG"(sp)\n"
+"       addi	sp,sp,3*"SZREG"\n"
 "	jr	t0\n"
 "	.size		my_tramp2, .-my_tramp2\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct-multi.c b/samples/ftrace/ftrace-direct-multi.c
index 0e9bb94edade..a31f43ace85c 100644
--- a/samples/ftrace/ftrace-direct-multi.c
+++ b/samples/ftrace/ftrace-direct-multi.c
@@ -16,22 +16,23 @@ void my_direct_func(unsigned long ip)
 extern void my_tramp(void *);
 
 #ifdef CONFIG_RISCV
+#include <asm/asm.h>
 
 asm (
 "       .pushsection    .text, \"ax\", @progbits\n"
 "       .type           my_tramp, @function\n"
 "       .globl          my_tramp\n"
 "   my_tramp:\n"
-"       addi	sp,sp,-24\n"
-"       sd	a0,0(sp)\n"
-"       sd	t0,8(sp)\n"
-"       sd	ra,16(sp)\n"
+"       addi	sp,sp,-3*"SZREG"\n"
+"       "REG_S"	a0,0*"SZREG"(sp)\n"
+"       "REG_S"	t0,1*"SZREG"(sp)\n"
+"       "REG_S"	ra,2*"SZREG"(sp)\n"
 "       mv	a0,t0\n"
 "       call	my_direct_func\n"
-"       ld	a0,0(sp)\n"
-"       ld	t0,8(sp)\n"
-"       ld	ra,16(sp)\n"
-"       addi	sp,sp,24\n"
+"       "REG_L"	a0,0*"SZREG"(sp)\n"
+"       "REG_L"	t0,1*"SZREG"(sp)\n"
+"       "REG_L"	ra,2*"SZREG"(sp)\n"
+"       addi	sp,sp,3*"SZREG"\n"
 "       jr	t0\n"
 "       .size           my_tramp, .-my_tramp\n"
 "       .popsection\n"
diff --git a/samples/ftrace/ftrace-direct-too.c b/samples/ftrace/ftrace-direct-too.c
index 5c319db48af2..a1f86dd48847 100644
--- a/samples/ftrace/ftrace-direct-too.c
+++ b/samples/ftrace/ftrace-direct-too.c
@@ -18,25 +18,26 @@ void my_direct_func(struct vm_area_struct *vma,
 extern void my_tramp(void *);
 
 #ifdef CONFIG_RISCV
+#include <asm/asm.h>
 
 asm (
 "       .pushsection    .text, \"ax\", @progbits\n"
 "       .type           my_tramp, @function\n"
 "       .globl          my_tramp\n"
 "   my_tramp:\n"
-"       addi	sp,sp,-40\n"
-"       sd	a0,0(sp)\n"
-"       sd	a1,8(sp)\n"
-"       sd	a2,16(sp)\n"
-"       sd	t0,24(sp)\n"
-"       sd	ra,32(sp)\n"
+"       addi	sp,sp,-5*"SZREG"\n"
+"       "REG_S"	a0,0*"SZREG"(sp)\n"
+"       "REG_S"	a1,1*"SZREG"(sp)\n"
+"       "REG_S"	a2,2*"SZREG"(sp)\n"
+"       "REG_S"	t0,3*"SZREG"(sp)\n"
+"       "REG_S"	ra,4*"SZREG"(sp)\n"
 "       call	my_direct_func\n"
-"       ld	a0,0(sp)\n"
-"       ld	a1,8(sp)\n"
-"       ld	a2,16(sp)\n"
-"       ld	t0,24(sp)\n"
-"       ld	ra,32(sp)\n"
-"       addi	sp,sp,40\n"
+"       "REG_L"	a0,0*"SZREG"(sp)\n"
+"       "REG_L"	a1,1*"SZREG"(sp)\n"
+"       "REG_L"	a2,2*"SZREG"(sp)\n"
+"       "REG_L"	t0,3*"SZREG"(sp)\n"
+"       "REG_L"	ra,4*"SZREG"(sp)\n"
+"       addi	sp,sp,5*"SZREG"\n"
 "       jr	t0\n"
 "       .size           my_tramp, .-my_tramp\n"
 "       .popsection\n"
diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direct.c
index ca95506b0350..fe6b7ef0a2d5 100644
--- a/samples/ftrace/ftrace-direct.c
+++ b/samples/ftrace/ftrace-direct.c
@@ -15,21 +15,22 @@ void my_direct_func(struct task_struct *p)
 extern void my_tramp(void *);
 
 #ifdef CONFIG_RISCV
+#include <asm/asm.h>
 
 asm (
 "       .pushsection    .text, \"ax\", @progbits\n"
 "       .type           my_tramp, @function\n"
 "       .globl          my_tramp\n"
 "   my_tramp:\n"
-"       addi	sp,sp,-24\n"
-"       sd	a0,0(sp)\n"
-"       sd	t0,8(sp)\n"
-"       sd	ra,16(sp)\n"
+"       addi	sp,sp,-3*"SZREG"\n"
+"       "REG_S"	a0,0*"SZREG"(sp)\n"
+"       "REG_S"	t0,1*"SZREG"(sp)\n"
+"       "REG_S"	ra,2*"SZREG"(sp)\n"
 "       call	my_direct_func\n"
-"       ld	a0,0(sp)\n"
-"       ld	t0,8(sp)\n"
-"       ld	ra,16(sp)\n"
-"       addi	sp,sp,24\n"
+"       "REG_L"	a0,0*"SZREG"(sp)\n"
+"       "REG_L"	t0,1*"SZREG"(sp)\n"
+"       "REG_L"	ra,2*"SZREG"(sp)\n"
+"       addi	sp,sp,3*"SZREG"\n"
 "       jr	t0\n"
 "       .size           my_tramp, .-my_tramp\n"
 "       .popsection\n"
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
