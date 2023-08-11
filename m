Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8FCC001DB
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 11:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOv+DZvORceXVwRWFvJsfiTwUMQD0bmBzHKr3qT68b8=; b=XG7gYlcClRqEb8
	DYETrc0SkkulE68c130OzZHZKgOlRPnczFOfzbdl8b6B3moFB/OcJnJgte3/Kq3gIPNRco0VJoFzN
	Kweg+jnrpgo7zv52/5fsfoPSx9fy1yTStWcDDEtedHVbMgfZUU8Y1F/iFXUUFl5d8aVRIwM7HeNX5
	yNeUHhsoLnkuaUrj4GTmnT/YWFLeLHqomRq8FUv4pIG1G/65dnUUEJUTgY4Myvdf32mQaEZ6pCN68
	Y1yDUJz8N9Jm4W/WUFhE77Zy+QQapSJ45qu43bbBSEeVyvvF/tfpFyvL8IHQGxFZJ3tT5Ux8yAjCW
	Qh8gMOv6AwrOy66WNnGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUQUM-00ATfo-07;
	Fri, 11 Aug 2023 11:39:30 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUQUI-00ATeW-26
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 11:39:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 403C160002;
	Fri, 11 Aug 2023 11:39:16 +0000 (UTC)
Message-ID: <dff5c443-bebf-9bd9-af1c-85ebfb7c2aec@ghiti.fr>
Date: Fri, 11 Aug 2023 13:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -fixes] riscv: uaccess: Return the number of bytes
 effectively copied
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alan Kao <alankao@andestech.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Bo YU <tsu.yubo@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20230811110304.1613032-1-alexghiti@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230811110304.1613032-1-alexghiti@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_043926_838642_142256A2 
X-CRM114-Status: GOOD (  26.59  )
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

On 11/08/2023 13:03, Alexandre Ghiti wrote:
> It was reported that the riscv kernel hangs while executing the test
> in [1].
>
> Indeed, the test hangs when trying to write a buffer to a file. The
> problem is that the riscv implementation of raw_copy_from_user() does not
> return the number of bytes written when an exception happens and is fixed
> up.


I'll respin another version as the changelog and the title are 
incorrect: the uaccess routines should not return the number of bytes 
copied but actually the number of bytes not copied (this is what this 
patch implements).

I'll wait for feedbacks before doing so!

Sorry about that!

Alex


>
> generic_perform_write() pre-faults the user pages and bails out if nothing
> can be written, otherwise it will access the userspace buffer: here the
> riscv implementation keeps returning it was not able to copy any byte
> though the pre-faulting indicates otherwise. So generic_perform_write()
> keeps retrying to access the user memory and ends up in an infinite
> loop.
>
> Note that before the commit mentioned in [1] that introduced this
> regression, it worked because generic_perform_write() would bail out if
> only one byte could not be written.
>
> So fix this by returning the number of bytes effectively written in
> __asm_copy_[to|from]_user() and __clear_user(), as it is expected.
>
> [1] https://lore.kernel.org/linux-riscv/20230309151841.bomov6hq3ybyp42a@debian/
>
> Fixes: ebcbd75e3962 ("riscv: Fix the bug in memory access fixup code")
> Reported-by: Bo YU <tsu.yubo@gmail.com>
> Closes: https://lore.kernel.org/linux-riscv/20230309151841.bomov6hq3ybyp42a@debian/#t
> Reported-by: Aurelien Jarno <aurelien@aurel32.net>
> Closes: https://lore.kernel.org/linux-riscv/ZNOnCakhwIeue3yr@aurel32.net/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>   arch/riscv/lib/uaccess.S | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index ec486e5369d9..09b47ebacf2e 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -17,8 +17,11 @@ ENTRY(__asm_copy_from_user)
>   	li t6, SR_SUM
>   	csrs CSR_STATUS, t6
>   
> -	/* Save for return value */
> -	mv	t5, a2
> +	/*
> +	 * Save the terminal address which will be used to compute the number
> +	 * of bytes copied in case of a fixup exception.
> +	 */
> +	add	t5, a0, a2
>   
>   	/*
>   	 * Register allocation for code below:
> @@ -176,7 +179,7 @@ ENTRY(__asm_copy_from_user)
>   10:
>   	/* Disable access to user memory */
>   	csrc CSR_STATUS, t6
> -	mv a0, t5
> +	sub a0, t5, a0
>   	ret
>   ENDPROC(__asm_copy_to_user)
>   ENDPROC(__asm_copy_from_user)
> @@ -228,7 +231,7 @@ ENTRY(__clear_user)
>   11:
>   	/* Disable access to user memory */
>   	csrc CSR_STATUS, t6
> -	mv a0, a1
> +	sub a0, a3, a0
>   	ret
>   ENDPROC(__clear_user)
>   EXPORT_SYMBOL(__clear_user)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
