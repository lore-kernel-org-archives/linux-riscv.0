Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E200BC001CC
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 19:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1YpAIYmNN/HWmGdYODbQLoZiUllDhNI/NaqsaTwLaY=; b=X7ZHH48j9AwSV8
	dDz1pmhbBJZkUF0jnVxbLZtoMpO+fcBGYSCHGrAdXPWHAmGn5bcH2kAn07LMFgbEM4/0S3Vt/5pcQ
	EWZ1um3DeuYat3fQHq+g7nXDBMRW+GX0P+gfnrJVYHp/rxDG6gE6EeKkXv094+70Y3sop6rYOEGCK
	2WGbuoqvUOXqY3RkmH5wrrKRK5v41TMXmoiqSk0wEFGhB7f2l6SgnX3GdQahC00eIFwBZAFC40Zfd
	A29Bkq6wCWNCQqatDNbMZIUvStvs2ZxradLGaf6YwkbeS7gxa0w0YecvbIEGppO4H4wjB+qEtdOrd
	rtDHjvre2th7o/CIuXIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv0JJ-0000000DvcI-39qV;
	Thu, 11 Apr 2024 19:42:13 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv0JB-0000000Dvah-2hQJ;
	Thu, 11 Apr 2024 19:42:05 +0000
Date: Thu, 11 Apr 2024 12:42:05 -0700
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
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
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
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <Zhg9DXzagPbpNGH1@bombadil.infradead.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411160051.2093261-6-rppt@kernel.org>
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

On Thu, Apr 11, 2024 at 07:00:41PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> module_alloc() is used everywhere as a mean to allocate memory for code.
> 
> Beside being semantically wrong, this unnecessarily ties all subsystems
> that need to allocate code, such as ftrace, kprobes and BPF to modules and
> puts the burden of code allocation to the modules code.
> 
> Several architectures override module_alloc() because of various
> constraints where the executable memory can be located and this causes
> additional obstacles for improvements of code allocation.
> 
> Start splitting code allocation from modules by introducing execmem_alloc()
> and execmem_free() APIs.
> 
> Initially, execmem_alloc() is a wrapper for module_alloc() and
> execmem_free() is a replacement of module_memfree() to allow updating all
> call sites to use the new APIs.
> 
> Since architectures define different restrictions on placement,
> permissions, alignment and other parameters for memory that can be used by
> different subsystems that allocate executable memory, execmem_alloc() takes
> a type argument, that will be used to identify the calling subsystem and to
> allow architectures define parameters for ranges suitable for that
> subsystem.

It would be good to describe this is a non-fuctional change.

> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---

> diff --git a/mm/execmem.c b/mm/execmem.c
> new file mode 100644
> index 000000000000..ed2ea41a2543
> --- /dev/null
> +++ b/mm/execmem.c
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0

And this just needs to copy over the copyright notices from the main.c file.

  Luis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
