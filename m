Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E300C74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 03:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdyYT45yA4IAtcZ2PpbCiQtyO12139GjxtBOv3LW35o=; b=zmO89BXcLqgnY9
	VVfrdDKNDCxH24ATLTNNqW20emFlL9+fzuylQ+wHQ2vIP6P6gzGXAxxxhye/NpG+h6xSmAcasIrbd
	+3M0g6sxXejQZQwLDvtcMXrxeHqv5f+A232EJpfCdgGN4vR3Vdbd2UcQYaj1MW2r8l5OAZ3GptMa5
	zQwGUuGI6UQBPutP9sBw+yI1v/YNyoyHiLW2TcFKJLDpm+d4LhhLPtQYgyEI7kQe56xXcW5KQ/CVU
	8GwZMorp5NUhWW1znWGOVe2EEL4pYqcDGS/pcNNfbd2Nze7oSRNA2onmyeohd+7+og1UsXwnuyqYX
	OYUha5Cf+IaodplPeCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phMTk-00GSHu-1T;
	Wed, 29 Mar 2023 03:28:04 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phMTh-00GSFg-0e
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 03:28:02 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PmX735qqJz4whh;
	Wed, 29 Mar 2023 14:27:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680060467;
	bh=NWEC9L1N6Gkm8hPWtsZhECzqXf6jCt48G2Nqg5hBXvE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SAWjgkM8buDl+QGSlnMNlFfgO8XDbaheTTxegHJeT8I9RxjC69eo0Kqm5o7HhOfVq
	 pdBn9kfpreHiPsYCcnDs7VUFT5T5A83HBfyuowLBZ5r3UmbbZmIkUBTXHb8C/zYUTl
	 hEO+2u3JYAO36dtGtL+VJUYzZ9mK+Xi5sEx0ybcukCmpGSIjRCWOZe4a8fkVYXmck4
	 bDLJ9L25893BDL64x2oUJStfo7XSuIQ5SU0FzQTwRLDJ2/IgX3oTpc0qH07mLM08Tf
	 uybEEoCv8kc9mlfe/94vD2n7j+eArEJqBCLtujEMR6lxKa+vMrtKuif6ZsQgKmuXdM
	 3m1++1phqhrYg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tsbogend@alpha.franken.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 robh+dt@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 robin.murphy@arm.com, linux-riscv@lists.infradead.org, Jiaxun Yang
 <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v3 4/4] of: address: Always use dma_default_coherent for
 default coherency
In-Reply-To: <20230321110813.26808-5-jiaxun.yang@flygoat.com>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
 <20230321110813.26808-5-jiaxun.yang@flygoat.com>
Date: Wed, 29 Mar 2023 14:27:39 +1100
Message-ID: <877cv0ck44.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_202801_449253_73076D07 
X-CRM114-Status: GOOD (  11.78  )
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

Jiaxun Yang <jiaxun.yang@flygoat.com> writes:
> As for now all arches have dma_default_coherent reflecting default
> DMA coherency for of devices, so there is no need to have a standalone
> config option.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v3: Squash setting ARCH_DMA_DEFAULT_COHERENT into this patch.
> ---
>  arch/powerpc/Kconfig |  2 +-
>  arch/riscv/Kconfig   |  2 +-
>  drivers/of/Kconfig   |  4 ----
>  drivers/of/address.c | 10 +---------
>  4 files changed, 3 insertions(+), 15 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 57f5d2f53d06..824e00a1277b 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -113,6 +113,7 @@ config PPC
>  	#
>  	select ARCH_32BIT_OFF_T if PPC32
>  	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
> +	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
>  	select ARCH_ENABLE_MEMORY_HOTPLUG
>  	select ARCH_ENABLE_MEMORY_HOTREMOVE
>  	select ARCH_HAS_COPY_MC			if PPC64
> @@ -273,7 +274,6 @@ config PPC
>  	select NEED_PER_CPU_PAGE_FIRST_CHUNK	if PPC64
>  	select NEED_SG_DMA_LENGTH
>  	select OF
> -	select OF_DMA_DEFAULT_COHERENT		if !NOT_COHERENT_CACHE
>  	select OF_EARLY_FLATTREE
>  	select OLD_SIGACTION			if PPC32
>  	select OLD_SIGSUSPEND

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
