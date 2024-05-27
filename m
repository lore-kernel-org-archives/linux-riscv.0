Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B62C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 12:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqfLzOSIKBBVTcgJFIkcSOfYp7581Ue5DaLuVWHcGws=; b=HkONKXCNm7rJpqtZK/61x5fzH9
	Q5TBF7YJ0wieZryz7dqw5P/c+3580JEZu8zKJVUpijOqlmNVMOXIm1yldh5mFvIFeab4blNWm/ZRg
	N1/ZjD58TmT+q40uRhGQ2xLB4l1Mz+AyQv+7NmsgiZgaffOQX3X359goMx+dkfkTNkkD7/WhgppNf
	7gLWo5r3pmTFeAmavU/5tJeuD8uWOWciKeWSdWtE0dq7a3YoIsPzt4sbCFUD+uAILeORsled8OdB6
	mR7c9SvGzkmJaFHHtuuwRzmtq1gzqb2FsyQsbk94AuOmh/2j8BHe2B11CUJod/L71vQ5Udh+AoGE0
	nf6N6Snw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZkt-0000000Evfi-2pdv;
	Mon, 27 May 2024 12:47:11 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZkr-0000000Evf7-1SOR
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 12:47:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 356CAE000A;
	Mon, 27 May 2024 12:47:05 +0000 (UTC)
Message-ID: <5f7e9b88-f70f-406e-9eb3-2619594ad4fd@ghiti.fr>
Date: Mon, 27 May 2024 14:47:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] riscv: drop the use of XIP_OFFSET in
 XIP_FIXUP_FLASH_OFFSET
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1715286093.git.namcao@linutronix.de>
 <a49044c3833e40546f35dd1f821a683e6f4dfc1f.1715286093.git.namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <a49044c3833e40546f35dd1f821a683e6f4dfc1f.1715286093.git.namcao@linutronix.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_054709_564514_4063C11F 
X-CRM114-Status: GOOD (  17.67  )
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


On 10/05/2024 08:28, Nam Cao wrote:
> XIP_OFFSET is the hard-coded offset of writable data section within the
> kernel.
>
> By hard-coding this value, the read-only section of the kernel (which is
> placed before the writable data section) is restricted in size.
>
> As a preparation to remove this hard-coded macro XIP_OFFSET entirely, stop
> using XIP_OFFSET in XIP_FIXUP_FLASH_OFFSET. Instead, use __data_loc and
> _sdata to do the same thing.
>
> While at it, also add a description for XIP_FIXUP_FLASH_OFFSET.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>   arch/riscv/include/asm/xip_fixup.h | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/xip_fixup.h b/arch/riscv/include/asm/xip_fixup.h
> index 9ed2cfae09e0..f3d56299bc22 100644
> --- a/arch/riscv/include/asm/xip_fixup.h
> +++ b/arch/riscv/include/asm/xip_fixup.h
> @@ -24,13 +24,21 @@
>   	sub \reg, \reg, t0
>   .endm
>   .macro XIP_FIXUP_FLASH_OFFSET reg
> +	/* In linker script, at the transition from read-only section to
> +	 * writable section, the VMA is increased while LMA remains the same.
> +	 * (See in linker script how _sdata, __data_loc and LOAD_OFFSET is
> +	 * changed)
> +	 *
> +	 * Consequently, early during boot before MMU is up, the generated code
> +	 * reads the "writable" section at wrong addresses, because VMA is used
> +	 * by compiler to generate code, but the data is located in Flash using
> +	 * LMA.
> +	 */
> +	la t0, _sdata
> +	sub \reg, \reg, t0
>   	la t0, __data_loc
> -	REG_L t1, _xip_phys_offset
> -	sub \reg, \reg, t1
>   	add \reg, \reg, t0
>   .endm
> -
> -_xip_phys_offset: .dword CONFIG_XIP_PHYS_ADDR + XIP_OFFSET
>   #else
>   .macro XIP_FIXUP_OFFSET reg
>   .endm


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
