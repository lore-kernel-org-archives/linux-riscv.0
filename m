Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBB9EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 15:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9KjXS8+Jr3rQwsh4U2t6uVb9pWaVvCSxZezXFALFtc=; b=mokwbKkZYoslMy
	fiNutaFK84KvwrXgLiNNL4yUX3cecDts1OvzogHPCNLe5Mljgzw12zPVTjcesCCHxyLY6sjioVCWg
	Q95q8rE+Mzpye8wXYgDPW1sJ9eylRpasF4e/k4yw+SCgZp2Y1PaKNtoqXqQEPaqnesY3DYzfQ96Dk
	uwpYUfXGGun1trTAUVSmBpyKhzZrWuh0Lpa6hQpDgZf4bvI7KVJrPpWIdDDY86SLSSDL+zNI5A1u1
	OPc5vzCOVPr39mwZG4kHY8MePJvlqdIdA3MkeuNNGyXJHWawvuq78DIY/Uf2c4KLhjtwNX4a8UfBJ
	HmTRDrS+wYArO45BjgXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBGju-008mCx-2r;
	Mon, 19 Jun 2023 15:24:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBGjq-008mAM-3C;
	Mon, 19 Jun 2023 15:24:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0183660CFB;
	Mon, 19 Jun 2023 15:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA4DC433C8;
	Mon, 19 Jun 2023 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687188257;
	bh=N4a6+AKTlpfQu+hNLgDTvYGemlpqgXPewbtXySTT2Wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kRzjt2nDIAl4X26ojRiB8w8CJVn45eTmiPbIYkIvDYRBR/QR7IVpfAXYd9FpfNQDQ
	 OvemWMKmfnlcr5GwcS7TCX2oTJmzf2fUUsDJHf2Oq+4RHGmHWKbk0CASnuDz6Gk1Ld
	 1e26ENdIJqn1qjqL2vy8CRe3zudh+ZqjAZ7btzz+Jja4UEKxYRLaqjs+hNR8TPWi48
	 sYyUqJtdsNHbcbOzxo9zMe/AaYlu9nZhYjfHu5NSh21mKAk+otvslcioi5dkhxeNTF
	 EnxnECqDbcsPkYZvvYUeyjGiH7IzMmaAIOnWvmMc+HuAd2WDWUtK2BFwEfTtd03m+J
	 SY9K1sARFWi7g==
Date: Mon, 19 Jun 2023 18:23:34 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
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
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
Message-ID: <20230619152334.GC52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-7-rppt@kernel.org>
 <87jzw0qu3s.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jzw0qu3s.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_082419_123520_0151F1A2 
X-CRM114-Status: GOOD (  26.52  )
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

On Mon, Jun 19, 2023 at 12:32:55AM +0200, Thomas Gleixner wrote:
> Mike!
> 
> Sorry for being late on this ...
> 
> On Fri, Jun 16 2023 at 11:50, Mike Rapoport wrote:
> 
> The fact that my suggestions had a 'mod_' namespace prefix does not make
> any of my points moot.

The prefix does not matter. What matters is what we are trying to abstract.
Your suggestion is based of the memory used by modules. I'm abstracting
address spaces for different types of executable and related memory. They
are similar, yes, but they are not the same.

The TEXT, INIT_TEXT and *_DATA do not match to what we have from arch POV.
They have modules with text, rw data, ro data and ro after init data and
the memory for the generated code. The memory for modules and memory for
other users have different restrictions for their placement, so using a
single TEXT type for them is semantically wrong. BPF and kprobes do not
necessarily must be at the same address range as modules and init text does
not differ from normal text.

> Song did an extremly good job in abstracting things out, but you decided
> to ditch his ground work instead of building on it and keeping the good
> parts. That's beyond sad.

Actually not. The core idea to describe address range suitable for code
allocations with a structure and have arch code initialize this structure
at boot and be done with it is the same. But I don't think vmalloc
parameters belong there, they should be completely encapsulated in the
allocator. Having fallback range named explicitly is IMO clearer than an
array of address spaces.

I accept your point that the structures describing ranges for different
types should be unified and I've got carried away with making the wrappers
to convert that structure to parameters to the core allocation function.

I've chosen to define ranges as fields in the containing structure rather
than enum with types and an array because I strongly feel that the callers
should not care about these parameters. These parameters are defined by
architecture and the callers should not need to know how each and every
arch defines restrictions suitable for modules, bpf or kprobes.

That's also the reason to have different names for API calls, exactly to
avoid having alloc(KPROBES,...), alloc(BPF, ...), alloc(MODULES, ...) an so
on.

All in all, if I filter all the ranting, this boils down to having a
unified structure for all the address ranges and passing this structure
from the wrappers to the core alloc as is rather that translating it to
separate parameters, with which I agree.

> Thanks,
> 
>         tglx

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
