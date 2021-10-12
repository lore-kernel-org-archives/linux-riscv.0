Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56FCC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 05:40:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43C6C61076
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 05:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43C6C61076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cFQwuIljHN6Kuhr4bXXpXZOENILtJiKJwsHpwXisMDI=; b=T4PCATf2W7bm+9m8eWMSy1Cr45
	Jwl3QAA28chmsMIuX6kDvfGejhNqQ4NCHIQ5EVUIUNAtxkg2fmR2dzhmrR0uhxpo7aoi8XOktAnxl
	cQHlGkMGobF6BS+HHEOsH1CU9oC7p2HcEjWi078lUIjgbhVU4w3b7f3p+fau3x2agcgQjLKam8E8A
	lHq02wUHdlwvr47Skmgk9BJ5pTsZm+eDWiYvjPRkh89Lk0pKvd5T8LPvhfAZQQ+zAKeaQ1unireQo
	idYWMidlxNyUgP+vF0qyTs8gYU1k60LROeymBMCYVB41D1cr2tqfSJCKbRz2a3KeAb2W4O3wlb9yw
	Bmg8p0WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maAWm-00BdkK-CK; Tue, 12 Oct 2021 05:40:40 +0000
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maAWi-00Bdif-V9
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 05:40:38 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UrY3qZU_1634017231; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UrY3qZU_1634017231) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 12 Oct 2021 13:40:32 +0800
Subject: [PATCH 2/2] ftrace: prevent preemption in perf_ftrace_function_call()
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
To: Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
Message-ID: <7ec34e08-a357-58d6-2ce4-c7472d8b0381@linux.alibaba.com>
Date: Tue, 12 Oct 2021 13:40:31 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_224037_199937_BD07173E 
X-CRM114-Status: GOOD (  11.95  )
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

With CONFIG_DEBUG_PREEMPT we observed reports like:

  BUG: using smp_processor_id() in preemptible
  caller is perf_ftrace_function_call+0x6f/0x2e0
  CPU: 1 PID: 680 Comm: a.out Not tainted
  Call Trace:
   <TASK>
   dump_stack_lvl+0x8d/0xcf
   check_preemption_disabled+0x104/0x110
   ? optimize_nops.isra.7+0x230/0x230
   ? text_poke_bp_batch+0x9f/0x310
   perf_ftrace_function_call+0x6f/0x2e0
   ...
   __text_poke+0x5/0x620
   text_poke_bp_batch+0x9f/0x310

This telling us the CPU could be changed after task is preempted, and
the checking on CPU before preemption will be invalid.

This patch just turn off preemption in perf_ftrace_function_call()
to prevent CPU changing.

CC: Steven Rostedt <rostedt@goodmis.org>
Reported-by: Abaci <abaci@linux.alibaba.com>
Signed-off-by: Michael Wang <yun.wang@linux.alibaba.com>
---
 kernel/trace/trace_event_perf.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/trace_event_perf.c b/kernel/trace/trace_event_perf.c
index 6aed10e..33c2f76 100644
--- a/kernel/trace/trace_event_perf.c
+++ b/kernel/trace/trace_event_perf.c
@@ -441,12 +441,19 @@ void perf_trace_buf_update(void *record, u16 type)
 	if (!rcu_is_watching())
 		return;

+	/*
+	 * Prevent CPU changing from now on. rcu must
+	 * be in watching if the task was migrated and
+	 * scheduled.
+	 */
+	preempt_disable_notrace();
+
 	if ((unsigned long)ops->private != smp_processor_id())
-		return;
+		goto out;

 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
-		return;
+		goto out;

 	event = container_of(ops, struct perf_event, ftrace_ops);

@@ -468,16 +475,18 @@ void perf_trace_buf_update(void *record, u16 type)

 	entry = perf_trace_buf_alloc(ENTRY_SIZE, NULL, &rctx);
 	if (!entry)
-		goto out;
+		goto unlock;

 	entry->ip = ip;
 	entry->parent_ip = parent_ip;
 	perf_trace_buf_submit(entry, ENTRY_SIZE, rctx, TRACE_FN,
 			      1, &regs, &head, NULL);

-out:
+unlock:
 	ftrace_test_recursion_unlock(bit);
 #undef ENTRY_SIZE
+out:
+	preempt_enable_notrace();
 }

 static int perf_ftrace_function_register(struct perf_event *event)
-- 
1.8.3.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
