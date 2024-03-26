Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C82C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 15:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=3w4vmKA0jxIm5uZRfrdip2/083Q2Rc9Th5YN+Pc3XXM=; b=fk2
	NmHQZO2C7Gvga2S8Djk60yaLHQ9uLbPA/tEFcFPYf5eo/gBn5GLTmT3lwCDCXsyvN3yk/cLLo/AYK
	BUD+KgP1q783z+DXvBruCdN5BnVz8jveTEDsX5gMRpWIRB3yEbRLaWfPWJscNU3wLaF5tg0PS8pI5
	mQHQreDrPfpE9qjXBTYDkt+jCE+2yyAvKtsNFBWoU2Lq2nGiie/83tAiFrZVqFmsgrAB/xW5IRD5l
	sVcR6cMT+N06NtpoZiy1t9t5nkSp6s28+Hb3kMjvdO8PxENb9sV9EN9wyQf8jckFLiaU+lR+Q6W5p
	JHLdndP3o0stxxb2P97u7ap/oUoIOnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8sC-00000005EHd-1hg5;
	Tue, 26 Mar 2024 15:38:00 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8rZ-00000005Dfd-2yrp
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 15:37:24 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-607838c0800so69276437b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711467436; x=1712072236; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BMvO/gDA6wsc5/QrzpIMGz8r1v8np9pO9kTN8mjpmmc=;
        b=eJnMsT/lTy1tmojNiaNsgIHqp3jGVCzQ/GxoszHrcvRFr73h8asWVin0troDHXDgrM
         XsJCfa2MYgTfEgJTzNSAzGE2UXm3dfZEE2Soe0WUDUnv7pEGbifAd6Wz5uAbSRlDoIi+
         rb0MYVzGEDWNgxzLoS8zYa5QN/7LCbS1oMk1xcQ4QBC0evW+9O9HExu0MboW5M/EweZG
         N7hxkRs+h/rCMHV3v9F7lzF66bIlHafj3RHeDJD4WucMsHv2zHhqFLZJ1on1iKt6AtEw
         AuAJl23I+ALw2OgUQUT4QQ9vTIKrqajB/5pnyMpwaN/zeijxqQNSj4D12LrR8wmQmOMF
         629A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711467436; x=1712072236;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMvO/gDA6wsc5/QrzpIMGz8r1v8np9pO9kTN8mjpmmc=;
        b=GP4A/4IMhY5nvEhHMdxpybBzNveX58tzyIOkFfnNdk1IhiXsHflq91sXHC9q+A1AE5
         eBB9Bav/cEL1J6Q2WqH1W3aVieNL7AVby/uDPtZiY0HnXzUPjoLwHW5903uwOi0OBKAS
         nno534thBVY3fI162h9hPKp/ODJynH5lIByC5iw9KxFOZD6pLk6V7899tDtGO7cyesx8
         tJl4UQW5Bb/WjbvgfcS7wb0pTB1wjbXhiVJfW1lmWgTseCOM/k3UGUvwId2Xw4HAWUn8
         P+/cDHYHGfvyNVmmQHE5qoUCrIxQtn8L9bGW7E1ufJF0A9vdUfcLorwrQp+BlzXrNs8H
         3I/g==
X-Forwarded-Encrypted: i=1; AJvYcCXT7sVUTnsNc4MpY8Er8/eO6o9foaAQLaiYnRMbinarXdTNOM6t+i8bq8Dp5H3Z1Ie1HBJsB38qSr2wDzIoWckQyBblJr5/AeA46epdzDUo
X-Gm-Message-State: AOJu0YwA4aJYrcIaQ5OTSxHv3ppTUMHnlG3ZQjQdK6ArK8qjXOKp8u/X
	rLGewO5iDivu+2ab1YRwSpOwtefLoW0kp85JRefS6jemzF9gSUhy7pCRIGQM5XTp9oANgnOE7pB
	RXm8V11294bdgy7oNusEpikVyzw==
X-Google-Smtp-Source: AGHT+IEtAbrfT0KePjTSZM1C/n453rH7UBsGCdgk9CYCpbgWc5d2/+acGD9f2ceoAz0WcEi0b/jf/PyVJ9b+Z7F1JRs=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a81:f10c:0:b0:60a:1844:74ef with SMTP
 id h12-20020a81f10c000000b0060a184474efmr351393ywm.1.1711467435797; Tue, 26
 Mar 2024 08:37:15 -0700 (PDT)
Date: Tue, 26 Mar 2024 15:37:13 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2790; i=samitolvanen@google.com;
 h=from:subject; bh=lP5dS6Tq+FiqxKpTrDMAZkxw9jBHYyu9IhEQCNtnP0M=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmAuuoWZIuWrE47I8B1b5TKFB+Qw8KjT+kih/KH
 WHMg9Yk0QmJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZgLrqAAKCRBMtfaEi7xW
 7ufGC/9qxcoSs09RThvb6flQlJcD7unRQHlOjzVZnI0+k7IpZsx+Qp+lQQ7b9jXAKWtV0jW2CAU
 9qJ9Vcp7kM/YgrwWARkIImRpSz0oVBGPHwBPGlNv+gOHsGJiIEzT5PfwOBOQZ6+iFkIVrmcU+qV
 pzbIsGIH5AljMJExPewedP4DT8Q7MY2rGE4ty+mwF2fztac+Ir7zOF2zM5HoPlN2RW+zG0FGjl+
 bhi6cJQWnZ7b2zna7Ya8yAEnhqYIxby/AuhuCZYMcrajA/GrpHR4AYMYjoNiW6T8hG2oBSg1DMK
 mCIz2odn4rCrRrwGMaSOOGSDHufTvQDJiCwrynP1aBU+rtWYdimt/+rEiKSEEaaL1RPSTFOPXG3
 EAjsgQls7qrb6Shyu7ZX2zoxeGTFkRcQdFe0aNBWMeUOPw74ZJxGLnMps3YWo1DLQMes6eW39fh oxbbqx/2PvPAFL6HaHT87bJDNA0sS88ZWTCEFibxu5bZhNsG5fdqEv1kEkOKLAWPHOyTM=
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240326153712.1839482-2-samitolvanen@google.com>
Subject: [PATCH] riscv: Mark __se_sys_* functions __used
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Kees Cook <keescook@chromium.org>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Linux Kernel Functional Testing <lkft@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_083722_520203_0889613C 
X-CRM114-Status: UNSURE (   8.44  )
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

Clang doesn't think ___se_sys_* functions used even though they are
aliased to __se_sys_*, resulting in -Wunused-function warnings when
building rv32. For example:

   mm/oom_kill.c:1195:1: warning: unused function '___se_sys_process_mrelease' [-Wunused-function]
    1195 | SYSCALL_DEFINE2(process_mrelease, int, pidfd, unsigned int, flags)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: expanded from macro 'SYSCALL_DEFINE2'
     221 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:231:2: note: expanded from macro 'SYSCALL_DEFINEx'
     231 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:81:2: note: expanded from macro '__SYSCALL_DEFINEx'
      81 |         __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:40:14: note: expanded from macro '__SYSCALL_SE_DEFINEx'
      40 |         static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
         |                     ^~~~~~~~~~~~~~~~~~~~
   <scratch space>:30:1: note: expanded from here
      30 | ___se_sys_process_mrelease
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.

Mark the functions __used explicitly to fix the Clang warnings.

Fixes: a9ad73295cc1 ("riscv: Fix syscall wrapper for >word-size arguments")
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/include/asm/syscall_wrapper.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/syscall_wrapper.h b/arch/riscv/include/asm/syscall_wrapper.h
index 980094c2e976..ac80216549ff 100644
--- a/arch/riscv/include/asm/syscall_wrapper.h
+++ b/arch/riscv/include/asm/syscall_wrapper.h
@@ -36,7 +36,8 @@ asmlinkage long __riscv_sys_ni_syscall(const struct pt_regs *);
 					ulong)						\
 			__attribute__((alias(__stringify(___se_##prefix##name))));	\
 	__diag_pop();									\
-	static long noinline ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
+	static long noinline ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
+			__used;								\
 	static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
 
 #define SC_RISCV_REGS_TO_ARGS(x, ...) \

base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
2.44.0.396.g6e790dbe36-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
