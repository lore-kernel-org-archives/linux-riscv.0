Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21361C9830D
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 09:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0JcDLNJDl/WGey8hSA27qq4xq9+bcpKR1kvO+rSQsrQ=; b=T0F/rSKqO54h/i
	SBDNTOFSfuonBdZ7HcYCeFZB4Z+RDFUF3IJq8QpNF0YzgbVLQUveFvwFo1zHQC100T7lB2oh93DHc
	S2Gqjj0/T5kAS7UxGNjDJUJo5193SUJ+CrEMGDTNiHQREVH9aI7gUbPkSVzPO0gcJplDLfRMvwmka
	ZMo9p6bm+fpHli3n5tZydBreyGjGOEJnQrbyFmxOnRhLiFNYIkdADZlx3xTeN5rwTbhFL3OR81+1L
	ev2wrgR0VunAOFJctUxPc98jzxh6YI/6+bY+bvWdYknpx3wLcnr1UaGMeYd8M59e4e/jKJ4zyJinn
	AF/zXXm3asw7m6A6T8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1wG-0000000Cygw-3qyL;
	Fri, 25 Sep 2026 09:09:52 +0000
Received: from mail-wr2-x21.google.com ([2a00:1450:4864:30::21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1wE-0000000Cyga-3ouO
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 09:09:52 +0000
Received: by mail-wr2-x21.google.com with SMTP id ffacd0b85a97d-48881a62e09so113196f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 02:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790327388; x=1790932188; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vlqi5ipL/fx0oBY6ltjeY+Xbl5LvlZhr3/dMDAYIk50=;
        b=LCcRVud59H0urXamxlLK354XTRhhyeaL1CpOBLADagrcndWfFrp8a8z0MrQg7MWAX+
         iAUibo0d/0ImYUcczB77kSfuvlyUowPekI8Rkwadoss42tohau8A7FjACQHSttS2i90P
         RUkOPBec3RbgQ3B5YlbVAfGVSUBDdIzXWMjOxt7fUYFzt69ODC8ks/sfzG4naSmnD6bb
         9c5axDYEmFlL7cOO4n23jJ1UYC0JE/XmXx0sVRgNkCKNjkfMa78yb7+/ZOOsfgOlwBGh
         vaszDlrJu8aVxs6HCkE+juIOuQDO1mc0D/As5lVL5ciCfYknG/hfPSHyL57DRN/nbK4G
         wAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327388; x=1790932188;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vlqi5ipL/fx0oBY6ltjeY+Xbl5LvlZhr3/dMDAYIk50=;
        b=FG2pujL7PTYc+1Xvji7l3NegZaWzZy76xBmGuom1lTn4WONhaIgfU8dXrgChCcJDyx
         L7magpiE8MCSTMgNpX5BztYTqpHRe34FMFkv9BMGKQTz5DcBLYp1go03ANzyd4CJMXg6
         JxO3f2d9wxgA+xIgy4DyDOMn0iSkwoPeS9ig6IGBIZjJxOqrYTsoHQfFqhfJAzPnimdE
         +4wCyl+t95Kfc7BYigzn+oa6K/N1omtOw/bv6U+qCftB/YNO4kkuIoOaYnbaEfb0PWHF
         ZXkWzWv5JG7JglXinBBJn6eH/+eyHdaN0vQPrXn7JQNT3OUZ0vmNVsTMlxlb1p+1fNpT
         F1QA==
X-Forwarded-Encrypted: i=1; AKwUvBzF7nbRr5zMhLtocF4/Ksnf1ncoA3PC4KLxwWbC3UP8c62DmAytdO68lkj9vqhxuL1Bnq/+SnQyhploSA==@lists.infradead.org
X-Gm-Message-State: AFuF++ma7qhplql+haVvHDiHUGuSn97jJClkY5ogtRTsyGGTTQyTj8kA
	4R0uLnmh3hSAzpmcU56lqGjJb7tcm0MmF9+OIBiKLQFl9EY4aulxirD0
X-Gm-Gg: AYBFou33hHej3Yjqu35CVDXpluijHU1gRl/wAs66PRT+D/u4iB2F/o95R22QNGs6cRz
	k/w6r1InOjoz0zWNDVmI55TTC0qRegpxR2Z4cM1Gl4K38Y1sgq9NB1vl6FP+tXFfM3nL4kHvAvi
	Mz/vlTtGZB+SKYF9vEuy+4MPApE8EiK2Z9jAiNemQQVkXla4PJbP5ecWU2E80Yt93eLvRapD80L
	XMgqaOoL+eSF7wZ9w0TSzvI5XgbpaW/4QM60XlOwkDMdbnuK5F5bPiV8gj+nA17fgm2FuEilOXF
	CK1jQD+goNEtHOI+gnj5V92TNN0G4gI+tVF/GAsb6ypUiviEdesW3WBXlliUMKHUfTQoB6/0N0r
	4cknQmyNJqcl95iqt6VTJbxDiaKBUWXf4/RpEvXwjxtqsw4aecESfT4GVSwK2cw4amdc8CvWVL1
	XmCyWEOlEUDIoJJTWDaP0MIZGKdYqmquHlYP+vZgnk6JxjMYcfSrkKNcRQunN2gXKFwvQRslDjd
	vWFvIpVBqFKqHfik5jGH+w2cbZEoVnuKhE=
X-Received: by 2002:a5d:64e9:0:b0:487:1575:ebef with SMTP id ffacd0b85a97d-4887176868bmr9522369f8f.47.1790327387384;
        Fri, 25 Sep 2026 02:09:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35fb05sm6089428f8f.20.2026.09.25.02.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:09:47 -0700 (PDT)
Date: Fri, 25 Sep 2026 10:09:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: <gao.rui@zte.com.cn>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <jiangfeng@kylinos.cn>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <jmontleo@redhat.com>
Subject: Re: [PATCH v2] riscv: fix strnlen() overflow in Zbb implementation
Message-ID: <20260925100945.2df80cd4@pumpkin>
In-Reply-To: <20260924105708488K1vV5J_xi9COWY7TvJawc@zte.com.cn>
References: <20260924105708488K1vV5J_xi9COWY7TvJawc@zte.com.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_020951_032832_A3372390 
X-CRM114-Status: GOOD (  36.66  )
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

On Thu, 24 Sep 2026 10:57:08 +0800 (CST)
<gao.rui@zte.com.cn> wrote:

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
> Rework the Zbb implementation to use a decrementing word counter. 
> This removes the dependency on end-address calculations,
> avoids overflow entirely, and simplifies the word scanning loop.
> 
> Performance was evaluated with string_bench_strnlen:
> 
> New Implementation Previous Implementation
> 
> len=0 : 70 ns/call 70 ns/call
> len=1 : 81 ns/call 81 ns/call
> len=7 : 81 ns/call 81 ns/call
> len=8 : 81 ns/call 81 ns/call
> len=16 : 97 ns/call 90 ns/call
> len=31 : 119 ns/call 113 ns/call
> len=64 : 174 ns/call 162 ns/call
> len=127 : 264 ns/call 258 ns/call
> len=512 : 801 ns/call 824 ns/call
> len=1024 : 1578 ns/call 1550 ns/call
> len=3173 : 4541 ns/call 4703 ns/call
> len=4096 : 5984 ns/call 5982 ns/call
> 
> Results show comparable performance to the previous implementation
> while fixing the overflow issue.
> 
> Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
> Signed-off-by: Gao Rui <gao.rui@zte.com.cn>
> 
> ---
> v2:
> - Rework the Zbb implementation to eliminate end-address overflow
> instead of falling back to the generic path.
> - Use a decrementing word counter for word scanning.
> - Replace numeric labels with descriptive local labels.
> - Add comments describing the loop structure.
> - Run KUnit string tests successfully.
> - Add string_bench_strnlen benchmark results.
> ---
>  arch/riscv/lib/strnlen.S | 111 +++++++++++++++++----------------------
>  1 file changed, 48 insertions(+), 63 deletions(-)
> 
> diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
> index a8911605c248..0d074e45363c 100644
> --- a/arch/riscv/lib/strnlen.S
> +++ b/arch/riscv/lib/strnlen.S
> @@ -67,102 +67,87 @@ strnlen_zbb:
>  	 *   a1 - Max length of string
>  	 *
>  	 * Clobbers
> -	 *   t0, t1, t2, t3, t4
> +	 *   t0, t1, t2, t3, t4, t5, t6
>  	 */
> 
>  	/* If maxlen is 0, return 0. */
> -	beqz	a1, 3f
> +	beqz	a1, .Lmaxlen
> 
> -	/* Number of irrelevant bytes in the first word. */
> -	andi	t2, a0, SZREG-1
> +	/* Save original pointer: final length = (current - orig) + offset. */
> +	mv	t2, a0
> +
> +	/* Bytes preceding the string in the first word. */
> +	andi	t6, a0, SZREG-1

This patch is made larger by pointless changes to the temporary
registers and numeric labels.

> 
>  	/* Align pointer. */
>  	andi	t0, a0, -SZREG
> 
> -	li	t3, SZREG
> -	sub	t3, t3, t2
> -	slli	t2, t2, 3
> -
> -	/*
> -	 * Aligned boundary.  Use the address of the last valid byte
> -	 * (s + count - 1) to avoid loading a word past the count
> -	 * boundary in the loop below.  count == 0 is handled above.
> -	 */
> -	add	t4, a0, a1
> -	addi	t4, t4, -1
> -	andi	t4, t4, -SZREG
> +	li	t5, SZREG
> +	sub	t5, t5, t6
> +	slli	t6, t6, 3
> 
> -	/* Get the first word.  */
> +	/* Load and mask the first word. */
>  	REG_L	t1, 0(t0)
> -
> -	/*
> -	 * Shift away the partial data we loaded to remove the irrelevant bytes
> -	 * preceding the string with the effect of adding NUL bytes at the
> -	 * end of the string's first word.
> -	 */

Why have you deleted that comment?

> -	SHIFT	t1, t1, t2
> -
> -	/* Convert non-NUL into 0xff and NUL into 0x00. */
> +	SHIFT	t1, t1, t6
>  	orc.b	t1, t1
> -
> -	/* Convert non-NUL into 0x00 and NUL into 0xff. */
>  	not	t1, t1
> -
> -	/*
> -	 * Search for the first set bit (corresponding to a NUL byte in the
> -	 * original chunk).
> -	 */
>  	CZ	t1, t1
> 
> -	/*
> -	 * The first chunk is special: compare against the number
> -	 * of valid bytes in this chunk.
> -	 */
> +	/* NUL offset inside the first (shifted) word. */
>  	srli	a0, t1, 3
> -
> -	/* Limit the result by maxlen. */
>  	minu	a0, a0, a1
> 
> -	bgtu	t3, a0, 2f
> +	/* If the NUL lies inside the valid bytes of this first chunk, done. */
> +	bgtu	t5, a0, .Ldone
> +
> +	/*
> +	 * Remaining bytes = a1 - t5 (never underflows here).
> +	 * Word count = ceil(remaining / SZREG) without addi-wrap hazard.
> +	 */
> +	sub	t4, a1, t5
> +	beqz	t4, .Lmaxlen
> 
> -	/* All remaining bytes are in the first word, no loop needed. */
> -	bgeu	t0, t4, 2f
> +#if defined(CONFIG_64BIT)
> +	srli	t1, t4, 3
> +	andi	t4, t4, 7
> +#else
> +	srli	t1, t4, 2
> +	andi	t4, t4, 3
> +#endif
> +	beqz	t4, 1f
> +	addi	t1, t1, 1

I'm sure you've got a cmpeq instruction that will generate a 0/1 and
remove the branch.

> +1:
> +	mv	t4, t1

Or just calculate as: count = (remaining - 1)/SZREG + 1;

OTOH I think you can use:
	unsigned remaining = len;
	do {
		...
	} while ((remaining -= SZ) < len);
For 'normal' lengths the loop will terminate when remaining wraps.
If len is ~0 the condition is always true. 

> 
> -	/* Prepare for the word comparison loop. */
> -	addi	t2, t0, SZREG
>  	li	t3, -1
> 
>  	/*
> -	 * Our critical loop is 4 instructions and processes data in
> -	 * 4 byte or 8 byte chunks.
> +	 * Critical loop: exactly one backward branch.
> +	 * addi t4 is hoisted before orc.b to hide in the load-use latency.

That all depends on the implementation of the cpu.
A multi-issue cpu is likely to perform the two adds in the same clock
(and also in the same clock as the memory read instruction).
A cpu that supports speculative execution will hide the load delay.
So the comment isn't really accurate at all.

Having said that, there are loops that x86 cpu execute faster if
arranged to only have one register incremented/decremented in the loop.
So there might be benefits in the alternative patch.

David

>  	 */
>  	.p2align 3
> -1:
> +2:
>  	REG_L	t1, SZREG(t0)
>  	addi	t0, t0, SZREG
> +	addi	t4, t4, -1
>  	orc.b	t1, t1
> -	bgeu	t0, t4, 4f
> -	beq	t1, t3, 1b
> -4:
> +	bne	t1, t3, .Lfound
> +	bnez	t4, 2b
> +
> +.Lmaxlen:
> +	mv	a0, a1
> +.Ldone:
> +	ret
> +
> +.Lfound:
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
> +	/* Length = bytes already passed + offset in final word. */
> +	sub	a0, t0, t2
>  	add	a0, a0, t1
> -
> -	/* Ensure the final result does not exceed maxlen. */
>  	minu	a0, a0, a1
> -2:
> -	ret
> -3:
> -	mv	a0, a1
>  	ret
> 
>  .option pop


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
