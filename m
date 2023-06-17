Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE30EB64D9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 05:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/M4AAVWpkpCRLHRYwscBSjNZa1u+yhc3yU+iORf3KA=; b=byAQ6OAYZHLhyw
	MD9BGgkAqKlF7LL2f8A38xBUMdnQ9Yr9QpU/q5kQlH4olGgR1JOaL9kfXejsveptssDT1F7vcO3nV
	5BamiG6XU1lmtfmLVw35ooF+60laqN3urvRNJpcG/XqeeR+feD7ZXXhDETmxYvfoKIoSEHEweCKdP
	67lZjPCgfwNsHmQzSpx+Se8YRmsJ+SzL7HMC+HnZgobh3yvq8wGBLXLhb+eJwgWfTQLkyUNKHizOQ
	aepeJfXDLjpIlbKqxg/aT9XxluyqWHf02+1fVduHLxOtZhOeD9WHKik0d0q/tWaJwisDbyRNZw5jC
	5fnbn3sN+bCjFUOB1lcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAOse-002oeA-2F;
	Sat, 17 Jun 2023 05:53:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAOsa-002oc2-18;
	Sat, 17 Jun 2023 05:53:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3DF360F9B;
	Sat, 17 Jun 2023 05:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24536C433C8;
	Sat, 17 Jun 2023 05:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686981222;
	bh=TluszqxdgR0a0IwbMuuhT/6JAXY40kPgAznuGjSXri0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpj2dpfi9Ji3xzZ2kbgOQVYp/ZmysDx8WqNHlHmdTvMZEZsbjfL4hE6m7SXkjz4Zo
	 Mkq0iog3xkwtSwK3WOjB9XwUu05VRpcB0eogiPxG2WXCBK0aumyezzFkPPpZnGtjc7
	 5x++BGdF8JI0RHFvISKKMXQLn7exxg6GH1B4T2YCX3C0Zr0t9A89VOCr3b7IhrP+qG
	 ZzJIZ0zukBYcwghAr54w2jBQdBKljd+YnNYrk8GHhTFw3utqrXxsX2NC3voAWygO8q
	 svafETOLy9nPtmeHj06Y/0ZWzWAt+idrvmT6go/EJzAEpVusozQOwG5k1TndPIMv23
	 z+o01h8acz8Lg==
Date: Sat, 17 Jun 2023 08:52:56 +0300
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
Subject: Re: [PATCH v2 01/12] nios2: define virtual address space for modules
Message-ID: <20230617055256.GM52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-2-rppt@kernel.org>
 <6f9e9c385096bd965e53c49065848953398f5b8e.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f9e9c385096bd965e53c49065848953398f5b8e.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_225344_482842_29EFA502 
X-CRM114-Status: GOOD (  12.43  )
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

On Fri, Jun 16, 2023 at 04:00:19PM +0000, Edgecombe, Rick P wrote:
> On Fri, 2023-06-16 at 11:50 +0300, Mike Rapoport wrote:
> > =A0void *module_alloc(unsigned long size)
> > =A0{
> > -=A0=A0=A0=A0=A0=A0=A0if (size =3D=3D 0)
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return NULL;
> > -=A0=A0=A0=A0=A0=A0=A0return kmalloc(size, GFP_KERNEL);
> > -}
> > -
> > -/* Free memory returned from module_alloc */
> > -void module_memfree(void *module_region)
> > -{
> > -=A0=A0=A0=A0=A0=A0=A0kfree(module_region);
> > +=A0=A0=A0=A0=A0=A0=A0return __vmalloc_node_range(size, 1, MODULES_VADD=
R,
> > MODULES_END,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 GFP_KERNEL, PAGE_KERNEL_EXEC,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VM_FLUSH_RESET_PERMS,
> > NUMA_NO_NODE,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __builtin_return_address(0));
> > =A0}
> > =A0
> > =A0int apply_relocate_add(Elf32_Shdr *sechdrs, const char *s
> =

> I wonder if the (size =3D=3D 0) check is really needed, but
> __vmalloc_node_range() will WARN on this case where the old code won't.

module_alloc() should not be called with zero size, so a warning there
would be appropriate.
Besides, no other module_alloc() had this check.

-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
