Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64168C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 12:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38JuwUys7whXl4A9LrIWcwlk3wDiVDBgxy+PkmCa14w=; b=28QdwOQ5F3JR7D
	nH/hdzsdIo9d+szS7p9SUxOqaUNd5aAqGHD2+GWI3oZGg25cNMTJ/nWjd3wVhehiwbBT+wDvGJeYs
	n2PQCKwnVWGoo0Ed6TyQZ91vPx8U8hIjVtHIGk8zwB+y1dzjYr60TbVkH5knYJzDJHPdfQXtiqer7
	vxU3LIYuglxPngNsMct5AZoA3MhhgKa7G+V0TEj3z5vFuFiNcnay2nTFA3QzCTepIzg20rd4cy9IE
	nzLwXVN359FuhXwaVzYL/hWz3l72+Mkdd9MXUf/TUQTOHPMKR5lxSRhGe8pHixn45igJpiNEbDxxd
	pPokKcbPDbpJf9NeDTmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2roL-0000000GNwU-3rey;
	Fri, 03 May 2024 12:14:45 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2roJ-0000000GNuj-1kNG
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 12:14:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CEA420012;
	Fri,  3 May 2024 12:14:35 +0000 (UTC)
Message-ID: <20798b97-fa19-46fa-abce-54f7931c9210@ghiti.fr>
Date: Fri, 3 May 2024 14:14:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: uaccess: Relax the threshold for fast path
Content-Language: en-US
To: Xiao Wang <xiao.w.wang@intel.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: jerry.shih@sifive.com, nick.knight@sifive.com, ajones@ventanamicro.com,
 bjorn@rivosinc.com, andy.chiu@sifive.com, viro@zeniv.linux.org.uk,
 cleger@rivosinc.com, alexghiti@rivosinc.com, haicheng.li@intel.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240313091929.4029960-1-xiao.w.wang@intel.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240313091929.4029960-1-xiao.w.wang@intel.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_051443_822052_6B9478C2 
X-CRM114-Status: GOOD (  12.58  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Xiao,

On 13/03/2024 10:19, Xiao Wang wrote:
> The bytes copy for unaligned head would cover at most SZREG-1 bytes, so
> it's better to set the threshold as >= (SZREG-1 + word_copy stride size)
> which equals to 9*SZREG-1.
>
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>   arch/riscv/lib/uaccess.S | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index bc22c078aba8..2e665f8f8fcc 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -44,7 +44,7 @@ SYM_FUNC_START(fallback_scalar_usercopy)
>   	 * Use byte copy only if too small.
>   	 * SZREG holds 4 for RV32 and 8 for RV64
>   	 */
> -	li	a3, 9*SZREG /* size must be larger than size in word_copy */
> +	li	a3, 9*SZREG-1 /* size must >= (word_copy stride + SZREG-1) */
>   	bltu	a2, a3, .Lbyte_copy_tail
>   
>   	/*


This looks good to me:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
