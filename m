Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3555FC5AC67
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 19:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIaZOiNOb1o+22+JWRVkf9GbqEWsmxtdrrDCmCwG7dI=; b=KfLYG87szdf5/2
	XjUJsRRKUEqBbpnIzbDeCHaQlg11gSnLkvSwQMRoU+9s5+CW7pFxWHzTfx+jP6mK7DQJKHJKN0EsX
	k8t3j1RBPhreM8pYXoPVBvXhXQSDR6STN4HBLrU2l8RGFieo/iSEK6+oiwPuJE/27PdSinHxoT3Sk
	71cooTKytfLgGDfxBBD4E89odBXDCgEb8HCPAcMD1tWgubkfZ2/YNiF69z8+hQG5jhmPlQF45DQer
	8Y/epFNqf13Eo2y7hAXoaAn5BGBx9uBWl/oD6xHXY3SHRnsBXMoQPTj4bE8q8d+V/belerJl+t1cE
	b21QFVhWKA7MzGlhLQxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3RZ-00000006XlS-0W4A;
	Thu, 06 Aug 2026 19:07:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3RX-00000006Xke-2mia;
	Thu, 06 Aug 2026 19:07:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A0B64182B;
	Thu,  6 Aug 2026 19:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D4A1F000E9;
	Thu,  6 Aug 2026 19:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786043271;
	bh=xSIBxESI2LsoRGEYRs0/9j6hglmt3A0LXyVRlu9kWmA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=CfDkMLMzLkdPHXnqlLhKxkA5MeUXehC8NdKjRJBzoZmebvdfnnhwObhxkBqNlM0wW
	 rFocRMiNewSiN8UT1BNMlYNaCW6FazoO0n+VUsaknt/d6/gbAt8fXwozs541gOl1Qc
	 F2YXl+HPKcLs9sJiQln6F5qYu39DSoVlaakxAxDHetlYuVUSG3ATDF8n/1bPEXxH+1
	 CFCqY9SH4AzZkR0uXmXdtSfa3IfxxheRp4+K1ySCezNOtEc1Q0msqsWU/XODkmmOVx
	 DJtHDUFJ4vI4riMV9qziNdXdv4qWhHQhy6yNM72ba6yIA8DlKp1S0mLrG3SxlbawtX
	 FK0lteBG7yUhA==
Mime-Version: 1.0
Date: Thu, 06 Aug 2026 21:07:45 +0200
Message-Id: <DKI3HX8TBEH0.336LUXTWQJL70@kernel.org>
Subject: Re: [PATCH] drivers/base, mm: move arch_numa.c to mm/
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "David Hildenbrand" <david@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Liam R. Howlett"
 <liam@infradead.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Michal Hocko"
 <mhocko@suse.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley"
 <pjw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, "Vlastimil Babka" <vbabka@kernel.org>,
 "Will Deacon" <will@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
In-Reply-To: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
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

On Thu Aug 6, 2026 at 8:58 AM CEST, Mike Rapoport (Microsoft) wrote:
> arch_numa.c implements boot time discovery and initialization of NUMA
> topology on architectures that select GENERIC_ARCH_NUMA (currently arm64
> and riscv).
>
> Since this is step in the initialization of the memory management
> subsystem, it's logical to have arch_numa.c in mm/ alongside numa.c,
> numa_memblks.c and numa_emulation.c.
>
> Move arch_numa.c to mm/ and add its F: entry to "MEMBLOCK AND MEMORY
> MANAGEMENT INITIALIZATION" in MAINTAINERS.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Danilo Krummrich <dakr@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
