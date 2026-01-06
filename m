Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7A6CE9D5A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 15:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuaLcqHW6SnNmJhGUPhJ8pvl47m0pdYTHv50WizGoBc=; b=VJ6lyRAC51y9JM
	3SyzXStkWzUTIKFZZYNGSLAvhd20yPHgidxr2UmlYwiL7/LxCR0egHS29P196aJfBPfTdt1xR7mz6
	7yhACo9zkcGwSVRklA8hTTDxmoa928hADdFWsHeJgxGw+DBvRa62yUHy7ygnrVbqu8NZtlu2JUyIf
	VOFg5PQZbLPx1ZP6nEoR6O8jX3Nq78efqalVDmS3WxKTFWWiXx/NYNDvqL6c7vXK9IVvQT1k1US7S
	DrBKwGpVwOJEjoYt6YgEHuJr2vG1uc0ldDxF0erEr8pXqTjR+2kXB1Lx5OGv0/cH61Y0OvVuRicqa
	0qaHpxMrp9eYq5XlDOZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8wI-0000000DP2Y-0MsS;
	Tue, 06 Jan 2026 15:25:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8wG-0000000DP2L-3naK;
	Tue, 06 Jan 2026 15:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WfYfd1PzaMaipLKoSbmZze99juo76um6Ea96kj/deqg=; b=QEdpsuNl7ia0un9wF36SttoObu
	nxQEI5WIklTjmDfhrXDmpkPWlxy8UkL6Iqr3LpMakwafmglnFlnXsR5VXVC58V/ZHYkv6AMaKolqx
	/cVr5UJwW1UKZEMlstf6VqpxSWes3tMyHVBIc7W0cJpBdY7idKsO/hNVuRMW8C2V6W76GEHI2hfis
	9LOA40VS74ERDGDEfcydRZnoxE/Xdw8aWQhtCvTN5o2OjkX/+pXncxFEUdmVzLQxJFtvjWUBMr1AT
	do7k2fi00jp3bllKENz1pIemqqzAvW+cZB4IfzbmjRFj6rGMZHixTPqAj4H63R0U2vBEtx8//4DEg
	K94AiDUw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8wE-00000009xZY-3ZDj;
	Tue, 06 Jan 2026 15:25:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5D63E30056B; Tue, 06 Jan 2026 16:25:38 +0100 (CET)
Date: Tue, 6 Jan 2026 16:25:38 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Keke Ming <ming.jvle@gmail.com>, mhiramat@kernel.org,
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	tsbogend@alpha.franken.de, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/5] uprobes: transition from kmap_atomic to
 kmap_local_page
Message-ID: <20260106152538.GA3707891@noisy.programming.kicks-ass.net>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
 <aVj146EunyaOQzxO@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aVj146EunyaOQzxO@redhat.com>
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

On Sat, Jan 03, 2026 at 11:56:35AM +0100, Oleg Nesterov wrote:
> On 01/03, Keke Ming wrote:
> >
> > Keke Ming (5):
> >   riscv/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
> >   arm64/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
> >   mips/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
> >   arm/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
> >   uprobes: use kmap_local_page() for temporary page mappings
> >
> >  arch/arm/probes/uprobes/core.c     |  4 ++--
> >  arch/arm64/kernel/probes/uprobes.c |  4 ++--
> >  arch/mips/kernel/uprobes.c         |  4 ++--
> >  arch/riscv/kernel/probes/uprobes.c |  4 ++--
> >  kernel/events/uprobes.c            | 12 ++++++------
> >  5 files changed, 14 insertions(+), 14 deletions(-)
> 
> Thanks,
> 
> Acked-by: Oleg Nesterov <oleg@redhat.com>

Let me go stick them in tip/perf/core

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
