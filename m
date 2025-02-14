Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37BBC02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 22:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfDxH6WexEnHCKGjvToNIBTLvZlrKk6/WSDBum0hefU=; b=bfr5uzVlaep3YE
	GoL7nX+HPI8kIWh/7xlY9fTlo6RiRLqG/mw2Kvkos5j83yDqcqTMvDacMPlPobEKjLHvvprBdJahS
	Ti4Y3rYJ+JsBVfxUNLNB15Cgzx2r+PuDtzTzEunfkDVghqRjZJB5B4GSoJcvp/W04Ky50IZ8goRl1
	KkNArwhFc47jczWe+j+HxCRkMY2SMmL7cyliFBC9WxpwSm6Xb2KJqBTQzlarwq2H/eVoeZ1AdynRC
	XPHaFzQOLkl2sr7lvxhPV1DE/lYi3IcytAFD229PifQ49P3uO8L/Rj8S7kSTD6gByrwrb7m6ePeY2
	qp20GOaonuQUFDxMG2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj4O6-0000000GPy7-2lwI;
	Fri, 14 Feb 2025 22:42:22 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj4O3-0000000GPxY-42fA
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 22:42:21 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6dd1962a75bso18492906d6.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 14:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739572939; x=1740177739; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5A68drbhTTSVvgdcUc66bx9dD4R166dRvm9VrghY4Q4=;
        b=KXRUX7fwA3GMjAOGvYqxNHF7/KCHF+MZj0/Af/qr+6xrlRZKG9yqGBFvMVyi6GIRjq
         0+S3zXJzxiaNKILCHmLNF3GiImPlAqFHvjHf9m6uTmf0AMqaJ5I1wo0tYaAnC04yV+xU
         ND43DmVVmPA1IXt1AElpLu17FmFHPeDxHhFiA0BsCLRqw6lHdFSpQj4I9+ihAswOA094
         JGogi4m9b8JyQOhHcph2jV3inu3kQD533LXJ34E0obCZ7SdFqztxR7j5bgIjWE60N6Af
         ZAZdnyBSJNuKSB3n2De/wfMHpbiGyJvrqLAkAd20BKOSEIz2dOg7cJ+ls2ZqnXCjID4R
         aLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739572939; x=1740177739;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5A68drbhTTSVvgdcUc66bx9dD4R166dRvm9VrghY4Q4=;
        b=t5wM5We+xE/+eLUnxOVGVOUvDoP2uo+xcZb88ue2D1zdgnMrBnln+XqPbtMNHzyohs
         WnLoaqfiDK67svF3sb4RIfKXKFsLsGMHc2IBuS1pG1IPT5jeBYqfc3gasRp8S5Va7F32
         SvuyDeJ6Wul/p8K/jtLELJ5siSQcHKVG023KQSI9qwb6H/T/auOp0WiA8b8+J5iFLf/q
         wTge9cdD9Gg5pm+EUauSecYR5uhHDbaBV6dldXkaCCQTQ/8p1Vtdk53ySSbwhyiKabuX
         pByC8AnQYyDWXrZjHz07Wu3cejA786v7PVtIrhTvmHktTkfhzwzNLOyxmqE7TmjvNV1/
         G2Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUmLYjEYUVQ7FzUTP54+LPr2LUmzsIRMRtoaegzIoX8Q15xpu52QeLjuniiXeAAFCSpHXacK4k/iL4n4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQOEA+tFDnJQfc4BYhpf79g3XBa19MO1n4GAgNImOs1/GJYJTz
	kesYNCEPAwY1ZjXFuFJXZK3J4Kbi+lBm/e3rRqZ+a92a+oDCAhTX
X-Gm-Gg: ASbGnctc8f/o0q5AZ3gluP5gYpL6scN8E60yHbkS6PrTENp/IwfmA4jstlraBOS41bv
	G0JBpyHsSCp9YpaVq96Ucm0XkwUT2vnG+HNLIDLOtGH9sXqu2+ZGNBht7w+Kc0lPutW/Xv46tjo
	PuBqv1JBaAZr71+2DMgWYZaeRUuUeF2yHg/klRAtQAG+qFnxjzfGixRcRFJmVCAwH8qUqUgnIJX
	fC/dekdYLsXoUbEOlrsy36s5J9k8XL0KoieZ4EeGk7cEgIpQHMbRr4EJqvwi6vYZjY=
X-Google-Smtp-Source: AGHT+IFdJBJx2BDqksUVhrXVBeP3mAIbgqag9A/szv08TB1nkvkX1A9nZ3tUFl+z87iK3zUv5bUi/A==
X-Received: by 2002:a05:6214:da1:b0:6e6:60f6:56cf with SMTP id 6a1803df08f44-6e66cc7ff70mr19801366d6.5.1739572938525;
        Fri, 14 Feb 2025 14:42:18 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65d9f36f5sm25582586d6.75.2025.02.14.14.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 14:42:18 -0800 (PST)
Date: Sat, 15 Feb 2025 06:42:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	AnnanLiu <annan.liu.xdu@outlook.com>, chao.wei@sophgo.com, unicorn_wang@outlook.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
Message-ID: <dxxc42mcdw6jlpk4lffyxqci7d6bamc7q5wsfdcx62snacbw2e@jrvrllwdb6t6>
References: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
 <f6b036acada7686e1bfd814bd62782890bf35a50.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6b036acada7686e1bfd814bd62782890bf35a50.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_144220_004901_F53CC7F8 
X-CRM114-Status: GOOD (  24.78  )
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

On Fri, Feb 14, 2025 at 01:58:15PM +0100, Alexander Sverdlin wrote:
> Hi Annan, Inochi,
> =

> On Thu, 2024-01-25 at 17:46 +0800, AnnanLiu wrote:
> > Add the watchdog device tree node to cv1800 SoC.
> > =

> > Signed-off-by: AnnanLiu <annan.liu.xdu@outlook.com>
> > ---
> > This patch depends on the clk driver and reset driver.
> > Clk driver link:
> > https://lore.kernel.org/all/IA1PR20MB49539CDAD9A268CBF6CA184BBB9FA@IA1P=
R20MB4953.namprd20.prod.outlook.com/
> > Reset driver link:
> > https://lore.kernel.org/all/20231113005503.2423-1-jszhang@kernel.org/
> > =

> > Changes since v1:
> > - Change the name of the watchdog from watchdog0 to watchdog.
> > - Change the status of watchdog.
> > v1 link:
> > https://lore.kernel.org/all/DM6PR20MB23160B8499CC2BFDAE6FCACDAB9EA@DM6P=
R20MB2316.namprd20.prod.outlook.com/
> > =

> > =

> > =A0arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts |=A0 4 ++++
> > =A0arch/riscv/boot/dts/sophgo/cv1800b.dtsi=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
 16 ++++++++++++++++
> > =A02 files changed, 20 insertions(+)
> > =

> > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/ri=
scv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> > index 3af9e34b3bc7..75469161bfff 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> > +++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> > @@ -36,3 +36,7 @@ &osc {
> > =A0&uart0 {
> > =A0	status =3D "okay";
> > =A0};
> > +
> > +&watchdog {
> > +	status =3D "okay";
> > +};
> =

> It would be necessary in all SoCs unless... [1]
> =

> > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/=
dts/sophgo/cv1800b.dtsi
> > index aec6401a467b..03ca32cd37b6 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > @@ -1,6 +1,7 @@
> > =A0// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > =A0/*
> > =A0 * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > + * Copyright (C) 2024 Annan Liu <annan.liu.xdu@outlook.com>
> > =A0 */
> > =A0
> > =A0#include <dt-bindings/interrupt-controller/irq.h>
> > @@ -103,6 +104,21 @@ uart4: serial@41c0000 {
> > =A0			status =3D "disabled";
> > =A0		};
> > =A0
> > +		watchdog: watchdog@3010000{
> > +			compatible =3D "snps,dw-wdt";
> > +			reg =3D <0x3010000 0x100>;
> > +			interrupts =3D <58 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&pclk>;
> =

> &osc ?
> =


This patch is submitted to early, before the clock driver is
applied. This reason applies to your all question.

> > +			resets =3D <&rst RST_WDT>;
> > +			status =3D "disabled";
> =

> [1] ... the status here is dropped. What is the reason for disabling it i=
n the first place?
> =

> > +		};
> > +
> > +		pclk: pclk {
> > +			#clock-cells =3D <0>;
> > +			compatible =3D "fixed-clock";
> > +			clock-frequency =3D <25000000>;
> > +		};
> > +
> > =A0		plic: interrupt-controller@70000000 {
> > =A0			compatible =3D "sophgo,cv1800b-plic", "thead,c900-plic";
> > =A0			reg =3D <0x70000000 0x4000000>;
> =

> Why didn't it go into cv18xx.dtsi?
> =

> -- =

> Alexander Sverdlin.
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
