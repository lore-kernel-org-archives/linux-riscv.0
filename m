Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9E7C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 21:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=dC+/T013sKLuF32uodIibc0ksP/1CpshpJcpObeQpdE=; b=tTHI8J6CKO+Q6K
	UptlWrnSiHdK6yF7eU9/hU1jOYjIYdeqeEceKHh37GVPtRSMMQxtpV56zJyg7g2Zkl73gefyrKg4a
	P4mzHKdozdu0d5/mCv/qiN7IyPnYA95TxryZLAlk/HoZJS9ENU+Q8eQlHG+P8Zoj4dvPr2MT6cw5k
	sxvZA9ojbAyr5Vxll5st7Ua52ebQYQO1mnPFqT1mpmT4P6gUiuKim+K4WUytaSNZEyqYfvFIJV3IK
	b4lyWcpPWjhoHu2QkNrJD89aGH5qePLVAlgE+HWWfQSQT7Msc/gTfrGshnX+6fWd+fjKWXznL9UEI
	CiUCab8v130JZGI/yg8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmMEw-00Cior-4v; Wed, 04 May 2022 21:08:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmMEl-00CimD-I0; Wed, 04 May 2022 21:08:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE761616A3;
 Wed,  4 May 2022 21:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F213FC385A4;
 Wed,  4 May 2022 21:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651698522;
 bh=y1eZ0VyTuh3OSu3SZE5hnm+6Lqgi7WUL9wuM4x9LDoU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=OV+zeMEqAJx67x4OYYs/T+PwaB9EPFjKfNsjZzrWwMVM3NvLvNFpPf0wDtRgV6hPg
 C/vW0RHXE+D3VHZkPbIlT7vV9H8IzZjwKHGMG7joXJdlZZ7WJg8oDJqQBcpyc4rw/O
 yxAB78m6HEpQDrzbacEayJr8iiRcV1EWi7mSGZxb5IDhBXSg0dvOB0Jpz0xpdKT8q1
 53W71wtG3ZAAJTFq4C2Bw331IYIMqmF+azzr+0ky2kC+20quz/B/hGbW52VPMkvf2m
 sc7xISbNbAO/Ktfv/RlrnLm3f7ClaHPrrdpfMsEfr0tf1mKOlzAyEBnIbIHem9sEJj
 ZVekgou/eHQhA==
Date: Wed, 4 May 2022 16:08:40 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, 
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Message-ID: <20220504210840.GA469916@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429135108.2781579-2-schnelle@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_140843_705840_56CFAB30 
X-CRM114-Status: GOOD (  13.82  )
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

On Fri, Apr 29, 2022 at 03:49:59PM +0200, Niklas Schnelle wrote:
> We introduce a new HAS_IOPORT Kconfig option to indicate support for
> I/O Port access. In a future patch HAS_IOPORT=n will disable compilation
> of the I/O accessor functions inb()/outb() and friends on architectures
> which can not meaningfully support legacy I/O spaces such as s390 or
> where such support is optional. 

So you plan to drop inb()/outb() on architectures where I/O port space
is optional?  So even platforms that have I/O port space may not be
able to use it?

This feels like a lot of work where the main benefit is to keep
Kconfig from offering drivers that aren't of interest on s390.

Granted, there may be issues where inb()/outb() does the wrong thing
such as dereferencing null pointers when I/O port space isn't
implemented.  I think that's a defect in inb()/outb() and could be
fixed there.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
