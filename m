Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AFEC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Nov 2022 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=slNEYWjaJ9MzMr5B35DrwDB80IKf+bkeZMGznvVUfUk=; b=rucICOwecxMMxD
	tatGwo3EtML+UIi+LdHhEcydCLi6U632Bwo70dhhS8RbNW+/i4pvJuPkfax+3Lxf0t1kjdyKDJSau
	C8gu/LjDhlTvxnKZYpqJSUXL51UDl7Mr0lo2lplNqd3wWn+GV4Mx0fcS/003Cqe2y8a1vPI1JKLYp
	oeXkPCTO1Z9W8aeqkg9lrWaSzkLAKIftsV7gqKtPkpa6UoBNbOfwFooRVVdCrB4Dkw7D8IH4eDL0E
	sp6TxSU0IXsBxHZS+7ATmjXaXkRCdCG+7rqNgT/f699oLuo7r4qnKGSZmZSOwCmgcokV6CsMO6xz6
	46oc8ZddErvq0TRGqtOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owNRb-00DpfJ-1V; Sat, 19 Nov 2022 12:59:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owNRW-00Dpct-UD
	for linux-riscv@lists.infradead.org; Sat, 19 Nov 2022 12:59:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53F4560AB2;
	Sat, 19 Nov 2022 12:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C29C433D6;
	Sat, 19 Nov 2022 12:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668862773;
	bh=GH3OcFTGlji7WySEZa1Up9GuNvYEjwIehpkqlTEViZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nAiCl4P9y7wF9WsoYQyqr2LJq65mihj6peyGogp2ziBuvHVgAdj9KnEV5ug9jiw9j
	 bL9/GXu6mA8nG1HNr5KCX2/zG0032Y0eAMvNkk+06GIb6FwWI9zeCutvrrwfrFlSTg
	 yPZSR9jdVQeZnAHOeR0nAOpWSyR0r4s9mYhyJGj5APGNWESnojXf2FooKGC5oDoi82
	 tLcHqe/Lo6myGvZG+rcO0b6CPOimDOFW4HZL9WX/KViXBrG9V/h8m5OoJ6KuAy6Maq
	 rwmibpPDv3aiKN2c0g2gaWVcy7n4pFbI/5j60Ig9wmtsUr8bfZyrjoKoq+DoNbL8Im
	 hf6InOForGWvA==
Date: Sat, 19 Nov 2022 12:59:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] Add PMEM support for RISC-V
Message-ID: <Y3jTMeeikmNJtq3r@spud>
References: <20221114090536.1662624-1-apatel@ventanamicro.com>
 <Y3JvwagRsMOJyayy@spud>
 <CAK9=C2VRbUiFS2dCNVoC4KJNe4L+EMXNpfSfTrGoFuLRko1TkA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2VRbUiFS2dCNVoC4KJNe4L+EMXNpfSfTrGoFuLRko1TkA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_045935_090307_239BA870 
X-CRM114-Status: GOOD (  27.18  )
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

On Sat, Nov 19, 2022 at 06:11:08PM +0530, Anup Patel wrote:
> On Mon, Nov 14, 2022 at 10:11 PM Conor Dooley <conor@kernel.org> wrote:
> >
> > Hey Anup,
> >
> > Looks like patches 2 and 3 are failing for the nommu defconfigs:
> > https://patchwork.kernel.org/project/linux-riscv/list/?series=694995
> > Unfortunately, if the build fails NIPA doesn't appear to save a log.
> >
> > In case it's relevant, should be gcc-11 & bintutils 2.37.
> 
> I tried nommu defconfigs with gcc-12.1.0 and binutils-2.39 and I did
> not see any failure.

In the interim, I got my new machine set up properly and have gcc-11
locally now (11.1.0) with binutils 2.37. I just gave the series a try
and I cannot see the failure either but I am not using tuxmake.

Apologies for the noise Anup!
FWIW:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Regards,
> Anup
> 
> >
> > Thanks,
> > Conor.
> >
> > On Mon, Nov 14, 2022 at 02:35:33PM +0530, Anup Patel wrote:
> > > The Linux NVDIMM PEM drivers require arch support to map and access the
> > > persistent memory device. This series adds RISC-V PMEM support using
> > > recently added Svpbmt and Zicbom support.
> > >
> > > First two patches are fixes and remaining two patches add the required
> > > PMEM support for Linux RISC-V.
> > >
> > > These patches can also be found in riscv_pmem_v6 branch at:
> > > https://github.com/avpatel/linux.git
> > >
> > > Changes since v5:
> > >  - Rebased on Linux-6.1-rc5
> > >  - Directly add pmem.o in obj-y of PATCH3
> > >  - Dropped PATCH1 since this is already merged.
> > >
> > > Changes since v4:
> > >  - Simplify PATCH2 by implementing RISC-V specific arch_memremap_wb()
> > >
> > > Changes since v3:
> > >  - Pickup correct version of Drew's patch as PATCH1
> > >
> > > Changes since v2:
> > >  - Rebased on Linux-6.1-rc1
> > >  - Replaced PATCH1 with the patch proposed by Drew
> > >
> > > Changes since v1:
> > >  - Fix error reported by test bot
> > >    https://lore.kernel.org/all/202208272028.IwrNZ0Ur-lkp@intel.com/
> > >
> > > Anup Patel (3):
> > >   RISC-V: Fix MEMREMAP_WB for systems with Svpbmt
> > >   RISC-V: Implement arch specific PMEM APIs
> > >   RISC-V: Enable PMEM drivers
> > >
> > >  arch/riscv/Kconfig           |  1 +
> > >  arch/riscv/configs/defconfig |  1 +
> > >  arch/riscv/include/asm/io.h  |  5 +++++
> > >  arch/riscv/mm/Makefile       |  1 +
> > >  arch/riscv/mm/pmem.c         | 21 +++++++++++++++++++++
> > >  5 files changed, 29 insertions(+)
> > >  create mode 100644 arch/riscv/mm/pmem.c
> > >
> > > --
> > > 2.34.1
> > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
