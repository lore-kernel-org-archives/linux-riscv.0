Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AA7E88D73
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 02:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zxq9jXAI9QRG4Wv52N77vmdxvr01+UYvd990XNNXKjI=; b=Cw4XldaTfjD8b+
	dpGPHsjEj3oDfLLrP+s+4Y5e2lVbKrpbLfTSlWQQAmneILP3Qr4Hi9400yX1cTpPBAKYz+UnUuVuY
	46++4fz4moP1qfPVgNGmHZjGmG0TxBn44cfaTl4nHAQYSGDPe3zOAhjreMX3ZlQNo2FKVYQORY3z1
	NKj0tANcb+lgeYxs4uze7tcbszIk+WknydCXjFL2D8poZdWKOI5mWqmboAHVxeApv8NPCVv+Ek+4k
	tuQXuLDW6Zrz82IVbjnhBEtoHSZUh3XRXgEBw9UkLldDQjPgXTb9h23d8VMbBcO89oQp9DnpcA5cO
	Kh5X3n4ZQ2LY3JlwHWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8qNG-00000002zO0-2cUI;
	Sat, 04 Apr 2026 02:04:34 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8qND-00000002zLy-3X8K
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 02:04:33 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-67f9209185dso1286961eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 19:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1775268270; x=1775873070; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QFX1dhDieBRaAm9qJ2639rNkR3TjfczoXLEWvV+mu0Y=;
        b=O9wvK4bC91Xz/TQL9yClz7M4zd4kSwSnNviAfNydw4CkFI+0u5C3eEHp40fDmZjlEx
         7I/iftBStUWKsHv+JYa3cubkdtxd09gvIdJEdb2DOosU0/A8eU7lGZkKs1GHsRWYY4Qr
         Gqhgzka/ECAKntzrn1XBZekncIde3ze7kTn2unzfAo3aaCXNqukaYahjoNCfPjnohz+X
         P3HHiIurHyNq0iQaUQw2jO6Xx+GXPKF1G0+cUi/aUazXWL6Ct506JbMe7hu4Bte/nzmS
         rXvNzq0CTHdOrqCPAspR9QchYvSY17XQIltpq3zNHpIkzuRII7wN6S46jKH2PnbNUDIB
         hcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775268270; x=1775873070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFX1dhDieBRaAm9qJ2639rNkR3TjfczoXLEWvV+mu0Y=;
        b=Ihi7G+pakqI422M3cjP4eMS8vbiXvRkPWmYVHtrEY1qvchPY3knLTnLggeJyDXVB9a
         jvVbo+s32d3UNclbwNfYQtDdSLiVn5eRj2ITvIzTjN9s0p5MQOTIXeYuYh+TjfyJ3tVK
         k1vOk2Nzm6pIcdf7RGtIY/yFW18VE3+YcJSJl/4rlSghQuTbuyfyJX9Edtq0LPSLkAgn
         M/+HSDpz+6AJaWrcSouyp5uqX5b6exQWuM6YB/C/k8LIseRM34WThh6HP3AZ2KoXSRur
         NkKE/kNRxPsqaeaoM3O5Bsexj2ya2qXHk1C0Ydec9KH4l4NBA8RZbzMVDIwFeA7GCajf
         oMNg==
X-Forwarded-Encrypted: i=1; AJvYcCU7q9IzXnrSWsg1GL6fRmx6T1OGmjFpdWdt1J1Y3zki+3PNQcrLQgbPXztpgLeotVLrxd72vSylihW/Yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeDi1vatVOHbsTN7q/itcFg7X1/uyow9c6atChkzDrZYzVl9BK
	ZmZSRTk64OvPParmNx/YdMxqgI+dWtbUmG0Q7uCUeS/si2xIXwfaQMXhJQ12akcAwNk=
X-Gm-Gg: ATEYQzwDWOekoP7oNSN0W7BN8197SbHaCFjqIotBghZfRv+weTMKnewuCo4eDfJfKTj
	OUjTfrV91qd6HFgiwOLgq3CPe4lzQjlrtaWmLyDY3yyv0yRrFz5vGuVQrP9/2PGX2ZYBBjw+otS
	Np+adLJJxBOVBw0pvFfn26hfCFiMf+m+P8awszuiEdbZ1IGmFKDPuGOH45poT/cdqhX6DE2JTDt
	NAA4feQFtIRpIWxb4q2ISf424euCzkOKGpNxR0o0u3ayC/VRyM6jG8wAqJUZDmnjPYKfUcpZ3Oj
	VEf+JM3zbYx79FnUq0haVqPFTs2DJt1WOQywcURyqkrkfkZEIUbmm1UVGFrWJ3yRvp2rZ3tVyN4
	8//eCcWLxG1GvMOHbMlTCvfAoKlAhDOGXgGDXuMsVGmJG8Ye2k/7nWgpcQz6yAY1br4pumsYjnI
	Lig6hD/4w90lqEDhRRF4bq5Pvhpxz800bbYoHVPiLQYCYX+ua1aXrYfkJtAGjPjs5EVy3W
X-Received: by 2002:a05:6820:2006:b0:67c:250c:ac4c with SMTP id 006d021491bc7-6821fe6157amr2712135eaf.31.1775268270140;
        Fri, 03 Apr 2026 19:04:30 -0700 (PDT)
Received: from toolbox ([2600:1700:220:59e0:a819:2018:a04a:68a9])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6822987630bsm2274434eaf.4.2026.04.03.19.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 19:04:29 -0700 (PDT)
Date: Fri, 3 Apr 2026 21:04:06 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: mm: fix SWIOTLB initialization for systems with
 DRAM above 4GB
Message-ID: <adBxljN4t0ZIIvGQ@toolbox>
References: <20260331-fix-riscv-swiotlb-v1-1-74dd5e6be0f1@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260331-fix-riscv-swiotlb-v1-1-74dd5e6be0f1@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_190432_202994_FB025C28 
X-CRM114-Status: GOOD (  16.53  )
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

On Tue, Mar 31, 2026 at 03:37:22PM +0800, Troy Mitchell wrote:
> On RISC-V platforms where the entire physical memory (DRAM) resides
> above the 32-bit address space (i.e., above dma32_phys_limit), the
> current SWIOTLB initialization logic fails.
> 
> This patch addresses two interconnected issues on such platforms:
> 
> 1. Incorrect 32-bit DMA bounce assumption:
> The existing condition `max_pfn > PFN_DOWN(dma32_phys_limit)` assumes
> that a 32-bit DMA bounce buffer is required simply because the maximum
> PFN exceeds the 32-bit limit. However, if all DRAM starts above 4GB,
> no memory exists below the limit to satisfy this allocation. Fix
> this by adding a check to ensure `memblock_start_of_DRAM()` is actually
> below the 32-bit limit before enforcing 32-bit SWIOTLB.
> 
> 2. kmalloc() bounce buffer allocation failure on non-coherent systems:
> For non-coherent hardware, a bounce buffer is still mandatory for
> cache-line-aligned kmalloc(), even if 32-bit DMA bouncing is skipped.
> Without the `SWIOTLB_ANY` flag, swiotlb_init() defaults to allocating
> from low memory, which fails completely when DRAM only exists in high
> memory. By appending `SWIOTLB_ANY` to swiotlb_flags, the allocator is
> permitted to allocate this alignment buffer from high memory.
> 
> With this patch, systems with non-coherent DMA and DRAM entirely above
> 4GB can successfully map the software IO TLB in high memory and boot
> normally.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  arch/riscv/mm/init.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Tested on Tenstorrent Blackhole, which doesn't have any memory < 4GB.
With this patch, these lines no longer appear during boot

[    0.000000] software IO TLB: area num 4.
[    0.000000] software IO TLB: swiotlb_memblock_alloc: Failed to allocate 67108864 bytes tlb structure
[    0.000000] software IO TLB: swiotlb_memblock_alloc: Failed to allocate 33554432 bytes tlb structure
[    0.000000] software IO TLB: swiotlb_memblock_alloc: Failed to allocate 16777216 bytes tlb structure
[    0.000000] software IO TLB: swiotlb_memblock_alloc: Failed to allocate 8388608 bytes tlb structure
[    0.000000] software IO TLB: swiotlb_memblock_alloc: Failed to allocate 4194304 bytes tlb structure
[    0.000000] software IO TLB: swiotlb_memblock_alloc: Failed to allocate 2097152 bytes tlb structure
[    0.000000] software IO TLB: swiotlb_memblock_alloc: Failed to allocate 1048576 bytes tlb structure

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

Regards
Anirudh Srinivasan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
