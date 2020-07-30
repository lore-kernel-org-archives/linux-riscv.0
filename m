Return-Path: <SRS0=rfC7=BJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD50C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 12:15:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6E0F2067D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 12:15:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qe80vIGA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="dDG2HeGv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6E0F2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SXc4gYIyN1ivxYlgOtjf8NosYUxFmTBeidzdFFI7XEY=; b=Qe80vIGASOVstpo2ltrZlAsaN
	7j2BjOAhndK9+9/QbdZPhMoT/HhUOKcyugNN1u/eS/K2kBqZ79Kp9N0B1GDkegF7gtExSPNkG9duO
	FJ9BUx8dXkNU0LGqgNu7UwuY+67h05LTweiEgsvHzgieQBgKnKPN2yGbTYau+1MOg+6QO0bBH41iY
	WdBVQ869WISBccrOlPAS6/trRclme3S+OXPhPvSTxjKqJSWhtkNMEClPQw4r3HsWUBH2BgRI27fuj
	FChPY6w0BL2xjjDxtn/L9hlY6hkt/g7qy2i7j/O8rI3uvgbFV2tuXTQlYcmD173l/j6xTG/b96N9q
	7qg8XF8VQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k17TB-0001v1-OT; Thu, 30 Jul 2020 12:15:33 +0000
Received: from ozlabs.org ([203.11.71.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k17T5-0001rG-BH; Thu, 30 Jul 2020 12:15:28 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHTrL6Fgfz9sRN;
 Thu, 30 Jul 2020 22:15:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596111321;
 bh=YNSVJAmG6iTLprr4AXeykiRRbuPWau8/ePuc4CoRMGM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dDG2HeGveH8jvsO0a3nV+Tp8BcGIZDu65BOPDvIIBo9wVTyiHzeoVy9VEea0rigvp
 Y31hCYMQ/HUQJyt9f4Ns+ZWd4J0yauoOrKc1q24QkaP65G5RtKXvj8BnxizCtGPCIs
 4Qc5Gy9BbRkYcfHS9FaL2IesmCw9kHwdS0i+jJ5INj6RLnsR8z4hMy+N03Q+rveLd0
 2v5hfX/mFHnRdxjBR0pUmOS4LXqz54J4KK7TRfoGZVmsUzhhMnBhUvMn3FR8lvfRl/
 Ax9t5/4az9jOznaLXvwqANu/Zl8pK6CgRrdLYmMHTgYkBan25IQFsKLy25EXJBUiYn
 TCPH/khAUMFFQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 06/15] powerpc: fadamp: simplify
 fadump_reserve_crash_area()
In-Reply-To: <20200728051153.1590-7-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-7-rppt@kernel.org>
Date: Thu, 30 Jul 2020 22:15:13 +1000
Message-ID: <87d04d5hda.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_081527_629301_FA411002 
X-CRM114-Status: GOOD (  21.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Hari Bathini <hbathini@in.ibm.com>,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Stafford Horne <shorne@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Christoph Hellwig <hch@lst.de>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Mike Rapoport <rppt@kernel.org> writes:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> fadump_reserve_crash_area() reserves memory from a specified base address
> till the end of the RAM.
>
> Replace iteration through the memblock.memory with a single call to
> memblock_reserve() with appropriate  that will take care of proper memory
                                     ^
                                     parameters?
> reservation.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/powerpc/kernel/fadump.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)

I think this looks OK to me, but I don't have a setup to test it easily.
I've added Hari to Cc who might be able to.

But I'll give you an ack in the hope that it works :)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>


> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 78ab9a6ee6ac..2446a61e3c25 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1658,25 +1658,7 @@ int __init fadump_reserve_mem(void)
>  /* Preserve everything above the base address */
>  static void __init fadump_reserve_crash_area(u64 base)
>  {
> -	struct memblock_region *reg;
> -	u64 mstart, msize;
> -
> -	for_each_memblock(memory, reg) {
> -		mstart = reg->base;
> -		msize  = reg->size;
> -
> -		if ((mstart + msize) < base)
> -			continue;
> -
> -		if (mstart < base) {
> -			msize -= (base - mstart);
> -			mstart = base;
> -		}
> -
> -		pr_info("Reserving %lluMB of memory at %#016llx for preserving crash data",
> -			(msize >> 20), mstart);
> -		memblock_reserve(mstart, msize);
> -	}
> +	memblock_reserve(base, memblock_end_of_DRAM() - base);
>  }
>  
>  unsigned long __init arch_reserved_kernel_pages(void)
> -- 
> 2.26.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
