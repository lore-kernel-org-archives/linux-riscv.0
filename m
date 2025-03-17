Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD03CC282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 10:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Dk0V512ZqbkFsgB3pTtp88L/OFz9xRtsK2XF6k9hqA=; b=zBG/zilr3Bxmuq
	lDwK9sBPH6Vv7MXPXVgrv2s+jbgcxaeLW1kjAxbGz5cltI9NDsreiiQFDc9mXAgtJQD8yL8pqk4dv
	o4WKDYEMtrfKpq90zoj+Ew620DWSWgAZM+wNzXMo1UD7W0H0+yKANV0do06TSp5lwJ2nfITDlb737
	0sB10DNItKc9N2P19FvPvDoDg8Bt3+EjC/hEJtGICbVYvI5/CI57H/wdpc1rhH9zrhMerMl0MRjEs
	hZuIGRCvHuV5JIN+v9qVAPG/YUGsVs1IEnQc5ruhHgcklGzDVq7aMmzbPDE4p18Z6e0qW/xedDQhW
	6NKLbgR+aHwxDwoSO16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu85q-00000002GIx-3KBu;
	Mon, 17 Mar 2025 10:53:14 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu846-00000002FpI-3QN5
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 10:51:28 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6ff37565232so33277257b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 03:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742208685; x=1742813485; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hhHd7SXnwkBnjLxo83dsWFNVVc7WEn7JrzvB0bh3I1s=;
        b=AWlNeaa3vQXyEskha+qfkS41yF7Vrnin3+J/q8ubGWK9Uzbrf2IV+j3MsE81UiVTrs
         5dZt4YbJhjo9u+O1+tlB1KZZ+Q950gEvuYkW1s6S2rQI2BRW2pHgiwxC58UNIXFEBesA
         iWVWaY/pGcmpRwbQcvaY9MFTEg4DDP/Xr7lTG8a8jBTGnOUQ4PhdQyHi4OgDC0cjGjkB
         964kQbigRCKgVFnx7dPTnVM3xg1wDRztKP5TsNxwgCrsSi0m7AzXltArz5JhhZ+q0ptP
         16xICV1NdVcPbsuwWApNkhURFGouX1MBiOX8PXd3Tn0wXZM4oOuqNO+JKVyVG3seaaFE
         OxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742208685; x=1742813485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhHd7SXnwkBnjLxo83dsWFNVVc7WEn7JrzvB0bh3I1s=;
        b=Bkzzc7L+6rtLgZ3aDvY5rBmBPEVsjiUBKjq8Ktv+PY6Iwrbzsga6Qa7I6ii8s/TlZL
         6xNfr5xYaJWV1NobzgVQvKwDQEL9x9T7Dml5O935wKgMfn2wipQi0tJ8zwHgA0MyerPL
         LJpnjFne1YU1c+8VlVycuR5XpoAKUS3Y2AP6Q3aujenGF/YuN2kg+P/c2uFO9AZV9EJO
         WPghLPgDjSCusjMygSFIm8nOb9nYCxoBjgzG61OeYUaZRnqItiJYLW9pIA5Uuf+ALnOk
         8ZOTex7YNNzC3VrEic9XysMKw4/voTotvhxYQLNOjwnf1iDTnSuGpN/5aK0/pfHjQKjy
         9rEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAtfO+hlGxJiBy3t0OUOG0Jc/Con3X237h9Y2oxFswxdq4OQqfHVBYyg1UJSW79xmi3+mxwhhWoU0wgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzEESKWsrLV8QeNZkm3kfVXLFyV6Zicy1ESdD3sLuj8SwrqdRO
	vN8Xgky1jlXnvRzUntu53dK6m+SMgbZTkeD6voGiU6TzrFAMpcYIlbVtPph9fdD8TeGayHgJAhE
	Cha2LjTK9/9XmSWN/HfuDbKDNsvB7tJKSxrA/Gw==
X-Gm-Gg: ASbGnctfamSAb0ft8YYy7Yp6XCGTc75ifuwAmcyBQRl1R0J6Nl/RURq5Lafm+xo41DW
	iOHt/VC54dghVnw5PTFOO9eRzAgyLuVvXoCq1RQqZITzejTUPPJmR6ddgx6UnGjHPffY7rlyLE6
	iUHRHSnvaWr29SKehyJqkIsCdhsSg=
X-Google-Smtp-Source: AGHT+IEe40CfksyDI5mdSQUSHhqAslmj6SGjaz3DQ4bTsoYnRMhPf4eCW4qJvzXcD+bNgB+yF6CSG5NQVgbkPysQZfM=
X-Received: by 2002:a05:690c:b8e:b0:6f7:5605:c62b with SMTP id
 00721157ae682-6ff4600ebd2mr140912807b3.27.1742208684308; Mon, 17 Mar 2025
 03:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250314154834.4053416-1-arnd@kernel.org>
In-Reply-To: <20250314154834.4053416-1-arnd@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Mar 2025 11:50:47 +0100
X-Gm-Features: AQ5f1Jr6iktPjJh5-3SyBgHuMVQK2t5ir32zhMU3Ip0MrgbDCFUExx4K6sMmMQQ
Message-ID: <CAPDyKFrBfoMpGxnYM1g4M2+LViy8OAtogLL9swUFQfhhm9Ge1Q@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: thead: fix TH1520_AON_PROTOCOL dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_035126_857399_3748B70A 
X-CRM114-Status: GOOD (  18.27  )
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

On Fri, 14 Mar 2025 at 16:48, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Kconfig treats the dependency as optional, but the header file only provides
> normal declarations and no empty API stubs:
>
> ld: fs/btrfs/extent_io.o: in function `writepage_delalloc':
> extent_io.c:(.text+0x2b42): undefined reference to `__udivdi3'
> ld: drivers/pmdomain/thead/th1520-pm-domains.o: in function `th1520_pd_power_off':
> th1520-pm-domains.c:(.text+0x57): undefined reference to `th1520_aon_power_update'
> ld: drivers/pmdomain/thead/th1520-pm-domains.o: in function `th1520_pd_power_on':
> th1520-pm-domains.c:(.text+0x8a): undefined reference to `th1520_aon_power_update'
> ld: drivers/pmdomain/thead/th1520-pm-domains.o: in function `th1520_pd_probe':
> th1520-pm-domains.c:(.text+0xb8): undefined reference to `th1520_aon_init'
> ld: th1520-pm-domains.c:(.text+0x1c6): undefined reference to `th1520_aon_power_update'
>
> Since the firmware code can easily be enabled for compile testing, there
> is no need to add stubs either, so just make it a hard dependency.
>
> Fixes: dc9a897dbb03 ("pmdomain: thead: Add power-domain driver for TH1520")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/thead/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/thead/Kconfig b/drivers/pmdomain/thead/Kconfig
> index c7a1ac0c61dc..7d52f8374b07 100644
> --- a/drivers/pmdomain/thead/Kconfig
> +++ b/drivers/pmdomain/thead/Kconfig
> @@ -2,7 +2,7 @@
>
>  config TH1520_PM_DOMAINS
>         tristate "Support TH1520 Power Domains"
> -       depends on TH1520_AON_PROTOCOL || !TH1520_AON_PROTOCOL
> +       depends on TH1520_AON_PROTOCOL
>         select REGMAP_MMIO
>         help
>           This driver enables power domain management for the T-HEAD
> --
> 2.39.5
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
