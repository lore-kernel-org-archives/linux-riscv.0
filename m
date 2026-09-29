Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAD5C9832A
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 07:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNz4sf/hH036b5SUohbxlT1AFGlIAZU3ZIncUNX5e18=; b=tJLDkauocukdS9
	nqxXpe4DyFkHekgrzZToJIaIoC3vwb1sQ3KSGL5tTH5XdMyj/qWM0uDY0U7UlsnOBOq9m93kDEFHA
	fgUuwwa2+6jIKTCdI06EqxFaWa3AghI+hio+g1WG6mki9BzDvA8bJbUs6vxvBtAhX6QZ8ziq9tCf/
	iLJhKcopAlcLF1TKaEVZeTljye5w4i2u6PcEAtVh/TB8udAnTe6ugazj/H95oDw41ib0J2RxbY54X
	ut3xT+Nf9SNTu4u9RB5kwRg+BfmV59aJAJhB4J/Ak8jjfy+zE9AAo+3oT73Gbj369OFmOdxSje02l
	o2I5S74qB6HsHjgyQt8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSGM-00000002cE5-29Em;
	Tue, 29 Sep 2026 07:28:30 +0000
Received: from akranes.kaiser.cx ([2a0a:4cc0:1:11ef:4484:ccff:febf:ddfa])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSGJ-00000002cBJ-2sSK
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 07:28:29 +0000
Received: from martin by akranes.kaiser.cx with local (Exim 4.98.2)
	(envelope-from <martin@akranes.kaiser.cx>)
	id 1xBSG5-00000002hMb-0XNg;
	Tue, 29 Sep 2026 09:28:13 +0200
Date: Tue, 29 Sep 2026 09:28:13 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org, oleg@redhat.com,
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com,
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	james.clark@linaro.org, jpoimboe@kernel.org, jikos@kernel.org,
	mbenes@suse.cz, pmladek@suse.com, joe.lawrence@redhat.com,
	shuah@kernel.org, mpdesouza@suse.com, oliver.yang@linux.alibaba.com,
	zhuo.song@linux.alibaba.com, jkchen@linux.alibaba.com,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 0/7] riscv: Add reliable stack unwinding for livepatch
Message-ID: <artojcJftbMIgPrj@akranes.kaiser.cx>
References: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_002827_728014_AD78FBE1 
X-CRM114-Status: GOOD (  15.34  )
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

Thus wrote Shuai Xue (xueshuai@linux.alibaba.com):

> Hi,

> This is v6 of the RISC-V reliable stack unwinding series for livepatch.
> Wang Han has left our team, so I am taking over this series from now on.

> The series adds explicit frame-record metadata, preserves the frame
> pointer through dynamic ftrace, and replaces the open-coded stack walker
> with a conservative frame-pointer based unwinder. It then enables the
> RISC-V livepatch capability and adds the syscall-wrapper selftest prefix.

> Changes since v5:
> * Rebase onto the current riscv/for-next; no functional changes.
> * Fold in the tags collected from the v5 thread:
>   - Reviewed-by: Shuai Xue on 2/7, 3/7, 4/7 and 6/7
>   - Acked-by: Miroslav Benes on 7/7
> * Add my sign-off as the new sender.

> Since the patches are otherwise identical to v5, the v5 validation
> results still apply. For reference, from the v5 cover letter:
> * Built Linux 7.2.0-rc6 with riscv64-unknown-linux-gnu-gcc 15.2.0
>   and binutils 2.46.
> * Standard livepatch configuration built successfully, including
>   Image, vmlinux, modules, compile_commands.json and GDB scripts.
> * CONFIG_IRQ_STACKS=n variant linked successfully with GCC.
> * QEMU 8.2.2, 1 CPU: livepatch selftests PASS: 7, SKIP: 1,
>   FAIL: 0; ftrace function graph 3 passed, 0 failed, 3 unsupported.
> * QEMU 8.2.2, 4 CPUs: livepatch selftests PASS: 7, SKIP: 1,
>   FAIL: 0; ftrace function graph 3 passed, 0 failed, 3 unsupported.
> * No BUG, WARNING, Oops, panic, unreliable stack or Call Trace found
>   by the validation log scans. Expected negative livepatch errors are
>   part of the selftests.

> v5 was posted in early August and has been quiet since then. I would
> appreciate it if the series could be considered for the upcoming merge
> window. Happy to address any remaining feedback.

> Base:
> riscv/for-next 77ae27fd98f3 ("Merge tag 'printk-for-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux")

> Previous versions:
> v5: https://lore.kernel.org/r/20260804103626.2803112-1-wanghan@linux.alibaba.com
> v4 RESEND: https://lore.kernel.org/r/20260629072713.3273743-1-wanghan@linux.alibaba.com
> v3: https://lore.kernel.org/r/cover.194d76e3a15b.v3.riscv-livepatch.wanghan@linux.alibaba.com
> v2: https://lore.kernel.org/r/20260528082310.1994388-1-wanghan@linux.alibaba.com
> v1: https://lore.kernel.org/r/20260527123530.2593918-1-wanghan@linux.alibaba.com

> Assisted-by: Qoder:Qwen-3.8-MAX-Preview

Thanks for these patches.

I tried them on a standard rv64 qemu and on a rv64 cheri system
(cheri-linux.org). The latter needed some minor tweaks, but in
both cases, I could get livepatch to work.

Reviewed-by: Martin Kaiser <martin@kaiser.cx>
Tested-by: Martin Kaiser <martin@kaiser.cx>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
