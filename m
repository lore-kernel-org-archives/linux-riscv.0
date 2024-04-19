Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B191C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLEq7/fn1pD7Ot1Zq3bMfNFjEHumUnfDLl8LL8gGOzI=; b=Z3bPVi0WkbTyAj
	lz+57F963fzw90o8ohP9kypxUhups5VPGQ0gKNdR+1VwP5MW7DpuhYzAbECdUeVLiPapVxbrr2n/D
	UE4IQkzTSx0ovOtCrCqzqXA7hoVUi/MQr4H9fSl/FdFV7JWDzLWIGH8rUYTSo34Ge8FQg0SjCOL6I
	u3rfI52Ydn1S47/KMg6tF03KwJt5qvKydJqzcR5VaTjrHTqe84FvA6/Z4oFIUg9Thu8YtK3gQT2SR
	VG1QzBp6f9EH5f33m+Bzeio2NbFvaHXjuLyqRY0cNkhdXFY0dzJ71JhHYxZ+qJxupyqlxZabYvkzF
	u1oP6C3yCzUCj/XGKmzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxqVk-00000006FH1-03Yw;
	Fri, 19 Apr 2024 15:50:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxqVf-00000006FCS-2fKD;
	Fri, 19 Apr 2024 15:50:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 52AA1CE16E7;
	Fri, 19 Apr 2024 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33F9C3277B;
	Fri, 19 Apr 2024 15:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713541839;
	bh=4syrMVBjLG+mqSAuWdu45onjerLE6hugRcJZYIbTm9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHj3fHUBZ5oW6uWZr153zLjsZ6q0yv8DxwxD0Zy4isctsEWry5XXGSfR8Vc3hMrh/
	 vizLT7qFrrEF533kmJCP3HWtZ7Qzr6mVAw251VXfA8O2WlqLyeSYgvuFfPALuIdv03
	 8KfWQePVkfruiceot7yZycnjNdoMZw4MifC81l3AU9dBYam0QRDoIaUN7a6lFYb8MN
	 K0Whze6qtl25bkJdh4oiv03gWibiSz5LhY9l5mv+w3PTDhkRKRk4JGDzV2xKnexhV7
	 tGBMGlG1WEFnNmkggVGWaWOAgxzIa+Avjitv3Mny3kNElAG5XpvzSHnQsEDp7b51Tm
	 Ziw7Ozh3aQ/+w==
Date: Fri, 19 Apr 2024 18:49:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Masami Hiramatsu <masami.hiramatsu@gmail.com>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>,
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
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4 14/15] kprobes: remove dependency on CONFIG_MODULES
Message-ID: <ZiKSffcTiP2c6fbs@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-15-rppt@kernel.org>
 <20240418061615.5fad23b954bf317c029acc4d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418061615.5fad23b954bf317c029acc4d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_085044_071277_62154CE2 
X-CRM114-Status: GOOD (  20.62  )
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

Hi Masami,

On Thu, Apr 18, 2024 at 06:16:15AM +0900, Masami Hiramatsu wrote:
> Hi Mike,
> 
> On Thu, 11 Apr 2024 19:00:50 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > kprobes depended on CONFIG_MODULES because it has to allocate memory for
> > code.
> > 
> > Since code allocations are now implemented with execmem, kprobes can be
> > enabled in non-modular kernels.
> > 
> > Add #ifdef CONFIG_MODULE guards for the code dealing with kprobes inside
> > modules, make CONFIG_KPROBES select CONFIG_EXECMEM and drop the
> > dependency of CONFIG_KPROBES on CONFIG_MODULES.
> 
> Thanks for this work, but this conflicts with the latest fix in v6.9-rc4.
> Also, can you use IS_ENABLED(CONFIG_MODULES) instead of #ifdefs in
> function body? We have enough dummy functions for that, so it should
> not make a problem.

The code in check_kprobe_address_safe() that gets the module and checks for
__init functions does not compile with IS_ENABLED(CONFIG_MODULES). 
I can pull it out to a helper or leave #ifdef in the function body,
whichever you prefer.
 
> -- 
> Masami Hiramatsu

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
