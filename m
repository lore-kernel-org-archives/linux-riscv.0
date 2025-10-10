Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA27CCD184
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 01:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXpwgjIx6Tufqzu0zT6cYHxsZZcfHZeSwK8XeWrQpeI=; b=NW5Bl5bVM0Hnam
	QWm7kqgC+dBhXyj0GsJgqMvkM7n69Rxj+J4pfQc+cUEADwC8feipTNuvxUDT1Y642fVVLHJY6jol5
	5SeqAUOjVggpRE0sWo+bWwFHyqIQv5UM9QeEXze3KZPGtTPQ7vLlzJEAeAPknl14l6LakQjYfSppc
	E6fsg62eGlvWeuNfsti1ddnGqZaw2ZvgfzALmL86MZef+zHmpl2gi8Hr55oY1NdCqQPQoj5ch5Jpq
	5ATrMo18WDtmJIVVFBjl6JhE6o/IUDa13u8V0aNpOhXTi7EWJSk3ucOa10sFMG3lk9hfs1d6hVKiV
	hOnyFlXf3f9z3fi20iMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v71jr-00000007PqQ-0tMs;
	Fri, 10 Oct 2025 01:16:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v71jl-00000007Ppe-3g9G
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 01:16:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1336B48C3A;
	Fri, 10 Oct 2025 01:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF5FC4CEE7;
	Fri, 10 Oct 2025 01:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1760058960;
	bh=RmFN50/tFdDWu0Lu1oLgK6Ek0UwcaDtGkskQjflrkSU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vKsenpAgWw4PdXzyPEvRPTtM55CEkmIuOB06QpIL1HFkJaREveyrGwluU/V2fuGGi
	 q5TX7S4AkHAZd7NNOwoSKw4Q9atEptf5m3QREyryBOZ6qV8TyjDyjvN90WleZ6Id1/
	 W86zK2v0N2lj5WYbHcSmtpC+EsAstPuLctnj85O0=
Date: Thu, 9 Oct 2025 18:15:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Conor Dooley
 <conor@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing
 <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 00/18] riscv: Memory type control for platforms with
 physical memory aliases
Message-Id: <20251009181559.7bfa3dce6cb7265822b2d5c5@linux-foundation.org>
In-Reply-To: <20251009015839.3460231-1-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_181602_339578_24C845E2 
X-CRM114-Status: GOOD (  16.01  )
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

On Wed,  8 Oct 2025 18:57:36 -0700 Samuel Holland <samuel.holland@sifive.com> wrote:

> On some RISC-V platforms, including StarFive JH7100 and ESWIN EIC7700,
> DRAM is mapped to multiple physical address ranges, with each alias
> having a different set of statically-determined Physical Memory
> Attributes (PMAs), such as cacheability. Software can alter the PMAs for
> a page by selecting a PFN from the corresponding physical address range.
> On these platforms, this is the only way to allocate noncached memory
> for use with noncoherent DMA.

Well that's weird.

> --- a/mm/ptdump.c
> +++ b/mm/ptdump.c
> @@ -31,7 +31,7 @@ static int ptdump_pgd_entry(pgd_t *pgd, unsigned long addr,
>  			    unsigned long next, struct mm_walk *walk)
>  {
>  	struct ptdump_state *st = walk->private;
> -	pgd_t val = READ_ONCE(*pgd);
> +	pgd_t val = pgdp_get(pgd);
>  
>  #if CONFIG_PGTABLE_LEVELS > 4 && \
>  		(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))

OK, but how are we to maintain this?  Will someone be running
grep/coccinelle/whatever on each kernel release?

Please give some thought to finding a way to break the build if someone
uses a plain dereference or a READ_ONCE().  Or add a checkpatch rule. 
Or something.  Let's not rely upon the whole world knowing about this.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
