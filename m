Return-Path: <SRS0=iJWH=NH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B8CC4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 05:53:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5462F600CC
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 05:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5462F600CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhpSSP/rNNzAoY+zFvNDw9M8VvF3x3o+AB1uUkkBOwU=; b=WiSdQkzvcMXTUG
	cgAgmzNW6u6KF1rSFXiNae4KS16nZHfujgiXKeAFCVVfudBiscWFhKhV44DagSgAWt0V1fJf4+YnW
	sVgmL9DbFluNbtxn2+3pdaFaZsmP2R4kWBDnL09GMd3eUDfFM7lO7LZiM5u+0dPMoVdkM2lVFBfNF
	nS+U0go9E/Um9iBA6ZqjSPulvJRWoaIIR4MR4GoUrPG5llGzLyo4m3kiVm40mXIZptK4r87FqB6kO
	DEUzGrxYadKu/DFBtVtH8Cg3y3YuiWWQZ3rbJzIxvfjDMQvKztTfw6/f+xYE32p0zra4B+HC8XBZ8
	W2QpNFA2JpkJkFOJLJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFVY6-00G9zS-84; Mon, 16 Aug 2021 05:52:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFVXr-00G9xX-FI; Mon, 16 Aug 2021 05:52:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A884A600CC;
 Mon, 16 Aug 2021 05:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629093142;
 bh=A6XKGIIAGrCO5lr+EGtJFLRD0uO5DuHaL25253B/0cs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i0ZWxkzqk1lluWmumf696hHuneR81LxxFZwzuz6zcNGNz2uWu8eVpQgTKcpPmZqj5
 /AtGznPbKq0lL/ikkV7hit2eI87siYUwoTWUXOXgzNC3OF/WrX1BumfBDpGDVn6T1g
 xWoPeQNXsSH781LLNcBIR5zGByncT4MSL2m4vtR1Jztv2bFt1sqcGe7ddekuvryAMK
 fKTXmr7VAVwKt15KAiMkWixahE8wF4NRQrMqP4RZSclYSPUt6WzqU3jwjnnUXwMjlJ
 pUT7vbAI/rpzvVTmYGoaf4IvoxZtrMDqZNrmwda+Qn1L7e/cy6bmDqiTIfwRmIJ06i
 3XiqiOoVCj5Ng==
Date: Mon, 16 Aug 2021 08:52:12 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>,
 Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/9] MIPS: Avoid future duplicate elf core header
 reservation
Message-ID: <YRn9DHlB/pdNPJyP@kernel.org>
References: <cover.1628670468.git.geert+renesas@glider.be>
 <92b6718f5618d5469f67b48fbea189cca0c12f4b.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92b6718f5618d5469f67b48fbea189cca0c12f4b.1628670468.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_225223_571972_61909232 
X-CRM114-Status: GOOD (  20.96  )
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

Hi Geert,

On Wed, Aug 11, 2021 at 10:50:59AM +0200, Geert Uytterhoeven wrote:
> Prepare for early_init_fdt_scan_reserved_mem() reserving the memory
> occupied by an elf core header described in the device tree.
> As arch_mem_init() calls early_init_fdt_scan_reserved_mem() before
> mips_reserve_vmcore(), the latter needs to check if the memory has
> already been reserved before.

Doing memblock_reserve() for the same region is usually fine, did you
encounter any issues without this patch?
 
> Note that mips_reserve_vmcore() cannot just be removed, as not all MIPS
> systems use DT.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>   - New.
> ---
>  arch/mips/kernel/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 23a140327a0bac1b..4693add05743d78b 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -429,7 +429,8 @@ static void __init mips_reserve_vmcore(void)
>  	pr_info("Reserving %ldKB of memory at %ldKB for kdump\n",
>  		(unsigned long)elfcorehdr_size >> 10, (unsigned long)elfcorehdr_addr >> 10);
>  
> -	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
> +	if (!memblock_is_region_reserved(elfcorehdr_addr, elfcorehdr_size)
> +		memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
>  #endif
>  }
>  
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
