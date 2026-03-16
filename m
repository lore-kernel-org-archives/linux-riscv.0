Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C3DF46455
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 11:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWPZRre11aYnb78EkoG64+PBalyu676I+WYPGAJyHsY=; b=4nsX/yU/cQb+H1
	lIna1kJTs/OIHArn9uI+taLXCB1Z0TRdj5AnJ87o6yi5j3SXrmk8780ZVlV/vGFk9XZxIWR3q2A4Y
	RwKAu8i+oqr1rfqWHhFnDdV3i1bFp5U8XnL4OkXUH7yH8/iKVob3XGj5CZ06YWgetKGQBs/l0az67
	yKaQf39lakoUqKx4kt0W1AKJkr/iVM0P+SuejKnoite8wme6f1Cl6J1g0HhY5R/Y7QIy1qzqaVrGA
	MGSEVGb8w3oRfWNB9kULQloXjvbBkoNdofviYxQlONryTRUWlLMYBqs12+PBvTP5liZi2M9f/Ovgz
	g0Xcf+sLERr2mqkaA0wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26T6-00000003rLS-0cFY;
	Mon, 16 Mar 2026 11:50:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26Sw-00000003rKf-32jS
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 11:50:38 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43b48ac2727so176143f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 04:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773661832; x=1774266632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kQhGtTK/Lt5/UNF5mERVigZml+1Hw4HwS17dAwaToA=;
        b=XsgMGlvu9ce5TH7FPJI8eM2hGrFEfQVwNttNb7yb7tSU9vKUDA8BCO3cJEDtREMxxd
         5gbP56ouHS/WXxIMVdYg6wwXgTnuw8wo7KkaUPlAlZuowVT7RMrYvdnxPYyFY2mHuUb1
         CPyR+d9epp+/8B+VndJXxKZHVCKqiD+kPtOwWKgEK9j2QlWfahJw7o9L9VbHu5ZdC6mf
         yw3E0uIIC0hWxx7Qc+3w0DGjHcGAFIuyBvQFTHPmIlAiwdB92qgQCeA1hd3wQU9mKHj/
         KDFJYx5lqSHlb8tj6ftY5eI0UZbpGYeg7/xHmgLgrgVu0vdQonAm5NLTdgGTqP5FC506
         jQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773661832; x=1774266632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5kQhGtTK/Lt5/UNF5mERVigZml+1Hw4HwS17dAwaToA=;
        b=cJYNv4Wh/J3IrTAs2yUr4KMu0M1TfEyUiNGSb4/9uqR8PyNMqlXe7J02SEazqVX7Mh
         nByyDioKQsn38aatpdlla9LDB4WnLr91dJSLAG3zxOewtQKocvpYgvjmKblOVqWpGMkp
         8WZUzv0ZRqmjpPJZcL7aT0vYfEcrcCUsYcKm7eY5Yzn3FInlEQyuajfffmXdZe3k1Fcm
         IquYchTQjyiXDy+zmgx8pnoHLxkaYrTzLZw5OQPHs0/IcIepgvPgeYLG2Y3zTELAGLlV
         4/mqzrrbjmGvoz1LlEpIxtHPfA9JvcCcbZYnxKstPsEhg1LVWy6hfFkpMQgvU4gvzc24
         Qb+g==
X-Forwarded-Encrypted: i=1; AJvYcCW64b19nR0F3u3PLemxNQZqynwG5Mf/lEyvOZadJDljcGCo53XoPt05sB2FDhbH4h0x6nK8Au6T7INl2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrsChcypavy4nhgBw/xiYD4RBEC7u6Y148dZmGu+YgtjcPumgd
	TnBvCkfkAVM9LLihrNTf2o1moVSbEB/K4OiA1Cjx0Ha0MEevyf9zq2n7
X-Gm-Gg: ATEYQzxLOgmNRBT/91FqPAZb6lrNF0y5u8X/Bk7v+OoGp2w+5vVTicUM1nEPAg6a9Jj
	i3nxkhpud9YrCmjRqbanBfqu83b1ilUE345FqGJc9GmTY1vBnZmELktjH7SK1hNz+VZL2XacLkA
	4UEHnY/b0SOFuCMSbG5aRJXarrNwPze0YHQLhAEpIlucvZoor+ItqiVV+q6a342iQuCacrV983A
	zI2zBmS+fnaYrB8EjQa5X0EJdy5VqXTlJ+6+y00kPNOzHlkFbIY1ZdOpTkbujWR2pd+Wvkhunba
	rx9MLsxuBu7RoEdekXY9b3aRVT130hm0HywsCYhvKSND8FKtSIyYGBsjCbfkN8/u+I766r9987y
	FOW3kvtLZ8h8ymNtl43psdkaCkTPQUmh3yEP9DAuMNyrSyFWHEPYf4d4aeMWR+J1rXU1EUnEQt9
	Gdu1+vGV7jywk3uDB0eV70hgRBC/6C7iegDIJiAef6iScW4q4XQoMDb9yVF/ynsjMw
X-Received: by 2002:a05:600c:1e8b:b0:483:b505:9db7 with SMTP id 5b1f17b1804b1-4855672ada8mr206704535e9.32.1773661832366;
        Mon, 16 Mar 2026 04:50:32 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm421847035e9.0.2026.03.16.04.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 04:50:32 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:50:30 +0000
From: David Laight <david.laight.linux@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "Peter Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Darren Hart <dvhart@infradead.org>, Davidlohr
 Bueso <dave@stgolabs.net>, =?UTF-8?B?QW5kcsOp?= Almeida
 <andrealmeid@igalia.com>, <linux-arch@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>, Jisheng
 Zhang <jszhang@kernel.org>
Subject: Re: [RFC PATCH v2 2/7] arm64/runtime-const: Introduce
 runtime_const_mask_32()
Message-ID: <20260316115030.6988ad62@pumpkin>
In-Reply-To: <20260316052401.18910-3-kprateek.nayak@amd.com>
References: <20260316052401.18910-1-kprateek.nayak@amd.com>
	<20260316052401.18910-3-kprateek.nayak@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_045035_575302_B77ABB2B 
X-CRM114-Status: GOOD (  19.06  )
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

On Mon, 16 Mar 2026 05:23:56 +0000
K Prateek Nayak <kprateek.nayak@amd.com> wrote:

> Futex hash computation requires a mask operation with read-only after
> init data that will be converted to a runtime constant in the subsequent
> commit.
> 
> Introduce runtime_const_mask_32 to further optimize the mask operation
> in the futex hash computation hot path. GCC generates a:
> 
>   movz  w1, #lo16, lsl #0     // w1 = bits [15:0]
>   movk  w1, #hi16, lsl #16    // w1 = full 32-bit value
>   and   w0, w0, w1	      // w0 = w0 & w1

I don't thing the '&' needs to be part of the asm block.
Just generate the 32bit constant and do the mask in C.
That will let the compiler schedule the instructions.
It also make the code patching more generally useful.

	David


> 
> pattern to tackle arbitrary 32-bit masks and the same was also suggested
> by Claude which is implemented here. __runtime_fixup_ptr() already
> patches a "movz, + movk lsl #16" sequence which has been reused to patch
> the same sequence for __runtime_fixup_mask().
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>  arch/arm64/include/asm/runtime-const.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/runtime-const.h b/arch/arm64/include/asm/runtime-const.h
> index c3dbd3ae68f6..4c3f0b9aad98 100644
> --- a/arch/arm64/include/asm/runtime-const.h
> +++ b/arch/arm64/include/asm/runtime-const.h
> @@ -35,6 +35,19 @@
>  		:"r" (0u+(val)));				\
>  	__ret; })
>  
> +#define runtime_const_mask_32(val, sym) ({			\
> +	unsigned long __ret;					\
> +	asm_inline("1:\t"					\
> +		"movz %w0, #0xcdef\n\t"				\
> +		"movk %w0, #0x89ab, lsl #16\n\t"			\
> +		"and %w0,%w0,%w1\n\t"				\
> +		".pushsection runtime_mask_" #sym ",\"a\"\n\t"	\
> +		".long 1b - .\n\t"				\
> +		".popsection"					\
> +		:"=r" (__ret)					\
> +		:"r" (0u+(val)));				\
> +	__ret; })
> +
>  #define runtime_const_init(type, sym) do {		\
>  	extern s32 __start_runtime_##type##_##sym[];	\
>  	extern s32 __stop_runtime_##type##_##sym[];	\
> @@ -80,6 +93,15 @@ static inline void __runtime_fixup_shift(void *where, unsigned long val)
>  	__runtime_fixup_caches(where, 1);
>  }
>  
> +/* Immediate value is 6 bits starting at bit #16 */
> +static inline void __runtime_fixup_mask(void *where, unsigned long val)
> +{
> +	__le32 *p = lm_alias(where);
> +	__runtime_fixup_16(p, val);
> +	__runtime_fixup_16(p+1, val >> 16);
> +	__runtime_fixup_caches(where, 2);
> +}
> +
>  static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
>  	unsigned long val, s32 *start, s32 *end)
>  {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
