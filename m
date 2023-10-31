Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685D6C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=USCwxUxuunzU63yUkKQ1eHgDEz+0DASRaTdUbvndnnk=; b=sp/A7pqvSVkACQ
	7S+EUzCfZ0Db0H3f22Y9bSRPKjB3eqKuTxJesMKWvy8RQXr8l2I+vQJ8JTq8svquHa3+y/cX33Uvc
	ptI0u7jxjuGxkFfnNgAKLABewEzYvzyVuZIN1gZ/ve6rUfaOxxzEaYkksiI0XFsG06lb24NPhRout
	RM74dYGSc44uNU8p+wrLJBtm6XXLZl7NCVc+L4YNjuabA6tSIbMAHZIYqK6yqRyHregJYoloe/vWH
	3+Afrr8RpkSYeJOIR+1QFQXaQ0IWRbHwW3kOuWEt4/jgIT5b/BxKKW1LSQq5eTfskX6gJeiECq2/w
	4aia159iBTNzfoP4+Euw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrBd-005ZM6-32;
	Tue, 31 Oct 2023 16:01:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrBb-005ZII-0L
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 16:01:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 837E3B8118A;
	Tue, 31 Oct 2023 16:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD9FC433CB;
	Tue, 31 Oct 2023 16:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698768104;
	bh=rVGDA5l5XMBTi0V0K/IGiXNLLOmJh6uj0HeO7DdsFvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdQC0+K9rKvtxaBcU+6idbv/givSi+gAWgGP45ACzWF+oddgTAnhcIexRC/nFaf3m
	 9sPc81XIUiAHxVMBQPhFoXhzNS/RAGIkr9ieo0yiDEuI1SGSTd4T5biRNR1t3wqKNF
	 7Cb3JQsYHxhPqzxjO16r4OXfNCASuAkueobAklJCA5+nbWuBV0Hyc1qoPgwg/HOfLr
	 eB5imTUweKjvJBLocGlnsvcvG8aUtLuz5Ht7w73XI8zmwaKxbchL6F78QUsj18FrSF
	 URqO3hWkcDcWHffx+nO7Z9+eAF1SPMfcdZO1bI6hoFJmHJDarvwhqRMPT6IwBm5LJ3
	 FHchhoYE7/3fg==
Date: Tue, 31 Oct 2023 23:49:29 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
Message-ID: <ZUEiCUxcd11inlRP@xhacker>
References: <20231031143521.441-1-jszhang@kernel.org>
 <20231031153242.k9tLdSby@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231031153242.k9tLdSby@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_090147_290640_76008AF1 
X-CRM114-Status: GOOD (  14.08  )
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

On Tue, Oct 31, 2023 at 04:32:42PM +0100, Sebastian Andrzej Siewior wrote:
> On 2023-10-31 22:35:19 [+0800], Jisheng Zhang wrote:
> > This series is to add PREEMPT_RT support to riscv. Compared with last
> > year's try[1], there are two major changes:
> > 
> > 1. riscv has been converted to Generic Entry. And RT maintainers has
> > introduced PREEMPT_AUTO, so its support for riscv as well.
> > 
> > 2. three preparation patches(patch1/2/3 in [1]) has been merged in
> > mainline.
> 
> There is no third patch in the series, right? If so then the amount in
> shortlog is consistent with I received.

Yes there's no third patch. I didn't use the correct number in patch0's
subject.

> 
> > Jisheng Zhang (2):
> >   riscv: add PREEMPT_AUTO support
> >   riscv: allow to enable RT
> > 
> >  arch/riscv/Kconfig                   | 2 ++
> >  arch/riscv/include/asm/thread_info.h | 2 ++
> >  2 files changed, 4 insertions(+)
> 
> Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
