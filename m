Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261CDC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 09:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8WwW1kcTQMKCT1bepGg4RevxjVNWa3cc87k3zAQC30=; b=AolR59oRS9iHj7
	SAr22B8pHAxoncfc/0XXLkobgbiY+Al4b1fTWhGtvjZBjV1wkrJ4PddBbXyN+stBU2m+mzF/gRKdY
	X5bepvUxDobP1QgYvuOgCrubaAg2JQRgWUBRjFB3ftjq/Re0VXyQUUZZquo7X9FE+WQfzVk1aSI8u
	yHFsO9Hi8D+PiiHXTsILANobXyQJ9LZR79fANNznGO+HJUWI7XojGvhA4L2Ty8Lw6dYOL8WToMNrZ
	zsS5cuooEIvaX2Cb9dmX4wHD0DuCi3oJGW3Tb5FYZ6yKzH5JeqQE8JTbyr5urxwpHFr/flh04IZG3
	THU2nTV2ubTWS1EU2d0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJgm-008Uas-07;
	Mon, 15 Jan 2024 09:55:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJgj-008UXp-0V
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 09:55:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 43AEAB802C8;
	Mon, 15 Jan 2024 09:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6460AC433F1;
	Mon, 15 Jan 2024 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705312517;
	bh=Y0aXOS+b6gFxoHVGLnmvCujUW0jIxABtyiwWOpMnOy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uvOrwRcibUEOPd2gfHpwl68cNRhLAGmvLkmx3PXLjDOsB5f4Y/snIEUNpq+T3ctVu
	 /aHgT65BQiXO7wIGoXCaSSqAvd4/Hn1pWpnhnvsvWr6G80vkTcmUt8MeyAlKLQNMKa
	 C/RroNXYaoP34iFrd88FdhbO9AOpt0QrxAJSkod1JZ5iZU5EaXhLuEsEcN+xHanK8h
	 LzM58DvkhUylMOv6WWSjwlcmqMPaA1h48+LSHH6rY5J3fTHNuac+QSxkCJ0R3j4yIt
	 pxWn4SSzhTtf0i7ToQ5y4v1vVRt3JbDYV+1s3juWg4vxyZW9AlrRpWdGBqPeyqG6V7
	 umTEvzDbXCjsg==
Date: Mon, 15 Jan 2024 17:42:26 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: implement pgprot_nx
Message-ID: <ZaT+Ai+Lbzx1qBYr@xhacker>
References: <20231121160637.3856-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231121160637.3856-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_015525_350948_A3026196 
X-CRM114-Status: GOOD (  15.52  )
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

On Wed, Nov 22, 2023 at 12:06:37AM +0800, Jisheng Zhang wrote:
> commit cca98e9f8b5e ("mm: enforce that vmap can't map pages
> executable") enforces the W^X protection by not allowing remapping
> existing pages as executable. Add riscv bits so that riscv can benefit
> the same protection.

And this simple patch to enforce W^X protection is also missed ;)

Thanks in advance
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/pgtable.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 294044429e8e..4fc6ee5226fb 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -608,6 +608,12 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>  	return ptep_test_and_clear_young(vma, address, ptep);
>  }
>  
> +#define pgprot_nx pgprot_nx
> +static inline pgprot_t pgprot_nx(pgprot_t _prot)
> +{
> +	return __pgprot(pgprot_val(_prot) & ~_PAGE_EXEC);
> +}
> +
>  #define pgprot_noncached pgprot_noncached
>  static inline pgprot_t pgprot_noncached(pgprot_t _prot)
>  {
> -- 
> 2.42.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
