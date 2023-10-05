Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BDAE936FD
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 05:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkO1HGREOVwvn5JGqbg4R+1xdmoJatM+Ufr7ESXX2NA=; b=I4Uwdhr314llX2
	1z4f9fTTSQCzJSjMMWo+0DwcZvPiVIgJXqJNioo3fUl8DvihER9mdw8lPt/bgKQfnWnfYUuQnpKVY
	/fzCTmtLDrvvc9OKv+Nd2amEbmYfmj8LBdVakm8Lt5nZbukl8uaFr/sYTG+KmmonTzFqY+hSbooiX
	sBZIThg12NhLU9RQKp0fjznlEDz6Eg8MEgH0WCz1taxcD62v/0djjF6vtHHYqgCeECsyqQmWPWneD
	XBYqJ9/wWz/b2vlhdSzJfeCYhFqidl4jyWFDp/2O8DbS9cqYSDdH9PJqmH/ehsSEXfyiryKgX160g
	RWCZDQ2R+5Q/Ee/Gkg8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoGvg-001S8t-2h;
	Thu, 05 Oct 2023 05:29:44 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoGvd-001S6P-2c;
	Thu, 05 Oct 2023 05:29:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 58A05CE1FD1;
	Thu,  5 Oct 2023 05:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBD6C433CC;
	Thu,  5 Oct 2023 05:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696483777;
	bh=0Btg3YXrlgdZvN9c5GBtYXuhH18hqWIB+5O6R7ueqJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=htbvcSdKFwWteJskCo57Zoc+HETH4Yk4itDoLxeJ1ZG4lHI/6dRpo8c5g9SXm397o
	 Eun4d3xnthNfZVwdWsofKvM4QWBVN4HTm3hLqzLiQBrntUL8UgEGY5xtChyLJeLSvA
	 +kiu09tPGlxznwtPobf/uLurpuN8CBF2/SLMhDWs179ymyb2Urny866sSuGF/ojv6+
	 iWewEluv5jVsvROGeyy57su15Hs4TbNbwzhji63ZqwBfc3BmxOSDIm1/YBjJDN2t9v
	 ZHq7tnS5BF0NS66xJ3m6K4ABlSRKqepeLUIUEhNo390B9QIPXevXF5ZN3BxZUTA4Ed
	 Ef2zRBvRZ4gnQ==
Date: Thu, 5 Oct 2023 08:28:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"deller@gmx.de" <deller@gmx.de>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>,
	"bjorn@kernel.org" <bjorn@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"nadav.amit@gmail.com" <nadav.amit@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"hca@linux.ibm.com" <hca@linux.ibm.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"kent.overstreet@linux.dev" <kent.overstreet@linux.dev>,
	"puranjay12@gmail.com" <puranjay12@gmail.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"will@kernel.org" <will@kernel.org>,
	"dinguyen@kernel.org" <dinguyen@kernel.org>,
	"naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"song@kernel.org" <song@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 04/13] mm/execmem, arch: convert remaining overrides
 of module_alloc to execmem
Message-ID: <20231005052824.GE3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-5-rppt@kernel.org>
 <3483c4712306060ac56f07f5db9b146d69fc7e9e.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3483c4712306060ac56f07f5db9b146d69fc7e9e.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_222942_213046_82B49673 
X-CRM114-Status: GOOD (  13.75  )
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

On Wed, Oct 04, 2023 at 12:29:36AM +0000, Edgecombe, Rick P wrote:
> On Mon, 2023-09-18 at 10:29 +0300, Mike Rapoport wrote:
> > diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
> > index 5f71a0cf4399..9d37375e2f05 100644
> > --- a/arch/x86/kernel/module.c
> > +++ b/arch/x86/kernel/module.c
> >
> > -void *module_alloc(unsigned long size)
> > +struct execmem_params __init *execmem_arch_params(void)
> > =A0{
> > -=A0=A0=A0=A0=A0=A0=A0gfp_t gfp_mask =3D GFP_KERNEL;
> > -=A0=A0=A0=A0=A0=A0=A0void *p;
> > -
> > -=A0=A0=A0=A0=A0=A0=A0if (PAGE_ALIGN(size) > MODULES_LEN)
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return NULL;
> > +=A0=A0=A0=A0=A0=A0=A0unsigned long module_load_offset =3D 0;
> > +=A0=A0=A0=A0=A0=A0=A0unsigned long start;
> > =A0
> > -=A0=A0=A0=A0=A0=A0=A0p =3D __vmalloc_node_range(size, MODULE_ALIGN,
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 MODULES_VADDR +
> > get_module_load_offset(),
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 MODULES_END, gfp_mask, PAGE_KERNEL,
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 VM_FLUSH_RESET_PERMS |
> > VM_DEFER_KMEMLEAK,
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 NUMA_NO_NODE,
> > __builtin_return_address(0));
> > +=A0=A0=A0=A0=A0=A0=A0if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && kaslr_en=
abled())
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0module_load_offset =3D
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0g=
et_random_u32_inclusive(1, 1024) *
> > PAGE_SIZE;
> =

> Minor:
> I think you can skip the IS_ENABLED(CONFIG_RANDOMIZE_BASE) part because
> CONFIG_RANDOMIZE_MEMORY depends on CONFIG_RANDOMIZE_BASE (which is
> checked in kaslr_enabled()).

Thanks, I'll look into it.

-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
