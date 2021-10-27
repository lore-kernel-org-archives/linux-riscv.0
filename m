Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B246C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 03:14:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF8186058D
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 03:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF8186058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GldjeueyzPqrGEYxfcg1JnvS/xpUj7N9ck/Mm3kmvRs=; b=rE+i4J/v/AjQhy
	kPEni32h8c+cStQ476H2TUtP22oWt2NIOKqVGZb542bvifn25CJ3h0Ozd8u2lV0KOXzP22dNK3TfU
	+lRYQBB+uwE0V8L2wWW1a29FKkZDpTP3vBQ9fvK2mD4g+il7rW2W878uI0duCc1OF5q4EzTWA/9+G
	3+t1GlsNwVuzy5DEFpol7XOl6rZu4ZbgibGGupO1c2cLrxPyrhkPjsmNfmKkC5D9kGYqzw2N8THRW
	U43BqsS+j2UcDOhplXK2dMlXPwGWu77CFaY7Fx5whNizlTbIaF2VLNFLyB5EYdSq7QYzazfCZvv8Q
	oG9XO5hg0AjdaxELnFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfZO8-003izX-M5; Wed, 27 Oct 2021 03:14:04 +0000
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfZO6-003iyR-4b
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 03:14:03 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R901e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=30; SR=0; TI=SMTPD_---0UtqDHde_1635304435; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UtqDHde_1635304435) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 27 Oct 2021 11:13:56 +0800
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
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Subject: [PATCH v7 0/2] fix & prevent the missing preemption disabling
Message-ID: <ecd56129-faed-3b30-5552-7fa1e09bc408@linux.alibaba.com>
Date: Wed, 27 Oct 2021 11:13:55 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_201402_397742_0A6C45AF 
X-CRM114-Status: UNSURE (   7.74  )
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

The testing show that perf_ftrace_function_call() are using smp_processor_id()
with preemption enabled, all the checking on CPU could be wrong after preemption.

As Peter point out, the section between ftrace_test_recursion_trylock/unlock()
pair require the preemption to be disabled as 'Documentation/trace/ftrace-uses.rst'
explained, but currently the work is done outside of the helpers.

And since the internal using of trace_test_and_set_recursion()
and trace_clear_recursion() also require preemption to be disabled, we
can just merge the logical together.

Patch 1/2 will make sure preemption disabled when recursion lock succeed,
patch 2/2 will do smp_processor_id() checking after trylock() to address the
issue.

v1: https://lore.kernel.org/all/8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com/
v2: https://lore.kernel.org/all/b1d7fe43-ce84-0ed7-32f7-ea1d12d0b716@linux.alibaba.com/
v3: https://lore.kernel.org/all/609b565a-ed6e-a1da-f025-166691b5d994@linux.alibaba.com/
V4: https://lore.kernel.org/all/32a36348-69ee-6464-390c-3a8d6e9d2b53@linux.alibaba.com/
V5: https://lore.kernel.org/all/3ca92dc9-ea04-ddc2-71cd-524bfa5a5721@linux.alibaba.com/
V6: https://lore.kernel.org/all/df8e9b3e-504c-635d-4e92-99cdf9f05479@linux.alibaba.com/

Michael Wang (2):
  ftrace: disable preemption when recursion locked
  ftrace: do CPU checking after preemption disabled

 arch/csky/kernel/probes/ftrace.c     |  2 --
 arch/parisc/kernel/ftrace.c          |  2 --
 arch/powerpc/kernel/kprobes-ftrace.c |  2 --
 arch/riscv/kernel/probes/ftrace.c    |  2 --
 arch/x86/kernel/kprobes/ftrace.c     |  2 --
 include/linux/trace_recursion.h      | 11 ++++++++++-
 kernel/livepatch/patch.c             | 13 +++++++------
 kernel/trace/ftrace.c                | 15 +++++----------
 kernel/trace/trace_event_perf.c      |  6 +++---
 kernel/trace/trace_functions.c       |  5 -----
 10 files changed, 25 insertions(+), 35 deletions(-)

-- 
1.8.3.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
