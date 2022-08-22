Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E43C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdMWKnBw/X2sS9wM8vOs5frywOWR3mq8/Y8H4N5/4vU=; b=hXHihQXubTRuAZ
	rQVAmr7eGsFnlnVU2dMYYxpsRMUxGIkeVaFDcaE0ucjMfjhEcnrg9PD4VIE97tqV8ocrKSxStkbt3
	fou6dN+JWccUcwDCf75tKOS3EYrf8ME/zAog5V9hE4FtmuoXVh4yjnyju8sZYSYTSL2rGgfNGktyf
	Ycsw7l+GYBwoZdwDfzgww9MPI2M+NBLZ+H2S/s+xcQxKe+grPlkSfqw+y+pGh6c40+xn/FVbm+PXv
	hYiAPMhnuKySblqoDjHOxT/7ltOwUTpFZZudP2EebJdyxbD3SaSNFMSB585AfBrwFXJYbSEHZpwOT
	WOPx9E3qkjfefgSQ8j+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ2Ro-006GMC-Aq; Mon, 22 Aug 2022 08:06:12 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ2O2-006EGX-1d
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 08:02:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id d16so6844837wrr.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 01:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=qfvk7aY5HgP2fwg3EbjPMxeYdfCR5gbK4JtKMjBePgU=;
        b=k5T1pyTjrnqdk47O1rzmQBh7nM1Wtzu+ui6GAXcFSuWj0tE4PH9d398xHcgnypAGsY
         cY9MT7L3YvV+SKrXw4dcc7mJqRcCmCro8BOvvhdme05fn0jT8sBzGqLuFrfYVEAHSa/t
         CSJ5/Q6kRKM4VMXpyIL7VyTGZzTWgkzbdw0qHoNgSrJfjZeXzJnfbCcaWs4CNsrBBNWA
         KRn2ZlN2TCC8SkNfImJ3p1MGqgT6A+qhrFdTafwtkRtyl7+gGCAE39nHb5bUp8hu1YSB
         Lurh++b06wTVBoH2AV1AL5udje0r3n7HWuXnFfjA/CSTOPF3CXaJc9BzyVKjSMR0gZAx
         JYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=qfvk7aY5HgP2fwg3EbjPMxeYdfCR5gbK4JtKMjBePgU=;
        b=xMLDjx8s6Ny3GMsRPCpY7msgkNA48JTz2tJ8CwAJQCNZkATHY+whRbTTbumTC0cQH2
         WkWxGd94pq8WDJ9fLgzozbQgJzqrhdKVgOGoydtPyPM1MQCMu17ZML3zposzGB9SBsNi
         TsSq55rhtS9MiY7lj+NYsTk5G9JGRYKH+DLF1WBO4tsfT3CcLNAafI2zCTG1cfCrdB2m
         wDT3px9AWyWQIVty0aQx2Yjl7sxV+nYzVOxldXAoEZtIVkAXH9ZPQAvids/if+Nf5K96
         8oUBY+VB0QFsAoofodEwHQ7m3xJaYUuKglQ7JR+1K9fDq4EBa8woVoN/JWKYGTvVKecZ
         VVgw==
X-Gm-Message-State: ACgBeo016S8fcrnICLk+ex6EMlf8pUr+rmsAjz86GBCHw0eiWYVJT9RS
	qDNbJUJ1AuRinQng0uabqQnDeZORLTiI6A==
X-Google-Smtp-Source: AA6agR73Hx0m/e53/0Nz27DTWtP06P/S25zUjSJxOfyhh4hlwNgfzyBQ6bbtMruX1ytsdRu1C5bHpQ==
X-Received: by 2002:a5d:4703:0:b0:225:1fb8:860d with SMTP id y3-20020a5d4703000000b002251fb8860dmr10141827wrq.219.1661155333370;
        Mon, 22 Aug 2022 01:02:13 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id l24-20020a1c7918000000b003a5ca627333sm16573552wme.8.2022.08.22.01.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 01:02:13 -0700 (PDT)
Date: Mon, 22 Aug 2022 10:02:11 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: enable THP_SWAP for RV64
Message-ID: <20220822080211.te3ifvu3xv4ye4p7@kamzik>
References: <20220821170559.840-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220821170559.840-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_010218_240321_75C36CB3 
X-CRM114-Status: GOOD (  17.19  )
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

On Mon, Aug 22, 2022 at 01:05:59AM +0800, Jisheng Zhang wrote:
> I have a Sipeed Lichee RV dock board which only has 512MB DDR, so
> memory optimizations such as swap on zram are helpful. As is seen
> in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64") and
> commit bd4c82c22c367e ("mm, THP, swap: delay splitting THP after
> swapped out"), THP_SWAP can improve the swap throughput significantly.
> 
> Enable THP_SWAP for RV64, testing the micro-benchmark which is
> introduced by commit d0637c505f8a ("arm64: enable THP_SWAP for arm64")
> shows below numbers on the Lichee RV dock board:
> 
> thp swp throughput w/o patch: 66908 bytes/ms (mean of 10 tests)
> thp swp throughput w/ patch: 322638 bytes/ms (mean of 10 tests)
> 
> Improved by 382%!
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ed66c31e4655..19088c750c7f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -45,6 +45,7 @@ config RISCV
>  	select ARCH_WANT_FRAME_POINTERS
>  	select ARCH_WANT_GENERAL_HUGETLB
>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
> +	select ARCH_WANTS_THP_SWAP if TRANSPARENT_HUGEPAGE
>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>  	select BUILDTIME_TABLE_SORT if MMU
>  	select CLONE_BACKWARDS
> -- 
> 2.34.1
>

That looks like a good idea to me.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
