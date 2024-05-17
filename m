Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD37C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 15:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IB3K3ElSwsR4oNw304cGLdFL+tIwFj+WmjLsOiWw5WM=; b=vIEvdUCzoevhQc
	ObpSnkWra4UPKQkczpWqUz+7igxY1pv6ifSb8YTIE2QuTUF92afAWKaNuzCEM7l8LpQFY5D7QAgV1
	45FdtsMJ/GrRWKFlNq3zqefUTTT99DYB/oLk1KqIAoLsX72iGa/DdgoEBEs0hFQkdzIC/CqFH4Kkx
	xlpvLan/UDe5EN6CXp14G9+/weEAP3SdvYIx28wym/ma+q7DqeYjcPlkvSNn65AI1qmQvCWjNENdj
	fFz+CAr2uPRxkMt6R2xLii/BObCOGdvDrB8OxgcGzEf7NR55KHyViYXoRRygwYDEUx/6EawOtaelC
	WYtrI0+1XwUc/1qO9G8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7znN-00000008ITK-2BGS;
	Fri, 17 May 2024 15:46:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7znJ-00000008IQv-01BS;
	Fri, 17 May 2024 15:46:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D514961DEB;
	Fri, 17 May 2024 15:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111FAC4AF67;
	Fri, 17 May 2024 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715960804;
	bh=EpkhHazhMZ2fwuDobsplhqZvRLo+YDrsHfPiI4NpGv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPsMCEt72a5yEc9EgEt6r+yjYEkV9BPAe1xRO8Mnx0FWUaiC9lvILRG04VRJZWw48
	 6oi3NhTWACIBMVCpaYFZBzGgjvog9Y2TBWGjwbtg4as/XPHXHwLo0KeYmlix1Tn8jJ
	 4VeuQ6blAMOigvYJG5R5zp9Slb7rxBGhcGmnSRhVLw3HY2TMrkHzFxNCfy5TM2KOl7
	 3goZJdJ9Tr8Zr9DvcjkvtgL8pUnnLDDUJrwFLygDVMOs6MaI5wNJFVtqt+sDPTLZKE
	 8D0fBgS7iYh917OFn63YR+c8+L84i4xjQMciA0V/P7pqzz6WoJLNRgmPCqv4y8iZTU
	 E4tvvudi2KGsA==
Date: Fri, 17 May 2024 16:46:32 +0100
From: Will Deacon <will@kernel.org>
To: Klara Modin <klarasmodin@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
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
	Liviu Dudau <liviu@dudau.co.uk>,
	Luis Chamberlain <mcgrof@kernel.org>,
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
	Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH RESEND v8 16/16] bpf: remove CONFIG_BPF_JIT dependency on
 CONFIG_MODULES of
Message-ID: <20240517154632.GA320@willie-the-truck>
References: <20240505160628.2323363-1-rppt@kernel.org>
 <20240505160628.2323363-17-rppt@kernel.org>
 <7983fbbf-0127-457c-9394-8d6e4299c685@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7983fbbf-0127-457c-9394-8d6e4299c685@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_084653_152630_7422C3B2 
X-CRM114-Status: GOOD (  28.59  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Klara,

On Fri, May 17, 2024 at 01:00:31AM +0200, Klara Modin wrote:
> On 2024-05-05 18:06, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > =

> > BPF just-in-time compiler depended on CONFIG_MODULES because it used
> > module_alloc() to allocate memory for the generated code.
> > =

> > Since code allocations are now implemented with execmem, drop dependenc=
y of
> > CONFIG_BPF_JIT on CONFIG_MODULES and make it select CONFIG_EXECMEM.
> > =

> > Suggested-by: Bj=F6rn T=F6pel <bjorn@kernel.org>
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >   kernel/bpf/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
> > index bc25f5098a25..f999e4e0b344 100644
> > --- a/kernel/bpf/Kconfig
> > +++ b/kernel/bpf/Kconfig
> > @@ -43,7 +43,7 @@ config BPF_JIT
> >   	bool "Enable BPF Just In Time compiler"
> >   	depends on BPF
> >   	depends on HAVE_CBPF_JIT || HAVE_EBPF_JIT
> > -	depends on MODULES
> > +	select EXECMEM
> >   	help
> >   	  BPF programs are normally handled by a BPF interpreter. This option
> >   	  allows the kernel to generate native code when a program is loaded
> =

> This does not seem to work entirely. If build with BPF_JIT without module
> support for my Raspberry Pi 3 B I get warnings in my kernel log (easiest =
way
> to trigger it seems to be trying to ssh into it, which fails).

Thanks for the report. I was able to reproduce this using QEMU and it
looks like the problem is because bpf_arch_text_copy() silently fails
to write to the read-only area as a result of patch_map() faulting and
the resulting -EFAULT being chucked away.

Please can you try the diff below?

Will

--->8

diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 255534930368..94b9fea65aca 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -36,7 +36,7 @@ static void __kprobes *patch_map(void *addr, int fixmap)
 =

        if (image)
                page =3D phys_to_page(__pa_symbol(addr));
-       else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
+       else if (IS_ENABLED(CONFIG_EXECMEM))
                page =3D vmalloc_to_page(addr);
        else
                return addr;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
