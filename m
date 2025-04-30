Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE0FC369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 22:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHAqiqDb6o9aEczdiWcUO4U3M37Q0Egit15GB5Fhd/Q=; b=mSe0i9T4Bo+JKY
	WQF3KLwOBwHCCWavTAJg2BiaD7NV3vvqweyjIRco1cgxkGtYUTYX8sBMdfb/lZccsGoET9p9H+2vp
	uOBrZ7O/+WmKm4vIySccWWW/Py0uppJK+4Bjaeh0nDSRGUSNqRpJqq/PXx6SJaTNcokNw8SLTR4y7
	zpmomRJGsFhuHW2m9/zGvoK/enTVU4iFsOZlHquXFd/e4bioZlfwh2yBmdAXko07+L102LLURp5m3
	hU26ww7WmBN2sLL8Whces8HzNOaMZUkT3KuOS9JC9pn6PgvMb2xEc2wGSnbHuWgTK41i+MgBRf/E2
	H0y26FY/H+v1+pxf21Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAGB4-0000000EBRv-1fOH;
	Wed, 30 Apr 2025 22:45:18 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAG9G-0000000EBAH-0G3X
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 22:43:27 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6e8fb83e137so4848356d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 15:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746053005; x=1746657805; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fanbo0paPBUBXhFMWx1nyQAi5WFjbZwo9JNNJ+WKtHw=;
        b=JrAf4+ch82ubVTMAMnZwipmKWVI4q7ejf35Q59BRad51FwKdnIa+tkB13NTyJx4W58
         WAJP3qwB17vg4c+1SDcT1rS+EoZVMXnLbZtJAX1EkASoCr5ADXQE5H8NUfy6pMo1Qrb1
         hL7d9C9YSW29W3uWIuOG2QTWtoqz6peektXw5Ig6IjA81jsZXYh3emizTQLSx2CelF5u
         /GO1i901GUWcZ6Y8uORYd+mt0J5LD5cAx5jWZ8wJNni1AgfOSmEB073GsYfZHnXnXQ1o
         q+b8857NZju4HZ5zRzSvItxWTjKql3jDzbGMfRTEX/oVt5pvYFnXJDhvqxcktXDLwSJ0
         GrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746053005; x=1746657805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fanbo0paPBUBXhFMWx1nyQAi5WFjbZwo9JNNJ+WKtHw=;
        b=MqZg1PpxGnOsa1ABe6kRr6SY47jXFpioEj6LCnaCEA5cEcaaLG7zKGNczOvQA+imCp
         msO56oxmtR+ei+Yl6CSeNmTPbEF2AWDBg3wvi4MFR83+7Imm0W8XpuoUmEwlsS9xOaxB
         5K4mex64onTDUCeWrFEHrLbhfxVvO5tl3tIkktPa6wQRHM0AWVXFy36/dGaZvzy1t3dr
         qd11bVg/GjpkAm7wrXmO+5YA2/0FpYgGS+Xx/WgiOe5MmKUP9vXgNLvuHRIdKda/bRZ0
         PthmBLjpNGxfcsU1ZE4RycN7v3nyq45Mv4x2Ir63ke9MmO+MxMm44eKqgFbihSyjS2zJ
         RtYw==
X-Forwarded-Encrypted: i=1; AJvYcCWDjCLoZv+XndTLN01YQW9VtR1npDk/6mdXdsFMqgqHfIyzJEexE5I7GQVYiwETt40P4Tba5uQayYWi2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7i/zQQpNE90NGyazV65ZnUtCc5sQ1PpiX/YyQT32Il/r5JtUm
	T1P1zKVR8HQiXsF0Q8BfX6Avlfp+Ej7/1pAbW0kQESDwtAJv3DoF
X-Gm-Gg: ASbGnctIXOg4+dDIyI545pVeb1kjXGKMXXUebvhO5d96UnlKPnvivrKIvT3ODeS6oNw
	eg2HtvDBwjb4UwkjJ+3KLrbcuTPFuP/HxkDTv3PamBNTPSgPLFzsSlbfK7z7c7mKMC5LZo5POBN
	zEI4fSktoLDl7oYrVKV0U5AO+qUdqK7RgGYwyQDXrhW1GL9rajNxyVvQsqVyvzpcWPzZ+1JFNdw
	gceJ5RFXrL9cdUG/J0JyHGnSqotC7Ka92EpJgCDH1Rj0sR9nhjmD+C+VwAwCCRfbBburYqW1Dms
	t6g921Is38SU37nz
X-Google-Smtp-Source: AGHT+IFO1aCRIZ/0N8Q8OG8yNS/rlnBCUVOfqQhrwjWHjsgTBzgmkOJlnBxrxLot12lUcMwexg9s9Q==
X-Received: by 2002:a05:6214:5004:b0:6e6:6713:3ea8 with SMTP id 6a1803df08f44-6f509118d8dmr20881566d6.23.1746053004612;
        Wed, 30 Apr 2025 15:43:24 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe6abef4sm13590726d6.18.2025.04.30.15.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:43:24 -0700 (PDT)
Date: Thu, 1 May 2025 06:43:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] clk: sophgo: Add support for newly added precise
 compatible
Message-ID: <otuaro3xh2ut3kurcomrq5j3guyyj7uhhwgngqdqqrrcpvlk6t@4wqbxy3m3tq7>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
 <20250430-radiance-rebuilt-2caa906d5e6f@spud>
 <20250430-snort-raider-dbf10d14993f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250430-snort-raider-dbf10d14993f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_154326_128549_509885CC 
X-CRM114-Status: GOOD (  21.80  )
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

On Wed, Apr 30, 2025 at 04:37:01PM +0100, Conor Dooley wrote:
> On Wed, Apr 30, 2025 at 04:33:39PM +0100, Conor Dooley wrote:
> > On Wed, Apr 30, 2025 at 10:09:30AM +0800, Inochi Amaoto wrote:
> > > Add of device id definition for newly added precise compatible.
> > > 
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  drivers/clk/sophgo/clk-cv1800.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
> > > index e0c4dc347579..e10221df6385 100644
> > > --- a/drivers/clk/sophgo/clk-cv1800.c
> > > +++ b/drivers/clk/sophgo/clk-cv1800.c
> > > @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device *pdev)
> > >  
> > >  static const struct of_device_id cv1800_clk_ids[] = {
> > >  	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
> > > +	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
> > 
> > Given the same data is used here, should there not be fallbacks in the
> > dt for some of these? For example, 1812 to 1800? Or is that not okay,
> > because 1800 is not a real device id?
> > 
> > >  	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
> > > +	{ .compatible = "sophgo,cv1812h-clk", .data = &cv1800_desc },
> > >  	{ .compatible = "sophgo,sg2000-clk", .data = &sg2000_desc },
> > > +	{ .compatible = "sophgo,sg2002-clk", .data = &sg2000_desc },
> 
> Actually, this one is a better example. sg2000 is not marked deprecated.
> sg2002 uses the same match data. Why is no fallback to sg2000 used for
> the sg2002 case?

Yeah, It is a good idea. I will take it, thanks,

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
