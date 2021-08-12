Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA84C432BE
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 13:42:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3550460FD7
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 13:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3550460FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mfKn2XqJspnp9Mrb9JylTxe8aJ/1xWc/zwOV/mQRFc=; b=ffPaKnKf0cd1xK
	UDhN5h4t5z5ovaRNCPLwVEVV4ypCXERyaVFG5WVTI+FOttahvIUoQ42lsVZff90RLCQ4cV2n4F2OE
	ydte1f++NcNeKmMf5VYEq8Tac/CHlItiZBJRLNagA+j3xk54Y5iwD1S8X5hhJFnqrQ7j9iiZwxOs3
	4uyX7m5aa0a4EYDTYkwCn0Uj7g9qsGMdSb8C7Z78XAnEmcXWiAVRb4sFiQmWbRah9v+ZZoAuHkgq+
	mPaRmLgDzSO+MLhYM+2bepAAX3JLHgeawPHchaL2AD2Q/nuPRMAuo00e5zF4m/uSTioEODysytlDQ
	MzrHkQXmSvXlttZ6fOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEAy0-00AHGp-QB; Thu, 12 Aug 2021 13:41:52 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEAxx-00AHFc-AR
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 13:41:50 +0000
Received: by mail-oi1-x232.google.com with SMTP id u25so10366058oiv.5
 for <linux-riscv@lists.infradead.org>; Thu, 12 Aug 2021 06:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w8ByNvmcER+djVrwXEK9pUfCYkOH6rFbdfIhJ/tSBvA=;
 b=MNipbIQlWMXcHHMJ/+LhWIi2OgJ76yGlWDEmKM/0Bjhpqrf2ZfrIV/O3VG1gs20c4o
 0EYw/Tnt/Q4Lg1N6gTrwRaJsOsvzgPOD6e6Eq5BtewSI1ZZyWF9JqjskwJUjqXK2bHvg
 B3hJGt4+1R1Un8lVAHbXDIQ4XQCJxsbOMKWdPR98mTKJZTCIP/Faj5t+h1vQepdd2qgV
 oVRNCnpRl4SzwP0WctbMN8MytglLzukvw5/g6CbEGp8RdK2HnlnqHOkpJ0PT4TwFa/v9
 H5E7pAeX/h/QR3y7F62jTyKc4Sj6idE4suFcsW1HMpnSVEYwixuntgwctDS3LatpU9kW
 geJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=w8ByNvmcER+djVrwXEK9pUfCYkOH6rFbdfIhJ/tSBvA=;
 b=Qe9R0N4OjsFH0XIopjdsk7uf2Nu7iIBClnMEtXhQbZx4wehpWF8ghmFfwtTyTgarN7
 WP1H9qEEmNe0Jtk1m6x+jrufl5Ay/0dOSaymJ6bGBkPxKxy53QgmJR/VxqJQZl5Iw2Wr
 vXQvtqtinQfanefMIBqfI3Dn2ocyavY/qzlTtgikwezBVax5HrWWuTIkkZb1op/QIhic
 4917sefDh5h9m+K89CX4HaOAbJUVGJpal9ZJeh2y2sTi/7zH20SJH8Dp7Wzu15RbiZZ3
 Z/yfj8Itpe8HL+djPu+jCRC7WQ6C2MTTfHW9vw/qMtBMFMJLMTqviCHeL/qoSsi6CcXz
 UZgg==
X-Gm-Message-State: AOAM531FjgNeUafUoLTDrYyym/vnfagfURjdoiOnRITw62Go7UszQ2fF
 qg5eAEY19r0ION+9mLKK/aM=
X-Google-Smtp-Source: ABdhPJxtwTGZdGVnSxCjpIEUVaQED8UOsBJIekT5sFbgESHHxcYCdesYT3483WIUoZCvGvi50HCaGw==
X-Received: by 2002:a05:6808:144e:: with SMTP id
 x14mr3316950oiv.28.1628775707346; 
 Thu, 12 Aug 2021 06:41:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 z21sm613612oto.46.2021.08.12.06.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 06:41:46 -0700 (PDT)
Date: Thu, 12 Aug 2021 06:41:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] riscv: __asm_copy_to-from_user: Improve using word
 copy if size < 9*SZREG
Message-ID: <20210812134145.GA4132779@roeck-us.net>
References: <65f08f01-d4ce-75c2-030b-f8759003e061@gmail.com>
 <e3e9fb3a-40b1-50f3-23cc-50bfa53baa8d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3e9fb3a-40b1-50f3-23cc-50bfa53baa8d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_064149_424593_667D079E 
X-CRM114-Status: GOOD (  18.94  )
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

On Fri, Jul 30, 2021 at 10:52:44PM +0900, Akira Tsukamoto wrote:
> Reduce the number of slow byte_copy when the size is in between
> 2*SZREG to 9*SZREG by using none unrolled word_copy.
> 
> Without it any size smaller than 9*SZREG will be using slow byte_copy
> instead of none unrolled word_copy.
> 
> Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/riscv/lib/uaccess.S | 46 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index 63bc691cff91..6a80d5517afc 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -34,8 +34,10 @@ ENTRY(__asm_copy_from_user)
>  	/*
>  	 * Use byte copy only if too small.
>  	 * SZREG holds 4 for RV32 and 8 for RV64
> +	 * a3 - 2*SZREG is minimum size for word_copy
> +	 *      1*SZREG for aligning dst + 1*SZREG for word_copy
>  	 */
> -	li	a3, 9*SZREG /* size must be larger than size in word_copy */
> +	li	a3, 2*SZREG
>  	bltu	a2, a3, .Lbyte_copy_tail
>  
>  	/*
> @@ -66,9 +68,40 @@ ENTRY(__asm_copy_from_user)
>  	andi	a3, a1, SZREG-1
>  	bnez	a3, .Lshift_copy
>  
> +.Lcheck_size_bulk:
> +	/*
> +	 * Evaluate the size if possible to use unrolled.
> +	 * The word_copy_unlrolled requires larger than 8*SZREG
> +	 */
> +	li	a3, 8*SZREG
> +	add	a4, a0, a3
> +	bltu	a4, t0, .Lword_copy_unlrolled
> +
>  .Lword_copy:
> -        /*
> -	 * Both src and dst are aligned, unrolled word copy
> +	/*
> +	 * Both src and dst are aligned
> +	 * None unrolled word copy with every 1*SZREG iteration
> +	 *
> +	 * a0 - start of aligned dst
> +	 * a1 - start of aligned src
> +	 * t0 - end of aligned dst
> +	 */
> +	bgeu	a0, t0, .Lbyte_copy_tail /* check if end of copy */
> +	addi	t0, t0, -(SZREG) /* not to over run */
> +1:
> +	REG_L	a5, 0(a1)
> +	addi	a1, a1, SZREG
> +	REG_S	a5, 0(a0)
> +	addi	a0, a0, SZREG
> +	bltu	a0, t0, 1b
> +
> +	addi	t0, t0, SZREG /* revert to original value */
> +	j	.Lbyte_copy_tail
> +
> +.Lword_copy_unlrolled:
> +	/*
> +	 * Both src and dst are aligned
> +	 * Unrolled word copy with every 8*SZREG iteration
>  	 *
>  	 * a0 - start of aligned dst
>  	 * a1 - start of aligned src
> @@ -97,7 +130,12 @@ ENTRY(__asm_copy_from_user)
>  	bltu	a0, t0, 2b
>  
>  	addi	t0, t0, 8*SZREG /* revert to original value */
> -	j	.Lbyte_copy_tail
> +
> +	/*
> +	 * Remaining might large enough for word_copy to reduce slow byte
> +	 * copy
> +	 */
> +	j	.Lcheck_size_bulk
>  
>  .Lshift_copy:
>  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
