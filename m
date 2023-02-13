Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9E1C636D7
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 01:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=232UyksFyEe2n4UzJgzltcA5IOMgcj7Y3jC37hP3bW0=; b=2ZIS5TOGFu2mXc
	fEpNyonCXFIIksMfr3rclz/O5DkZ4Zxlefojtg+vUpJXu3TM8zEGRakvvSv23cwewMLwGZrU4CqsL
	MD90mrRuRFELU1d6Qxwy84PsYYiqrCE7ABqOkWj7pOGsowsUs4T9l1nsRTPXVJyvmnjUY/QKB8yjm
	4+/KgdPMm+h9X4ckqMNpyShMOQbQTB0MnCuFxb3M+reWmKtmC1sclezkheBxFYLAb9mfzZ5O3xUXc
	0VjljG6f6f58WoXS8r+vxQ10csH3Na7n7y9fuvIxXI5pj9Zttyqa6S/GM7E1HaVyUZaKGBGHyztK6
	/dpYUvva+Mmr48ow99ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRNY1-00CkY3-Hi; Mon, 13 Feb 2023 01:22:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRNXw-00CkWi-EH
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 01:22:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DAD46B80D26
	for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 01:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9D1C433A8
	for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 01:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676251337;
	bh=wlM+Ecx2iuslNVdjwg8XLBf+mOAcdUJmrmZhSBMapRg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QPSLrbIYqsxHLJMAdSXZCTc09YpOfAMoiZq7cBEwVVRpYGG139APGI5ka02DBtxlE
	 k2aMmI4mTZh1RGfs9l+UgTG7lObep+Zy+1KNAFeKX65yXQqRXNn1bgTYpEHQ7XgY1W
	 0acK1gTTA7+uETwee7rss+sX9UmM7QWgSWNIXJlp6Mfs+5qdOkJqv5z3eKSD2dWUbU
	 jEqA4ADqEDbODAl3s6BmLy5o+uwoSiEPYuI35XmMoOCGyyaAegd5O/4BluGhUIuIop
	 g+bD0TqViVsP8JxSvJuwQcakvv8lm7WKc1hTo1/e4i2SnxAbUojjA4iyIU1BF01DZz
	 Tk8A+fm7vROjw==
Received: by mail-ed1-f47.google.com with SMTP id a10so10891793edu.9
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 17:22:16 -0800 (PST)
X-Gm-Message-State: AO0yUKV6kAayBAz1H+Q5VzN1jpeK4ZzR7p9a9UgmbJVC1f8ctarRSXNQ
	eLcc0YrQxk1rAXHGUhMA9g/HV5qAYLTeiZf1DSk=
X-Google-Smtp-Source: AK7set9Wnap2DtVffUeW5OU2ClIoBIQPsGGx1U3RdhWtx5jT/9yWwTz7INrdhOyrr63SToh1bowg5JYi5JFRN152pwc=
X-Received: by 2002:a50:955e:0:b0:4ab:4676:f927 with SMTP id
 v30-20020a50955e000000b004ab4676f927mr3100715eda.7.1676251335341; Sun, 12 Feb
 2023 17:22:15 -0800 (PST)
MIME-Version: 1.0
References: <20230212021534.59121-1-samuel@sholland.org> <20230212021534.59121-2-samuel@sholland.org>
In-Reply-To: <20230212021534.59121-2-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 13 Feb 2023 09:22:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR18Wp=o_NfMYgLp5ncyg=_nmpAybknUZkC1nkou8KYcg@mail.gmail.com>
Message-ID: <CAJF2gTR18Wp=o_NfMYgLp5ncyg=_nmpAybknUZkC1nkou8KYcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: Fix early alternative patching
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Christoph Muellner <christoph.muellner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_172220_738576_7030AA61 
X-CRM114-Status: GOOD (  17.23  )
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

On Sun, Feb 12, 2023 at 10:15 AM Samuel Holland <samuel@sholland.org> wrote:
>
> Now that the text to patch is located using a relative offset from the
> alternative entry, the text address should be computed without applying
> the kernel mapping offset, both before and after VM setup.
>
> Fixes: 8d23e94a4433 ("riscv: switch to relative alternative entries")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
>  arch/riscv/errata/thead/errata.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index c0bea5c94128..1dd90a5f86f0 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -102,9 +102,7 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
>
>                         /* On vm-alternatives, the mmu isn't running yet */
>                         if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> -                               memcpy((void *)__pa_symbol(oldptr),
> -                                      (void *)__pa_symbol(altptr),
> -                                      alt->alt_len);
> +                               memcpy(oldptr, altptr, alt->alt_len);
>                         else
>                                 patch_text_nosync(oldptr, altptr, alt->alt_len);
>                 }
> --
> 2.37.4
>
Reviewed-by: Guo Ren <guoren@kernel.org>

-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
