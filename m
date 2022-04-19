Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BF9C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 19:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wqm2J3CPQcXUzM0n0ivl00azamGE1138OicJedd+/9M=; b=MZ7gqnUj8wj374
	fME+Wno4pPqHzHD7GOv3IsDm1u8qkP9Ox0wtsnXrCHuiLp0MAAZJf/MuEXM3cdg+Yk2PAz9UdmdFy
	c8bOpJuVuDvAyPBJ8rBDSR1Za+znFDf+dD07462m94Ur2M0VP30dO7xVJgtoN14sS4ChdYdXM+g/P
	CJTF5dAHy4NA7Td2aUa6T3p8uzlmvHCgri6ODFLT5CH18Zw/Tj8yoeS38LRlJQikiAI3lYR86dAqR
	Pg+QlnCfUC/hjLOfWce9FCBmMnRu/GlbGBdLPmm4zD4JMI3tsVmixzq+RL/bv0q9kJ7lirASJcjoz
	4qPhesamTJqQPoU1viwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngt8O-005uZR-Ks; Tue, 19 Apr 2022 19:03:32 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngt6W-005tVk-0a
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 19:01:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id n18so16681502plg.5
 for <linux-riscv@lists.infradead.org>; Tue, 19 Apr 2022 12:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=0/oQDgWDKgmKaJrohYsI3DhqEyHGwnTiXQyc5afVPxU=;
 b=r5Y6BdrIe60BFSIxEfcbpjb2XAlOTSE0R1Gd/KjZFYaR5clMDpg9XmTgaUarTL2xCf
 u577kG8fTcWM1vjuNJsgQ2naUeIXRmpDGHBr9oSiOjFm9tEoBHv+KBYxFdhAWDPPMzfr
 Y9MeVh52Ce5Pwq9lzMpf2/pEMU2HFOYFcycgNxh6uPQEkXGkuf4amhrqR9bdZZRHE8H1
 F1nJ802dr8vIKkounGPtZanpsIWBE/7nBiWMGKeTcZf2w2ymg/kpPjFt9+DjpLGV2wG5
 vUbcA6rnXwSMFzI1RnAFBlyQQdWCXRQSEPIbs64J0gCesJNmy8WCOTP/15zDExEAeTy0
 wK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=0/oQDgWDKgmKaJrohYsI3DhqEyHGwnTiXQyc5afVPxU=;
 b=Jq+l5n+PV/oAkfLHhgKza8n1AQzWoZIMo5TLGEzuDoXQB5piPz+7RBtPsveBRN1OrK
 MoqotoMh9Pcp48uJFm2gJzozrA8HGN/w6EsH833W/x0/vriaQElNs5zTJx7/p98eQLks
 +t9h9cTMlkENuq1ngrVrlTcblSBu7VeFVb4UxUWgXbJeDmw86MGlEhcsJTGRx0UM+OJV
 FSoWYLzZR58XdcBgJGgJZRs1MT9YK8dbsN2wYSGKo2PnxCMBU4gwPw3Uz3CtzVhPNbRV
 gBmcQEVdoY43JgHZmSXa1W46KbjCJh3nREYBbvvm0/a1PIUYDeZ07dfbFIPtYLM/1gQr
 8nOQ==
X-Gm-Message-State: AOAM531/Xdt3nIedd9Wiv9GDMfVL5uKUY4/wh6A3YcGkroFX6wsDfpjM
 z7Kb+fpms7dgWPOB+QOo65q7zg==
X-Google-Smtp-Source: ABdhPJyqsNP5BMD+uH1qubeFi/1H7/73bMXcJyq80BvSra40EaQLV770b0HPc/I1NLsyTe5OCWknyA==
X-Received: by 2002:a17:902:c7c4:b0:158:f139:29d8 with SMTP id
 r4-20020a170902c7c400b00158f13929d8mr14690808pla.166.1650394890419; 
 Tue, 19 Apr 2022 12:01:30 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm18336865pfj.79.2022.04.19.12.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 12:01:30 -0700 (PDT)
Subject: [PATCH v1] RISC-V: Move the "Call Trace" to dump_backtrace()
Date: Tue, 19 Apr 2022 10:48:42 -0700
Message-Id: <20220419174842.488-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, peterz@infradead.org, keescook@chromium.org,
 jszhang@kernel.org, 
 geert@linux-m68k.org, chenhuang5@huawei.com, changbin.du@intel.com,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: dvyukov@google.com, nogikh@google.com, syzkaller@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_120136_135016_20E0C826 
X-CRM114-Status: GOOD (  18.04  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

Our oopses include "Call Trace:", but in a different place than some
other targets do.  This is breaking at least syzkaller, and likely other
bits of tooling that are trying to parse kernel stack traces.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

---

I'm sort of just dead-reckoning this one based on the syzkaller issues
being reported in
<CACT4Y+ZA7CRNfYgPmi6jHTKD9rwvaJy=nh5Gz_c-PFHq3tuziQ@mail.gmail.com>, I
haven't tested this at all.  There's a lot of other stuff here that
arm64 is doing, much of which seems like it could be pulled out into
generic code.  I seem to remember having said that before, though...

I've left this as "Call Trace:" after seeing some patches to convert the
arm/ print from "Call trace:" to "Call Trace:".  I can't find it again
and I remember it sounding like that wasn't necessary, but since we've
already got the capital I see no reason to change it.  That looks to be
the more popular way.

Presumably this will break any tools parsing the current log format, but
given that we've changed it a handful of times and it looks like it's
just blowing up for folks as-is.
---
 arch/riscv/kernel/stacktrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 08d11a53f39e..d5b91c0d1881 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -108,12 +108,12 @@ static bool print_trace_address(void *arg, unsigned long pc)
 noinline void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
 		    const char *loglvl)
 {
+	pr_cont("%sCall Trace:\n", loglvl);
 	walk_stackframe(task, regs, print_trace_address, (void *)loglvl);
 }
 
 void show_stack(struct task_struct *task, unsigned long *sp, const char *loglvl)
 {
-	pr_cont("%sCall Trace:\n", loglvl);
 	dump_backtrace(NULL, task, loglvl);
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
