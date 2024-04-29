Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B46C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 16:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTNfdZvrw9/J/d3iS3WzZpGUYRttHp20Chnkn6gwDGk=; b=xVd3POYb+IyoM+
	R452wDQorA9zKlDH/iI5kAzaHzHBCuLbwq76uYhED1ZXj/y9+StcLJ9mVhbQxf20m8RzHjG3Abuf4
	7iEmNINAHAbGqj+RanaKnNt3FsXpAFyIzqm+24GWFGx9sQcDV9RAwlxnm2SBj9fPjMMDw+Zfy+Vvt
	pej6AF/P7PtcTEPJgfVzaxQ/iX90EimZJ0sL+0ve2Yr/N15pBrIAAqrAefEnGx1Fqw82GZQDxWeDD
	T1WsusZdfOenf9gjrjaxTe9At7UHCAhGNPlI2IDMdk8amZlcIdv9aPJ6wChmk6CM6Xgr4H2hcwQ6D
	E86EgXzQkqde2XAqYd+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Tse-00000003aI4-0UFc;
	Mon, 29 Apr 2024 16:29:28 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1TsW-00000003aGE-0Yao;
	Mon, 29 Apr 2024 16:29:20 +0000
Date: Mon, 29 Apr 2024 09:29:20 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Sam Ravnborg <sam@ravnborg.org>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v7 00/16] mm: jit/text allocator
Message-ID: <Zi_K4K-j-VB_WI4i@bombadil.infradead.org>
References: <20240429121620.1186447-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240429121620.1186447-1-rppt@kernel.org>
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

On Mon, Apr 29, 2024 at 03:16:04PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> Hi,
> 
> The patches are also available in git:
> https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=execmem/v7
> 
> v7 changes:
> * define MODULE_{VADDR,END} for riscv32 to fix the build and avoid
>   #ifdefs in a function body
> * add Acks, thanks everybody

Thanks, I've pushed this to modules-next for further exposure / testing.
Given the status of testing so far with prior revisions, in that only a
few issues were found and that those were fixed, and the status of
reviews, this just might be ripe for v6.10.

  Luis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
