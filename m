Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6688C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 07:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQcaSqgfazsRrUDipj8SrXIou/dYkAY0dEqrFqRmaKs=; b=qyQtApYlqteX92
	D0G1uKe40e2ocOq+ZKJSBbEL+UDzBf77PnTifsdMfggUIXXf+fq3/lJM9Xef+iTQJ/UMa8PYBe/bt
	NaVgTOyGBhH/0/eyIsVMHNw0LEkHk1/k3upn3Nrg3YklME38whgdbLB6MN9ltLv56vSZIIW4CSFZo
	8pDjddU3MpUi3K7QkUdqSkLfYkoOxVkNuPOW3PNzA/Gqr+/agAdO7gvwxjfyY6a8YSeX/dVuBMu9c
	+82lPHOkv2K6SHjgRWBJGR7j+N+Bu7uuzrb3cyPcfz6YDagUwZVuqPfMXZvO7l7EsOyjVfEnQdfYe
	WbacwmI23hgYHHzzflRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvuOZ-00000004uFM-2BeX;
	Sun, 14 Apr 2024 07:35:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvuOU-00000004uB6-33g0;
	Sun, 14 Apr 2024 07:35:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7DD3FCE0660;
	Sun, 14 Apr 2024 07:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E552AC072AA;
	Sun, 14 Apr 2024 07:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713080113;
	bh=3r6JYrqvdbon9DEhTY1H2+qNf7eZiRWdkYsZpzrESPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CkZX4pyVmQMjyHu1MkWMG+OmN+DpitNdvE+8Vnnpv2LwAkTUvDzAFWuF0QZM39J6H
	 Ds3a5kvcM/VK28fYIC44oLB0Bdn+zUbgRasxe5aCWB4xUu/RgLtSeh5qZWnq/2e8FJ
	 rTnb7E26SRg3O/Hr8+YjRqZvnQzlbsBhEdpfwJTzRcQc4vzX1fY1+RLch4UM3gsvOo
	 lhHc3rEpR8JxFCgxftuFbGO+Ys7pTermVZbhFSEMwu4SjmoAKErzDXHDO+V07uYXeL
	 1NKQmyuzEhmwb/N+lOun0QbkHzR0Hj54fWIETmay8j375CiTaSdfa1+arS37433DN9
	 Fj6dSalTyF8Tw==
Date: Sun, 14 Apr 2024 10:34:00 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>, Helge Deller <deller@gmx.de>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>, Will Deacon <will@kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [RFC PATCH 2/7] mm: vmalloc: don't account for number of nodes
 for HUGE_VMAP allocations
Message-ID: <ZhuG6HxnXp036bKk@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-3-rppt@kernel.org>
 <9217c95a-39f6-49ce-9857-ee2eebdb7a16@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9217c95a-39f6-49ce-9857-ee2eebdb7a16@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_003519_821774_C65AAABD 
X-CRM114-Status: GOOD (  22.83  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Apr 12, 2024 at 06:07:19AM +0000, Christophe Leroy wrote:
> =

> =

> Le 11/04/2024 =E0 18:05, Mike Rapoport a =E9crit=A0:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > =

> > vmalloc allocations with VM_ALLOW_HUGE_VMAP that do not explictly
> > specify node ID will use huge pages only if size_per_node is larger than
> > PMD_SIZE.
> > Still the actual allocated memory is not distributed between nodes and
> > there is no advantage in such approach.
> > On the contrary, BPF allocates PMD_SIZE * num_possible_nodes() for each
> > new bpf_prog_pack, while it could do with PMD_SIZE'ed packs.
> > =

> > Don't account for number of nodes for VM_ALLOW_HUGE_VMAP with
> > NUMA_NO_NODE and use huge pages whenever the requested allocation size
> > is larger than PMD_SIZE.
> =

> Patch looks ok but message is confusing. We also use huge pages at PTE =

> size, for instance 512k pages or 16k pages on powerpc 8xx, while =

> PMD_SIZE is 4M.

Ok, I'll rephrase.
 =

> Christophe
> =

> > =

> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >   mm/vmalloc.c | 9 ++-------
> >   1 file changed, 2 insertions(+), 7 deletions(-)
> > =

> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 22aa63f4ef63..5fc8b514e457 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3737,8 +3737,6 @@ void *__vmalloc_node_range(unsigned long size, un=
signed long align,
> >   	}
> >   =

> >   	if (vmap_allow_huge && (vm_flags & VM_ALLOW_HUGE_VMAP)) {
> > -		unsigned long size_per_node;
> > -
> >   		/*
> >   		 * Try huge pages. Only try for PAGE_KERNEL allocations,
> >   		 * others like modules don't yet expect huge pages in
> > @@ -3746,13 +3744,10 @@ void *__vmalloc_node_range(unsigned long size, =
unsigned long align,
> >   		 * supporting them.
> >   		 */
> >   =

> > -		size_per_node =3D size;
> > -		if (node =3D=3D NUMA_NO_NODE)
> > -			size_per_node /=3D num_online_nodes();
> > -		if (arch_vmap_pmd_supported(prot) && size_per_node >=3D PMD_SIZE)
> > +		if (arch_vmap_pmd_supported(prot) && size >=3D PMD_SIZE)
> >   			shift =3D PMD_SHIFT;
> >   		else
> > -			shift =3D arch_vmap_pte_supported_shift(size_per_node);
> > +			shift =3D arch_vmap_pte_supported_shift(size);
> >   =

> >   		align =3D max(real_align, 1UL << shift);
> >   		size =3D ALIGN(real_size, 1UL << shift);

-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
