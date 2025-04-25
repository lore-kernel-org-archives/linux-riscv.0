Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9F7C369D3
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 15:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eqbl2d9YLf4VwZv0PwTPXs/5BVgmsR7cMPkrao/Dazs=; b=jDcZsmxap/rE6d
	CU6HpuHPIoq6UbgB396WswdRkqIT9BqQWUUHq/eeAQPofTFnb49vaMQkzq8ZfabkOmIGaUiMFbIOR
	LlDzN9DjCrn2G+ShfjVLwEMpf3HLMzr/B/rZ1ky5HZ7B8XvDucZmpZaMqZEM+MNjZWJ4Y0Ag/Ktkc
	QEd15PZ4EGSTXqHdM3tFyw0P9s6qALo+MOMiXTYVY/NpdGEknU81nWckt3NISdPdR958Tcp5NYXXP
	uZt6b2Udr+mSROq44xn3RATSKuSoqmFk4c/lvRTANo8l8FH5wErkXqrn/m2AGJFctETkF7w4jGj1O
	n77rtUI6lTBzBIh6T4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8L5B-0000000041Q-3JGs;
	Fri, 25 Apr 2025 15:35:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JRm-0000000HLWf-38KH
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 13:50:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso16087235e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 06:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745589029; x=1746193829; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUA/m6gOa249NNOmchovOHq5LELqOzlt/ubdwJUo+cU=;
        b=lUE+QO8QdSAbs0YucSWpoLu0Bn8qprjYgZx2jQjEFok/s/DkWnjr4OjAYUMY6cXNp9
         LFkD8PhyyshWuwsBgd96k39K4mBNPGWLKsoFSiDzUPnKVqBVANwbOcOO4G69T3Cd+xBF
         AlPKJph8CpxDkw/55HSiWF9yCPOZVExNvGfoxSxl7U/8zvb9EfP5uZ4n7vFR4GTrxfeO
         NSxw7kt92NiykhrGeEYdUM2OwSQXLqKLvlXyZ8pd433q+RFQ050RRozTJhlSH/pGMmAi
         yb0w2UezlErmQNzkEEFUnZeD8kMWLgiCH9xSgSHj0Rl4tHq+Jz68Zt6eCZW0rfDxFvTL
         R1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589029; x=1746193829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUA/m6gOa249NNOmchovOHq5LELqOzlt/ubdwJUo+cU=;
        b=lQaigKMwf7WIca62AIvYS4e5dB707+nMYv7kKEdKn44rPJvDPKUW1l0rL63waNp4ZZ
         ByhC0wqiklwooT0d37MbkAEJrZ398UgLrElwpvUOVtvAbF44Erjq7wGoNJIoEbBD6iCU
         SzHRBN5bMvslcPHr/mBYA75vasApTNUCZFv2oWmate6a3jZtifv5JxiobfStVEj2XBgQ
         Q6wyU5CHHeQ8MG+bJ1TR+M5Ftmo8qZskakxZm2+xXCOlxJUwrPJy78yK/TQDdDO9fqlj
         EsBU6Zz9B3e0LGQEeldSo3gLTtoMhLN4hEM7N8gPl5sBPbo6h48TvwJAjOEtG93TbaZw
         77nw==
X-Forwarded-Encrypted: i=1; AJvYcCVH7SXdo6fU1mpw3qKAnVrXl/XHqgYNGD9xr4iO7Lt0amezDo9ZbkqUTiZTMxykfALckUCUwVpm2WrxtA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBVtDz+C597m1WMNTXNIX+eNSB+yOZBMTWH8Fm426eGeXPIxLD
	YQXbwc+k9BL+oVTK3shRfJka7wiHIrtBdkRNW+BmEAw1umzFpzTEAy6F2ksG+4Y=
X-Gm-Gg: ASbGncvclGIXzAf5+/WqpdD6QK0wb8vWW4f6Jg0tcFEcQSlznbQ5GTHMV5tntW01s7z
	/WRI4wxOEtAYXLnqsu5QJkjv5uhLgHTpj/o/dQMPaAcRqhe7fs5qJPM0tVQjbmOVD57l5DtIVIO
	u4kqktU+fAr1kYoKJYHQf7CSfOSdnTrt3vNGURCbDXT48LQxtGvkY2tzTliCv5xd+Py8iZzXgM/
	vGIUNDYlA0MBTciSBdCu7PbNZnqSr8e5UaSidUv9QC329NsJd28kTyTuj+3fRyLpNp5M9rz1fWx
	RH83RM5dlDiagf/uMhTvidHY9iEB
X-Google-Smtp-Source: AGHT+IF/LMdkzYLBWPyT5ztxJyzb+GPhFh3GxsY5b8ixWQQMljvmNbliBGV7ZjWkl9GsiErnAoI9/g==
X-Received: by 2002:a05:600c:1f82:b0:43d:934:ea97 with SMTP id 5b1f17b1804b1-440a66ab23bmr18288315e9.27.1745589028834;
        Fri, 25 Apr 2025 06:50:28 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8cab5sm2480265f8f.10.2025.04.25.06.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:50:28 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:50:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] KVM: riscv: selftests: Add stval to exception
 handling
Message-ID: <20250425-dc44cb547ab5e2f994c94e80@orel>
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
 <20250324-kvm_selftest_improve-v1-1-583620219d4f@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250324-kvm_selftest_improve-v1-1-583620219d4f@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_065030_786340_9592C6DD 
X-CRM114-Status: GOOD (  17.34  )
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

On Mon, Mar 24, 2025 at 05:40:29PM -0700, Atish Patra wrote:
> Save stval during exception handling so that it can be decoded to
> figure out the details of exception type.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/include/riscv/processor.h | 1 +
>  tools/testing/selftests/kvm/lib/riscv/handlers.S      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 5f389166338c..f4a7d64fbe9a 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -95,6 +95,7 @@ struct ex_regs {
>  	unsigned long epc;
>  	unsigned long status;
>  	unsigned long cause;
> +	unsigned long stval;
>  };
>  
>  #define NR_VECTORS  2
> diff --git a/tools/testing/selftests/kvm/lib/riscv/handlers.S b/tools/testing/selftests/kvm/lib/riscv/handlers.S
> index aa0abd3f35bb..2884c1e8939b 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/handlers.S
> +++ b/tools/testing/selftests/kvm/lib/riscv/handlers.S
> @@ -45,9 +45,11 @@
>  	csrr  s0, CSR_SEPC
>  	csrr  s1, CSR_SSTATUS
>  	csrr  s2, CSR_SCAUSE
> +	csrr  s3, CSR_STVAL
>  	sd    s0, 248(sp)
>  	sd    s1, 256(sp)
>  	sd    s2, 264(sp)
> +	sd    s3, 272(sp)

We can't add stval without also changing how much stack we allocate at the
top of this macro, but since we need to keep sp 16-byte aligned in order
to call C code (route_exception()) we'll need to decrement -8*36, not
-8*35. Or, we could just switch struct ex_regs to be the kernel's struct
pt_regs which has 36 unsigned longs. The 'badaddr' member is for stval and
the additional long is orig_a0.

>  .endm
>  
>  .macro restore_context

I guess we should restore stval too.

Thanks,
drew

> 
> -- 
> 2.43.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
