Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BF7C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Dec 2021 21:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mq+DqN1j8qfhYsuok8fuj9H8W8OdZh/1VawX5LSTjZQ=; b=oRNoF+WIY1PRU9
	oNTVyZzocSW9hZUS7B5JHOhZ0Kdz+2fe76FrJcmOHL+8E+z+Gzso4j3b4snj+QLPvcaoNHIi+Lwb+
	6g0MCpo29uxqaLQ0kj50rbwtVKQiZmDfWzNXPJCK1V1/1SS/rIZ74ci2kobQDizA3c15aIJP9KX9c
	Yo8lDm5z5sbXwKlSql/rcwiht6QZaS+k49t41K3T6rR5bP85xoKPzHtVBt1nzHnPJTHljgLABhPG1
	nFxa0/sPSopQ1mIsKUIpF37zXRKDZb6F5RC5nQxoOLi6pnS3wpURlK14HQTaiB0ezj09CQcIKBZ2h
	bkH6v/tXh8x0pjLTZ+Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mz4BD-00H8ja-FM; Sun, 19 Dec 2021 21:57:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mz4B9-00H8hw-F9
 for linux-riscv@lists.infradead.org; Sun, 19 Dec 2021 21:57:17 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mz4As-00068I-JM; Sun, 19 Dec 2021 22:56:58 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: plr.vincent@gmail.com, linux-riscv@lists.infradead.org
Cc: robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 qiuwenbo@kylinos.com.cn, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 david.abdurachmanov@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v3 4/6] riscv: dts: sifive unmatched: Expose the FU740
 core supply regulator
Date: Sun, 19 Dec 2021 22:56:57 +0100
Message-ID: <5471232.RFuYXYORHR@diego>
In-Reply-To: <mhng-854afd5f-800b-4b58-af68-cdc6afdc0a4a@palmer-ri-x1c9>
References: <mhng-854afd5f-800b-4b58-af68-cdc6afdc0a4a@palmer-ri-x1c9>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_135715_538024_FDB9FF34 
X-CRM114-Status: GOOD (  22.35  )
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

Am Freitag, 17. Dezember 2021, 06:35:00 CET schrieb Palmer Dabbelt:
> On Fri, 19 Nov 2021 14:55:40 PST (-0800), plr.vincent@gmail.com wrote:
> > Provides monitoring of core voltage and current:
> > tps544b20-i2c-0-1e
> > Adapter: i2c-ocores
> > vout1:       906.00 mV
> > temp1:        -40.0=B0C  (high =3D +125.0=B0C, crit =3D +150.0=B0C)
> > iout1:         5.06 A  (max =3D +20.00 A, crit max =3D +26.00 A)
> >
> > Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
> >
> > ---
> > Note: checkpatch.pl complains about undocumented devicetree binding,
> > which is fixed by:
> >   https://lore.kernel.org/linux-devicetree/20211116110207.68494-1-krzys=
ztof.kozlowski@canonical.com/T/#u
> >
> > Changes since v2:
> > - Fix end-of-commit-message separator so change lists do not end up in =
them.
> > Changes since v1:
> > - Added missing "ti," prefix in compatible string.
> > - Remove trailing "." on subject line.
> > - Rename tree node.
> =

> I see this in Rob's for-next as 761de79adc2c ("dt-bindings: hwmon: add
> TI DC-DC converters"), so I'm going to hold off on this one until the
> bindings land.

Can't this patch then simply go into your for-next branch then?

The split is most times binding goes through the driver-tree
(or Rob's dt tree) and the dts patch through an arch or soc tree.

But in general once a maintainer accepts the binding it is ok
to also apply the dts patch for the same cycle (aka merge window)
the binding will be in.


Heiko


> =

> I've put the others on fixes.
> =

> Thanks!
> =

> > ---
> >  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch=
/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > index 270360b258b7..6e7775fdae32 100644
> > --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > @@ -51,6 +51,11 @@ &uart1 {
> >  &i2c0 {
> >  	status =3D "okay";
> >
> > +	regulator@1e {
> > +		compatible =3D "ti,tps544b20";
> > +		reg =3D <0x1e>;
> > +	};
> > +
> >  	temperature-sensor@4c {
> >  		compatible =3D "ti,tmp451";
> >  		reg =3D <0x4c>;
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
