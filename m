Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75416C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 12:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+A9X/sgUXBYnxHpUiCzDC3AZ9E5/H7/mXUZodWgufU=; b=dgWxuSief2j3MY1+Db561kANzP
	KJlLe2Y0sbYgDbJH8ENNfLi0fZ6OeWA+qSBLNoQwQjCk4PhrJMKV7PQZS4ume+2gK9drzZt/Aw4Y+
	zQO8jmENz8U4h1R8vGvT+vRVsVh/AAy9Y3y47FIGANzCbur2nqSRxPfol4VBNnlFfTE7PoNk/2yQf
	I5neO5WLj029GZSbWlwpZjCxdIamZ1zjBuJKrENmtFEbKAh2BX9qR8HRfrciasrxj/6qdPGYpCCXg
	oNkSSrZM82g3Oy5bALyC2vm/GCIT2D4ccAFO9d0nJ//gHC7lBvG/AF6TKGraslRXfugYcVoTNKWzc
	bk1MkuBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZbN-0000000EuBP-3pxE;
	Mon, 27 May 2024 12:37:21 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZbL-0000000Eu9p-1ERq
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 12:37:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B34BAE0005;
	Mon, 27 May 2024 12:37:13 +0000 (UTC)
Message-ID: <0030930d-dbee-4a65-8ab9-5c96bd2aeeea@ghiti.fr>
Date: Mon, 27 May 2024 14:37:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] riscv: drop the use of XIP_OFFSET in XIP_FIXUP_OFFSET
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1715286093.git.namcao@linutronix.de>
 <e18d9e8e3540098617d8f5b14859158a63b78594.1715286093.git.namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <e18d9e8e3540098617d8f5b14859158a63b78594.1715286093.git.namcao@linutronix.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_053719_498902_122DDFF4 
X-CRM114-Status: GOOD (  18.39  )
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
> using XIP_OFFSET in XIP_FIXUP_OFFSET. Instead, use CONFIG_PHYS_RAM_BASE and
> _sdata to do the same thing.
>
> While at it, also add a description for XIP_FIXUP_OFFSET.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>   arch/riscv/include/asm/xip_fixup.h | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/xip_fixup.h b/arch/riscv/include/asm/xip_fixup.h
> index b65bf6306f69..9ed2cfae09e0 100644
> --- a/arch/riscv/include/asm/xip_fixup.h
> +++ b/arch/riscv/include/asm/xip_fixup.h
> @@ -9,8 +9,19 @@
>   
>   #ifdef CONFIG_XIP_KERNEL
>   .macro XIP_FIXUP_OFFSET reg
> -        REG_L t0, _xip_fixup
> +	/* Fix-up address in Flash into address in RAM early during boot before
> +	 * MMU is up. Because generated code "thinks" data is in Flash, but it
> +	 * is actually in RAM (actually data is also in Flash, but Flash is
> +	 * read-only, thus we need to use the data residing in RAM).
> +	 *
> +	 * The start of data in Flash is _sdata and the start of data in RAM is
> +	 * CONFIG_PHYS_RAM_BASE. So this fix-up essentially does this:
> +	 * reg += CONFIG_PHYS_RAM_BASE - _start
> +	 */
> +	li t0, CONFIG_PHYS_RAM_BASE
>           add \reg, \reg, t0
> +	la t0, _sdata
> +	sub \reg, \reg, t0
>   .endm
>   .macro XIP_FIXUP_FLASH_OFFSET reg
>   	la t0, __data_loc
> @@ -19,7 +30,6 @@
>   	add \reg, \reg, t0
>   .endm
>   
> -_xip_fixup: .dword CONFIG_PHYS_RAM_BASE - CONFIG_XIP_PHYS_ADDR - XIP_OFFSET
>   _xip_phys_offset: .dword CONFIG_XIP_PHYS_ADDR + XIP_OFFSET
>   #else
>   .macro XIP_FIXUP_OFFSET reg


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
