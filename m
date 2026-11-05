Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4160606A326
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 09:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1IlqBGF1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3YKGNHn+P24+o+BSDPEiEqRofPNrp1aNqB39+ZyXBcg=; b=1IlqBGF14gOX2ott7dQ67Z5G0j
	5Zx/aOlwqGkawXtH1Qi1a8W24io6O6AvwOHKS0tRVSQ1KKSbdxGKR7N2dqs8l0/ZVMMSyiiGbAR7Q
	yf6VIRXDJYAoNb3fSjp668l1Y12xal5soj9Y0ctKvqZAHQF3uVYJXrqhJhHv5emCpHcR4bYHDPP/+
	cE3qBvf3NkZ6XyNDazMp83Q9FHxhvkTu42RHFRFee/O/0PpK2q8BNEOkRS9LFxsrEv7oykraIRytu
	Ru641l3gTwRMA9F2OayoaQ7V9Pa9KDNOl1lWavWgQ/5TsHOzZlhkJCX0MrJQbSVdKTkRoKffEUCfM
	xaKQue4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOthZ-00000008I46-2qXi;
	Thu, 05 Nov 2026 09:24:09 +0000
Received: from mail-pf1-f173.google.com ([209.85.210.173])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOthO-00000008I0c-2btb
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 09:24:05 +0000
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so1368179b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 01:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870638; x=1794475438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pdLSFARJtZZaOSy89wvFfnir+tkCHpND5r/hzAKJUn0=;
        b=YdwHE6wU0sk8oxKXnFaUdg9QOgo1lDslzJd3QyyPKAej4oCND1eMDngU9m3RBO7wBI
         8whVsevCs7fTTrlZ+FK8gR2dbBMD+uhQ423U6z01KJ3TJPCqA+nO8y6iBFL7zKhjQ8j+
         mTbOTPvF9jpYEBd/U67x6LNbZ/9cdjhxLfw0BGXPQjSCKE/aezYeg2kaEsMWz7RmNAGe
         J+bjshBMMPSUnehC9hTITlRnkV8Kd6UlbdJtAxTYQ+3UTvqtYFhPZxoCMlr0ni18AR2M
         Oxsmu3loXdE9nNM8+CMnGaqP2X2ctwCe1xs+FWmV5nYDH6jeEyRB7qlXWZxgdaYjSnq4
         kgWQ==
X-Forwarded-Encrypted: i=1; AKwUvByWX+P2kIX2WUoA2KT5sfqNbP6MSU62+1NlqGQh4vCUrUeXtjMQOeI24MThiemEOo4+Fw2+7z2HrnsSjg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9O88XA+AzPASgrjVfilpPZmJC9T0aWdv4B9bNrwKfJVc+8nrQ9
	Ac9OnaymwNAwsLfovatrH2d4glOczIyt/gd6HOQblRCgB8IZSP09Sl9i4wBmTlD/RPI=
X-Gm-Gg: AYBFou0BrASeUo10XhNS4yo5UKuD49SGInZIs7yBTruebrIzen4MxkDnPqQ31TAMoH+
	PsZ+KpSFUxyMu0jsxnMe00hMWYnJ808OS0qQ2QoGVKevBxWC7rqQTV3BPLj7ArD0wMrxSOxiRXB
	g0w/h/nb5MNI/HufiQJNip7P5DSXSif4sfW+8S45dKj8z2XIDk8msU/1RzaGoE+5NBI7tVw0nGD
	R0Krm3SrilhYbJ4f0CGo1ahmO2Zhmc3Pv4qPUSwyn8gw15B7BKgV8baus9L26u7LgHhNDf9TgdU
	12n3HyxxkKz/oHqg4Ky9meuofXbm8WHEagk362wbmvMUi9apxuyOinRKfkTRofkrmonG/CJZuP5
	at4x60fmAUZ9xt/O7b+LSwxMmS4RIH5qMhydS/TQi+7jUFOgw2s0ZGNtz1yMcF5jy00tJylO9ie
	UBGWFndFoFjOpSdMHNxwYZxNUa9wI6ATiG6jSu5NKqetNC9mmZV4jmMHy+Yyo+hbHaXkBmkmq5H
	0sfsQMDG0Q7mA1jr5soR2pr5jPAWGgWXtgMlIJJhthHd9FksHJXl0G7XpVEdAr5u1gd4ML++LE2
	0O+edkxZGlHnfidPaDAsvKA9XWUJ302PWYq+9WZSfpFUlIhobo7NUPVk611XNhdQ
X-Received: by 2002:a05:6a00:9514:b0:880:973d:597a with SMTP id d2e1a72fcca58-8a9bdcc7e4fmr16824640b3a.53.1793870637660;
        Thu, 05 Nov 2026 01:23:57 -0800 (PST)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com. [74.125.82.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b470b7esm1813210b3a.32.2026.11.05.01.23.56
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:23:56 -0800 (PST)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so289252c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 01:23:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxZA2051Zug22hBbT2V9uCTMRu5mY3W4E5Vse/9H+e6zaQQi9S+2ZlKqSbs/hMrzUXrgGDIS2xgJnKnRw==@lists.infradead.org
X-Received: by 2002:a05:6102:3711:b0:7c8:1fd5:82b5 with SMTP id
 ada2fe7eead31-7d072695e4emr7033715137.14.1793870187629; Thu, 05 Nov 2026
 01:16:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
 <b656861c-a087-4087-952e-91fd15fadd52@kernel.org> <auuZHTvr5UI9Q9Q4@ashevche-desk.local>
 <fbcb650d-0f60-468d-b1cc-255ea8a93db3@kernel.org> <auxF9RT5aljXkfh7@ashevche-desk.local>
 <auxGdYgJvjq9EBu6@ashevche-desk.local>
In-Reply-To: <auxGdYgJvjq9EBu6@ashevche-desk.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:16:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkzXMsv_4KHP20qidmH1B4Ew3=VuTJ8jqfqvx4_+pm4Q@mail.gmail.com>
X-Gm-Features: AclHuK9751j09IKd6_4EIkqyFvn0FA5bsvqOYkEgIDax6KzLeXviQYPveqzIsxk
Message-ID: <CAMuHMdUkzXMsv_4KHP20qidmH1B4Ew3=VuTJ8jqfqvx4_+pm4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Konstantin Ryabitsev <mricon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:RENESAS RZ/V2H(P) RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Thierry Reding <treding@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_012358_666961_2B6ED063 
X-CRM114-Status: GOOD (  36.51  )
X-Spam-Score: -1.6 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 5 Nov 2026 at 10:04, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Nov 05, 2026 at 11:01:55AM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 05, 2026 at 12:02:21AM +0100, Krzysztof Kozlowski wrote:
> > > On 04/11/2026 21:44, Andy Shevchenko wrote:
> > > >> Andy,
> > > >> These three lines look correct.
> > > >>
> > > >> LGTM:
> > > >>
> > > >> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > >
> > > > As
> > > >
> > > >   Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org> # atmel-quadspi
> > > >
> > > > Note, it's in your power to ask the author to split out what you maintain
> > > > to a separate change. So, it's your choice what to do, Ack the full patch,
> > > > give a partial Rb, ask for a split, ignore reviewing (often means silent
> > > > agreement when maintainer just applies that kind of a patch)
> > >
> > > The "# note" after the tag solves the problem partially, if people were
> > > actually using it. Solves people looking at the Git commit and being
> > > mislead by partial review applying to entire commit. Does not solve
> > > credits, because Rb for three lines is not the same as for 100.
> > >
> > > From v1 of this patch, four people (Alain, Lab, Troy, Kunihiko) did not
> > > use it even though reviewing only part. Only Wolfram, so 20% of partial
> > > reviews, used that syntax. Without that syntax, b4 will pick up Rb tag
> > > like it was for entire commit.
> > >
> > > So I do repeat - if one does not want to use that syntax, then just Ack,
> > > instead of creating false impression of reviewing everything.
> >
> > +Konstantin, then we need to teach `b4` not to break that or convert it to
> > something like
> >
> >   [FirstName: reviewed only ...]
> >   Reviewed-by: FirstName LastName <...>
>
> And Ack is not the same as Rb, when I *reviewed* patch, I have *reviewed* it,
> even if it was partial one.

Exactly.

Ab means I won't take it through my tree, please take it through a
different tree.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
