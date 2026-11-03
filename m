Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6215606A327
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 01:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qot16IMC;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=khEmIFfW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KqUgeHDGCF48ksIEX57DMtAPweLtCB6dOeQNleyG024=; b=Qot16IMCRLDwQmzeDPD6LJTk+I
	+3rK9ilgSil1k8br1a1xCj1RdSASOshj+EYOdaLIYhwhMDjVvLhAa/BeLW4kCMhDfp5+klU+CDDUt
	RgA3XzICdwYgLcCug87CsyIJ4XRblfVDJYNtNglicxh/8z3tmbvdvWNPotsJF/HYvwzKRmU+qufoj
	M9QfyGiIkucR+WAKzba3e4YKZ3ecXnFrczYQybbH8ZsmuCzFpCTqWxk3HK2DGyfPTN8vXXYGLQ80Q
	MGK5XNp5KS7oJXEYh7VVhEjv8qJVftd1hnSLVSJpLAGlhV7b3y9Yi2NtE2KHLguozcikG6meYaHcu
	HL/W3lxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3TI-00000000oY3-07wh;
	Tue, 03 Nov 2026 01:37:56 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3TE-00000000oXM-3vJr
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 01:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793669867; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=NkKLoQiT3QLn1o0kL1YKYPKps4dql8DQmXqMzeu4JqA=;
	b=khEmIFfW61Vx04EDurerN1Hds3zuwk5P+dNfJ624RCcQ4Xguvzh6gNR71Xwx/uHHR1itaVJ9rkjCqk+q9eunETbbIn51Se7G8/mDIISDgu8AAqDdA03Cro1L90LW1ljzwThY5GyaAO9TlRymR2RyNZljqEw+7fNZ4LHpfQ8Hok0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XE0PTwb_1793669863;
Received: from 30.247.169.117(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XE0PTwb_1793669863 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 09:37:45 +0800
Message-ID: <70e15aaa-44c9-478a-8e61-1dfc19dc50a0@linux.alibaba.com>
Date: Tue, 3 Nov 2026 09:37:43 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: stacktrace: do not report the walker's own
 frame from arch_stack_walk()
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
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20261010132712.46931-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_173753_462772_F2ED3F7F 
X-CRM114-Status: GOOD (  15.68  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/10/26 9:27 PM, Karl Mehltretter wrote:
> stack_trace_save() uses skipnr + 1 because arch_stack_walk() is expected
> to first report the return into stack_trace_save(). With FRAME_POINTER,
> the RISC-V arch_stack_walk() calls walk_stackframe(), which starts from
> its own frame and first reports the return into arch_stack_walk().
> stack_trace_save() therefore starts one frame too early. For example,
> page_owner records begin at __set_page_owner() instead of the allocation
> site.
> 
> Move the walker into an always-inlined helper and call it directly from
> arch_stack_walk(). Keep walk_stackframe() as a wrapper for its existing
> callers.
> 
> return_address() skips level + 3 entries, while the arm64 implementation
> skips level + 2. After removing the extra frame, use level + 2 so
> ftrace_return_address() and CALLER_ADDR results do not shift by one caller.
> 
> Fixes: 6a00ef449370 ("riscv: eliminate unreliable __builtin_frame_address(1)")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Tested with the KUnit suite from patch 2 on QEMU's virt machine, clang 22
> (LLVM=1), on af32da41b032:
> 
>    mainline                        stack_trace_save 0/3, return_address 2/2
>    stacktrace.c change alone       stack_trace_save 3/3, return_address 0/2
>    this patch                      stack_trace_save 3/3, return_address 2/2
> 
> A BeagleV Ahead (TH1520) booted with this patch passes all five cases.
> The stack_trace_save() result on mainline (0/3) was also reproduced with
> GCC 15.2 and QEMU 10.2.1.
> 
> Without CONFIG_FRAME_POINTER the walker scans the stack for anything that
> looks like a text address and its start frame is not exact before or
> after this patch. What return_address() returns there is unchanged: the
> walk loses one leading entry and the skip count goes down by one.
> 
> The reliable unwinder series [1] rewrites this walker and has the correct
> start frame for stack_trace_save() as a side effect, but leaves
> return_address() at level + 3. This patch conflicts with 5/7 of that
> series; if that goes in first, only the return_address.c hunk is needed.
> 
> [1] https://lore.kernel.org/r/20260914092648.51254-1-xueshuai@linux.alibaba.com
Hi Karl,

Now that 7.4-rc1 is out and neither your two patches nor the reliable
unwinder series made this merge window, I'm preparing v7 of the series
for the next one.

Are you OK with folding your patches into the livepatch series rather
than keeping two conflicting walkers in flight?

Thanks.
Shuai




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
