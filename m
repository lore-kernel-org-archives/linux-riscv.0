Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B8DC369AA
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 11:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfirhAEorHns/z6Ay+D+oIXDUbseYPbP2pYDG056wCk=; b=FMIHzAsXiCAXgd
	ZTfQVfYwlnvTMuGpD+zR/ivmPxlGZpLoezzsHEL4gbqwuyeeMymC6qJbxCFa8i8/yLuxMh65KLDXK
	Hb0XVT+Sy1tc+rcuVvh2G/4j/DLal15BM2uMH94Q06lZNJwRVtV2zDSj4lVw517Ml0LzTEd0eKaV/
	tV61EjeA/heRMnpYIUz2w6p3wjbb6UxO6rvclEMRFHT4nFAeCcKNtQYkyEbZs2UgHyysO3zMWUL4J
	B+FJ0kktJ5QKqn5xKygXKssbsT+KPwy0G/NqHI3P+lBFatNUju1gSR/HNMlrsO+Ty+wffRiT1svoO
	DpNknMCEMc2oNWFmmM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ptq-0000000ACuK-07qi;
	Thu, 10 Apr 2025 11:16:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2oTx-00000009zFr-2uRH
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 09:46:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cf861f936so956195e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 02:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744278360; x=1744883160; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8i8GZtfdY75DsuPGV8mdkCHtexeE8J8QTGC238f61s=;
        b=HH+7zRT1nRVY6B+7JYfZQ3P4TyRkWj8R6+M7+kUVsyg5Hj5BQszzY/G5n7b+QICVrv
         MIeRBLUZ0i+P6U/WvONU+GtcX43FsMlqRbDhzi505B/GDce9Rj5fUs3g6P1MXt7yTLCS
         5//BQPXAUuKbLPI326SRv69IWMf67rP9kj7jtkko0aBTZfG2P+id3B5J4dI7O1CiDKog
         rcHy8Qiy8YrgthnFFeCjCIgDFH7WdjkaRxcy/4XVnBzTUdpmLUlgWX07e2PiO1m/kAIZ
         3a3OgkcwkjLPa4nYZZDHG3tq4NF9ZxjVKtPJVkiVmpTxqI64DKZzcrNyJN4TPMUJzfiC
         FQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744278360; x=1744883160;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T8i8GZtfdY75DsuPGV8mdkCHtexeE8J8QTGC238f61s=;
        b=hsZbpZd9ZZzA6MyxXlC7auzvI9jChdSJ/e0qKs7CRg0whUnyzYTMm0/rszblAWazVX
         pq1xpKDTZw1KqdNZKWnI+N8wC0yvWxAwhoLjJhADt/RItVm2+kE8BP+b/mxLxopBeTnc
         Atee9d6Y7vCR1+PK4KC/GXzEMiOWig/L4lIAgtZJo21ZlUQfp+D9NhCpZGOvJn1ovMKU
         /SPO1UV3ksUByb3ynCs/5Ctlmqe+0uKwx9jTRlP1Ddf9SqFDO5Pk0smw5QZxcbqtyCm2
         KQoZKIY5K9qMArMqHW18BKb53qCIArf4IcTMGxWcsQi8KvENk6EkAGAdPkNSs4qgr52J
         6tnw==
X-Forwarded-Encrypted: i=1; AJvYcCU/B50LfgstjlU0WQZSUW91TtLTP39xYmpmxMan/JqQzULw8CeX9VTiwuOSEzcj4r4LJW719lVlA/h2Kg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVMRjFAQEkTvw8a7CG7ufzf5OaMhd5KM7GYK5toNZi0JQvHMzF
	pSBjAOheYBo6VDsNRoPmbkdrkN2BbJaxUl0Z86j1gF1lhNOgm4MfATBi1n4HF7o=
X-Gm-Gg: ASbGnctZQY1pKgoYeim2h19p1YbG7MEFasmp804OzKhXMLXzyQ7IBGT009YBFA4mDMb
	xtCGb17ve6b43lIX93vc3p9Se1k8ZTzBZNBzoGm9y/xwrPw1Sexqv3+MtHSuxtQLZhJqwbCJmWW
	RSSMxOKfPLAdRUlYEpMmpT51TnMl2NKYfq4FOY1pkV4CvCFHqSBcxn3ngumcb5nEA54BpPaLI+T
	B7cRpuvMWKNztvl4nUT3lQtHNitM5PcKaaeGtI1d/6Q2QnwV/JQwMwaaHjQWMD5YGFlTdlumpay
	tIMbWnhJOVTIRrzzf2kVvGDX/Pu3X0IMfkZOy7qb9PQkJIl0
X-Google-Smtp-Source: AGHT+IGtn4otBiHZ5rhpzGojxm7Tp3rcDjovrmZXPH6P8CvTrnSeGNCclbDgZlnTp+GpEEnuS4B3vQ==
X-Received: by 2002:a05:6000:430d:b0:39c:1258:32d4 with SMTP id ffacd0b85a97d-39d87ce1a29mr1909263f8f.16.1744278359773;
        Thu, 10 Apr 2025 02:45:59 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:7d22:13bb:e539:15ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893611dcsm4217671f8f.9.2025.04.10.02.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:45:59 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 10 Apr 2025 11:45:58 +0200
Message-Id: <D92V2NPNZYV0.136MJ2HOK48HE@ventanamicro.com>
Subject: Re: [PATCH v12 12/28] riscv: Implements arch agnostic shadow stack
 prctls
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "linux-riscv"
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
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-12-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-12-e51202b53138@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_024601_741508_8A10B005 
X-CRM114-Status: GOOD (  16.93  )
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

2025-03-14T14:39:31-07:00, Deepak Gupta <debug@rivosinc.com>:
> diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
> @@ -14,7 +15,8 @@ struct kernel_clone_args;
>  struct cfi_status {
>  	unsigned long ubcfi_en : 1; /* Enable for backward cfi. */
> -	unsigned long rsvd : ((sizeof(unsigned long) * 8) - 1);
> +	unsigned long ubcfi_locked : 1;
> +	unsigned long rsvd : ((sizeof(unsigned long) * 8) - 2);

The rsvd field shouldn't be necessary as the container for the bitfield
is 'unsigned long' sized.

Why don't we use bools here, though?
It might produce a better binary and we're not hurting for struct size.

> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
> @@ -24,6 +24,16 @@ bool is_shstk_enabled(struct task_struct *task)
> +bool is_shstk_allocated(struct task_struct *task)
> +{
> +	return task->thread_info.user_cfi_state.shdw_stk_base ? true : false;

I think that the following is clearer:

  return task->thread_info.user_cfi_state.shdw_stk_base

(Similar for all other implicit conversion ternaries.)

> @@ -42,6 +52,26 @@ void set_active_shstk(struct task_struct *task, unsigned long shstk_addr)
> +void set_shstk_status(struct task_struct *task, bool enable)
> +{
> +	if (!cpu_supports_shadow_stack())
> +		return;
> +
> +	task->thread_info.user_cfi_state.ubcfi_en = enable ? 1 : 0;
> +
> +	if (enable)
> +		task->thread.envcfg |= ENVCFG_SSE;
> +	else
> +		task->thread.envcfg &= ~ENVCFG_SSE;
> +
> +	csr_write(CSR_ENVCFG, task->thread.envcfg);

There is a new helper we could reuse for this:

  envcfg_update_bits(task, ENVCFG_SSE, enable ? ENVCFG_SSE : 0);

> +}
> @@ -262,3 +292,83 @@ void shstk_release(struct task_struct *tsk)
> +int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
> +{
> +	/* Request is to enable shadow stack and shadow stack is not enabled already */
> +	if (enable_shstk && !is_shstk_enabled(t)) {
> +		/* shadow stack was allocated and enable request again
> +		 * no need to support such usecase and return EINVAL.
> +		 */
> +		if (is_shstk_allocated(t))
> +			return -EINVAL;
> +
> +		size = calc_shstk_size(0);
> +		addr = allocate_shadow_stack(0, size, 0, false);

Why don't we use the userspace-allocated stack?

I'm completely missing the design idea here...  Userspace has absolute
over the shadow stack pointer CSR, so we don't need to do much in Linux:

1. interface to set up page tables with -W- PTE and
2. interface to control senvcfg.SSE.

Userspace can do the rest.

> +int arch_lock_shadow_stack_status(struct task_struct *task,
> +				  unsigned long arg)
> +{
> +	/* If shtstk not supported or not enabled on task, nothing to lock here */
> +	if (!cpu_supports_shadow_stack() ||
> +	    !is_shstk_enabled(task) || arg != 0)
> +		return -EINVAL;

The task might want to prevent shadow stack from being enabled?

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
