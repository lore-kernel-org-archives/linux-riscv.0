Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2700EC07C79
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Apr 2024 10:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OU3P2sDt4EKZzehMoqIziHy1XwbXNirtRdlXGIEIimE=; b=wOIYTBIEyCklnJ
	9coP6cd8ui1zh8UoBIvNzw49w+kuMeFaKrdufP3Wuh7QiGPdJvvguJW1dZmz91erzg3atwZpvFOkf
	nfC6SFvFj+QRXZmRcg26t5dFMIl7ZQ+OH91nnLsMhHE0Q7SOomMLn22ofB2ytTuXtZjDdp6RAP/gq
	DbKEqBKylNId+hVMKFQae60yuxmP3O6BRDtswpYMwEfRrkVH6NyHtVGKtNPofiHqYVd7RaFlrapRU
	BDYra3R1LHxkl5hP9cKisBd2b1DPQpwXnCmoaYRbgdWhvTBCvIMnAG7pGlPLZ+4ZExK4Lb/WClZ/O
	XGD8aHnRrGEu/i5Vaxkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ry8M0-00000008KJ4-1HAP;
	Sat, 20 Apr 2024 10:53:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ry8Lv-00000008KHZ-3mAm;
	Sat, 20 Apr 2024 10:53:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C61C0CE19A9;
	Sat, 20 Apr 2024 10:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F744C072AA;
	Sat, 20 Apr 2024 10:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713610427;
	bh=SM7VfRahGBLcoMQTiuF9XwON0oAIQm3UPvX2eiqyDXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3eyeiLylPAUkLSbyyrlGHXzvYV/bgYpLPhV7vw8xijwr2D1MExbuRdRactesAT8X
	 zdt7h71F5DqBQu/eRbhv/5Y0Rre5yGM+3/QnKDXleUxYNRTZmWf1Vo3WU+1+o9lafL
	 JRP9zqL5lB14IFxVzQv/2Y2x11fPGHO1UTIDooMmj7MCyEzwQSZ7FSoL/8Q352iA+B
	 xJtavt8SFXQQ13eBr6UXoSA7CP3oDA+2zBywG990wKdhsiRvE/zNe3PUQwDEQ+0Y6e
	 BUuBnLZ3CWf9tTcjXso+bnm9SeKBHDu3KkkjgF+H+J+dCs6K3ICndd93HsxM2BWoMW
	 e8kLY5pax56uw==
Date: Sat, 20 Apr 2024 13:52:27 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v4 14/15] kprobes: remove dependency on CONFIG_MODULES
Message-ID: <ZiOea81saMutayxt@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-15-rppt@kernel.org>
 <20240418061615.5fad23b954bf317c029acc4d@gmail.com>
 <ZiKSffcTiP2c6fbs@kernel.org>
 <321def3e-8bf1-4920-92dd-037b20f1272d@csgroup.eu>
 <ZiNv0jY7Ebw75iQl@kernel.org>
 <20240420181500.07b39c77f1ca086e8a5161b4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240420181500.07b39c77f1ca086e8a5161b4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_035352_344145_90B1FD96 
X-CRM114-Status: GOOD (  30.68  )
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

On Sat, Apr 20, 2024 at 06:15:00PM +0900, Masami Hiramatsu wrote:
> On Sat, 20 Apr 2024 10:33:38 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> =

> > On Fri, Apr 19, 2024 at 03:59:40PM +0000, Christophe Leroy wrote:
> > > =

> > > =

> > > Le 19/04/2024 =E0 17:49, Mike Rapoport a =E9crit=A0:
> > > > Hi Masami,
> > > > =

> > > > On Thu, Apr 18, 2024 at 06:16:15AM +0900, Masami Hiramatsu wrote:
> > > >> Hi Mike,
> > > >>
> > > >> On Thu, 11 Apr 2024 19:00:50 +0300
> > > >> Mike Rapoport <rppt@kernel.org> wrote:
> > > >>
> > > >>> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > > >>>
> > > >>> kprobes depended on CONFIG_MODULES because it has to allocate mem=
ory for
> > > >>> code.
> > > >>>
> > > >>> Since code allocations are now implemented with execmem, kprobes =
can be
> > > >>> enabled in non-modular kernels.
> > > >>>
> > > >>> Add #ifdef CONFIG_MODULE guards for the code dealing with kprobes=
 inside
> > > >>> modules, make CONFIG_KPROBES select CONFIG_EXECMEM and drop the
> > > >>> dependency of CONFIG_KPROBES on CONFIG_MODULES.
> > > >>
> > > >> Thanks for this work, but this conflicts with the latest fix in v6=
.9-rc4.
> > > >> Also, can you use IS_ENABLED(CONFIG_MODULES) instead of #ifdefs in
> > > >> function body? We have enough dummy functions for that, so it shou=
ld
> > > >> not make a problem.
> > > > =

> > > > The code in check_kprobe_address_safe() that gets the module and ch=
ecks for
> > > > __init functions does not compile with IS_ENABLED(CONFIG_MODULES).
> > > > I can pull it out to a helper or leave #ifdef in the function body,
> > > > whichever you prefer.
> > > =

> > > As far as I can see, the only problem is MODULE_STATE_COMING.
> > > Can we move 'enum module_state' out of #ifdef CONFIG_MODULES in modul=
e.h  ?
> > =

> > There's dereference of 'struct module' there:
> >  =

> > 		(*probed_mod)->state !=3D MODULE_STATE_COMING) {
> > 			...
> > 		}
> > =

> > so moving out 'enum module_state' won't be enough.
> =

> Hmm, this part should be inline functions like;
> =

> #ifdef CONFIG_MODULES
> static inline bool module_is_coming(struct module *mod)
> {
> 	return mod->state =3D=3D MODULE_STATE_COMING;
> }
> #else
> #define module_is_coming(mod) (false)

I'd prefer

static inline module_is_coming(struct module *mod)
{
	return false;
}

> #endif
>
> Then we don't need the enum.
> Thank you,
> =

> -- =

> Masami Hiramatsu (Google) <mhiramat@kernel.org>

-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
