Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB46C25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 14:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=g8iyGkf1CncKfyn7JPpXoKDXSlFtt94R3VgJ0WuGkp8=; b=vT92zUyPF2SUdY99QbdV18VFop
	G4cr8Rynh1xqcsWr1tndkRv2VZd+r9n7mYdVFLzX6Q9Rlg2PYLyCpzAGNpdyiSdDcko59bW1lUaw6
	17GoZah8cHSGH589Yv/IehOsEoEs/pXnw3yCkpZxPbnjqV23pJnKsjlPt09fHZYzggxvswGDbM5a0
	7A/C7XN1bUF1qHqGATHGQnFH7bErbonMJC/r1HUrColqtN5pnCeA3O/BOj1+KUZeZO6QjHh4gFo9H
	st7BJ4NZZoyfNhxnWUV1nvmOMCqWKXVXfYoyB3PcJ2cNw7iGjDdEATZSzyFfGKxoVl94p7/QXcAOY
	wXLghewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1be-00EjGh-01;
	Thu, 26 Oct 2023 14:45:06 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1ba-00EjCH-2S
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 14:45:04 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F308B3FB55
	for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 14:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698331496;
	bh=KyhXAQ347/D5dTVlSbEJNnsvSJxeXoai/S3IoPDxqGM=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=JO1ki4bY5F5we8pRPPOVhGkoLDfvByw7/yLCEZh2iKcpD0+NYsqzj2MeyxVGCFHEd
	 AdMeT1IttK4OGfEAyvgKEt0rsw2X/FDst7RtA8b7/weT0ABr7UtxIflsboZAuKMek4
	 BYtowhvKklyjI9bA286tUPQarkqWBGkVnUvJRkjaEyY+mOhhDKnSuUkznE4Ihw8lps
	 5SGnZUumX2p/3vKawaFbBN+MjekS25vSlFPsbiuVAO8ENC868a0VwMNGB9HFg5YfiI
	 9wic5mLcKEsn9r8Xkk/8h8NXsypNt5Y1rvym15fWhZaPvWzBHRaFbbrW1u+hYWMejK
	 PnIHhdCRdSfRQ==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41cdce61c6cso12570951cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 07:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698331495; x=1698936295;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KyhXAQ347/D5dTVlSbEJNnsvSJxeXoai/S3IoPDxqGM=;
        b=AT3BXc5Vt+RXNYzjgLFVb2pcjCFj4EW+seQqo8jOdgGJJU33vyDyC0kYHo8sseitZa
         l6/BUkYfC6zVmLa5L4uqaRpXSbR5lH73vsfLBgeQegWEWSzc2NcbxavNYCYAr4yhszfu
         DcAYP17X5fJEToQXyyHAuCSi6N7vbXgfeMCk9NiIb4iukbWEQKdkgHmYk7Np6r0D3wyT
         hGLGLFARyoLW73EAnNIV7NGH7SUQs6jT0EDk4lxvltOfy4FDN2ILVltZ+JAaP7pNT+ww
         OkK2C4b3uFhZ2iRiEWkCur40kbl6F0rHVo72ive72ssRMvyWLYVAxnqFQ96vo/rMnWJu
         AZMw==
X-Gm-Message-State: AOJu0Yyzs4Sz5gTz43miz0RJE5kQJ7afGiiMSebk2LX+jUqmzlLTLpCM
	SZ9U4PrdoDHA8ipoUHdyF5TrAD8eB3K4PiK8VPUMM5u3BtiM5iT9wSGcQKSXLKrFh9HfTafGw7M
	32A2V5nxnTl9hu7TtShmT/rIMAizKtIig/jnkbZ7Ldrqj0iPbBS6T4LVV86u8Tg==
X-Received: by 2002:a05:622a:1822:b0:418:737:87fc with SMTP id t34-20020a05622a182200b00418073787fcmr21060483qtc.18.1698331495011;
        Thu, 26 Oct 2023 07:44:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDUZEYahtREjaUlikk/d6DW0+O0yNz17AITtWS0cudA0V0aUT0OQQ86tpZcKtUcpjHs4dEqDgRXm8Mb2EWq70=
X-Received: by 2002:a05:622a:1822:b0:418:737:87fc with SMTP id
 t34-20020a05622a182200b00418073787fcmr21060467qtc.18.1698331494770; Thu, 26
 Oct 2023 07:44:54 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Oct 2023 07:44:54 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231026-cupcake-smashing-eb150e74a17c@spud>
References: <CAJM55Z8DXDs6LT0JrTyEMp8V6BHvsjUW7aJ8Gj+fRGsasHAi_A@mail.gmail.com>
 <20231026-cupcake-smashing-eb150e74a17c@spud>
Mime-Version: 1.0
Date: Thu, 26 Oct 2023 07:44:54 -0700
Message-ID: <CAJM55Z-NAuGjwGXT7vMg+BCofQ8yo7Q_481LQV4zjN3ByRNxBQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: cache: sifive,ccache0: Add
 sifive,cache-ops property
To: Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_074503_150145_C20A5209 
X-CRM114-Status: GOOD (  20.74  )
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

Conor Dooley wrote:
> Hey Emil,
>
> On Wed, Oct 25, 2023 at 11:56:41AM -0700, Emil Renner Berthing wrote:
> > This cache controller also supports flushing cache lines by writing
> > their address to a register. This can be used for cache management on
> > SoCs with non-coherent DMAs that predate the RISC-V Zicbom extension
> > such as the StarFive JH7100 SoC.
>
> I'm not really sure why we need the flag, is it not sufficient to
> register the cache ops on a per-compatible basis? At least for the
> jh7110

-jh7110
+jh7100

> you're always going to want them, otherwise your system is going
> to be largely non-functional, right?

That's right. I'll do it that way for v2. I guess my thinking was that this
would be easier to just add to the device trees of other platforms that might
need it. Eg. mpfs pci and jh7110 graphics.

> >
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > ---
> >  Documentation/devicetree/bindings/cache/sifive,ccache0.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> > b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> > index 7e8cebe21584..36ae6f48ce0b 100644
> > --- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> > +++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> > @@ -81,6 +81,11 @@ properties:
> >        The reference to the reserved-memory for the L2 Loosely
> > Integrated Memory region.
> >        The reserved memory node should be defined as per the bindings
> > in reserved-memory.txt.
> >
> > +  sifive,cache-ops:
> > +    type: boolean
> > +    description: |
>
> and this | is not required btw, since there's no formatting here that
> would need to be preserved.

Ah, thanks.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
