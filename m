Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568B4C38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 11:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4klocx0qzHKuWWDQbW4rDTYt0JdFPqE4Y4XmfJwrS6s=; b=2ja9b55+bwr8zI
	Hl+WG+pRcaHVgzXXkrwE9bvsVqmANp8l+6k23foxC10fsJm73uo60hrIriLuana9244X/Gl69rZwv
	ZvpuOzZkE2NDw209bTdPST5iAECvu4TKcl7umeGo0hMdsQFL/eycNKCRsVzKlLFfAN4hpGxbkwDil
	TyqjxQFrz96SWriopZXWXPegFwQssJcvwEX96fzZmQXA2GT6u5YfSZaK2kl7xHoin4QAtJkDp3iTv
	eVSC5Xlj3xLx94typaw6ZQ8MvZeo0b+ILDWI8CHp/c8nFxv89gQxbW+hRCElSbXUC3KFBJcvqHgWn
	WJTNpRhbIgY5qVz95ifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooNju-00Gznx-IR; Fri, 28 Oct 2022 11:41:30 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooNjj-00GzlX-W2; Fri, 28 Oct 2022 11:41:21 +0000
Received: by mail-ej1-x62b.google.com with SMTP id f27so12327184eje.1;
        Fri, 28 Oct 2022 04:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5y5A9pG1/H0U+8RgwnxHXSQw6+Rfn/giVW1kToYs3Y=;
        b=Csf6zZS0/kCTQiC1yhxCCUQQrGy4No9ZwiINBJnWGpQCa2tG0KVfBIdKNllX+F85uz
         vzZ5VFkfvUdJkGdJriHLfOY89Q4WOKODXwTdZVhsOdwWOQ+OJbnxRF1k2g65xQJlQb6L
         ImdBaFL8609ImsALNyovHlAtjGeyD0t3h/YpavNYYIEmP5CfZ1sLdWiSYnIQSI9+iVUJ
         slLwnX6Ycwasc/zYFb4nlwfdF31S99ZisgeiZHMr7PhDejYZ182nBfMGMp1FybyegHzJ
         CP9i85gdja1QLPowrSviaFSJWu8xRm3aL3PjboYiuFpnoWVEjDs09zff16/mOj+H//ec
         R+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5y5A9pG1/H0U+8RgwnxHXSQw6+Rfn/giVW1kToYs3Y=;
        b=b62pSTheaQreogBut6Tp/6TnPcj3dRHyN5JBmBlAjcg+innponm14ilhQtX7hdkKt1
         s7N2pAkbVoaupy9i1t8ZVyzGAftjayXMP0qDC8zUHC8CMvTrPkm4FlMOeBWYORmEPNKi
         A2obiIIfBe91GI7ObJXQaqnrM6o6dj5xuNUL5cqdHuaEjkGCl6qJaAJyIdTipMSaE44t
         rOKuThwgIkjxIjiaoWy5X30EJArMx6+MEcR2tq5TaEE6/XL+pD9WahOlpUqsqawV86cD
         rH5oQSspbzfec+8Wf1uFVKykag6NC+eu3pJAAoh+8ogGGkVtR+r0ILjeSGy3aRndri8l
         n2YA==
X-Gm-Message-State: ACrzQf36HjTnqfAxumR6K98GWdbqV31PlQLdv0AzYQiSS3TShy3Dhpjs
	SX1nbEPFoy/hu9ilmGmRx3ulNS6xV7xEaHG8cGM=
X-Google-Smtp-Source: AMsMyM7k7NlrLg2TkNTq5MWbYtY7EI7PuCwUCR7FFMsv2VcliAPc0Yg89vfXdfHM4lu0CUxKH39lgb2/kVF9LDK8Kqk=
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id
 ww7-20020a170907084700b0077ff489cc25mr46178042ejb.80.1666957277120; Fri, 28
 Oct 2022 04:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221025220629.79321-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221025220629.79321-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXw0DTAXFjqutP4X2E3gzkBQ579tHPfjtLC2X0j3R-+Lw@mail.gmail.com>
In-Reply-To: <CAMuHMdXw0DTAXFjqutP4X2E3gzkBQ579tHPfjtLC2X0j3R-+Lw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Oct 2022 12:40:50 +0100
Message-ID: <CA+V-a8v2RkNSuVxVsoYhS3c-xJ7bJAm+ApaDCoK6oBzTx5gsnA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a07g043: Split out RZ/G2UL
 SoC specific parts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_044120_069601_C3571418 
X-CRM114-Status: GOOD (  17.65  )
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

Hi Geert,

Thank you for the review.

On Fri, Oct 28, 2022 at 12:35 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Oct 26, 2022 at 12:06 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move RZ/G2UL SoC specific parts to r9a07g043u.dtsi so that r9a07g043.dtsi
> > can be shared with RZ/Five (RISC-V SoC).
> >
> > Below are the changes due to which SoC specific parts are moved to
> > r9a07g043u.dtsi:
> > - RZ/G2UL has Cortex-A55 (ARM64) whereas the RZ/Five has AX45MP (RISC-V)
> > - RZ/G2UL has GICv3 as interrupt controller whereas the RZ/Five has PLIC
> > - RZ/G2UL has interrupts for SYSC block whereas interrupts are missing
> >   for SYSC block on RZ/Five
> > - RZ/G2UL has armv8-timer whereas the RZ/Five has riscv-timer
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.2.
>
> > ---
> > RFC->v2
> > * Updated commit message about timer
>
> Right. And I'll add while applying:
>
>   - RZ/G2UL has PSCI whereas RZ/Five have OpenSBI
>
That makes sense, thanks.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
