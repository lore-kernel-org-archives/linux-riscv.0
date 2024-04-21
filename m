Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FFFC4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 21:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvvXAYnAq9lupBjFlKCTJOmBNqX84tZInjCu4K5QtuU=; b=bR6alMBgu1L3Oq
	JumvLwzIF102akIb1OQnbVV1+mQ8op2ezvSgCBRvA2mi1xjqVc/gZ+4Dq3L42QjQ8DnWUG49C3qw6
	y4ZGzeX2F2YXvAdACdzd4Or1+7reHETFhPnmBuRhZVBwA+wH67MlWQ+VdI49RtYpMVapdkPgVPLCA
	9H6H9n/oNAprroS40eTWg4gEvWvF31eafZgflFGoWKr22E6C5SNU2S3Ai9vLQG+cUAZx/BjiLcGg8
	uEIziWyOdizag+7is+9mbk8Q2cDrJf4Yb1FImmdnsS/QEtbIyXbW51Z3Giqun+32I5wB5TnvlhM3J
	rWr9KiOssBstCaYqBYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryeYa-0000000BJjM-01Yf;
	Sun, 21 Apr 2024 21:17:04 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryeYW-0000000BJiG-0mfx;
	Sun, 21 Apr 2024 21:17:02 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-343e46ec237so3129687f8f.2;
        Sun, 21 Apr 2024 14:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713734213; x=1714339013; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C3XD0aGyobZQu9vXJb1rWcoNhZJ6ku9NSVnNpSmzHD8=;
        b=MjVUwMACgjM2VQoB6IM8A+IU3FNb3xZ0qM4zJgpuoA7RHcWMtduPrQlP+Nnq5RWNRg
         RFefqrnkyh8y9hfnabJ2raHrogb33vzy0hZMK5HukeDhTigr5efkOt8Z6S8wbBPb1iSt
         HexcgYiPdMAVVEBj0Zi8IhCcgCYSt7V2OVrqN+9h5lXhaX86Hr5Yli5vaI1GTpcMKvzK
         kSYFvfkuetrjf0fK+NQLAByYmd1XINo0apytD8r72tyW7uP5r/Hj4MRCtG14ECqwj4d2
         MZAFFFsM2o7sEpyBEv4FIJiCFAFI9ZfsCdtQpkYPm4nbFLmIWuupHL18B6m8ODhAYh0p
         B4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713734213; x=1714339013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3XD0aGyobZQu9vXJb1rWcoNhZJ6ku9NSVnNpSmzHD8=;
        b=jfCwJTMwE1nPtoEjs1/DZL2M+mRCPPWZguDJx+iwknzv/KjJ7PKktElh3fktpgQUAr
         veopUUgQyxcLDZC+vzcvk8Uuqn7UVsZkGy3hpvN0+dIa2DkkqnmZ7NmVPOvaUJ3HIhzK
         kuzBv8pIiP4OgkHES7WgzHmC8sofsnAliOCYeA3PawgGLz81u7EK5kltOiT3bPdLzlnE
         dufjKZOjHFXHJCMmQmpWlSEh+56js5gB+zmYGurQwytXt9H8XMPBgo092psBYiMy1H+Z
         fBHvquojpmjhHhuyWTExWrAQ5yhgj2oimGKavsFCfiYdwPvRrI4k8gQ42OJqd+yeFqnS
         jq8w==
X-Forwarded-Encrypted: i=1; AJvYcCU02Pnmg3q9uIqqERk4pVj0UQkS6RulhgS24MrUBId7rS9d/pTW9VN2x34OsrognSW5K+RPuGat8b9dyjHQjiL95VaCliKj+Vl/pbK1lw==
X-Gm-Message-State: AOJu0Ywfn8POVlQSG+Z9N1YTGz41sedlH66Ut4VEeNuBashX7cunOSgv
	HvwErNKbAqhO6v/Z2Z1/Y5xqC3t7F3U2iz8h6JYw/RGH6cMD493m
X-Google-Smtp-Source: AGHT+IHDnjdZhBKZ/N8qotjF8wfVr8PE8appA8t34tqhSKSbaxo3xaKZxkRcR1Kc49r1HaArvS4mCg==
X-Received: by 2002:a5d:59a8:0:b0:343:7b6b:dcc6 with SMTP id p8-20020a5d59a8000000b003437b6bdcc6mr7249290wrr.30.1713734212622;
        Sun, 21 Apr 2024 14:16:52 -0700 (PDT)
Received: from andrea ([31.189.47.123])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d67cc000000b0034a51283404sm7734635wrw.72.2024.04.21.14.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 14:16:52 -0700 (PDT)
Date: Sun, 21 Apr 2024 23:16:47 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, anup@brainfault.org,
	atishp@atishpatra.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	christoph.muellner@vrull.eu, heiko@sntech.de, charlie@rivosinc.com,
	David.Laight@aculab.com, luxu.kernel@bytedance.com
Subject: Re: [PATCH v2 3/6] riscv: Add Zawrs support for spinlocks
Message-ID: <ZiWCP6f6zZ3dKXfN@andrea>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-11-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240419135321.70781-11-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_141700_334592_E60D00C1 
X-CRM114-Status: GOOD (  19.84  )
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

On Fri, Apr 19, 2024 at 03:53:25PM +0200, Andrew Jones wrote:
> From: Christoph M??llner <christoph.muellner@vrull.eu>
> 
> RISC-V code uses the generic ticket lock implementation, which calls
> the macros smp_cond_load_relaxed() and smp_cond_load_acquire().
> Introduce a RISC-V specific implementation of smp_cond_load_relaxed()
> which applies WRS.NTO of the Zawrs extension in order to reduce power
> consumption while waiting and allows hypervisors to enable guests to
> trap while waiting. smp_cond_load_acquire() doesn't need a RISC-V
> specific implementation as the generic implementation is based on
> smp_cond_load_relaxed() and smp_acquire__after_ctrl_dep() sufficiently
> provides the acquire semantics.
> 
> This implementation is heavily based on Arm's approach which is the
> approach Andrea Parri also suggested.
> 
> The Zawrs specification can be found here:
> https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
> 
> Signed-off-by: Christoph M??llner <christoph.muellner@vrull.eu>
> Co-developed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig                | 13 ++++++++
>  arch/riscv/include/asm/barrier.h  | 45 ++++++++++++++++++---------
>  arch/riscv/include/asm/cmpxchg.h  | 51 +++++++++++++++++++++++++++++++
>  arch/riscv/include/asm/hwcap.h    |  1 +
>  arch/riscv/include/asm/insn-def.h |  2 ++
>  arch/riscv/kernel/cpufeature.c    |  1 +
>  6 files changed, 98 insertions(+), 15 deletions(-)

Doesn't apply to riscv/for-next (due to, AFAIU,

  https://lore.kernel.org/all/171275883330.18495.10110341843571163280.git-patchwork-notify@kernel.org/ ).

But other than that, this LGTM.  One nit below.


> -#define __smp_store_release(p, v)					\
> -do {									\
> -	compiletime_assert_atomic_type(*p);				\
> -	RISCV_FENCE(rw, w);						\
> -	WRITE_ONCE(*p, v);						\
> -} while (0)
> -
> -#define __smp_load_acquire(p)						\
> -({									\
> -	typeof(*p) ___p1 = READ_ONCE(*p);				\
> -	compiletime_assert_atomic_type(*p);				\
> -	RISCV_FENCE(r, rw);						\
> -	___p1;								\
> -})
> -
>  /*
>   * This is a very specific barrier: it's currently only used in two places in
>   * the kernel, both in the scheduler.  See include/linux/spinlock.h for the two
> @@ -70,6 +56,35 @@ do {									\
>   */
>  #define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
>  
> +#define __smp_store_release(p, v)					\
> +do {									\
> +	compiletime_assert_atomic_type(*p);				\
> +	RISCV_FENCE(rw, w);						\
> +	WRITE_ONCE(*p, v);						\
> +} while (0)
> +
> +#define __smp_load_acquire(p)						\
> +({									\
> +	typeof(*p) ___p1 = READ_ONCE(*p);				\
> +	compiletime_assert_atomic_type(*p);				\
> +	RISCV_FENCE(r, rw);						\
> +	___p1;								\
> +})

Unrelated/unmotivated changes.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
