Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD63ECE579
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 14:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mQCodTHcGKN25/mJ7uGaHfFNe9DpG1cVsBCSkhHGmrk=; b=s6CfsPzaB0Tf5e
	/JMe3+NSNAbA7+3nSWbjeDaPcqRfXdEs7Q2/UzR6/5dDtDoEDDFMMZ6eeCZFg5Y5MJp7M3masIv1i
	CHuFHsdgInOyf71bYHi8LKdV5cq73U0hp76244fdF7elzSpmgZU1IVQvy6aAWi7zvdg2VT4Jz7AYv
	4G46xFQJW1AUQdjBTUxDZKPoeQGUdpzLniojN1SkMs9JQQ4hfk5D+DAazx2PaNIoMggTy5j7ZlwLX
	sq9fBqeAkFdKpqd9uMDzdnF7LOfyWdpLtIDN2cP4HSgbVZb2ENTHFvH103pYkMDxfSuu/MNwkKDzD
	VBpS1AOUpS1s+vgZpC6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snfiD-00000002Lmc-0bk9;
	Mon, 09 Sep 2024 14:49:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snfiA-00000002Lki-0GsT;
	Mon, 09 Sep 2024 14:49:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B62E3A43CB7;
	Mon,  9 Sep 2024 14:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23C7C4CEC5;
	Mon,  9 Sep 2024 14:49:41 +0000 (UTC)
Date: Mon, 9 Sep 2024 10:49:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, Andy
 Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav
 Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Christoph Hellwig <hch@infradead.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen
 <dave.hansen@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Helge
 Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet
 <kent.overstreet@linux.dev>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, Russell
 King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Stafford Horne
 <shorne@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas
 Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Vineet
 Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3 6/8] x86/module: perpare module loading for ROX
 allocations of text
Message-ID: <20240909104940.71d8464c@gandalf.local.home>
In-Reply-To: <Zt8HiAzcaZS8lHT-@kernel.org>
References: <20240909064730.3290724-1-rppt@kernel.org>
	<20240909064730.3290724-7-rppt@kernel.org>
	<20240909092923.GB4723@noisy.programming.kicks-ass.net>
	<Zt8HiAzcaZS8lHT-@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_074950_287381_347EB670 
X-CRM114-Status: GOOD (  13.73  )
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

On Mon, 9 Sep 2024 17:34:48 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> > This is insane, just force BUILDTIME_MCOUNT_SORT  
> 
> The comment in ftrace.c says "... while mcount loc in modules can not be
> sorted at build time"
>  
> I don't know enough about objtool, but I'd presume it's because the sorting
> should happen after relocations, no?
> 

IIRC, the sorting at build time uses scripts/sorttable.c, which from what I
can tell, only gets called on vmlinux.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
