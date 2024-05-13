Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FCEC25B10
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 14:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Jk6tcLZe5l3z+aXUG0MzqC2vi2wZ8EQzX+iLvNhPQA=; b=3v5L6LkhEhW0kO
	HSHlpKLL+JO7tvQNbqXKJFAyCQIpx7iEsPKuKIg5s3vnceMk9GXRCHO8smBTLVVQeK8xVye2rk4Br
	BJUsoISi1AW0zMzCWqqVqjDjA2M8HDIcNKmVaT+paycXIf6reNZsPCdRTdz5hodcAQWK10wfGc6Xc
	TXvZu7X6LCBdnrLgEoBaXgkowNatwSC39zCckj1zBqrBYKP2DqLjDp44iBkAUhffd9ujreva+IZEE
	vOYGrGMP8PDwSBAxtLCd+z6S/r7+zQRM4JtHRpUUalhOPjCPiIJYU0Vaqdl02BU+rJdDi8MRwE1HZ
	DyMSDH7HRQFgPtI7pcbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6X7B-0000000DGGP-3vT2;
	Mon, 13 May 2024 14:57:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6X79-0000000DGEu-04OF
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 14:57:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 32A3DCE0EBB;
	Mon, 13 May 2024 14:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E950DC113CC;
	Mon, 13 May 2024 14:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715612231;
	bh=0w9mbGT1UZZt1dOpgC8NPTR0pigL8NKPJ4Gx+UMc4No=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nlfm238fMGiVIDMNGnEKc97gNmE29hdsLp7YKC9Wpqq8IWVhjJOyzeE4d72H+4zii
	 8TMHr1INhhSxLq7XjhdouQqKS31hGdQMfWd6fOJ4zfJFAcgD0xMuX2jnSuWxJNA20x
	 t5G1Z194+qKS2gfSXhW/tHGhzSw/j45xXTtOKObCug+qUO0V1fditIlV7aHLJVd2qm
	 ZvkFm5erZ9XOw3zu/ucAuBs5LWwSL4FN4vIS4vWmwyNNZ6j3slga4IbqfjW5ULH7Hg
	 SNwPM57X0TwGJ7OgpyhhJQxHQ7CXyCcSZu5CPq97FNK6BPg7z5W2gfmLIojzFZM+a0
	 JEcbmHifAhrGw==
Date: Mon, 13 May 2024 09:57:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v4] of: property: Add fw_devlink support for
 interrupt-map property
Message-ID: <171561222690.2595290.16864995832552950240.robh@kernel.org>
References: <20240509120820.1430587-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240509120820.1430587-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_075719_258517_0DBCEC16 
X-CRM114-Status: GOOD (  13.85  )
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Thu, 09 May 2024 17:38:20 +0530, Anup Patel wrote:
> Some of the PCI host controllers (such as generic PCI host controller)
> use "interrupt-map" DT property to describe the mapping between PCI
> endpoints and PCI interrupt pins. This is the only case where the
> interrupts are not described in DT.
> 
> Currently, there is no fw_devlink created based on "interrupt-map"
> DT property so interrupt controller is not guaranteed to be probed
> before the PCI host controller. This affects every platform where
> both PCI host controller and interrupt controllers are probed as
> regular platform devices.
> 
> This creates fw_devlink between consumers (PCI host controller) and
> supplier (interrupt controller) based on "interrupt-map" DT property.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Saravana Kannan <saravanak@google.com>
> ---
> Changes since v3:
> - Added a comment about of_irq_parse_raw()
> - Removed redundant NULL assignments to sup_args.np
> Changes since v2:
> - No need for a loop to find #interrupt-cells property value
> - Fix node de-reference leak when index is greater than number
>   of entries in interrupt-map property
> Changes since v1:
> - Updated commit description based on Rob's suggestion
> - Use of_irq_parse_raw() for parsing interrupt-map DT property
> ---
>  drivers/of/property.c | 52 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
