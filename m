Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A57C02183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 21:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZQ+a+DMCESs9MVIKe2fsLF0pVzodjpXE7ErUySIIvs=; b=FKmmK6b0wmV/4VBUOtrpZMKwy+
	mwrYCTrYV41xrrNgqYdPwuAd0aVfaE3Ys8kQqKoqWtKpBvXa6BwWT4Uu4Wkm00ssZp6KTo430z2SO
	Q5BETNpYgOwNs769OlbC5UwhS5Fn7by27U8+PlRekAPjlhgLEmrMJBELeYN7M1EGyabwlaYjFMsie
	USKz2aXhcw/e/maQouPUu97nsy2zDbgFkycUJ/eitftgcpNnFOwQHbBW2ZabN7+bzIELmHLi85B6N
	u4uo5yUy+5d6TcBQJC11vTfV4H5pLQ/nGn9KM5idMJuvUmoL2i2tRJfLkuGdB/K3j5YBbqaKJeFBm
	+Yvf2tPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYX5w-0000000G6Z0-1LTs;
	Thu, 16 Jan 2025 21:08:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYX5t-0000000G6X2-3OMM
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 21:08:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 77096A4277F;
	Thu, 16 Jan 2025 21:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BB0C4CED6;
	Thu, 16 Jan 2025 21:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737061680;
	bh=jz4mFU9u1twIuaW1pCTzx/vWfeheqpZU6b45voKJ0ZI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JgJhFSFlpSgBwC33cUPlLEwY7nroUBe4Dh4dJJ1Qbrf5FiYoxOrVTwPsTUcxxfRFU
	 BfPi2xogBfE+QgsczG8EqWUNKWtN9TWbjTpe00eeUlDg/q0ggTEq2iMMOuG2iOSYS0
	 cuuRUi9Eb9n4m/y9LibBZbDIhP/n3R8EddH/XQ75ywVAjo5zVH0ncK3WhKrOQtxfXP
	 yHB6WuTxiAKzrk3XZyc83WHb/ow7ffLfGY9t5c7rjRFO1leS+gfsrvlKE1t6JGXnEw
	 Dk92qEqVbimIs50isLxQCVjD+KR1csIFVVVcsKRPf1TRQC96vpaMIlbvnKyedvA4Kk
	 GAoAla+4VpnAQ==
Date: Thu, 16 Jan 2025 13:07:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Milan_=C4=90oki=C4=87?= <milandjokic1995@gmail.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-Vgh
In-Reply-To: <CAKp59VG=MV2=gCFqsC16EpP9oGa=eDBFJbwn-vS5q8oKyM_ZJQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2501161304480.2684657@ubuntu-linux-20-04-desktop>
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com> <alpine.DEB.2.22.394.2501141554170.2684657@ubuntu-linux-20-04-desktop> <2f1432e6-0d27-48fd-b034-475284f14233@gmail.com> <CAKp59VEOiXo+OKwPNiomtXNCsfDURCXaDktooi5JSoTSdhc90w@mail.gmail.com>
 <alpine.DEB.2.22.394.2501151313590.2684657@ubuntu-linux-20-04-desktop> <CAKp59VG=MV2=gCFqsC16EpP9oGa=eDBFJbwn-vS5q8oKyM_ZJQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-352887263-1737061680=:2684657"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_130802_000774_C76A1397 
X-CRM114-Status: GOOD (  50.27  )
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>, Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>, oleksandr_tyshchenko@epam.com, iommu@lists.linux.dev, aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, Slavisa.Petrovic@rt-rk.com, takakura@valinux.co.jp
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-352887263-1737061680=:2684657
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 Jan 2025, Milan Đokić wrote:
> On Wed, Jan 15, 2025 at 10:14 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
> >
> > On Wed, 15 Jan 2025, Milan Đokić wrote:
> > > Hello Stefano, Oleksii
> > >
> > > On Wed, Jan 15, 2025 at 5:30 PM Oleksii Kurochko
> > > <oleksii.kurochko@gmail.com> wrote:
> > > >
> > > > Hi Stefano,
> > > >
> > > > On 1/15/25 1:01 AM, Stefano Stabellini wrote:
> > > >
> > > > +Oleksii
> > > >
> > > > On Tue, 14 Jan 2025, Milan Djokic wrote:
> > > >
> > > > From: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> > > >
> > > > This patch introduces initial support for running RISC-V as a Xen guest.
> > > > It provides the necessary infrastructure and stubs for Xen-specific
> > > > operations. Key changes include:
> > > >
> > > > - Modifications to the RISC-V kernel to integrate Xen-specific hypercalls
> > > >   and interfaces, with function implementations stubbed for future work.
> > > > - Introduction of Xen-specific headers for RISC-V, including event
> > > >   handling, hypervisor interaction, and page management. Functions are
> > > >   defined but not yet implemented.
> > > > - Stub implementations for memory management, grant tables, and context
> > > >   switching in the Xen environment, allowing further development and
> > > >   integration.
> > > >
> > > > Signed-off-by: Milan Djokic <Milan.Djokic@rt-rk.com>
> > > > Signed-off-by: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> > > >
> > > > Hi Milan, Slavisa,
> > > >
> > > > Thank you very much for your contribution! Which Xen tree are you using
> > > > for development?
> > > >
> > > > They are using [1] and have separate branches on top of latest. So we are in
> > > > sync. Also, if you are interested we have created a task/epics for this feature in
> > > > [1] so you could also check there some details:
> > > > 1. https://gitlab.com/groups/xen-project/people/olkur/-/epics/5
> > > > 2. https://gitlab.com/xen-project/people/olkur/xen/-/issues/12
> > > >
> > > >  I am asking because RISC-V support in Xen is still in
> > > > the process of being upstreamed, and [1] is the tree that consolidates
> > > > all patches currently on the to-be-upstreamed list.
> > > >
> > > > While the specific Xen tree you are using is not particularly important
> > > > at this stage, and using [1] is not a requirement, I am asking because
> > > > it is essential to align on the hypervisor ABI, especially regarding any
> > > > details that have not yet been upstreamed. Specifically, is there
> > > > anything in this patch series that relies on features not yet upstream
> > > > in Xen?
> > > >
> > > > There are few features but some things which are Rt-Tk's branch in [1] could go
> > > > without waiting for these features to be upstreamed.
> > > >
> > > > Thanks.
> > > >
> > > > ~ Oleksii
> > > >
> > > > [1] https://gitlab.com/xen-project/people/olkur/xen/-/tree/latest?ref_type=heads
> > >
> > > As Oleksii already explained, we are working in sync with his latest
> > > branch where most of the risc port is done.
> >
> > Perfect, I was hoping you'd say that! :-)
> > It is great to have you on board.
> >
> >
> > > I would just add that this patch introduces kernel risc-v hypercall
> > > support on which only our branch on xen tree depends on. Therefore, it
> > > won't disrupt any functionality with current upstream Xen, it will
> > > just introduce kernel functionality which is not used from Xen side
> > > until our branch is merged upstream.
> >
> > Ideally, we should upstream the Xen side of an interface first to Xen,
> > then add support for the interface to Linux. Let me make a concrete
> > example. Let's say that you upstream hypercall support to Linux first,
> > using SBI_ECALL defined as 0xE. Then, during the upstreaming process,
> > the Xen community decides to change SBI_ECALL to 0XEA1 to make it the
> > same as ARM. You'd have to change the Linux code again to fix it. To
> > avoid this, it is best to wait upstreaming the Linux side, until the Xen
> > side is Acked.
> >
> Sure, I got your point. This is actually one of the things we were not
> sure about (whether we should upstream Linux or Xen side first).
> Anyways it's good that we got review comments. We'll fix this patch
> according to suggestions and send it back when Xen side is upstream.

Thank you! In general, "first upstream to Xen, then to Linux" is a good
guideline, but we can be flexible. For instance, in the case of
hypercalls that seem pretty obvious how we are going to implement them,
it might be sufficient to send a simple patch to Xen to add a document
under xen.git/docs/ to document how the hypercall ABI will look like on
RISC-V, without the implementation. With that document committed to
xen.git, we can go forward with upstreaming the Linux side, even if the
upstream Xen implementation is still lacking.
--8323329-352887263-1737061680=:2684657
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-352887263-1737061680=:2684657--

