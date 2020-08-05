Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F219C433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 03:51:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6731E22CB3
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 03:51:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OBjgjoG+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EpqpRnxl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6731E22CB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V0EdIz1SIciGB8+VjQXxjfBvCf6rAyZNrq02TROeh9s=; b=OBjgjoG+OX8HbH50GfjuI0S6Z
	jpULqodaOEsDE+0+CUYTjvt//2GwyBridJctyqG0C6vuGYArqLAbh4oYtNAqvWiEfdCnlEibUf1px
	WLeSeIQ22KoY/Kp29X40jKzmTksdkY5gkGN4CVysmg5TJ1HTPoFtXYruSClRl0VLtGLcXSeu7ENpE
	WvKGR27h/S7XsbB74vFRS0goM+zM76DCulJtxLuKuN15tBvbIEj5wFtspL4b9acBWp2JXW63e00UP
	wXUqW+BZeHllT3NWwJMFx2a97H1bK0NV+6c76OS7X8xM9+1/+HuRmNwQy8CpMWvG5bHy0toHLAcjm
	j3I7cvHMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3ARz-0003sG-LS; Wed, 05 Aug 2020 03:50:47 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3ARv-0003qE-Jd
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 03:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596599441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PBRFUAvhtw5NCrkPVOAd8K2sp2Oav4oQ9F6n5x6FCHA=;
 b=EpqpRnxlyFlrjlyw7bkaQaUpWOIT9jx/4C19hWNepyupGYYcajnOtvCObEUC2XGNdjQ9vn
 uJmxFXEE7fMaVz2lR3eQEA/RXH440BKOjEvx5OY3HbcQl4SerTeiACcz4a5Jb2qJt7TBLo
 cjEHrvRh9CTzwQnBBpQT7xNOtjNMI4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-xI0_yRdGMPGizyxDuo-nyA-1; Tue, 04 Aug 2020 23:50:36 -0400
X-MC-Unique: xI0_yRdGMPGizyxDuo-nyA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CFAE102C7EC;
 Wed,  5 Aug 2020 03:50:30 +0000 (UTC)
Received: from localhost (ovpn-12-71.pek2.redhat.com [10.72.12.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17E4F8AC06;
 Wed,  5 Aug 2020 03:50:27 +0000 (UTC)
Date: Wed, 5 Aug 2020 11:50:24 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 02/17] dma-contiguous: simplify
 cma_early_percent_memory()
Message-ID: <20200805035024.GR10792@MiWiFi-R3L-srv>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-3-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_235043_710029_223E2EB8 
X-CRM114-Status: GOOD (  23.97  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 08/02/20 at 07:35pm, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The memory size calculation in cma_early_percent_memory() traverses
> memblock.memory rather than simply call memblock_phys_mem_size(). The
> comment in that function suggests that at some point there should have been
> call to memblock_analyze() before memblock_phys_mem_size() could be used.
> As of now, there is no memblock_analyze() at all and
> memblock_phys_mem_size() can be used as soon as cold-plug memory is
> registerd with memblock.
> 
> Replace loop over memblock.memory with a call to memblock_phys_mem_size().
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  kernel/dma/contiguous.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index 15bc5026c485..1992afd8ca7b 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -73,16 +73,7 @@ early_param("cma", early_cma);
>  
>  static phys_addr_t __init __maybe_unused cma_early_percent_memory(void)
>  {
> -	struct memblock_region *reg;
> -	unsigned long total_pages = 0;
> -
> -	/*
> -	 * We cannot use memblock_phys_mem_size() here, because
> -	 * memblock_analyze() has not been called yet.
> -	 */
> -	for_each_memblock(memory, reg)
> -		total_pages += memblock_region_memory_end_pfn(reg) -
> -			       memblock_region_memory_base_pfn(reg);
> +	unsigned long total_pages = PHYS_PFN(memblock_phys_mem_size());

Reviewed-by: Baoquan He <bhe@redhat.com>

>  
>  	return (total_pages * CONFIG_CMA_SIZE_PERCENTAGE / 100) << PAGE_SHIFT;
>  }
> -- 
> 2.26.2
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
