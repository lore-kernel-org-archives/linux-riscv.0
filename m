Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F15C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 07:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qgcuioneb6v8ABXf3g6xwcHDEyqyEQBZUIjzHMzrtFo=; b=llaLBx09u8tpvA
	EKj8jbxbW2wkd7yJfhoMsnf+1HXXq77KLi57eHhMswVVc1m6Ud3ElZ1mt5sFDbNlUPZfa8+y7RYYV
	3yFZ8t8ozrCu7zpItjiyf2b++unoX5ofdI6Jl1svhoUUV+CapT0UiJ8zyoEf+ciV2krJ+Tb9lESPx
	5jxqagO6/ugtUTMaCG1tltg0pGB7lk8OkZ85phhztHi64+LVHtu413BBeBguMVChTDwoOe5Gz8Tue
	YQWSMq+5tSqEhHub57vHimxlDeVrdfhVC2RYmlHfs3BMYDZh+6DJF6U8/w2NiHxNWIN39UU41P4A1
	ybog24duG7iy0p5ns4PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoyC-004d1c-0n;
	Tue, 16 May 2023 07:19:40 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoy9-004czn-1I
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 07:19:39 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-643b7b8f8ceso7937982b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 00:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684221576; x=1686813576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6U/vkmAUFZZcdBk+KokFbNf1ZvkKNw6bCUwh7L5Br9E=;
        b=MFxu44NHbkQCaNnciSPrfna7rqyLC2dxpiPT8iIxN4YMSmvNT5WNxmBHJuu8yUW1J5
         EynI7VMJwAZLG3DgUCgj7G+xrxpokr5IS3ZRrGAJGBkw+eW2iHCYr1OVfGHC2+2dVCeC
         7t2aGksNm18G+S2p1Kymzqk15eMpkxaiyb0tE34Y+/zfabMobsqav4iB5A1iXlLrKhDK
         lEZMaL3xbrp8jePUEgNVtpLBTg/oRqWZojM+xWwnnz4TUFn3Lq/fkYXul2S9MFpzPdEN
         BPO4ZOcnazHWeen45gEA8Cdk2tUC2dGTEKbnZkzL+XRjjJnaFOo+R/RMKJjlV4ho0L/6
         Nv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684221576; x=1686813576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6U/vkmAUFZZcdBk+KokFbNf1ZvkKNw6bCUwh7L5Br9E=;
        b=mGxTq56bEhknBujksSEavAjsO7jfPUEXpDG9+uXUNu+mOtyso316siieQwFLrONoKT
         F+crOvVPaRoEoIYKdN3WtDgG2fhTlOlHBTjtg4i9NVv4KPgGS3pvmn4ego0Vih13RBVF
         I2kwdmlDQcldNVTqBNBjgtMVYSnclj9l6oMjz4C1fEi3Mllm5ccWKjgCleGLYBE4rb/0
         StORrRVHIYEf+7wX4F2gCysCmu6I0jXDYtEKc6LNF93sHiYLf8zAHPWLtN911+cmRmBO
         U6x22KRonAeiSxp89eq9o2LEumnsR3Xs5IpxTn2Xiloh5kSjTSoxNgQjwIQm7a0snUWd
         tjzg==
X-Gm-Message-State: AC+VfDyh7aktrMZA0a4E3CsdOtdjOTZn5pp4f1jxgTgROW8H+tXhdiJm
	5VMUEbI34sd/T01zmrHWlIw=
X-Google-Smtp-Source: ACHHUZ4nXjQYnByDI6oida9jX5iVkTZZXuNHP++wV9HBdBJ3e54nyEcPN/xLIHFq7HmESmFZpkuHGw==
X-Received: by 2002:aa7:88c8:0:b0:64a:2dd6:4f18 with SMTP id k8-20020aa788c8000000b0064a2dd64f18mr23142160pff.13.1684221575773;
        Tue, 16 May 2023 00:19:35 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.15])
        by smtp.googlemail.com with ESMTPSA id 17-20020aa79251000000b006468222af91sm12849830pfp.48.2023.05.16.00.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 00:19:35 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	Ze Gao <zegao@tencent.com>
Subject: [PATCH v2 4/4] rehook, fprobe: do not trace rethook related functions
Date: Tue, 16 May 2023 15:18:30 +0800
Message-Id: <20230516071830.8190-5-zegao@tencent.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516071830.8190-1-zegao@tencent.com>
References: <20230516071830.8190-1-zegao@tencent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_001937_436427_B75E2052 
X-CRM114-Status: GOOD (  10.76  )
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
