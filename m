Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA455C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 18:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1saHR8u3MBhMKBVNQOCNLwr+nJiMAh2v+Vl2Mm5g2c=; b=Z9HGhQI2zbsDX9
	8qV/Dc4RuPQXoIg1uj+XnmmCTWXdK/BTe0L6CMRQID4i2PEsn+t/ie3MCbH5xQQaMjpw+fkBxSssK
	kwfB2Oxudmf8+X7t/teW/mXy2y9tNCfMaVkCEfU19q0+GUDZVzNdSYzQ1Ja5jK0Cp1wRD0nfZT1Ef
	qBSD5p29NsoBKa1LMe4v6YDOmYr2mugr+PAAH2GOUL8UCOdIzGTCw45M5r47gITO+JRLevgbHr0mh
	BS3ewiJm2vbbguVUqkIxPNICkiJ+wo47xZfso+bsJ6Qfh8GFD3PGwltlxw/WTR8yaGMFJtGj5NkGP
	pSYegED9G9ifcYwpngXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKPEs-0088d1-67; Wed, 16 Feb 2022 18:41:18 +0000
Received: from mx2.smtp.larsendata.com ([91.221.196.228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKPEo-0088al-VD
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 18:41:16 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 0f791715-8f58-11ec-b2df-0050568cd888;
 Wed, 16 Feb 2022 18:41:32 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id B2BEB194B1C;
 Wed, 16 Feb 2022 19:41:12 +0100 (CET)
Date: Wed, 16 Feb 2022 19:41:09 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 linux@armlinux.org.uk, will@kernel.org, guoren@kernel.org,
 bcain@codeaurora.org, geert@linux-m68k.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, nickhu@andestech.com, green.hu@gmail.com,
 dinguyen@kernel.org, shorne@gmail.com, deller@gmx.de,
 mpe@ellerman.id.au, peterz@infradead.org, mingo@redhat.com,
 mark.rutland@arm.com, hca@linux.ibm.com, dalias@libc.org,
 davem@davemloft.net, richard@nod.at, x86@kernel.org,
 jcmvbkbc@gmail.com, ebiederm@xmission.com,
 akpm@linux-foundation.org, ardb@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v2 15/18] sparc64: remove CONFIG_SET_FS support
Message-ID: <Yg1FRZcrhlh5C//V@ravnborg.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-16-arnd@kernel.org>
 <Yg1D08+olCSGmnYU@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yg1D08+olCSGmnYU@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_104115_190272_19CA44A9 
X-CRM114-Status: GOOD (  20.35  )
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

Hi Arnd,

On Wed, Feb 16, 2022 at 07:34:59PM +0100, Sam Ravnborg wrote:
> Hi Arnd.
> 
> On Wed, Feb 16, 2022 at 02:13:29PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > sparc64 uses address space identifiers to differentiate between kernel
> > and user space, using ASI_P for kernel threads but ASI_AIUS for normal
> > user space, with the option of changing between them.
> > 
> > As nothing really changes the ASI any more, just hardcode ASI_AIUS
> > everywhere. Kernel threads are not allowed to access __user pointers
> > anyway.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/sparc/include/asm/processor_64.h   |  4 ----
> >  arch/sparc/include/asm/switch_to_64.h   |  4 +---
> >  arch/sparc/include/asm/thread_info_64.h |  4 +---
> >  arch/sparc/include/asm/uaccess_64.h     | 20 +-------------------
> >  arch/sparc/kernel/process_64.c          | 12 ------------
> >  arch/sparc/kernel/traps_64.c            |  2 --
> >  arch/sparc/lib/NGmemcpy.S               |  3 +--
> >  arch/sparc/mm/init_64.c                 |  7 ++++---
> >  8 files changed, 8 insertions(+), 48 deletions(-)
> 
> I think you somehow missed the Kconfig change, and also the related
> sparc32 change which continue to have set_fs() after this patch.
I now notice the sparc32 bits are in the last patch.
To avoid breaking bisect-ability on sparc64 I think you need to merge
the sparc32 changes with this patch, unless the sparc64 changes can
coexist with CONFIG_SET_FS continue to be set.

	Sam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
