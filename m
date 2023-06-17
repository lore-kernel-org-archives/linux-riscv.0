Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30193EB64DB
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 06:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bon1gNuswWxH2iZQFkZtX0I29lMGClYwSjULMWvPs8=; b=4eutdO50fGpDrh
	dpycM4ptaqcGe6KdXfBkSCStyGZHfd1qU0ooUzfS2vZUVuEWdiL89+GXiNQ/jFeCQ3SgO/jPVVqiC
	rUsL/5tzCfSI64Q4E/df6+EW4e71eUoJLVi7G41Ef+yxxZMaOsxTo5g4/O/qYy49LFeYQU30vPoKW
	zweNrI9xfhgcxUzXVrJEpIjPDw4HJZ513qMFgM8BUW9KMxC9obk7sZjR/oZZ87GeABiDHltRI3b2F
	rQiq6LD98QtlJIdKKbZYn8cuGysT7gpKUODY2BFKpwoC6rVbzitroXncYIpMhAfdDGmP6ePBp5MCh
	FtZBWYAqohhddZ40uMWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAP9P-002qXg-2z;
	Sat, 17 Jun 2023 06:11:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAP9M-002qWK-2O;
	Sat, 17 Jun 2023 06:11:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0A44860F56;
	Sat, 17 Jun 2023 06:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232F1C433C8;
	Sat, 17 Jun 2023 06:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686982263;
	bh=1X6Vc8+Xzykk7Z2p+5RPkPnfKk/mxTwRqvgQiLyFLcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpVRRR3/peLouH5K6845IoDymP4RzHQ5X18L/qapqW+HSOSVD4Jxe+dS8ZHi81pu/
	 6UGSL3ryafkglY404kB9NewuLJthdXrDKmiG1bUa/SbIGImcdFFTImcXA24Lrq1XBP
	 b8jHFLQ6gc3Wlj/T62OORePu3DpO0oegza9UGNNTomGmTdYPVnUkXHwlXXNP8xNb6O
	 mSUdao6gRKvwJRP5+ktwASUtigGyhHJfmUrvUL8UkoscW+emJo4VTKfMECcoxbnJ1O
	 71I0q0m7dm69SI0vCCHrQzATzQcgIJXdFUCmromH14CzN/7cF+UERF73BpE9q6ULNL
	 UyjIthY/V8Lsw==
Date: Sat, 17 Jun 2023 09:10:15 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>,
	"deller@gmx.de" <deller@gmx.de>,
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
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"x86@kernel.org" <x86@kernel.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
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
Subject: Re: [PATCH v2 04/12] mm/execmem, arch: convert remaining overrides
 of module_alloc to execmem
Message-ID: <20230617061015.GO52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-5-rppt@kernel.org>
 <15f5dff8217b1a2e16697d40e48dee6dd1f9b2f3.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15f5dff8217b1a2e16697d40e48dee6dd1f9b2f3.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_231104_889926_6ABABA8C 
X-CRM114-Status: GOOD (  15.97  )
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

On Fri, Jun 16, 2023 at 04:16:28PM +0000, Edgecombe, Rick P wrote:
> On Fri, 2023-06-16 at 11:50 +0300, Mike Rapoport wrote:
> > -void *module_alloc(unsigned long size)
> > -{
> > -=A0=A0=A0=A0=A0=A0=A0gfp_t gfp_mask =3D GFP_KERNEL;
> > -=A0=A0=A0=A0=A0=A0=A0void *p;
> > -
> > -=A0=A0=A0=A0=A0=A0=A0if (PAGE_ALIGN(size) > MODULES_LEN)
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return NULL;
> > +static struct execmem_params execmem_params =3D {
> > +=A0=A0=A0=A0=A0=A0=A0.modules =3D {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.flags =3D EXECMEM_KASAN_=
SHADOW,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.text =3D {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.=
alignment =3D MODULE_ALIGN,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0},
> > +=A0=A0=A0=A0=A0=A0=A0},
> > +};
> =

> Did you consider making these execmem_params's ro_after_init? Not that
> it is security sensitive, but it's a nice hint to the reader that it is
> only modified at init. And I guess basically free sanitizing of buggy
> writes to it.

Makes sense.
 =

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
> > +struct execmem_params __init *execmem_arch_params(void)
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0unsigned long start =3D MODULES_VADDR +
> > get_module_load_offset();
> =

> I think we can drop the mutex's in get_module_load_offset() now, since
> execmem_arch_params() should only be called once at init.

Right. Even more, the entire get_module_load_offset() can be folded into
execmem_arch_params() as =


	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && kaslr_enabled())
		module_load_offset =3D
			get_random_u32_inclusive(1, 1024) * PAGE_SIZE;

> > =A0
> > -=A0=A0=A0=A0=A0=A0=A0if (p && (kasan_alloc_module_shadow(p, size, gfp_=
mask) < 0))
> > {
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0vfree(p);
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return NULL;
> > -=A0=A0=A0=A0=A0=A0=A0}
> > +=A0=A0=A0=A0=A0=A0=A0execmem_params.modules.text.start =3D start;
> > +=A0=A0=A0=A0=A0=A0=A0execmem_params.modules.text.end =3D MODULES_END;
> > +=A0=A0=A0=A0=A0=A0=A0execmem_params.modules.text.pgprot =3D PAGE_KERNE=
L;
> > =A0
> > -=A0=A0=A0=A0=A0=A0=A0return p;
> > +=A0=A0=A0=A0=A0=A0=A0return &execmem_params;
> > =A0}
> > =A0
> =


-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
