Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE20C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 03:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JIO9LZ3e+VLaaDTbbdMgZ8XEg102PNLfEbi5bx8nPEo=; b=1souZJnHwTUf4f
	OXzTOKqeEWKfRzALB3f5NZICmsMIWdEGvKHnf8S9I9KF3blgBJ7HeauBqjWVnfpSqVnf32PR1us5v
	vNwi9tO7GrAfIxGWgnJw50Wp4u6843AbqdhS4DQvW/aeP59UIpks/EzlYaxKTu1QhILs3YXBIkohn
	fOovnBJvtFZLhvOeDwy/vh8Qs4IQgn0lX4g7FZOziKdmXWFUIZ29lvhfVqc3hEGoxsUEKrCkgxjwn
	xCFmApqgdOXjHWaDMxiVgUaWJGBxfoZvqdtZSdQw7UlAdFlRET+5cgH1dQfGtYQCSVW1ZF/KywgRl
	j797hpxj4Geq6fKZcZ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz86m-0080kd-0k;
	Wed, 17 May 2023 03:45:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz86j-0080ig-2R
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 03:45:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1aaef97652fso3119525ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 20:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684295144; x=1686887144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tAjWrmzrXGyO7rim5mWO1xH9wWB24VwxwxXjgy9nqY=;
        b=IXqKz9k5vSycU5LcG+OjyO4IGbHD5KIhty+95sowy/bKSzZa6tVax2mkeL31D/yJXY
         zZ1ImDoihBfW8G988jhG7sfn7iDKErXUynFJTStUSB5InW+x9v4xALBs6IRvfWppMBCb
         Fw9RijMCj0KacaPY0rt1opW3J+Q1n1/ewB/QVr0B2wcDg8nvSsTgVbY876opBh2vwXh9
         RdhfyRMJ1vqrv7dawirsMEnJkbkG/ZpErcsyRoOUyhNEV0o8vS66V1QEbsBQGpKlVvqz
         882Rda4fpgf0Ayg1p+FBxlEBJO9Q5Ee1eINQYzfKeZjacQZhCSJaPRU+age+OA6o6P6Q
         1ILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684295144; x=1686887144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tAjWrmzrXGyO7rim5mWO1xH9wWB24VwxwxXjgy9nqY=;
        b=apZ4Ju6preTm1G+0SZIeXbxAa9akZn6e/ulRW5eeGUgyhfHpWZvW587+KRnXZLO6NQ
         C/2Fj7pYAiMtfAoGt9Pf+GwTTXg3dtJio83IeyfR3PzFLsJEHwHJ3MMHnNkmM8OXR2UN
         nw3qqW8WThvhhYljvNo0BTLmsMTrglAwjAZUHXKByog/WitgclVOhmhQ2buBAMNk+8jr
         rRiRpXLM94W/FDWdLdwELnIulU5yEpLZLqDd3ap8mCSV5ULwFnsHksw3LfrzrWihzjkg
         iN1c/75If9nq27VL8gh5SL63lGgZ4QNqKd2FH2GRLmtqUA/l042xVQ5uLBky1bbA/DDA
         HR4w==
X-Gm-Message-State: AC+VfDxhW5FOm8JpAa/k8Z8QsiFZm3k/z26MzbmlE2yVCwDgfjLU86ap
	IBxTVToIeAIoHHj8rHzZSoM=
X-Google-Smtp-Source: ACHHUZ5hBx5XqkMa8UrfCmDpz7N6J9hB4QncpaWly6GjeoRST5WdYe4jEmV14lesqGLCCx1F9Jv8EA==
X-Received: by 2002:a17:902:dace:b0:1ac:6e1f:d1bd with SMTP id q14-20020a170902dace00b001ac6e1fd1bdmr44584262plx.19.1684295144122;
        Tue, 16 May 2023 20:45:44 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.83])
        by smtp.googlemail.com with ESMTPSA id t2-20020a170902e84200b001a19196af48sm16336746plg.64.2023.05.16.20.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 20:45:43 -0700 (PDT)
From: Ze Gao <zegao2021@gmail.com>
X-Google-Original-From: Ze Gao <zegao@tencent.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	x86@kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	Ze Gao <zegao@tencent.com>
Subject: [PATCH v3 4/4] rethook, fprobe: do not trace rethook related functions
Date: Wed, 17 May 2023 11:45:09 +0800
Message-Id: <20230517034510.15639-5-zegao@tencent.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517034510.15639-1-zegao@tencent.com>
References: <20230517034510.15639-1-zegao@tencent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_204545_793297_AE19B5FF 
X-CRM114-Status: GOOD (  10.53  )
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

These functions are already marked as NOKPROBE to prevent recursion and
we have the same reason to blacklist them if rethook is used with fprobe,
since they are beyond the recursion-free region ftrace can guard.

Signed-off-by: Ze Gao <zegao@tencent.com>
Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Link: https://lore.kernel.org/linux-trace-kernel/20230516071830.8190-5-zegao@tencent.com
---
 arch/riscv/kernel/probes/Makefile | 2 ++
 arch/s390/kernel/Makefile         | 1 +
 arch/x86/kernel/Makefile          | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/probes/Makefile b/arch/riscv/kernel/probes/Makefile
index c40139e9ca47..8265ff497977 100644
--- a/arch/riscv/kernel/probes/Makefile
+++ b/arch/riscv/kernel/probes/Makefile
@@ -4,3 +4,5 @@ obj-$(CONFIG_RETHOOK)		+= rethook.o rethook_trampoline.o
 obj-$(CONFIG_KPROBES_ON_FTRACE)	+= ftrace.o
 obj-$(CONFIG_UPROBES)		+= uprobes.o decode-insn.o simulate-insn.o
 CFLAGS_REMOVE_simulate-insn.o = $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_rethook.o = $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_rethook_trampoline.o = $(CC_FLAGS_FTRACE)
diff --git a/arch/s390/kernel/Makefile b/arch/s390/kernel/Makefile
index 8983837b3565..6b2a051e1f8a 100644
--- a/arch/s390/kernel/Makefile
+++ b/arch/s390/kernel/Makefile
@@ -10,6 +10,7 @@ CFLAGS_REMOVE_ftrace.o		= $(CC_FLAGS_FTRACE)
 
 # Do not trace early setup code
 CFLAGS_REMOVE_early.o		= $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_rethook.o		= $(CC_FLAGS_FTRACE)
 
 endif
 
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index dd61752f4c96..4070a01c11b7 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -17,6 +17,7 @@ CFLAGS_REMOVE_ftrace.o = -pg
 CFLAGS_REMOVE_early_printk.o = -pg
 CFLAGS_REMOVE_head64.o = -pg
 CFLAGS_REMOVE_sev.o = -pg
+CFLAGS_REMOVE_rethook.o = -pg
 endif
 
 KASAN_SANITIZE_head$(BITS).o				:= n
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
