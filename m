Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7B6C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 18:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X30a0fh6uc+Z4ay8suKFykNpQeO5UZ13NcubbnOLxX0=; b=Ajt2X5ceTSTerR
	S3W3yrC2TEqaJ5RwfatePH1sFenryOWuKQtybc3hUII9RxHCayPdrXtfkrRE4aNOmA57d9hoYfdjo
	sIUfpEL9/oW98Vj52UwPeyaFkPLlv5u7iSlj1ZWNXZDWBfhN2G9Ll0+qAtfZUKjaouJ9dN/zBFDlU
	OyupToLnSTJA77wIFxtj6u1F63GPtsyvCF7WfpZ2EH6UkdDBT4aX9vtmzveDdrTxm+r/O4M75YlwV
	PkXXk+NW/BN1H9QY9jmCd08miOU8I5KfNrNTMbs4tj33wOzF4THWnOWQoYa8FuXabgNSrWaKChxEm
	t4yfXfLo5wLNa+Xc6fKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Kpv-00HQHB-Ea; Mon, 19 Dec 2022 18:26:03 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Iws-00G0g0-1k
	for linux-riscv@lists.infradead.org; Mon, 19 Dec 2022 16:25:07 +0000
Received: by mail-ed1-x52c.google.com with SMTP id r26so13585254edc.10
        for <linux-riscv@lists.infradead.org>; Mon, 19 Dec 2022 08:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ/xV5kYQm2Hd1j/xGG28n/3bJ/6B0VUoXU4GtRHvxQ=;
        b=gRCkCjzAfQU2xDRo530vIc++qERe/p8Qa4h36hfPb032x+8B3EhQuF1VlIhvFm7yay
         Gt3angQhAw2o9dwLkK5Cmpu8Wi3i6MUfEVWdUqR1cohlACLZOOiLXNX/pt4eqnkmIdcJ
         VpPk7ifEtMfYYsU2/6IXuS2i7or0b4C4CvAQj5IB6WY6d+vcC7JKLFk0MuIuJ7GXmN2v
         eSoLeB0KL1oYwUhOQ7W5JdpkVLzJE62iHHQgVm4ezclp2R5PkYfsodKgJC+3Ddh1uzwc
         bopYe7yesuBFOVt8KYv1kcU7NRgOeaGykUbNrUrLiDlgb/vYH5m+vSXduN3Sj4gLyNr9
         qMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJ/xV5kYQm2Hd1j/xGG28n/3bJ/6B0VUoXU4GtRHvxQ=;
        b=ZIvQDnmPam0Y24Z+Beow+KH5ObN5gURRch94yiEdMK/B6cfi+qpdF8g+hf2WlaXFAP
         OQN01HLLH4anixPAkhkqKEoLSpjIkr7UdgW0Ynb+XVXuvTj7IPtKABPp91t6kdVW0D/F
         SJjGUqzE+im3c+fxkWGL1fcOXUv3gQEBfn6zlVIA/k1FcEag8mX5AQ0ppRsyHCmTLiLZ
         FnIAf1mhjs55Bt0KHOr6zMkzqFuIlL/gyInknhif+2hB53LzYx6Gcz+eC0u9R1M97nHg
         nf4Ir5JGter3P8uv+bNkWU63jeHTdWG5fN4gAcd6AE5VPlttwVOYqbuGCpLImuzcFNYz
         lhRg==
X-Gm-Message-State: ANoB5plTg4bYLDR/uyYEje7sNXUW09ZAUwCOYZGNy5oEn9j19hG/GDfg
	kNuUBsxtl6R7uZtJItcviEVgZk0nC8ankUUWAtc=
X-Google-Smtp-Source: AA0mqf7aVrHznra9kq/5XUrQB90yNi4CxyEpOTVvZ+vPVEVdi8+cSqciLRch31jkEUfirRoL6cZSo8HHHkABRgtoiNY=
X-Received: by 2002:a05:6402:2987:b0:45c:a9d3:d535 with SMTP id
 eq7-20020a056402298700b0045ca9d3d535mr41995467edb.0.1671467103114; Mon, 19
 Dec 2022 08:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y543kM4070CSDtZi@spud> <CA+V-a8ss0idLDoc+J8-Undqd+DUGrpeytenzSxV8xMs2N3dh1g@mail.gmail.com>
 <Y6CP2VhKUPZixQ8r@spud>
In-Reply-To: <Y6CP2VhKUPZixQ8r@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 19 Dec 2022 16:24:36 +0000
Message-ID: <CA+V-a8uHREVYp1xCK-ed4j6xFw9LpV33xJg3MFdiJ5cvhneGqQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] riscv: asm: alternative-macros: Introduce
 ALTERNATIVE_3() macro
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	Guo Ren <guoren@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_082506_287980_C24B20AC 
X-CRM114-Status: GOOD (  18.06  )
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

Hi Conor,

On Mon, Dec 19, 2022 at 4:22 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Dec 19, 2022 at 11:15:17AM +0000, Lad, Prabhakar wrote:
> > > On Mon, Dec 12, 2022 at 11:55:00AM +0000, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Introduce ALTERNATIVE_3() macro.
> > > >
> > > > A vendor wants to replace an old_content, but another vendor has used
> > > > ALTERNATIVE_2() to patch its customized content at the same location.
> > > > In this case, this vendor can use macro ALTERNATIVE_3() and then replace
> > > > ALTERNATIVE_2() with ALTERNATIVE_3() to append its customized content.
> > > >
> > > > While at it update comment above ALTERNATIVE_2() macro and make it generic
> > > > so that the comment holds good for any new addition of ALTERNATIVE_X()
> > > > macros.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > > > + *
> > > > + * Usage:
> > > > + *   ALTERNATIVE_x(old_content,
> > > > + *      new_content1, vendor_id1, errata_id1, CONFIG_k1,
> > > > + *      new_content2, vendor_id2, errata_id2, CONFIG_k2,
> > > > + *      ...
> > > > + *      new_contentx, vendor_idx, errata_idx, CONFIG_kx)
> > > >   */
> > > >  #define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,              \
> > > >                                  new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)         \
> > > >       _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,    \
> > > >                                       new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
> > > >
> > > > +#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,              \
> > > > +                                new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,         \
> > > > +                                new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)         \
> > > > +       _ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,  \
> > > > +                                       new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,  \
> > > > +                                       new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)
> > >
> > > btw, why is this indented with spaces when the line above it is indented
> > > with tabs? (At least, that is how it appears in mutt).
> > >
> > I'll update it with spaces.
>
> The file uses tabs, so it'd be switching the spaces you added with tabs,
> right?
My bad that was a typo, I meant tabs :p

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
