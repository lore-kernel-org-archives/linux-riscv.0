Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03DBC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ezrdjUe/Nw2yLauyLr7WdJUcCr+q+drZmjStyUIFf88=; b=wyhb9ppxJdpv5U
	MpIyC5h/TSYdwCV9elDW8Fds6jgBVDcqnSTkI1Vz1e2zJUVH46Ypr96L53loI7sjDC76AX/VvJXw/
	mjAD2teRllJ0bSHi63oZDlyKzDe8tROApn96XQ63iTLRSghyPYhso+abe9zre1iuoAr23+u4kDkIJ
	xUhey17ug2AEWrGQBPvk0RKVrD7biYZPjBdjx3TV4MqjA/estLei8haK6vvJ5BFwnhrXrait1clJK
	NREIqiGyfS1G6iBaxNezRHoYcCRLsyb0DalwyMORjqHN2fr7M6zqPEAemrZ78Hc8cITamLH2iAhOi
	OvxexIUuNeu+Ue33Jong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og1QV-00DZYo-UC; Wed, 05 Oct 2022 10:14:55 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og1QT-00DZXh-0T
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 10:14:54 +0000
Received: by mail-ej1-x632.google.com with SMTP id b2so34437889eja.6
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 03:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=pXVo7Cs71/tg5/xPQSHIws0jZdPnU8iJoGi0JM0s6PA=;
        b=arPd/QQa9fe/Rw9XyvYa+vZ2+MI8iBZcEmBgqSvclDUSSOCqjMUw8AfpfDOdRZkgwB
         7++563BWRst48OCU8+1Aoqz1dzmgrKYcNVIm21moPiu5O1k/dJQRQr+nIOjFHVZ00X7u
         BqjsgkRpQ3x7yD2qJj4YC7nHi8MPpsy9ykPxjvBV6hxz7YtAdHMhnzV5wu0BUEH1xvR3
         nyGnCAbxnewCBtFjsERZJRJMEdiWbOgNCnHxpS8n3BJUhIS3GKh4D+1K7ULISreAfqnZ
         mpVpr4dNpM3P9TdAcDbYZD/LpXEnCMuYqrmNusywH0Ol+m9G3gpVwstYK3PVWFWEV5Yl
         KcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=pXVo7Cs71/tg5/xPQSHIws0jZdPnU8iJoGi0JM0s6PA=;
        b=RTWbmh2E/36cKer/eQqBqdxvqY5Jy6fDWr0ahElO2t5BfsZ9seHoB2FvDl6zYCLMom
         7mSCDYzz2/PyVjVqpqPikkUDAN9MbpOpZM+naP5Zt5f0C1ochppUfYZqH+gHhjj7qky9
         VHaPKHNz4Du6rEwyGvlSTAIo1a8A7rko3W1dGb/2bRU3XXHjoEzTfre1GhL6e+wfrWBE
         p/kWwSlb7fcZptv0AFehUW/aDJ16c6XqQO0ACy0l7LEpA3rI4j35ai7lALQ3ojVPXHyT
         Nne8EflQpJvx6QEMZhtzyx80/BEsGc9Ul6LdFQXQYC+xRej76wsG0DeKiMbFAzrHLRgi
         xlsA==
X-Gm-Message-State: ACrzQf0lWS+Uirh5K1GMlEEpACNo5MD+iVmVOtN2l2KaEG8BRBoLyOwI
	0QtoZz8LD76c3U8qC0xqPCI3TuMcwj2lN96xP9Y=
X-Google-Smtp-Source: AMsMyM7xXJNCoERdhmhuTM7BqnBPmPnAjrk0xQutO5ohc44YQZYfyQ01mi7FS4e/VFr3sHX7diHSkNtWtFmGwWDXThY=
X-Received: by 2002:a17:906:5a4e:b0:78c:8106:9cc1 with SMTP id
 my14-20020a1709065a4e00b0078c81069cc1mr9072279ejc.196.1664964889317; Wed, 05
 Oct 2022 03:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221003223222.448551-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YzxwoELNBctbhjJb@spud> <e7340230-9a5b-4caf-a7b0-d048cc335994@app.fastmail.com>
In-Reply-To: <e7340230-9a5b-4caf-a7b0-d048cc335994@app.fastmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Oct 2022 11:14:22 +0100
Message-ID: <CA+V-a8uxuMPr+Jwizn13FjGYtnStG7Nw_MCRkdSz6y9HoEeA=Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
To: Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, guoren <guoren@kernel.org>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Nathan Chancellor <nathan@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_031453_084723_0129A3C7 
X-CRM114-Status: GOOD (  18.54  )
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

Hi Arnd,

On Wed, Oct 5, 2022 at 10:58 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Oct 4, 2022, at 7:42 PM, Conor Dooley wrote:
> > On Mon, Oct 03, 2022 at 11:32:22PM +0100, Prabhakar wrote:
> >>
> >> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> ---
> >>  arch/riscv/include/asm/cacheflush.h    |   8 +
> >>  arch/riscv/include/asm/errata_list.h   |   2 +
> >>  arch/riscv/include/asm/sbi.h           |   1 +
> >>  arch/riscv/mm/dma-noncoherent.c        |  20 ++
> >
> > Stupid question maybe, but I assume you mixed the driver addition and
> > the changes to arch/riscv for the sake of easily creating the RFC?
> >
> >>  drivers/soc/renesas/Makefile           |   4 +
> >>  drivers/soc/renesas/rzf/Makefile       |   3 +
> >>  drivers/soc/renesas/rzf/ax45mp_cache.c | 365 +++++++++++++++++++++++++
> >>  drivers/soc/renesas/rzf/rzf_sbi.h      |  27 ++
>
> My feeling is that L2 cache behavior should live in arch/riscv
> rather than drivers/soc/, since this is not specific to a SoC
> family but rather the CPU core. I would also expect that the
> actual implementation and DT binding can be shared with
> non-renesas SoCs using the same CPU core.
>
Totally agree it is related to the CPU core and not the SoC. During
the BoF session it was agreed that unratified extensions code shouldnt
go under the arch/riscv. Since the code has vendor specific SBI calls
RISC-V maintainers asked to move it SoC specific so that maintenance
of the code falls under SoC vendors.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
