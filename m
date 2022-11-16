Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25807C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 03:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pHB/jlaqWRupGDBafDAzFxJtnK9/Xv4iaNF8Ue64EHU=; b=APTqIat/YDQO5r
	XbEglNoxlFgb+RKwYZpHDG8uqNwdaazudgjwnfVGB3bNipTCVXw+YbfXx1DvBlH7sB5WKnSil9imw
	Tu5QzSk9ATGcCVgJU/WempY5tYQ8Bid7eoPedlaP1DAJ7EP4h2K7+j7tCXBCpupeGkoX0dFgfeRFF
	42BTx/Mz3rPG8kR71yvq/L+NAmzHBA8PJD1IYvYz2xGoOkqAvV1UQHNI38ddhhx9zDGjRL/hP1rx4
	k6jkg1GyFVud2wN5X+LY7cRhrQYLbo7kcstpr0m4EwysXftwzuRIS9xFCQvlLW4LNRiuC+WeylMnc
	D6jJ3MQqGE44cNqNUciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov8rl-00GhPv-QC; Wed, 16 Nov 2022 03:13:33 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov8ri-00GhOi-K6
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 03:13:32 +0000
Received: by mail-pl1-x630.google.com with SMTP id j12so15221286plj.5
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 19:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o7mzmekM7b4EuQmfkyfbxbQT4N8eepFsinPjqbtyCKE=;
        b=kX3d6lExIOuHVP0aTrAKIv5tdbIt6hj0I68RZirGPk3K9t3bAA8Z8+euow/gEYF2mD
         LSpX2xkdZEB6qGt9ZJAFpHTASMkDdBDnb+RSIEJe3DWyLk7c9TIR06bsVroh8EmuVpFd
         U+C3wN7BoTc1CZc0MydHWfmuksoBy37x3C7RnxendZ8tVpYEtLNsUuMaOS7mnEEAZN0o
         peWdKyTfjdB4LF9sMvV4c6xX63nptyKSoVtbIqtBVduA98EJ6i59aGCzXPNYfjdO+QVA
         kA//O/FsGR9XvVUyBmo1AKAgeII5QEKhb9K02J213m3Tbzl8QwmKI9ThoeoeBnLJ7iOL
         OZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7mzmekM7b4EuQmfkyfbxbQT4N8eepFsinPjqbtyCKE=;
        b=YvVjMKmKOWcUsPApZRlpsx6dshN7xJiaiaUXFLmcP21pZW+tFGumjxM92gd42T6PeR
         zR9Jm1cPRFSRqrDpJ6kBcDNK4Tssp9NdDAJrQ1jmX2JulcueqTIPnqlkBDJUjFt4liX9
         SnVhPflEbDIQ9iaf6vxTXYge23TV+Tao6cDCX5JhtucmFSobE3xzqpHxROkKksygw0bb
         Dhc0QQ5RVqXoj+M6iHYhir2mb/XK+0iqMg7WKnY6APsoTWlfbN4ZnYL8jUK+De3c1QOo
         xFx036HLWpuHQFhB1LYRzmSiusYKBDqRid3ib9CtYatYsq390LL7UmfflNxY0OnRLkMG
         +ekQ==
X-Gm-Message-State: ANoB5pkEfgF48U3+DVwcH1+8aJulKJFwyzdOnZUsy1ndNWyicI+Su5o2
	o+6c8JtXENfYQQRyAFAPvHQ=
X-Google-Smtp-Source: AA0mqf5PgYJuqHrOwezSTS8rWopIiBJdf6luxzLQaLFYjhyKCFgETQA47M57FLg7/jaZKgxvNRiFJg==
X-Received: by 2002:a17:90a:4596:b0:1fd:5b5d:f09d with SMTP id v22-20020a17090a459600b001fd5b5df09dmr1607574pjg.69.1668568407736;
        Tue, 15 Nov 2022 19:13:27 -0800 (PST)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id ml22-20020a17090b361600b0020b2082e0acsm348295pjb.0.2022.11.15.19.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 19:13:27 -0800 (PST)
From: Song Shuai <suagrfillet@gmail.com>
To: guoren@kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH v2 0/3] riscv/ftrace: make function graph use ftrace directly
Date: Wed, 16 Nov 2022 11:13:02 +0800
Message-Id: <20221116031305.286634-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_191330_700167_83A1D695 
X-CRM114-Status: UNSURE (   8.33  )
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

In RISC-V architecture, when we enable the ftrace_graph tracer on some
functions, the function tracings on other functions will suffer extra
graph tracing work. In essence, graph_ops isn't limited by its func_hash
due to the global ftrace_graph_[regs]_call label. That should be corrected.

What inspires me is the commit 0c0593b45c9b ("x86/ftrace: Make function
graph use ftrace directly") that uses graph_ops::func function to install
return_hooker and makes the function called against its func_hash.

This series of patches makes function graph use ftrace directly for riscv.

If FTRACE_WITH_REGS isn't defined, ftrace_caller keeps ftrace_graph_call
so that it can be replaced with the calling of prepare_ftrace_return by
the enable/disable helper.

As for defining FTRACE_WITH_REGS, ftrace_caller is adjusted to save the
necessary regs against the pt_regs layout, so it can reasonably call the
graph_ops::func function - ftrace_graph_func. And ftrace_graph_[regs]_call
and its enable/disable helper aren't needed.

The tests generated by CONFIG_FTRACE_STARTUP_TEST have passed in the local
qemu-system-riscv64 virt machine. The following is the log during startup.

```
Nov 15 03:07:13 stage4 kernel: Testing tracer function: PASSED
Nov 15 03:07:13 stage4 kernel: Testing dynamic ftrace: PASSED
Nov 15 03:07:13 stage4 kernel: Testing dynamic ftrace ops #1: 
Nov 15 03:07:13 stage4 kernel: (1 0 1 0 0)  
Nov 15 03:07:13 stage4 kernel: (1 1 2 0 0)  
Nov 15 03:07:13 stage4 kernel: (2 1 3 0 365) 
Nov 15 03:07:13 stage4 kernel: (2 2 4 0 399) 
Nov 15 03:07:13 stage4 kernel: (3 2 4 0 146071) 
Nov 15 03:07:13 stage4 kernel: (3 3 5 0 146105) PASSED
Nov 15 03:07:13 stage4 kernel: Testing dynamic ftrace ops #2: 
Nov 15 03:07:13 stage4 kernel: (1 0 1 589 0)  
Nov 15 03:07:13 stage4 kernel: (1 1 2 635 0)  
Nov 15 03:07:13 stage4 kernel: (2 1 3 1 2)  
Nov 15 03:07:13 stage4 kernel: (2 2 4 125 126) 
Nov 15 03:07:13 stage4 kernel: (3 2 4 146001 146078) 
Nov 15 03:07:13 stage4 kernel: (3 3 5 146035 146112) PASSED
Nov 15 03:07:13 stage4 kernel: Testing ftrace recursion: PASSED
Nov 15 03:07:13 stage4 kernel: Testing ftrace recursion safe: PASSED
Nov 15 03:07:13 stage4 kernel: Testing ftrace regs: PASSED
Nov 15 03:07:13 stage4 kernel: Testing tracer nop: PASSED
Nov 15 03:07:13 stage4 kernel: Testing tracer irqsoff: PASSED
Nov 15 03:07:13 stage4 kernel: Testing tracer wakeup:
Nov 15 03:07:13 stage4 kernel: sched: DL replenish lagged too much
Nov 15 03:07:13 stage4 kernel: PASSED
Nov 15 03:07:13 stage4 kernel: Testing tracer wakeup_rt: PASSED
Nov 15 03:07:13 stage4 kernel: Testing tracer wakeup_dl: PASSED
Nov 15 03:07:13 stage4 kernel: Testing tracer function_graph: PASSED
```

Note that the changes of mcount-dyn.S conflicts with this unmerged
commit (riscv: entry: consolidate general regs saving/restoring).
https://lore.kernel.org/linux-riscv/20221103075047.1634923-15-guoren@kernel.org

Changes since v1
-  fixed the checkpatch warnings in patch 1
Link: https://lore.kernel.org/linux-riscv/20221115061525.112757-1-suagrfillet@gmail.com

Song Shuai (3):
  riscv/ftrace: add ftrace_graph_func
  riscv/ftrace: SAVE_ALL supports lightweight save
  riscv/ftrace: cleanup ftrace_caller and ftrace_regs_caller

 arch/riscv/include/asm/ftrace.h |  13 ++-
 arch/riscv/kernel/ftrace.c      |  35 ++++----
 arch/riscv/kernel/mcount-dyn.S  | 145 +++++++++++++++++++++++---------
 3 files changed, 136 insertions(+), 57 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
