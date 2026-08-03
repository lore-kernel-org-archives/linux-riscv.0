Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E51DC55175
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 08:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IyX1f2qPGIF3I2J8T8ANUWOZWV/RCgCHndhjDuAbMro=; b=jpe0fIPri9bZBU
	gWOUOo/MmD0AHZz1995aaZXLCHrupm9Wydb1yOcvK6pUh2NWPmi3nv7FyP8ZekyQu81jBchFz+isK
	Pw+ofeGCM+OUvIrGbbean3vd7Zw68qqQWr4UZw5MjvX/oL2qmvTHlVo3a/NVvC6XCMJozhf3jp3Ga
	N7SWPEiR3cn34SnGgrZlsvrSSCqTqyDi1VN7nWiTmzVuz5NP3P7Xcbn4kGUECpmCyCdvrkhM9E3wf
	ezWIYzcqE+B7Fc7eDTHk34Tu42C1DJNb0Xp/OQrDl9rxT+nZt3Y9m1kKDU9Ng/V8fbdXxbhppnaWe
	aM+2FnCJusZSlNA3C5cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqo1I-0000000Gbew-0oia;
	Mon, 03 Aug 2026 08:27:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqo1G-0000000GbeW-2bV9
	for linux-riscv@bombadil.infradead.org;
	Mon, 03 Aug 2026 08:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OWbs+Njv6/iQ76BZ183o1IYjnJc3wYOlspGOGhipnWo=; b=eEKWAANxVweBrtwbHXkTc9ypXD
	rYVEnqBegRiYPqk1vJY2plo3duJEkYyPJNpCZVwiPcZpFqFW4Z+XxkspavROaHlAyYd5lLEHkNzco
	wUNHUZgvgNzexjgxe9bYtv2harJlhg6SgCqkLCiDJlYzkW/qBJEh6ARjGbzDzwDizGJVUOG2abxxS
	nwbE/xlsy7ZwDlQZvMYuUpOZe3+dL/e1kX1+oWHS5YJ9V6BEmo0bcYzaNgSIjh2m8+UWd4lR9uDv/
	K8a/iLrK0gF1Z0RraKGCw+Ro/0JARgVrdsw5nK6W6Lqp7r4gKPurGObkD0leCKZ6TsW7qdp4EUuvX
	vMHr5MDQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqo1E-0000000B1Xl-46rY;
	Mon, 03 Aug 2026 08:27:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 59579301127; Mon, 03 Aug 2026 10:27:32 +0200 (CEST)
Date: Mon, 3 Aug 2026 10:27:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Fangrui Song <i@maskray.me>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] riscv/runtime-const: Disable linker relaxation for
 RUNTIME_MAGIC
Message-ID: <20260803082732.GZ49951@noisy.programming.kicks-ass.net>
References: <20260802174342.597092-1-i@maskray.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260802174342.597092-1-i@maskray.me>
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

On Sun, Aug 02, 2026 at 10:43:42AM -0700, Fangrui Song wrote:
> Commit ee10b1028129 ("riscv/runtime-const: Replace open-coded
> placeholder with RUNTIME_MAGIC") switched the lui + addi[w] placeholder
> from hand-encoded immediates to %hi()/%lo() of RUNTIME_MAGIC.
> 
> GNU Assembler folds %hi()/%lo() of an absolute expression at assembly
> time. LLVM's integrated assembler since 21.1 defers it to the linker
> instead, which range checks it: on riscv64 R_RISCV_HI20 must fit a
> signed 20-bit field, and RUNTIME_MAGIC (0x89ABCDEF) is a positive 64-bit
> value rather than a sign-extended 32-bit one, so it does not:
> 
>     ld.lld: error: relocation R_RISCV_HI20 out of range: 563901 is not in
>     [-524288, 524287]
> 
> The sequence is patched at runtime and its instruction offsets are
> recorded via ".long 1b - .", so the linker must not touch it in the
> first place. Add ".option norelax", as is already done for
> ALTERNATIVE() and static keys; the integrated assembler then resolves
> %hi()/%lo() itself and emits no relocation, restoring the exact
> encoding the open-coded placeholder produced.
> 
> Fixes: ee10b1028129 ("riscv/runtime-const: Replace open-coded placeholder with RUNTIME_MAGIC")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2179
> Signed-off-by: Fangrui Song <i@maskray.me>
> ---
> Applies to tip/locking/core; the RISC-V tree (riscv/linux.git) does not
> carry ee10b1028129.

Thanks, I'll stick this on top.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
