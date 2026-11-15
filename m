Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158C1606A323
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 06:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qq8L21tn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XY6g0QDN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vlojS2/2G2oZKjkGfoxmfi8193GCs7x4ESJ+MzDo1qs=; b=qq8L21tnoLwmcqr2J5LhecZ8xj
	RToFm3FJXH3HML73cmJZCuBP3evVsQnhC9sqbFLX1At26PIjYGzDVEYwAKCmGfytchSV/GnqvN1wq
	5Q/OetWQIDgEWLzLVF3DndFYgLYL9AzIC3mPSidjAtJfX9FnYxN8kxjBe1beZAg3wlAJ8/lQf9n1a
	U+CC/GNFmk+d9yXsvJnju1VtHo9hjFcfB5JpJnhrNYLno3tHMYqlm+eO0hwA/QmPmq7nElDvZzv29
	4nzqLAOTq0ptaDzaCwSEAW4785T4W4CLDE2oPmacMJPCvH4pM4T0idu6t9NMnJit0NrgQb/1wpmq9
	4y9C4aLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTtK-0000000H8c2-3FLG;
	Sun, 15 Nov 2026 06:39:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTtI-0000000H8bB-2P9A;
	Sun, 15 Nov 2026 06:39:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B208B43965;
	Sun, 15 Nov 2026 06:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF9C1F000C4;
	Sun, 15 Nov 2026 06:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794724743;
	bh=5uzNQjIqKu1Z5H5h4ULFcPsML/9M2qNB6yySUHBpd2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XY6g0QDNlp+U9PsTjMW6Z7U+4AKhATHLs5He0CZN49f2Nu0bcao4bAPuuwEsft6FI
	 TWnoj+VGBoUPTmb0EJCJXCsTtwSE0k13bv5Te+OZ5Acn6pVLSE5i/fhLT5QGKgwaOk
	 Ucb2W6afh0Q1yzMIuWl0IoyL1xjTDc8J5WHHCJWlw82oKPLfFptJE13O1Ok9X62IyP
	 xkoneXTm1OtIXF7WSDiXJH8M/fRN/bG7+qbjc7kJUeud8mWA9cz/xm6XTt15y1BZge
	 qGkeMJ/mOBJIxREW4t6uml5kStkcI3+UGIwjK5RYkeEIMSPndyRf3R1y4lpuaoL/kN
	 M2jExDr2sEOLQ==
Date: Sun, 15 Nov 2026 08:38:46 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
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
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH RESEND v8 11/16] powerpc: extend execmem_params for
 kprobes allocations
Message-ID: <avlTdlK9ErlqVRYl@kernel.org>
References: <20240505160628.2323363-1-rppt@kernel.org>
 <20240505160628.2323363-12-rppt@kernel.org>
 <3f7af771-87a7-4ae7-9919-bc4c23bd31c9@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f7af771-87a7-4ae7-9919-bc4c23bd31c9@kernel.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Christophe,

On Fri, Nov 13, 2026 at 03:36:01PM +0100, Christophe Leroy (CS GROUP) wrote:
> Hi Mike,
> =

> Looks like I missed this change ...
> =

> Le 05/05/2024 =E0 18:06, Mike Rapoport a =E9crit=A0:
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

> Using breakpoint means the segment must still be executable.
> On book3s/32 VMALLOC segment is not executable, while module segment is.
> =

> See commit 6ca055322da8 ("powerpc/32s: Use dedicated segment for modules
> with STRICT_KERNEL_RWX")
> =

> See report and fix at https://lore.kernel.org/all/ed03d290d440d579a81ae0b=
7de5243721291d903.1794543909.git.ritesh.list@gmail.com/

I'll take a look, thanks!
 =

> Christophe

-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
