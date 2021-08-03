Return-Path: <SRS0=9VPL=M2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B174C4338F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 18:06:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE37E60F94
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 18:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE37E60F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkOOJVSfAOdugwdLixxHObuv+qiaIx5U0xTV/xRAa8U=; b=tICZEIDeSjGWkH
	bLW79Mj1lr2JyPiB5wv9YuT7WKBK+rVGQRwkLzSvOeeATeV3jMpnHrKHdDIZObjvXRhnhWwM59aSQ
	eg6WCziprY1CDu6zn7s2iPXId+KO10fP+FPbMcDzP2a4lMia8/oyeX7cSfVq9GlsL3pD3i3waXnmq
	OMtfljba6S/zP62AIQe8iuJlGQB941NvxhwZcdxRxlbvD+Clj/RAVt4F8PAxuSPDfaGul/gvgiFy0
	2m3T/uMYJdXOqm0mzTyi4K0XsgMqs1h+vbmhI2EXHIrxD4/TKaFu4f3x5VCyldfZ+n9p4Or22Eyyl
	PogkHje7dFHpaCrWI8BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAynY-003s4F-HZ; Tue, 03 Aug 2021 18:05:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAynL-003s2A-S3; Tue, 03 Aug 2021 18:05:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E36260F48;
 Tue,  3 Aug 2021 18:05:34 +0000 (UTC)
Date: Tue, 3 Aug 2021 19:05:26 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Len Brown <lenb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3] memblock: make memblock_find_in_range method private
Message-ID: <20210803180526.GD5786@arm.com>
References: <20210803064218.6611-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803064218.6611-1-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_110540_001059_357E39BD 
X-CRM114-Status: GOOD (  21.29  )
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

On Tue, Aug 03, 2021 at 09:42:18AM +0300, Mike Rapoport wrote:
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 8490ed2917ff..0bffd2d1854f 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -74,6 +74,7 @@ phys_addr_t arm64_dma_phys_limit __ro_after_init;
>  static void __init reserve_crashkernel(void)
>  {
>  	unsigned long long crash_base, crash_size;
> +	unsigned long long crash_max = arm64_dma_phys_limit;
>  	int ret;
>  
>  	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
> @@ -84,33 +85,18 @@ static void __init reserve_crashkernel(void)
>  
>  	crash_size = PAGE_ALIGN(crash_size);
>  
> -	if (crash_base == 0) {
> -		/* Current arm64 boot protocol requires 2MB alignment */
> -		crash_base = memblock_find_in_range(0, arm64_dma_phys_limit,
> -				crash_size, SZ_2M);
> -		if (crash_base == 0) {
> -			pr_warn("cannot allocate crashkernel (size:0x%llx)\n",
> -				crash_size);
> -			return;
> -		}
> -	} else {
> -		/* User specifies base address explicitly. */
> -		if (!memblock_is_region_memory(crash_base, crash_size)) {
> -			pr_warn("cannot reserve crashkernel: region is not memory\n");
> -			return;
> -		}
> +	/* User specifies base address explicitly. */
> +	if (crash_base)
> +		crash_max = crash_base + crash_size;
>  
> -		if (memblock_is_region_reserved(crash_base, crash_size)) {
> -			pr_warn("cannot reserve crashkernel: region overlaps reserved memory\n");
> -			return;
> -		}
> -
> -		if (!IS_ALIGNED(crash_base, SZ_2M)) {
> -			pr_warn("cannot reserve crashkernel: base address is not 2MB aligned\n");
> -			return;
> -		}
> +	/* Current arm64 boot protocol requires 2MB alignment */
> +	crash_base = memblock_phys_alloc_range(crash_size, SZ_2M,
> +					       crash_base, crash_max);
> +	if (!crash_base) {
> +		pr_warn("cannot allocate crashkernel (size:0x%llx)\n",
> +			crash_size);
> +		return;
>  	}
> -	memblock_reserve(crash_base, crash_size);

We'll miss a bit on debug information provided to the user in case of a
wrong crash_base/size option on the command line. Not sure we care much,
though the alignment would probably be useful (maybe we document it
somewhere).

What I haven't checked is whether memblock_phys_alloc_range() aims to
get a 2MB aligned end (size) as well. If crash_size is not 2MB aligned,
crash_max wouldn't be either and the above could fail. We only care
about the crash_base to be aligned but the memblock_phys_alloc_range()
doc says that both the start and size would be aligned to this.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
