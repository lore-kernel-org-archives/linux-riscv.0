Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63FAC282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+nDK9xdJIi7q0QjzNwv18jLFveU8eWHQPVaFC324so=; b=G+YMr7vk2znhCl
	d9NukXjqpAaXaVHUvEug7J9n3wx/c8lwmgx1+jrtUyfobnNtqD9dKnD18cV86/+oo7pHJt9IHR8oX
	B0EiGxoCOiTwRcc0PnjRZgJ7gsPiQlJQuooEzWtLOVaSvLC/pNAbJYMu42xD9O9N+/H3FdPAuTZ96
	8AbJ0GgR9efeO0qGEsvHn6JKPFU2aZBxKSSUjFvE6rODiZQ99mVvB+LGZFLi4Xt5nhah2HFUROvA8
	Uup3NsNrCGwdpRmCZxWC6ZV9kY1i0UWR1ORecIjoSA7VQC/NOaRmxa0aQW2gud3VI3LRwasmlXxjx
	lcyI3CtdapnbnUk4EvFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9le-00000002b3B-32cq;
	Mon, 17 Mar 2025 12:40:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9lb-00000002b1G-2ShZ;
	Mon, 17 Mar 2025 12:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1D645C5606;
	Mon, 17 Mar 2025 12:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A338C4CEE9;
	Mon, 17 Mar 2025 12:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742215225;
	bh=Qm34pbxAa6RjHCc2A1aXJ4qBOugE70Km6ONzqhDGMKA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E7Ar7yyZci/sFoCidNgE8WXrHkJCdBUtC5+SBI7ElJU6LgZqLiSvRPlv1xqMCdR+2
	 JdSknt+r47jh4J64JDHOV3bC2f8CCEHU9CwoE9ISsT1r2OFEQaCkooFpGyY2cq0AUS
	 8BJqKWvVNVKmYaiENoybfTCks4OV2Hujobg04vepdZYEAJYEHgTYSVQtuBbCiU49Wg
	 w4Y7etNdGOWGUdqy5s7jSxyR/7rnszsVQfJoCdbVmwcu/WQyL4uucGKWINrXNoVXHO
	 5i4vQUYMXA8gu7KzsUBsrs+oDW3h+voixjT+nCGjato5WHQworTVVXnwjAQoo5sK7c
	 ZdFal0K6UlYKw==
Message-ID: <e3dfe753-fb5f-4f2f-9d24-da8a4f01be19@kernel.org>
Date: Mon, 17 Mar 2025 07:40:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] nios2: move pr_debug() about memory start and
 end to setup_arch()
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Guo Ren
 <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org
References: <20250313135003.836600-1-rppt@kernel.org>
 <20250313135003.836600-7-rppt@kernel.org>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20250313135003.836600-7-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_054027_739842_F43E2B20 
X-CRM114-Status: GOOD (  16.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/13/25 08:49, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> This will help with pulling out memblock_free_all() to the generic
> code and reducing code duplication in arch::mem_init().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   arch/nios2/kernel/setup.c | 2 ++
>   arch/nios2/mm/init.c      | 2 --
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/nios2/kernel/setup.c b/arch/nios2/kernel/setup.c
> index da122a5fa43b..a4cffbfc1399 100644
> --- a/arch/nios2/kernel/setup.c
> +++ b/arch/nios2/kernel/setup.c
> @@ -149,6 +149,8 @@ void __init setup_arch(char **cmdline_p)
>   	memory_start = memblock_start_of_DRAM();
>   	memory_end = memblock_end_of_DRAM();
>   
> +	pr_debug("%s: start=%lx, end=%lx\n", __func__, memory_start, memory_end);
> +
>   	setup_initial_init_mm(_stext, _etext, _edata, _end);
>   	init_task.thread.kregs = &fake_regs;
>   
> diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
> index a2278485de19..aa692ad30044 100644
> --- a/arch/nios2/mm/init.c
> +++ b/arch/nios2/mm/init.c
> @@ -65,8 +65,6 @@ void __init mem_init(void)
>   	unsigned long end_mem   = memory_end; /* this must not include
>   						kernel stack at top */
>   
> -	pr_debug("mem_init: start=%lx, end=%lx\n", memory_start, memory_end);
> -
>   	end_mem &= PAGE_MASK;
>   	high_memory = __va(end_mem);
>   

Acked-By: Dinh Nguyen <dinguyen@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
