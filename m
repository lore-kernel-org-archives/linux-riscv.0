Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A52C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 06:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wasnYBW9/hO8aAjlxl/7u1JNa56ncSs1RwWnf+8hnjg=; b=d7N4dOSFDBcsbm
	c1BVh7FtHh0pJx1YEzmtShBQC3R9eN8fWvSO1MQ1uREkP8mMKBwMj74Or0TsdIGcQQrOBx8shuyXx
	hcfAVAiV8dF5WS1rO5w3EWS7BYUqlgB4jrnikWQTXuEj6luil2+MXtZNW8+/Dhf3p7Xn/+KwmS/a/
	foV+45m+KDH+GUTPx9Qo9lJ61iaF4WTCTMHV5j9AIYlC3BwZXIBFdlDqpkSukIbsnryC5JZu7Iquf
	YMsMYh4hnFplP0TljPRyop54e9rPEJBl+h10vVnCk5ptf6cBxjqOOVaVv6DjqUnMv+9ptC0UIgmWY
	rrozMFzv9hby/qMm679A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvtln-00000004oXj-0lfq;
	Sun, 14 Apr 2024 06:55:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvtlj-00000004oW0-0HMg;
	Sun, 14 Apr 2024 06:55:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F54E602C3;
	Sun, 14 Apr 2024 06:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6995FC072AA;
	Sun, 14 Apr 2024 06:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713077713;
	bh=yXFVMzCDhJLeup5ZM/cl95e9uW89yN9aiaOn424Za9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ExCk/4I4W5Phef5aKaCHl7yCjGPCdhEDo2t4j5gOOcRyNoNKAWaoFjcjUPNV/ZDjL
	 NgPGAZFKEHXGgq8aJVi8Z2vvDSoVvCAV16D5jLcPzItS86EojO+p5yw5DDCakIbCdC
	 uDA7f0oS8i29LKJV724dmx85sHqKA14tjFqITDp8vRb8dfZu8WBgwU1FYXq0TYmRGR
	 7tSa/jZjNfXa/T7/J/CXr2wjq9OOfmF2PhtvRmpH6VXO/pNGCEo0ysFPCgbJcswH3+
	 8pSQxW9Jh3lYLdHalhcMBeJUrFP7jE5aNtiOQBUuA7scvpAOHZqdofUGHWY2VvqQnF
	 hEcRjO6WYTf+Q==
Date: Sun, 14 Apr 2024 09:53:59 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
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
Message-ID: <Zht9hw_DhDsaTuEP@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
 <Zhg9DXzagPbpNGH1@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zhg9DXzagPbpNGH1@bombadil.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_235515_219962_F99811A2 
X-CRM114-Status: GOOD (  25.18  )
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

On Thu, Apr 11, 2024 at 12:42:05PM -0700, Luis Chamberlain wrote:
> On Thu, Apr 11, 2024 at 07:00:41PM +0300, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > module_alloc() is used everywhere as a mean to allocate memory for code.
> > 
> > Beside being semantically wrong, this unnecessarily ties all subsystems
> > that need to allocate code, such as ftrace, kprobes and BPF to modules and
> > puts the burden of code allocation to the modules code.
> > 
> > Several architectures override module_alloc() because of various
> > constraints where the executable memory can be located and this causes
> > additional obstacles for improvements of code allocation.
> > 
> > Start splitting code allocation from modules by introducing execmem_alloc()
> > and execmem_free() APIs.
> > 
> > Initially, execmem_alloc() is a wrapper for module_alloc() and
> > execmem_free() is a replacement of module_memfree() to allow updating all
> > call sites to use the new APIs.
> > 
> > Since architectures define different restrictions on placement,
> > permissions, alignment and other parameters for memory that can be used by
> > different subsystems that allocate executable memory, execmem_alloc() takes
> > a type argument, that will be used to identify the calling subsystem and to
> > allow architectures define parameters for ranges suitable for that
> > subsystem.
> 
> It would be good to describe this is a non-fuctional change.

Ok.
 
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> 
> > diff --git a/mm/execmem.c b/mm/execmem.c
> > new file mode 100644
> > index 000000000000..ed2ea41a2543
> > --- /dev/null
> > +++ b/mm/execmem.c
> > @@ -0,0 +1,26 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> And this just needs to copy over the copyright notices from the main.c file.

Will do.
 
>   Luis

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
