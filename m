Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5272C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=G9R2+kUmtrcT62Pil/po/dPcx2iYiNDsIBAgxprQXqU=; b=JBOYOndXB4NhA9K+iP0sfBoTGx
	QfVVXhGL9bXheTtkvmNMYxe36FjuI1ATiky1nYr0ggD1f6yIDRIG4C8/6m3X034DLpyRQXT2XAHDz
	Q984FHn+6BhcuhXf9wt8kVlzkeXNgnTo/guBmzDHtkyY7usG4nVG3b7ODsC3ZYOsauEkvgwdl+CZA
	lVzLbpq9XR+GLJdfcMlyV+i2XFCpx4i10I2iq6tSlkASa6jfUB7RBFYBugW8R4+O9w6Hjn5TWICOV
	Qxi+cKylxTmtxYSxsNaL5P5EMm1om9i4RSNciXPJuHcazK88bGgmnQ50vkPNaX0IwRmMh8dfAbzrc
	ynD4dl1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxqAg-005Top-2G;
	Tue, 31 Oct 2023 14:56:46 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxqAc-005Tnm-2E
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 14:56:44 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6F2D43F1D9
	for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698764200;
	bh=FpYMLQZ13miVSKwRHhEO2KWJ/cMhZ5Lcm8HLU14KOBM=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=spurTmNp5SEcYCZdGt0eg8UNkRbsSdgB3U1sU7IZm/X8BPslcO+jJpcAN3d2NsdAj
	 SfUP7swnoGg0j/BNv8yoi7c3V+hUUQr+byBUD96tJFjPUAABm7wv1Bbh6zTUunIJln
	 TTbn7pEQV7XTwkgdBy95NNPeOTsgZPg5uIj5ZPje3NVeF9HIxYtNGLIUK+GLQ8UOKC
	 /3+8gKpYJg4IjBrspTMhk6nx5vUdgrv5hTcE2+H2wBJ5+/D+jX0uhHdrhxKA3HntS7
	 QiSOGF/uAYjW+weFlO8wfuMfNPYFz/7grn9B7QwLk92tBym4fnJX0715+SDGS24tZ4
	 c07pWYeqGePSQ==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41cca2532b8so69948081cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 07:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698764199; x=1699368999;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FpYMLQZ13miVSKwRHhEO2KWJ/cMhZ5Lcm8HLU14KOBM=;
        b=psHEMWCbMrrXK6B/hQ9pSWnc0DvcJP4do6VwkBL3tzg9zd+bNXcbCHFMC10xeqk6Bj
         CM7zxqaVPn7IevAjmeqdwq8Z5H3WWQFbViugx9yDzI0QAKdgqfVb8v3lfc4I/V48j79s
         BQKAFW/YTGx67bILJU0ZIn0x3KzQj3NzFJZDuPD4xmYoptZauBJ2kTdxaH/pgdXc+ouo
         a5R5tPIW/Tk2STCUvCk4F80bqqd/DysNlc+UwQ4Crspg3OPpmcynYZIH/ScBLvbMJtZd
         eBuajj6aaGzn2DTBQu5b4UiG9dAgQxmyxfTDPmuBoa5XugeSXXgm0nUV90Ou6HEUb+VI
         Znqg==
X-Gm-Message-State: AOJu0YwCVeAVhM7NiS/1WR+kKpMq9a7itGfHd1lVvaZ5psKMXM1qNZNb
	MhbLTgj9hQNr4fevowIDjvFVQLDknZis+D9pJA/e2+NT1ckBLs1bY7ewBuxbAoRlUVCkE+G7he+
	LQq8BrwmUzU4Hk4Q3trGaLJFbeQOxke8eqNtuGujtQMY1sUcQ7+N2VBbanr7i/g==
X-Received: by 2002:ac8:7f83:0:b0:41e:204b:f931 with SMTP id z3-20020ac87f83000000b0041e204bf931mr17140699qtj.42.1698764199253;
        Tue, 31 Oct 2023 07:56:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhxXT6zh5apbHzBARYifBNWbjuGUA0HkX/8LhJMxPXwDzweT07IN3atmh/TMSuRVNN9nyxQvVV4SHG8UkDbZU=
X-Received: by 2002:ac8:7f83:0:b0:41e:204b:f931 with SMTP id
 z3-20020ac87f83000000b0041e204bf931mr17140690qtj.42.1698764198975; Tue, 31
 Oct 2023 07:56:38 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Oct 2023 07:56:38 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <9b8c9846-20be-4cfa-aff5-f9ae8ac2aba4@lunn.ch>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-9-cristian.ciocaltea@collabora.com> <9b8c9846-20be-4cfa-aff5-f9ae8ac2aba4@lunn.ch>
Mime-Version: 1.0
Date: Tue, 31 Oct 2023 07:56:38 -0700
Message-ID: <CAJM55Z_+A1jceB5QWwZ9=roAs7jeAb7E-CEdw3mSOng=jyVDYg@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] riscv: dts: starfive: Add pool for coherent DMA
 memory on JH7100 boards
To: Andrew Lunn <andrew@lunn.ch>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_075643_119739_56FFD611 
X-CRM114-Status: GOOD (  26.87  )
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

Andrew Lunn wrote:
> On Sun, Oct 29, 2023 at 06:27:08AM +0200, Cristian Ciocaltea wrote:
> > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >
> > The StarFive JH7100 SoC has non-coherent device DMAs, but most drivers
> > expect to be able to allocate coherent memory for DMA descriptors and
> > such. However on the JH7100 DDR memory appears twice in the physical
> > memory map, once cached and once uncached:
> >
> >   0x00_8000_0000 - 0x08_7fff_ffff : Off chip DDR memory, cached
> >   0x10_0000_0000 - 0x17_ffff_ffff : Off chip DDR memory, uncached
> >
> > To use this uncached region we create a global DMA memory pool there and
> > reserve the corresponding area in the cached region.
> >
> > However the uncached region is fully above the 32bit address limit, so add
> > a dma-ranges map so the DMA address used for peripherals is still in the
> > regular cached region below the limit.
> >
> > Link: https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Data%20Sheet%20V01.01.04-EN%20(4-21-2021).pdf
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> >  .../boot/dts/starfive/jh7100-common.dtsi      | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > index b93ce351a90f..504c73f01f14 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > @@ -39,6 +39,30 @@ led-ack {
> >  			label = "ack";
> >  		};
> >  	};
> > +
> > +	reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +
> > +		dma-reserved {
> > +			reg = <0x0 0xfa000000 0x0 0x1000000>;
>
> If i'm reading this correctly, this is at the top of the first 4G of
> RAM. But this is jh7100-common.dtsi. Is it guaranteed that all boards
> derived from this have at least 4G? What happens is a board only has
> 2G?

Yes, both the BeagleV Starlight and StarFive VisionFive V1 boards have at least
4G of ram and there won't be any more boards with this SoC. It was a test chip
for the JH7110 after all.

There aren't really any limitations on where this pool could be placed, so I
just chose to wedge it between ranges reserved for graphics by the bootloader.
If anyone has a better idea please go ahead and change it.

>
> It might also be worth putting a comment here about the memory being
> mapped twice. In the ARM world that would be illegal, so its maybe not
> seen that often. Yes, the commit message explains that, but when i
> look at the code on its own, it is less obvious.
>
> > +			no-map;
> > +		};
> > +
> > +		linux,dma {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0x10 0x7a000000 0x0 0x1000000>;
> > +			no-map;
> > +			linux,dma-default;
> > +		};
> > +	};

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
