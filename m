Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA71C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 11:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iu0RZDPBzWxTv+yiFbU/Oysdf2xHCbVH2abhNjZZB7Q=; b=NZnOgDWsDC6xD+
	7GIzePrD7spOxy4G6m1ajxK0CarRj/12GouEMGIR/uS7y3H2HInsnGvcy4ZRtl6rIX11FI7yyyQ/E
	gWXQzZFzBCVb54CG1oyVScFkrcQxbU4qfcx8L5hhdIJ9cl26OQyT9u8dD6+iAlnAIeWcDvIUtnamv
	y0e6TZsrKZG9SHurXL1iNH4OFMk5DRR7knL2QotO2dPtf2LuF/6jV9sUshOJHjORoxbQ7Uc76+9xq
	pVTjyEBLX3cJtqkthr8ZX53olC1mrZGlsDKQnZwbOhK6uh/jRFAzdJdhoeFXaTLYgjKCFrXOP1cud
	XMjjnqX4zpnGn+jO+cuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qAg-0000000AJeN-2jSK;
	Thu, 10 Apr 2025 11:34:14 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pi5-0000000AA2W-3XW2
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 11:04:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so928725e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 04:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744283080; x=1744887880; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwTqTcXuZVwmB1gK8gAQzMNft2dcqvTwt7yn+4sQNuo=;
        b=UFhkGG6hwgv87sAOrdJ6qXm4FQqVi0lXpCKbzw5g5fhOXss5vwYYgR5GMEJlJVr94D
         HYEGVeyND4l++4sqLPkpxVs1YEXVUXGMDZNdFo1DJ9sIPWxpdZMKjvmHg1FrVDQaEjxn
         tqgHs4g/E06tSS92ZLv32Lzl0ATsFR2rnIQdLkVTlqrcvRm4IrKOHcnQO9h2/tfK9ZuQ
         aTPhht3TegkPI92QFvX6JIcMDlWg9VM/bZhABm6nSddw/sUqtiUgA8tCZIXKzMeCxu1C
         30rs6cbA9ksVRh9peLDFclgJSwfhJ/EtIpjTfJhXWn/GREFFBQxXEawUMnpvDU4a1mcV
         fE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744283080; x=1744887880;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FwTqTcXuZVwmB1gK8gAQzMNft2dcqvTwt7yn+4sQNuo=;
        b=R4fiHSbB8VxVnvcu87/LzkweV295T7JrM+X5zGuOIL+0TaRMKh/1jBNpDOH6hdtEcB
         LTObuj/OtBRHvVt5MylS4uXUlmrrkmujAG9gjo4YxVY0hiu4eGJYKTONmuFtVkA5MmOx
         W88tiOfzpiTRn8e+ICj+/l2HCR7S16ajLA4H+4R3rYKz2KIiFCfL9p50Vm5nmcX23Skp
         ORXYMt14nGmc3oOZj7K5RrALuwWOKgxo2zSSSUommcsv6XfTIUkT04bOe1uCt+kDKunI
         qw3F5g6XkVTW1OqwSCGrBPlmdXx542m5xOrdGmEFMpcyl8ocThqgGAK5VIFwMnJk5107
         Aouw==
X-Forwarded-Encrypted: i=1; AJvYcCVMeieB1GWi+dYGnFC26IS8VPaZwHiZcpeNYpAeijCqjqG8gLTVAuyL/9KyFVDsXXneEn74orfZB9IpiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0XbGMN28r2v6zN9L+9DqcMBNrlYshjzE0djrDBZZDhRDFBjQq
	ZbaLLnEFrZFXLQ/RlFTUgCIcEsMqEv9oBuS10hfSMfLRadFsl0drjdVnfUFmT+o=
X-Gm-Gg: ASbGncvkER8gRSQ9LLNq07aebz0gppGF9Nm7JTw7UwaFB1NWJuuQ5GG9vkLRNvwEwWm
	Wohl7EkFjmCLl2eU+PzgL8GljuSEVogeFpYTwjfITmRjbqrMm00Terki++efETJir7LFr51o2BS
	zwevUaTkhw+0VfvAtevpdG/aV1wtNhuAW+lAMc9nbYx3qrlMRgMMWDK3YQdD727Ier8lM9fuaH1
	gmg9COBMEh4EyBsPYhtFhOfZDf7TXETrFpLmiMd5qP5wBvC/nys2NnShulq16X8E16/jGF7//QN
	tmqKDsc+fjXd1vfSR5FykIYewnQpWHv5UehrvHiV8HxZzLVV
X-Google-Smtp-Source: AGHT+IFTHVjvMm7SI9zG+YTo6xP+VuwjrIfNbL14H9cY5sGUQSewGH6hwjaZZsvjM4ZfhfO2SM4RNA==
X-Received: by 2002:a05:6000:18ac:b0:39c:13fa:3e0 with SMTP id ffacd0b85a97d-39d87adcd02mr1983393f8f.9.1744283080239;
        Thu, 10 Apr 2025 04:04:40 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:7d22:13bb:e539:15ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d89361186sm4476526f8f.14.2025.04.10.04.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 04:04:39 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 10 Apr 2025 13:04:39 +0200
Message-Id: <D92WQWAUQYY4.2ED8JAFBDHGRN@ventanamicro.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "Zong Li"
 <zong.li@sifive.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov"
 <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Arnd Bergmann"
 <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>, "Eric Biederman"
 <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann Horn"
 <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v12 05/28] riscv: usercfi state for task and
 save/restore of CSR_SSP on trap entry/exit
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-5-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-5-e51202b53138@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_040441_886337_23AC9055 
X-CRM114-Status: GOOD (  12.09  )
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

2025-03-14T14:39:24-07:00, Deepak Gupta <debug@rivosinc.com>:
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> @@ -62,6 +62,9 @@ struct thread_info {
>  	long			user_sp;	/* User stack pointer */
>  	int			cpu;
>  	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
> +#ifdef CONFIG_RISCV_USER_CFI
> +	struct cfi_status	user_cfi_state;
> +#endif

I don't think it makes sense to put all the data in thread_info.
kernel_ssp and user_ssp is more than enough and the rest can comfortably
live elsewhere in task_struct.

thread_info is supposed to be as small as possible -- just spanning
multiple cache-lines could be noticeable.

> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> @@ -147,6 +147,20 @@ SYM_CODE_START(handle_exception)
>  
>  	REG_L s0, TASK_TI_USER_SP(tp)
>  	csrrc s1, CSR_STATUS, t0
> +	/*
> +	 * If previous mode was U, capture shadow stack pointer and save it away
> +	 * Zero CSR_SSP at the same time for sanitization.
> +	 */
> +	ALTERNATIVE("nop; nop; nop; nop",
> +				__stringify(			\
> +				andi s2, s1, SR_SPP;	\
> +				bnez s2, skip_ssp_save;	\
> +				csrrw s2, CSR_SSP, x0;	\
> +				REG_S s2, TASK_TI_USER_SSP(tp); \
> +				skip_ssp_save:),
> +				0,
> +				RISCV_ISA_EXT_ZICFISS,
> +				CONFIG_RISCV_USER_CFI)

(I'd prefer this closer to the user_sp and kernel_sp swap, it's breaking
 the flow here.  We also already know if we've returned from userspace
 or not even without SR_SPP, but reusing the information might tangle
 the logic.)

>  	csrr s2, CSR_EPC
>  	csrr s3, CSR_TVAL
>  	csrr s4, CSR_CAUSE
> @@ -236,6 +250,18 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
>  	csrw CSR_SCRATCH, tp
> +
> +	/*
> +	 * Going back to U mode, restore shadow stack pointer
> +	 */

Are we?  I think we can be just as well returning back to kernel-space.
Similar to how we can enter the exception handler from kernel-space.

> +	ALTERNATIVE("nop; nop",
> +				__stringify(					\
> +				REG_L s3, TASK_TI_USER_SSP(tp); \
> +				csrw CSR_SSP, s3),
> +				0,
> +				RISCV_ISA_EXT_ZICFISS,
> +				CONFIG_RISCV_USER_CFI)
> +

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
