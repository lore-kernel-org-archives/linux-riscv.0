Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BAFC28B2B
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndgJBIHrxRg3EGhsc08KwgDnUbVNC5YvCK7eRvSN2Os=; b=NWvfJd97BT5mkr
	U2caRWDIITwYxc1Tjjylcm2xWmaB0r81kc2l8x0FabuF5f3nCwjrMfCTtLQS92vKi5xHLHYDHHvLK
	KlmINokV0I+VtLS4DoEjCsagPsjJdEd5W1uBKx8NLgUfzKgkVBDiFBjiBHBsDQ/YAh9PKB87jkP6+
	APnroUytppn1BE1j7I05+gZY29W6XNum1wbRfJzVoLtY6d96rvr/SGbFHkMNnYYrWDUhHfabKjNxm
	sJklVyS9qKi+1bi3mv5hQ3V9eB/LBTRj5xp8G08k+WDN4v/TqH7Jnm1FdfoCcWa0fNAvDImcjzklg
	OHxyxUwE5H+LL5/blu2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOy0A-004dJn-SQ; Fri, 19 Aug 2022 09:09:14 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOy08-004dGt-9b
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 09:09:13 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-32a09b909f6so106440797b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 02:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=NFZ1eO+NL0DdpbYe+Shpj3kD0DfJq56KubQKKQcddkU=;
        b=XOBeLUUQRjUvlmYat2FRBDjkZ7Oezy6Y3lYrO+CArd90pB4I6q5QUkoGC5nQcfN14i
         EgsBIHm5yEOhZ2zfFy3oHod0YbGC6jShJnjlJVOpHu+/KdGFbJgMWEQm+/qBKOw03Zdp
         QXwLPIgnLg8j3VgMuYsukvLXSR79D/hs6zVKrsky8FN1Ow8jma60W9wYfEDNm/LeBmNr
         6G55jFueB0gjj2xxLhmZphISxmUONRvkTI/2+tcwiDiTMu7zVUHbKQGabVyY7+Z0PMYG
         ugSa3TRs8k5iHO4Rtf+hORHq1h2KMZRWy2HurjOhUg8xuujOB6ASdlgBXRdmEOlFUYms
         spKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=NFZ1eO+NL0DdpbYe+Shpj3kD0DfJq56KubQKKQcddkU=;
        b=YAkJUlnc6UQE8+XqrGlzFQ83k+ZiluwqZViZZSi5OAUCN/MUaUJPrZQujbXQTA/Wid
         KV48HdgdZxZ6ml7JHBE01a8WOnlfcIsg8tjQDyhpRxtHM5dVP66yV6mIWkFj/MPpSqiD
         c3e7tocuHhgdMLHDsOzy7I33pyYkQOUlQSeKudAoraYBr1YmrNoTGMyVu7WHSRND05bc
         e8E0GISaYRg0wl6lgPbLtopWCm3xRByrTILAGieC9JQEX5CaQt55tlJHaLlRtB7hGmCf
         p7iIDpjzkkn1vMM865euRPgbhyurOtMAZyexJbV8LlmIY+vAA3ZjLwKR88DeFa7UvDma
         Fz1A==
X-Gm-Message-State: ACgBeo2upTr61L6jQ4pHwjv6FBw41sq7B/sQinREDGq1pa3gokHPZFqd
	QK9+9Sw3qKgmeQY0SJGAVzWSrP3VoFWVHLZ93dY=
X-Google-Smtp-Source: AA6agR4crwUZ51R3+LyOXZVR3lotoIYKMWBFupVpI0Go+holeaYaFRtNfkONddeSJ3wwGqH4Mc+IR5M14kyxudtzwnU=
X-Received: by 2002:a81:1d09:0:b0:31d:a40:8332 with SMTP id
 d9-20020a811d09000000b0031d0a408332mr6899061ywd.138.1660900149126; Fri, 19
 Aug 2022 02:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVEVtu2zf0R5+LufxHWLtG0=aEvPkfcF=K9V025_TCTrQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVEVtu2zf0R5+LufxHWLtG0=aEvPkfcF=K9V025_TCTrQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 19 Aug 2022 10:08:42 +0100
Message-ID: <CA+V-a8uz1XKbbrOrGRyOyJUo-PsHUDRn7qc1X+zaakGh2dOdsA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] MAINTAINERS: Add entry for Renesas RISC-V architecture
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <Conor.Dooley@microchip.com>, 
	Anup Patel <anup@brainfault.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_020912_367104_A48A67F6 
X-CRM114-Status: GOOD (  16.01  )
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

On Fri, Aug 19, 2022 at 9:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Aug 15, 2022 at 5:16 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Initial Renesas RISC-V architecture support will be for the
> > RZ/Five SMARC EVK board.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17562,6 +17562,16 @@ F:     drivers/spi/spi-microchip-core.c
> >  F:     drivers/usb/musb/mpfs.c
> >  F:     include/soc/microchip/mpfs.h
> >
> > +RISC-V/Renesas RISC-V ARCHITECTURE
> > +M:     Geert Uytterhoeven <geert+renesas@glider.be>
> > +L:     linux-renesas-soc@vger.kernel.org
> > +S:     Supported
> > +Q:     http://patchwork.kernel.org/project/linux-renesas-soc/list/
> > +C:     irc://irc.libera.chat/renesas-soc
> > +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
> > +F:     Documentation/devicetree/bindings/soc/renesas/
> > +F:     arch/riscv/boot/dts/renesas/
> > +
> >  RNBD BLOCK DRIVERS
> >  M:     Md. Haris Iqbal <haris.iqbal@ionos.com>
> >  M:     Jack Wang <jinpu.wang@ionos.com>
>
> Perhaps we should merge them all into a single section for "Renesas
> ARM/ARM64/RISC-V ARCHITECTURE", to follow up on "[PATCH/RFC]
> MAINTAINERS: Merge ARM/Renesas ARM64 and ARM/SH-Mobile ARM
> architectures" I've just ssent?
> https://lore.kernel.org/r/a869b8afdc47aa637ebeefcc1ca7bc61244f34b9.1660898008.git.geert+renesas@glider.be/
>
Agreed, I'll merge this on top of your changes.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
