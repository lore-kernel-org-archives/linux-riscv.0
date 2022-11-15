Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66EDC43217
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 06:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k4KQIXgSsWUInAR0h1qHA8idFUlGAjsAzkM3wOv85PM=; b=KAkMbVAVd5xobq
	OoUoYRdPtf/DLCJ71vKmcaaL2sDvzHNd6NurD8zkjDMX4QiJBbwEPSOZuaa3TcjdO/qHNBEPr9ZVp
	u9hbsBCjlTjc0XUoFtdR46mhZt3EihRtfdRA0Y775CA6ZDNwibsmx6bvpD/qWlFuFroXw5UoU/cCX
	cugHlzEKi3LEPx8+JMxbScRactKIHkP4qhfjOLIhjXXDo8REUZYVDU+hxpCyc2rX2dy/iVM2c02ag
	KafLg/bGmvJOzwDcsbXF+RVBNxwYSKgmSzIEX9CgxmoWtsLHdfwxeYqoK6guk+QsXAfT3TX3ZwQtQ
	smQpLl5IBNoq4VVVB4/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oupES-008BlX-EG; Tue, 15 Nov 2022 06:15:40 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oupEQ-008Bdp-1a
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 06:15:39 +0000
Received: by mail-pj1-x102d.google.com with SMTP id m14-20020a17090a3f8e00b00212dab39bcdso15991095pjc.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 22:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S87JB0jXS/1245zlp0DfUQH9YtzFG2T1WCf/d65ubvA=;
        b=iSRK/t7aVPl926xpswpdT3LP5BxwCAfSZTOr7OwGkPaB6PX+IHx2rN87Ku3TbXpmC1
         bXlFK58LjE5mA0EVy4VMO/CrkaIkEYxrxU+rsB5Kx+TQ12svkXhH1iEMhRQWFvEMC0iS
         e9k6fWxHKBwHYCWdRQwWfk9rZ0O+tIxHolbbuPN7l30PqZ3vzHu4lZAVnUVgk/mpF45u
         SsGioiYvicOfDBnPVkfa41C8i/1sBlveGVnXkW6K/zFTyu0Pv1o595FfvfOwhK6Y0R62
         5vlloVDw494RdCcagfk0y91X52r7ihZGSmuZJZ3iO7i1eeYPni0+7fqJT6MiVW/f9PSZ
         otiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S87JB0jXS/1245zlp0DfUQH9YtzFG2T1WCf/d65ubvA=;
        b=4OxGKph/eLCL2rmomEgnkJho9RtMx3cJgEtVShfdfe8Wh6hOL/ofQpfYm6V0XGpx26
         xVnvC+W0b12IprZQ3uFDif6K0DKJWBJvi4x2CdPdpdvDV7TdKy3YeTDDQC/Sw8wfozec
         2TUwHt4vabjI62Yq0gbkj26PsZlZxvfY9Ry5emL5OzpoZC1EuaxTIidraZ5Pi64ys68v
         YoEvx+XnrrW+VeAVakLtfs/BAinZV/MWOg9/xFBQ6Qv3X36Gbp/JYMvFcMw32cB3kZMq
         B0cWaqrimmSgTpTWZm4XpG5cYBc5dIxsXUcGjJeSCv5AWjB8vPxWyE/BvyMPEhu8BC+b
         Kabw==
X-Gm-Message-State: ANoB5pmo8vh+YMWMxYluEFO/nl5QZA3mGFG8UVrEVmMMCUigDiix9bLX
	gFzCZQWJyU3mBZcUKvpR0bM=
X-Google-Smtp-Source: AA0mqf6GLQkOG+1nRPuyrln1cg9/qE9hPWTcUF2NcqOY3pLgJSG8Xf9e/WYv2vYh++6oTI3xz3VtbA==
X-Received: by 2002:a17:90b:48cb:b0:212:e2e9:a522 with SMTP id li11-20020a17090b48cb00b00212e2e9a522mr699407pjb.55.1668492934466;
        Mon, 14 Nov 2022 22:15:34 -0800 (PST)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id p9-20020a1709027ec900b0017f57787a4asm8736769plb.229.2022.11.14.22.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 22:15:34 -0800 (PST)
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
Subject: [PATCH 0/3] riscv/ftrace: make function graph use ftrace directly
Date: Tue, 15 Nov 2022 14:15:22 +0800
Message-Id: <20221115061525.112757-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_221538_104734_3688526D 
X-CRM114-Status: UNSURE (   7.93  )
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
https://lore.kernel.org/linux-riscv/20221103075047.1634923-15-guoren@kernel.org/

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
