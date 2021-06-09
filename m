Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1784C48BCD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 16:02:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4C05610F8
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 16:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4C05610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMvhlo9VKbz06iJNZ+CMKk5xA6cDp9SydRRLHGUvjOI=; b=In3nJH9lsxMktL
	2vSnEz97mafRALWiR5SPpGMed8T0b9WXAwTei663tWU7BFdJK1CgEjqP2Cm71/RGUYT0O3ISZuezn
	jNMVsXqTsY9UBtfpyFk9C+RBHjeJJ4D3Opg+U+YTdA8cNJ8H24p6bhVZQS0XfnoAiJhGWuWu1nxyX
	83+466a7Is1Ob71pX+8IU4Zygqnpsz0MyCyNCJl3zVQR4V+Qolt5uasySHI4ZAnEFZeP5/CEEBCHe
	MliRzhUjbMoS0vbqDMFVxY3YnFgTf6dQnneDlSJ01xX6VdnEPltorvH3fhTLceWp51PYEAcbICyBg
	iNEuEWZBDklzw3v9vSnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr0eh-00Elba-H2; Wed, 09 Jun 2021 16:02:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqzXp-00EPfj-Lk; Wed, 09 Jun 2021 14:51:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2163C6128A;
 Wed,  9 Jun 2021 14:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623250261;
 bh=svcXYr1x4uog0gl91R41ozY2Q0KNDzZmG4YRGTMMy2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YkHX/JVfHqUvpWvWXkgg3rdrkk7agHtEIKqaX0vfSpX504lTGaDjO7Qz7iARqzkGp
 DWsHVY+tAbRsBUSVBkbhVjgZvGY6y/wRIXGMo+CgzooB/zqPomfgnsHX9y3mgTbMXc
 xGiW+RangNEk+pKIT8UX8w6paGaFQZLDQ+McKqTpjqFKueMHIVGMXJpalfW0Fph76r
 Lcm2WPwzewVnde/Vu5ujWTdQssxwNbFghUliAxp8Ku3YbSQHaHnLbkGz+awfGrnWGJ
 yu4qANQoP9p9s4/vzkSPeJiYpDnHVlRdjW4xbBVW2tivL4go8M8laNS3QaNsdGKKc0
 R1JEjjJpSG45g==
Date: Wed, 9 Jun 2021 17:50:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jonathan Corbet <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
 Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 alpha <linux-alpha@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-ia64@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 sparclinux <sparclinux@vger.kernel.org>
Subject: Re: [PATCH v2 0/9] Remove DISCINTIGMEM memory model
Message-ID: <YMDVSu00xXGmdCtC@kernel.org>
References: <20210604064916.26580-1-rppt@kernel.org>
 <CAK8P3a2tZDJDqgr9-1vJrnbDhd_36eKq8LMEznDkU7rvuAnAag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2tZDJDqgr9-1vJrnbDhd_36eKq8LMEznDkU7rvuAnAag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_075101_777220_832B1AC4 
X-CRM114-Status: GOOD (  21.78  )
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

On Wed, Jun 09, 2021 at 01:30:39PM +0200, Arnd Bergmann wrote:
> On Fri, Jun 4, 2021 at 8:49 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > Hi,
> >
> > SPARSEMEM memory model was supposed to entirely replace DISCONTIGMEM a
> > (long) while ago. The last architectures that used DISCONTIGMEM were
> > updated to use other memory models in v5.11 and it is about the time to
> > entirely remove DISCONTIGMEM from the kernel.
> >
> > This set removes DISCONTIGMEM from alpha, arc and m68k, simplifies memory
> > model selection in mm/Kconfig and replaces usage of redundant
> > CONFIG_NEED_MULTIPLE_NODES and CONFIG_FLAT_NODE_MEM_MAP with CONFIG_NUMA
> > and CONFIG_FLATMEM respectively.
> >
> > I've also removed NUMA support on alpha that was BROKEN for more than 15
> > years.
> >
> > There were also minor updates all over arch/ to remove mentions of
> > DISCONTIGMEM in comments and #ifdefs.
> 
> Hi Mike and Andrew,
> 
> It looks like everyone is happy with this version so far. How should we merge it
> for linux-next? I'm happy to take it through the asm-generic tree, but linux-mm
> would fit at least as well. In case we go for linux-mm, feel free to add

Andrew already took to mmotm.
 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks!

> for the whole series.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
