Return-Path: <SRS0=LUeZ=A7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE82C433E1
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 17:47:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9316E20709
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 17:47:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bdWmGCJw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlqRcxTu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9316E20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e1aunWUwTuzilzdUMFFopfNO/zeBRRUoByYuDEwSjF0=; b=bdWmGCJwlzraGAYZJFm9CRLjZ
	jjLzaeE4QVx2yK1sNYlxJRhvPQa/Rc+qd2qy+vjLp9/QVxBoUTwxfHMvtiHHAZBY7dhFaiDeSpykK
	XZ/kOFLVSYHWN7tMcFj+gQBsfpq0ffnpUFZWL+GCC1yYR4I7nqSSA06ro4K0snv+UOOuJIB3Q7jTs
	EV0efYVqGLi8ZcbpiAxAIF2ltNrdGpz2tnaFjyMWCn38EFzEmwLj/I2rB0WLdUxEJ+j7H/40IhVtj
	ev7u+ZbDKJU2I+uNYjhh+ZPU7sHwfZ2Aw5DVyJkdEDv3n8J6492cVuBdRII51CBKwXGKNdximLiRp
	DDd3cNPWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxZsd-0005Md-Sk; Mon, 20 Jul 2020 17:47:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxZsY-0005KT-FI; Mon, 20 Jul 2020 17:47:07 +0000
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45F9D20709;
 Mon, 20 Jul 2020 17:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595267225;
 bh=h7xTJHL3tD3hyqROKlN47q+7JtwYj6iU2IDwcwmnD10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YlqRcxTuXQfRrbeqatLbuRaOeADiac4H6X9sEArUzE5oRMfR8PHkKo5MsS8CqIiH2
 30gUB8awpWvMVLHqbmwCRcCebqbRb3WB5zVyQMWCeasxnsnHVcByE17hsBPHomNYe/
 2IYK/lsU5KfUy43NS89poYLzWTie5RjpZ+F0ezt8=
Date: Mon, 20 Jul 2020 20:46:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/6] mm: introduce secretmemfd system call to create
 "secret" memory areas
Message-ID: <20200720174650.GD8593@kernel.org>
References: <20200720092435.17469-1-rppt@kernel.org>
 <20200720092435.17469-4-rppt@kernel.org>
 <CAK8P3a0NyvRMqH7X0YNO5E6DGtvZXD5ZcD6Y6n7AkocufkMnHA@mail.gmail.com>
 <20200720142053.GC8593@kernel.org>
 <CAK8P3a07jAec4hKyNMcha032TT6OXjYHaZZ4Za9ncDsvapeg8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a07jAec4hKyNMcha032TT6OXjYHaZZ4Za9ncDsvapeg8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_134706_846953_5E831920 
X-CRM114-Status: GOOD (  32.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Linux-MM <linux-mm@kvack.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 linux-arch <linux-arch@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 linux-nvdimm@lists.01.org, Will Deacon <will@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 linaro-mm-sig@lists.linaro.org, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux API <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 20, 2020 at 04:34:12PM +0200, Arnd Bergmann wrote:
> On Mon, Jul 20, 2020 at 4:21 PM Mike Rapoport <rppt@kernel.org> wrote:
> > On Mon, Jul 20, 2020 at 01:30:13PM +0200, Arnd Bergmann wrote:
> > > On Mon, Jul 20, 2020 at 11:25 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > >
> > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > >
> > > > Introduce "secretmemfd" system call with the ability to create memory areas
> > > > visible only in the context of the owning process and not mapped not only
> > > > to other processes but in the kernel page tables as well.
> > > >
> > > > The user will create a file descriptor using the secretmemfd system call
> > > > where flags supplied as a parameter to this system call will define the
> > > > desired protection mode for the memory associated with that file
> > > > descriptor. Currently there are two protection modes:
> > > >
> > > > * exclusive - the memory area is unmapped from the kernel direct map and it
> > > >               is present only in the page tables of the owning mm.
> > > > * uncached  - the memory area is present only in the page tables of the
> > > >               owning mm and it is mapped there as uncached.
> > > >
> > > > For instance, the following example will create an uncached mapping (error
> > > > handling is omitted):
> > > >
> > > >         fd = secretmemfd(SECRETMEM_UNCACHED);
> > > >         ftruncate(fd, MAP_SIZE);
> > > >         ptr = mmap(NULL, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED,
> > > >                    fd, 0);
> > > >
> > > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > >
> > > I wonder if this should be more closely related to dmabuf file
> > > descriptors, which
> > > are already used for a similar purpose: sharing access to secret memory areas
> > > that are not visible to the OS but can be shared with hardware through device
> > > drivers that can import a dmabuf file descriptor.
> >
> > TBH, I didn't think about dmabuf, but my undestanding is that is this
> > case memory areas are not visible to the OS because they are on device
> > memory rather than normal RAM and when dmabuf is backed by the normal
> > RAM, the memory is visible to the OS.
> 
> No, dmabuf is normally about normal RAM that is shared between multiple
> devices, the idea is that you can have one driver allocate a buffer in RAM
> and export it to user space through a file descriptor. The application can then
> go and mmap() it or pass it into one or more other drivers.
> 
> This can be used e.g. for sharing a buffer between a video codec and the
> gpu, or between a crypto engine and another device that accesses
> unencrypted data while software can only observe the encrypted version.

For our usecase sharing is optional from one side and there are no
devices involved from the other.

As James pointed out, there is no match for the userspace API and if
there will emerge a usacase that requires integration of secretmem with
dma-buf, we'll deal with it then.

>        Arnd

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
