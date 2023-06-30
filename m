Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C90EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIEz98qJ31B4H81Pt3ckkmi+J90rHKQmrImiM8aFw3w=; b=ao7JB8uPRKIKr7
	pGLdJ1CIFu552He4WMho8aTCR9OWEk9XGQmbMX8eczXHxJy00q6+n8fNoFM6b4srCiE0488yZMSkF
	cL14dAAnW+SYQGSRgB+aB89udqF1LTeJheUysIWstddgczwr4NqNOv2WQR6HyDHpQxjeHvcAz2yZo
	TDrT4Wh2SOBIuUm+Ne2p+U4qRso7y70IM3zlUqLKNhdDqjzK+5HyLyChlrrKh39YcTc6c4+B+3aZw
	2KVyY+pvR+Hi1E5rOxhO4QhrNsJU5DP8F7k3LiOcjdvmnOQq5QOgpHwerMJub29A7bOeGz9Mghxrn
	NqKAiRHq1x1fldZC1Uhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFBT6-003NJR-17;
	Fri, 30 Jun 2023 10:35:12 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFBT2-003NHU-0p
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 10:35:10 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so211403666b.2
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 03:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688121305; x=1690713305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aIpEGvFXrs8o97FGml0s9iS/MpzyaImfG5Q+Ha+S4rk=;
        b=Pa9I9sD8aoveHuo5s0uVgd8tNUEW0sJ61kej0dmwT4IQqKaVVnOWDSFhGcmpXdsyMa
         O8g0+grHMbOyc21MOZrirw3K2oqzfnAq5DuBNNxslOFGnjbOU1gURVPKT2COlriQzVI4
         qSv2iorZqqMXZETI1R1z7KZ4gaWGayca1oDUvV1umBwxvJ/cNT8MNXSlFHIlzxmp+1dI
         WwwuJ+7e1e2hgz2cFbd9CWuTFCeK37qQ25dZe8g232SyAQIgpCP3G/QXW9X43lQw7kYP
         l1ygIETj5LA3gXiQYghkg9hUKVr9GRt1ljJ1DWzRo1KSUOvg7xrA9jLsgHOqafXRT9Wc
         hLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688121305; x=1690713305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIpEGvFXrs8o97FGml0s9iS/MpzyaImfG5Q+Ha+S4rk=;
        b=j/OtdEKCOW/kR7crTX35VxygFtFD8vZit2rIhhtNo0fAv25ZUTpJDJNsRsgNcIAJDE
         5EyBvk0fHa6+n9UfLzjW9WgxuVVtTrgAOT6aQ6Mk6wDXlF8YSZlsMrxrh9SjO01qfD/K
         eSN1dA1FdwaG7t3pFoJpHn6z4NZ5PAkvEU3cqb2+yPOYLgYKAEHyP2+pXtzmp+5kkhyh
         S2Vdc7aArgXmyNvGT40v/2HO8kU0mPg8LogvlWjOUTEFn8uLFTPChiqicPWr0afG6dVW
         x6TgoLsyPj6NZJSX/JgBt83+pj5ph9cLf7nOjZHhWlQrW4X1KzkfnQ+zXF4UDXi1ajR3
         VDlQ==
X-Gm-Message-State: ABy/qLYjdzmU0A7oHEotlg413FsKuyV+ROzcptoiKVlV+wQXTyAbkOHe
	JpFYVr+hUin+yWQAkNyCKqxfDhB9jjtpudkaJ1w=
X-Google-Smtp-Source: APBJJlFI4nzgC9G6s9EsR/Gn6ZOe43adgLRDEgX9KqwfVxRhQo4NY7mFu+YK8TxklGgFUZipBiY9gw==
X-Received: by 2002:a17:906:4b49:b0:98e:477d:36c0 with SMTP id j9-20020a1709064b4900b0098e477d36c0mr1579960ejv.47.1688121305353;
        Fri, 30 Jun 2023 03:35:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id k26-20020a17090627da00b00992e94bcfabsm460906ejc.167.2023.06.30.03.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 03:35:04 -0700 (PDT)
Date: Fri, 30 Jun 2023 12:35:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 03/10] riscv: Make legacy counter enum match the HW
 numbering
Message-ID: <20230630-ba45f06f3d9faba17c6d8f6a@orel>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
 <20230630083013.102334-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230630083013.102334-4-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_033508_295141_DEA333AD 
X-CRM114-Status: GOOD (  18.13  )
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

On Fri, Jun 30, 2023 at 10:30:06AM +0200, Alexandre Ghiti wrote:
> RISCV_PMU_LEGACY_INSTRET used to be set to 1 whereas the offset of this
> hardware counter from CSR_CYCLE is actually 2: make this offset match the
> real hw offset so that we can directly expose those values to userspace.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_legacy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
> index ca9e20bfc7ac..6a000abc28bb 100644
> --- a/drivers/perf/riscv_pmu_legacy.c
> +++ b/drivers/perf/riscv_pmu_legacy.c
> @@ -13,7 +13,7 @@
>  #include <linux/platform_device.h>
>  
>  #define RISCV_PMU_LEGACY_CYCLE		0
> -#define RISCV_PMU_LEGACY_INSTRET	1
> +#define RISCV_PMU_LEGACY_INSTRET	2
>  
>  static bool pmu_init_done;
>  
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
