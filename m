Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C7CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 09:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KUPF7Hz4jRd1qlwacrOrKftWfSK1YnIpjr+Vp+KrqAY=; b=n9PBAthOJFiFmB
	psfAiNtXoXDPmZ6QpcOU6SNqKGYQNPLDYCGFnDoGy5BaYqZMqsDnQFmOiP7uKpLSNHVs148Ol0y7w
	CxJbnSa1sInUtJ0JwY4Q5DXSk9JMahxZQb78Ea8UqB72+RG1I+GHqoN7KoemkSIiPOgJMoVrfNiD9
	U5Aank6+TnovjtW/H83ycFofJldf7qcQ66K+FDIHZ6HHlhz02zSJA9lwEr2QBZ2YepfShLr1ac7yB
	DY01ec3kK5WQnkkfVwa1EVZRDfbyvYER4rYlhrhBHm3t6ysvFhKR8yp0HksFuYaLwq0/s/kWLj2tB
	F7d7lw+S7Q/C+hoPvHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3aFW-004eNa-5t; Tue, 21 Jun 2022 09:32:42 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3aFS-004eLF-VA
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 09:32:40 +0000
Received: by mail-lf1-x136.google.com with SMTP id t24so9127632lfr.4
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jun 2022 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KVxqgQkmpuz9sfivRrmvLlkvyXCsZ/UVRlJX8Kn06s0=;
        b=baOjPn3HMnQGhZj1nBS+hjUUnJUJ+Qaef24QVnmcEHRl7vEXdUjo5QRsBfEgNpCnf1
         Jm2mGhGNtiWo638Mh2HKumHhvcYmxsqdqaKFiIY93JNSLRKOtYQlJpKBnZGURLayjob+
         /MB/FkKHC8pVilIrHz6/2s03W4EKJQLZphbVT9pgnKGGgCYWlbAKxlSPmKCXeDMSOGEz
         k4bqKGBybgmOLqK4EsPHVpmL5fxyLVBFK/CNU2l5aGa83kOmEMKiC50ivmJ883ZTIT77
         lTZMo0A50VvPHdVjC+D1Xe9WkvlxRXsvrK+2mvS5A9BpF2X8NlUaokkHL1Dw0Q1ZNI3b
         GQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KVxqgQkmpuz9sfivRrmvLlkvyXCsZ/UVRlJX8Kn06s0=;
        b=n15gk0lq9RGYo/LW6UhzdHQhH2jgtet881djVdnq4tT56BTLaxFkxI758bHCSWIKAO
         bYQ60Op+LFG8edOCV5/BoVbdnRryUoBmKwvd3X46kKfas2U7MCQEnswkmwe/bhk81F5r
         a9cnkcN+vVu/1R4oHLN9cWdM6XlSTXyxORzfYuRhcPw4ch90/Z/QVxW70wapN9ftrvsl
         XA7BKLM5RTOmE9APvfJqZOM9MFCH26A0fEEy7FNdz+WMnZn/g4h8T3jaazYCNjShfj+d
         ThvZDVq2+IVixB7j3pPAZkFOh5bQRvPG28hCE0WqL4qb94u3rHZIlqYC161rVV3FC6zu
         d4bQ==
X-Gm-Message-State: AJIora+V3pTakTQH7ygeuLAIpy8+B7faCxD8jKNMyCmj192V6unnetUY
	DxSRG7V8kcEKy44l8Q4QRDs=
X-Google-Smtp-Source: AGRyM1tUHbN/43UfLBdEExbn+1p4lZ6hBmumkDYlyBIRa9Zw3iDqI9SetAAfAkHiF5XrbJVvOtVraA==
X-Received: by 2002:a05:6512:2808:b0:47f:51c4:1dea with SMTP id cf8-20020a056512280800b0047f51c41deamr12102421lfb.390.1655803954972;
        Tue, 21 Jun 2022 02:32:34 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id h21-20020a19ca55000000b00477a287438csm916926lfj.2.2022.06.21.02.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 02:32:34 -0700 (PDT)
Date: Tue, 21 Jun 2022 12:32:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <mail@conchuod.ie>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
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
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Message-ID: <20220621093231.tytrh6fimzfxgzm2@mobilestation>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <CAMuHMdWDcnAxjxdwpnbfUiDUoo=RGvQm537-EboAmaQTmxpY-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWDcnAxjxdwpnbfUiDUoo=RGvQm537-EboAmaQTmxpY-g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_023239_026153_35E47A4E 
X-CRM114-Status: GOOD (  31.78  )
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

Hi Geert

On Tue, Jun 21, 2022 at 09:03:25AM +0200, Geert Uytterhoeven wrote:
> Hi Serge,
> 
> On Mon, Jun 20, 2022 at 10:56 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >

[...]

> > > +
> > > +        spi-rx-bus-width:
> > > +          const: 1
> > > +
> > > +        spi-tx-bus-width:
> > > +          const: 1
> >
> > You can just use a more relaxed constraint "enum: [1 2 4 8]" here
> > irrespective from the compatible string. The modern DW APB SSI
> > controllers of v.4.* and newer also support the enhanced SPI Modes too
> > (Dual, Quad and Octal). Since the IP-core version is auto-detected at
> > run-time there is no way to create a DT-schema correctly constraining
> > the Rx/Tx SPI bus widths. So let's keep the
> > compatible-string-independent "patternProperties" here but just extend
> > the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
> > properties values.
> >

> > Note the DW APB SSI/AHB SSI driver currently doesn't support the
> > enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
> > bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
> > DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
> > activated by means of the corresponding CSR. So most likely the DW AHB
> > SSI controllers need some specific setups too.
> 
> That doesn't matter here, as DT describes hardware, not software
> limitations.

Can't argue with that.) My note regarding the current DW APB SSI
driver was mainly addressed for the Canaan K210 users, since
should the SoC-based board really have the Quad Tx/Rx SPI bus
most likely the interface won't work with the full bandwidth.
So it is a good reason to perform the platform research and if
possible alter the driver accordingly.

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
