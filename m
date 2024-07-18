Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B88EC3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 15:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hisOSkZizqQwR7NzAc2+YR3v/JYdKcIlXJPjFObMLyI=; b=LT/hx4ZZLptdzW
	+IcwB2nz0faTK7WSuqLSP/b7EfcRjxaU0eTaz5pizYRd/GXmjrYeCGhQjwkfOQHFAHjaYe44upOpS
	44WSkxJTIuulMMTpXauuNt1yOdRiqKYi/yUDvqMmsWJlPeIqY2Hmh938LE2ZZZBOenveWbaoJpmUA
	WH+Zzb5bjoKgz+GGd38C85ftUF9+7srriJzkMoO4LXSeAIJx/Iqw6NHUkrZv9fZmF2m3JTV1ORBvU
	9ms5DuK1Gj/yM/xhg/4oIZlcOCE8BK16Vhz0rWIfArIQTWXjw5+Ny3HUnBo+UFbnn5KOGbJax6+JA
	U+hSmOEnyyPqdcwIp/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUStE-0000000HQLI-05ZA;
	Thu, 18 Jul 2024 15:17:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUSs9-0000000HQC8-18Zm
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 15:17:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0978ECE193D;
	Thu, 18 Jul 2024 15:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FDDC116B1;
	Thu, 18 Jul 2024 15:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721315802;
	bh=0QoJA0Spc+jC74UG1c1qWReZYmYMt2MXKFhWpQa939k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dc/I55lmjgOQsrItwp8sanHREmCqfZgxWh/59dbWVB4DY0twINu+1HANiBTjVMhi+
	 696wldQY5tx2LxuOsgCFyO+thRcpUGU5R5xOjFPAkqCvL4k+9AM6KbTui28lLRSVpa
	 ddDdVyVEP6u9fnA8E09/0dIL5vZRRRFhzc8Tkj6iQ4oTVO8fhYvv4XkDmiMl6RCWtM
	 D3z28DC4bp8v9LoJpDtcWV1QMweDgV4/wALyy0Zh/mv1r/9gIREg2cTpc2rzjYkMoK
	 3+YIFBmZuniWWIDRkxc4ErjfBoNBtvc971MQ0dlDWj38zBZzCwhdVVK4Z7E4GqXWOk
	 M5eXQT+GfDJKA==
Date: Thu, 18 Jul 2024 17:16:37 +0200
From: Matthias Brugger <matthias.bgg@kernel.org>
To: Daniel Maslowski <cyrevolt@googlemail.com>
Cc: linux-riscv@lists.infradead.org,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Daniel Maslowski <cyrevolt@gmail.com>
Subject: Re: [PATCH v2] riscv/purgatory: align riscv_kernel_entry
Message-ID: <Zpkx1X9BFnEFId2z@ziggy.stardust>
References: <20240716204047.7649-1-cyrevolt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240716204047.7649-1-cyrevolt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_081645_503811_BECE8230 
X-CRM114-Status: GOOD (  16.71  )
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

On Tue, Jul 16, 2024 at 10:40:47PM +0200, Daniel Maslowski wrote:
> When alignment handling is delegated to the kernel, everything must be
> word-aligned in purgatory, since the trap handler is then set to the
> kexec one. Without the alignment, hitting the exception would
> ultimately crash. On other occasions, the kernel's handler would take
> care of exceptions.
> This has been tested on a JH7110 SoC with oreboot and its SBI delegating
> unaligned access exceptions and the kernel configured to handle them.
> 
> Fixes: 736e30af583fb6e0e2b8211b894ff99dea0f1ee7
Should be:

Fixes: 736e30af583fb ("RISC-V: Add purgatory")

Regards,
Matthias

> Signed-off-by: Daniel Maslowski <cyrevolt@gmail.com>
> ---
>  arch/riscv/purgatory/entry.S | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/purgatory/entry.S b/arch/riscv/purgatory/entry.S
> index 5bcf3af903da..0e6ca6d5ae4b 100644
> --- a/arch/riscv/purgatory/entry.S
> +++ b/arch/riscv/purgatory/entry.S
> @@ -7,6 +7,7 @@
>   * Author: Li Zhengyu (lizhengyu3@huawei.com)
>   *
>   */
> +#include <asm/asm.h>
>  #include <linux/linkage.h>
>  
>  .text
> @@ -34,6 +35,7 @@ SYM_CODE_END(purgatory_start)
>  
>  .data
>  
> +.align LGREG
>  SYM_DATA(riscv_kernel_entry, .quad 0)
>  
>  .end
> -- 
> 2.45.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
