Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37B3C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 03:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hk36o/sA7ALftGgOSwWfzpnXk+5xa+ww0acZqqsGwGc=; b=z9Cn5pU7HAQtVZ
	Hw7sIAbs8cZ3xFNWwHeeqC0VVLLJ/AqlS7F6Da64TT6ub2B6rTN1n29V3GcsjTMLCTXh6fk3NxiL+
	XDswa065cCGHYoAZU4JDHDr0rPRDov3z0uNzFqKOieDgSnvhlqzjD7jUKp3zyS/eVV18HE9uxvMFR
	KvWseKK847uhry8sK8w2tbUvwsNrRoVyT0AFlkh7xEx9up+SsBTtCFmUdoyCN0d5hGTmZszNo3A2O
	xH92zXX1gA6sejWqU3ODDsBQfeEEIEvD77lb/K8dEYcIQ6zq38mfOUhfagxbA4ba1T1DlzzGYdeDB
	qeR6cYf7hE34tzYae3vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzVEj-005Mlf-0X; Fri, 10 Jun 2022 03:23:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzVE9-005MUX-G4
	for linux-riscv@bombadil.infradead.org; Fri, 10 Jun 2022 03:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ChyT0oyx9WdA4yK5yPyg83KmH+2gh/M8HpFx0h62jOY=; b=oVy9GtbWUKOXfXSkGDcg0oxC9L
	5/sh+JxCGyID3b3Fg0UcmqjNYabidBU4P7h/v/0CtKVJFKKxTdroqL4VmZ2MaK2WZ4wqwUgVe6Lv/
	YfiHMVc9KqE78yL5V+vmJ20pa7i0kP7AkjgN9DjTA26YzEPCIZNrxPQYkPcTu6g38UjfC6ffIO02e
	TOe0LhdmHSttoRmWxhVJEHAnLJTKIMb+xMuN37tRpHNtD1w/RX4SBBg0fZk6SZaAZigRGHXnLh5uf
	aPEm78CbXLp3fa+MeBoM2Qn98OLfg1tnBUTa45BhcqhkzEXXHBwTpFOI5WVFCwPe/aT+UylXUefc/
	A3iMISyQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzVE5-00E6a4-8q; Fri, 10 Jun 2022 03:22:21 +0000
Message-ID: <57f53f61-f79f-5520-9de1-d410e6c704c9@infradead.org>
Date: Thu, 9 Jun 2022 20:22:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/3] riscv: Implement Zicbom-based cache management
 operations
Content-Language: en-US
To: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, cmuellner@linux.com,
 philipp.tomsich@vrull.eu, hch@lst.de, samuel@sholland.org,
 atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 drew@beagleboard.org, Atish Patra <atish.patra@wdc.com>
References: <20220610004308.1903626-1-heiko@sntech.de>
 <20220610004308.1903626-3-heiko@sntech.de>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220610004308.1903626-3-heiko@sntech.de>
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



On 6/9/22 17:43, Heiko Stuebner wrote:
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 32ffef9f6e5b..384d0c15f2b6 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -376,6 +376,21 @@ config RISCV_ISA_SVPBMT
>  
>  	   If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_ZICBOM
> +	bool "Zicbom extension support for non-coherent dma operation"
> +	select ARCH_HAS_DMA_PREP_COHERENT
> +	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> +	select ARCH_HAS_SYNC_DMA_FOR_CPU
> +	select ARCH_HAS_SETUP_DMA_OPS
> +	select DMA_DIRECT_REMAP
> +	select RISCV_ALTERNATIVE

Since RISCV_ALTERNATIVE depends on !XIP_KERNEL and since 'select' does not
follow any dependency chains, this config also needs to depend on
!XIP_KERNEL.

> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the ZICBOM extension
> +	   (Cache Block Management Operations) and enable its usage.
> +
> +	   If you don't know what to do here, say Y.

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
