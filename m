Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5044B606A31B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 12:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vhyaKHV4;
	dkim=fail reason="signature verification failed" (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=gz0CoSuo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2/KzCMZReqlz4rrhTRHaUbbMlRaYodfGKIJlsm49z54=; b=vhyaKHV4VV1cNAfmVCoko3WQcs
	QX2nIb9U0/Bfll0LcqZWQcarP2/N0Xb0O3ZVDuOqNvLpsr3PTOzCB77BfBZQsMAWYKZyPIb9kVKUT
	xrfxu9C3ad7w7syCsYkvUB2/N7aJrOU9iMOcygaRBedH7gI8nwSBgt/RMf+4JhilcAfbkk1t1U4Dk
	nTTljIUZ9+vfnKO7QU5DYSmftJnbcR20x5L45y1RbUYy00U1lrGCeIof9Svn1zh5222/vPXOAty2b
	Fg7MvAnlB8EbFZCNXwMwM4cSJpYaMHQRy2YUdcpeazOdQTGG2SvKJVkLzY4dWbSYt2ZVA47JMC5Gt
	fj8yxY+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZzr-00000005IH1-0nUG;
	Wed, 04 Nov 2026 12:21:43 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZzm-00000005IFy-33i2
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 12:21:42 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5BAB63F641
	for <linux-riscv@lists.infradead.org>; Wed,  4 Nov 2026 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793794894;
	bh=DLiir0b/2WOs2YcDbEqb6fOBt0XwzpsNWUx0VYlKRDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=gz0CoSuoUjYFvXYrPQx01KJD0eT+lX1bPpfRY/AYyvmTHMZA4s+XnDn12sRzssZsU
	 Yj/LeNecBV1CjQCBA5PEwZ90G4yXUGey9EOWWc3UP1WGuc/leMCwrSwVm2aeuda8nu
	 9DlPk7SSXyw9Ptj9kYhDyLCOw2PkWmVwHjxleD175xHf5LdTrV7qjrolDG9CpX1tw6
	 2de8BYPw77UpyVu8M00mwe2DeOAmhkBYAGJhcBS99b7EE5w9Xgf4jU9PNbEqcRl9G1
	 ft7Iw5cNVH1sdES86AtNWkA6Yet6Jk0vDGsb/2R70zEG38UKAq/Mg40JG4BGJTRPZu
	 okPdZ60KGJh12sbwlMCoRs8w85uWO57ylkGMunyH77nsR64t6uzQZqQxqsa9+yCqAn
	 KORq/bahj3wyPJcMRUawvuqQtrbxh0qP/irgGmZ6PN+yKquVrdIcn5/0wv6ATGF9Zp
	 jZNGpQzan4k4fWN3p/jnomwhGKmhkV0Wd56ORoXxjzySklNncNeHR5oRjEgNVC7g/D
	 Ibg3Gnmu2sr1GtXnPAzJJa9IlQ7AkU2IvEXhtNw1upt61J0XQfxRM1x/zcWVdk0ms9
	 L2tqV3B7lRYjAruTvEtPsyBUV7yL4cIiieKV0tkGHvRHbH1FhgWk+Y/TDNjsbVrDAw
	 uyv0sVBHir6dqgRX7knB/LkM=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c42f98f3571so85288066b.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 04:21:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793794894; cv=none;
        d=google.com; s=arc-20260327;
        b=Lpurapip/PVgNlvXYcpzVP2d8OjpytMAU9WjDW0LfOoRmziuwVfEyw/NuDKTBFf8Ub
         cmKOTWNprzhxdzXi/NmeftxRonfIyD0zgXm6a72NDYEDijuza6yfh7uVh391IXf5lgV7
         45GLt1MIsBwKuBNjqaXTOVW0lrFjTyeCou8f+XLm6uRyLX89j/aYJY1gWCG6dPifEUOS
         roBZ+jg/N6VVU/fIUfSxp4bTMtqiPl/Xa2FxTjbr3OxZnjoHy3EOnpH4XW28mUe3mJB6
         9ew1ID1MOOSWYnNKiLzvkRg11f9CrRW+YrUWL7WfEypwHrtdPelUkVfQzfE6FC3QhfF+
         EHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=DLiir0b/2WOs2YcDbEqb6fOBt0XwzpsNWUx0VYlKRDA=;
        fh=nMX0V/L6IEioBvIGHd4pwsM2RW8+VkJ6qQxtg7XI2lk=;
        b=DKQPB2ARf9sbgck5bOvNdxgN3Jw49tFrVZKFFnr2pqScK74LbNjLfbjwGcc6YGL2X0
         WADe3ut7HZhmtUP5f8e++GOwdNqMFXubeCZHDPkKZVxSghZJsZiMLvmYrdnd224sFPQ4
         +7IyV0UiuuvXAtTO9Ll4YzM+LKM1L/V1nseqsDdxJwaqkkqXLRBhJuMT/byaNDIHltxn
         a3NgcFcTPbXemnAp7w11ff29tcrjYoK86l/GUbpknZiQMNaKELvs2toPBV5Qpi5jE6zy
         PBgCTyoQ9iR6k2zAcKNIpTj9WslAc26AMgLZQE2iKl2FSoSIRAfLrtdTqmJw5BR/jDsF
         sOTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793794894; x=1794399694;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DLiir0b/2WOs2YcDbEqb6fOBt0XwzpsNWUx0VYlKRDA=;
        b=nvwMsfGXQhMZkwfkt+74VxSmORioQMsQ8BtsXjurcqivNJl06X9UZptL0bm9wm4r0s
         ZLN/EaPVJzn+nMcr1/c0yqgC/YGMJDtqq4s9tZr5o43tGHSxdXP4elkVHSUrqAe3cap+
         odclRNDN54pBkpVz792oG7TNIeXkBptQ4SCByH1HAy0Esvs7EDoQCmjWJDIvUHPeNqnb
         Ip6x91ofpSTlQGs1wiUGjR9JbEVsdC74UUVj851twGFadFr1mTAxJ1P9ln8fWjuneGZk
         Gkg9U3B4vXedaG8g2VR0TC7PR4f2+O+GHpa3kePwvoceUlE0BvsTmehxPIM0utdv9fWU
         YqFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCCpCI8wC+i9FJDCgZHFSGY9HFSOPcPjRCu1F4yWvvW2jvfT5Bz1WNZrpUODkodX7tNQjDzFOw7q9vQg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+3tqCUUazBS/MOu+oYwmEZUSWW/rXZ1uNRliwfHLMRkCZB+wK0
	+UoVB1IZB7Qzz38gXVyrnYSCEG2+//H8V+rStqDABUs0Gr3ilL6JptBvyyW10Dr7m+fIsQ59DGs
	LK9+rWwmLOYWgpEyW1rNMONu15VdIH629MJYM6Lv0cINQD1rLUxruAks0XoPcwXqQV0UeZOtsYy
	QlQz91HhcHsBYCSaSPVK8JhEIJzWJobDsdz44ESsNgaD/RPCFAhp1pfaQtXyXs
X-Gm-Gg: AYBFou1PDxOKrExx4LfpKpvSrHjITH5yq5M0DGEhiG7v0F2pFdolIZWQFZ4fflIstlZ
	L0X2vb1h74ZZXPiSy6dRviWMKRVMEEikZchjpvoIAJmQBxyxMJiAyAYr74p0XRQY7CYxXAg6nED
	WiIqOV50JykVeZ1UgsIeYCgs2/5Cp2fOZxWxpzBDajMbtL8glntnm2HYKEYdLJNts0F+ASrwpmK
	XC3cpgYD/5K6g==
X-Received: by 2002:a17:906:4a8c:b0:c4c:e344:ece7 with SMTP id a640c23a62f3a-c4ce344f6eemr563417766b.10.1793794893781;
        Wed, 04 Nov 2026 04:21:33 -0800 (PST)
X-Received: by 2002:a17:906:4a8c:b0:c4c:e344:ece7 with SMTP id
 a640c23a62f3a-c4ce344f6eemr563415866b.10.1793794893306; Wed, 04 Nov 2026
 04:21:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com> <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
In-Reply-To: <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 4 Nov 2026 07:21:06 -0500
X-Gm-Features: AclHuK_XAaqgUQs2Aa9O6V8c62-48k8GCjUGQBNbXSzWZRHNnme5DGYTTas6Tew
Message-ID: <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_042139_288091_6AFAC82C 
X-CRM114-Status: GOOD (  22.56  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 4 Nov 2026 at 07:24, Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
>
> K3 BS01DCMA is a board equipped with a SpacemiT K3 SoC, 16 GiB of LPDDR5
> memory, a P1 PMIC, an EEPROM and QSPI NOR flash.
>
> Add initial support for the serial console, EEPROM, PMIC and QSPI NOR
> flash.

Hi Troy,

Thanks for the patch!

I just had a talk with Dong from Spacemit. He tells me the BS01DCMA is
the name of a module similar to the com260, only it has a different
form factor and each module consists of 2 separate K3 nodes. Similar
to how the com260 module can be used in a small carrier board
(spacemit,k3-com260-ifx) and in a 10-node server
(spacemit,k3-com260-tq), I'd expect to see a
common arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi describing the
module itself, and then an
arch/riscv/boot/dts/spacemit/k3-bs01dcma-<something>.dts that
describes the extra peripherals that can be accessed when the module
is plugged into the server.

Unfortunately Dong didn't yet give me the name of the server using the
BS01DCMA modules that they showcased in Shenzhen.
/Emil

> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/Makefile        |   1 +
>  arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts | 266 +++++++++++++++++++++++++++
>  2 files changed, 267 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
> index 851b701e5da4..09d17fef995d 100644
> --- a/arch/riscv/boot/dts/spacemit/Makefile
> +++ b/arch/riscv/boot/dts/spacemit/Makefile
> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
> +dtb-$(CONFIG_ARCH_SPACEMIT) += k3-bs01dcma.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-ifx.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
> diff --git a/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts b/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts
> new file mode 100644
> index 000000000000..0c3b4ccd105c
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts
> @@ -0,0 +1,266 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
> + */
> +
> +#include "k3.dtsi"
> +#include "k3-pinctrl.dtsi"
> +
> +/ {
> +       model = "SpacemiT K3 BS01DCMA";
> +       compatible = "spacemit,k3-bs01dcma", "spacemit,k3";
> +
> +       aliases {
> +               serial0 = &uart0;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       memory@100000000 {
> +               device_type = "memory";
> +               reg = <0x1 0x00000000 0x4 0x00000000>;
> +       };
> +
> +       reg_5v_sys: regulator-5v-sys {
> +               compatible = "regulator-fixed";
> +               regulator-name = "P5V0_SYS";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               regulator-always-on;
> +       };
> +};
> +
> +&i2c2 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&i2c2_1_cfg>;
> +       status = "okay";
> +
> +       eeprom@50 {
> +               compatible = "atmel,24c02";
> +               reg = <0x50>;
> +               pagesize = <8>;
> +               read-only;
> +               size = <256>;
> +               status = "okay";
> +
> +               nvmem-layout {
> +                       compatible = "onie,tlv-layout";
> +
> +                       mac-address {
> +                               #nvmem-cell-cells = <1>;
> +                       };
> +
> +                       num-macs {
> +                       };
> +
> +                       product-name {
> +                       };
> +
> +                       serial-number {
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c8 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&i2c8_cfg>;
> +       status = "okay";
> +
> +       pmic@41 {
> +               compatible = "spacemit,p1";
> +               reg = <0x41>;
> +               interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
> +               vin1-supply = <&reg_5v_sys>;
> +               vin2-supply = <&reg_5v_sys>;
> +               vin3-supply = <&reg_5v_sys>;
> +               vin4-supply = <&reg_5v_sys>;
> +               vin5-supply = <&reg_5v_sys>;
> +               vin6-supply = <&reg_5v_sys>;
> +               aldoin-supply = <&reg_5v_sys>;
> +               dldoin1-supply = <&buck4>;
> +               dldoin2-supply = <&buck4>;
> +
> +               regulators {
> +                       buck1: buck1 {
> +                               regulator-min-microvolt = <1050000>;
> +                               regulator-max-microvolt = <1050000>;
> +                               regulator-ramp-delay = <5000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       buck2: buck2 {
> +                               regulator-min-microvolt = <1050000>;
> +                               regulator-max-microvolt = <1050000>;
> +                               regulator-ramp-delay = <5000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       buck3: buck3 {
> +                               regulator-min-microvolt = <800000>;
> +                               regulator-max-microvolt = <800000>;
> +                               regulator-ramp-delay = <5000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       buck4: buck4 {
> +                               regulator-min-microvolt = <2100000>;
> +                               regulator-max-microvolt = <2100000>;
> +                               regulator-ramp-delay = <5000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       buck5: buck5 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                               regulator-ramp-delay = <5000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       buck6: buck6 {
> +                               regulator-min-microvolt = <500000>;
> +                               regulator-max-microvolt = <500000>;
> +                               regulator-ramp-delay = <5000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       aldo1: aldo1 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       aldo2: aldo2 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       aldo3: aldo3 {
> +                               regulator-min-microvolt = <500000>;
> +                               regulator-max-microvolt = <3400000>;
> +                       };
> +
> +                       aldo4: aldo4 {
> +                               regulator-min-microvolt = <3300000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       dldo1: dldo1 {
> +                               regulator-min-microvolt = <1200000>;
> +                               regulator-max-microvolt = <1200000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       dldo2: dldo2 {
> +                               regulator-min-microvolt = <900000>;
> +                               regulator-max-microvolt = <900000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       dldo3: dldo3 {
> +                               regulator-min-microvolt = <800000>;
> +                               regulator-max-microvolt = <800000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       dldo4: dldo4 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       dldo5: dldo5 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       dldo6: dldo6 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       dldo7: dldo7 {
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +               };
> +       };
> +};
> +
> +&qspi {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&qspi_cfg>;
> +       status = "okay";
> +
> +       flash@0 {
> +               compatible = "jedec,spi-nor";
> +               reg = <0>;
> +               spi-max-frequency = <26500000>;
> +               spi-rx-bus-width = <4>;
> +               spi-tx-bus-width = <4>;
> +               m25p,fast-read;
> +
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       bootinfo@0 {
> +                               reg = <0x0 0x20000>;
> +                       };
> +
> +                       fsbl@20000 {
> +                               reg = <0x20000 0x80000>;
> +                       };
> +
> +                       env@a0000 {
> +                               reg = <0xa0000 0x10000>;
> +                       };
> +
> +                       esos@b0000 {
> +                               reg = <0xb0000 0x100000>;
> +                       };
> +
> +                       opensbi@1b0000 {
> +                               reg = <0x1b0000 0x60000>;
> +                       };
> +
> +                       uboot@210000 {
> +                               reg = <0x210000 0x5f0000>;
> +                       };
> +               };
> +       };
> +};
> +
> +&qspi_cfg {
> +       qspi-pins {
> +               power-source = <1800>;
> +       };
> +
> +       qspi-cs0-pins {
> +               power-source = <1800>;
> +       };
> +};
> +
> +&uart0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&uart0_0_cfg>;
> +       status = "okay";
> +};
>
> --
> 2.56.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
