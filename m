Return-Path: <SRS0=M4Bm=UI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6201DC28EBD
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  9 Jun 2019 06:18:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3620A208E3
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  9 Jun 2019 06:18:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O53R0/kc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbeklqhv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3620A208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vAFC0G8tGk8INQB16DtG7ftuqq5Z5iu/HxsycJ5AcVE=; b=O53R0/kcV4gAW9
	dG8yY3St8yC7AuBk9RNzLg4GVnRcHm6kEaabrNLXC2rLwEOsV0V5P+RhnVMTW9P0FbNlqshlvOyLU
	476cgAsm3oxvU54MeJR5WE+0cMCwcGXztGLDHwxiCqIh6OOpkecPlREmzQFMbQkoZJZjlVnwr35Nx
	fOTpeOBguxglFjIoYAY4mT6L2AqBHcjY83ANffLU6xm7iyzAFjVEYRUNZeUG/Ih9dp01yhu8wcr9E
	tcKJPJRHyxLw49LxFb3kBtZe7TLLE6nbTNQH+ll3+aDmXkbukDpDR3Ncj3ILhgbkPoj2ibi1x6L6X
	Cx4q05x+03vvNgAmgRlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZr9z-0003nN-Km; Sun, 09 Jun 2019 06:18:31 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZr9w-0003mI-4Y
 for linux-riscv@lists.infradead.org; Sun, 09 Jun 2019 06:18:30 +0000
Received: by mail-lj1-x243.google.com with SMTP id 131so5099385ljf.4
 for <linux-riscv@lists.infradead.org>; Sat, 08 Jun 2019 23:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Vo5eaKQWCMq7v7z2ph7sxEFSNuB5Lf75LyEjuFRQsU=;
 b=gbeklqhv5CVhh907QpjsEgaQqjswCM1044mz4/7WNlhZg6tywR07JjbEinmhaPFc79
 p21Nhu7NcWjGThV8grm4UdhkGlFDzkToOqmGRquLjJDndricciBQIFu7VG2IUy8eId/g
 xASjqXHd+XMDy+twqrE4jMu4ZTE5xzD5cEFuFnle5HrN/NB6H8bA+PAJe5kt4FbK0qDR
 dHiJkXpNYFv7Pf3yHzfuw2chVHkO9gVL9bT1BgWX4avTIIVTQinbfmTgB4Xm+MGQDffP
 3g9hpVK2eK2OkuMlMT5It2urrbG8hBhvH95tNSbCmgv82S4odc5wGq9HzDXZqBXf85Ql
 ZlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Vo5eaKQWCMq7v7z2ph7sxEFSNuB5Lf75LyEjuFRQsU=;
 b=sh5q3lWBjNp/CHraLw+Jb8HT2jJ1rHRPJXOSW2UvUYEcf2WXZVPI9Ys8k1MrnIM0VJ
 UgVUSGZJrySWT9bZsbcTDMFC1E9UTPWd0wRxq+SbofYjR6k6kSZ8//gFABLoK1dBePKE
 9tJpL9uVrxKlBJEqk+qrqvwt1ORDQiyEgEcRJCocHwLIAtRHWzV7anyBn2WQPu5f2NNx
 S3jNXkTFL8I3X8NPd71oB0HzzUMI8UFkZ3yhAF5Te1hh/E+KuRKClj5VcLO3hZYcgbmv
 B3JhxbUtqOowFsF0vR3qgwYWqihM0iMhBhFLhBUVv2sx4nAnB+yraEi2oqwREliPoS9g
 U6ww==
X-Gm-Message-State: APjAAAU0xNjFXRhAjWK0eqnLxHLlRleRMRhrICv0D4uUoXgReusBLiid
 gLkywzwAwvgD+QLdgJQ5QoQ=
X-Google-Smtp-Source: APXvYqye6JnuBAsP0g3mvLnlp32I7Us4WHTg9hj/ifomjyySkFiDqstvspKK7uMtV+n3dxSibLa+mw==
X-Received: by 2002:a2e:6e0e:: with SMTP id j14mr4075717ljc.85.1560061102240; 
 Sat, 08 Jun 2019 23:18:22 -0700 (PDT)
Received: from flare (t35.niisi.ras.ru. [193.232.173.35])
 by smtp.gmail.com with ESMTPSA id q13sm1296215lfk.65.2019.06.08.23.18.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 08 Jun 2019 23:18:21 -0700 (PDT)
Date: Sun, 9 Jun 2019 09:18:19 +0300
From: Antony Pavlov <antonynpavlov@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v3 5/5] riscv: dts: add initial board data for the
 SiFive HiFive Unleashed
Message-Id: <20190609091819.2d1a97c90c0b44aa9120d373@gmail.com>
In-Reply-To: <20190602080500.31700-6-paul.walmsley@sifive.com>
References: <20190602080500.31700-1-paul.walmsley@sifive.com>
 <20190602080500.31700-6-paul.walmsley@sifive.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; i686-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_231828_193663_B96DD0DD 
X-CRM114-Status: GOOD (  17.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun,  2 Jun 2019 01:05:00 -0700
Paul Walmsley <paul.walmsley@sifive.com> wrote:

Hi!

> Add initial board data for the SiFive HiFive Unleashed A00.
> =

> Currently the data populated in this DT file describes the board
> DRAM configuration and the external clock sources that supply the
> PRCI.
> =

> This third version incorporates changes based on more comments from
> Rob Herring <robh+dt@kernel.org>.
> =

> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/boot/dts/sifive/Makefile           |  2 +
>  .../boot/dts/sifive/hifive-unleashed-a00.dts  | 67 +++++++++++++++++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sifive/Makefile
>  create mode 100644 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> =

> diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/si=
five/Makefile
> new file mode 100644
> index 000000000000..baaeef9efdcb
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sifive/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-y +=3D hifive-unleashed-a00.dtb
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/r=
iscv/boot/dts/sifive/hifive-unleashed-a00.dts
> new file mode 100644
> index 000000000000..1de4ea1577d5
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2018-2019 SiFive, Inc */
> +
> +/dts-v1/;
> +
> +#include "fu540-c000.dtsi"

You already have "/dts-v1/;" in the fu540-c000.dtsi file.

You can omit it in the hifive-unleashed-a00.dts file.

> +/* Clock frequency (in Hz) of the PCB crystal for rtcclk */
> +#define RTCCLK_FREQ		1000000
> +
> +/ {
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +	model =3D "SiFive HiFive Unleashed A00";
> +	compatible =3D "sifive,hifive-unleashed-a00", "sifive,fu540-c000";
> +
> +	chosen {
> +	};
> +
> +	cpus {
> +		timebase-frequency =3D <RTCCLK_FREQ>;
> +	};
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x80000000 0x2 0x00000000>;
> +	};
> +
> +	soc {
> +	};
> +
> +	hfclk: hfclk {
> +		#clock-cells =3D <0>;
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <33333333>;
> +		clock-output-names =3D "hfclk";
> +	};
> +
> +	rtcclk: rtcclk {
> +		#clock-cells =3D <0>;
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <RTCCLK_FREQ>;
> +		clock-output-names =3D "rtcclk";
> +	};
> +};
> +
> +&qspi0 {
> +	flash@0 {
> +		compatible =3D "issi,is25wp256", "jedec,spi-nor";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <50000000>;
> +		m25p,fast-read;
> +		spi-tx-bus-width =3D <4>;
> +		spi-rx-bus-width =3D <4>;
> +	};
> +};
> +
> +&qspi2 {
> +	status =3D "okay";
> +	mmc@0 {
> +		compatible =3D "mmc-spi-slot";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <20000000>;
> +		voltage-ranges =3D <3300 3300>;
> +		disable-wp;
> +	};
> +};
> -- =

> 2.20.1
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


-- =

Best regards,
=A0 Antony Pavlov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
