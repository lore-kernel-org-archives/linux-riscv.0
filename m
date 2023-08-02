Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C08C001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 09:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZBdLVhkikKFXFX8NsTcXQzTKhQAg+f+7CassksdQnQ=; b=RjMG16NoCKCMYw
	gDWuQ0+a39bKgfUUP4FztnsyK0cQ0z+OXiJSB/mu6unisOvBd4WEwK5ZMPcHmfjB1u3a3vZzk0F7f
	RFdGnNVu7Tgk7izT0j9K3zLUDfjZM1DWOaQeWW/e7Tndv+kQZhc3zwAbbLuzrAKWQT+hFJ5Xz2Nra
	zEVKQPEUpoEOt4skSKlOUSP142eanV61xEwpnUkhUrKxBKNNQF30Z7duNJWCo1P0rkvx6u6qn/8BI
	BjJGP2cJ7hLCQ1PSFhsSL98c3wiJO1kxsEYWOJlk6VkJPND4FBiNhwcbyP20lK/ik/IiMwnl2xuYE
	+6RwrhZUtG+rmyaaCdZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR8DM-004UDP-09;
	Wed, 02 Aug 2023 09:32:20 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR8DI-004UC0-2T
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 09:32:18 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-977e0fbd742so914082466b.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 02:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690968735; x=1691573535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qF0aEgee+FPFz+iaQY2LrH7Juz8N6fO4KHzo5d0J5po=;
        b=WK07xQ3FGA5WcpC5zdx0uDh/Lh1f8FHSywlLFabT48BunC8cffyAwiJnKW6W9ZHRhv
         bdiDZKh6i0P4XosyLhKvMsVWmygqgp4Nn80eYXDBOUZZTPbZk/2eUYXuKJaH7TpmOyts
         uouA7nAqrPVIUuVFeiYhOUUhrv3QHDWqOuZx2kCNJDNh2aH2eXWJ9YAiQWrdJMqwx2oh
         9t1va6KIgdxlTSaxnMg37rZ9D2boo1lpHhH6ebbDqA3WQFowchWEJzIXd+bS1suntkFe
         z/mJYKfIdrEi0/aoJC3VfeRW0y2kGAdMru/7TdNZy1piXEQ2WKmynJZBN+YHfGfUccEv
         Txrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690968735; x=1691573535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qF0aEgee+FPFz+iaQY2LrH7Juz8N6fO4KHzo5d0J5po=;
        b=XgzD6194GCzsB4v55yp9oBHKEsG9LJsNLR0ofCO0oOxL2S5/UBcr7EP+S6VLBs/0im
         xZwInahv+Hc5gq8LBOtLajXgNM+SN6OZ4vWqJ+Oh+z40Of02EdWI6PaLOS8uG/b2vwo8
         ST1EDgushROxG5bNiACSZ/cKcfi2Z2dOnJHGlMQPcXP2fU1S6MD7ZfodQj5/iVyrekog
         lvUuIAT41G0lGGAlglJLKaFhdqkx/rlUo/a04dHSvTp/3h/b6Wc0iA5Bg/WMf5Qwcpzz
         gbsJR2W14M7S3Ms3R5KiYb4+oUEZLpRiSSS9CQf4hg1sXpv9cHsMOeC+Ci8GXY4m+XIg
         0Y2g==
X-Gm-Message-State: ABy/qLYnDVC1+mhKBx7YmCpg/SAhAh0k+UiEZsGGxSHoWqTcUoq44Fbd
	lecPUNpAdMS/8Z8WQP1N1Ym3sQ==
X-Google-Smtp-Source: APBJJlFF191bxevEKrX048Spx8AHXhdbVnhFYercC2XbYZV/VYGT7ptsY6UpNsEbfdmWvraciuM69A==
X-Received: by 2002:a17:907:2bd7:b0:96f:e5af:ac5f with SMTP id gv23-20020a1709072bd700b0096fe5afac5fmr4440341ejc.47.1690968735457;
        Wed, 02 Aug 2023 02:32:15 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id v8-20020a17090690c800b00997e99a662bsm8741929ejw.20.2023.08.02.02.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 02:32:15 -0700 (PDT)
Date: Wed, 2 Aug 2023 12:32:12 +0300
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
Message-ID: <20230802-7c19a712ae071f68030ab5f2@orel>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
 <20230802080328.1213905-10-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802080328.1213905-10-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_023216_825040_264E5B8E 
X-CRM114-Status: GOOD (  16.83  )
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
> +
> +#define CSR_CYCLE	0xc00
> +#define CSR_TIME	0xc01
> +
> +#define csr_read(csr)						\
> +({								\
> +	register unsigned long __v;				\
> +		__asm__ __volatile__ ("csrr %0, %1"		\
> +		 : "=r" (__v)					\
> +		 : "i" (csr) : );				\
> +		 __v;						\

nit: no need for the indentation or line wrap,

({
	register unsigned long __v;
	__asm__ __volatile__ ("csrr %0, %1" : "=r" (__v) : "i" (csr));
	__v;
})

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
