Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E79C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGJy4gazvZw/XWBGJCtekGzDu7K/+iJ5wLZuybKprFo=; b=shH8klOTTei7zG
	WxbjrA1QiIxvW/m/hhUsPC4LLqn5csuwaGekXmRgpZlkvb2/7wB03s01KvwNjq3fVXF/X8ay9ix5C
	vq+P6xSt/i/B20iF/EjshKWrNvxn0qmGu8Z/9hnGW20NG/+YtPGZsHTJLbGQsIkVglorfQpUF5kOi
	yiBEZXSvHOcEq1TVyZFe0l/x+O3pl3xIvpdMXgyxYS80VwawiBcR2dtF2hDZfEpKUtvDRJ+VOUCH4
	VKL7WiRTHDgLbAZq1l6UyUmg5PspaiXpdDmR3TkNITn2GjVULHgSKkjgrE/Xi1XvM63IL6aOP1vZA
	ypPGVSJdMUgj96DYVteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NUj-000Fm0-2q;
	Wed, 31 May 2023 15:12:13 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NUg-000Fjq-2c
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 15:12:12 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f4f89f71b8so4827756e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 08:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685545928; x=1688137928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M1o4Wjc1Cd+qea3/6BxW++NOPFclyS7iyVbzxq2yJnM=;
        b=Xsh7wmb56AfkTGFNGfAoURmK0HS6z+XV2ALRtt5RWYeUEPKtRQN0zWKH1+/tWx2ChO
         GMTXteP2EObzHUyg6W/oBG3Lpr9zCgHEPJpan34MRkH3YHo1Tpg9D0YtIngKFJuBMg5K
         ukB1YMiBtgIxiccgf/cZWGDjHIzwtdp0XCOrimUjIsQyg1wOZzE81jLMMIl7dLRaGctF
         uGb/kLmfRNLYi2shrOabraf5t0YD0HnT7diFftFD3pC4v77XXr/91T1h8KLLjTP+rRYf
         Wc6YWE5/onF4g54mVyMS+rFk+4PkmWayq2iMlKRxZjekGE3HYQBpNA669F7LlnVSJALw
         Rn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685545928; x=1688137928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1o4Wjc1Cd+qea3/6BxW++NOPFclyS7iyVbzxq2yJnM=;
        b=DZFo0Bgu55hr+VVmhEyU1nXF/7jnpNe50j47As3tYuBTcR6ScCHTrKI5OQ1v68fxBR
         6Ik2LJwqonaByQ3dVXeOtSJDRDpyqsy9p8S8amZTAVmwzaIcmbuL9mepqHR5UGqa0R+e
         6WwE86iYfXFDKFgRC37ma8M6eGG1LEiKUu9C50Jwj7JSWOpKN64K10A/Y6Hj/0MaesOD
         A8Z77b5vzzqRiaKMBE1EHLekRnNhVDXbEwVmJn9Hjs44x6hBCr+my79W2L156dwULFkB
         d+ZhKCAnfNtRFn7XEf+2fvi0ElMtfphMInHPAxsDDlDy/lPPj6beuBd+VAnhTLXxSDAd
         PFhA==
X-Gm-Message-State: AC+VfDw/FyyE0BM3J0OmUYeCwfuZo3YehzTGamtXmuKeiGTfs1ycttPV
	pBnj2XP+FPmYpbkFFNGmpe1GEA==
X-Google-Smtp-Source: ACHHUZ6HFVOQ+2uUMoZbOvBiq8z2lgUqeyqmyxMd2ASVv3Wpmnk8xG5ixCshIzQtQNpCNFCqlxN6uA==
X-Received: by 2002:ac2:518c:0:b0:4f3:baf9:8f8e with SMTP id u12-20020ac2518c000000b004f3baf98f8emr3047811lfi.4.1685545928497;
        Wed, 31 May 2023 08:12:08 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id u5-20020a05600c00c500b003f0ad8d1c69sm24598389wmm.25.2023.05.31.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 08:12:08 -0700 (PDT)
Date: Wed, 31 May 2023 17:12:07 +0200
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
Subject: Re: [PATCH v2 09/10] tools: lib: perf: Implement riscv mmap support
Message-ID: <20230531-5e82a25977cfe463e4db1cd1@orel>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-10-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512085321.13259-10-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_081210_845036_D17C7993 
X-CRM114-Status: GOOD (  11.88  )
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

On Fri, May 12, 2023 at 10:53:20AM +0200, Alexandre Ghiti wrote:
> riscv now support mmaping hardware counters so add what's needed to
> take advantage of that in libperf.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  tools/lib/perf/mmap.c | 65 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
