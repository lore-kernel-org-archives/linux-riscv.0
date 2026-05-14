Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAF5CD4F3C
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 02:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8g3nFYnvxcJ88nD3VAhbnr/Hs9p4tfH0Idt0VXs6fo=; b=lB7/tzBBLFUgS6
	otzsZzxhnvPAy2M5w4HkSUb3JeHd7FBGGOkRNloyeHR8nymqeSBLfDWUvBReyZ/ZOxe3EQREeEfsw
	doe97Hz0J6PbJSVen8xeCp7gKyx5BP2pRUwIFTQnp1woCe81cF5qChrkvOvB/b+JY3pVMeHrLfo9d
	yIx8WGThMhs7QOFqhqHSB4qcdlewqmqlJWbT0erd3RSju0joaH6FeMTh0Aa/hw8DdCc/3S8JlnKt+
	bwW7u9pYyIru6NjmQ1fYVnQoNnJBvOyeqLeR5GIY2OvwpD+TXYAMyFeqBdyNRi5NlJeyKJYjxSV2Q
	FIn7dme/25KhSZOVRcVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNLbk-00000004LNZ-2N5U;
	Thu, 14 May 2026 02:15:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNLbi-00000004LNR-3Ai0
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 02:15:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA5DC600AE;
	Thu, 14 May 2026 02:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16395C19425;
	Thu, 14 May 2026 02:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778724925;
	bh=gufw34IuiHNiE+ByypQKYUWNSB1gfIHap088tcTp+/I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q3tbrMmXdA0fUHqsmllTj8EmxJ27S+UxQYlYEeThzfm0XMFsZFmyi25c8QOK2QFIV
	 FIKB6yecWqunCAgoE2y0x1HaO55u5k1o72Fd8JFRRfeWaB7+OfxI0XMa0qU2ME2Ot3
	 0rQyYVY259k7GBZ/xJ7GS0xnrf3Xar+k6DmgvngTe5089gYAwJdjktMUAgQAoO4zJF
	 t7iHdgJ8t+0TXMmQbSXeVB71OcKK8rfUq5Ulyhi+NmGJXIg3enwEXaX0M6QQn7G6t2
	 GhbkAYW+jk6CgQg/rvPEOzssr/tSViJ7m6Azmq7LQGHddbKJf1gxdI9jgPYl13c1nM
	 +/3HccTLfSJTQ==
Date: Wed, 13 May 2026 20:15:24 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Rui Qi <qirui.001@bytedance.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    zhangchunyan@iscas.ac.cn, xujiakai2025@iscas.ac.cn, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix ftrace_graph_ret_addr() to use the correct
 task pointer
In-Reply-To: <20260408092915.46408-1-qirui.001@bytedance.com>
Message-ID: <ddc3b007-e40b-578c-05fe-b6635fb439eb@kernel.org>
References: <20260408092915.46408-1-qirui.001@bytedance.com>
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

On Wed, 8 Apr 2026, Rui Qi wrote:

> The walk_stackframe() function is used to unwind the stack of a given
> task. When function graph tracing is enabled, ftrace_graph_ret_addr()
> is called to resolve the original return address if it was modified by
> the tracer.
> 
> The current code incorrectly passes 'current' instead of 'task' to
> ftrace_graph_ret_addr(). This causes incorrect return address resolution
> when unwinding a stack of a different task (e.g., when the task is
> blocked in __switch_to).
> 
> Fix this by passing 'task' instead of 'current' to match the behavior
> of other architectures (arm64, loongarch, powerpc, s390, x86).
> 
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>

Thanks, queued for v7.1-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
