Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61C5C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 08:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ou7ECcYG5QnAHG/lBnEn1YxFTShF9SA4WUqdeygZsZ8=; b=bPcAPeiD07MCGA
	FaQC5Y8UE4mMUpGyjRH4jchhIIhmsACVZwhHbWbNemJArKYWt9tVquY+969tcY2jXTpfk7bfn2Tf/
	rxcQPhYSkQXGcV/3MkE6TMm3l8ixDBmpFHduRIdbsU7msCsQDBYj1mzSuUtLrXaTbBdOC/k5D/Sig
	1fXRmbAjTPqOb7B7kxkFe1mvZOgs8Fk9UrFmxthM60yJzW2wcLempERHtZYk07ntRvJFryhEdiB7c
	Dpy2D10e+SUoRcACiBhtiDZ7cgAB/gVAdz29ypn27l6eIEpv3EliIhCECDtWwAiCe7TTigjw+LVuW
	s69ihJiYYl4czIin5/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRq2r-00B92o-2G;
	Mon, 22 Jan 2024 08:52:41 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRq2m-00B91f-25
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 08:52:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so2907358f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 00:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705913554; x=1706518354; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kDgjWNmpHGcLjhWhbYgEl2BM2gqjNGoDHZlZQG5Aexw=;
        b=HQ0DvDDcqhxZMncGY84e8a5UVFmWFYO+fJqmETOLs7JX3xYOZ15CPfo5JXmxpGTsAk
         t64UvPbRNgF15fyvh8UsLVw7L9PBYRep16z0ScOi0sq8ItdtacGV6Zc13/di96R8kjcn
         XX+lJ0Y0Bx1H5hs/k7vVMnIRDLqahfZX+43UFsavxmjscLrat/kuf1ut19WPuMMDj61Y
         nowbq0pYds9ZN5jqbZPYzS3hPiO2RU7VwWgnwsiMHJZOrp0MFrr9jvEm0ZiboCN+ru3r
         vgw1in7LULkTKVKcHYKlLMqvb0FKBM/hAlUw/Kp+kh8s7VyzzfP1vqHzzJOcHYKI0nOz
         TY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705913554; x=1706518354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDgjWNmpHGcLjhWhbYgEl2BM2gqjNGoDHZlZQG5Aexw=;
        b=jj/vSI/dMNEOyiDLT6Hyrv+azKSDu4lx4n5SeqJs8GsbpL1IPSCaPj2R25bskoyJ3B
         E9v73ACstYAjIyrm/AoJQqs+EQYUpy82oCuo7j9v6fBdbBqbJXDGQcmkRMBiWVYwrfsg
         FNMTV2/uk7+Opa8wusAck6QycRAYlMABG08BY2DRNVozqDDiAAuJMbjadRcbNQFbofBC
         kv7JtNcwXxWkVz63QfKNDC3yUZC1yuhCqI+mb/n3o29kmseui7/zmy/kDebL7LeRp51F
         lxJ9VsfdDTv12AJnExAvfvUsgIHiIeBHAY3eRV9rKQTSR69ijLoN9XsCeFFFZI/7I/oP
         +dNA==
X-Gm-Message-State: AOJu0YyhtjPcwGrfK8iE9pTnXvJ+NKPsFt3vEnLIBerSpWMVf2ByPgEE
	tYV1mMIJMIqTHWzg805UiFhpKbnTEXXCk8u7aPLqaK9kC0WhRXCbSWuVwM/QQF0=
X-Google-Smtp-Source: AGHT+IHLi8v5vp+9OccJW5ihsH8HwK7pVU8S7xEx6MszBLdPgyWAl7kcOkj2bNJKF6wUT6V3XI5ylg==
X-Received: by 2002:a05:6000:1191:b0:337:c0f3:962b with SMTP id g17-20020a056000119100b00337c0f3962bmr2015519wrx.113.1705913554662;
        Mon, 22 Jan 2024 00:52:34 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a11-20020adfe5cb000000b00337d92e8b9csm9115501wrn.109.2024.01.22.00.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 00:52:34 -0800 (PST)
Date: Mon, 22 Jan 2024 09:52:33 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Erick Archer <erick.archer@gmx.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Charlie Jenkins <charlie@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] riscv: Use kcalloc() instead of kzalloc()
Message-ID: <20240122-7b031613b2ae1d7dfa1edfd7@orel>
References: <20240120135400.4710-1-erick.archer@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240120135400.4710-1-erick.archer@gmx.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_005236_684966_C0A16686 
X-CRM114-Status: GOOD (  20.78  )
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

On Sat, Jan 20, 2024 at 02:54:00PM +0100, Erick Archer wrote:
> As noted in the "Deprecated Interfaces, Language Features, Attributes,
> and Conventions" documentation [1], size calculations (especially
> multiplication) should not be performed in memory allocator (or similar)
> function arguments due to the risk of them overflowing. This could lead
> to values wrapping around and a smaller allocation being made than the
> caller was expecting. Using those allocations could lead to linear
> overflows of heap memory and other misbehaviors.
> 
> So, use the purpose specific kcalloc() function instead of the argument
> count * size in the kzalloc() function.
> 
> Also, it is preferred to use sizeof(*pointer) instead of sizeof(type)
> due to the type of the variable can change and one needs not change the
> former (unlike the latter).
> 
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/162
> Signed-off-by: Erick Archer <erick.archer@gmx.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 89920f84d0a3..549a76e34c4e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -901,8 +901,7 @@ static int check_unaligned_access_all_cpus(void)
>  {
>  	unsigned int cpu;
>  	unsigned int cpu_count = num_possible_cpus();
> -	struct page **bufs = kzalloc(cpu_count * sizeof(struct page *),
> -				     GFP_KERNEL);
> +	struct page **bufs = kcalloc(cpu_count, sizeof(*bufs), GFP_KERNEL);
> 
>  	if (!bufs) {
>  		pr_warn("Allocation failure, not measuring misaligned performance\n");
> --
> 2.25.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
