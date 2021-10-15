Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F641C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 16:19:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3EA76109E
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 16:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3EA76109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/w4IOQ+HNkdB5arYyG1K1X7Rwi7H0Sa0wUkZ905i7FM=; b=KY5reSzTBiUdxy
	jam0lmIg5kBtK0v4NdGwcIdXmg37Ug/PrVqP+iSxoaL3O/fSsy1mVBSKZwtazN8KUvzWtD0rnSKUC
	hPlmYyfCUroG3PuIslOCnJfk4BgRuJ2gu/FcCYsnyj06/oKBq75vcnPmMgMbzdqWw3P8xoMp8mC3g
	ThyXMhRrrsibohZRgDWPrteocg8VlCKWu2u6yUEGEpM7QB92cS7GmkgKp+Six+gz4KqYDWXhzEUnT
	MnusZtPmjhVGQvFct0D9hxaiO9g4VizRbOTdR8YqMA7hnLv/JiijmWHd5nqt9p9z1MzkwfVVardWQ
	H1gH4NzR9t7zS1uSyTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbPv1-0083ed-QE; Fri, 15 Oct 2021 16:18:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbPtQ-0082hI-Oc
 for linux-riscv@bombadil.infradead.org; Fri, 15 Oct 2021 16:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4G571e+7WIYw8I8DxxzASA83VdzBwRS9bXXbSuaKaJk=; b=BOf7V74lD3FXPUP4kCK2U0TLoV
 SAznVCk8FeJ+WeewdASQRvl3LuAkpeUPeUYt7Yezk4dwcdYMeynJPLMmXX2ketg/uIbydVfP3fx8i
 4IFF/PRVghZskAnfs53YUmskIsiWSmMUiZqjhTPe2PmaC9LPuznv8Q8JxnB/Lk+IXoOffuE21e2zN
 4QFyJJFjuCIGlI7Rxldtg9k0stkjBnL/ARkashob96yYMpeLCBfkQx787ELuOwu+KLpO4wtbU8EZc
 64hcntxiBp7R1+VdlnNysKcyoHyA19AEgiAw6E5CIm3GsV2jlF1r0Te0gVoh+BTh2SRD+pD6oIJjU
 sHkd9clg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbPtJ-00A1p8-2k; Fri, 15 Oct 2021 16:17:05 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 02CA79857C7; Fri, 15 Oct 2021 18:17:02 +0200 (CEST)
Date: Fri, 15 Oct 2021 18:17:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org,
 =?utf-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>,
 Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <20211015161702.GF174703@worktop.programming.kicks-ass.net>
References: <20211015110035.14813389@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015110035.14813389@gandalf.local.home>
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

On Fri, Oct 15, 2021 at 11:00:35AM -0400, Steven Rostedt wrote:
> From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> 
> While writing an email explaining the "bit = 0" logic for a discussion on

>  	bit = trace_get_context_bit() + start;

While there, you were also going to update that function to match/use
get_recursion_context(). Because your version is still branch hell.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
