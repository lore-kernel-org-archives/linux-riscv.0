Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1164AC83F2C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 14:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6S3fjXcolNTnNdJw6AG/FDmB+Xj6Dldw3JLShm8LjqQ=; b=QQx2u/qgwo/R9O
	YTu2GCMkJn57hlAJnXMUym8DKGTR3gLexXMVcGmBWs0SUhVV3DeUbq2XmQJHkhKPTSth5HuqWYbS4
	D+mIkW5+VLQ+UClkXPeEXPMLiYePcxFdOeIjQ2Uw/0VcRq1nSIhU2vMZm1yZm838+gFcCRDfxn5J/
	E/rwgxU3HYnHubXXo6JvkiXyYH39rgTAqxeJaCZtU1VzNR+/sYmxpZbdBAsidpvXRqI+5JR//UnTv
	3MaS3DfiO3fU2FMeyw0wKNNhjNWFwvhQpPkvTkrSWewY0EG+kSx5ZKlhcrCXaCXOYwoW3SEL3zIK/
	jT+pGEhzh7p8gH9GoMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdArL-004ITs-10;
	Mon, 04 Sep 2023 14:47:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdArI-004ITS-0H
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 14:47:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D542DB80E64;
	Mon,  4 Sep 2023 14:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B920C433C8;
	Mon,  4 Sep 2023 14:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693838836;
	bh=00vX/S/bZEFxcOzXRYU8XSPRx2QXSBBtaI9lexJnG8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rzISwFr28zXS9GvtLthacWON48kxuF1gVv0qUb8O9mRw+CPTXyQm+U7jSnVvgQSO/
	 g6XtOJFAx7LUOgzA6cHHyGtu6Azy9nGtmynBO3lq7bkThEHBsSDxgyw6BIKE1B8Ho5
	 mNIYF+tf7p9Uu2F6//TKq//qvhjL80NS79etcOBAQUXW8e4FIJXdK1Noy8RECblL0J
	 Oj0fMPf5y7lU8iAsAuBBjYC5MmhKytLgCySG7qXaaugOQCVeRbipSsKBADv2zolRsB
	 gKAct38ncmcG+/QZdyqBLSeGHoy0qH0d3GZ1H0qbHlRZ9fHj6qo8Pj0cgJT229bnIc
	 ZAgFEcxDJ5Vjw==
Date: Mon, 4 Sep 2023 22:35:23 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: alternative: remove alternative boundary symbols
 in vdso
Message-ID: <ZPXrKz1jhqz5g3nF@xhacker>
References: <20230902022510.818602-1-xiao.w.wang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230902022510.818602-1-xiao.w.wang@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_074720_282662_277AB97C 
X-CRM114-Status: GOOD (  14.89  )
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

On Sat, Sep 02, 2023 at 10:25:10AM +0800, Xiao Wang wrote:
> Instruction patching for vdso is based on elf header parsing to get the
> beginning and ending of .alternative section, the __alt_start and __alt_end
> symbols defined in vdso linker script are not used, so this patch removes
> them.

The same patch has been in mailist since July:

https://lore.kernel.org/linux-riscv/20230726173024.3684-2-jszhang@kernel.org/

Thanks
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>  arch/riscv/kernel/vdso/vdso.lds.S | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> index 82ce64900f3d..d43fd7c7dd11 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -42,9 +42,7 @@ SECTIONS
>  
>  	. = ALIGN(4);
>  	.alternative : {
> -		__alt_start = .;
>  		*(.alternative)
> -		__alt_end = .;
>  	}
>  
>  	.data		: {
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
