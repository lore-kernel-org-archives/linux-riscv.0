Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6EBCA5FB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 08:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCCBKwKRwDc547sM2fCD2A0GRKmXzGgFhXhVfM8j39s=; b=V2AMuuR75EMk79
	4Zl2YmhOcDTm6jKzjvgI2/zE+Ik2lnhben+0Q3MpMSudtPDHygpw77AIsQHk9Jv9eOim+7uEol7qc
	Ljr4JhPsARgwBvXIeZkmFnyr/solqRYyqfQJyZrHD4atC3WVf6N7HgbD9Ls3PzC4qMov13gY+klRE
	EzHw06BXGfCfKfkLd1gWJMd9Y1+q0URa/nK1lmfDS8rmK6Ec4l6oEkvsTzvCjOPoe1WoyEP5STpKL
	f22AWMSLZRhZppK95lMI64FRrZAWpaFozVhYlu5kRcCNJWPdNoRUEuER9wgeBjfpnQLbOXtR3xFWO
	1c2x/ruE1/d6nlu+6IOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpwg-00000005TWj-2rRD;
	Wed, 30 Sep 2026 08:45:46 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpwe-00000005TVu-0b5y
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 08:45:45 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-482f63546c5so4505825f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 01:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790757942; x=1791362742; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mF7HlrBlQvO0gfGzj2Av7N0MU2dcxYSnBCQbxi4I9IE=;
        b=O9MFMiBy1rVjgBzhXdmXRBdUzxsBRDDF03Ci+hJa/POWBdQlIUx0tAITFY1O3yL+2h
         +fACQrxpB7+hYkIlvDKfcksTjfyA7QQFvMtmm6jLxLgsXskAd9H2SRJZq4pb9uWDSXYw
         MKfNZ9omqMFsVD7S0qtsMrY3IrLfXx/R11EqVl9WWZUSGsKj6zCIcVI6smVk9sLtHwbu
         sHG7j3Xor+FEbfHVX3STJ4OY+j3EAon94MEwye9/oNWN8tyhXJkKFBRz6w7mfVueOUCo
         5FFbQjxmBIsyEWtI9/yLKH/aLiOAPKMvlzDnlNaA0j9Dn4sVGo3jDkXp8gydVq9oqsVM
         7eAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757942; x=1791362742;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mF7HlrBlQvO0gfGzj2Av7N0MU2dcxYSnBCQbxi4I9IE=;
        b=0LnfEjcaJC88gLwQaezTIqSbesAKZd87UgTmSZC+9pW1pFXPyEobGUvuCBkzPHqQZe
         Ad3RBjQWlH9V92VtUoFUnQ6GFoiexB6CU+aEqeck40F1lNC+7Wf13nAcV4gZLnINKRzN
         z8eOqeRb/LkEd6AXnMLX4EsJPcBlfE9RMwuuI174DF/aqZCBKOTZt6dSmVzVSFqRZ7hH
         TcIT/8w/MKI7uJBVWqcE1WdnJgsfyFT1AHkK4WzWWKT9hWA0W4wcG7l++PTvXlj9W0D/
         +KGGeWbtKvst3FvU+sYV+J9xEMTC64Im/zkMNmLPe4SDe/i0p8meR9phPfu7/kIfli6R
         cAPg==
X-Forwarded-Encrypted: i=1; AKwUvBwzBqofddQxuefaCKy0dX17f3cnegXxOLytY99BBUecTbdiO4WFy3C8ewgH9YD6KL8vpdGN9kDdJTGOmA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIQnEFghpxXEYN+RCJwKb4oqIMvOWseujF4rhKcAO+tSP/0/rD7
	k4umu+awbPqpkcvpNl20IgFmYnf//fAIrQOAwky7wE4OwXV9Gb7ktSTH
X-Gm-Gg: AYBFou3H3Z7YutpndMbz6TO7jj8ABCHr6FthBfNLCvosMJjmyvOR8bKBHxOVtpE8KuU
	ViAk10SjapV6ejHtzToFxp0HPaGEyzAQjv4VZlDc6IQ6cxOa4OkW6H0A28ywVe0F96p47yI6hqb
	H0oFAaUfeAAkSTxnD8ZQwIQ8EOuZqRa8lAcJoNYFeMeWO83bvvzXqsQbPPQKdk7ES29eckTQrIs
	HKScHtgwgTEFg49sX8VGoJU/+Bhy96kbDXSpGxFxsOlQWX9HfbfgJlYVN6UHKdPe3m/pYhPwIfc
	CpIyhQ5k5yjg4nasMrW4wMJb0UbhzVMUZIS8Sav1kAfBAvmP8uNDjnIMYm0Ap7xFoN4190Y53Jz
	7616PssKKpGG3F5zYrbQ0L0my3M07YNTgudjFcFOa9t+DFjfPGe3X4q0gmkzdOATNJIWeodphrc
	8RZwN/lPtocQOnph1S6jOtbAoJ4L+tB0fgkQ7er2HfRzrLRMJwwMGcWl4Awq+Rh9l1g5b9iPaE/
	xyp500obEwT7PmkskHsjRS750P7MhM0Ctc=
X-Received: by 2002:a05:6000:471a:b0:487:b4a:3f54 with SMTP id ffacd0b85a97d-48b024e51dcmr1351463f8f.29.1790757941376;
        Wed, 30 Sep 2026 01:45:41 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02949f45sm1854526f8f.2.2026.09.30.01.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:45:40 -0700 (PDT)
Date: Wed, 30 Sep 2026 09:45:39 +0100
From: David Laight <david.laight.linux@gmail.com>
To: <gao.rui@zte.com.cn>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <jiangfeng@kylinos.cn>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <jmontleo@redhat.com>
Subject: Re: [PATCH v3] riscv: fix strnlen() overflow in Zbb implementation
Message-ID: <20260930094539.6242e256@pumpkin>
In-Reply-To: <202609300948576198tT3nfO5VwsTwUw23gA9v@zte.com.cn>
References: <202609300948576198tT3nfO5VwsTwUw23gA9v@zte.com.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_014544_224728_7D594076 
X-CRM114-Status: GOOD (  36.06  )
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

On Wed, 30 Sep 2026 09:48:57 +0800 (CST)
<gao.rui@zte.com.cn> wrote:

> riscv: fix strnlen() overflow in Zbb implementation
> 
> The RISC-V Zbb optimized strnlen() implementation can return incorrect
> results when very large count values are supplied.
> 
> The previous implementation calculates an end address based on the
> input pointer and count. When count is close to SIZE_MAX, the address
> calculation may overflow, resulting in incorrect termination checks and
> wrong return values.
> 
> This issue was observed while running device-mapper tests:
> 
> dmsetup create testname9 --table "0 8 zero"
> cat /sys/block/dm-*/dm/name
> dmsetup remove testname9
> 
> Rework the Zbb implementation to use a word counter instead of an end
> address. This removes the dependency on end-address calculations,
> avoids overflow entirely, and simplifies the termination condition of
> the word scanning loop. The final length is calculated using the saved
> original pointer.
> 
> Performance was evaluated with string_bench_strnlen:
> 
> New Implementation Previous Implementation
> 
> len=0 : 71 ns/call 70 ns/call
> len=1 : 82 ns/call 81 ns/call
> len=7 : 83 ns/call 81 ns/call
> len=8 : 83 ns/call 81 ns/call
> len=16 : 94 ns/call 90 ns/call
> len=31 : 117 ns/call 113 ns/call
> len=64 : 175 ns/call 167 ns/call
> len=127 : 259 ns/call 258 ns/call
> len=512 : 802 ns/call 833 ns/call
> len=1024 : 1512 ns/call 1536 ns/call
> len=3173 : 4581 ns/call 4640 ns/call
> len=4096 : 6256 ns/call 6068 ns/call
> 
> Results show comparable performance to the previous implementation
> while fixing the overflow issue.
> 
> Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
> Suggested-by: DavidLaight <david.laight.linux@gmail.com>
> Signed-off-by: Gao Rui <gao.rui@zte.com.cn>
> 
> ---
> v3:
> - Keep the original register allocation (t0-t4) and numeric labels.
> - Keep the original comments.
> - Calculate word count as (remaining - 1) / SZREG + 1, removing the
>   branch from the calculation.
> v2:
> - Rework the Zbb implementation to eliminate end-address overflow
>   instead of falling back to the generic path.
> - Use a decrementing word counter for word scanning.
> - Run KUnit string tests successfully.
> - Add string_bench_strnlen benchmark results.
> ---
>  arch/riscv/lib/strnlen.S | 54 +++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
> index a8911605c248..000000000000 100644
> --- a/arch/riscv/lib/strnlen.S
> +++ b/arch/riscv/lib/strnlen.S
> @@ -73,6 +73,9 @@
>  	/* If maxlen is 0, return 0. */
>  	beqz	a1, 3f
> 
> +	/* Save original pointer for final length calculation. */
> +	mv	t4, a0
> +
>  	/* Number of irrelevant bytes in the first word. */
>  	andi	t2, a0, SZREG-1
> 
> @@ -82,15 +85,6 @@
>  	li	t3, SZREG
>  	sub	t3, t3, t2
>  	slli	t2, t2, 3
> -
> -	/*
> -	 * Aligned boundary.  Use the address of the last valid byte
> -	 * (s + count - 1) to avoid loading a word past the count
> -	 * boundary in the loop below.  count == 0 is handled above.
> -	 */
> -	add	t4, a0, a1
> -	addi	t4, t4, -1
> -	andi	t4, t4, -SZREG
> 
>  	/* Get the first word.  */
>  	REG_L	t1, 0(t0)
> @@ -125,15 +119,26 @@
> 
>  	bgtu	t3, a0, 2f
> 
> -	/* All remaining bytes are in the first word, no loop needed. */
> -	bgeu	t0, t4, 2f
> +	/*
> +	 * Use a word counter to avoid calculating an end address,
> +	 * which might overflow when count is close to SIZE_MAX.
> +	 */
> +	sub	t2, a1, t3
> +	beqz	t2, 3f

Is that right?
The equality check seems wrong.
Does it work when there are more characters in the first word than
the caller specified length.

> 
> -	/* Prepare for the word comparison loop. */
> -	addi	t2, t0, SZREG
> +	/* Calculate the word count: count = (remaining - 1) / SZREG + 1 */
> +	addi	t2, t2, -1
> +#if defined(CONFIG_64BIT)
> +	srli	t1, t2, 3
> +#else
> +	srli	t1, t2, 2
> +#endif
> +	addi	t2, t1, 1
> +
>  	li	t3, -1
> 
>  	/*
> -	 * Our critical loop is 4 instructions and processes data in
> +	 * Our critical loop is 6 instructions and processes data in

The diff below adds one instruction - I make that 5.
But the instruction count isn't what really matters, what matters
is the number of clocks it takes the loop to execute.

>  	 * 4 byte or 8 byte chunks.
>  	 */
>  	.p2align 3
> @@ -141,23 +146,22 @@
>  	REG_L	t1, SZREG(t0)
>  	addi	t0, t0, SZREG
>  	orc.b	t1, t1
> -	bgeu	t0, t4, 4f

Hasn't that (the old code) just read beyond the end of the buffer

> -	beq	t1, t3, 1b
> +	bne	t1, t3, 4f
> +	addi	t2, t2, -1
> +	bnez	t2, 1b

You want to put the 'addi t2, t2, -1' higher up next to the other addi.
Then simple cpu will execute it while waiting for the read to complete.
The old code did that - but got it wrong.
You can do the length check while the cpu is (otherwise) stalled waiting
for the read. So something like:
1:	REG_L	t1, SZREG(t0)
	addi	t0, t0, SZREG
	addi	t2, t2, -1
	bnez	t2, 3f
	orc.b	t1, t1
	beq	t1, t3, 1b
2:	// Found a zero
	...
	ret

3:	orc.b	t1, t1
	bne	t1, t3, 2b
	// No zero

The count (t1) would need to be one lower.

Did you try just subtracting SZREG from the length-left
and doing an unsigned compare against the original size?
I think it should work and saves the setup code.

David

> +
> +	/* Scanned all words without finding NUL, return maxlen. */
> +	mv	a0, a1
> +	ret
> +
>  4:
>  	not	t1, t1
>  	CZ	t1, t1
>  	srli	t1, t1, 3
> 
> -	/* Get number of processed bytes. */
> -	sub	t2, t0, t2
> -
> -	/* Add number of characters in the first word.  */
> -	add	a0, a0, t2
> -
> -	/* Add number of characters in the last word.  */
> +	/* Length = (current - original) + offset in final word. */
> +	sub	a0, t0, t4
>  	add	a0, a0, t1
> -
> -	/* Ensure the final result does not exceed maxlen. */
>  	minu	a0, a0, a1
>  2:
>  	ret
> --
> 2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
