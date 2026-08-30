Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E2AC61DD6
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 02:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1O51DDrCoUp8LdobHjincjHWuP3zn4eQtN6/xlK+2U=; b=MXwsPYwLhCFxh+
	cO+h0SaJ2kT8/9BdPkhOFcsuBOM+d+O1Bmzu8rypvoLwoMOKKeTiD1s4MNiTe4C/ji3XYykJcBPaB
	zu2oHGRWq95DDOwXQRle/zlhivrNF8fctYQr//MDhJ4732BCrER/tDxsicHXjf9AYVo6u3xbp/er0
	ztKL92nbIA2sKhZQNQbDSSeqO8vvk+E2JOA4AJX6AhCJ9lmWePl3X60taAWi6aKdDJiy08rZD0s0g
	jtH/LhnQZrvwzvnD0gTd6ndbYoAgynoX1VXkyat3cmaj0gthtzKMKvSM4NBKe+6S+R/B6k0p31Rav
	U2Fjr+y3Tt8V7lIjXTzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0VQr-00000007RY6-2dPk;
	Sun, 30 Aug 2026 02:38:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0VQp-00000007RXy-24Mg
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 02:38:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7006A600AE;
	Sun, 30 Aug 2026 02:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC531F000E9;
	Sun, 30 Aug 2026 02:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788057479;
	bh=8JYy4cwxYHYB3SLpHqiVEkE1C6SYKPTNsf1PpaVEnwg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QVajQr8NNF6WPo/YrfP06JWv6nBxuMXUVYkL4jV+k7kofGQyAqz7WQZ82AizCeFUZ
	 kAT3EfC07ssgCo3wsWRLa38WTRca6Bkg907opIQTsW6d1FYUAiYxWdnnhbzERCR/8a
	 erqZhgAOb21E3uccdcRdMiINp9YIOYLA7PNTvGX0=
Date: Sat, 29 Aug 2026 19:37:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Breno Leitao <leitao@debian.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, david@kernel.org, SJ Park <sj@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, kernel-team@meta.com
Subject: Re: [PATCH v2] tools/mm: add hwpoison-panic tool
Message-Id: <20260829193758.b251f3c89f8201bdc585a305@linux-foundation.org>
In-Reply-To: <20260803-memory_failure_rewrite_test-v2-1-ed020ce42129@debian.org>
References: <20260803-memory_failure_rewrite_test-v2-1-ed020ce42129@debian.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Mon, 03 Aug 2026 04:31:20 -0700 Breno Leitao <leitao@debian.org> wrote:

> Add a tool that enables the vm.panic_on_unrecoverable_memory_failure
> sysctl, picks a kernel-owned PFN and writes its physical address to
> hard_offline_page.  Three page kinds are selectable with -k: rodata
> (default), slab or pgtable. In all cases the host should panic.
> 
> Example:
> 
>         # ./hwpoison-panic -k slab --yes-panic-my-kernel
>         injecting hwpoison at phys 0x100032000 (pfn 0x100032, kind=slab)
>         expecting kernel panic: 'Memory failure: <pfn>: unrecoverable page'
> 
> In dmesg, you will see:
> 
>         Memory failure: 0x100032: unhandlable page.
>         Memory failure: 0x100032: recovery action for reserved kernel page: Ignored
>         Kernel panic - not syncing: Memory failure: 0x100032: unrecoverable page
> 
> This lives in tools/mm rather than selftests/mm because every successful
> run crashes the machine, which is not something to run from CI.

I wonder if we can fix this.  Add a knob which tells the kernel not to
panic/oops/crash/etc.  Instead it sends a message "i tried to crash but
you told me not to" and proceeds.

Set that knob around your hwpoison-panic tool and voila, it's now a
selftest.

Wondering if we can sneakily use fault-injection to do this.  Add a new
i_should_crash_now() and use fault-injection to make this function
"fail", by returning zero.  Or something else.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
