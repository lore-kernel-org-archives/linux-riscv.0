Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AEBC3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 11:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yF+F2nqVAolTGeGjXv6tucAxSawfCAbL93N/S7CRUAQ=; b=xou9dPg7eGQm+I
	qbRX92JzVaraMewUNCfhot7Triz5gpRAm4X1VzKsitNpwXYO8eeTjaFVlJEHWIeltlH772n0IMoGY
	AdnZl3jx/udEWg58ElEWHPHUaiuNQx9YMXY8VW7xHe30FBWC2194f5MOqabIalJyi7+JGpu7LBItP
	6xr+b4MpVEWMOn7C2+MwhZ4K/SIsUwnTD9O3aQDHJSpFEHeVWolszplBLZ/acue5Ja36swsWnfNrF
	DElQyzQ9h26eLyN6VAwqa85jmkAYQYjNduuFq+M0f9PY/5AknQ16va2IJipJcjJuvRbisckvZp8kp
	iQiy4GGOyDxz4V1sUJOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTK9u-00000006uI5-1nZe;
	Mon, 15 Jul 2024 11:46:22 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTK9r-00000006uGE-18E4
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jul 2024 11:46:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EC8C240005;
	Mon, 15 Jul 2024 11:46:14 +0000 (UTC)
Message-ID: <12cbeb6e-7f26-4104-bd95-9f65ce7bd635@ghiti.fr>
Date: Mon, 15 Jul 2024 13:46:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/purgatory: align riscv_kernel_entry
Content-Language: en-US
To: Daniel Maslowski <cyrevolt@googlemail.com>,
 linux-riscv@lists.infradead.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Daniel Maslowski <cyrevolt@gmail.com>
References: <20240709012606.748596-1-cyrevolt@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240709012606.748596-1-cyrevolt@gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_044619_471596_70CBEECC 
X-CRM114-Status: GOOD (  13.53  )
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

Hi Daniel,

On 09/07/2024 03:26, Daniel Maslowski wrote:
> When alignment handling is delegated to the kernel, everything must be
> word-aligned in purgatory, since the trap handler is then set to the
> kexec one. Without the alignment, hitting the exception would
> ultimately crash. On other occasions, the kernel's handler would take
> care of exceptions.
> This has been tested with oreboot and its SBI delegating unaligned
> access exceptions and the kernel configured to handle them.
>
> Signed-off-by: Daniel Maslowski <cyrevolt@gmail.com>
> ---
>   arch/riscv/purgatory/entry.S | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/purgatory/entry.S b/arch/riscv/purgatory/entry.S
> index 5bcf3af903da..29121650a941 100644
> --- a/arch/riscv/purgatory/entry.S
> +++ b/arch/riscv/purgatory/entry.S
> @@ -34,6 +34,7 @@ SYM_CODE_END(purgatory_start)
>   
>   .data
>   
> +.align 4


IIRC, .align on riscv takes a power of two as argument, which means you 
align riscv_kernel_entry symbol to 16B here, any reason for this 
alignment? I guess you want 4B on rv32 and 8B on rv64 right? In that 
case, the best here would be to use LGREG 
https://elixir.bootlin.com/linux/latest/source/arch/riscv/include/asm/asm.h#L29

Thanks,

Alex


>   SYM_DATA(riscv_kernel_entry, .quad 0)
>   
>   .end

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
