Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573CBCA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 16:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6lke2Q2laODjiFxAry4GYupxae4qtz7hJ5Lq0RZC+c=; b=pFdywZNlvdgFQ+
	a7cfDfmE26GLcUIRP0ntdfmJ2RyXoB/gT2op7MQvcbfjCyi3aKm8WeQOeT1pJpafEbkm7saz0Hy+R
	w9BRw7yKq0toktx5l25/xQbztpVgSOuORKCAmAJP9crysPAfZLauswuF/jIDhzWuH31EKaSLHb+g4
	GcpAZdWij2V4WHIOLOuKvhvazr3ym0dzki50jqU/zUJAb4NiTDIdmh+pUy9FRcW1ERqrYI8q7xb2s
	DwQymttyirT8RUnokxf6pJqVnCAmBJBQh+YGSD3VFutVM1eT+ukJx4RxkU/A8sq1+P/h2kHHT4AIc
	8GeTKFbr6AiQdwwJVS4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umx45-00000002wTg-0ji9;
	Fri, 15 Aug 2025 16:14:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvE0-00000002gzx-0QBW
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 Aug 2025 14:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XDxHrD3TX9AedrU5KLSEMO2f62ogJmkuypzBhYFI+es=; b=PQ0jZW3Gt/YKfyB7A9r1pgw76l
	rQduqzGPLkQ6qEnBZFb6+RR2IWvSJxDQkyXws/quSXO6w3t0Y/GauRAzWcz+vfu9vAXu8+r9WtEqz
	pO1M0U1IYfbHyn7ovx/CqXvlDxUowuK2hwhgEOC5/5/xSqZaGha3kCpLP1sWAyzpgpLxJ6kIeqhUy
	8N1Ntpnt10+ZtqxNTwXRffrvqjsxlIuwiaqwN4OZu95RYXqeHs6lc2RhU1zyeSMWjzT9B8d81/qL2
	S0LnmRilElUK6EZHNhjBzN7tq3Au2y7CfHhIfaYnLxoi+IPnPoi/JsU02NkSYL7vRkxf5Tryc4mth
	L8aoK0Tg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvDx-0000000Gje9-2EVx;
	Fri, 15 Aug 2025 14:16:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 83BC03002ED; Fri, 15 Aug 2025 16:16:04 +0200 (CEST)
Date: Fri, 15 Aug 2025 16:16:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 00/17] Add __attribute_const__ to ffs()-family
 implementations
Message-ID: <20250815141604.GD3289052@noisy.programming.kicks-ass.net>
References: <20250804163910.work.929-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
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

On Mon, Aug 04, 2025 at 09:43:56AM -0700, Kees Cook wrote:
> Hi,
> 
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute_const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
> 
> Add KUnit tests for the family of functions and then add __attribute_const__
> to all architecture implementations and wrappers.
> 
> -Kees
> 
> [1] https://github.com/KSPP/linux/issues/364
> 
> Kees Cook (17):
>   KUnit: Introduce ffs()-family tests
>   bitops: Add __attribute_const__ to generic ffs()-family
>     implementations
>   csky: Add __attribute_const__ to ffs()-family implementations
>   x86: Add __attribute_const__ to ffs()-family implementations
>   powerpc: Add __attribute_const__ to ffs()-family implementations
>   sh: Add __attribute_const__ to ffs()-family implementations
>   alpha: Add __attribute_const__ to ffs()-family implementations
>   hexagon: Add __attribute_const__ to ffs()-family implementations
>   riscv: Add __attribute_const__ to ffs()-family implementations
>   openrisc: Add __attribute_const__ to ffs()-family implementations
>   m68k: Add __attribute_const__ to ffs()-family implementations
>   mips: Add __attribute_const__ to ffs()-family implementations
>   parisc: Add __attribute_const__ to ffs()-family implementations
>   s390: Add __attribute_const__ to ffs()-family implementations
>   xtensa: Add __attribute_const__ to ffs()-family implementations
>   sparc: Add __attribute_const__ to ffs()-family implementations
>   KUnit: ffs: Validate all the __attribute_const__ annotations

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
