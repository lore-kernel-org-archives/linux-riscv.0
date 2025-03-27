Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9943CC3600B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 09:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HFC+bk9ecimg9zTbzEAJNKmwSFitwxUVw+TUs3z5SgU=; b=r39vdEcR6+fiE5GfOLL2x+mAyC
	vBXtwKo5MYQAxRLGA1vKOcs2Ky+ne70bfenb4/WPTl/2t4LFZvif6ul/m5qlP2HSlTLf2++JhYvDy
	2605O50BC/32+8FPHHgUDzmBpK4J6DlVmIr8FXXEsRnUQwNUkbyNRIquV9Q654YVUNOn9b9zHFJSC
	hmGN0mDSn191lt9FhVE08Q/6ITbmKHPBgUl3gfg2bJzh9f8rPqca/PafV0vOQ5tFMGzMD4a2J01aZ
	pZWixORYDEBJemOjW24zq+pc70nbGq+JooEr+NiXa8I8cZ0ZUohQ+lWlLh3lwwM4KMQ5TwVeiopfU
	sDiEggRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjut-0000000AcMs-42Kg;
	Thu, 27 Mar 2025 09:52:51 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjuq-0000000AcLc-3McP
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 09:52:50 +0000
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A68E8419EF
	for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1743069163;
	bh=B77IjrCuB6vIebp/9p2+ET8GiOtyI9dx9sa72qBo+cs=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kG+/ZIg7s24EVWtPf3XKfIm1jil8ZtsoxNK+5eOD3TiO9Azs91VwzGnDa2JAryzJT
	 aQRTtLfhl0aH63EH33ByxYyb4PL+IFhWiklxIRumORZaDk2Pll1Gx4hpRPGpP6y8vN
	 ObLPwb2bB4sFnrum/fkCDPbsgTkVYv3C+dHb8/DU6XUHJvLyvug3ElJ3BEzyRjv4Ui
	 //FJOeAHqky3Oj/0gCFz4GEeQJ0I+ANtUdirkL6XAr9F1PEg1qVnsB2vQsd4oDmx46
	 3GdRSTc8OWFSoT+l2ik7c6YqoIWz4zxrg8nbcLcLkdE4qNg/nm6kO4CxdxUDXXpK9P
	 yYWo5Ao9qSxFg==
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6022020de0dso612050eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 02:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743069162; x=1743673962;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B77IjrCuB6vIebp/9p2+ET8GiOtyI9dx9sa72qBo+cs=;
        b=twXxvHZSuhSzAkRaWZwnJNYFhXcOly5dheaE2EDHpoosJ6avVQdWMW58hFrXbDRri5
         emNueMsD42G928EFlriImlCCeOOgNr6Leem8el6Gi8rvh0RSG/v6xqZHMi1cn7honqWu
         DsjkSGPszneFlv/XKMFd0w2Np6d8ZDapWYuTojQIw/p9vvhQv9ibFyZTQaQHz3pxupn5
         T+5c/Uatms9bg7RDlHWeVftwdUsYzV1I2MawBcJYstSYgPyEsWpgaIOM9emZnAhkTZpS
         AG848HMDpmOv3ipEJo5FeBPFzX+sF1L/KVHCnVypB4DRSn4P6VXdr4dgjsSadAUULDf4
         EBAw==
X-Forwarded-Encrypted: i=1; AJvYcCUPxZVjNf7W2v+w2FYiBf12/R/vjhzG2jS+Mt58Nb1agggfDc6trXYh9TDSkI4iYRpGef+RRoZfO+PMlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPgQVqU40uJbmLSqj4tHm9MLZLHNANkrPzp61Bl+w3OMG32mX7
	7keK54euPk/4EEAN4rXIJAIf/s2rkv0O5z02HpaoO81uAkqois0niawMbEoJwR2TZh6pVK857fp
	KNVc+VSUg46Q86GccdHv0ihh6beeq5Ms02NQ3qglYV82U0EsVmNnfDiGgidgKjVz667oo3xXdD/
	a2Ht8yW5rQdt/0hY/2SUxiDX7F+5OsHRqszwo8lKJdHpg8OUEo3w+pupYZ
X-Gm-Gg: ASbGncuBdaAFg13l5GSyBWJcvGzsxA/rRQ8TKB7ytBk5FvDGctoZRTvGtvZZ3/C00JA
	p9WIZusvSPL3lvaxXsQCM/fm68dHZ+Rv41AVPDSQIQPkaFR/e01QqZ+31DxDIEgc7Na1m11vk
X-Received: by 2002:a05:6870:d24f:b0:2c1:504f:42ed with SMTP id 586e51a60fabf-2c84819f95bmr1979680fac.29.1743069161483;
        Thu, 27 Mar 2025 02:52:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE83awQwNx+dMBWzJP2MzicfAHDKESqCJA4TNMWkSjbXkwlUAjf18/JZSrbIX0oCS21SczuNPt9Cl5/K55Brwg=
X-Received: by 2002:a05:6870:d24f:b0:2c1:504f:42ed with SMTP id
 586e51a60fabf-2c84819f95bmr1979649fac.29.1743069161029; Thu, 27 Mar 2025
 02:52:41 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Mar 2025 02:52:40 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Mar 2025 02:52:40 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CH3PR04MB89282DDB25C289C34581DC0083A62@CH3PR04MB8928.namprd04.prod.outlook.com>
References: <20250320105449.2094192-1-pinkesh.vaghela@einfochips.com>
 <20250320105449.2094192-10-pinkesh.vaghela@einfochips.com>
 <CAJM55Z-LUoeh0pSDnPKpduub_UBOPeg4g3t20JA0GBosJKuiAQ@mail.gmail.com> <CH3PR04MB89282DDB25C289C34581DC0083A62@CH3PR04MB8928.namprd04.prod.outlook.com>
Mime-Version: 1.0
Date: Thu, 27 Mar 2025 02:52:40 -0700
X-Gm-Features: AQ5f1JqCbdx_VNT37OdJPVr3F0efA0rT47C_sey_CmVIAYSwd2z2XmZaZ3-bc1k
Message-ID: <CAJM55Z9=0sxXiC20OEe=W0E5S_jHd6JW+7SWvW5JFiu4vpr=nQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] riscv: dts: add initial support for EIC7700 SoC
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Min Lin <linmin@eswincomputing.com>, 
	Pritesh Patel <pritesh.patel@einfochips.com>, Yangyu Chen <cyy@cyyself.name>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Yu Chien Peter Lin <peterlin@andestech.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Kanak Shilledar <kanakshilledar@gmail.com>, 
	Darshan Prajapati <darshan.prajapati@einfochips.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, "rafal@milecki.pl" <rafal@milecki.pl>, Anup Patel <anup@brainfault.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_025249_095219_D603D44E 
X-CRM114-Status: GOOD (  18.07  )
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

Pinkesh Vaghela wrote:
> >
> > Hi Pinkesh,
> >
> > Thank your for the patches!
> >
> > Should this not be marked dma-noncoherent to avoid having to mark each
> > peripheral as such?
>
> Thanks for your feedback.
>
> We have not added "dma-noncoherent" because there are no DMA-capable
> peripherals in the devicetree yet.
> We planned to add this later when we add any DMA capable devices
> i.e. sdhci, gmac, sata, pcie, spi.
>
> Do you recommend to add this property in current version?

Yeah, Conor also answered this already.

> > > +             gpio@51600000 {
> > > +                     compatible = "snps,dw-apb-gpio";
> > > +                     reg = <0x0 0x51600000 0x0 0x80>;
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <0>;
> > > +
> > > +                     porta: gpio-port@0 {
> >
> > Maybe these labels could be something like gpioA, gpioB, etc. to not be
> > confused with an HDMI port fx.
>
> The gpio node labels are based on the example provided in
> "snps,dw-apb-gpio.yaml" dt-binding and other dtsi.
>
> Could you clarify more on how these labels cause confusion with HDMI
> port as I don't see any example for HDMI port using name as porta, portb?

Sure. Try git grep 'port.*:' -- '*.dts*' and you'll see that "port" labels are
used for many things that aren't GPIOs. It'll be a lot easier to scan through
the device tree and see what <&gpioA 27 0> references.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
