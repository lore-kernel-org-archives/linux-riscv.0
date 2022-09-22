Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6223C6FA8B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 06:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2UzMj5F0IA3H/TlYFuT/GkMh1U+6+8N5uzwk1++ylA=; b=cKrXwiRlVNxjDd
	J1ZT5tPdS8M7BSFlMhVBkx9kRxC/vGPLQmfIh5/5YHq/A8AY0HFwJNgaAL4MXAgBRH8LHAM+ifinW
	Z5k2rEPhpda+jJpi8OVIEuU1A8m0typ1eguGvh0IaMP3wpUbCG92IHmraqqYaxKPOrPFWoUjmkWAP
	iAUKNWPsiixevM00SMI09ztCnDL8zI9U3xXMCukwd42f91fvVl7ErVjRoAqIGJQPrX4rFBpmzNDmn
	rTaDAs6tzKAngF0aCZqv9lGY5hb9cHxv1dOeUTg+MMe7bE629wNZjkx8b6aM11XsUEiljuwUKCeqP
	XQ1eZtdADm9aAoVHmfmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obFWW-00DWTb-Gr; Thu, 22 Sep 2022 06:17:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obFWT-00DWT3-H7
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 06:17:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CC579B8349F
	for <linux-riscv@lists.infradead.org>; Thu, 22 Sep 2022 06:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F497C433C1
	for <linux-riscv@lists.infradead.org>; Thu, 22 Sep 2022 06:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663827437;
	bh=XWhl/4JUFnfzaLTPlF/Td7CIF2siihubPVF4sfi8AbA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GaxVPVxWGgNM5MJ6ApDZfN8rVlVu09nQ9CD+IAmxh2lixBBr/LhaqPPwdrEUFjVxJ
	 eq26IaJsvRhMNT+nuH/Lh0e6Abrh6QupppHko03aKT2Bb6eaVNj4mFxpPRPFCaBcTM
	 YnALXEl72pNpbkwPRgXVbiJzZBm4AuUZ2DYkCJp+d+gMsQ5hg6Ur4IYpLvCIQq6oSG
	 OBrDnK4PB9wDOdHCyUKp+Bo64yHhBFGK3oTOaPhSrvLyQYq1vhFxH+VfVBryetkEQp
	 iq0tl7GrdHhzjnxmlo99ndAcGwElQDn9yhDi6P5SnMl8DoDpOfsKB7uj2TbiQ9EU7l
	 3FikNKYKDG/AA==
Received: by mail-ot1-f47.google.com with SMTP id r13-20020a056830418d00b0065601df69c0so5534945otu.7
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 23:17:17 -0700 (PDT)
X-Gm-Message-State: ACrzQf0Duno7LcRk+YzlhNzk4rQZK9U+nNU0f7SSjYKRQlVRVYq2tjia
	ITS0pbOgm1Sp+oO+PAxZ6Hr6qgg2+AMmLsNHqg4=
X-Google-Smtp-Source: AMsMyM7Edr5/JGY/hSzcr0jdddpsNP00cLJuEHNXQlerw2TUADw6e6il69Q5xL54U4P+JZ+u+nyFcs0mPhi4Y+xxSuk=
X-Received: by 2002:a05:6830:34a4:b0:65a:b03:54cc with SMTP id
 c36-20020a05683034a400b0065a0b0354ccmr853087otu.140.1663827436725; Wed, 21
 Sep 2022 23:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220922054743.30159-1-samuel@sholland.org>
In-Reply-To: <20220922054743.30159-1-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 22 Sep 2022 14:17:04 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSW-ixSdV73kqpJ=yYjYnKFQtS3NfzvjBVBVU1D==7YEg@mail.gmail.com>
Message-ID: <CAJF2gTSW-ixSdV73kqpJ=yYjYnKFQtS3NfzvjBVBVU1D==7YEg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: Fix crash during early errata patching
To: Samuel Holland <samuel@sholland.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_231721_907650_A8FF2D43 
X-CRM114-Status: GOOD (  19.71  )
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

Good catch!

Reviewed-by: Guo Ren <guoren@kernel.org>

On Thu, Sep 22, 2022 at 1:47 PM Samuel Holland <samuel@sholland.org> wrote:
>
> The patch function for the T-Head PBMT errata calls __pa_symbol() before
> relocation. This crashes when CONFIG_DEBUG_VIRTUAL is enabled, because
> __pa_symbol() forwards to __phys_addr_symbol(), and __phys_addr_symbol()
> checks against the absolute kernel start/end address.
>
> Fix this by directly using the underlying kernel_mapping_va_to_pa().
>
> Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
>  arch/riscv/errata/thead/errata.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 202c83f677b2..83174f13783e 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -76,8 +76,9 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
>                 if (cpu_req_errata & tmp) {
>                         /* On vm-alternatives, the mmu isn't running yet */
>                         if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> -                               memcpy((void *)__pa_symbol(alt->old_ptr),
> -                                      (void *)__pa_symbol(alt->alt_ptr), alt->alt_len);
> +                               memcpy((void *)kernel_mapping_va_to_pa((unsigned long)alt->old_ptr),
> +                                      (void *)kernel_mapping_va_to_pa((unsigned long)alt->alt_ptr),
> +                                      alt->alt_len);
>                         else
>                                 patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
>                 }
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
