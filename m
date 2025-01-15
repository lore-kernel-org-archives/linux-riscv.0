Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67E5C02183
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 21:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:
	Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:
	Date:Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhBG6y4+4OHpFjx9iaSOZLk151Gesmx5Kr5+CKsWgUo=; b=tXP+pRK2Ebe+id4nYKA7aRrF4C
	MBUB+Gxb+8qgAj8fvgpNQiA/mufOqwMuif20ReEuxyeyDB/GVpu9jED21ZfmG274+EKl4shPRhGAo
	jiXUqqSJSqD9BFPLFHj1R+ILf81XAsxgjq41umWQblCr5/MKUyRcpmLgmwBzhXityZtiJDzV0/qWk
	d2RCS0EJj3zhtpYw6ErmNJfCt8wbl/OeGSOp7j1hFZNhmib5mM3EwCEAjvYABX+bhLkTqUoUukNjx
	WPIv9Rx/YO1n6cgcfK5ih4ZMifr4fY1iXlUjbHiuI/ZOE/W/dp/zrZsStnuEL9sbFttIZnmXlzvdQ
	/DCRMH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAiJ-0000000D7Yt-1XqY;
	Wed, 15 Jan 2025 21:14:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAiG-0000000D7YK-494H
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 21:14:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DEC06A4257D;
	Wed, 15 Jan 2025 21:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92BD8C4CED1;
	Wed, 15 Jan 2025 21:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736975647;
	bh=GSZxHIs9dp+FZg5P9WqYYWNg3o6iXgaDEmNeunkFR5Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nz+0ZO0maeYDVcdt4IttvrH2VJaySUaTh81HiQqvbLgKFaMmS1uL2pL/Uw4t1WsYn
	 OTPVtWL2eGn7MjzNyhaa+VC+Uh0qlCf0NbTXY5Gz3QGG9KjotVxVOwUSn2FzB0j7j7
	 aBN7rpbhTnuPNM7obnAGq40hj9BQNt08yq6MqJTZ7Aqw+5dIAH9+PKcH4lksL/s18I
	 i2P/D/fWusSFAAl0Hk5499Cn7yFXuMIrSmGEQ7PLT3ijyVGjYu4j9iaSzjz+Dz1I8P
	 97s3QmeMQfRReqzhMPt84KOKdTBjDVmMfhkgQrF66yoot6y+9S61dS0xhdoD/mvKha
	 8r4xsGMI4q/mw==
Date: Wed, 15 Jan 2025 13:14:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Milan_=C4=90oki=C4=87?= <milandjokic1995@gmail.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-Vgh
In-Reply-To: <CAKp59VEOiXo+OKwPNiomtXNCsfDURCXaDktooi5JSoTSdhc90w@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2501151313590.2684657@ubuntu-linux-20-04-desktop>
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com> <alpine.DEB.2.22.394.2501141554170.2684657@ubuntu-linux-20-04-desktop> <2f1432e6-0d27-48fd-b034-475284f14233@gmail.com>
 <CAKp59VEOiXo+OKwPNiomtXNCsfDURCXaDktooi5JSoTSdhc90w@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1821502211-1736975200=:2684657"
Content-ID: <alpine.DEB.2.22.394.2501151307240.2684657@ubuntu-linux-20-04-desktop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_131409_153292_840044F6 
X-CRM114-Status: GOOD (  41.00  )
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
Cc: jgross@suse.com, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, iommu@lists.linux.dev, Stefano Stabellini <sstabellini@kernel.org>, palmer@dabbelt.com, paul.walmsley@sifive.com, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, Slavisa.Petrovic@rt-rk.com, aou@eecs.berkeley.edu, takakura@valinux.co.jp
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1821502211-1736975200=:2684657
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2501151307241.2684657@ubuntu-linux-20-04-desktop>

On Wed, 15 Jan 2025, Milan Đokić wrote:
> Hello Stefano, Oleksii
> 
> On Wed, Jan 15, 2025 at 5:30 PM Oleksii Kurochko
> <oleksii.kurochko@gmail.com> wrote:
> >
> > Hi Stefano,
> >
> > On 1/15/25 1:01 AM, Stefano Stabellini wrote:
> >
> > +Oleksii
> >
> > On Tue, 14 Jan 2025, Milan Djokic wrote:
> >
> > From: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> >
> > This patch introduces initial support for running RISC-V as a Xen guest.
> > It provides the necessary infrastructure and stubs for Xen-specific
> > operations. Key changes include:
> >
> > - Modifications to the RISC-V kernel to integrate Xen-specific hypercalls
> >   and interfaces, with function implementations stubbed for future work.
> > - Introduction of Xen-specific headers for RISC-V, including event
> >   handling, hypervisor interaction, and page management. Functions are
> >   defined but not yet implemented.
> > - Stub implementations for memory management, grant tables, and context
> >   switching in the Xen environment, allowing further development and
> >   integration.
> >
> > Signed-off-by: Milan Djokic <Milan.Djokic@rt-rk.com>
> > Signed-off-by: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> >
> > Hi Milan, Slavisa,
> >
> > Thank you very much for your contribution! Which Xen tree are you using
> > for development?
> >
> > They are using [1] and have separate branches on top of latest. So we are in
> > sync. Also, if you are interested we have created a task/epics for this feature in
> > [1] so you could also check there some details:
> > 1. https://gitlab.com/groups/xen-project/people/olkur/-/epics/5
> > 2. https://gitlab.com/xen-project/people/olkur/xen/-/issues/12
> >
> >  I am asking because RISC-V support in Xen is still in
> > the process of being upstreamed, and [1] is the tree that consolidates
> > all patches currently on the to-be-upstreamed list.
> >
> > While the specific Xen tree you are using is not particularly important
> > at this stage, and using [1] is not a requirement, I am asking because
> > it is essential to align on the hypervisor ABI, especially regarding any
> > details that have not yet been upstreamed. Specifically, is there
> > anything in this patch series that relies on features not yet upstream
> > in Xen?
> >
> > There are few features but some things which are Rt-Tk's branch in [1] could go
> > without waiting for these features to be upstreamed.
> >
> > Thanks.
> >
> > ~ Oleksii
> >
> > [1] https://gitlab.com/xen-project/people/olkur/xen/-/tree/latest?ref_type=heads
> 
> As Oleksii already explained, we are working in sync with his latest
> branch where most of the risc port is done.

Perfect, I was hoping you'd say that! :-)
It is great to have you on board.


> I would just add that this patch introduces kernel risc-v hypercall
> support on which only our branch on xen tree depends on. Therefore, it
> won't disrupt any functionality with current upstream Xen, it will
> just introduce kernel functionality which is not used from Xen side
> until our branch is merged upstream.

Ideally, we should upstream the Xen side of an interface first to Xen,
then add support for the interface to Linux. Let me make a concrete
example. Let's say that you upstream hypercall support to Linux first,
using SBI_ECALL defined as 0xE. Then, during the upstreaming process,
the Xen community decides to change SBI_ECALL to 0XEA1 to make it the
same as ARM. You'd have to change the Linux code again to fix it. To
avoid this, it is best to wait upstreaming the Linux side, until the Xen
side is Acked.

This was just an example, and Andrew is right that the SBI
Implementation ID for Xen is reserved to 0x7, see the SBI specification.
--8323329-1821502211-1736975200=:2684657
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1821502211-1736975200=:2684657--

