Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9678CD342F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zh3EYka6iiMCSFT/eZv5EF1ab+EuLrCeKF0plYaP7kw=; b=IGj0ydEAZZ1QhZ
	ZrOyEflytuKPrT5NKKlV4340RXd6wZODhJ78eKqpRyqZjf/raz93teGZI+2ARxHEZP9NQh/yFBKk8
	trdtvVFPZXcd9l/FBSgfGoJeaLOmNcxvCaVkEaEW0EgFyCindGbRPD85j1MAxiENB9v1tg3RvhE9m
	0v45zO/MvsMQb2ENRjV1AYqBRbsweDvL5/JlAsioSbjw0x+63jqyru5AC7gHfPR0EtzK303gKF90v
	mqPl0dZOkvCd6wNWn4QrBLjzG+WFE8nbVeKk8YpDW3UGPiT7fN4m7A56HFE7fH+Vxexq189w3gw1f
	u4qU5lju6cCqm6jsKSVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFld-00000005rZh-3HOM;
	Fri, 08 May 2026 07:37:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFlX-00000005rTO-40T0
	for linux-riscv@bombadil.infradead.org;
	Fri, 08 May 2026 07:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gBUyU0oRSZqCXNEYym0i+uTF7lcEuag7L4S3HbzckJI=; b=LcJkOQjEz/1p7PLPhAiiCSPpmQ
	gGOUC8margT2+xrJYzyIhtqPfyb2vW2bCsfEUNM3oRbFRIGxggV9pauEBLNqXiRtIvFvciWUnaQUt
	RiwA9IM6gAmzVdXHi4025BiJwwxnUSZ6Qm42vtuhefIzosXE6m719/OE/ASGoY4O1B18fwTARoF4A
	xy6cXILu+4SdwLGwN2oVjlYh2UFW36NT1Xcgdd/vixMaFFMUyr0GUsntU4RZBpl5EyQi8eXnFnf6G
	64MorVPE5CYnlS58YS8G3Q1mB8jQJtH7D06LIBO9hvRtT4QdbE2vRC+2dTmXgWxgs4oZpejZToerG
	sSLJ8B2A==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFlA-00000005bGG-1rL4
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 07:36:38 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b9358bc9c50so282329666b.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 00:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778225789; cv=none;
        d=google.com; s=arc-20240605;
        b=GYst7BoLXnMjIB82/QTjPKbKbkXBZrVIWQFLAOma0pN0d2XpaT3Q2mlaXqjndkpX6t
         BTfAVKKYfRI6+490wam13r2C+Aj+642Jz6+v5gEyI59ajpuKWG9rK8H6sxpOgeG4Ld1k
         v4hnTUl29AwGGDIawuFWSlh7iF72HOO8DG/TuXuiDnZgc40lTKGkMBdMDFP3b052ZhI+
         3HiK1UgaqZdT/JlY8nymal/WmyizgaLWPD8BhrumsTlsI5u7PzOuh9oH2qbCLgA+M/f1
         keqZsJFb8RFrKKOMVucvzAOChUvnI/YcgomKO/SG1znCFB95ODCH/f+4qQfWSbHWL7Pj
         TWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gBUyU0oRSZqCXNEYym0i+uTF7lcEuag7L4S3HbzckJI=;
        fh=dcEX+Sz8G0bw4BOuppQaaq0a3+t3TEe/ff54bB7bHHg=;
        b=CJ/kLkoB3twqEI1lpKcewgzxuciKHNm71UGK+AmGdFJC4jooF1WnwyOuEWpQLvz1SU
         jL0/vFfz1NlytPwSPj4W88TEVucoTZZN1sSgpJftnq1PLVeg8zppHclpCCCrdpoMZk4E
         16dIOKgbiUw2bwyc18qwi+mgLmQwg1A5E71tvZ8VsfC7J1oXYvZUUfSgX7yITKWuSKXi
         Fh5lrmSGdmjjgufzIDjlstGYMCQIzTwRfwpYw6jCC3v1VUSO5B74WigBraO2/SPRjDH6
         ZT8pLXPVNt+v29f/OyihsYT6NX5ivdOby/gDf9JoA6z+4az3cmCp7bvep1iNUVs6fVkP
         fkrg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778225789; x=1778830589; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gBUyU0oRSZqCXNEYym0i+uTF7lcEuag7L4S3HbzckJI=;
        b=rZ8p0S1sCIZuf5MdGI2mWLjTuii8BzWTe6a8JDLOvzqzRMd4/mocuq0Pzc/dbXSGHv
         ntli0MaXbxDDA8FjnGdWSM7i6koN7jgIuYDabD2eIOIUOLwRv/cZvB26q+vxVyQXBshi
         yLodyukkV8df6qoJOnLUbDq0w+TZmJnqGZDT9m3zCi/tVyphAVRsmyv1qrMogEpEUoe2
         r52ZdWMI1DFRKMYr0sQDweE4W8VgoQGk4yYTZ6pW4X7JXPIzm76GWH0vEfi0PNOD0SZ3
         zKvbkWASjChbIVnVgGc++qoPuZT4ZikhoGQGnCuscWVXqMoDS4k6E13mlzBbcs00RSKP
         oUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778225789; x=1778830589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBUyU0oRSZqCXNEYym0i+uTF7lcEuag7L4S3HbzckJI=;
        b=jAMZm+/vurCwYsA9F1eYm0aVsx5392vfQqg4IDkzWFb00sapIgRPhl6DdoEeaRHL9W
         SlKBZqVScJccs9vj52kkvj5R2bZlSmLzwkh7J9Ru+alllLrK0QqJPeCtgjHf9ElKRHyk
         t89nqllANIte1WiuE6hCOCIKhznEFK+jVSovtxZDangI0t7VZlGUB8fuxyG4C6i0IzfG
         WOERHnAFx0fKVoi12iYG48CsodU+M53Mi1rm5jHJEElP+msD806B0hXxPdn2Mu8YWV6y
         4p2eI1mFhQCbrFLcPykBzzeR3SbZd/JwramxvAT/0j3A7dZxxPE9gN2E8GQa8R1D1e8l
         cH7A==
X-Forwarded-Encrypted: i=1; AFNElJ/U+Ut0hJ4MNuBsjo9QKRJy5nPKTTPCPRu1ieQyfEI2m3Y9u0B138hXaAleS919on2QZ9h/y7mrRJ5hmw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtbbl8NsdCM7M5du3jfA/HSKrZYnEOX/Ekw7HKYYuWqyizQPDQ
	lX7DA0B7UBvx2iGZxMIipMpS0rSE8Uq8fMiZNV8bjqFQ5bhYWoOs60lHkDn8SysS+Fsg57mf2VI
	Hk6tUBHgtiCArnUcO7z+Iyz/76uaWz2E=
X-Gm-Gg: AeBDies5Mz+AR3aAXSgIx8jzNybjzZV84wuxZs3rxxWJ44/NuJxvcffvtTqGTpp+ymg
	KqUBA7PWHznr07VSF7bpK9iPLN2b0ExvRYvNTUGKF9uqMdcffazHN8LCwbatV/Vl3wK6+1FX6JO
	qhUHAytP9h5AWw2YydMiuo5YRqEktXBSOXteQu5lEwCILuMPF+mBVTzzl/XNNZYAswliFKgt6RN
	JJ7hjRXID7ZE2R7C9i04VsEXcyz+WodeSmRVZ6ThHRdqlkJBTzfKUEN68vQvRNNP3PNDKr2pxX3
	LqU3if93XNwZlBk=
X-Received: by 2002:a17:907:3cc7:b0:bc4:aafa:65cf with SMTP id
 a640c23a62f3a-bc56c92bfc1mr713084366b.16.1778225787261; Fri, 08 May 2026
 00:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260502051906.8160-1-linux.amoon@gmail.com> <20260502051906.8160-2-linux.amoon@gmail.com>
 <20260507024524-GKA3579608@kernel.org>
In-Reply-To: <20260507024524-GKA3579608@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 8 May 2026 13:06:07 +0530
X-Gm-Features: AVHnY4KAmj7VrysTgYaoh89w72UBvUEf0oATrqx17Po5ftzAdn9p97hUDfjyrYc
Message-ID: <CANAwSgQLhgC6puNy2dkMjL=hd+yTYizBBFykd63KJDbw48219w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] riscv: dts: spacemit: k1-bananapi-f3: Add
 vcc5v0_sys regulator for Banana Pi F3
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Han Gao <gaohan@iscas.ac.cn>, Ze Huang <huang.ze@linux.dev>, Chukun Pan <amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_083633_742221_AF2B3587 
X-CRM114-Status: GOOD (  22.99  )
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

Hi Yixun,

Thanks for your review comments.

On Thu, 7 May 2026 at 08:15, Yixun Lan <dlan@kernel.org> wrote:
>
> Hi Anand,
>
> On 10:48 Sat 02 May     , Anand Moon wrote:
> > Define the system 5V fixed regulator (vcc5v0_sys) supplied by the
> > DC input. As per the schematics, vcc5v0_sys is the input power source
> > for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulators
> > to correctly reference vcc5v0_sys as their parent (vin-supply).
> >
> > Cc: Han Gao <gaohan@iscas.ac.cn>
> > Cc: Ze Huang <huang.ze@linux.dev>
> > Cc: Chukun Pan <amadeus@jmu.edu.cn>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index 5790d927b93d..9727ecdd9f6b 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
> >               regulator-always-on;
> >       };
> >
> > +     reg_vcc5v0_sys: regulator-vcc5v0-sys {
> This will fall into the catogery of "non-controllable & serve no devices"
> see similar comment for 'reg_dc_in' which raised by Krzysztof
>
> https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org/
>
> or should I ask, what's the real problem if regulator has no vin-supply?

If the device tree is not configured with the correct power source it
will affect performance.

> Any probe failure or something bad happen? (besides /sys/../regulator_summay)

Not really; the regulator summary just confirms the PMIC used the
correct power source.
with te device ip blocks.

Bananapi F3 schematics.
[1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view
(page 24)

Please check the shematics VCC5V0_SYS page 4
VCC5V0_SYS->USB_VCC5V0->HDMI_VCC5V0->FAN_VCC5V0->VCC3V3_SYS

Please check the shematics VCC5V0_SYS page 24
VCC5V0_SYS input for VCC5V0_HUB and 5V_VBUS give the USB hub,
which is enabled by USB3_PWREN (gpio pin)>

Plese check power tree page 4
USBVBUS->SY8386J UXXX -> PCIE_VCC3V3 for pcie vin source

So, this series tries to fix the vin source for USB 3.0 and PCIe nodes.

Thanks
-Anand
>
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vcc5v0_sys";
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +             regulator-boot-on;
> > +             regulator-always-on;
> > +             vin-supply = <&reg_dc_in>;
> > +     };
> > +
> >       reg_vcc_4v: regulator-vcc-4v {
> >               compatible = "regulator-fixed";
> >               regulator-name = "vcc_4v";
> > @@ -66,6 +76,7 @@ regulator-usb3-vbus-5v {
> >               regulator-min-microvolt = <5000000>;
> >               regulator-max-microvolt = <5000000>;
> >               regulator-always-on;
> > +             vin-supply = <&reg_vcc5v0_sys>;
> >               gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
> >               enable-active-high;
> >       };
> > @@ -75,6 +86,7 @@ usb3_hub_5v: regulator-usb3-hub-5v {
> >               regulator-name = "USB30_HUB";
> >               regulator-min-microvolt = <5000000>;
> >               regulator-max-microvolt = <5000000>;
> > +             vin-supply = <&reg_vcc5v0_sys>;
> >               gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
> >               enable-active-high;
> >       };
> > --
> > 2.50.1
> >
>
> --
> Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
