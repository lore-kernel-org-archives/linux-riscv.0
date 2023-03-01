Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1374BC64EC7
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 13:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXnnCKtUfvch5etgDUlX3LKE0wI1l3klOnabpBgaEfY=; b=rUpGUDj6fzVLSF
	w1jqrCMnn7TrLpcqFgEipcVjNWsVHCKtiBg3sCSicg+UHbuAcG3LBEzVEnhIbkiRPYNBSBHtGpQPS
	pFY9fzimSdh0RRlm2LZ8xtMui+QsyURnRTVPum26IVGQkddCxzSgK0fWksUOqqbhRA3R+MBm6z83y
	JbChOj+V/qciTPvomMBWUFZj38ZdqOyThK4Ar7y6wEFaWdYtsJoe11NobEv1df4jsCYOtZJiwGOlR
	W4evqL+u5VCm7fWOkg74J/X5RmWBNpt90Nii3jc9Nti442PMUHBUsowTtwnkitYK9mmakhYkvLKhK
	1eGg9bz7BHSJwErELJMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXMBx-00GIzx-2V; Wed, 01 Mar 2023 13:08:21 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXM7D-00GC9E-At
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 13:03:29 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4AF6C67373; Wed,  1 Mar 2023 14:03:16 +0100 (CET)
Date: Wed, 1 Mar 2023 14:03:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, tsbogend@alpha.franken.de,
	mpe@ellerman.id.au, paul.walmsley@sifive.com, palmer@dabbelt.com,
	robh+dt@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/5] dma-mapping: Provide a fallback
 dma_default_coherent
Message-ID: <20230301130315.GA467@lst.de>
References: <20230223113644.23356-1-jiaxun.yang@flygoat.com> <20230223113644.23356-3-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230223113644.23356-3-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_050327_584295_F239A79C 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 23, 2023 at 11:36:41AM +0000, Jiaxun Yang wrote:
> dma_default_coherent was decleared unconditionally at kernel/dma/mapping.c
> but only decleared when any of non-coherent options is enabled in dma-map-ops.h.

Overly lone line here.

>  }
>  #else
> +#define dma_default_coherent true
>  static inline bool dev_is_dma_coherent(struct device *dev)

Please keep an empty line before the function declaration.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
