Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C882C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 02:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhnvC2L+pRxNDsTOWa9TwEqw7mcDbdbPXPjf0TYdVmc=; b=hiW+4qxEGq2Y2/
	hDQLa2E4pZ0anl3nrRzEwPLIEI1DcqY2quEjzhoKL1cul8NPCGXcC9IqQdMmIfEEJxqOkqIvxkWeV
	Qx0VqG+w+poTvwqL63oP66BSyNeckFjdBS5inZuMY1J1jYeaTZFhq+mWNfOb3NAAddPo1ycfG2ad9
	Nmebt2jyNY7SRFMnodK08OWjGckJTEo1ZMAX+b4GvpDNz6PxsmJJL6n0dT7dZnsp+3TsVEosNbO9c
	pMd4xylkZTl/E6KC1tecldG6WeEdKqa72TwfGeb40H6hCNnLbuXLofy73qqbVvAh8YyXzTnummbAA
	U+tS6SDZvX1U2Nu/03zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q60L4-00DpTm-1E;
	Mon, 05 Jun 2023 02:52:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q60Kz-00DpRD-38;
	Mon, 05 Jun 2023 02:52:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 234C661C4A;
	Mon,  5 Jun 2023 02:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC71FC433EF;
	Mon,  5 Jun 2023 02:52:46 +0000 (UTC)
Date: Sun, 4 Jun 2023 22:52:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Nadav Amit <nadav.amit@gmail.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, Thomas Gleixner
 <tglx@linutronix.de>, "mcgrof@kernel.org" <mcgrof@kernel.org>,
 "deller@gmx.de" <deller@gmx.de>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "x86@kernel.org" <x86@kernel.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "rppt@kernel.org"
 <rppt@kernel.org>, "linux-trace-kernel@vger.kernel.org"
 <linux-trace-kernel@vger.kernel.org>, "linux-parisc@vger.kernel.org"
 <linux-parisc@vger.kernel.org>, "christophe.leroy@csgroup.eu"
 <christophe.leroy@csgroup.eu>, Will Deacon <will@kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>, "naveen.n.rao@linux.ibm.com"
 <naveen.n.rao@linux.ibm.com>, "sparclinux@vger.kernel.org"
 <sparclinux@vger.kernel.org>, "linux-modules@vger.kernel.org"
 <linux-modules@vger.kernel.org>, "bpf@vger.kernel.org"
 <bpf@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "song@kernel.org"
 <song@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH 12/13] x86/jitalloc: prepare to allocate exectuatble
 memory as ROX
Message-ID: <20230604225244.65be9103@rorschach.local.home>
In-Reply-To: <50D768D7-15BF-43B8-A5FD-220B25595336@gmail.com>
References: <20230601101257.530867-1-rppt@kernel.org>
	<20230601101257.530867-13-rppt@kernel.org>
	<0f50ac52a5280d924beeb131e6e4717b6ad9fdf7.camel@intel.com>
	<ZHjcr26YskTm+0EF@moria.home.lan>
	<a51c041b61e2916d2b91c990349aabc6cb9836aa.camel@intel.com>
	<ZHjljJfQjhVV/jNS@moria.home.lan>
	<68b8160454518387c53508717ba5ed5545ff0283.camel@intel.com>
	<50D768D7-15BF-43B8-A5FD-220B25595336@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_195254_069716_E4AF486D 
X-CRM114-Status: GOOD (  13.24  )
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

On Thu, 1 Jun 2023 16:54:36 -0700
Nadav Amit <nadav.amit@gmail.com> wrote:

> > The way text_poke() is used here, it is creating a new writable alias
> > and flushing it for *each* write to the module (like for each write of
> > an individual relocation, etc). I was just thinking it might warrant
> > some batching or something.  

Batching does exist, which is what the text_poke_queue() thing does.

-- Steve


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
