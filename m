Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F253C4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 12:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTaYEW4DOJKzTPDbvGbvNZslfstiSmSRiMOmDQUZ9/U=; b=uNxPJ0HUCTseTB
	MyRivHTzu74ppWVKzQ/YdTZd0PbF2O4PCaHGDx+Vp1EYA5HOrD56giHsbP6rftCPrhXPiQqdIN6jG
	A49Ou4AyB87o5MbzBRVT1ukJAdZhoXGbmFMcLcYXG2j4R7jnlZP2bcJUYDLvQ8a9iRsLVnKoAcQNN
	bH5JR46ib+gomaf9Y0yJUJCvhv7mmN/Kmk0wnC7GO91fquI1duzkBa8dEXQPi3DCpKr5zKzSnrRSa
	9CjCAAShLltGjAGVBTVOCJYIGT5RxogELXc6UAhv3HHcCNJf/xflQPYkKMSrKKo3MI5K/b1t9VL65
	C64vj7+47wMvnQwq/vYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtJ7-00C4n0-1h;
	Mon, 22 Jan 2024 12:21:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtJ3-00C4jh-2e
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 12:21:40 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-337cf4ac600so2897084f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 04:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705926095; x=1706530895; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pNyn/qnqC01DO5aYO0gaP3LnuG+kGrelMJHPp637j+Q=;
        b=EjuO5natrfsgux0c9ClrWh4vDJAAuuAeYEX4GasZgT2+k9dTFozI6FxvEFngzbR6Eh
         GKZvSY2MiiS+TvqAbzlk50bnkZS2Ak2850oXE6sTrxEYA+BZu+TjWFcCltNcOQJ62Fa+
         Tx22e1B1YhcjagHiLYTeYXMq2xIISpLENE81tW9hZZWRN2uqQIhxZxCefAIRqNJwLYXf
         nMJMr/qFZCwV2nIv0u7i1h6Wc/7gB3sPP0ktp0bPuLnTe0nCG8QEF6+6edOTWSjAeAho
         ECPjNSNzvt03jBb69Ae7XYZOAh7zfOdtQO6kNTxVW4+am/nmRGqaaKaLxSaS3w1VwdkB
         Eo0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705926095; x=1706530895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNyn/qnqC01DO5aYO0gaP3LnuG+kGrelMJHPp637j+Q=;
        b=WS7f2+rWOnNKotRiysvffF1vUi7N/AwxUg8olxWOZZ0eUuKiqSY2G7JwBLe5YmfCoa
         vpdkAK+4k3md+zEgIW8TIv3CW0aJvC7jw4GAiD7Uc5QhINzVooAgKdgSDsdhhGcDf5Ss
         H1rqEhgI5DjW8t7UxrUanlA6/xVDuQuAuKM0PK1T0okTpm1FHhQ+cCk4y1mpfBbVUAhH
         wqTxTaFAHOHBxnPbuBA2jyEEXWfno+xyEDg6jBVyO8py9P8j0SyevrOaysyIoCgOskdy
         7u2z3q2dv/VhyybZfGLWa6D88T++Bo0y5geSsaJ63IjoYB05FkrTtn9XELxd0siwtSgk
         7q6Q==
X-Gm-Message-State: AOJu0YycD4z5gYoS6ORUCR2OuG0QB6VXuCntkCeWnn9utuEmlXLUZsJy
	luXfJI7C5cYpKu2OgLo0c2gnh0o2uUXDr3LhGHQ/IoouKKyOgZCZod1gZd2v/NY=
X-Google-Smtp-Source: AGHT+IGjstD5P6UroceP4UshiLynFM2AqV73RXt9NzLqzEsWwmxRvB3J0Fsa/nFM64CECZlIeo29pg==
X-Received: by 2002:a5d:44ce:0:b0:337:c538:6db with SMTP id z14-20020a5d44ce000000b00337c53806dbmr1979837wrr.2.1705926095352;
        Mon, 22 Jan 2024 04:21:35 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id bw12-20020a0560001f8c00b00337cef427f8sm11306084wrb.70.2024.01.22.04.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 04:21:34 -0800 (PST)
Date: Mon, 22 Jan 2024 13:21:33 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	wchen <waylingii@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Samuel Holland <samuel@sholland.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Minda Chen <minda.chen@starfivetech.com>, Sean Christopherson <seanjc@google.com>, 
	Peter Xu <peterx@redhat.com>, Like Xu <likexu@tencent.com>, Vipin Sharma <vipinsh@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Thomas Huth <thuth@redhat.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v5 02/12] KVM: arm64: selftests: Data type cleanup for
 arch_timer test
Message-ID: <20240122-0ddedacdeb64808477a7911d@orel>
References: <cover.1705916069.git.haibo1.xu@intel.com>
 <173c9b64c4c43cd585f6b177a7d434dcedc905fa.1705916069.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <173c9b64c4c43cd585f6b177a7d434dcedc905fa.1705916069.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_042137_862012_715E9FB3 
X-CRM114-Status: GOOD (  16.34  )
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

On Mon, Jan 22, 2024 at 05:58:32PM +0800, Haibo Xu wrote:
> Change signed type to unsigned in test_args struct which
> only make sense for unsigned value.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/aarch64/arch_timer.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/aarch64/arch_timer.c b/tools/testing/selftests/kvm/aarch64/arch_timer.c
> index 274b8465b42a..3260fefcc1b3 100644
> --- a/tools/testing/selftests/kvm/aarch64/arch_timer.c
> +++ b/tools/testing/selftests/kvm/aarch64/arch_timer.c
> @@ -42,10 +42,10 @@
>  #define TIMER_TEST_MIGRATION_FREQ_MS	2
>  
>  struct test_args {
> -	int nr_vcpus;
> -	int nr_iter;
> -	int timer_period_ms;
> -	int migration_freq_ms;
> +	uint32_t nr_vcpus;
> +	uint32_t nr_iter;
> +	uint32_t timer_period_ms;
> +	uint32_t migration_freq_ms;
>  	struct kvm_arm_counter_offset offset;
>  };
>  
> @@ -57,7 +57,7 @@ static struct test_args test_args = {
>  	.offset = { .reserved = 1 },
>  };
>  
> -#define msecs_to_usecs(msec)		((msec) * 1000LL)
> +#define msecs_to_usecs(msec)		((msec) * 1000ULL)
>  
>  #define GICD_BASE_GPA			0x8000000ULL
>  #define GICR_BASE_GPA			0x80A0000ULL
> @@ -72,7 +72,7 @@ enum guest_stage {
>  
>  /* Shared variables between host and guest */
>  struct test_vcpu_shared_data {
> -	int nr_iter;
> +	uint32_t nr_iter;
>  	enum guest_stage guest_stage;
>  	uint64_t xcnt;
>  };
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
