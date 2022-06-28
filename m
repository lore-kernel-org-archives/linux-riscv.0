Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BDAC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 11:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5L2paWHltCoXmUVEUZFX9ul5UqZcUO2y7ZQKYa1nG8=; b=D6zYI326QP3lvn
	6+FjqlbuArqwwjijlBr01sZXPkuqaytrkJ27eKjg4qyOtbd2R56PU2TE7NAQOsCKf68b9dsGyqBQd
	mnC/orpRYdbeaI3IVvdWrdRTD3tXmTwDfSf37lVT7/F0rW5U6eqNSDj6BAD/nNfXi2fqlbqoFcoBi
	1E3q5pjuDAAF58PKHtEERW9kXskjS5C/Q8rfKmlzueUYbrbWejRazBb2TyHgKWrxGkAjFf540w9Nz
	+dVwWZaqwxTct4R4dvdJ7P0PzsgFgOn0McKpo8AIBlJEbr1TxQYu8/P1qMsiRMQXsp1zsiEQhcTUo
	KXg//zwjuUjxIG4o3xEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o690t-005pqg-04; Tue, 28 Jun 2022 11:04:11 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o690q-005po2-3Y
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 11:04:09 +0000
Received: by mail-lj1-x235.google.com with SMTP id b19so1697920ljf.6
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jun 2022 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/8pU2gScmMW6polZpgp4B71BlGG/FUv4k+/v6LUH1/0=;
        b=bky/Bhn0cY13mgxukdilwlhr5+lAOlxcGYy6kAvfvTBelfCzahaGV8UvN9cqUEeN7Y
         XBLEJ3ZadScFZdMmRpm1ZR48lKzjqev39XsszP0QgThb2ib6BaEpm938emdir4nAIO8M
         7e/C+4pzw+unC5Ef+0smMPs7B6VNirDrMrOPMkntO3q97JOfHS+4nMNL35iL59PNhd6W
         t5UNdmfEPbNUQ/65Gv5Ne4wDCdyMZcnYVCZt17l/Psc2SCLhuxq1e+bx8DPIEjqXVh3E
         W71ONBZQdfp1LTwv+ScSaXWD4uv2xYmxDSAuHT4wnNZgMCT2EpraMyrwHS5pwLahAZ0I
         AEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/8pU2gScmMW6polZpgp4B71BlGG/FUv4k+/v6LUH1/0=;
        b=G2prSPVNTvj+cvqajfNq7RuuTChXJ+DlO2C9eRQVl0DWU0IN1xTCmV+xW8A8icX8hT
         Q7QUm22jXJRiH2Msi/n0fyHc02ZNv1fOJ6mFM/ZruVByUdHMGaYgP22i3sE7a115/73B
         x8Ao4SpaqGcWLCnkbfUP/BX/CGoJWChUYNTvJ07nSfwnHx7QL14ZAPsKajOoBWdBl/Ai
         ZNDFuG7GoiyeEyIF8fYguOtuQo6svwfwh3OnTgcEv5O58bZOq3GuWK/Zj8HOkl6nQv4q
         54srYIFhevjPfCxEyODdbNSfscWYpsuDzW/NAWoJRiedZ3tawmkUoDPyO2A2d8QHcFhR
         M/Qg==
X-Gm-Message-State: AJIora+d2GpqbwHXSyfcnlLI7d50A6/BJ5GgHR+HXJL6SBjyIFo6paB2
	im71sZnJN4eMcxeYztkmhS8=
X-Google-Smtp-Source: AGRyM1t9+uICFWO0tG/T7UXS6lTPnI1Wc64vAYk9Ch5AqWX88peQMeamaNU0eBwE3tD3fcJyxIVoJw==
X-Received: by 2002:a2e:b891:0:b0:25a:9175:3282 with SMTP id r17-20020a2eb891000000b0025a91753282mr9640485ljp.78.1656414245063;
        Tue, 28 Jun 2022 04:04:05 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id e13-20020a05651c038d00b00258f1e0fb32sm1752156ljp.23.2022.06.28.04.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 04:04:04 -0700 (PDT)
Date: Tue, 28 Jun 2022 14:04:01 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
	Conor Dooley <mail@conchuod.ie>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Heng Sia <jee.heng.sia@intel.com>,
	Jose Abreu <joabreu@synopsys.com>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dmaengine <dmaengine@vger.kernel.org>,
	ALSA Development Mailing List <alsa-devel@alsa-project.org>,
	linux-spi <linux-spi@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 04/14] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Message-ID: <20220628110401.o6jy2kuyw3hhk3yy@mobilestation>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-5-mail@conchuod.ie>
 <20220627232919.GA3158390-robh@kernel.org>
 <40d76866-34e3-baef-c3fe-8836cd2430f6@microchip.com>
 <CAMuHMdXjXGBi8S+bTG105q63zZw2ScQb9nXBSp2baiLNWKQAkg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXjXGBi8S+bTG105q63zZw2ScQb9nXBSp2baiLNWKQAkg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_040408_204189_FE26581F 
X-CRM114-Status: GOOD (  27.62  )
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

On Tue, Jun 28, 2022 at 09:08:32AM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
> 
> On Tue, Jun 28, 2022 at 8:30 AM <Conor.Dooley@microchip.com> wrote:
> > On 28/06/2022 00:29, Rob Herring wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > >
> > > On Sat, Jun 18, 2022 at 01:30:26PM +0100, Conor Dooley wrote:
> > >> From: Conor Dooley <conor.dooley@microchip.com>
> > >>
> > >> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> > >> controller, but according to the documentation & devicetree it has 6
> > >> interrupts rather than the standard one. Add a custom compatible that
> > >> supports the 6 interrupt configuration which falls back to the standard
> > >> binding which is currently the one in use in the devicetree entry.
> > >

> > > But it works with only 1 interrupt?
> >
> > Seemingly...
> 
> The Linux driver uses the only first interrupt.

Folks, there v2 of this series. A more suitable and justified solution has
been given there:
Link: https://lore.kernel.org/lkml/20220627213450.ukqai4bsjzcwhnlp@mobilestation/

-Sergey

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
