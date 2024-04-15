Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC37C00A94
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 16:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/jI4z1exJxnphy1AEpKXTYbyn2jt36Qc3iS/bq2IPg=; b=MI+ILnBj+CJnhz
	7NJzA120zfQCS0DOHYTucVioPU1sPg58HFxJpIQXnOFzaw0hTJOmcP6B5qXQKIfIZ5snQ5ReKzpE3
	1BzO/RF1K57QyK4x50GbD80MQTkvMPoulXjcrS/L3Ph9ddZSwMMjwxd/laQUjjjMWA40eXx4VmwIa
	Xc+44yHzH1+6/ji0I0yd/2Waa95BX2cJIDCEqrJnxHJwuLE00+5Pr1fz0eZvAnm7A4J/dQ70QX1rz
	dpyRFSxoGIYlvHY0DLGaWiGAO9NFSm5LLOw+xu8sdQy1n2Pq9h/aK8kR+/vM9UFntlIobP6oS4PId
	YaHEQB/nqS2U4wa12m9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPa0-000000099qM-11Ph;
	Mon, 15 Apr 2024 16:53:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPZw-000000099o3-3IgN;
	Mon, 15 Apr 2024 16:53:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9732BCE0E42;
	Mon, 15 Apr 2024 16:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57527C113CC;
	Mon, 15 Apr 2024 16:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713199989;
	bh=xJZBsBz/ovkewwHaqkWgEKUCLl3sCJ9igaEyaiYi248=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n9583Q6y/kVDUsC/Sk35DHsUlzQxomP4brOeJWEqMK5tTGdFfL5yXDBwNh/dc1R8t
	 OnTvm1XERGxz1JxTUG2JWpufMQFhEpCf0upLztHBi97mz83HQzMB81Cj+bMHmQeLrO
	 vdSyDt4foue7u5p0z1MAb6dHJ1a7FzO8x/EelybB33sZUvBK4gAoiim0DQVOThRBq2
	 3ERPw7wOWw5Nw3DB6b+PtiKpkHgDPedzRaGZsUTWRIfT1yQsmJ+qNm4oAZ/M1rF747
	 dHBdlhRGfIq7wIyTjPR6B4GdpTUD5V0JGj4lcLZS8oQu4cdKYlcTv5ldjuZ1AicK/r
	 qCFC3y/AMEfuA==
Date: Mon, 15 Apr 2024 19:51:52 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
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
	Luis Chamberlain <mcgrof@kernel.org>,
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
Message-ID: <Zh1bKAaD7nLyJ9ya@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415075241.GF40213@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_095313_211592_2574A741 
X-CRM114-Status: GOOD (  24.61  )
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

On Mon, Apr 15, 2024 at 09:52:41AM +0200, Peter Zijlstra wrote:
> On Thu, Apr 11, 2024 at 07:00:41PM +0300, Mike Rapoport wrote:
> > +/**
> > + * enum execmem_type - types of executable memory ranges
> > + *
> > + * There are several subsystems that allocate executable memory.
> > + * Architectures define different restrictions on placement,
> > + * permissions, alignment and other parameters for memory that can be used
> > + * by these subsystems.
> > + * Types in this enum identify subsystems that allocate executable memory
> > + * and let architectures define parameters for ranges suitable for
> > + * allocations by each subsystem.
> > + *
> > + * @EXECMEM_DEFAULT: default parameters that would be used for types that
> > + * are not explcitly defined.
> > + * @EXECMEM_MODULE_TEXT: parameters for module text sections
> > + * @EXECMEM_KPROBES: parameters for kprobes
> > + * @EXECMEM_FTRACE: parameters for ftrace
> > + * @EXECMEM_BPF: parameters for BPF
> > + * @EXECMEM_TYPE_MAX:
> > + */
> > +enum execmem_type {
> > +	EXECMEM_DEFAULT,
> > +	EXECMEM_MODULE_TEXT = EXECMEM_DEFAULT,
> > +	EXECMEM_KPROBES,
> > +	EXECMEM_FTRACE,
> > +	EXECMEM_BPF,
> > +	EXECMEM_TYPE_MAX,
> > +};
> 
> Can we please get a break-down of how all these types are actually
> different from one another?
> 
> I'm thinking some platforms have a tiny immediate space (arm64 comes to
> mind) and has less strict placement constraints for some of them?

loongarch, mips, nios2 and sparc define modules address space different
from vmalloc and use that for modules, kprobes and bpf (where supported).

parisc uses vmalloc range for everything, but it sets permissions to
PAGE_KERNEL_RWX because it's PAGE_KERNEL_EXEC is read only and it lacks
set_memory_* APIs.

arm has an address space for modules, but it fall back to the entire
vmalloc with CONFIG_ARM_MODULE_PLTS=y.

arm64 uses different ranges for modules and bpf/kprobes. For kprobes it
does vmalloc(PAGE_KERNEL_ROX) and for bpf just plain vmalloc().
For modules arm64 first tries to allocated from 128M below kernel_end and
if that fails it uses 2G below kernel_end as a fallback.

powerpc uses vmalloc space for everything for some configurations. For
book3s-32 and 8xx it defines two ranges that are used for module text,
kprobes and bpf and the module data can be allocated anywhere in vmalloc.

riscv has an address space for modules, a different address space for bpf
and uses vmalloc space for kprobes.

s390 and x86 have modules address space and use that space for all
executable allocations.

The EXECMEM_FTRACE type is only used on s390 and x86 and for now it's there
more for completeness rather to denote special constraints or properties.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
