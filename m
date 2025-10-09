Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5885ACCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 06:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0xSgiCVjr/a0/KIC6SOvNSSr1SSOkLEHkSV33Hdo04=; b=DxhxBUwpwh+p4j
	Wg1FN2DZbhdAN91XWlt7EK56S5/gA9nhHHWRFMZsYv39ly9VZv5hp8mCfJOS3Qfq5A5RNcUKtkVGu
	ks8oTRnsLfLEaIxF0Pwk7+B1PiytujriupGvtKD79Ked4OP5QnLmaM4zMD6OZ4Czc5deVqa/03QhP
	B0YwbiQGV2c/sNGDIY4OKYxZZngJmMf+LVg/uiOCxErPvfSOzIUAWMcrxe/ZFamD+sExLEOchnZ+S
	pJpJ5UVORhbZ0TZizD811BU1hPd+wDns5TWMNKLfiSIhKW8r1IK/zVlIAVeJ87jX/gkVUPQufxrsq
	P9kRL/ie/NKFBulgtV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kR1-00000005IL6-3tZw;
	Thu, 09 Oct 2025 06:47:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kR0-00000005IKU-0VNf
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 06:47:31 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-46e32139ef7so1022975e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 23:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759992448; x=1760597248; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kX/2DcwJULxUzQnKC5hadF3mFu3a5RnnRgumV8iiFk=;
        b=C5aNzgqOlXxjfeZ1SBdiWbvnjz53lxHlLVScapLNgpvkXu1QKd4zGLLAGXm1Ka/ovH
         PfhObZlZJ5Giw+BSJ0Q8mOjI3+rbh1A1nd7SP5mv7yvPsNDb42EHOsWzt0Klgc9jtVHY
         NwomVB6mG3wOofaCHIXLK9XrNvkpY5xRpFXeVEEbmovqniU8yt3nzF/MxneJVVtgd4Cr
         nTsRLDo7XHsM7bEHklvu7nyEeHaEOVqY2PM8rijXeksOvCiB+YLBrUJ+IDqLhKEBXalk
         wi2znA13FyWRBXEVjwG006WlPWRCReWuL3Q8mxA8ISn5aYY1Gmi093n3NP8IRWLohoxq
         47eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759992448; x=1760597248;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4kX/2DcwJULxUzQnKC5hadF3mFu3a5RnnRgumV8iiFk=;
        b=wKlsfiCospwufUXNHkPav8GmojB65I5ch2WYnLorKnKhTPlHabNQI1PnQQNVQ5oXCp
         7AIxLxkN3PcoBH7APQ3qIIhBlAx7UmhPNiGyNbUwh+R0xrocEvPGPjlIS0NXrd2AWybx
         ZmR6dZf5WvzsDfpIW9b2OULItQ6dp+d6BTWKyFlABQ0zAWQ9VKwRKFDJWLO4cMqqc4Zb
         OQJoDWuh/Ytiz9u+88VvFHkizzCwm82N8Ik+c733osWYOuigmF8HBsnf/621aotHWgGd
         +fCXayntolo30mVPpbGCC0gqSxuZbCqiU4K4JngK8BCfblnfDnx9SjQD1uaaekYpHaj6
         TcgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT6m+KWHCsdoqH5JMV3meUYbrZ+SvRfE61O7u1BFU1lyeLqprIfRe204hFsDeGqhhQIhxfzap5/N1RTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDUmeSDRZiJN/QTQj9pNlvDKPzi3bo0920xkylx3uuTOXfotdc
	2gCTAsf9pFUR36jDYTMK12Tjz2wg6ZoVqQDc/jnfCAzxGsEihFzQpdJRtaSgq4/VF1k=
X-Gm-Gg: ASbGncvAMpMSkLoP+Fp1j6vTy5QGvlDc+tu8QpdDaS+45FH1/4xkBSfO2anF1QDR/Vq
	aI19yMqAcaReXdUGC2WRQ8UlSm7UycSgd/+RwrsjimkKlyyOEmw/WyenCeEuA4Npr/3niLxgV8K
	YmibrHD7w5rKt0AHLfkaGi23sOm4RZIjrqpqwOOYCYwiGdfKPav0ch6VA8gE/dmuwO9vMxr05xT
	UpbF0xm0pxzbTAPn013MOFXiQLWHnuEsUxwKe87PdfXIFVDA8PHawNrK6bF4FQln/QYVpwV7mQH
	Ra1ZvxytqIQw0C3+bjVtgW7R+5sXrZFYLGCrjk6j6k0TRssD06c1qlwJ1eeGF/Wi4uCZhouSCjR
	4epKyUqBT25BjTa1N4hdatBi4aaTZpArPrVwa6AWwPDJhdh3b
X-Google-Smtp-Source: AGHT+IERhG2czUcI/1bkhsjABOhRhpIpLRnFW9gDFTFnSV/gvPy8JtCf/9GIOjxDAvwaj+T5F6mmJw==
X-Received: by 2002:a05:600c:4707:b0:46e:4292:769b with SMTP id 5b1f17b1804b1-46fa9af990bmr23672735e9.4.1759992448349;
        Wed, 08 Oct 2025 23:47:28 -0700 (PDT)
Received: from localhost ([193.86.240.59])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8e97f0sm32843535f8f.27.2025.10.08.23.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 23:47:27 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 09 Oct 2025 08:47:27 +0200
Message-Id: <DDDL94HT7HYF.3VU2WQYU4WZY5@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v4 3/3] RISC-V: Add support for srmcfg CSR from Ssqosid
 ext
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Conor Dooley" <conor@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, =?utf-8?q?Kornel_Dul=C4=99ba?=
 <mindal@semihalf.com>, "Adrien Ricciardi" <aricciardi@baylibre.com>, "James
 Morse" <james.morse@arm.com>, "Atish Kumar Patra" <atishp@rivosinc.com>,
 "Atish Patra" <atish.patra@linux.dev>, "Vasudevan Srinivasan"
 <vasu@rivosinc.com>, "Conor Dooley" <conor.dooley@microchip.com>,
 <guo.wenjia23@zte.com.cn>, <liu.qingtao2@zte.com.cn>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Drew Fustini" <fustini@kernel.org>
References: <20251007-ssqosid-v4-0-e8b57e59d812@kernel.org>
 <20251007-ssqosid-v4-3-e8b57e59d812@kernel.org>
In-Reply-To: <20251007-ssqosid-v4-3-e8b57e59d812@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_234730_186784_587F35EF 
X-CRM114-Status: UNSURE (   6.64  )
X-CRM114-Notice: Please train this message.
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

2025-10-07T23:21:12-07:00, Drew Fustini <fustini@kernel.org>:
> diff --git a/arch/riscv/include/asm/qos.h b/arch/riscv/include/asm/qos.h
> +static inline void __switch_to_srmcfg(struct task_struct *next)
> +{
> +	u32 *cpu_srmcfg_ptr = this_cpu_ptr(&cpu_srmcfg);
> +	u32 thread_srmcfg;
> +
> +	thread_srmcfg = READ_ONCE(next->thread.srmcfg);
> +
> +	if (thread_srmcfg != *cpu_srmcfg_ptr) {

Wouldn't prev->thread.srmcfg have the value of CSR_SRMCFG when executing
switch_to?

Thanks.

> +		*cpu_srmcfg_ptr = thread_srmcfg;
> +		csr_write(CSR_SRMCFG, thread_srmcfg);
> +	}
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
