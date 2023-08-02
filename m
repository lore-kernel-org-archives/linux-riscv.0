Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB6EC04A94
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 09:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilTtAch3nEpINrzlKVdVHg4V2mummq1mWWdObIOJ+OU=; b=HbwPCgXqEjsl7T
	QBOletXVHVee3J6V6tIJGMVFD2z01wffhEjQd9x+x693b81w4RYbm8QKmw8Cp1RBS2pMS+evd2R33
	mhiD3M58iEWcF0H78K2l19KaLCgH3rwpvMcSnbRs8mSq+iEtzYMSpqCset3Udcgw2jojvYF68Mv1G
	GdSomsxg+G+RztI3JSblFsX6sArCC8GBl67WUj6VKcDTpkByJEYQcFkQ0MFQwbC/LvoQN8dMCZoEK
	736jrcvnBokUxKtjBJx2/eOYG1Wd9IvlB9tZAqGf3Tg94IWLw1j2IDr72RuEJj6LVMR/BuvwHsH2s
	XHA9855RUs5p57LgujiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR8AM-004TnP-2T;
	Wed, 02 Aug 2023 09:29:14 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR8AJ-004TmF-23
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 09:29:13 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5222b917e0cso9573977a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 02:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690968550; x=1691573350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CEvdWKJwrirYDhttDd02rTV33tBJG9g5L+9AxNoea3M=;
        b=WgRojBwticTI7tlGP4WhwryjFIOTSb45MoUr2Xomsnj5dZNimXNpbmwdtt7+Je4qpn
         TomUFaMgXy0jF9o3axmIL0HPy8hlV/4x5aXy3r2c9bn6YJ4Hg7Y3TQJOh9mvhHpCkZF8
         7ecMIM/3KehtF2nSe519/VXcRJJFE9OgiygnF2jZAItbssoFLRktIhrcyO3vZ6DDgpdV
         dZ6Egnhrxr0Ai+PK8gXu4AFGUD8fO+2tjft3pOngaYXwvwcqHQnUS0k7z43PXF3UlNDS
         DnjnF9Id5ixdw5KIBQOPhR5RtIGtjK2hpEWreQ9AW+PUrojmjfUTyccBFY2LjXFzMA12
         1DPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690968550; x=1691573350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEvdWKJwrirYDhttDd02rTV33tBJG9g5L+9AxNoea3M=;
        b=YuXrfW0fuBHg2UsPXVKKElmj/AeYO1cEJL52svn47NO6Z9vVa1lphWu1c0DKysYa6R
         SOjS0uaiC52fZJOCBnkFZnWduo9GZwS7Kg9EmXt1mvvMRU1+PxQki37ffZm9aAuS6YlY
         sdTsOAWF2odPZokcqAGVl3LGZkhBuIhcLyd6vURZFs/IoPfqOGeeDsmz1HpuiKWC27cM
         EGMJKUOMrJKMfn8fkT5lMMSRKvMhLakrG+yTtVMhOb+T15YCVCQy3sTRIQKoywMxet6Z
         79R0B246e6P97cSR2da5cY0hM+eUMa5rcRhXeLQHV39yfl7EHcccm3IBHAYy/OxYnhFW
         m1Bg==
X-Gm-Message-State: ABy/qLa9M+UOCyNWF3knmRuD0ln/km7RjjBQ5pURDIx4h4zMJjhZVUJI
	Y12O0/h52KmTr1SztOZ+XR2+0A==
X-Google-Smtp-Source: APBJJlFoWQnCKbhEbTUrZCJqYYVW6s4vDSWfgPkrwNS0ATxL1doB6I6qe6yB2sD40AZ6C/w2onWycw==
X-Received: by 2002:a17:906:305b:b0:99b:cb78:8537 with SMTP id d27-20020a170906305b00b0099bcb788537mr4084494ejd.11.1690968549860;
        Wed, 02 Aug 2023 02:29:09 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id um6-20020a170906cf8600b009930c61dc0esm8823130ejb.92.2023.08.02.02.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 02:29:09 -0700 (PDT)
Date: Wed, 2 Aug 2023 12:29:05 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, =?utf-8?B?UsOpbWk=?= Denis-Courmont <remi@remlab.net>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v6 09/10] tools: lib: perf: Implement riscv mmap support
Message-ID: <20230802-11f1b3d1ff4cc987bb58bfa4@orel>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
 <20230802080328.1213905-10-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802080328.1213905-10-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_022911_681913_106A915A 
X-CRM114-Status: GOOD (  23.21  )
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

On Wed, Aug 02, 2023 at 10:03:27AM +0200, Alexandre Ghiti wrote:
> riscv now supports mmaping hardware counters so add what's needed to
> take advantage of that in libperf.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/lib/perf/mmap.c | 66 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/tools/lib/perf/mmap.c b/tools/lib/perf/mmap.c
> index 0d1634cedf44..2184814b37dd 100644
> --- a/tools/lib/perf/mmap.c
> +++ b/tools/lib/perf/mmap.c
> @@ -392,6 +392,72 @@ static u64 read_perf_counter(unsigned int counter)
>  
>  static u64 read_timestamp(void) { return read_sysreg(cntvct_el0); }
>  
> +/* __riscv_xlen contains the witdh of the native base integer, here 64-bit */
> +#elif defined(__riscv) && __riscv_xlen == 64
> +
> +/* TODO: implement rv32 support */

It'd be easy to implement the rv32 support now (even if it's premature for
use), in order to avoid the TODO (which will likely be forgotten). I think
we just need to drop the __riscv_xlen == 64 above and then extend the
csr_read() macro something like the untested code below. (I'm not sure if
a TODO or premature, likely untested, code is worse though.)

> +
> +#define CSR_CYCLE	0xc00
> +#define CSR_TIME	0xc01
> +
> +#define csr_read(csr)						\
> +({								\

u64 __value;

> +	register unsigned long __v;				\
> +		__asm__ __volatile__ ("csrr %0, %1"		\
> +		 : "=r" (__v)					\
> +		 : "i" (csr) : );				\

__value = __v;

#if __riscv_xlen == 32
{
  int csrh = (csr) - CSR_CYCLE + CSR_CYCLEH;

  __asm__ __volatile__ ("csrr %0, %1" : "=r" (__v) : "i" (csrh));
  __value |= (u64)__v << 32;
}
#endif

__value;

> +})
> +
> +static unsigned long csr_read_num(int csr_num)

static u64 csr_read_num(int csr_num)

> +{
> +#define switchcase_csr_read(__csr_num, __val)           {\
> +	case __csr_num:                                 \
> +		__val = csr_read(__csr_num);            \
> +		break; }
> +#define switchcase_csr_read_2(__csr_num, __val)         {\
> +	switchcase_csr_read(__csr_num + 0, __val)        \
> +	switchcase_csr_read(__csr_num + 1, __val)}
> +#define switchcase_csr_read_4(__csr_num, __val)         {\
> +	switchcase_csr_read_2(__csr_num + 0, __val)      \
> +	switchcase_csr_read_2(__csr_num + 2, __val)}
> +#define switchcase_csr_read_8(__csr_num, __val)         {\
> +	switchcase_csr_read_4(__csr_num + 0, __val)      \
> +	switchcase_csr_read_4(__csr_num + 4, __val)}
> +#define switchcase_csr_read_16(__csr_num, __val)        {\
> +	switchcase_csr_read_8(__csr_num + 0, __val)      \
> +	switchcase_csr_read_8(__csr_num + 8, __val)}
> +#define switchcase_csr_read_32(__csr_num, __val)        {\
> +	switchcase_csr_read_16(__csr_num + 0, __val)     \
> +	switchcase_csr_read_16(__csr_num + 16, __val)}
> +
> +	unsigned long ret = 0;
> +
> +	switch (csr_num) {
> +	switchcase_csr_read_32(CSR_CYCLE, ret)
> +	default:
> +		break;
> +	}
> +
> +	return ret;
> +#undef switchcase_csr_read_32
> +#undef switchcase_csr_read_16
> +#undef switchcase_csr_read_8
> +#undef switchcase_csr_read_4
> +#undef switchcase_csr_read_2
> +#undef switchcase_csr_read
> +}
> +
> +static u64 read_perf_counter(unsigned int counter)
> +{
> +	return csr_read_num(CSR_CYCLE + counter);
> +}
> +
> +static u64 read_timestamp(void)
> +{
> +	return csr_read_num(CSR_TIME);
> +}
> +
>  #else
>  static u64 read_perf_counter(unsigned int counter __maybe_unused) { return 0; }
>  static u64 read_timestamp(void) { return 0; }
> -- 
> 2.39.2
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
