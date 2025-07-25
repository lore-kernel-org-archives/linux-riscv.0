Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21398C83F26
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 06:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ye4ycuvVJ/3nVVI+BC6lbAktSi41qnVQx4CY9Pm5VI=; b=A6JQqWWRyTHhHW
	D4Z8fu7KeP1/zvxfCswunq7jBfDAoAoDcF7Kn8by2mLa8dICOYvli+uYncz73Ft5SCXukL6ZdFS4p
	sU6JwQDfMOq5aXlGDKt8PBuE6vEyRUoCnf4QVmOyHrhOOVAn1HJRmBLurwODOonUXNllWEdvJWYJL
	OAlHnie7KlG5mKg/4cxLVhQemsZmLXZauP6o5w70Wc0myj9gZoA5CFYWMYYHoEitVUj3xaxejzX8I
	fWLe3qtaVcsbRdkeCPDrHybTTLmI/TLdpCOsNJa4Or3hK1mEjp3Hv198iyec1PMZFf0xyfjco7WOx
	MxXXlkV5nOPNbeA4W4Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCHN-00000009C6Y-0ksK;
	Fri, 25 Jul 2025 06:51:41 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufC08-00000009AjP-3syl
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 06:33:54 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 360783F803
	for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 06:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753425231;
	bh=AcnKBfE2a+S1VW5IMnseKsBzXFCCOskdFvDUc4TUQMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=BNHB4G1p6AwvuX8eQB5UkxJQBT0dBt1rnZHoImQ/fW555vDDFtnCog9LE0qGLXn4A
	 un+4Rx6f1YQgKJle2wzM3Bum2cGpqK1Wh+eWR9BTPao0UHDRPT0x8DtC5OLKheX1If
	 TYHsNPVe18TL3M7zMIRwoM8FO4p+J0gUfyWdvUZ4zTZYcoDaG+rK579Mnna1KS6yRQ
	 XDzdL2Ee4ePlJrYGLdPjgX+Yb+gMPheH4OY0sM6HvP1+UBco9CNcNEE7N5L5ldtH8l
	 zvNA6yAv9BN/vuQYOUzQrw36SpjjlawVgJGsKorqww65N6kIFxsO1jz5OHcWtEFykf
	 SL/l+OSTPNtSQ==
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4ff581df3so865574f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 23:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753425230; x=1754030030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AcnKBfE2a+S1VW5IMnseKsBzXFCCOskdFvDUc4TUQMs=;
        b=mjmDkGFyiWVbyA/2IeUpbKWPRhDnRjhyvfI3t1Yjh1qQgJzhyBlWBkHqD8KE2EGmK0
         U6qkcBlS8GBVIUzmDJ5tykSLxLSsiIYHJV75YRaCfQaMveyE4OgMcgr+HzAnpIZzt7S+
         C+TA0NMT3KBmAjnGLkPLbzTHaktObXEsfV8x8URrdvgyieI1HHeWvtazyLTKtXr11fjC
         Ngm8HiJ5/3RvbV3THfZbg/18oRwxOSVkMPkS0wxfUeFiJNbRfgvUZnCGu/Lah8ZVsaqW
         RsteFwNEXEddbTCbIUw2Q5OsUv/5qfagdLYvJXZogZf8itCxSfMkkb8U59LKhP7HZEmM
         BWNw==
X-Gm-Message-State: AOJu0YxxmPvgC4ElHz4wKs4C1fY8gO0Eze3UHzThFMa4AyIMLe5OewEo
	I7fgFDYksjdM7V6aelJNewJneZG9ho5RBKufrC12YoKYMGhCjDrK2HxVWqZ1cTfq2QEqbD4OYYD
	BjBgNsQhY78bYPut34cEDBUvrRRnpAIshkinUfKt4spM/rclXVkoIunVGWoBWn7bZtol3OJ/PvU
	aieGAyr0QdTg==
X-Gm-Gg: ASbGncu3EU9c9dptJww2Z3rQM0MVffQKAvSy5xXNPSYIyI85dcduqplXvyktumTk1r/
	Qc9zxZe7expn+FC7fy++q7uk1claAKE9xlK051wf8wAZI6uOIh8r/f+ktS0S/Z6gcU4i5fxXJFK
	yIbxMP6h0bHwoWO04vGvdXngvN/dAQDtAqg2Dq16fJAlOlC8LjQ24jE91RhsWGU/BxguJpqIMZr
	YoX/MutdCUAwFLv8L3D9WV9PuLqh+AG3lXCq6Ni3k2fuXNWMtfLfE/dM6b5HUnlj+Ex/t2/JFEM
	7+GweOIaYFxjLD4r2RyZdmtwMiP4u/QJy6B1d9EcpKNf2LDaAbH5jfN6JlJ6SjpHNmBHcvBmNBE
	NAajqgV7/V+YV+RSzfvVOm3kQ1nLf5pcjsKNq
X-Received: by 2002:a05:6000:2c0d:b0:3a5:7895:7f6b with SMTP id ffacd0b85a97d-3b7765ecfd6mr508086f8f.7.1753425230186;
        Thu, 24 Jul 2025 23:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF33NxRWxXDTDDBoqgqdvHkBJufwM8gnuJUTxJTRNJxH7wzbKZ2u1yPOgBX88LofGXQiRQPhA==
X-Received: by 2002:a05:6000:2c0d:b0:3a5:7895:7f6b with SMTP id ffacd0b85a97d-3b7765ecfd6mr508059f8f.7.1753425229758;
        Thu, 24 Jul 2025 23:33:49 -0700 (PDT)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcc3429sm4041277f8f.75.2025.07.24.23.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 23:33:48 -0700 (PDT)
Message-ID: <1149732f-bc8d-4339-90c3-e34aeac9f1be@canonical.com>
Date: Fri, 25 Jul 2025 08:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] riscv: enable landing pad enforcement
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com,
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com,
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com,
 andrew@sifive.com, ved@rivosinc.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-5-04b8fa44c98c@rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250724-riscv_kcfi-v1-5-04b8fa44c98c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_233353_231086_D6BDEA17 
X-CRM114-Status: GOOD (  13.99  )
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

On 25.07.25 01:36, Deepak Gupta wrote:
> Enables landing pad enforcement by invoking a SBI FWFT call.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>   arch/riscv/kernel/asm-offsets.c |  1 +
>   arch/riscv/kernel/head.S        | 19 +++++++++++++++++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index e4d55126dc3e..e6a9fad86fae 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -536,6 +536,7 @@ void asm_offsets(void)
>   	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
>   	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
>   	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
> +	DEFINE(SBI_FWFT_LANDING_PAD, SBI_FWFT_LANDING_PAD);
>   	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
>   #endif
>   }
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 9c99c5ad6fe8..59af044bf85c 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -185,6 +185,16 @@ secondary_start_sbi:
>   1:
>   #endif
>   	scs_load_current
> +
> +#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
> +	li a7, SBI_EXT_FWFT
> +	li a6, SBI_EXT_FWFT_SET
> +	li a0, SBI_FWFT_LANDING_PAD
> +	li a1, 1 /* enable landing pad for supervisor */
> +	li a2, SBI_FWFT_SET_FLAG_LOCK
> +	ecall	/* check for error condition and take appropriate action */
> +#endif
> +
>   	call smp_callin
>   #endif /* CONFIG_SMP */
>   
> @@ -359,6 +369,15 @@ SYM_CODE_START(_start_kernel)
>   #endif
>   	scs_load_current
>   
> +#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
> +	li a7, SBI_EXT_FWFT
> +	li a6, SBI_EXT_FWFT_SET
> +	li a0, SBI_FWFT_LANDING_PAD
> +	li a1, 1 /* enable landing pad for supervisor */

The SBI specification calls BIT(0) "LOCK".
Shouldn't we define a constant for the lock bit instead of using a magic 
value?

Best regards

Heinrich

> +	li a2, SBI_FWFT_SET_FLAG_LOCK
> +	ecall	/* check for error condition and take appropriate action */
> +#endif
> +
>   #ifdef CONFIG_KASAN
>   	call kasan_early_init
>   #endif
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
