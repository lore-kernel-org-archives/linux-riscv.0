Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E73BCDB46B
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 06:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqD1hh9kOEl7UYCDV86EuZ2EmpGbCaBldaK1UkU0Phg=; b=a+LCPvCVfW1Fa3
	/lh4+escVmjDeF3tScPdRzkMUbJSVh8DDqx8heJiYKqc7rEt+sQ4vrlq5eTcIl899KqKiobqyJZ6n
	JgenSWXaN2/yEwhMlvJxnrD8Oh1qy6lCOkxl0t/bLGFZ207k5TWgJEoiQmgOL2+Yh7nMJ2pxBMOnh
	pnQ1Q7pNzzurps64SyZN1n46Hq8lf9QoW0gZ58m5bxaGbwihDSbU9ia8ljP4jyx3kCl1BveRlVZjt
	mVCgb6Bk+yfYroNzUX3INOewHNsJY4q3hmGgF9vzGMX3HB32k9BwuMUmGCOR+B3nat8LZGionvfwA
	3q9fFEjn3tgxab+iugcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYMQ-00000004UYv-2hKz;
	Mon, 22 Jun 2026 06:42:22 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYMN-00000004UXw-2k67
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 06:42:21 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1390f75d8bbso2413791c88.0
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jun 2026 23:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782110539; x=1782715339; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QILN8DTARoWh3OJ/o4dcikoIv6aHuZ0kwC7cM2/BMRM=;
        b=coemxZpM5nOJ55aei8jMOqXGEDwFToFEJFxymNqQRQiQnlJ8U0a9MqETUktXDcoO/j
         HsCxLltVHhL9dtKi+t5CgcdUtbvFOHEn3VfOA8VewH9+/IHqsf5HJPyZAORu6ezdUcAa
         ZNEkUfSKyCxMQBRU2SRwNDN8KDdpK7YNZ6FYTJF+eU6A2Y1Rcah+oQeHkWbl1Mwd2ibd
         eRl7XloYjlk0dIdQKcmKs4Ml2J8Bi4wKYfDhrJIJ5QXOoCMFJB6P82njxGHIRzuFNEPF
         g09srwJghrd3iSzYAvHi9/1s+iKLiz72GH0D6ZRVro1UMlCOim4d5HEteDvzyucPxR5o
         jwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110539; x=1782715339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QILN8DTARoWh3OJ/o4dcikoIv6aHuZ0kwC7cM2/BMRM=;
        b=DB1ZhbAm9/eYDTgd0mQubc+G96C0vW7Oa/DL73HDipj2iNCb6jnQKPEdXvqyYqQzKl
         cWDodQECpmlVm+bgQW1heEqElbTME0M28HIFpiiQj9N5ZRhFjxom9B4NYwo5y+gj8LlU
         XAKuEJVYWj652FKbEcTtqKmIMrQlOtyHqFZj9f6Xa7SfCLP8CUfkLsVti+/rmTsRmnlH
         eo+fCVxfdrVrf0IVGAS/EYUFN5j0UCI0X6PB/W64McbB31fB9iUrYipyqJ309j7nDyCl
         4pEQAhvSVilPFrtglqT8nfUrk5jn+8rwlxFnrOks17C9Qj4KP3leZW6xXVTcke05XsBJ
         NOjw==
X-Forwarded-Encrypted: i=1; AFNElJ+txq/NKljPNgtg/0Byo+x4MNxSb+KHYVf+8tyySni3boz8nIc+9Bc1u9AgvuXLkua3ikWmTDdmVBS0ng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4TjUdVpsAVc5KjWcYMCrtEfz3Oec72TWrj1jVmiUF33Xqdw+I
	171wcv/6zbIzm7TIoEzB/Ov0so85SFv84CLFZ7dY92SpwYm1XMeEx4Hn
X-Gm-Gg: AfdE7ckW0b87SLka+dH5/O2zyKHTQUEqyo30cTCo0Rfyhfg8+FhRWHdgIF49XtWuzTU
	TXOY2Ec/RhSGRwLznGvnZtRUEWe5StyJ+QCk6OMznoAfONEVpuOVAFkSrwOHZhlXcOu9KtLo8O6
	zXG1PFVon/8t+7SJD8oHTe+0RmFiAxjZ6egY7ZIc4uYslIHoMp14nu1TgloDxQvclO2TdNlV8xs
	Erjdd+TyXIwai8tyKl8VD77LBpE7KwrAsfsJoFof8dQE5cqkz7zo4FTrFslwscfjA5yCXmcW2c6
	h1iFoq8j2Rxyc6bm3mrjWRPpg6453Jatj3dYhhJo16QZ93RkOyUSjnWiXVHG6OHdWg3IuV6Vmpx
	qBlS+Mz0uyVSpZzaEYf6BfHC+zAWB+5s9HYRffy4feLOq3k6pbxRrtWgkjwqxUlQevaWtYxzj/I
	Gz
X-Received: by 2002:a05:7022:6890:b0:138:4023:8c1 with SMTP id a92af1059eb24-139a4eca6f2mr7435550c88.11.1782110538606;
        Sun, 21 Jun 2026 23:42:18 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adc0fdb6sm6363664c88.0.2026.06.21.23.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:42:18 -0700 (PDT)
Date: Sun, 21 Jun 2026 23:42:15 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anup Patel <anup@brainfault.org>,
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ian Rogers <irogers@google.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 04/21] RISC-V: Define indirect CSR access helpers
Message-ID: <ajjZR-R11yPYWuDp@blinky>
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
 <20260608-counter_delegation-v6-4-285b72ed65a9@meta.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608-counter_delegation-v6-4-285b72ed65a9@meta.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_234219_723227_17233855 
X-CRM114-Status: GOOD (  19.05  )
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

On Mon, Jun 08, 2026 at 11:01:18PM -0700, Atish Patra wrote:
> From: Atish Patra <atishp@rivosinc.com>
> 
> The indriect CSR requires multiple instructions to read/write CSR.

indirect

> Add a few helper functions for ease of usage.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr_ind.h | 44 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr_ind.h b/arch/riscv/include/asm/csr_ind.h
> new file mode 100644
> index 000000000000..6fd7d44dc640
> --- /dev/null
> +++ b/arch/riscv/include/asm/csr_ind.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024 Rivos Inc.

I don't think it makes sense to introduce this copyright in new commits.

- Charlie

> + */
> +
> +#ifndef _ASM_RISCV_CSR_IND_H
> +#define _ASM_RISCV_CSR_IND_H
> +
> +#include <linux/irqflags.h>
> +
> +#include <asm/csr.h>
> +
> +#define csr_ind_read(iregcsr, iselbase, iseloff) ({		\
> +	unsigned long __value = 0;				\
> +	unsigned long __flags;					\
> +	local_irq_save(__flags);				\
> +	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
> +	__value = csr_read(iregcsr);				\
> +	local_irq_restore(__flags);				\
> +	__value;						\
> +})
> +
> +#define csr_ind_write(iregcsr, iselbase, iseloff, value) ({	\
> +	unsigned long __flags;					\
> +	local_irq_save(__flags);				\
> +	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
> +	csr_write(iregcsr, (value));				\
> +	local_irq_restore(__flags);				\
> +})
> +
> +#define csr_ind_warl(iregcsr, iselbase, iseloff, warl_val) ({	\
> +	unsigned long __old_val = 0, __value = 0;		\
> +	unsigned long __flags;					\
> +	local_irq_save(__flags);				\
> +	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
> +	__old_val = csr_read(iregcsr);				\
> +	csr_write(iregcsr, (warl_val));				\
> +	__value = csr_read(iregcsr);				\
> +	csr_write(iregcsr, __old_val);				\
> +	local_irq_restore(__flags);				\
> +	__value;						\
> +})
> +
> +#endif
> 
> -- 
> 2.53.0-Meta
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
