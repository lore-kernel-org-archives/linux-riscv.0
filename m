Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14831C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AK3e3pO2MEfBCkLQUz4ixKRgGHgAQPqmt3GqZFrSpCo=; b=UzzbalnQaLMVqC
	HGHoauvg4Kst5+ZKIZZqTFavyr2NasBzWXYagCt8Sb4r5HQq4u4s0PpO0N0Bw3s4MB5mgUrFBmavw
	qLaU+gVvll2uq2yuq3DmeAA8WpWx2AsHD2HfTVzFH6o8eBMZX7VZJDR/1q2c9PfrAJvKQ7TaNZlIy
	41kR3zRjH4UxTceWt0Id9K6f28sqiY07liwcT3hLbYGlxAagQuDCABVyrruOfEGdIz4ThCCs1I1Aq
	pXkJogYw/0/H1W34Svvgs4gBs6CoaloAUKzICEFNPIMAayn7QFKUe5/0+wtCm0gCVnAiZ6XohTPzy
	GbctZ0WjU7BHZcPL9nyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZA1w-00000001Pw6-0kN2;
	Wed, 31 Jul 2024 14:10:16 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZA1s-00000001PuY-28GT
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 14:10:14 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a7aada2358fso172788266b.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722435010; x=1723039810; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gqyqw/nHSlejBJnG1P+gVR7MBqt6hfQ4M9UtXPV7Jj8=;
        b=jQ17SYJJIFY5vTGMLCVoxroUK2oxH49whCTxdV+qn5YGd3m9r9Z97TuJTBFOm9JO7J
         qItcH6NZOpEPV+xRS4Xb0OU9LDMPZulWIwyA6M2XLC1hre8IXZyjLb0MMhptKGs9ftPa
         FGkjAro6xYdxYyLWOWp04HbSLOU+f8lYou4acTgQZygeGTGsXRuh9o3bk0jghgOCShkG
         qrdwjkeJO/IJRaukMOoIW3XFXe5x6rCKcJGKoVAQXB5m5tBcpyUZ0D7kbXDfPDZ6UgqQ
         AtXoRg/772un6eE6c4KngE8IKzSkQps4dIJKqCRY1Rk7pChAwWByQaFlJKd82vJh73MQ
         xskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722435010; x=1723039810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqyqw/nHSlejBJnG1P+gVR7MBqt6hfQ4M9UtXPV7Jj8=;
        b=bz/kywStchQQwTvkFj1A2o3pXb8ZRW+gu9VgQyJJgscMdIsWU4HIZ75lepL8bUBkjh
         JN+mMmDX2B4plKV+sZMr1AnivhqPe88Jmj5LVWXFArL9aa7thGhJ2XPfww4vrxF4PKB+
         uWWaJr9w34MZ9gt9/igO6W3ID6I/ucia4ZcJOn8+4txFUeMDEAiCFNX8JMYTr/os2V6c
         Y+NL41Nxon86sSXUnJQuqX8tLVmY2YfbuxPf71XJSNi9eClvgpcxn2kd882UELQdUKwJ
         fD0kKTEE1WDddzCPv8AEKmbf12X4bFvZoy1ZC3Q/vYGxerCm2oSIEN3eZL0JqmzaAe1m
         p+AQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+pzM8JlAuQVFwGaKhDNlptqIjnCV1Toiq5XZYpCiZESqqam/TOQtCFBCNFdZF61ApvULxecB8j+RiPJBYJ8xwDfnV9sWZ1s+45fE23Nqh
X-Gm-Message-State: AOJu0Yys19zx4PvmT+dtY2Pdg3HuxTNVMqpzlAEdglFmMiyIqqhXj2Q3
	IQf9Ia4521FU6BpFDd4et1VO400y+toh77YpXm2DKtKW6x3ZgwSXP7YndBZfXYE=
X-Google-Smtp-Source: AGHT+IF2QCYCUqjPekfpSqYJ4AImkm365cVwJfODis1nmhKBhNr8Twq9mBAr+HyjSZ/Z5pxT2z9Qdg==
X-Received: by 2002:a17:907:60cb:b0:a7d:88c4:2897 with SMTP id a640c23a62f3a-a7d88c437b8mr345160666b.2.1722435009133;
        Wed, 31 Jul 2024 07:10:09 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad416basm772297966b.104.2024.07.31.07.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 07:10:08 -0700 (PDT)
Date: Wed, 31 Jul 2024 16:10:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 02/13] riscv: Do not fail to build on byte/halfword
 operations with Zawrs
Message-ID: <20240731-56ba72420d7f745dacb66fd8@orel>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240731072405.197046-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_071012_555695_28519187 
X-CRM114-Status: GOOD (  24.07  )
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

On Wed, Jul 31, 2024 at 09:23:54AM GMT, Alexandre Ghiti wrote:
> riscv does not have lr instructions on byte and halfword but the
> qspinlock implementation actually uses such atomics provided by the
> Zabha extension, so those sizes are legitimate.

We currently always come to __cmpwait() through smp_cond_load_relaxed()
and queued_spin_lock_slowpath() adds another invocation. However, isn't
the reason we're hitting the BUILD_BUG() because the switch fails to find
a case for 16, not because it fails to find cases for 1 or 2? The new
invocation passes a pointer to a struct mcs_spinlock, which looks like
it has size 16. We need to ensure that when ptr points to a pointer that
we pass the size of uintptr_t.

> 
> Then instead of failing to build, just fallback to the !Zawrs path.

No matter what sizes we're failing on, if we do this then
queued_spin_lock_slowpath() won't be able to take advantage of Zawrs.

Thanks,
drew

> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index ebbce134917c..9ba497ea18a5 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -268,7 +268,8 @@ static __always_inline void __cmpwait(volatile void *ptr,
>  		break;
>  #endif
>  	default:
> -		BUILD_BUG();
> +		/* RISC-V doesn't have lr instructions on byte and half-word. */
> +		goto no_zawrs;
>  	}
>  
>  	return;
> -- 
> 2.39.2
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
