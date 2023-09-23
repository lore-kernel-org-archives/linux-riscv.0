Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C88ACE7A89
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Sep 2023 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkjbmbSHkpRxsr9gISRI2hdKActuPg8ApRtmkYEhMLA=; b=eFWwWxIa316JKs
	xH2+OvPIgbOcWYW07TjBKVauQQCGiryXlNfou5VWd08fEOU2TkcZ4+fOG3qrMVnBqfvJy0w00mcbX
	7CfVv8zDji8KHzVcwHok3Y95B76EYGBoE0xKFk/LkPSnaBCp+KLdRlRvnDq/G5XgHDrklVVPQBiMi
	JsooIujhlhlUKt0NTg3ac9yR3aoyaoXrsMW3yyTnCovOddsM7xUD4+SIBlQk3E8aFCp2EDEFQ9Ymc
	sYryujLoUkX/Eo76iPUi0ownJ2RDXdFQA0yGiUwrw+bbyMK/3vLxF3s7GVOkG4uCGB99P9o4YTVeT
	vuZb/ik3o8J2l7HIDkaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk5Uq-00BCks-27;
	Sat, 23 Sep 2023 16:28:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk5Un-00BCib-1u;
	Sat, 23 Sep 2023 16:28:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 99BF6B80092;
	Sat, 23 Sep 2023 16:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98403C433C7;
	Sat, 23 Sep 2023 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486519;
	bh=RqAizeoAgpyrjTuWTc3EPt+00fz0GKOYt3wgiu3ilxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdX7uAUn5A/nOh6b98KyxWdk9fFgHiJgriB/fwuK77YQxwt85ckYKTY9t3fBf62wY
	 OdfH5+weEeIpqZEmVKOTk/M6qPAq6DbFmu80HRazp/dQJOGu5Fdotg7Z2IUrfIcHFK
	 CzwEzww+QWurkfb1eX0LPowGymg+QANEOY5nujQK9DRlmOgfq/CMbzYwknq+dY7tnp
	 PeA7IOMb8Twk1q2cqZZhCdVsAByDQXH6HWv6/P0+r3F48yu28WNKT0AH75egCCxIj0
	 rSO4bYh3+oBADB8dkFnn9uQPpZxQXif883hCwsCk2af3dw5oO2O8+odTCE6fZmVuyX
	 JCGFYC8Rtz+ZQ==
Date: Sat, 23 Sep 2023 19:27:42 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
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
Subject: Re: [PATCH v3 09/13] powerpc: extend execmem_params for kprobes
 allocations
Message-ID: <20230923162742.GO3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-10-rppt@kernel.org>
 <1cb41761-29d0-5d33-b7c1-0ca3acaa810d@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cb41761-29d0-5d33-b7c1-0ca3acaa810d@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_092841_915433_159CECD1 
X-CRM114-Status: GOOD (  30.27  )
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

Hi Christophe,

On Fri, Sep 22, 2023 at 10:32:46AM +0000, Christophe Leroy wrote:
> Hi Mike,
> =

> Le 18/09/2023 =E0 09:29, Mike Rapoport a =E9crit=A0:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > =

> > powerpc overrides kprobes::alloc_insn_page() to remove writable
> > permissions when STRICT_MODULE_RWX is on.
> > =

> > Add definition of EXECMEM_KRPOBES to execmem_params to allow using the
> > generic kprobes::alloc_insn_page() with the desired permissions.
> > =

> > As powerpc uses breakpoint instructions to inject kprobes, it does not
> > need to constrain kprobe allocations to the modules area and can use the
> > entire vmalloc address space.
> =

> I don't understand what you mean here. Does it mean kprobe allocation =

> doesn't need to be executable ? I don't think so based on the pgprot you =

> set.
> =

> On powerpc book3s/32, vmalloc space is not executable. Only modules =

> space is executable. X/NX cannot be set on a per page basis, it can only =

> be set on a 256 Mbytes segment basis.
> =

> See commit c49643319715 ("powerpc/32s: Only leave NX unset on segments =

> used for modules") and 6ca055322da8 ("powerpc/32s: Use dedicated segment =

> for modules with STRICT_KERNEL_RWX") and 7bee31ad8e2f ("powerpc/32s: Fix =

> is_module_segment() when MODULES_VADDR is defined").
> =

> So if your intention is still to have an executable kprobes, then you =

> can't use vmalloc address space.

Right, and I've fixed the KPROBES range to uses the same range as MODULES.
The commit message is stale and I need to update it.
 =

> Christophe
> =

> > =

> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >   arch/powerpc/kernel/kprobes.c | 14 --------------
> >   arch/powerpc/kernel/module.c  | 11 +++++++++++
> >   2 files changed, 11 insertions(+), 14 deletions(-)
> > =

> > diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobe=
s.c
> > index 62228c7072a2..14c5ddec3056 100644
> > --- a/arch/powerpc/kernel/kprobes.c
> > +++ b/arch/powerpc/kernel/kprobes.c
> > @@ -126,20 +126,6 @@ kprobe_opcode_t *arch_adjust_kprobe_addr(unsigned =
long addr, unsigned long offse
> >   	return (kprobe_opcode_t *)(addr + offset);
> >   }
> >   =

> > -void *alloc_insn_page(void)
> > -{
> > -	void *page;
> > -
> > -	page =3D execmem_text_alloc(EXECMEM_KPROBES, PAGE_SIZE);
> > -	if (!page)
> > -		return NULL;
> > -
> > -	if (strict_module_rwx_enabled())
> > -		set_memory_rox((unsigned long)page, 1);
> > -
> > -	return page;
> > -}
> > -
> >   int arch_prepare_kprobe(struct kprobe *p)
> >   {
> >   	int ret =3D 0;
> > diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
> > index 824d9541a310..bf2c62aef628 100644
> > --- a/arch/powerpc/kernel/module.c
> > +++ b/arch/powerpc/kernel/module.c
> > @@ -95,6 +95,9 @@ static struct execmem_params execmem_params __ro_afte=
r_init =3D {
> >   		[EXECMEM_DEFAULT] =3D {
> >   			.alignment =3D 1,
> >   		},
> > +		[EXECMEM_KPROBES] =3D {
> > +			.alignment =3D 1,
> > +		},
> >   		[EXECMEM_MODULE_DATA] =3D {
> >   			.alignment =3D 1,
> >   		},
> > @@ -135,5 +138,13 @@ struct execmem_params __init *execmem_arch_params(=
void)
> >   =

> >   	range->pgprot =3D prot;
> >   =

> > +	execmem_params.ranges[EXECMEM_KPROBES].start =3D VMALLOC_START;
> > +	execmem_params.ranges[EXECMEM_KPROBES].start =3D VMALLOC_END;
> > +
> > +	if (strict_module_rwx_enabled())
> > +		execmem_params.ranges[EXECMEM_KPROBES].pgprot =3D PAGE_KERNEL_ROX;
> > +	else
> > +		execmem_params.ranges[EXECMEM_KPROBES].pgprot =3D PAGE_KERNEL_EXEC;
> > +
> >   	return &execmem_params;
> >   }

-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
