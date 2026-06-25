Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99280CDE009
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 19:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=35F5Duuo5o0syA+IQt00EqBu6BE0KRi1exKidjbHqDU=; b=4aLvmEK8NiUw45
	vRhUawrIafG5E6tBOfBMHc3bj5ge0SO1sWRiyAbdg6zQ8f9eZFdjzD5/DFHmcm7j6tacOvDEaeNaQ
	YMEY2JZQUBxSD2vKFUArBIwEit4DpUHPylvBGI0wCw2uqk9759Ocs4qUqM7PihTFgFYPb5ifAlKd/
	bJ/NPmXlVXxE+2pDDO5fE2VAFm0p7iqkT1PlQJmu+rw03ktiXbRUgwRejKlVL9HfiCPi5TTDuDnAu
	Z2XwuK591F51susJ3vXJD9QETvmaHRgpT/QKN0gLqsFttWURQT42vT1+yd0BbI+ZUEerNXJDyDH3X
	NQl7zzDk4sIKo/6CZoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcpej-00000009jso-3VMm;
	Thu, 25 Jun 2026 19:22:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcpej-00000009jsR-1YlG
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 19:22:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 976E560098;
	Thu, 25 Jun 2026 19:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8091F000E9;
	Thu, 25 Jun 2026 19:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782415352;
	bh=WnDS5j6lyeaeZIOZYGNYA3yrK95KQ7qc6yGTXVrMjFQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=VvKr3PZeX7jSfkhBXvRZF/pGRa5yn+mG6BinaFVmuNzoQ5PhPIIWhy2/1UUxx1e1g
	 kc5vWDc4yzRS3iqPBagZ6kt+mryJBa6c6Gr+x5/2dvJYbFU5dGGEQSg/8HiLTv1GDW
	 gQgW/jfq93EA/bwYELdwuKiPnKE8CVEj0QvTe/DpTi4OhG3aeCJ+hGHBEy6JvK83Js
	 eYCa9/XrW+ms5Zkk7zfGCiRE8yg19Ukp/UJASML/vLapC3b34btcAVjN9QeUE0byNz
	 YQaoL0kpPKmuXoV+fLwuddQFTrdlDC9BLVlEVyrorHzQhGGNS7qrEPgL+uKfVrAGoG
	 hwFrk9CFbEHaw==
Date: Thu, 25 Jun 2026 13:22:29 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Wang Han <wanghan@linux.alibaba.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>, 
    Alexandre Ghiti <alex@ghiti.fr>, Masami Hiramatsu <mhiramat@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, 
    Catalin Marinas <catalin.marinas@arm.com>, 
    Chen Pei <cp0613@linux.alibaba.com>, Andy Chiu <andybnac@gmail.com>, 
    =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, 
    Deepak Gupta <debug@rivosinc.com>, Puranjay Mohan <puranjay@kernel.org>, 
    Conor Dooley <conor.dooley@microchip.com>, 
    Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
    Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>, 
    Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Namhyung Kim <namhyung@kernel.org>, oliver.yang@linux.alibaba.com, 
    xueshuai@linux.alibaba.com, zhuo.song@linux.alibaba.com, 
    jkchen@linux.alibaba.com, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
    live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3 1/8] scripts/sorttable: Handle RISC-V patchable ftrace
 entries
In-Reply-To: <20260609063002.3943001-1-wanghan@linux.alibaba.com>
Message-ID: <2a7abbb3-e2df-ab2a-087a-0e1604d188bb@kernel.org>
References: <20260528082310.1994388-1-wanghan@linux.alibaba.com> <cover.194d76e3a15b.v3.riscv-livepatch.wanghan@linux.alibaba.com> <20260609063002.3943001-1-wanghan@linux.alibaba.com>
MIME-Version: 1.0
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

Hi,

On Tue, 9 Jun 2026, Wang Han wrote:

> RISC-V uses -fpatchable-function-entry=8,4 when the compressed ISA is
> enabled and -fpatchable-function-entry=4,2 otherwise. In both cases, the
> patchable NOP area starts 8 bytes before the function symbol address.
> The __mcount_loc entries therefore point at the patchable NOP area
> associated with a function, while nm reports the function symbol at the
> entry address used for the function range check.
> 
> After RISC-V selected HAVE_BUILDTIME_MCOUNT_SORT, sorttable started
> applying that range check at build time. Without allowing entries just
> before the reported function address, the mcount sorter treats valid
> RISC-V ftrace callsites as invalid weak-function entries and writes
> them back as zero. The resulting kernel boots with no ftrace entries,
> breaking dynamic ftrace and users such as livepatch.
> 
> The failure is silent during the final link because zeroing weak-function
> entries is an expected sorttable operation. At boot, those zero entries
> are skipped by ftrace_process_locs(), so the only obvious symptom is that
> the vmlinux ftrace table has lost valid callsites and ftrace users cannot
> attach to them.
> 
> CONFIG_FTRACE_SORT_STARTUP_TEST also reports the table as sorted in this
> state: it only checks that the __mcount_loc entries are in ascending
> order, which a fully zeroed table trivially satisfies. The original
> commit relied on this check and did not see the regression.
> 
> On an affected RISC-V QEMU boot with both CONFIG_FTRACE_SORT_STARTUP_TEST
> and CONFIG_FTRACE_STARTUP_TEST enabled, the sort check still passes
> while ftrace reports zero usable entries and the early selftests fail:
> 
>   [    0.000000] ftrace section at ffffffff8101da98 sorted properly
>   [    0.000000] ftrace: allocating 0 entries in 128 pages
>   [    0.054999] Testing tracer function: .. no entries found ..FAILED!
>   [    0.172407] tracer: function failed selftest, disabling
>   [    0.178186] Failed to init function_graph tracer, init returned -19
> 
> Handle RISC-V like arm64 for the function-range check and allow
> patchable entries up to 8 bytes before the function address.
> 
> With this fix, a RISC-V QEMU smoke boot with ftrace startup tests shows
> the vmlinux ftrace table is populated and dynamic ftrace still works:
> 
>   [    0.000000] ftrace: allocating 46749 entries in 184 pages
>   [    0.051115] Testing tracer function: PASSED
>   [    1.283782] Testing dynamic ftrace: PASSED
>   [    6.275456] Testing tracer function_graph: PASSED
> 
> Fixes: 0ca1724b56af ("riscv: ftrace: select HAVE_BUILDTIME_MCOUNT_SORT")
> Suggested-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Reviewed-by: Chen Pei <cp0613@linux.alibaba.com>
> Link: https://lore.kernel.org/all/20260527113028.4b21a5de@fedora/
> Signed-off-by: Wang Han <wanghan@linux.alibaba.com>

Thanks, I'm going to pull this one out of the rest of your series since 
this is clearly a fix and needs to go in sooner rather than later.  Queued 
for v7.2-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
