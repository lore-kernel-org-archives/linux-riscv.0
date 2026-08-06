Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AB9C55ABF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 07:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tk8ld01kjFDZZtwzkXA45UZbsjwYyEHCnYV2gdww/is=; b=CeS7rv+ostNxtP
	LleTkFH5nCKY8S3xYjQDZqXKb6T3mxdoJXOYBYZy41Yqw9I6HfD3rk3N+BqvAerIbIkpfsXC7Ufvo
	xzEXUxL0b+A5oOarkh68pkkTLJQdelquSIFGZVGyxlPZn0206jIQ06tU96QzvHi0qEe4RcQ8Ic4hj
	DSRdtQKbWTbfVfqEmUsa6NNFH3tJtlnTDNvEkBNir7xLIaVaU/Wslp4q3R4GqbW/CXEj7mEbWis/d
	ykM/p1CInGEHJcPozC5hFi2qFCGnDZexx9P1voys36KTOZ/BwV2ji7a5a1l/lS/mLDA3D1AcWOSzF
	y/MCchl73ZdOLL0JpjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsLd-000000057fI-0VMk;
	Thu, 06 Aug 2026 07:17:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsLb-000000057f0-3zVa;
	Thu, 06 Aug 2026 07:17:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 515A360A64;
	Thu,  6 Aug 2026 07:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CEE1F000E9;
	Thu,  6 Aug 2026 07:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786000619;
	bh=NXENzFGewvbVKEIJwXHYAIoiYNIgGa+Cz5Fo0Nhu2JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P2eClChD/AaOKwmAmAyPQS1DUnipFlxmEzB/eMjNEPjEZ5aqwC0SmjO6Gyf/gc9Mf
	 Y8TZpzplAPvWlbF9BNnJxxPUlusi9jGsZkeCvUZIhmRdYmNFXoQarDX1ytS+V60mGE
	 vMzHPk+Q4aZKzwILGzfSNWjeY/XsFH+sOUJJPSMii1RG1HdF8/za5vnD1S/ynoDBKM
	 nnZMlXWiW2gRlqlxwvxMwBlaEaoQegPOoN+OtOvVaF+G3COJg+PqcpJ0htnn+2mAM5
	 H/nKGQ08QO9jgCFDwzl6sJmNYiICc/IQW2zsN/jzKgslc5XdoBHmPvJB3FTZMZl6Fn
	 EHwjv/NOpoFlg==
Date: Thu, 6 Aug 2026 10:16:48 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	driver-core@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] drivers/base, mm: move arch_numa.c to mm/
Message-ID: <anQ04CpxDjqktbbB@kernel.org>
References: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
 <anQyFuRVekkN8Z5a@lucifer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <anQyFuRVekkN8Z5a@lucifer>
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

On Thu, Aug 06, 2026 at 08:06:12AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Aug 06, 2026 at 09:58:38AM +0300, Mike Rapoport (Microsoft) wrote:
> > arch_numa.c implements boot time discovery and initialization of NUMA
> > topology on architectures that select GENERIC_ARCH_NUMA (currently arm64
> > and riscv).
> >
> > Since this is step in the initialization of the memory management
> > subsystem, it's logical to have arch_numa.c in mm/ alongside numa.c,
> > numa_memblks.c and numa_emulation.c.
> >
> > Move arch_numa.c to mm/ and add its F: entry to "MEMBLOCK AND MEMORY
> > MANAGEMENT INITIALIZATION" in MAINTAINERS.
> >
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> Everything is proceeding as I have foreseen... soon we shall have control
> of all of the kernel! ;)

I'm also eyeing drivers/base/memory.c, but that one is more involved :)
 
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
 
Thanks!

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
