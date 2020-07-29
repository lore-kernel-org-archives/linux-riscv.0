Return-Path: <SRS0=qsF3=BI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B589C433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 11:42:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8190207E8
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 11:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l1nID/rA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErgMzYX2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8190207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CooWtbclz9YjaYYG6w3pDKXYR0ceu3BU/we6j7WBp7A=; b=l1nID/rAlVLi0PzFUCvV2xmet
	nLFSyAG6PGP5YaUO0AaSo48DjQGkRmQ1zSZ7qutKaEdIBmL3CiNmBfwbtBkcCofQMyKL8t6loaK7F
	e7dm/YsO+tQW81dLmQLK39uEa9pGUpthPaLptZcjYsD74kKhS69/cQ2/v0EtXTR2U/zkUqUz+1pSs
	N5ukWF/+tCA69ED4Xel2YuQebOsDfq6zECxKypRkL/4Hpv6gwytZwfD9q47DzwQFSAdcxXPj/Ao1V
	EX4kmh8jA0Q988XUBbyPd77EthG/jbqtmbzg722nJV/AttHZ2F4v+grqwNz25S4fnjHtOz708sVeq
	QeY1YBVYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0kTL-0004V7-F4; Wed, 29 Jul 2020 11:42:11 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0kTF-0004SV-6f; Wed, 29 Jul 2020 11:42:06 +0000
Received: by mail-pg1-x544.google.com with SMTP id z5so14120732pgb.6;
 Wed, 29 Jul 2020 04:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FyoxCr0A58f1XavZrIV1VkDI4AyZt3GTW0GxGRW15PU=;
 b=ErgMzYX2rlBnfYHmvHv9Kb0jAk9sTy/cgwUC91LEM8hW88sSiXCtCju4DtSraYOdN6
 Iz7cbIFHeP/OokbCsIndQn1W0/LL6legP5rUG8YuTLcO1oJBa0Q3JVGulGwjco0UElqI
 VvU/wz6i9utUjGjHa4JZVJYJZv72u/uWssFs8dC69IKpZ4vHIedaLdUQ404Jx+JIDGcj
 xtC8Sy1W9N1QM1A5lPVwWKGR7s1VkCc/Z0Han0x8lhUlPGexDzIucGIkbsBs70Eg0SOc
 poCa7kET1lEBIE2/zAVCwyCXmjvm7W2acmjhWVo6kPWsms3mfhSxEZ1uLiCnzlFIY+r2
 7Ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FyoxCr0A58f1XavZrIV1VkDI4AyZt3GTW0GxGRW15PU=;
 b=Tag9iM46mOKNQdFG/9XWNtmt8wO7kK5pWxpSINA0jxQcXlGCewUwUeqPrrrBpF3crO
 KoBQj02CXJWHcrd35AL64h3c6H7fs+LNhEhZMUdcfGnsJRnpi47VqvSKEwQZoj3kn2CW
 4gRtTah2xFgu8aaNUmW4sO0TQt7EvRGzu59GHn+Q3lA/uEQr3+IXGwrYuvuKet+GcNKL
 0/Gd1baAVHfPkg5LixJz9hZPCz2sg+deLSi+psg+pqkVhFHL8vcLJcPvsThNbVTyUlyy
 aCu1aqgSDiJ/RD3C31GicI3+ZYXnXc0HeahPRYkNXhM7xWV5wSCSGO6Zgd5/A4SigEIE
 gXAw==
X-Gm-Message-State: AOAM5315EhLTtz1bfWgWjqION3jFYHRkPT86c1ftpA0k0vgNg5YIpCXT
 bcScBvi6LoTm+b+hEl6hurI=
X-Google-Smtp-Source: ABdhPJwp4puneP0dTsVKBe6dB1tdiT/38z6QwdAB9b3TkM+HxCNc29Y6zwoL2ht5YGJJkcQZn4i23Q==
X-Received: by 2002:a65:64c7:: with SMTP id t7mr27611626pgv.89.1596022921588; 
 Wed, 29 Jul 2020 04:42:01 -0700 (PDT)
Received: from localhost (g155.222-224-148.ppp.wakwak.ne.jp. [222.224.148.155])
 by smtp.gmail.com with ESMTPSA id y18sm2097780pff.10.2020.07.29.04.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 04:42:00 -0700 (PDT)
Date: Wed, 29 Jul 2020 20:41:57 +0900
From: Stafford Horne <shorne@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 05/15] h8300, nds32, openrisc: simplify detection of
 memory extents
Message-ID: <20200729114157.GF80756@lianli.shorne-pla.net>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-6-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_074205_299672_A1FAE748 
X-CRM114-Status: GOOD (  17.81  )
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
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2020 at 08:11:43AM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Instead of traversing memblock.memory regions to find memory_start and
> memory_end, simply query memblock_{start,end}_of_DRAM().
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/h8300/kernel/setup.c    | 8 +++-----
>  arch/nds32/kernel/setup.c    | 8 ++------
>  arch/openrisc/kernel/setup.c | 9 ++-------
>  3 files changed, 7 insertions(+), 18 deletions(-)

Hi Mike,

For the openrisc part:

Acked-by: Stafford Horne <shorne@gmail.com>

> --- a/arch/openrisc/kernel/setup.c
> +++ b/arch/openrisc/kernel/setup.c
> @@ -48,17 +48,12 @@ static void __init setup_memory(void)
>  	unsigned long ram_start_pfn;
>  	unsigned long ram_end_pfn;
>  	phys_addr_t memory_start, memory_end;
> -	struct memblock_region *region;
>  
>  	memory_end = memory_start = 0;
>  
>  	/* Find main memory where is the kernel, we assume its the only one */
> -	for_each_memblock(memory, region) {
> -		memory_start = region->base;
> -		memory_end = region->base + region->size;
> -		printk(KERN_INFO "%s: Memory: 0x%x-0x%x\n", __func__,
> -		       memory_start, memory_end);
> -	}
> +	memory_start = memblock_start_of_DRAM();
> +	memory_end = memblock_end_of_DRAM();
>  
>  	if (!memory_end) {
>  		panic("No memory!");
> -- 
> 2.26.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
