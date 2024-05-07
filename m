Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EFEC10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 05:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfLHZWbyk16d1VE4QuonshCa20gnsveDmeyHzFyH0bg=; b=YOi5+3zheFE2S+
	9Cw6NURODQ3wiVGeknk84EDHmwaUfYkk9lcLl0YCo/qm4KW5m5UTZL4rgooqwTP7QkUdWoXtDOByG
	ESYyqH2KSGkmG/sfUUON+gBYRW7Gcxge7Kh7FfzU2c32sRkQv9tVGhXj2qWON41MuImPUGUsPQMSA
	gjjXWjruWYkHvTyT7+pvmuLL+ZjrKwTPp4HMbZc7c8cMaGw3Q+gqWc8jWkV5MlSdNPZ8mMX9CCsVx
	nOJFeMiZq4mCuolpPSfopaxSybAeLn6dpGdtbfpAPfA+j+LYWruwEgqi035h0grIh0MLEMGw98GIf
	FSpOJEDJX+oIJSmBcWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4DO3-00000009hMT-18o9;
	Tue, 07 May 2024 05:29:11 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4DO0-00000009hKj-1euD
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 05:29:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10937FF804;
	Tue,  7 May 2024 05:28:58 +0000 (UTC)
Message-ID: <bfb82e87-94c0-4a23-b59d-bb57911224b5@ghiti.fr>
Date: Tue, 7 May 2024 07:28:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] riscv: set trap vector earlier
Content-Language: en-US
To: "yang.zhang" <gaoshanliukou@163.com>, alexghiti@rivosinc.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 "yang.zhang" <yang.zhang@hexintek.com>
References: <20240506022239.6817-1-gaoshanliukou@163.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240506022239.6817-1-gaoshanliukou@163.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_222908_601905_928256C0 
X-CRM114-Status: GOOD (  14.40  )
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

Hi Yang,

On 06/05/2024 04:22, yang.zhang wrote:
> From: "yang.zhang" <yang.zhang@hexintek.com>
>
> If trap earlier, trap vector doesn't yet set properly, current
> value maybe set by previous firmwire, typically it's the _start of kernel,
> it's confused and difficult to debuge, so set it earlier.


What about:

"The exception vector of the booting hart is not set before enabling the 
mmu and then still points to the value of the previous firmware, 
typically _start_kernel. That makes it hard to debug setup_vm() when bad 
things happen. So fix that by setting the exception vector earlier."


> ---
> v1 -> v2:
> As Alex commented, remove the patch for supporting hugesize kernek image
> Add the omissive logic of set trap vector earlier
>
> Signed-off-by: yang.zhang <yang.zhang@hexintek.com>
> ---
>   arch/riscv/kernel/head.S | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 4236a69c35cb..03dc440e643e 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -300,6 +300,9 @@ SYM_CODE_START(_start_kernel)
>   #else
>   	mv a0, a1
>   #endif /* CONFIG_BUILTIN_DTB */
> +	/* Set trap vector to spin forever to help debug */
> +	la a3, .Lsecondary_park
> +	csrw CSR_TVEC, a3
>   	call setup_vm
>   #ifdef CONFIG_MMU
>   	la a0, early_pg_dir

Note that this patch will allow to catch any exception happening in 
setup_vm() but as we reset stvec in relocate_enable_mmu. But that's ok, 
it will help catching weird bugs more easily :)

With the commit message fixed, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
