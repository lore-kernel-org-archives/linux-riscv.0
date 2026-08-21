Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88262C5DF87
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 01:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QTEtzv6hIcKzUhhd1aWyzyVDcyL6baUmKathIGZIGhI=; b=KsloPT0K4N/s80
	sWsto9nKEGYaD5xw/Rb1xm6XRg2Qig6KAUjSB7a9lYZkwrNWZkrIE4NS5VkeiDFc5OnyQzr+Bg2Io
	wQvdxC3of5ZySMmHDoOTgB866v9NB/2hzNoemYA9U4USvsqFacayIhzZUAt7EmtnP5yWbTqsVmjlc
	zXWEcgVDe3PdJCi4BO+NkN1Zg/h2pjkN9ocLmfMXyC79C22rhrsigzthrX2TFXQ2MBLkZk8IPr01P
	iLtx79Xz5BsB3Y25/rLMtRr0pHAZ6GlGGuvSZRAq3RbscekrAWL6N/I6eaYEfH4Y+FiB5Baeykink
	Czy9N3gWMT6at0YFH0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxE2V-0000000CQ35-3bLx;
	Fri, 21 Aug 2026 01:27:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxE2U-0000000CQ2x-0bSs
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 01:27:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D8D9260A58;
	Fri, 21 Aug 2026 01:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320B91F000E9;
	Fri, 21 Aug 2026 01:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787275639;
	bh=/YvkqO1Co8rgXsGiEEuyiIzaT5tlySRac/ZA+XW5nAU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=G6PPtaLkflZk3MTvspaS+cIYDyds2Bql7vWVSowsj9PNZLKEOHqY20F3VBht+OmDG
	 Lry/15CZ5gFe31X80DSUoQ1tpbI6z83yCLGwfnfZCQxS5pQV68fqYELjtOli9J45nf
	 OxhlIinkSrsqdgmJLwHJ9RWFWygnrGjIaCGfOwZKQdsL2tUJ2dNMcuQDNa95GKg5TY
	 EmxDYSNOpuLe+L7Xk69DS6kjVF9HMLzkTVoMc4emBCGXglXqr8FwnPQFqZQzOezhLs
	 mAnoM4uDW2LgiLudE6yHax2WzwLAAUnuf1Tp/UmZ9veCFtrjI98umQl8YsX3aYF7AE
	 4HcVId5PTEnfA==
Date: Thu, 20 Aug 2026 19:27:16 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Xie Bo <xb@ultrarisc.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, Dennis Zhou <dennis@kernel.org>, 
    Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
    Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    linux-mm@kvack.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Add native this_cpu_cmpxchg() support
In-Reply-To: <20260730094407.16588-1-xb@ultrarisc.com>
Message-ID: <8b8cbb4a-474d-1de4-eaf2-dd8b4e6ca8ec@kernel.org>
References: <20260730094407.16588-1-xb@ultrarisc.com>
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

On Thu, 30 Jul 2026, Xie Bo wrote:

> RISC-V falls back to the generic this_cpu_cmpxchg() implementation,
> which serializes the operation by disabling local interrupts.
> Consequently, HAVE_CMPXCHG_LOCAL is unset and users such as
> percpu_counter cannot use their cmpxchg-based fast paths.
> 
> Implement the 4-byte this_cpu_cmpxchg() operation with cmpxchg_local(),
> and provide the 8-byte operation on RV64. Pin execution while resolving
> the current CPU pointer so the LR/SC loop operates on one per-CPU
> instance, while allowing interrupt-context updates to race through the
> atomic operation.
> 
> Copy the old and new values to private temporaries before invoking
> cmpxchg_local(). This avoids collisions between local variable names in
> nested statement-expression macros.
> 
> The 1- and 2-byte operations continue to use the generic fallback.
> 
> Select HAVE_CMPXCHG_LOCAL and update the architecture feature matrix.
> 
> A percpu_counter_add() benchmark using the default batch value reduced
> the median time per operation by 77.3% (10 runs of 5,000,000
> operations).
> 
> In three 60-second stress-ng fork runs, median throughput increased by
> 4.6%. A 120-second combined fork and VM stress test completed without
> rss-counter errors or validation failures.
> 
> Signed-off-by: Xie Bo <xb@ultrarisc.com>

This patch seems to be missing 128-bit cmpxchg support.  Care to add it?


thanks,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
