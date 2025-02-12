Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6DDC02198
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 22:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDu52LROY3RN07rJ9as4x+yzbVF3YXqy8M23TE4LWUg=; b=ku7vqpbadWDSkC
	s6w71UUNN2BFNhBFj5jEUmIKSAkQRQ96LcZuGghBPuTx7AGeh9GItYDXC8R2qEJ7HwqHLsIFdroFL
	CInfpQep8KcYXaDMfDei1XtAKpBnKTGHyR7CBcUCtoZFTCEJrWFIU7etbLpxwHZjEETqpEm01Ygg1
	+kcitNYznTD6jskgcxlnumAKpqVGs94E2fIFKulj7erc3H5u0+TL+3+LW3xDifWNv1OaqhdnEemUk
	pxyqGAUw+nt/kQJo2NgrEHJUYurInM8kBGfpSc0qjiBz833SoJxOCkpAtmVgA0m3cYVaz+XyfiIsV
	65wtEO0vRfDPASFOhSiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLHn-000000093Nv-0UIc;
	Wed, 12 Feb 2025 22:32:51 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLHB-000000093Es-1xau;
	Wed, 12 Feb 2025 22:32:14 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-471a25753a4so1834031cf.0;
        Wed, 12 Feb 2025 14:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739399532; x=1740004332; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fUr0H+SXHQT1lUc7jxH0wWFj1nSXfhC6q3UwDoztgd4=;
        b=IX4wwuOQV7o9DU0gDV46N0YzP6GSZzljK33LD2KsIidY8fEfFKM4+UneQq4zZWMsGq
         XOL/WmrnxPAcgeCYxF3pf8ZLebjc1AovJLrAUfT+I0wiEbG6rDDeg5sqAIl3BN3Jx1JO
         lpsT/9FcPFp3DaQnn/NhkHZrJNeLatTayw2B8p+8DAile8nOPfpL/RSpo2NXhoEm0+mW
         i5yWFvh3gWOu4f3eQ810AcyYO6ViK5f228+ZJq+0JcBsMh0sh+tLyiJLxCoF3uyC8bAH
         5KaXX0V8+XY6EElwO3cdwM4ybuJoRUnYvfFYl6pnWEMxigPamnS6vRDR59vOw8q6pj/9
         UKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739399532; x=1740004332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUr0H+SXHQT1lUc7jxH0wWFj1nSXfhC6q3UwDoztgd4=;
        b=Hn0s1FM4mhp0wnwpsEqWFdP1CjX3Fx59kgp53vi/d4GuQrEiI7flUOk4CvhF7Ca/qe
         gsU1LxfgDnhJRNy9wUgojWHAjm1mfkxiFBOFZQ4NhZLOyLHQ2yBVmTbKTdRL6U24iLpp
         WvzFFX3kS2uI3+MnyuOlmKuGyIFfcCdlj0e06HljfFfJo/AnPEZluDz9eE5mz/CwZlGs
         8v9Cfab7UbVv5zVADb/VbgrUX5RaNO+ZKj9i4Xs20ivVx9goOK2uCM88bPd9VFbMMU69
         H9Xlwlr3Nvhc9xgnO3m+4CUEQcZl40Ius2RDyxR9p9skQqj5KQoqjCfwgxLNgxt+z4hn
         fN9w==
X-Forwarded-Encrypted: i=1; AJvYcCW2SuRVkRw7AtOoeioPDPdNrPwf0oXZbC153Erln/grfFuRAmV5aICtD8ubyDZVYtuwSqTvuCiJw7hPx5c=@lists.infradead.org, AJvYcCXb1FTTAw4X8PnoV/YiKhGWIUiLqj9fxYDVPA4w3j+rfpGwcJQ68xE5OirZr+DnouDMLhhzeQ86eDnJJgu4fEJn@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn8rDOhUGgssn2M74S1fmthFDkCqsxAROuXWmhYieabIzYifH6
	XfOiSrjkWDzbKYV35Ucc3zRnMAP6ZvvsnNvMQFXoOog/DDCIAkw6
X-Gm-Gg: ASbGncu5E66nJfCzwHbR6hfdl+BbOSikv+b52ZRdoWWPF9YO602PV7nnhbqdF9geDws
	X9XQTtqAgZ99coR8+kMjw4gTSIrn0Qc/B1btRAtWNmWXj1ieC6jXthSwizLxiCOLavqv5FQMEIt
	7qgDYdtlNSOIXE/sPy2ae/qq4FBOkol/A2JNu5E7utbR1qHbdlHvXRICoqavoIM9xfMlotH/h16
	UQKmR7f3oxnQ9kHzwJ/rzW0mvf8/dpIiF6TS/3aCYRiLsEGLXBhpQR89e70L/EFs3w=
X-Google-Smtp-Source: AGHT+IEPcrCiGeOkqafPaVURwJp7Qb4Yt0GHFujetg+DodT2FOsPmQ0dYyGcpQXhkKAJADav8FffYQ==
X-Received: by 2002:ac8:5f0a:0:b0:46e:59a3:6db7 with SMTP id d75a77b69052e-471b06361f4mr79988591cf.23.1739399532151;
        Wed, 12 Feb 2025 14:32:12 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47153beb4c1sm80549901cf.70.2025.02.12.14.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:32:11 -0800 (PST)
Date: Thu, 13 Feb 2025 06:32:03 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
Subject: Re: [PATCH v2 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
Message-ID: <dupbhhptamznuxhak5rysoa77vhejzkiqhbvxj6lh2ryqsnyls@gpax4lgxlhl7>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
 <20250210220951.1248533-2-alexander.sverdlin@gmail.com>
 <uvy62iqzul6kajzsmiaovdzogftcsc5b53cswkv4cbxh4w6som@32libbd7kffq>
 <708cdc497b8474609989395dbf8a0898037a22de.camel@gmail.com>
 <33654180-5488-4601-9103-8e4218c4a198@kernel.org>
 <26ddcdaadd777f170dbab51ab840c899f0edde24.camel@gmail.com>
 <a01de9d5-726c-4064-9617-86e01aa7e75c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a01de9d5-726c-4064-9617-86e01aa7e75c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_143213_508393_A9B9B31F 
X-CRM114-Status: GOOD (  29.46  )
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

On Wed, Feb 12, 2025 at 08:24:55PM +0100, Krzysztof Kozlowski wrote:
> On 12/02/2025 18:44, Alexander Sverdlin wrote:
> > Hi =

> > =

> > On Wed, 2025-02-12 at 17:46 +0100, Krzysztof Kozlowski wrote:
> >>>>> Make the peripheral device tree re-usable on ARM64 platform by movi=
ng CPU
> >>>>> core and interrupt controllers' parts into the respective per-SoC .=
dtsi
> >>>>> files.
> >>>>>
> >>>>> Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nub=
ering
> >>>>> into "plic" interrupt-controller numbering.
> >>>>>
> >>>>> Have a nice refactoring side-effect that "plic" and "clint" "compat=
ible"
> >>>>> property is not specified outside of the corresponding device itsel=
f.
> >>>>>
> >>>>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> >>>>> ---
> >>>>> Changelog:
> >>>>> v2:
> >>>>> - instead of carving out peripherals' part, carve out ARCH-specific=
s (CPU
> >>>>> core, interrupt controllers) and spread them among 3 SoC .dtsi file=
s which
> >>>>> included cv18xx.dtsi;
> >>>>> - define a label for the "soc" node and use it in the newly introdu=
ced DTs;
> >>>>>
> >>>>> =A0arch/riscv/boot/dts/sophgo/cv1800b.dtsi=A0=A0=A0 | 64 ++++++++++=
++---
> >>>>> =A0arch/riscv/boot/dts/sophgo/cv1812h.dtsi=A0=A0=A0 | 64 ++++++++++=
++---
> >>>>> =A0arch/riscv/boot/dts/sophgo/cv181x.dtsi=A0=A0=A0=A0 |=A0 2 +-
> >>>>> =A0arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi | 57 ++++++++++++++
> >>>>> =A0arch/riscv/boot/dts/sophgo/cv18xx.dtsi=A0=A0=A0=A0 | 91 ++++++--=
--------------
> >>>>> =A0arch/riscv/boot/dts/sophgo/sg2002.dtsi=A0=A0=A0=A0 | 64 ++++++++=
++++---
> >>>>> =A06 files changed, 240 insertions(+), 102 deletions(-)
> >>>>> =A0create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
> >>>>>
> >>>>> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/b=
oot/dts/sophgo/cv1800b.dtsi
> >>>>> index aa1f5df100f0..eef2884b36f9 100644
> >>>>> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> >>>>> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> >>>>> @@ -3,6 +3,8 @@
> >>>>> =A0 * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> >>>>> =A0 */
> >>>>> =A0
> >>>>> +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> >>>>> +
> >>>>> =A0#include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> >>>>> =A0#include "cv18xx.dtsi"
> >>>>> =A0
> >>>>> @@ -14,22 +16,62 @@ memory@80000000 {
> >>>>> =A0		reg =3D <0x80000000 0x4000000>;
> >>>>> =A0	};
> >>>>> =A0
> >>>>
> >>>>> -	soc {
> >>>>> -		pinctrl: pinctrl@3001000 {
> >>>>> -			compatible =3D "sophgo,cv1800b-pinctrl";
> >>>>> -			reg =3D <0x03001000 0x1000>,
> >>>>> -			=A0=A0=A0=A0=A0 <0x05027000 0x1000>;
> >>>>> -			reg-names =3D "sys", "rtc";
> >>>>
> >>>>
> >>>>> +	cpus: cpus {
> >>>>> +		#address-cells =3D <1>;
> >>>>> +		#size-cells =3D <0>;
> >>>>> +		timebase-frequency =3D <25000000>;
> >>>>> +
> >>>>> +		cpu0: cpu@0 {
> >>>>> +			compatible =3D "thead,c906", "riscv";
> >>>>> +			device_type =3D "cpu";
> >>>>> +			reg =3D <0>;
> >>>>> +			d-cache-block-size =3D <64>;
> >>>>> +			d-cache-sets =3D <512>;
> >>>>> +			d-cache-size =3D <65536>;
> >>>>> +			i-cache-block-size =3D <64>;
> >>>>> +			i-cache-sets =3D <128>;
> >>>>> +			i-cache-size =3D <32768>;
> >>>>> +			mmu-type =3D "riscv,sv39";
> >>>>> +			riscv,isa =3D "rv64imafdc";
> >>>>> +			riscv,isa-base =3D "rv64i";
> >>>>> +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr"=
, "zicsr",
> >>>>> +					=A0=A0=A0=A0=A0=A0 "zifencei", "zihpm";
> >>>>> +
> >>>>> +			cpu0_intc: interrupt-controller {
> >>>>> +				compatible =3D "riscv,cpu-intc";
> >>>>> +				interrupt-controller;
> >>>>> +				#interrupt-cells =3D <1>;
> >>>>> +			};
> >>>>> =A0		};
> >>>>> =A0	};
> >>>>> =A0};
> >>>>
> >>>> Make all soc definition include the common cpu file. =

> >>>> Not just copy it.
> >>>
> >>> I was acting according to Krzysztof's suggestion:
> >>> https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kern=
el.org/
> >>>
> >>> Krzysztof, I can name the file cv18xx-cpu-intc.dtsi and pack CPU core=
 + interrupt
> >>> controllers into it. Would it make sense?
> >>
> >>
> >> I don't understand the original suggestion.
> > =

> > This is the snippet in question:
> > =

> > ---[ cut ]---
> > #define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > =

> > / {
> > 	cpus: cpus {
> > 		#address-cells =3D <1>;
> > 		#size-cells =3D <0>;
> > 		timebase-frequency =3D <25000000>;
> > =

> > 		cpu0: cpu@0 {
> > 			compatible =3D "thead,c906", "riscv";
> > 			device_type =3D "cpu";
> > 			reg =3D <0>;
> > 			d-cache-block-size =3D <64>;
> > 			d-cache-sets =3D <512>;
> > 			d-cache-size =3D <65536>;
> > 			i-cache-block-size =3D <64>;
> > 			i-cache-sets =3D <128>;
> > 			i-cache-size =3D <32768>;
> > 			mmu-type =3D "riscv,sv39";
> > 			riscv,isa =3D "rv64imafdc";
> > 			riscv,isa-base =3D "rv64i";
> > 			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zi=
csr",
> > 					       "zifencei", "zihpm";
> > =

> > 			cpu0_intc: interrupt-controller {
> > 				compatible =3D "riscv,cpu-intc";
> > 				interrupt-controller;
> > 				#interrupt-cells =3D <1>;
> > 			};
> > 		};
> > 	};
> > };
> > =

> > &soc {
> > 	interrupt-parent =3D <&plic>;
> > 	dma-noncoherent;
> > =

> > 	plic: interrupt-controller@70000000 {
> > 		reg =3D <0x70000000 0x4000000>;
> > 		interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> > 		interrupt-controller;
> > 		#address-cells =3D <0>;
> > 		#interrupt-cells =3D <2>;
> > 		riscv,ndev =3D <101>;
> > 	};
> > =

> > 	clint: timer@74000000 {
> > 		reg =3D <0x74000000 0x10000>;
> > 		interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
> > 	};
> > };
> > ---[ cut ]---
> > =

> > Inochi's proposal is to put it into separate cv18xx-cpu-intc.dtsi and
> > include the latter in 3 other SoC-specific .dtsis. In v2 I've just
> > duplicated the above snippet 3 times (refer to diffstat above).
> > =

> > What are your thoughts? In Renesas everything is duplicated, I believe.
> > Sophgo outsources much smaller snippets into .dtsi (refer to cv181x.dts=
i). =

> =

> If it represents some shared design/part, then it feels good.
> Best regards,
> Krzysztof

Yes, it does share the same design.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
