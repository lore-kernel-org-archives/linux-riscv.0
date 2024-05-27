Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635BBC25B7C
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 12:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3j8hrypWimGfQ3uv9pt3OIUmoBE0w/mpnt3vj/4ISA=; b=wkIxvOXY+whTln
	w65KwBGdrM0WOMrKrtfTj/Pk1vTmUYxVwhMa9sL4XNHdHtfCeoZoI9BblLCqRfBhAC7HwcU2tnEwT
	gI8mUTENfoaZtOp5HqyKBvI1ZtSO/Z7b9iIFXbObwdi80manjGsK3wKKNGWmofteSd4of5oxCdt/e
	SNjknLdH/SCnoC1lf73k7I1SyHk/JRpHqyNd4eW7QvNV77k5lI/aTxvU9D/1kUD0qYsVIfqBSCQuF
	Nsgi/Z22rtWxE+Q/YMkz/K3RM4bY4EqrfPTX69a43iW+QtuUo39VkGdKyhSBKg9y02ZhTmH8MOdmU
	CKG890usf1nEsz5KicXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZwC-0000000EytY-0maj;
	Mon, 27 May 2024 12:58:52 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZve-0000000EyQ6-1JKb
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 12:58:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C3D620008;
	Mon, 27 May 2024 12:58:15 +0000 (UTC)
Message-ID: <2e092f39-0716-4b73-9268-da9211a4b600@ghiti.fr>
Date: Mon, 27 May 2024 14:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] riscv: remove limit on the size of read-only section
 for XIP kernel
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <cover.1715286093.git.namcao@linutronix.de>
 <9eea4b61f7b6300def3b6582d8e465ef4207501e.1715286093.git.namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <9eea4b61f7b6300def3b6582d8e465ef4207501e.1715286093.git.namcao@linutronix.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_055818_687811_6F358A1A 
X-CRM114-Status: GOOD (  17.77  )
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
> placed before the writable data section) is restricted in size. This causes
> build failures if the kernel get too big (an example is in Closes:).

s/get/gets

I think you can use:

Closes: https://lore.kernel.org/oe-kbuild-all/202404211031.J6l2AfJk-lkp@intel.com/ [1]

And instead use:

s/an example is in Closes:/[1]


>
> Remove this limit.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404211031.J6l2AfJk-lkp@intel.com/
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>   arch/riscv/include/asm/pgtable.h    | 7 -------
>   arch/riscv/kernel/vmlinux-xip.lds.S | 4 ++--
>   2 files changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index fbf342f4afee..75f4a92ea5bb 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -104,13 +104,6 @@
>   
>   #endif
>   
> -#ifdef CONFIG_XIP_KERNEL
> -#define XIP_OFFSET		SZ_32M
> -#define XIP_OFFSET_MASK		(SZ_32M - 1)
> -#else
> -#define XIP_OFFSET		0
> -#endif
> -
>   #ifndef __ASSEMBLY__
>   
>   #include <asm/page.h>
> diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmlinux-xip.lds.S
> index 8c3daa1b0531..01f73f2ffecc 100644
> --- a/arch/riscv/kernel/vmlinux-xip.lds.S
> +++ b/arch/riscv/kernel/vmlinux-xip.lds.S
> @@ -65,10 +65,10 @@ SECTIONS
>    * From this point, stuff is considered writable and will be copied to RAM
>    */
>   	__data_loc = ALIGN(PAGE_SIZE);		/* location in file */
> -	. = KERNEL_LINK_ADDR + XIP_OFFSET;	/* location in memory */
> +	. = ALIGN(SZ_2M);			/* location in memory */


You can't use SZ_2M here since it corresponds to PMD_SIZE for rv64 but 
on rv32 (which is allowed to use xip kernels), it's 4MB. Use 
SECTION_ALIGN instead.


>   
>   #undef LOAD_OFFSET
> -#define LOAD_OFFSET (KERNEL_LINK_ADDR + XIP_OFFSET - (__data_loc & XIP_OFFSET_MASK))
> +#define LOAD_OFFSET (KERNEL_LINK_ADDR + _sdata - __data_loc)
>   
>   	_sdata = .;			/* Start of data section */
>   	_data = .;

When the above comment is fixed, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

And many thanks for this big cleanup.

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
