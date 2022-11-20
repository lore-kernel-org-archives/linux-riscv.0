Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53854C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e0+8SlRCmtBPItaFTeOMq9KL9yFSXgRCAAu/Mvl12UA=; b=SIOHPxILs0NKBQ
	fUVrZ8vKzXV4Xop4MdUu7i8ymcE+xrkBbZBeE5CpFgXIRmtzpQvYf64HOsSm/zHvc5QiGyySnwB6J
	k9AqcsmLXwBjMYXZ4isiJAXauEgIPirMMsM0dE+xjfriOoBUuLtevMiy/uh8RvUk1tIUTVgPB2jRQ
	LJW3R4dU188lwzMA9x7qvYAF1lDAinlHyH07ZFtb76OyOTLo/Uk0k8d6ZzJxIErvgJpnjyBbTD+DN
	4dwIchL8/XOm/7MVdHDm8q9jSl46uya9t293GRB2/8CMbBJYwbV3dt+LcwQXzOZHrExxQSDYpnxoL
	6iOObn/70RYpv7JTD0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfuW-00358g-ON; Sun, 20 Nov 2022 08:42:44 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfuT-00358D-Ue
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 08:42:43 +0000
Received: by mail-pf1-x42c.google.com with SMTP id x66so150869pfx.3
        for <linux-riscv@lists.infradead.org>; Sun, 20 Nov 2022 00:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YLLHgVu/6CTNCGMLbnDOl9D7NCNUxklg4y/FnevzvKI=;
        b=lC2V7BJWGu1L7ZCHIWUuvL537rOWu3YnUXhBSedGqiNIZCRLyqla0T7KTPautB5ZBu
         DOEOIyA0VSEG8miWkw6c/vsxrMJILc2soRMJnICbKy1Dw9MCBTYGJ+CMMTCNen1behoh
         iT50vAortbZ9Qtx5JxEtbv+K3v4FrS7F7k6sxkr1IgNorJnGZFKr5/B6qYOMVLpAGYy7
         Y/P/6H5kOXUO2WqdDccvRhXbWkJKvhg6cPibiGHt4vn/yQE/tUmiQr8aGprc9SQQiml8
         43tx0gNpce0LYtOyXunRcI+DrRRqO/mwySlRrvzrf6Yj0zsgE41ksNQsIAlwzf5b4vSO
         leeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YLLHgVu/6CTNCGMLbnDOl9D7NCNUxklg4y/FnevzvKI=;
        b=LnTW6/r2qDTsaJZtA782iAEQ5WlImgxuyU4vDcVYqj54nmT4HeaDq/Q7qoxGbG1nw3
         BO8b0NeCE6NMwNKGGVXJXb8LfKfNixbuKKi5IqAoDuyKLshaHoc62Nr/5ilt1dTxd7cO
         F9koIi9z0HGG1fgUxOqR06Bq46iHQJYY7ZL12vyPgvS6PdBmgnL6psxB58VK0WY+OTLw
         8LlqyduE6rpKjhds3ENuoTeTbkfC4mN5TxQSjigylBX2Q/yi1D/lrk+DwFz5tb7U9m3d
         IalfQN7SC9mrWiC6FpfOtVMcfEK3iJvxIyySBje1S7qDgXWhj1QwwdszL7no92Sff7JX
         WDIw==
X-Gm-Message-State: ANoB5pkWszr5zVLSoz4iuCdAc5VVWJl7Tx9N0ndJqofFcRC3RGXawtXp
	w3PLIu/rr7BhyQHmwjHVgE1gTixuowuESA==
X-Google-Smtp-Source: AA0mqf61DJ+/C/vy/vfKzM/CU0dXAD4HkN+480uYXxz4VId8Zh2VRFQctzdJ0MGTZ2Yq6dgVtlpBAQ==
X-Received: by 2002:a63:fb04:0:b0:476:7faf:e0bf with SMTP id o4-20020a63fb04000000b004767fafe0bfmr4311805pgh.80.1668933759284;
        Sun, 20 Nov 2022 00:42:39 -0800 (PST)
Received: from localhost.localdomain ([122.192.14.194])
        by smtp.gmail.com with ESMTPSA id q40-20020a17090a17ab00b00212735c8898sm8188273pja.30.2022.11.20.00.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 00:42:38 -0800 (PST)
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
Subject: [PATCH v4 0/2] riscv/ftrace: make function graph use ftrace directly
Date: Sun, 20 Nov 2022 16:42:28 +0800
Message-Id: <20221120084230.910152-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_004242_068997_300417EE 
X-CRM114-Status: UNSURE (   8.60  )
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

Changes since v3:
- separate parameters preparation as PREPARE_ARGS [Guo Ren]
v3 link: https://lore.kernel.org/linux-riscv/20221118173217.888077-1-suagrfillet@gmail.com/

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
 arch/riscv/kernel/mcount-dyn.S  | 142 +++++++++++++++++++++++---------
 3 files changed, 128 insertions(+), 57 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
