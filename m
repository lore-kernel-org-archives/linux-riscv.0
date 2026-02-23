Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7165DEA4FC2
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 13:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8izg0cdLrHsZ7FKwshwrETmA8eSZUZPR8Gvj+5d+V5s=; b=MAKJZnUcmiod7Q
	f2vhq9JwT7n89LQDurrPh56NFVzESmzFUtDgGrgbcIzF9cPnr/b530GRj/YHSf3UiP8z4H9hoHI40
	2aY/Ry224Q9y4ctTkkChqFvQln9OnaUBYpG+UDucyueV+IgnR/b7uBOIHSf6uk+nm3RQJZtS+Oko/
	GGm1WTS2cOlNFwIbgc+Vwi35ZlErn03j86sq6vXF0cjhusr55uumxkbYIZPb/lM1LIjELYyyafBo2
	e+oPI+pQyVPjqVqhi6YY0GmUzsfqm8yF0m887qk0NvEW/kKXHx1uLZMl2R9EiVKG9VIWZrygNvret
	FdcfRdcTmoX/zgPN0S0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWMn-00000000Ppr-3X2E;
	Mon, 23 Feb 2026 13:52:53 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWMl-00000000Poh-3kO6
	for linux-riscv@lists.infradead.org;
	Mon, 23 Feb 2026 13:52:53 +0000
Date: Mon, 23 Feb 2026 14:52:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1771854765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YYN2ElQvz1bXGLb236MoycuOriEzIAg8a9PdtF1XU6M=;
	b=dnVQezFKSeL4QlKI1KpAXqUZs5gfTKhrpyvYBrCxSx7N3Y1Gc3BT9Yp/FK+6UZkPyUwZxf
	+yveBjQMn8jEK+BeoaY8Vk2G8cRZWQ7lIYdUky8JgEUOYqctFsPXaVFiAvy5i/+OdtEglC
	bcnndOvuPuukWw6T0HE45JTvs/sQ7TYEPK6TxFLD/CwZh4pfg+exZGlzQsaUET/zWBk7CS
	H9x3+Cmtk+dbKl8J3go/kjbh+WZzT57d6kvpH1x7iyCwLdwqFUM9oizXmOL/ySDdXJiv3V
	TXNokG9tyt6pOIwkyleL2IEsooBViQqUU8HfUfCJDTPnB3OFqUyeItP/E3aFaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1771854765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YYN2ElQvz1bXGLb236MoycuOriEzIAg8a9PdtF1XU6M=;
	b=Tk9zqDZoD56XAidgdo95hukb9YEaVDmXoZTjWWnY/9zTalzZjQJDPv5EHISHX0j/mEQA/j
	LtlKIXw/crURzGAA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Mike Rapoport <rppt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org
Subject: Re: [PATCH v3 24/29] arch, mm: consolidate initialization of SPARSE
 memory model
Message-ID: <20260223144108-dcace0b9-02e8-4b67-a7ce-f263bed36f26@linutronix.de>
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260111082105.290734-25-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260111082105.290734-25-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_055252_075847_9B7BEF71 
X-CRM114-Status: GOOD (  13.70  )
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

Hi everyone,

On Sun, Jan 11, 2026 at 10:20:58AM +0200, Mike Rapoport wrote:
> Every architecture calls sparse_init() during setup_arch() although the
> data structures created by sparse_init() are not used until the
> initialization of the core MM.
> 
> Beside the code duplication, calling sparse_init() from architecture
> specific code causes ordering differences of vmemmap and HVO initialization
> on different architectures.
> 
> Move the call to sparse_init() from architecture specific code to
> free_area_init() to ensure that vmemmap and HVO initialization order is
> always the same.

This broke the boot on RISC-V 32-bit (rv32_defconfig) for me.

Specifically if sparse_init() is *not* called before the following callchain,
the kernel dies at that point.

start_kernel()
  setup_arch()
    apply_boot_alternatives()
      _apply_alternatives()
        riscv_cpufeature_patch_func()
          patch_text_nosync()
          riscv_alternative_fix_offsets()


Simple reproducer, using kunit:

./tools/testing/kunit/kunit.py run --raw_output=all --make_options LLVM=1 --arch riscv32 --kconfig_add CONFIG_SPARSEMEM_MANUAL=y --kconfig_add CONFIG_SPARSEMEM=y

> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  Documentation/mm/memory-model.rst                    |  3 ---
>  Documentation/translations/zh_CN/mm/memory-model.rst |  2 --
>  arch/alpha/kernel/setup.c                            |  1 -
>  arch/arm/mm/init.c                                   |  6 ------
>  arch/arm64/mm/init.c                                 |  6 ------
>  arch/csky/kernel/setup.c                             |  2 --
>  arch/loongarch/kernel/setup.c                        |  8 --------
>  arch/mips/kernel/setup.c                             | 11 -----------
>  arch/parisc/mm/init.c                                |  2 --
>  arch/powerpc/include/asm/setup.h                     |  4 ++++
>  arch/powerpc/mm/mem.c                                |  5 -----
>  arch/powerpc/mm/numa.c                               |  2 --
>  arch/riscv/mm/init.c                                 |  1 -
>  arch/s390/mm/init.c                                  |  1 -
>  arch/sh/mm/init.c                                    |  2 --
>  arch/sparc/mm/init_64.c                              |  2 --
>  arch/x86/mm/init_32.c                                |  1 -
>  arch/x86/mm/init_64.c                                |  2 --
>  include/linux/mmzone.h                               |  2 --
>  mm/internal.h                                        |  6 ++++++
>  mm/mm_init.c                                         |  1 +
>  21 files changed, 11 insertions(+), 59 deletions(-)

(...)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
