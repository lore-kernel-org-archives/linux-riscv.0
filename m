Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3427C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 09:53:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2932D6187F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 09:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2932D6187F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBfzNgmQlBvKW+cg76q4oi9476AJuhGDgRldPFvhLRo=; b=cF/fQx2k93DduQ
	hfC1CEXJRtTD3bqViNDNUaGiWWTlrsxlR5FHyVGa9hn0O6r5QPRsLoSeZBSOzz04pHlU+DHFsRbEA
	ZesSqUUTGaZnDeKYGwx4pcxbIlDC0RYfV5Sikf4UAA2LAS8BncN0qo9S0LSc9Yj0c+b3NMg7/tqSg
	TyzovxVPoVoOf34aYYn/bH/H2MoUwc6x9xaWyl9Y6W99lTTIkaplYN5Sd46WfegAMc9f79PK50gRG
	MZvG+217SkF7QkPA6a6ABkxieYb3LmAXLkA1l4p/ueE8vGL+AMHmIc3lJP17gpaPnf6LRwDEmFwtH
	JOX6UEAyeGmHfAlNxW2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmv9q-0011SO-Ls; Tue, 16 Nov 2021 09:53:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmv9f-0011PS-V3
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 09:53:33 +0000
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mmv9b-0003E0-Fd; Tue, 16 Nov 2021 10:53:27 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Yash Shah <yash.shah@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Cc: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: [PATCH] riscv: dts: sifive unmatched: Expose the FU740 core
 supply regulator.
Date: Tue, 16 Nov 2021 10:53:26 +0100
Message-ID: <2266648.AD6qrfpaa2@diego>
In-Reply-To: <0879c5b0c72b9bf6bf71f880def166f8804f41c7.1637023980.git.plr.vincent@gmail.com>
References: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
 <0879c5b0c72b9bf6bf71f880def166f8804f41c7.1637023980.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_015332_025314_3D7C3A17 
X-CRM114-Status: GOOD (  22.11  )
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

Hi Vincent,

Am Dienstag, 16. November 2021, 01:52:59 CET schrieb Vincent Pelletier:
> Provides monitoring of core voltage and current:
> tps544b20-i2c-0-1e
> Adapter: i2c-ocores
> vout1:       906.00 mV
> temp1:        -40.0=B0C  (high =3D +125.0=B0C, crit =3D +150.0=B0C)
> iout1:         5.06 A  (max =3D +20.00 A, crit max =3D +26.00 A)
> =

> Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
> =

> --
> Note for review: this patch has one warning from checkpatch.pl:
>   WARNING: DT compatible string "tps544b20" appears un-documented -- chec=
k ./Documentation/devicetree/bindings/
>   #32: FILE: arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts:55:
>   +               compatible =3D "tps544b20";
> This chip is handled by the existing pmbus module, and there is indeed no
> matching entry in Documentation/devicetree/bindings/hwmon/pmbus. I am not
> especially knowledgeable about this chip, I only know it is used by this
> board, so I am not sure I can do the best job in putting such a file
> together.
> If needed I can git it a try.

Devicetree bindings are supposed to be stable into the future, so an actual=
ly
reviewed binding is quite necessary ;-) .

In the case of your tps544b20 it should also be pretty easy to do, as

	Documentation/devicetree/bindings/hwmon/pmbus/ti,ucd90320.yaml

is probably a pretty good match to what you need in terms of Yaml notation.
Just need to replace the naming in your copy and drop in the correct
description from

	https://www.ti.com/lit/ds/symlink/tps544b20.pdf?ts=3D1637055780278

and you have a working binding.

Then just add another patch to your series that mimics

	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D8a36e38d8b0fbb92609e837a67f919202ec7ec51

and include the relevant maintainers that scripts/get_maintainer.pl will
give you, and you're all set :-)


> ---
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> =

> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/r=
iscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index 270360b258b7..e327831d0d48 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -51,6 +51,11 @@ &uart1 {
>  &i2c0 {
>  	status =3D "okay";
>  =

> +	tps544b20@1e {
> +		compatible =3D "tps544b20";

This should definitly be
		compatible =3D "ti,tps544b20";

i.e. include the ti vendor-prefix. The i2c-core will automatically
remove this when matching against the i2c devices.

Heiko


> +		reg =3D <0x1e>;
> +	};
> +
>  	temperature-sensor@4c {
>  		compatible =3D "ti,tmp451";
>  		reg =3D <0x4c>;
> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
