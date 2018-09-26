Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41FDC43382
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 14:27:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7937520684
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 14:27:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QL8EQf9u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7937520684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xh1Oq3QxKYxBtJfBzlOW+nbTHZ1Fmz5UY6NESIlR4io=; b=QL8EQf9uwiebaI
	kR0ZoemduMQcjzMt7BPKIHifmd+sRDZ6RuFQ9t/nHbB3W7tHdBeTe8r+POD1emDBdXE3oTPtXIg1G
	2hQxCErPeXq2ZKI1BJFcsMnRyw5FtCaCoPnQ/D2/tFPdtQfJ8EFprMiDh7kHR/PdLqyGhX1PsQfMM
	35WCLSzft4WVNi1f0D0VlJ9ynBwUVycdQWilWNoBkzdyWiryueq14mgsuUm/icIsP4t1T5KCjgJWz
	Fo+dx+4syMDnq+y7pfUTn3XPQEHwMDHVbhmQSueY9AHXiciwV0ca7n++4/Iotn0xeqRXybSEC3+RQ
	C1GKDiFdzrPJxgV4kstw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g5AmR-00065B-C7; Wed, 26 Sep 2018 14:27:07 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5AjG-00048z-H0; Wed, 26 Sep 2018 14:23:52 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3B687AC38;
 Wed, 26 Sep 2018 14:23:26 +0000 (UTC)
Date: Wed, 26 Sep 2018 16:23:19 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: [PATCH 14/30] memblock: add align parameter to
 memblock_alloc_node()
Message-ID: <20180926142319.GA6278@dhcp22.suse.cz>
References: <1536927045-23536-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1536927045-23536-15-git-send-email-rppt@linux.vnet.ibm.com>
 <20180926093127.GO6278@dhcp22.suse.cz>
 <20180926093648.GP6278@dhcp22.suse.cz>
 <20180926134335.GF4628@rapoport-lnx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180926134335.GF4628@rapoport-lnx>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180926_072350_731232_2D2B713E 
X-CRM114-Status: GOOD (  15.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "James E.J. Bottomley" <jejb@parisc-linux.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 nios2-dev@lists.rocketboards.org, Thomas Gleixner <tglx@linutronix.de>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Richard Kuo <rkuo@codeaurora.org>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Richard Weinberger <richard@nod.at>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, Ley Foon Tan <lftan@altera.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180926142319.Y-E76-OHC8kz7YYxi9yHhrI9bXF55bmxnlBuF1Bvf9M@z>

On Wed 26-09-18 16:43:35, Mike Rapoport wrote:
> On Wed, Sep 26, 2018 at 11:36:48AM +0200, Michal Hocko wrote:
> > On Wed 26-09-18 11:31:27, Michal Hocko wrote:
> > > On Fri 14-09-18 15:10:29, Mike Rapoport wrote:
> > > > With the align parameter memblock_alloc_node() can be used as drop in
> > > > replacement for alloc_bootmem_pages_node() and __alloc_bootmem_node(),
> > > > which is done in the following patches.
> > > 
> > > /me confused. Why do we need this patch at all? Maybe it should be
> > > folded into the later patch you are refereing here?
> > 
> > OK, I can see 1536927045-23536-17-git-send-email-rppt@linux.vnet.ibm.com
> > now. If you are going to repost for whatever reason please merge those
> > two. Also I would get rid of the implicit "0 implies SMP_CACHE_BYTES"
> > behavior. It is subtle and you have to dig deep to find that out. Why
> > not make it explicit?
> 
> Agree. I'd just prefer to make it a separate patch rather then resend the
> whole series. 

Sure, no objection from me.

-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
