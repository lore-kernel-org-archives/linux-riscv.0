Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A176CC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 17:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x2RsYeraEMuXk0wCa/jrXnwjs9BYhcDGtURAEVRF1r8=; b=2hlFJgm/dR6jnf
	3gdXv5eHpl9/064ap12Pfut9hHJ4emlle19tP5c7+6aFVQq8QD5suTKbwAwIKfm2bdbAeoUAVBVaq
	t2qBZ0H5td1cq2tqPsv/VY8WOiktoMW3+BWOgXiVfXf49o0DyjhkpZDo0iljNmTniiLN3Q7f3+Ycm
	aeFVvII489BII1fELsXJAANPWgBj3Bh6/zyrzKFDD7jkyaWQ618pgd9Gq31BAM9VgMgWCueneNI6B
	GPZ4pIqwHMXg4s9vmkB4yXvBs4sLzlS0+fZq8tvrjsdYoSXsF9ZSXgb6a4omsIzswQVhUYeaIKSHU
	nnIznUlovudox+qCGYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5EA-005r9e-Mx; Fri, 18 Nov 2022 17:32:34 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5E8-005r5L-G4
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 17:32:34 +0000
Received: by mail-pg1-x530.google.com with SMTP id f9so1363338pgf.7
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 09:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6lJ5gRcc7MMYSZVBgs/lVKCNpnkRvG9H5V/gHPoXFec=;
        b=mEVBeU/paftGIY37idqL5pt0S5LUHdqXb3s/vzcvKjn9W1d6LU9ECN2sZS3D0kL12Y
         nHppj6K6p2gNJbo3DGq6yO0Kf4zs0Vjm7FP60eQ5In4/IC1wmhWnysqsfF5EMjjdO1Kc
         t8mK3esr1OkuDB+hhj/xnex2u5mImr+QMEWzMsoYiUIcrt3FF5Jg7HW4ezYTevyOArs8
         bxUf4AZI7TsJOyycRdTHvwuwdd5nx6sJxVR7SN2x919+E5fhTtY4ypPvTV0ywoHJgH/w
         V6BILDr8nTsx1vwBpEcJw2I3vRGF3kqIUP1befh+9mNgP7DVdpThwk7xJNAjDdPQMFvL
         nzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lJ5gRcc7MMYSZVBgs/lVKCNpnkRvG9H5V/gHPoXFec=;
        b=hMUiCJ1oRa0AXYqYUTTm7HZkh9issXZmQB9TU6XgstwqzZwgbEnlmh/Jbtq9Qb6Hyj
         DWL04E9MpxsiiXmAIkY7dQVgFnWf1kMyXWsbTtph5XiBnT2XYzlmfGqg7kpj+F6dSbq2
         1So3s95lBEYPoBpxgaYWg6KQGsS7DAC60OSnjIZc5gEx382jh+bRO/J3DDScFNLBtBoC
         JZfxP8zH6pWcnnqahpkuIIWSl8cDQyYlxg05bd8feds5CFSIumVR4IhtdScOQZ0jr+Hp
         gZLd6VleUQVE++9SKL9Ethxhktaphhl1DqCypshZmLPykBr00UUeqk31BR7KNXngvH8i
         qmjw==
X-Gm-Message-State: ANoB5plMKpvaHP/C27x651BBEXy0UOQuLDPwF69YIuUHOvb1k3mV7Lbc
	TR5LGv0PxyPwndgKtXGCPKw=
X-Google-Smtp-Source: AA0mqf6DbhB9UmdLqEtvQbQUt5I4PhHPNfLF2iIu8ry6zdE/U1sbPKXd5jJ1JIABu32Uz9cS2WdAzw==
X-Received: by 2002:a63:de01:0:b0:476:32a2:253 with SMTP id f1-20020a63de01000000b0047632a20253mr7809888pgg.133.1668792749585;
        Fri, 18 Nov 2022 09:32:29 -0800 (PST)
Received: from localhost.localdomain ([112.2.231.196])
        by smtp.gmail.com with ESMTPSA id u7-20020a656707000000b00476b6b7f339sm3037979pgf.11.2022.11.18.09.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 09:32:28 -0800 (PST)
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
Subject: [PATCH v3 0/2] riscv/ftrace: make function graph use ftrace directly
Date: Sat, 19 Nov 2022 01:32:15 +0800
Message-Id: <20221118173217.888077-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_093232_560985_47CEB7A6 
X-CRM114-Status: UNSURE (   9.13  )
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

Changes since v2:
- line up the comments [Andrew]
- rename SAVE_ALL as SAVE_ABI_REGS [Guo Ren]
- consolidate the modifications of mcount-dyn.S into one patch [Guo Ren]
- adapt this series based on [riscv: ftrace: Fixup ftrace detour code][1] [Guo Ren]

[1]: https://lore.kernel.org/linux-riscv/20220921034910.3142465-1-guoren@kernel.org/
v2 Link: https://lore.kernel.org/linux-riscv/20221116031305.286634-1-suagrfillet@gmail.com/

Changes since v1:
- fix the checkpatch warnings in patch 1
v1 Link: https://lore.kernel.org/linux-riscv/20221115061525.112757-1-suagrfillet@gmail.com

Song Shuai (2):
  riscv/ftrace: add ftrace_graph_func
  riscv/ftrace: make ftrace_caller call ftrace_graph_func

 arch/riscv/include/asm/ftrace.h |  13 ++-
 arch/riscv/kernel/ftrace.c      |  30 +++----
 arch/riscv/kernel/mcount-dyn.S  | 143 +++++++++++++++++++++++---------
 3 files changed, 129 insertions(+), 57 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
