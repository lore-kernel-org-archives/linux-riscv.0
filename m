Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0537CC3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 08:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhzSwI7Xni5P38tafYup+YG/jVHSvlsm4fO67Vv/z2I=; b=nzDNWNDvTcbV4f
	tyCgdfjQY5iJfEsWJ3unIRUHMqrAZnXEF3asaKtRYkUYKmu4V5+Uv+AyFOKzbEfZpqiDmkj3CXZrK
	/N53+Vf8VPFmsCejP9GEZwQuXKPnNyO37wO02Etl0vzODwg/95tVpEI/N49NkBat7tYsPT8JCIgM9
	HxtMFVWSxfhHCyK6zfZ0xSunIIyXeWgfIC+bdG4hfxuf8bEHbGmtXLGxOk/MFsgiBwthfVZUKXzn8
	ISqcw0pxOPH1bXI+a4FTKxudxb2B0+ujr6IBDgIYnn1MyhTslBVuGMo5IUEylwda1ylVwZUt8/+3n
	gA96Fj922v9GyQycFqdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcp0-000EKl-0Q; Tue, 03 Jan 2023 08:38:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCckt-000CM1-SU
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 08:34:49 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pCckn-0004ze-Ue; Tue, 03 Jan 2023 09:34:37 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH RESEND 1/2] riscv: errata: fix T-Head dcache.cva encoding
Date: Tue, 03 Jan 2023 09:34:37 +0100
Message-ID: <2668919.mvXUDI8C0e@diego>
In-Reply-To: <20230103062610.69704-1-uwu@icenowy.me>
References: <20230103062610.69704-1-uwu@icenowy.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_003444_327656_08BC1961 
X-CRM114-Status: GOOD (  17.42  )
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
Cc: Sergey Matyukevich <sergey.matyukevich@syntacore.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Dienstag, 3. Januar 2023, 07:26:09 CET schrieb Icenowy Zheng:
> The dcache.cva encoding shown in the comments are wrong, it's for
> dcache.cval1 (which is restricted to L1) instead.
> 
> Fix this in the comment and in the hardcoded instruction.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Tested-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Original was on
https://lore.kernel.org/all/5894419.tdWV9SEqCh@phil/

> ---
> Included when resending:
> - Sergey's Tested-by tag.
> 
>  arch/riscv/include/asm/errata_list.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 4180312d2a70..605800bd390e 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -102,7 +102,7 @@ asm volatile(ALTERNATIVE(						\
>   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
>   *   0000001    01001      rs1       000      00000  0001011
>   * dcache.cva rs1 (clean, virtual address)
> - *   0000001    00100      rs1       000      00000  0001011
> + *   0000001    00101      rs1       000      00000  0001011
>   *
>   * dcache.cipa rs1 (clean then invalidate, physical address)
>   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> @@ -115,7 +115,7 @@ asm volatile(ALTERNATIVE(						\
>   *   0000000    11001     00000      000      00000  0001011
>   */
>  #define THEAD_inval_A0	".long 0x0265000b"
> -#define THEAD_clean_A0	".long 0x0245000b"
> +#define THEAD_clean_A0	".long 0x0255000b"
>  #define THEAD_flush_A0	".long 0x0275000b"
>  #define THEAD_SYNC_S	".long 0x0190000b"
>  
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
