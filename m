Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16999C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 12:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1i9z5POpUmA6SffDysEt37YQTIRTCSHjSUHwDmkb47A=; b=Dz3oWVvsib8iiUT0meJ0mDojeh
	BIqzsLcz8RyqKOdtUISmRikszdzLeeGpISVX9eJZ6kqVMXq9fRqB/JZfF27A4CXNgB/fCLFZ+AE3l
	McVr2Ob8CbRZB21Or5Aebyq0UGE8Gozi6clf2+BLvk4AUlAQQ9U/bQLGG9wJONaK8mk9TzLQ5+LBZ
	O2LMTh6Fm7U8JObaP+HoAUk75W9krbqbyZRq7FRuv93LVoVSYiLdK8ex/KPWsGMcmU49wdauylEkT
	D/H5rvyFf2pfGv8foeXdp/hrwI1KCx2J8B+snQ4JvZft2nLF+/ROKPW+JlX39n9opKJUzwYvceCsC
	EjJaYvMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvGKs-009jfy-2u;
	Tue, 24 Oct 2023 12:16:38 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvGKp-009jeY-1I
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 12:16:37 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 65D803F443
	for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 12:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698149787;
	bh=thwvxYYMUVPSY3nzBc7xApM08Kssn5NAFL9o/BCJG0g=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=nZSj4IliyasfjvdC4ZPXWVk4QNzAZMC4s2MadTa0AMCKlyPrLhK5znrt/M9U7BPKg
	 tt3gZObdEneza01sXSXHsFl8poxyaUo/w3/1gTrrVuhqwvqXvSt1o2XNtq9TIotWGB
	 3GojfzMSgSTFbLTmAb8j1jO68hOuNuGdA6XbDwDiATUqzkHTEpq3fDVbbeSOufbWHN
	 ggvkIkgmtifj5iYtmbaxWf47IIOtt0mRRMM/TCqfTrV+f6BLrYbqcgR4nPBvtei3DF
	 IABJGa3LgNJ/wKyvo/jBIE6qFWswb+OKhGCiBNuGJZXHaH7VJVlIE8NkGLW4oDdHjG
	 mG36JgrDIcadw==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41e16b279ffso39727081cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 05:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698149786; x=1698754586;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thwvxYYMUVPSY3nzBc7xApM08Kssn5NAFL9o/BCJG0g=;
        b=mFT736WaDav9MkliNPHMsz6tES+5fRRKQqbgR1VmltdTHPQjyFr6hIb+6WnQnYzqWt
         c0VQ36pQWrxpQmo96nSy0sTb/8JBZyOYgWLR12jX7rQra2YkHNMHnmlabuZ3vY/O0pNe
         eCR8ljD6W0MCo9sD5+KurvXfPkLlUDEjxO3d7/s4E2KYG4AhJRJkBH1GtQXFQRmMTzlf
         8T9a/LBaHleFqmgS0RL8gvFSq6ifdwaahTR7xIrzJ3fkOyxHZ536eYVk5+AzBDSLYu3i
         IylCVmtedRda6n0gqYQYKwBrTL5cxZvSVjIvGF18hk8G9BJJHrBGvha38ItYqMyVwLt/
         XRNg==
X-Gm-Message-State: AOJu0YyB55yxX8Ag0pqByYptdAFOwljWZIWfx75DE9ALla4L6ba1dSFe
	I+W/AA65sAaP3A1FMsaM4eRGcjtQ9WQj+prwtQ0n7MS6l1eOw21acJGLgQul+PUwWHPZT0ORUlT
	E66mI8UtAqcKRPFiTm+pH71GB0s7duVITRWyq05Vz4uka4KtFlln+X8zw8atOfA==
X-Received: by 2002:a05:622a:2d2:b0:418:152d:bf4 with SMTP id a18-20020a05622a02d200b00418152d0bf4mr13460096qtx.51.1698149786530;
        Tue, 24 Oct 2023 05:16:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOE0qGS2pSUMsJf2A8W5Ex0DMIs+jJV1IcL5+p/qejHg+bJIzitFRzRk24ZJkjngpmMhUlqv5mwknRsepuX1A=
X-Received: by 2002:a05:622a:2d2:b0:418:152d:bf4 with SMTP id
 a18-20020a05622a02d200b00418152d0bf4mr13460067qtx.51.1698149786276; Tue, 24
 Oct 2023 05:16:26 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Oct 2023 05:16:25 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231023-th1520-mmc-v3-6-abc5e7491166@baylibre.com>
References: <20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com> <20231023-th1520-mmc-v3-6-abc5e7491166@baylibre.com>
Mime-Version: 1.0
Date: Tue, 24 Oct 2023 05:16:25 -0700
Message-ID: <CAJM55Z-OBUsnybSLTxB8RHwsYuWhsMKVH3x8ana4=LeZ98Yv1Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] riscv: dts: thead: Enable BeagleV Ahead eMMC and microSD
To: Drew Fustini <dfustini@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, 
	Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_051635_859780_027325B2 
X-CRM114-Status: GOOD (  15.75  )
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

Drew Fustini wrote:
> Add mmc0 properties for the eMMC device and add mmc1 properties for
> the microSD slot. Set the frequency for the sdhci clock.
>
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> index 70e8042c8304..c4e748827889 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> @@ -52,6 +52,10 @@ &uart_sclk {
>  	clock-frequency = <100000000>;
>  };
>
> +&sdhci_clk {
> +	clock-frequency = <198000000>;
> +};
> +
>  &dmac0 {
>  	status = "okay";
>  };
> @@ -59,3 +63,19 @@ &dmac0 {
>  &uart0 {
>  	status = "okay";
>  };
> +
> +&mmc0 {
> +	bus-width = <8>;
> +	max-frequency = <198000000>;
> +	mmc-hs400-1_8v;
> +	non-removable;
> +	no-sdio;
> +	no-sd;
> +	status = "okay";
> +};
> +
> +&mmc1 {
> +	max-frequency = <198000000>;
> +	bus-width = <4>;
> +	status = "okay";
> +};

Hi Drew,

For the StarFive device tree files we've agreed on sorting by / node, clock
references, and then other node references alphabetically. I'm not
insisting you should do the same, but it would be nice with some system to make
it clear where new node refences should go. Or maybe I'm just not seeing the
system you're already following.

/Emil

>
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
