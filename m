Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF33C25B79
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 06:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2x8289lD/JP3jLxnfQqKZrSZp31F30xgJZUcF0EH9m8=; b=P/SqvywXLBF9xN
	GtNfGlZameRIfGodqw1imBvzIiInvrnCHUMoOOG8wsZZpbcyLkBTVuXxq30RC3c5VrzxSJYeB2Nwi
	1OILhLDGveVnUzQ+JExWDRZcRHILb2Rlx+DJJDiBJYt52Qox2kAnmjYMxkQ1xZSlD2aNXHcydfWp5
	TGRc1z25vVhHMBc4t/SH6y/JOjfJts2u+BpOXAwdlfIix/9MiG/RF+2IQZ3Dfh7+QdP0I68UHrFTw
	3wuRwCFiTs/pJJYZPRosvxViGQo/3PwQYHeNaJ4OD5BMO9bSUbIze0podViWeQGsBKVKWXtH9fhCj
	VOwFgPTOXn/AzMluuLKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUFF-0000000Dz9E-3YHU;
	Mon, 27 May 2024 06:54:09 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUFC-0000000Dz7k-0lSG
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 06:54:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D31F1FF80B;
	Mon, 27 May 2024 06:53:56 +0000 (UTC)
Message-ID: <a00942ea-d208-475d-b595-922d8432ddc6@ghiti.fr>
Date: Mon, 27 May 2024 08:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: enable HAVE_ARCH_HUGE_VMAP for XIP kernel
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20240526110104.470429-1-namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240526110104.470429-1-namcao@linutronix.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_235406_401707_E5B22210 
X-CRM114-Status: GOOD (  14.42  )
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

Hi Nam,

On 26/05/2024 13:01, Nam Cao wrote:
> HAVE_ARCH_HUGE_VMAP also works on XIP kernel, so remove its dependency on
> !XIP_KERNEL.
>
> This also fixes a boot problem for XIP kernel introduced by the commit in
> "Fixes:". This commit used huge page mapping for vmemmap, but huge page
> vmap was not enabled for XIP kernel.
>
> Fixes: ff172d4818ad ("riscv: Use hugepage mappings for vmemmap")
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: <stable@vger.kernel.org>
> ---
> This patch replaces:
> https://patchwork.kernel.org/project/linux-riscv/patch/20240508173116.2866192-1-namcao@linutronix.de/
>
>   arch/riscv/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b94176e25be1..0525ee2d63c7 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -106,7 +106,7 @@ config RISCV
>   	select HAS_IOPORT if MMU
>   	select HAVE_ARCH_AUDITSYSCALL
>   	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
> -	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT && !XIP_KERNEL
> +	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
>   	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
>   	select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
>   	select HAVE_ARCH_KASAN if MMU && 64BIT


Great, thanks!

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
