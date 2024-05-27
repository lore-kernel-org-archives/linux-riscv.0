Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88827C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 12:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hf8q8Fy/Q3cVCJvYBdlEJiuT1L1ktyxi7WMFgJ5WrX0=; b=Ka+iPbStTLyMT7aXUcGJYe5hIk
	hQcYNbiojRlI85WP1zOxsSFc90H9ASd6Ew5MkeDHhKU7D1cu7uIkLfTLK1VzNHwpsJuohJrjCnAza
	45+uKIfYqcGCNVThE5wIwIRnBbL6wRyBod87g3uSLWCs7VwnRQrBU8WDb79+KybmY6poCVl5USJJZ
	uizgcECrV5CmiMYI6ASr3I9HePzzy6xDM38rGTnxoAVEk/JJjnwW0Fohw6mq837Su/ZlHY37KhdQ1
	FMqnlkn4+nIPWbRFONr8WcB/IQ6oZ+NG8tsu9CnGYrnZroLpHg73EjYaOI0Lp3iYaHeXmGs9u/Z1b
	WB2Rir/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZng-0000000Ew3h-3sba;
	Mon, 27 May 2024 12:50:04 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZnd-0000000Ew0C-2U4L
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 12:50:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EE121C000C;
	Mon, 27 May 2024 12:49:57 +0000 (UTC)
Message-ID: <187d7992-e2a7-446c-9f53-d0e7bf6a5843@ghiti.fr>
Date: Mon, 27 May 2024 14:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] riscv: drop the use of XIP_OFFSET in
 kernel_mapping_va_to_pa()
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1715286093.git.namcao@linutronix.de>
 <5439a181cdd7ba185d55457200ddda2d2efa5eb1.1715286093.git.namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <5439a181cdd7ba185d55457200ddda2d2efa5eb1.1715286093.git.namcao@linutronix.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_055001_905959_0709CE61 
X-CRM114-Status: GOOD (  16.16  )
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
> As a preparation to remove this hard-coded macro XIP_OFFSET entirely,
> remove the use of XIP_OFFSET in kernel_mapping_va_to_pa(). The macro
> XIP_OFFSET is used in this case to check if the virtual address is mapped
> to Flash or to RAM. The same check can be done with kernel_map.xiprom_sz.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>   arch/riscv/include/asm/page.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 14d0de928f9b..bcd77df15835 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -159,7 +159,7 @@ phys_addr_t linear_mapping_va_to_pa(unsigned long x);
>   #ifdef CONFIG_XIP_KERNEL
>   #define kernel_mapping_va_to_pa(y) ({						\
>   	unsigned long _y = (unsigned long)(y);					\
> -	(_y < kernel_map.virt_addr + XIP_OFFSET) ?				\
> +	(_y < kernel_map.virt_addr + kernel_map.xiprom_sz) ?			\
>   		(_y - kernel_map.va_kernel_xip_pa_offset) :			\
>   		(_y - kernel_map.va_kernel_data_pa_offset);			\
>   	})


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
