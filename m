Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA223CA9ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 09:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cmp9yfoAOiAU+c1Fl6Ndc9HVvOBeUcTTzNKpameYWog=; b=F1Guzen2PGrOfF
	AitE372dJcncKTDPkEBwHXxZ6p9KpKEnHBfrEQfLgvQdNgZCjERZ1yywhVQMpBe+QNCzCFe2u4b7I
	r2rWcSzkFXIqw1Hqn/nReX9Z7uRX5a3T+qeDp3UtNWJKPHnDGq4e7MsKmegAhOI+vFrhJP1KB/t7h
	KPpHmvQe7LSnmgWvIuvQyKZw5FXEtuSr3q6wWJnhJvIMdqOSeY2hfhdI7rowlQvyFk3b82+QS2nk5
	tkYXGyAlpH3mjS9QSGWhTmp7JrVbWuG1Fv50oqnXT2lMMLf85lTligiN412wVCxd3rF7ztaLx9giL
	c0LL60sUrQOy7PGNJ9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCUg-0000000A50S-3GcR;
	Mon, 12 Oct 2026 09:38:54 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCUc-0000000A4ye-0A4m
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 09:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791797926; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Pa5vpAlcxeupL5DUUG37a0rrinaOhdw9S6NlqCfn1cY=;
	b=ab/jrdljgqh2OPhH/NXG929XvUixfFKl3PUw82+57xBLaLR3VFDyw1EcH5BvokA2jlrK0M4FNpXoFWYz74T4ceubeLMRe4adSNX8cb7HE4rguKdqMiN0P0AxsIWaLe/QRSa3g+6QJ6Qi/DQuj7PquZ27+Jdeqa+gjIKZFT/41h0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R981e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XCeALDl_1791797921;
Received: from 30.246.160.148(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XCeALDl_1791797921 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 12 Oct 2026 17:38:42 +0800
Message-ID: <dd5c9bd0-df80-4524-aedf-49c5b94fdd12@linux.alibaba.com>
Date: Mon, 12 Oct 2026 17:38:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: Add KUnit test for stack trace start frames
To: Karl Mehltretter <kmehltretter@gmail.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Changbin Du <changbin.du@intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
References: <20261010132712.46931-1-kmehltretter@gmail.com>
 <20261010132712.46931-2-kmehltretter@gmail.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20261010132712.46931-2-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_023851_615951_67BC8356 
X-CRM114-Status: GOOD (  14.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 10/10/26 9:27 PM, Karl Mehltretter wrote:
> stack_trace_save() and return_address() depend on the first frame reported
> by arch_stack_walk(), but no test checks their frame numbering.
> 
> Add a test that calls both through a chain of three noinline functions
> and compares the symbol of the result with the function expected for
> each skip count or level.
> 
> Require FRAME_POINTER because the stack-scanning walker cannot provide an
> exact start frame.
> 
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>   arch/riscv/kernel/tests/Kconfig.debug     |  12 ++
>   arch/riscv/kernel/tests/Makefile          |   1 +
>   arch/riscv/kernel/tests/stacktrace_test.c | 142 ++++++++++++++++++++++
>   3 files changed, 155 insertions(+)
> 
> diff --git a/arch/riscv/kernel/tests/Kconfig.debug b/arch/riscv/kernel/tests/Kconfig.debug
> index 40f8dafffa0a..eb79df5b2c5a 100644
> --- a/arch/riscv/kernel/tests/Kconfig.debug
> +++ b/arch/riscv/kernel/tests/Kconfig.debug
> @@ -42,6 +42,18 @@ config RISCV_KPROBES_KUNIT
>   
>            If unsure, say N.
>   
> +config RISCV_STACKTRACE_KUNIT_TEST
> +	bool "KUnit tests for RISC-V stack trace start frames"
> +	depends on KUNIT && STACKTRACE && FRAME_POINTER && KALLSYMS

Hi, Karl

One small nit: the new RISCV_STACKTRACE_KUNIT_TEST entry does
not follow the KUNIT_ALL_TESTS pattern of the two existing entries
right next to it (RISCV_KPROBES_KUNIT, RISCV_MODULE_LINKING_KUNIT):

     config RISCV_STACKTRACE_KUNIT_TEST
             bool "KUnit tests for RISC-V stack trace start frames" if !KUNIT_ALL_TESTS
             default KUNIT_ALL_TESTS

Without "default KUNIT_ALL_TESTS" the suite is never enabled by
kunit.all_tests, and without the "if !KUNIT_ALL_TESTS" prompt guard
it shows up as a redundant prompt when KUNIT_ALL_TESTS is already
set.  This is not a blocker in any way, just a nice tweak for a
potential v2.

Please feel free to add

     Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>

to both patches, and additionally on 1/2

     Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks!
Shuai

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
