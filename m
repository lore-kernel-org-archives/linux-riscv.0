Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C715C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 07:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+b6zj0DV5312hJm2f46u4WEPXNErVwsSd5HqKOwJdSg=; b=eF3xP2xcFE9VJj
	wBa06WjEeBQYfXxwcZxA4GVAV1yOadbFsIBMTqo0RJKoVnWauXh6UkI32bMHylECihGV2Pmnp2h9j
	D+pBKUUmoBO5O7gY+LpQFto1Y3NuyRwy6YyL5A9f7bJkSG9Uhp7Kroy3+MpkyfICF7SZpv+aK5G8T
	o+BiZQLA9vO42zMVk5u+e3brDMusKglj+Rkf5JL5W29tkrUZQazbdCySZkFU4XUAQDHZ7A/uPerxQ
	LpR6jq4KGQUjSpJbA4M0Ma2tknXG+fwBQfTza84yUgfD20XtBU1tRBPFw5kSPaqALdePi5vuFUxJE
	+djlLRMHACbHatRidLvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwH9A-00000007OqY-0zqO;
	Mon, 15 Apr 2024 07:53:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwH97-00000007Opa-45Oi;
	Mon, 15 Apr 2024 07:52:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8YIeaNZhu2VwYrI498gRkCoUAUbEjZA2ART1G/gViK0=; b=q4YHS8FjBEAnMbuDl+TMKsEKGP
	DM6iyFt6uA7Bo5adMws5/s0t1+j9HugdPjdNQD0yCOEfV7ZoW+QC17+eG/HZdmmEoyHPU8JoOx9XL
	7Fx3fT7PsknHnmu65yuhapSgCRz6CXa3c6A/kM7Sga97giJ17RK2CcTur3HI5Bz9lkxAWJiegTEQD
	TRBs7jlUSsh22rwhDKkQsCKrJadSsFPPtwcG8DzvOoayr4YqBfDfQ7mNeiHohXm2HpjY17hnCJFMz
	Wnf5Q5krVNT8G7J3KzkDXMsJA5bvEb5NAjurd+XnOU9adVQGbZMEFeMoQqJ3YmHp5tNlP8wxE1yRv
	RKdldQfQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwH8s-0000000AT0A-1En1;
	Mon, 15 Apr 2024 07:52:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E025B30040C; Mon, 15 Apr 2024 09:52:41 +0200 (CEST)
Date: Mon, 15 Apr 2024 09:52:41 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
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
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <20240415075241.GF40213@noisy.programming.kicks-ass.net>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411160051.2093261-6-rppt@kernel.org>
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

On Thu, Apr 11, 2024 at 07:00:41PM +0300, Mike Rapoport wrote:
> +/**
> + * enum execmem_type - types of executable memory ranges
> + *
> + * There are several subsystems that allocate executable memory.
> + * Architectures define different restrictions on placement,
> + * permissions, alignment and other parameters for memory that can be used
> + * by these subsystems.
> + * Types in this enum identify subsystems that allocate executable memory
> + * and let architectures define parameters for ranges suitable for
> + * allocations by each subsystem.
> + *
> + * @EXECMEM_DEFAULT: default parameters that would be used for types that
> + * are not explcitly defined.
> + * @EXECMEM_MODULE_TEXT: parameters for module text sections
> + * @EXECMEM_KPROBES: parameters for kprobes
> + * @EXECMEM_FTRACE: parameters for ftrace
> + * @EXECMEM_BPF: parameters for BPF
> + * @EXECMEM_TYPE_MAX:
> + */
> +enum execmem_type {
> +	EXECMEM_DEFAULT,
> +	EXECMEM_MODULE_TEXT = EXECMEM_DEFAULT,
> +	EXECMEM_KPROBES,
> +	EXECMEM_FTRACE,
> +	EXECMEM_BPF,
> +	EXECMEM_TYPE_MAX,
> +};

Can we please get a break-down of how all these types are actually
different from one another?

I'm thinking some platforms have a tiny immediate space (arm64 comes to
mind) and has less strict placement constraints for some of them?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
