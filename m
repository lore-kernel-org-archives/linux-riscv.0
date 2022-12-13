Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FC8C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ib9INYpIsORkmWkcNk1omL5VEtNAieg2mgL7aTj0mkA=; b=T1Ypze0uKFtxYj
	JKZt1ILq4IqlN2ydYRiHllvfktshRQK+JWZ8IivE8kjdDUJwHnyAtZGfWWYTw23kVuQe4wBTswFf2
	VjENRK7iYx8bMouK3yYu8DtPWEgekcmT3FK1At4uwtJ7wx/ELFT4eXQ5KGRwPNmeVXcU1iY9eLFRe
	XNCga/pVcn8MBJpW6W6/hDY4khv9wUAEmT6plaTBQrLFXheaTIuqEy0Sn5KIb4IZUYdMQ/Po8puPD
	CshqOMtyaG/vbfsgqSag31iBqin5ZzjKqpV+PsR/e3oPigxyRqZp0A+QLmBwVSoJ3hMoeAOcc37Ik
	8ZdVmJt1+El/RNOfoS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59XX-0046tQ-Pe; Tue, 13 Dec 2022 17:58:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59XU-0046jN-VU
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 17:58:02 +0000
Received: by mail-ed1-x536.google.com with SMTP id s5so18853426edc.12
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 09:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f74flBhltkIF6Kyzm1psBFvXaiR1ZpsFYBiux/pnBP0=;
        b=h5saAjMhrH0HxaWeXItI+PASmkeSYJ2PQdO9BLbEOFZMfii8fwzQnWRsbK/4SKxc7s
         rD4KG/Q1ZPION2xh25FfyL8e0ZB2Qd2fzVMGloq3ccKc3fh7BhotnxOssEIU6NXTOmPw
         Ed0iTBqXWx2VVGJY2IcdbQFnpw0qfxiYeO5x4JEkEvIV37SnFXK3JBVkwiC/r04njS8y
         DeZAUot9otBwpYzTq8BRqdksVkGzl71NkXIVhCIZ99z1EG+3khhsYIauwGuirflTgh0V
         TCYybUkkwvY/s4CVK+hSzWpo0fEViGSEK8W+W0wklZBuO2soqu75jQ+l5cX7FKRhBJgT
         3ohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f74flBhltkIF6Kyzm1psBFvXaiR1ZpsFYBiux/pnBP0=;
        b=OrTEAnQVpnwkG8d5dfNqSPMHGuqsYxbKFWuRRGDszazZ5JHFhZOgUZmCP0T2Th9CqH
         0rdz+hNUL9kzRCGOa6/VfU/7SU3ABJkP5HwkjPUQNUBWv22xDRwbV2vK66BCGYC4H9wz
         w/1PKEweMuRC2/1NqdF9aeWNTNslNBSYR/iwOd9ZAGGV0IDrD9U++XX29vVP/aCvmEXI
         Qnole4galup9GoYMbEh9/kBD8qlGPY2v/vgSQDcJ8A/P8o7SrTRMGlF5aY+OhbtvI9e1
         bHc7OXY3BV3YbbHgElOFj4tTsyW3rHhuAFsSUASzrj5YhYc65zWmYw49B9mpj6KHbk8p
         +QzA==
X-Gm-Message-State: ANoB5pnkaDv0E7/4oQTwGw1DWIf1tjmALVdid4rSvwgVKCwIHaNmpkJq
	eS+UDMdxSPydIjGP7Pfx097Q5l7Z6ARauO2QYHg=
X-Google-Smtp-Source: AA0mqf5BkB6tOs9ZGs9+GqphqnUcCfvk0twwLhRnghScakJzu5AIhu6mkb8wvOOc7fcyfPZ5034mmUZ5ehkKT3Pvgc4=
X-Received: by 2002:a05:6402:1f87:b0:468:7df:c38c with SMTP id
 c7-20020a0564021f8700b0046807dfc38cmr20457565edc.150.1670954276964; Tue, 13
 Dec 2022 09:57:56 -0800 (PST)
MIME-Version: 1.0
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXeeCoHNt0tSD51HmexQG7qVBnJO+-_pURix7fr678LNQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXeeCoHNt0tSD51HmexQG7qVBnJO+-_pURix7fr678LNQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 13 Dec 2022 17:57:30 +0000
Message-ID: <CA+V-a8tuCV-p-BR3nAKZ+4Z1GnRus8eEKJZ_sBaTaa2mjqBb1w@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] riscv: mm: dma-noncoherent: Pass direction and
 operation to ALT_CMO_OP()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Samuel Holland <samuel@sholland.org>, Guo Ren <guoren@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_095801_049905_A5104734 
X-CRM114-Status: GOOD (  16.93  )
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

On Tue, Dec 13, 2022 at 5:15 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Dec 12, 2022 at 12:55 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Pass direction and operation to ALT_CMO_OP() macro.
> >
> > Vendors might want to perform different operations based on the direction
> > and callbacks (arch_sync_dma_for_device/arch_sync_dma_for_cpu/
> > arch_dma_prep_coherent) so to handle such cases pass the direction and
> > operation to ALT_CMO_OP() macro. This is in preparation for adding errata
> > for the Andes CPU core.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -124,7 +124,7 @@ asm volatile(ALTERNATIVE(                                           \
> >  #define THEAD_flush_A0 ".long 0x0275000b"
> >  #define THEAD_SYNC_S   ".long 0x0190000b"
> >
> > -#define ALT_CMO_OP(_op, _start, _size, _cachesize)                     \
> > +#define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)         \
>
> Since commit a49ab905a1fc8630 ("RISC-V: Implement arch specific PMEM
> APIs") in riscv/for-next, there are two new users of this macro,
> which need to be updated to (add two zeroes?).
>
Thanks for pointing that out, I'll rebase on for-next. I think -1
would be a better option than zeros.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
