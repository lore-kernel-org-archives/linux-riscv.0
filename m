Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E73BC02198
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 22:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+BRPVG5c6R08l826l9ZEePoigHV4JyM/LcfSMgymuI=; b=K5z40949s/Asf0
	jTc87xCOpw2uWqDr8XJcuZ/iXuF2A1tG+3ncDy9DBd4T41DCvLYkw/KY7z8rv6Zn4W6h/Flnd8276
	ySwCUitjUE3tRSNH/qV02AQDVjGn3vNev8iS0M0dWLmsG9YNcJMfPNO1G+PO12JOfswmnbgYOhWdV
	pf5WP3EQ0LYSDkKGcn+Q7JsKZ4Ja28oaPXs1JX980gzfbgz6z4VjoNTham99KpTtMfhOQhiS6/Epa
	0gpriMYp3mZ+JycIGdqm5wInrz6ZLl/o79I78wkf9iLOUD6esQrMDBILmMIM5MSNgKSgOXT/MYs5l
	GdGr8Kf2+W+3k1qmE92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLGN-0000000932A-3mvw;
	Wed, 12 Feb 2025 22:31:23 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLGL-0000000931U-0QVa;
	Wed, 12 Feb 2025 22:31:22 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7be8f281714so21219185a.1;
        Wed, 12 Feb 2025 14:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739399479; x=1740004279; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=adA61KlZ7NgJ00d9AP44x5Drt9hRKTZfXpJfv6UN5KI=;
        b=WzxP01jMwmKe//khU7STiaL9FE19CLIHxEL/uKyqyeFJutoWkZm3J06IFPr+PGX2G0
         RY5DclEjTpXu/fhwO5hOVcpk3ELTS/bFJPIVJugl0H2LZgdL26p60Ec1EQW9rD1PQ9LX
         aFtep5aiI+Q1AeETUjlAeLT01hPNAvZy5MzA5/h1xXURYrnRSnVBaz7dJfWNzcd3ZvtY
         tbJ58WAu9FBggG42c0gzlZe4HPMpZ++k5jVOy9kLQ9gCq2GWpaAkXjjyKf3RGTDSjqhC
         LxR81vybJlm6NkyfCUJnahvtnU5qREyc2hwIWwK+rubyjenZ8PvGyulA2q1G1yxzEUfG
         TYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739399479; x=1740004279;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adA61KlZ7NgJ00d9AP44x5Drt9hRKTZfXpJfv6UN5KI=;
        b=FwWvb5UjchDBIZfXYNK3thSC3NZSUFhWF/JtQqd2b9al3tp+I9ellaJRyIBzjdPOwl
         GWVBlNyyISF/cAO5JFOHdXGntZVI86tLE8HQlU03LAJ8XkrR7sreoJAzGcXAXy0rtYjx
         veFD+Xn+qAIZD201yso60WOsr5X/XyYvafWYhhDPPyOPA6sKajhzcUhEIGT8ttttTaRf
         8LCjFtO+BnOOAwpghxX8elohXy+gupgZPiCvGoHPuzmQV2cXk+dSwVwsuoP5CiEqb6Oh
         O2R/a+sUEYj7LUCQ1leSHz2vPwLq7kF03MQ/j+8yOGpQvuzpRIgle4gSJdwZE6G6u1gJ
         oPMw==
X-Forwarded-Encrypted: i=1; AJvYcCWgSjcYHjcS3gQ3hIxMxLN0l8WfE0TXrMkFOLB1UtDiFGfETSrSsc4Kra12mzJRMKrk6i8HiyMs3lcz8xZv+U8u@lists.infradead.org, AJvYcCXo15BKmlTB2BBnD/xb+HTLkuMrsFoNryOU4ll+6Et/bN9vy0ixdoLpTUS+rsRq/3bxp65zy5xQ0z+S4wY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRPdMED3i15nu4JOjsknzOBSXd2IQ+CmLf3LJPQHBCqcpTxWkM
	vV2tORO38KBNm/7psKJrXq/q/UcoNvQsax4kTITn965wjTcqms1u
X-Gm-Gg: ASbGncumNy5LpNZkMfALzoP/XU8E+ukVRp+pJJ7nn8y0DV43wShEXdyHtd/UH6Kj3J6
	XtcxAM95X6Rv06ZwaXZLBj9AEDqCMsa0f48Mh/2CPju5reZsowZSCJVzXMflEOYtf/10ksPEs9N
	JXxzORt34J65O3sE3w9bdoJlRKOSCZyf13O/CBQrh9BQn7NC/qPejm/G4gbbEB74VrVL5psrS+6
	FplnJGNMzqxs5yM7yPFCPc/G4AkgSzf5756B0lQHwtTLQP2a8QTNk/rGnbF1lQI7Ks=
X-Google-Smtp-Source: AGHT+IG/jqO7Gs3aNEJD2jlxWGUNxNPhJfXHJaQNAvosjjzRMKiNe50EuVFrHjd49yXn9DToPQh2SQ==
X-Received: by 2002:a05:620a:269c:b0:7c0:6c5b:d6e5 with SMTP id af79cd13be357-7c07a1ead00mr229402985a.54.1739399479479;
        Wed, 12 Feb 2025 14:31:19 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07518e80fsm127058185a.26.2025.02.12.14.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:31:19 -0800 (PST)
Date: Thu, 13 Feb 2025 06:31:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
Subject: Re: [PATCH v2 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
Message-ID: <p5aolstlrxnhb7wk45eukthlwiui337fssbum4lrpflvui773i@beif6axz66jx>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
 <20250210220951.1248533-2-alexander.sverdlin@gmail.com>
 <uvy62iqzul6kajzsmiaovdzogftcsc5b53cswkv4cbxh4w6som@32libbd7kffq>
 <708cdc497b8474609989395dbf8a0898037a22de.camel@gmail.com>
 <33654180-5488-4601-9103-8e4218c4a198@kernel.org>
 <26ddcdaadd777f170dbab51ab840c899f0edde24.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26ddcdaadd777f170dbab51ab840c899f0edde24.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_143121_142788_881F1F08 
X-CRM114-Status: GOOD (  31.85  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 12, 2025 at 06:44:15PM +0100, Alexander Sverdlin wrote:
> Hi =

> =

> On Wed, 2025-02-12 at 17:46 +0100, Krzysztof Kozlowski wrote:
> > > > > Make the peripheral device tree re-usable on ARM64 platform by mo=
ving CPU
> > > > > core and interrupt controllers' parts into the respective per-SoC=
 .dtsi
> > > > > files.
> > > > > =

> > > > > Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral n=
ubering
> > > > > into "plic" interrupt-controller numbering.
> > > > > =

> > > > > Have a nice refactoring side-effect that "plic" and "clint" "comp=
atible"
> > > > > property is not specified outside of the corresponding device its=
elf.
> > > > > =

> > > > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > > > > ---
> > > > > Changelog:
> > > > > v2:
> > > > > - instead of carving out peripherals' part, carve out ARCH-specif=
ics (CPU
> > > > > core, interrupt controllers) and spread them among 3 SoC .dtsi fi=
les which
> > > > > included cv18xx.dtsi;
> > > > > - define a label for the "soc" node and use it in the newly intro=
duced DTs;
> > > > > =

> > > > > =A0arch/riscv/boot/dts/sophgo/cv1800b.dtsi=A0=A0=A0 | 64 ++++++++=
++++---
> > > > > =A0arch/riscv/boot/dts/sophgo/cv1812h.dtsi=A0=A0=A0 | 64 ++++++++=
++++---
> > > > > =A0arch/riscv/boot/dts/sophgo/cv181x.dtsi=A0=A0=A0=A0 |=A0 2 +-
> > > > > =A0arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi | 57 ++++++++++++++
> > > > > =A0arch/riscv/boot/dts/sophgo/cv18xx.dtsi=A0=A0=A0=A0 | 91 ++++++=
----------------
> > > > > =A0arch/riscv/boot/dts/sophgo/sg2002.dtsi=A0=A0=A0=A0 | 64 ++++++=
++++++---
> > > > > =A06 files changed, 240 insertions(+), 102 deletions(-)
> > > > > =A0create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
> > > > > =

> > > > > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv=
/boot/dts/sophgo/cv1800b.dtsi
> > > > > index aa1f5df100f0..eef2884b36f9 100644
> > > > > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > > > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > > > @@ -3,6 +3,8 @@
> > > > > =A0 * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > > > > =A0 */
> > > > > =A0
> > > > > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > > > > +
> > > > > =A0#include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> > > > > =A0#include "cv18xx.dtsi"
> > > > > =A0
> > > > > @@ -14,22 +16,62 @@ memory@80000000 {
> > > > > =A0		reg =3D <0x80000000 0x4000000>;
> > > > > =A0	};
> > > > > =A0
> > > > =

> > > > > -	soc {
> > > > > -		pinctrl: pinctrl@3001000 {
> > > > > -			compatible =3D "sophgo,cv1800b-pinctrl";
> > > > > -			reg =3D <0x03001000 0x1000>,
> > > > > -			=A0=A0=A0=A0=A0 <0x05027000 0x1000>;
> > > > > -			reg-names =3D "sys", "rtc";
> > > > =

> > > > =

> > > > > +	cpus: cpus {
> > > > > +		#address-cells =3D <1>;
> > > > > +		#size-cells =3D <0>;
> > > > > +		timebase-frequency =3D <25000000>;
> > > > > +
> > > > > +		cpu0: cpu@0 {
> > > > > +			compatible =3D "thead,c906", "riscv";
> > > > > +			device_type =3D "cpu";
> > > > > +			reg =3D <0>;
> > > > > +			d-cache-block-size =3D <64>;
> > > > > +			d-cache-sets =3D <512>;
> > > > > +			d-cache-size =3D <65536>;
> > > > > +			i-cache-block-size =3D <64>;
> > > > > +			i-cache-sets =3D <128>;
> > > > > +			i-cache-size =3D <32768>;
> > > > > +			mmu-type =3D "riscv,sv39";
> > > > > +			riscv,isa =3D "rv64imafdc";
> > > > > +			riscv,isa-base =3D "rv64i";
> > > > > +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicnt=
r", "zicsr",
> > > > > +					=A0=A0=A0=A0=A0=A0 "zifencei", "zihpm";
> > > > > +
> > > > > +			cpu0_intc: interrupt-controller {
> > > > > +				compatible =3D "riscv,cpu-intc";
> > > > > +				interrupt-controller;
> > > > > +				#interrupt-cells =3D <1>;
> > > > > +			};
> > > > > =A0		};
> > > > > =A0	};
> > > > > =A0};
> > > > =

> > > > Make all soc definition include the common cpu file. =

> > > > Not just copy it.
> > > =

> > > I was acting according to Krzysztof's suggestion:
> > > https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kern=
el.org/
> > > =

> > > Krzysztof, I can name the file cv18xx-cpu-intc.dtsi and pack CPU core=
 + interrupt
> > > controllers into it. Would it make sense?
> > =

> > =

> > I don't understand the original suggestion.
> =

> This is the snippet in question:
> =

> ---[ cut ]---
> #define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> =

> / {
> 	cpus: cpus {
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
> 		timebase-frequency =3D <25000000>;
> =

> 		cpu0: cpu@0 {
> 			compatible =3D "thead,c906", "riscv";
> 			device_type =3D "cpu";
> 			reg =3D <0>;
> 			d-cache-block-size =3D <64>;
> 			d-cache-sets =3D <512>;
> 			d-cache-size =3D <65536>;
> 			i-cache-block-size =3D <64>;
> 			i-cache-sets =3D <128>;
> 			i-cache-size =3D <32768>;
> 			mmu-type =3D "riscv,sv39";
> 			riscv,isa =3D "rv64imafdc";
> 			riscv,isa-base =3D "rv64i";
> 			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zics=
r",
> 					       "zifencei", "zihpm";
> =

> 			cpu0_intc: interrupt-controller {
> 				compatible =3D "riscv,cpu-intc";
> 				interrupt-controller;
> 				#interrupt-cells =3D <1>;
> 			};
> 		};
> 	};
> };
> =

> &soc {
> 	interrupt-parent =3D <&plic>;
> 	dma-noncoherent;
> =

> 	plic: interrupt-controller@70000000 {
> 		reg =3D <0x70000000 0x4000000>;
> 		interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> 		interrupt-controller;
> 		#address-cells =3D <0>;
> 		#interrupt-cells =3D <2>;
> 		riscv,ndev =3D <101>;
> 	};
> =

> 	clint: timer@74000000 {
> 		reg =3D <0x74000000 0x10000>;
> 		interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
> 	};
> };
> ---[ cut ]---
> =

> Inochi's proposal is to put it into separate cv18xx-cpu-intc.dtsi and
> include the latter in 3 other SoC-specific .dtsis. =


Yes, this is what I want to say. Since I can confirm all cv18xx
series have the same riscv core (IIRC they share the same hw
design). There is no reason to duplicate them.

> In v2 I've just
> duplicated the above snippet 3 times (refer to diffstat above).
> =

> What are your thoughts? In Renesas everything is duplicated, I believe.
> Sophgo outsources much smaller snippets into .dtsi (refer to cv181x.dtsi)=
. =

> =

> > Inochi, please trim unnecessary context from replies.
> =

> -- =

> Alexander Sverdlin.
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
