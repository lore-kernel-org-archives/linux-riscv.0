Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B87C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 18:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CQgTNrYEJ1lei8op0SSSYeXZ9nbIpo7hSQYNIOfvgc=; b=ziOnVUlBEKP08y
	jlL36CaEF/HwS6b746sXkxO6M55uJkoFsBVASnrsz3PjfuWZhkTcUJyoQ7LAnpFfkpF4U2U9+eKY2
	580eAY9kC2n9FVGro8crWKEFzwrbxkFNU1O9mKHbT4kdqqhF4K1z8s1T+1QZYz6h6dxGFQFobMiBT
	F+JAKHeuBpJNz74k64msigd14kFrwTI47ywCOyZ8a4EeWAoIQxzwNj+A3jr1IfDHQinC0BfysA9Mx
	u54YhHbWPtqIVDpqzTRXckCs7tPgSA5JLxhsLtURqoZC27AmYdGEBjMwnRnqP5czHt3rJs7ApWi+t
	uVQ3ySCpyC8+gsinEhqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOMDR-00000004Xmm-2RZi;
	Mon, 01 Jul 2024 18:57:29 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOMDO-00000004XlW-2ILy
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 18:57:27 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so4992162e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 11:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719860245; x=1720465045; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q49UV1fhZoJh55tliUUlhno1LHBht8m9FzffRPOFNQo=;
        b=jJkqO8TcIS46BpoBJLBc9TG/uqfmZzlKu5gseiDYZHK46QCFcnYhAYdESOjNxU+pxD
         8AiOB9CB6OrH93GAnGkM1WN+s5UXdQhN6uIWtgD5m/Zuohpk4cFMuDjA5cVgNE46kwH4
         VoIG4uycQQFUOguRQCvvVG3M5dgSIijyyikPVeB+A7cV73B8EdQiwXYtVBBuEjbIjwyJ
         mbOGA40ZTgOXggU7Pztz4oDjrDd9dO/cHtI4V+b9sg0z2QAvi61/Wv+TvB+E21bWnogu
         eHctB3Vwhd4pZR+ghMdr+VfYEsVHsKCS/AhAgZ2BPmVhsM4jhSlOlQFNGxOBbJ2MMgNL
         bMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719860245; x=1720465045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q49UV1fhZoJh55tliUUlhno1LHBht8m9FzffRPOFNQo=;
        b=ABLsGOOhGqUYp8G8eziKZc3u815XjHMWm3e90S/wtaAknaopzsVwDLhdYDS/6AAoNg
         q/yinMeNcBfWd46JE+HZAb5MZmREVylqoKS7m5Wq0doJ+oINqn0ZbJekONhJl+joJpES
         63ab5doqxBdeItcogC9SFoVWrjXvyqBJx3uDTZqF4Wo87B76G04CvH5CQNbcpRQBWSLR
         sk+Pph88oBnCXGqi8lvf8LA4NfeFx+RSvbBfzR0kzzP5mQ1fz1geDjv7cP+6fkdCDG47
         U6UixOWKOuEqVcGSuwBre9hLXUfMX/mmv7KI45NHacHM37eVE0zTW2SVwuvQzGtjP9SN
         MuIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlF46DB7i7tkwBz0+ScnrgDMDdTZAvdSYYuGrKjcHzzukepUcrUb4VxcGLoLHJfihbrc3c52PEJb9vYBGHQOdF68hKbCA0OLC0pDvQPH3e
X-Gm-Message-State: AOJu0YwqF9jnyajLu34UrXMhcLohxlQnf7D6UKN4/hjO0aayQ3hUF1Yg
	YBTRX+99AB1Bz+v8KEVsQUva0FxPHbAEO7k4ViI1PBpLkTpHv8KID9RCSRaV
X-Google-Smtp-Source: AGHT+IFg1bUBTgjXF+dS+9kKhJxaeFGRkF8L6asmbi4XVxCVl83HmHprSX+491ZE//Y7XviS0AI7zw==
X-Received: by 2002:a05:6512:1192:b0:52c:dfa7:9f43 with SMTP id 2adb3069b0e04-52e82685fd9mr4470285e87.34.1719860244448;
        Mon, 01 Jul 2024 11:57:24 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e8b78c797sm434030e87.19.2024.07.01.11.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:57:23 -0700 (PDT)
Date: Mon, 1 Jul 2024 21:57:20 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Samuel Holland <samuel.holland@sifive.com>, 
	Kanak Shilledar <kanakshilledar@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kanak Shilledar <kanakshilledar@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/3] spi: dw-mmio: update dw_spi_mmio_of_match struct
 with thead
Message-ID: <23gvjkszxvf6zehiqetjfmtf67nlpnnfmhgx234jnxwrtmbdpr@4yv64sz2kpcs>
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
 <20240701121355.262259-4-kanakshilledar@gmail.com>
 <f8604c68-8866-447b-a874-562bdad1df79@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8604c68-8866-447b-a874-562bdad1df79@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_115726_623497_CDF8D31D 
X-CRM114-Status: GOOD (  25.50  )
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

Hi folks

On Mon, Jul 01, 2024 at 08:17:29AM -0500, Samuel Holland wrote:
> Hi Kanak,
> 
> On 2024-07-01 7:13 AM, Kanak Shilledar wrote:
> > updated the struct of_device_id dw_spi_mmio_of_match to include
> > the updated compatible value for TH1520 SoC ("thead,th1520-spi")
> > to initialize with dw_spi_pssi_init().
> > 
> > Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> > ---
> > Changes in v2:
> > - Separated from a single patch file.
> > ---
> >  drivers/spi/spi-dw-mmio.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> > index 819907e332c4..39e3d46ebf5d 100644
> > --- a/drivers/spi/spi-dw-mmio.c
> > +++ b/drivers/spi/spi-dw-mmio.c
> > @@ -419,6 +419,7 @@ static const struct of_device_id dw_spi_mmio_of_match[] = {
> >  	{ .compatible = "microchip,sparx5-spi", dw_spi_mscc_sparx5_init},
> >  	{ .compatible = "canaan,k210-spi", dw_spi_canaan_k210_init},
> >  	{ .compatible = "amd,pensando-elba-spi", .data = dw_spi_elba_init},
> > +	{ .compatible = "thead,th1520-spi", .data = dw_spi_pssi_init},
> 
> Your binding requires snps,dw-apb-ssi as a fallback compatible string, which is
> already supported by this driver and uses the same match data. So you don't need
> this patch; its only effect is to make the kernel larger.

Agree with Samuel comment. Indeed there is no point in adding the
vendor-specific device-name supported in the driver if the fallback
compatible works as-is.

From that perspective we shouldn't have merged in the patch adding the
Renesas RZN1 SPI device name support, since the generic fallback
compatible works for it. On the contrary the Microsemi Ocelot/Jaguar2
SoC SPI DT-bindings shouldn't have been defined with the generic
fallback compatible since should the device be bound via the generic
name it won't work as expected.

Although, it's better to hear out what Rob, Conor or Krzysztof think
about this.

-Serge(y)

> 
> Regards,
> Samuel
> 
> >  	{ /* end of table */}
> >  };
> >  MODULE_DEVICE_TABLE(of, dw_spi_mmio_of_match);
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
