Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7E8C04FF6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 07:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bow4zfDpp2iP+cKTaFMqZruWRMADXkH0bu4gzD0AkMc=; b=gyzK9u5Ci53OE8
	yJoE0Hz9tdH97j22cLDigjsL8xdbESp0otgqgR06sy81mf/b5dB/gL3Om4CTv8lqCj3qFGfFYnRIV
	wVZY08tQVGsDv5sqaaY/2Qg0AdsIxxg/mN7IUZ56L3CXF3ZVQrj4pd+s4ei4LRNeM0tEzYwLHunCP
	j44et4YC2Xmss7OBjuOaZe4zxQT2q6WA0dn80UjOaNtguceU7uCCS8JXnqEvK8dOqjrafonXd/7iT
	pT3vK7kdPGOHkM1TXdFwEivwm33MMJZ1FOtdT/FcPFxKI62XgjdK7OVVGJk+P/1T9L28ZFgDCKsvp
	vJrjSp2RhKLCq+VzWlww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdAC-0000000BFsw-0e9k;
	Tue, 16 Apr 2024 07:23:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdA6-0000000BFpV-2jBD;
	Tue, 16 Apr 2024 07:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C866360BA0;
	Tue, 16 Apr 2024 07:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBECC113CE;
	Tue, 16 Apr 2024 07:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713252205;
	bh=ULqJjlTCraVJ0ruf913jYz2dlG1gS6UCOgmOiRdXRlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ekk8HCBFjthC7O7PxrFN7j/GM7z/nWOuO8k9QOUSLiGyz09GAO2cg64dmGZlUlds7
	 00Ewxyx3C6wcPZBoIkKGD6lbL3qbO2ksVpnRUlonLdQr9BhpV1yf7+bx9loZNn41At
	 rywVk+bWOXuipnXUZImOPnzXQlyIpQamAXCi97V5XEUtgpABiSiT97flmkQAEFDr7A
	 YcuRY0rwjZPTJIRXEph9PF+jUZc4mOVTGomsCx8EugJ6WC8EEbdEckfhASAJlczMAM
	 pEgjXqHCw7T7cVdoBUzlejwen9ZBJYRh+vjYrzCI4CZ6xsCi82SwkYS2yHPnvfOsma
	 Wo31Nl9r7Gz/Q==
Date: Tue, 16 Apr 2024 10:22:14 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
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
Message-ID: <Zh4nJp8rv1qRBs8m@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net>
 <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_002326_906356_CE221111 
X-CRM114-Status: GOOD (  36.33  )
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

On Mon, Apr 15, 2024 at 06:36:39PM +0100, Mark Rutland wrote:
> On Mon, Apr 15, 2024 at 09:52:41AM +0200, Peter Zijlstra wrote:
> > On Thu, Apr 11, 2024 at 07:00:41PM +0300, Mike Rapoport wrote:
> > > +/**
> > > + * enum execmem_type - types of executable memory ranges
> > > + *
> > > + * There are several subsystems that allocate executable memory.
> > > + * Architectures define different restrictions on placement,
> > > + * permissions, alignment and other parameters for memory that can be used
> > > + * by these subsystems.
> > > + * Types in this enum identify subsystems that allocate executable memory
> > > + * and let architectures define parameters for ranges suitable for
> > > + * allocations by each subsystem.
> > > + *
> > > + * @EXECMEM_DEFAULT: default parameters that would be used for types that
> > > + * are not explcitly defined.
> > > + * @EXECMEM_MODULE_TEXT: parameters for module text sections
> > > + * @EXECMEM_KPROBES: parameters for kprobes
> > > + * @EXECMEM_FTRACE: parameters for ftrace
> > > + * @EXECMEM_BPF: parameters for BPF
> > > + * @EXECMEM_TYPE_MAX:
> > > + */
> > > +enum execmem_type {
> > > +	EXECMEM_DEFAULT,
> > > +	EXECMEM_MODULE_TEXT = EXECMEM_DEFAULT,
> > > +	EXECMEM_KPROBES,
> > > +	EXECMEM_FTRACE,
> > > +	EXECMEM_BPF,
> > > +	EXECMEM_TYPE_MAX,
> > > +};
> > 
> > Can we please get a break-down of how all these types are actually
> > different from one another?
> > 
> > I'm thinking some platforms have a tiny immediate space (arm64 comes to
> > mind) and has less strict placement constraints for some of them?
> 
> Yeah, and really I'd *much* rather deal with that in arch code, as I have said
> several times.
> 
> For arm64 we have two bsaic restrictions: 
> 
> 1) Direct branches can go +/-128M
>    We can expand this range by having direct branches go to PLTs, at a
>    performance cost.
> 
> 2) PREL32 relocations can go +/-2G
>    We cannot expand this further.
> 
> * We don't need to allocate memory for ftrace. We do not use trampolines.
> 
> * Kprobes XOL areas don't care about either of those; we don't place any
>   PC-relative instructions in those. Maybe we want to in future.
> 
> * Modules care about both; we'd *prefer* to place them within +/-128M of all
>   other kernel/module code, but if there's no space we can use PLTs and expand
>   that to +/-2G. Since modules can refreence other modules, that ends up
>   actually being halved, and modules have to fit within some 2G window that
>   also covers the kernel.
> 
> * I'm not sure about BPF's requirements; it seems happy doing the same as
>   modules.

BPF are happy with vmalloc().
 
> So if we *must* use a common execmem allocator, what we'd reall want is our own
> types, e.g.
> 
> 	EXECMEM_ANYWHERE
> 	EXECMEM_NOPLT
> 	EXECMEM_PREL32
> 
> ... and then we use those in arch code to implement module_alloc() and friends.

I'm looking at execmem_types more as definition of the consumers, maybe I
should have named the enum execmem_consumer at the first place.

And the arch constrains defined in struct execmem_range describe how memory
should be allocated for each consumer.

These constraints are defined early at boot and remain static, so
initializing them once and letting a common allocator use them makes
perfect sense to me.

I agree that fallback_{start,end} are not ideal, but we have 3
architectures that have preferred and secondary range for modules. And arm
and powerpc use the same logic for kprobes as well, and I don't see why this
code should be duplicated.

And, for instance, if you decide to place PC-relative instructions if
kprobes XOL areas, you'd only need to update execmem_range for kprobes to
be more like the range for modules.

With central allocator it's easier to deal with the things like
VM_FLUSH_RESET_PERMS and caching of ROX memory and I think it will be more
maintainable that module_alloc(), alloc_insn_page() and
bpf_jit_alloc_exec() spread all over the place.
 
> Mark.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
