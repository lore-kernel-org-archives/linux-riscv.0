Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E14BC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 11:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNt1ul4RU6ZVCQfQSc68QWc1YurZCVjRetScfpF2ohc=; b=SScvPRoLoCY5wG
	SUQxrNMJ+/JwkI8BbCrk0RYO/ElfQ6+92RWZw2RttFLw5IuC2U8nnt/mo7TP8NnQvRcd1AulY55/B
	oPXalv1W0MbZSpjwMZOCv2v64hJD/ad7LUxDzc13B86lGq7hHFK/XWupyLZpQvyxGJEgPfPH8X3L/
	dhi70UcVKSv3Cuihv1Vh3lN0AnBr6YMkFqS83Kg2HEdw2tV3V1pUxtYZSLCQ927Dpr1J+65YHlKJz
	jEZENrjgbB1+8928Jg/oNnPnyMslVSoL4KtkP1FoqEwtI6lqWbVAJKqdYn/o/Frc+8kIDEeha+yyo
	w/P1yDO2/sfBzTCEtPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hm2-0074pO-Ux; Thu, 01 Dec 2022 11:30:38 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hm0-0074oe-FV
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 11:30:37 +0000
Received: by mail-ej1-x62d.google.com with SMTP id n21so3445161ejb.9
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 03:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hy0z9fn6yutvc+dvThk/Y1SdzeHn9pxlN9/eh5uO3cs=;
        b=YkIRhmkvgKI5VeByBYmm1jWJDDZCuPl51QhLM+LBFmLqimdlWo+pj+K+fPMT+zPB0F
         AMa8LRhqkrmuqzMZRiLjbwdeseLHv66UO7WSVX6vd9Tnttvwc9+vd9GREUtc8R3Y1kaM
         j/a84exSdT20BTPXJRti561tqcGWWyMI7oQxb/xrq++ienrgX3hoF1tsCa+fRtElpg5G
         a3F0Qu2FLENR/gzMY0IQyTfBWdD7Fl439e4rIMO+X9WvViIIDIRVcpyISqZJ2GBRs6GA
         Ns+gcbiqFopKXHlwt3rW8MXX1HwtL0dQ5byHH+v3+zD2nhNGRMGcvrBJ4rOPWOyUQjbm
         xlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hy0z9fn6yutvc+dvThk/Y1SdzeHn9pxlN9/eh5uO3cs=;
        b=YmaXXHmvMwoVyz9nA9yDOnGHV9xFZmfxid0rr4P1jvgDKtT7mLjbEXT8uz1W/v6I7j
         F/C+fKbikz+or9xK8wAIFLCYbbP8LpBZYEZaWOni978qUu23jT60FlzI9B39w/Nlp/tM
         yCs5FB94k1FHNMGmwWkIaOABrTFea26/uz0anMzrBsOyvU0pMn91bOBazQG4Zyznk/SX
         YbMXBniulsgIKdXsOSA/3v4NEZcPhc7EtV06ptRZo37Z9/66HvezhNxFt06CAqO1p7gU
         bKeaRHpR0p1nXdSLliXkBIpKoRX3V/50Hvasxkl6sPsEVmUdIbtDmRke/N9hCH/QDGxg
         enxw==
X-Gm-Message-State: ANoB5pkwHKRZnsdevLKABU5esiDQE48kUW9m2ev5BdTdLdlqKrcaQQ2f
	mvo888ildT3PbB7xuwdR2xduqqdakHGPmGSpQTs=
X-Google-Smtp-Source: AA0mqf7/0JyuhpFTobymLKciVFxPGTz54M/o8dTWiasg+0bDb9chiSoyVVDommRlVqB41SoDJUohNZGrny6505ZBHmM=
X-Received: by 2002:a17:906:79c4:b0:778:e3e2:8311 with SMTP id
 m4-20020a17090679c400b00778e3e28311mr42171491ejo.342.1669894234898; Thu, 01
 Dec 2022 03:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <bf8e33fd-a752-d5d5-859e-14302d069f2d@sholland.org> <CA+V-a8sz4i_wenTyA5tVTVB8dQWLmuXCf3CGYOPC+C07GJ8WTw@mail.gmail.com>
 <565e1861-7052-9bd3-e7ba-e590bd91cf20@sholland.org>
In-Reply-To: <565e1861-7052-9bd3-e7ba-e590bd91cf20@sholland.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 1 Dec 2022 11:30:08 +0000
Message-ID: <CA+V-a8uuAqrtVEB1GqFicQjRvkPGpG5788oNSzCp1LNyoUNmXQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] soc: renesas: Add L2 cache management for RZ/Five SoC
To: Samuel Holland <samuel@sholland.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_033036_540420_32D47158 
X-CRM114-Status: GOOD (  22.96  )
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

Hi Samuel,

On Tue, Nov 29, 2022 at 5:58 AM Samuel Holland <samuel@sholland.org> wrote:
>
> On 11/26/22 15:09, Lad, Prabhakar wrote:
> >>> +     if (!ax45mp_priv->l2c_base) {
> >>> +             ret = -ENOMEM;
> >>> +             goto l2c_err;
> >>> +     }
> >>> +
> >>> +     ret = ax45mp_configure_l2_cache(np);
> >>> +     if (ret)
> >>> +             goto l2c_err;
> >>> +
> >>> +     ret = ax45mp_configure_pma_regions(np);
> >>> +     if (ret)
> >>> +             goto l2c_err;
> >>> +
> >>> +     static_branch_disable(&ax45mp_l2c_configured);
> >>
> >> Instead of enabling this before the probe function, and disabling it
> >> afterward, just enable it once here, in the success case. Then you can
> >> drop the !ax45mp_priv check in the functions above.
> >>
> > I think I had tried it but static_branch_unlikely() was always returning true.
>
> You use DEFINE_STATIC_KEY_FALSE above, so static_branch_unlikely()
> should return false until you call static_branch_enable().
>
OK, got that.

> >> And none of the functions would get called anyway if the alternative is
> >> not applied. I suppose it's not possible to do some of this probe logic
> >> in the alternative check function?
> >>
> > you mean to check in the vendor errata patch function to see if this
> > driver has probed?
>
> I meant to do the equivalent of:
>
> +     ax45mp_priv->ucctl_ok = ax45mp_cpu_cache_controlable();
> +     ax45mp_priv->l2cache_enabled = ax45mp_cpu_l2c_ctl_status() &
> AX45MP_L2_CACHE_CTL_CEN_MASK;
>
> in the errata function, since that decides if the cache maintenance
> functions actually do anything. But ax45mp_cpu_l2c_ctl_status() gets the
> MMIO address from the DT, and trying to do that from the errata function
> could get ugly, so maybe it is not a good suggestion.
>
Actually I did think about this and the best approach is to do it in
errata only as you suggested. So here's my approach for dropping the
above checks is to introduce vendor specific SBI EXT
(RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND) which will check both the above
conditions and only apply the errata on success and hence avoid the
"if" checks every time in the sync operation.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
