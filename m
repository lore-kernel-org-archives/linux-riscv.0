Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D5CC54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 08:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kMvDY8Cj6XKlLEDKFa8ip5KWu7L8woG6RSu3ywZpkAY=; b=x7eB6Zu6Wkq2DT
	deQ1iYShMwcJGt34VE9283mtkih/2eR5Ss2pN7DlRGcn4zI3miZhaeV7ya9q3sjaIPO8VWMq+8M8/
	GiQI55oO+UoXCn0FSI2pw2KLVTt4x5GGLD1NVaP4YBKGbhdBuhxBruKh8fBqDf7C70vDjAfHrH16V
	S83419QpKSksSEJGeU567TWIQfz/GW4R7xGWgCd6P7tf/vrBmE/AeZ5aKUlZsEwz/OHk6outzIwiJ
	vm++vZ/QfQE0Y0laSJl7UUHyJpTKPoGOTcRhqNagm7kLxfjP/NF1jckNYLFVUDmDCmfqc0mB+KSDA
	qYg2CJEsOfAxdpu1J8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkJwO-00000009Kmb-1kRU;
	Wed, 13 Mar 2024 08:26:24 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkJwK-00000009KjD-3kty
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 08:26:23 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a28a6cef709so735680066b.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 01:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1710318373; x=1710923173; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hri4+azNxswF/lCLy2l2dIDWQtsRG26PT3v1sxIitRA=;
        b=HWnCb+crkNAWTAV4mE0UyBtI6fDsFXgDxA/CxwNw/mnd5xHHZfpGlmafrhyxVzKKoU
         XUi4UAm2Nfqjr4cw1PoQL+j1SiU8rQFUGMyk8dwhIJrpTEgWYb7u13BOua8IWoP/Ytoh
         zhmnDXlSE3Oj4T4fTGzSlMZb/hfDmPCzGXhzRzPK0hnZp/s8+vfUQpGjMQTPLlgZdTJa
         M/D+86+xKBAnqctiF5vAoR9FQiAw/ykDKBPk8mUMxDAvNk8i8aUS0fZkk6WcwIs1XnjX
         xjC5yUnjCpR/07G+vvN+bFrDphcud406vbnjCJtzTA5HVCl7PmByN0PsO92OpD57jCqm
         8ZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710318373; x=1710923173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hri4+azNxswF/lCLy2l2dIDWQtsRG26PT3v1sxIitRA=;
        b=wZxb1IS8ukxbsNQE7kb+CYRrEB9O3qAoVsnxNIRbyXC9g9XovH4E/Z23GxVy778BPg
         /M++8Uc//ak8KBIXPfRUd9XfE9NgIRUCQ+EvE7Q0ea64NSGqee6Y17GpEX+Z0OcURATa
         GJ2Qybk7TrwiKX94pB3LneFcSZQoisMolTy9O+taotevzPj+H78pTtbtBvqTNPemJWse
         zPM7jnEAccVspNCa/VVfHpyLarN6hx/5aGwqtQLmjW2fvteRsuYNegY3CGMw/RRYNRyL
         qKW6GDovhEMJVcNPSmAl6phUkh+x30kGkxY73wqF4ya5J1cExpcG7a36at5om1f/dDGY
         IF4w==
X-Forwarded-Encrypted: i=1; AJvYcCW8oOun02AnBsBFWslKabuFQw8Ij0Q/XFuDVe/GoN5KSdYtDlX8ZbvQ8oqjMLIoCnCk5Adma5e9HbineruPRU4j/4AOOc2b7b7fKjw20bVk
X-Gm-Message-State: AOJu0Yz4LD4C9OJAkkn+R2cSYArmFmBa1qPiGRh8+eQfgRk9j5nvXpW8
	ssYrMEpAD/GFhIHiu1Xjx41mlvIp0LNFHkpEjyrXlrPAxGKW6GMqse/2dr+u3qs=
X-Google-Smtp-Source: AGHT+IHtxiEmmNAi5sUeGu3QBF2Eg4/lY2B9EQqXkzMSK0yhddDBx1+t4mL7MGc44NoiNyNet13ZOw==
X-Received: by 2002:a17:906:bf4a:b0:a45:bf67:bab2 with SMTP id ps10-20020a170906bf4a00b00a45bf67bab2mr8170186ejb.59.1710318373006;
        Wed, 13 Mar 2024 01:26:13 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id gq14-20020a170906e24e00b00a3d2d81daafsm4686757ejb.172.2024.03.13.01.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 01:26:11 -0700 (PDT)
Date: Wed, 13 Mar 2024 09:26:10 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Add tracepoints for SBI calls and returns
Message-ID: <20240313-d0cf274ace35c0f54c66f7fa@orel>
References: <20240312212441.2322765-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240312212441.2322765-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_012621_287710_103EDB5B 
X-CRM114-Status: GOOD (  20.43  )
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

On Tue, Mar 12, 2024 at 02:23:34PM -0700, Samuel Holland wrote:
> These are useful for measuring the latency of SBI calls. The SBI HSM
> extension is excluded because those functions are called from contexts
> such as cpuidle where instrumentation is not allowed.

Thanks for this. These will be nice to have.

> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/riscv/include/asm/trace.h | 60 ++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/sbi.c        |  7 ++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 arch/riscv/include/asm/trace.h
> 
> diff --git a/arch/riscv/include/asm/trace.h b/arch/riscv/include/asm/trace.h
> new file mode 100644
> index 000000000000..f96091f83c25
> --- /dev/null
> +++ b/arch/riscv/include/asm/trace.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM riscv
> +
> +#if !defined(_TRACE_RISCV_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_RISCV_H
> +
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT_CONDITION(sbi_call,
> +
> +	TP_PROTO(int ext, int fid),
> +
> +	TP_ARGS(ext, fid),
> +
> +	TP_CONDITION(ext != SBI_EXT_HSM),

nit: Can we remove the three blank lines above?

TRACE_EVENT_CONDITION(sbi_call,
     TP_PROTO(int ext, int fid),
     TP_ARGS(ext, fid),
     TP_CONDITION(ext != SBI_EXT_HSM),

> +
> +	TP_STRUCT__entry(
> +		__field(int, ext)
> +		__field(int, fid)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->ext = ext;
> +		__entry->fid = fid;
> +	),
> +
> +	TP_printk("ext=0x%x fid=%d", __entry->ext, __entry->fid)
> +);
> +
> +TRACE_EVENT_CONDITION(sbi_return,
> +
> +	TP_PROTO(int ext, long error, long value),
> +
> +	TP_ARGS(ext, error, value),
> +
> +	TP_CONDITION(ext != SBI_EXT_HSM),

Same nit as above.

> +
> +	TP_STRUCT__entry(
> +		__field(long, error)
> +		__field(long, value)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->error = error;
> +		__entry->value = value;
> +	),
> +
> +	TP_printk("error=%ld value=0x%lx", __entry->error, __entry->value)
> +);
> +
> +#endif /* _TRACE_RISCV_H */
> +
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +
> +#define TRACE_INCLUDE_PATH asm
> +#define TRACE_INCLUDE_FILE trace
> +
> +#include <trace/define_trace.h>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index e66e0999a800..a1d21d8f5293 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -14,6 +14,9 @@
>  #include <asm/smp.h>
>  #include <asm/tlbflush.h>
>  
> +#define CREATE_TRACE_POINTS
> +#include <asm/trace.h>
> +
>  /* default SBI version is 0.1 */
>  unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
>  EXPORT_SYMBOL(sbi_spec_version);
> @@ -31,6 +34,8 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  {
>  	struct sbiret ret;
>  
> +	trace_sbi_call(ext, fid);
> +
>  	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
>  	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
>  	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
> @@ -46,6 +51,8 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  	ret.error = a0;
>  	ret.value = a1;
>  
> +	trace_sbi_return(ext, ret.error, ret.value);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL(sbi_ecall);
> -- 
> 2.43.1
>

Other than the blank line nits,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
