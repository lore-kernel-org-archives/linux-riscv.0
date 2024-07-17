Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1D3C3DA59
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 02:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubTQhTEcYwA9XvPXYCbj/ypJexZQK4nFJP/MeAHtVgc=; b=On8P/GoCk+agQ3
	RqMmX9NMeuGmNcyXHtnDtvM28hCJ7Dwe3x8e5d4rHLs0r3xrb6H9vHYajFNdGbSoFTe2T4SxM10Iu
	wZztCkncnG6HmYGQnHUu01l+n9B5i0tCrQWuqDN4a3ZfRtliZ5VzvnhPzUBq1gxm64tUA6bXtD9Gm
	XhV7/Tow5+Aop1VUTUr7CAkWtYbTKHfrnB3ij1DFrdXxq9aJ9uHlmUeavGogY/iCR6KMOfUaoOF+0
	VJ1ykCfNHksNrb6CrZCwD7zGGwNOBlDS1Ss3YiFcFmJ7ie1txJ5Ewgem/KZkee5+NNvq4BDLpZp18
	pmL1SjF2rThYrX+OPjaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTu2s-0000000CKGJ-3JOB;
	Wed, 17 Jul 2024 02:05:30 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTu2W-0000000CK91-4AND
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 02:05:10 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-70b42250526so4690200b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 19:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721181908; x=1721786708; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8QRegxtd6+FgIkF6diGK9DWIR0YDnVslVz04u7ogUM=;
        b=E96BtvkICgmd1MkCA5yJ+JNi9Bqya0l9o49l7c0GdZ8tE1NtOLS5ihyVyC1XWyKSZf
         gRiv3RyQ+ZAywl8W+CO2aRcrWjnxpPpdeZlM2hbHRE2m3sHa1WM5SSwDJhnLJ3agCFXu
         T1ksqNZVx1sVB7ZQ5oqxpJ8murIGKK1gyF8S25LUG5T5hJatmCWUOjNm0fZ2EHHuNOmI
         CYM6Op1Cc9jVT+dDmrjaWLDjUkJmBkj+yi028B9JF1pLcP58goM1TxhcNe/8AJA+r3xv
         aBznj8Q2+AtI4GFDtq2Sr1wxiEffZomTGC2L6rt2mdoZ02NHA5WY83zALLL9QUu3ALZ9
         Ho5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721181908; x=1721786708;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i8QRegxtd6+FgIkF6diGK9DWIR0YDnVslVz04u7ogUM=;
        b=ZcVi2SVt1pWsjlEavRs3/yfA6kLaHsTZlgTlzOWumM0TznGFZUNx3kQ5xmkOEjOmun
         HSpVMVJs7hzby8ZMoZln8IM2oYFol1XSR4epAOHMf019+d7O5zm8y2hSLqsFjV1aDc6g
         mRFDgF9UUfDYMzKKJKRcSvMJ/5i/AKxIfjjbqtPr1kNVr0eNs/FK5W25qbBqlG7iO/4t
         JLXskoo3gXHlhtyQkByYE7k3HUzxsMO2Rj7p7myC2tf2HT+9yPx/RZikRCzuBrvObojx
         s/JIVqx3MGlrWm/z/DGb4byK+LBaw0d42wy/IXm7b+56B/rJx0hsRICK6IHmBpm8DyoM
         NDlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXvs/XlvYBBnNBFnADPwAYuJnsHdntVQyqoazLYITY3ktAi/lSw1/M/GP6GbG31ayCK+iMjpiYe+GKhVgaTJm6vEE3AzHNpA+5Rgym6k9h
X-Gm-Message-State: AOJu0Ywf1YlnfqxkD7ovCubA0yQDn4tiAsqd4USkqgY/0Mzqgbk2Qt45
	8vxO7GJHElZCeJsWZrcPG8TkF/wNFLn/G3sl+DLIy74EydiheaBB1oZQF1shE3Q=
X-Google-Smtp-Source: AGHT+IE2KzNPcTth+gMo267NV2Jd+oHot7f6l6m3xb5YAhTJAAFsLZacsEiGAChpR0B8dRp+Zw50zg==
X-Received: by 2002:a05:6a21:710a:b0:1c2:8e3f:a49 with SMTP id adf61e73a8af0-1c3fdcc006fmr450858637.3.1721181907982;
        Tue, 16 Jul 2024 19:05:07 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:8470:4ae3:bddc:48f7:36a0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2caedbf733esm7067534a91.20.2024.07.16.19.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 19:05:07 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Andrew Morton
 <akpm@linux-foundation.org>,  Marc Zyngier <maz@kernel.org>,  Oliver Upton
 <oliver.upton@linux.dev>,  James Morse <james.morse@arm.com>,  Suzuki K
 Poulose <suzuki.poulose@arm.com>,  Arnd Bergmann <arnd@arndb.de>,  Oleg
 Nesterov <oleg@redhat.com>,  Eric Biederman <ebiederm@xmission.com>,
  Shuah Khan <shuah@kernel.org>,  "Rick P. Edgecombe"
 <rick.p.edgecombe@intel.com>,  Deepak Gupta <debug@rivosinc.com>,  Ard
 Biesheuvel <ardb@kernel.org>,  Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
  Kees Cook <kees@kernel.org>,  "H.J. Lu" <hjl.tools@gmail.com>,  Paul
 Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Florian Weimer <fweimer@redhat.com>,
  Christian Brauner <brauner@kernel.org>,  Ross Burton
 <ross.burton@arm.com>,  linux-arm-kernel@lists.infradead.org,
  linux-doc@vger.kernel.org,  kvmarm@lists.linux.dev,
  linux-fsdevel@vger.kernel.org,  linux-arch@vger.kernel.org,
  linux-mm@kvack.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 20/39] arm64/gcs: Ensure that new threads have a GCS
In-Reply-To: <20240625-arm64-gcs-v9-20-0f634469b8f0@kernel.org> (Mark Brown's
	message of "Tue, 25 Jun 2024 15:57:48 +0100")
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
	<20240625-arm64-gcs-v9-20-0f634469b8f0@kernel.org>
Date: Tue, 16 Jul 2024 23:05:04 -0300
Message-ID: <87bk2wu627.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_190509_249245_74C7DB66 
X-CRM114-Status: GOOD (  14.59  )
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

Mark Brown <broonie@kernel.org> writes:

> diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
> index b0a67efc522b..4a3ce8e3bdfb 100644
> --- a/arch/arm64/mm/gcs.c
> +++ b/arch/arm64/mm/gcs.c
> @@ -8,6 +8,139 @@
>  #include <asm/cpufeature.h>
>  #include <asm/page.h>
>  
> +static unsigned long alloc_gcs(unsigned long addr, unsigned long size,
> +			       unsigned long token_offset, bool set_res_tok)

The token_offset and set_res_tok arguments aren't used in this function,
so they can be removed.

> +{
> +	int flags = MAP_ANONYMOUS | MAP_PRIVATE;
> +	struct mm_struct *mm = current->mm;
> +	unsigned long mapped_addr, unused;
> +
> +	if (addr)
> +		flags |= MAP_FIXED_NOREPLACE;
> +
> +	mmap_write_lock(mm);
> +	mapped_addr = do_mmap(NULL, addr, size, PROT_READ | PROT_WRITE, flags,
> +			      VM_SHADOW_STACK, 0, &unused, NULL);
> +	mmap_write_unlock(mm);
> +
> +	return mapped_addr;
> +}
> +
> +static unsigned long gcs_size(unsigned long size)
> +{
> +	if (size)
> +		return PAGE_ALIGN(size);
> +
> +	/* Allocate RLIMIT_STACK/2 with limits of PAGE_SIZE..2G */
> +	size = PAGE_ALIGN(min_t(unsigned long long,
> +				rlimit(RLIMIT_STACK) / 2, SZ_2G));
> +	return max(PAGE_SIZE, size);
> +}
> +
> +static bool gcs_consume_token(struct mm_struct *mm, unsigned long user_addr)
> +{
> +	u64 expected = GCS_CAP(user_addr);
> +	u64 val;
> +	int ret;
> +
> +	/* This should really be an atomic cpmxchg.  It is not. */

s/cpmxchg/cmpxchg/

The same typo is also in arch/x86/kernel/shstk.c, from the "fork:
Support shadow stacks in clone3()" patch series.

> +	ret = access_remote_vm(mm, user_addr, &val, sizeof(val),
> +			       FOLL_FORCE);
> +	if (ret != sizeof(val))
> +		return false;
> +
> +	if (val != expected)
> +		return false;
> +
> +	val = 0;
> +	ret = access_remote_vm(mm, user_addr, &val, sizeof(val),
> +			       FOLL_FORCE | FOLL_WRITE);
> +	if (ret != sizeof(val))
> +		return false;
> +
> +	return true;
> +}

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
