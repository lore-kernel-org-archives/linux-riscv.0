Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416A6C001CC
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Apr 2024 07:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFSrjWfKB1a8vXsVibvRtbM2HouFElj11BAXkVw3Egg=; b=euJjgL8Am1WRPp
	ye6/D3fKo4xndd0Ieb8ZpRllT6zWlb7+ZtOROdeZROZM8FBU/pHEAnMuqOySVkyrTufKpQTVrLFtj
	AjS3mpl/4ujdOa51DIlJw3bcYk77vjrbVJymubZfZA+8W979mI+QXSvCsm1+/S1XHFHqcYURmhcH5
	acEhjUjBeWqdnwJlOworhqgfPUpioDumsK+YdTJhh4LbZomBSd5QJ990/gRDy0f9O3Jx2YOsgGdR5
	J07dV6ZlTynk45Uu16cK7fYQHNDE/dF98YqI6MFAkeLQMVQLacV8W+AO5750FNNyi0pruOk2+bpK0
	1jhGbGvmwzMT3JKDza5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ry5Fe-0000000813o-1QC9;
	Sat, 20 Apr 2024 07:35:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ry5Fa-0000000811X-1uGs;
	Sat, 20 Apr 2024 07:35:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F15A6CE10BD;
	Sat, 20 Apr 2024 07:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB26C113CE;
	Sat, 20 Apr 2024 07:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713598501;
	bh=YQ9KfPtm5Gq9HYepBoPJrHlxAcwZYbjakD5piFpGBCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HstIwZ4kXYt594F3dTAKefbjqk59LgLelJ4wfeugjHKdccg9U6QSsThvKUdOj6kpr
	 cxBq3QX4LKiL1ekSZ4hlwHrg2Qo19wEMdjfcoqJC1hKB987QXK8Wq3oegsKl2zZTfI
	 0ahwnVH2zTwg0WMFDB5bQY2DWepkh6sfONxxfG+SnniZiiLcfZnS8gmDD4/taXFr4a
	 gNoyuT99b/yZU19nTHh4Wm4L6MjmbQoSYrPwuVYcHB2CCTGISZcttYnTQA36iEYp8c
	 S1AEVNMPdbCPnyweb2c/fhVBUzL5EOQDTyFmN+U+fX6hUzHCENDjnN15hBAkD3dzc1
	 3OfMh4fyGR7Ag==
Date: Sat, 20 Apr 2024 10:33:38 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Masami Hiramatsu <masami.hiramatsu@gmail.com>,
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
Message-ID: <ZiNv0jY7Ebw75iQl@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-15-rppt@kernel.org>
 <20240418061615.5fad23b954bf317c029acc4d@gmail.com>
 <ZiKSffcTiP2c6fbs@kernel.org>
 <321def3e-8bf1-4920-92dd-037b20f1272d@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <321def3e-8bf1-4920-92dd-037b20f1272d@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_003506_925334_13B62FC6 
X-CRM114-Status: GOOD (  25.37  )
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

On Fri, Apr 19, 2024 at 03:59:40PM +0000, Christophe Leroy wrote:
> =

> =

> Le 19/04/2024 =E0 17:49, Mike Rapoport a =E9crit=A0:
> > Hi Masami,
> > =

> > On Thu, Apr 18, 2024 at 06:16:15AM +0900, Masami Hiramatsu wrote:
> >> Hi Mike,
> >>
> >> On Thu, 11 Apr 2024 19:00:50 +0300
> >> Mike Rapoport <rppt@kernel.org> wrote:
> >>
> >>> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> >>>
> >>> kprobes depended on CONFIG_MODULES because it has to allocate memory =
for
> >>> code.
> >>>
> >>> Since code allocations are now implemented with execmem, kprobes can =
be
> >>> enabled in non-modular kernels.
> >>>
> >>> Add #ifdef CONFIG_MODULE guards for the code dealing with kprobes ins=
ide
> >>> modules, make CONFIG_KPROBES select CONFIG_EXECMEM and drop the
> >>> dependency of CONFIG_KPROBES on CONFIG_MODULES.
> >>
> >> Thanks for this work, but this conflicts with the latest fix in v6.9-r=
c4.
> >> Also, can you use IS_ENABLED(CONFIG_MODULES) instead of #ifdefs in
> >> function body? We have enough dummy functions for that, so it should
> >> not make a problem.
> > =

> > The code in check_kprobe_address_safe() that gets the module and checks=
 for
> > __init functions does not compile with IS_ENABLED(CONFIG_MODULES).
> > I can pull it out to a helper or leave #ifdef in the function body,
> > whichever you prefer.
> =

> As far as I can see, the only problem is MODULE_STATE_COMING.
> Can we move 'enum module_state' out of #ifdef CONFIG_MODULES in module.h =
 ?

There's dereference of 'struct module' there:
 =

		(*probed_mod)->state !=3D MODULE_STATE_COMING) {
			...
		}

so moving out 'enum module_state' won't be enough.
 =

> >   =

> >> -- =

> >> Masami Hiramatsu
> > =


-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
