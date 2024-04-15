Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744A0C00A94
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wE71YIAoVJSejF2Yd3cQ+I1y3KBfrubaw//oYfz2b78=; b=u9gxnuAVWhrKy6
	vUq0ut2IJhZ5zQ/CHPupp1/ZGyM1thZqIRs/2P8MY0LvoMtDhpa2FIPacWF9auxpuyJ4gEW4JjpvQ
	+22b2j73O3WwtyXA1j/ER/FvzMjuKEp7gzlfleTUe07bO+GMudfmmQ3wRBC+/B6lstsAXSFtpbMeb
	q8S7OPy/j9tlXuKeuMHJsBQpxMGKWwQhDEVaHbWKlQpz6t0KRKPHz7m32YenK3IX3cQwl2UtXezYq
	ZgXnDvtU/IhXG49Bhc177GnyrGOBB+vskdTXOtivi1AhXz4bSBcE/4VMMlnOqeZaQBCjT+GPirff2
	Del85V+vLtsjebK8idVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwQGM-00000009LgZ-2rli;
	Mon, 15 Apr 2024 17:37:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwQGF-00000009Lcd-3tpw;
	Mon, 15 Apr 2024 17:36:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30ED11515;
	Mon, 15 Apr 2024 10:37:23 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.38.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6579A3F64C;
	Mon, 15 Apr 2024 10:36:49 -0700 (PDT)
Date: Mon, 15 Apr 2024 18:36:39 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Bj\"orn T\"opel" <bjorn@kernel.org>,
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
Message-ID: <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415075241.GF40213@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_103656_508283_FE78D163 
X-CRM114-Status: GOOD (  23.23  )
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

Yeah, and really I'd *much* rather deal with that in arch code, as I have said
several times.

For arm64 we have two bsaic restrictions: 

1) Direct branches can go +/-128M
   We can expand this range by having direct branches go to PLTs, at a
   performance cost.

2) PREL32 relocations can go +/-2G
   We cannot expand this further.

* We don't need to allocate memory for ftrace. We do not use trampolines.

* Kprobes XOL areas don't care about either of those; we don't place any
  PC-relative instructions in those. Maybe we want to in future.

* Modules care about both; we'd *prefer* to place them within +/-128M of all
  other kernel/module code, but if there's no space we can use PLTs and expand
  that to +/-2G. Since modules can refreence other modules, that ends up
  actually being halved, and modules have to fit within some 2G window that
  also covers the kernel.

* I'm not sure about BPF's requirements; it seems happy doing the same as
  modules.

So if we *must* use a common execmem allocator, what we'd reall want is our own
types, e.g.

	EXECMEM_ANYWHERE
	EXECMEM_NOPLT
	EXECMEM_PREL32

... and then we use those in arch code to implement module_alloc() and friends.

Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
