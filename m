Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9277A606A324
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WgIGqSO2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MkmVFG1UU7+Y1fhwzwNvePx0vR/OuWLXbAWMZW/HiU8=; b=WgIGqSO28EQUUfVPYR9lB401ur
	+Ob8wJdiMI01cAC1goRZ9r04ZTm2VAIbQ5lIQHF/KQMQS1fXP2NrGkRQJQEfjbOSLHvLaiFNZm7yh
	g4I1MzGst+drUWuWkf7hsy+rjylMFTFDC3UGptcrFTC4m+0o3FTok6xddaBYWONx8AM44yay5hJ+9
	1QAJGOkfs1efKuyYLHN+80zffUmvxDTzpMEOjktkxc0cLtanIZmE8IX/H5lQpMYN02B6OPAOOOrNh
	nnPty9eu75nRxVjmzs3um/ouXQN2eMoV2RADCVAl2UQM8ECzqO3Jh6Alk8OpkgtCTGD9O3loUtzWU
	fKlV17kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNozR-0000000G8FH-0a2j;
	Mon, 02 Nov 2026 10:10:09 +0000
Received: from mail-vs1-f51.google.com ([209.85.217.51])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNozO-0000000G8EF-1Mfp
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 10:10:07 +0000
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cccb2c96d0so705636137.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Nov 2026 02:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614204; x=1794219004;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kku90+qM041/ZsQ9tSwaVmVz4Dm8H3ilNwTawTrWwWg=;
        b=kFxNJd1j6vLAPG7+K0qYFMJcmGu4UePYaVm2u3AbTfxXoOUtDXhQWyoj6e2P+wO8TA
         tAQI5BjVYvjvbJ753GE4m7NkSRFrNrxjsFq4HwuPKmITzQP5yU4bgLuLnHxx9gejCEMp
         ovYSzyto5oEJMRwh6e5q0eW7g4hqwW0iagUSXJQdTGR5v3dryzA4c3fu53lpJf+eO2gS
         v1aWh+TSKXx8QCk2W+FJReGbQ2zn19TuSCpdGVyOQX5o83NfBIsnTx8czD1j2+xPETst
         8j6gCFx8dRDr1cR/Xonl3FtzdssmMzCY6TvX/kkneziScyrPxfWJ9E/Fdby4awo+iv76
         tw3w==
X-Forwarded-Encrypted: i=1; AKwUvBwdA2mulV90qSJPV+WNDFn7o5/MeuoT5EzDNjZqxVOAfO5Bi5oSeLNJRIWuqTc+xJp8NYEoacOZ0aXTmQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+aCjU9KTWCFOc14RFUv24dJUgmV316tvxwlD7HEyr2hLJLuf+u
	pPKHbY4xjThfyWG7InQDbuq1SSoj0zHbfi3sn+AA3GoPGr6DY1RV+zxdegHzJUz9
X-Gm-Gg: AYBFou3Wte+zuh6zUHL9lxxULn7lRYF/ojouH3nVdSsJ7OHK/pDk4ItoqpFCGt0eFwd
	bs4/Ra3zfUTOmrNXEokw1U0LMlOlDsOEP8iW+Og8bzfz2VGPfASOgKE/3HT2l+feW7NwRVf26Ss
	Si6dT96mgj1u2JKFe4Y+VhSVZu/Zrwm5LBaNs65iE9m/i5o9lkPzRj7f3mXvhd7coSc/CI/XmaG
	gBLZrsGbCrsqtkl/4dew6bt7z3B86TGhkL+l/dQJ3LBhMbfeQCY7szvpMGZfKH+52fjU0MG4YR9
	qXlbhJFyVF9v5C9D0Ep8VlLJWAOy1sWHeJUfbLXBJr5pSorVAnZYSszfRi62iK1C+ueQCj+tMAy
	yEcpgd+W/5hO92XYcG4mch8Wi5KEnzPpNjYVLX7H+l0huWELzoCOodWVhEQZ7lTEX8oD0CXj8tg
	hldvdzQ6BI/UaEMkbaUQi3vreOMCZ/h1fWayGSCoJ2hDdHb1iBUr1XF1Gno4G7ngaHjoYtTIJ4e
	/z+XfKvmeCzNiDDd1khkN6MF9+YZ1Wmw1EUi5HeVTh6AvvKwfHqIvU/tLhyNGwyZJTR2kPs8mry
	3hHDSElStG3W/RfcZxUIo4ni2WVv597HVjjJlAdQYEfgWiRLKDpfBX2yvgcToCybgg==
X-Received: by 2002:a05:6102:6cc:b0:7d0:3da9:3e16 with SMTP id ada2fe7eead31-7d07227aaa9mr3321756137.3.1793614204429;
        Mon, 02 Nov 2026 02:10:04 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d0776a824csm9658148137.11.2026.11.02.02.10.03
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:10:04 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9906034086cso594691241.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Nov 2026 02:10:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByWv0PAi37v2fppU/GiBzhqBrXTg7gta0Y2Bf+8yodBokz48nc9yEpFtA/Qsx8Pnq3jEjgWzTk/5meoog==@lists.infradead.org
X-Received: by 2002:a05:6102:3706:b0:7c3:9b0c:a75 with SMTP id
 ada2fe7eead31-7d0725ceb28mr3125663137.12.1793614203445; Mon, 02 Nov 2026
 02:10:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be>
In-Reply-To: <fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 11:09:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhOu+1YU7z0WR=2M5OuGjdXmH6m5__F7TmhRGQx52jMg@mail.gmail.com>
X-Gm-Features: AclHuK8J4Hpof_2n20HSIIi8CLwkgCm2egqJasTQSM_ACF5dfMV0X89nwIyfFeA
Message-ID: <CAMuHMdWhOu+1YU7z0WR=2M5OuGjdXmH6m5__F7TmhRGQx52jMg@mail.gmail.com>
Subject: Re: [PATCH] perf/renesas: Remove remaining RISCV_ALTERNATIVE references
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_021006_375689_A2933386 
X-CRM114-Status: GOOD (  24.74  )
X-Spam-Score: -1.6 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 13 Oct 2026 at 10:39, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> As riscv always selects RISCV_ALTERNATIVE, the option was removed.
> However, a few references were left, making it impossible to enable
> RZ/Five support (ARCH_R9A07G043).
>
> Fix this by removing all remaining references.
>
> Fixes: b924210f542e13c7 ("riscv: remove RISCV_ALTERNATIVE Kconfig option")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be applied to riscv/for-next, or folded into the original commit.

As the broken commit is now in v7.4-rc1, this can no longer be fixed
in the original commit...

> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -117,7 +117,7 @@ config STARFIVE_STARLINK_PMU
>
>  config ANDES_CUSTOM_PMU
>         bool "Andes custom PMU support"
> -       depends on ARCH_RENESAS && RISCV_ALTERNATIVE && RISCV_PMU_SBI
> +       depends on ARCH_RENESAS && RISCV_PMU_SBI
>         default y
>         help
>           The Andes cores implement the PMU overflow extension very
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index a63df28df3b5e7c7..0b6876ef6dca228b 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -461,7 +461,6 @@ config ARCH_R9A07G043
>         bool "RISC-V Platform support for R9A07G043F (RZ/Five)"
>         depends on NONPORTABLE
>         depends on !DMA_DIRECT_REMAP
> -       depends on RISCV_ALTERNATIVE
>         depends on !RISCV_ISA_ZICBOM
>         depends on RISCV_SBI
>         select ARCH_RZG2L

... so I am queuing it in renesas-fixes for v7.4, unless someone
screams.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
