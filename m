Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4450C021A4
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 00:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHbTgQV8tK7yS3UxOuJ+8eoo4lQrPgDUDCeTNOUCNRQ=; b=lMtOrnDlIh9vBz
	2x+IYHOAjogoNaDl6l35i4mRH3/7VO4Hj7db5MPhoOBcZTreYxFb8ibyCMhfiGPAissWIvSkYxYPl
	mtO0vGrP9I8NpI7BEIOTlGNDk9y/KG5JmqPFkNHRzhNVthJz5m5ODYIW7FlW8wXJFW+r8iGuXf96K
	EzODPYq0dilYW8p3sZiJSJaCvWfIFVCUtwiE0CC0OFOSPBsUdehL5rFBiNIywagq56V1GPvUvKRdK
	pcT8C2QIrvRHog5vklbQg3qUf8X0Z/ubTwCjfTfNKVPXPhNl8H1n4M7QT842a4Ig+J7roj58SCfC8
	LLMJ3yfYrSSSkjpPeewg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiye-0000000FdEq-3Amd;
	Tue, 25 Feb 2025 00:39:12 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiyc-0000000FdEL-12MP
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 00:39:11 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4721aede532so52538891cf.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 16:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740443949; x=1741048749; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WZV4VbgAA8psv5vM2PGHPKcQafhnuCZSauoIR3CxAI8=;
        b=C3xOz88grdcpKJWJKruPBB3Gf/bNQ3FvwI0jLhrMSblgJ2wVVTJ0/uwjENCxwXlNol
         z4lbTFixn/h2XuiCMFNHvwpalHj4fvUaCpMXl3Eur8hcUyy/9VrE5O7eamQqAFqlRmuz
         URAb+ybqignFqTG8NYMP7sANSNygfo5G3zfOrW8qwOSKVwe7AawjVFFxf1KpIOvcGA+j
         /nPh2DhAm9ZX0BKzSnXIbD7pN1ap7S2XWuRhPAPgTPgqM/Kfru5gUIsqzG+xcmIUJQJ0
         B9cCu0Z0+OCkf2tHJZDtLUljmJnnFD7VrTWq07HyqaG8UX2N7xWKby+n4Qk4zDbi4V9R
         vxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740443949; x=1741048749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZV4VbgAA8psv5vM2PGHPKcQafhnuCZSauoIR3CxAI8=;
        b=r6bZP//0Jm4egpK+9wrvSpEb6b/Ua8kpEiARZqumPuNKbEK2W+DbIS/M2we90DKZSH
         bOTpKvI8hKyZMIqVuACdtAEIVauqbFnTuuW0dpR6YQnCZys2aaguke0yu9vUtW0VoQLc
         +r4HWUA6SMTKOnJBCALuZa/ttjebd9pl0yMiVYY1EQlt+rcePqOYKlcCZStzGQ7t3OFP
         YwdYK2xAZwD/c/eak7Q58yqt50kL4CQLAmJq34otagIYys0K6f1RQdSQ+r15EcXZyzI+
         3H2Je7KMuOSLRnn/j4dKtrhjFzavs/cZ+u9yRKwsMksR15vdx2H6uab3Fh8RAAs/kKRA
         5fOA==
X-Forwarded-Encrypted: i=1; AJvYcCVK/yZQfsNwgWt4SkQS1Z00AAxDkJS3+qbOFndeWLIxPuMLKl9Oo7/UzB9yjYyuqazUR2RlSVtdXDR/OQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqlPcqdHmLnLAE2MOItItjeF1ylit0JBRow7a9mxvGMaijFsJk
	Bs/WE5xeKZnd/RWkK6AWFAP8IM5Cud5yQcxpfAhP7lQN2nTxNfKl
X-Gm-Gg: ASbGnctJffk5eIV/Du5BvFz8op8ugCN+ipJ4TPTmWGWnr550TMBFIbHVDbuDPFOMtOP
	MWNA1RsL+K50cE0BzbtVeJhzREpLMFWEYbnPgyNOzkd5Pm3LKqzIs5vYffLIhjboaE/dbGhBdaH
	tyeddr2nSnRjjIaLo2uSdDraXbx+b41WkGXvIoxdCJTcrgo/ZujYAR9rDwk2bxE7fiimERyEvrv
	bPXNeU9SHHxEJvGa5bmuuOXqjOGo5r6xscpOV/b+Agb2cqHh4Q9khOsPrWnw1EvMcTt33l6s/Xy
	vQ==
X-Google-Smtp-Source: AGHT+IF9/STffMSBQKErcBedEUh6zKFT5Jka/X26MYZ0WE84p6+GsFHddD/jpgfjAq683bXrYLKlgA==
X-Received: by 2002:a05:6214:2467:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6e6b002ee97mr205009756d6.5.1740443948849;
        Mon, 24 Feb 2025 16:39:08 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c23c34f611sm40101285a.116.2025.02.24.16.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 16:39:08 -0800 (PST)
Date: Tue, 25 Feb 2025 08:38:49 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Longbin Li <looong.bin@gmail.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 3/3] riscv: dts: sophgo: add Sophgo SPI NOR controller
 driver
Message-ID: <nni37727545uwmq5uizihptcyq435wopjurdjcqufsfvfq3lc3@aq4zpb2l3nw7>
References: <20250224101213.26003-1-looong.bin@gmail.com>
 <20250224101213.26003-4-looong.bin@gmail.com>
 <PN0PR01MB91662EB902D8B337A0526458FEC32@PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PN0PR01MB91662EB902D8B337A0526458FEC32@PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_163910_283031_F0CD2EC5 
X-CRM114-Status: GOOD (  18.24  )
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

On Tue, Feb 25, 2025 at 08:23:36AM +0800, Chen Wang wrote:
> =

> On 2025/2/24 18:12, Longbin Li wrote:
> > Add SPI NOR device node for Sophgo.
> > =

> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > ---
> >   .../boot/dts/sophgo/sg2044-sophgo-sd3-10.dts  | 18 ++++++++++++++
> >   arch/riscv/boot/dts/sophgo/sg2044.dtsi        | 24 +++++++++++++++++++
> >   2 files changed, 42 insertions(+)
> > =

> > diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts b/arch=
/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts
> > index c50e61a50013..9c634920f37e 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts
> > +++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts
> > @@ -80,6 +80,24 @@ &sd {
> >   	status =3D "okay";
> >   };
> > =

> > +&spifmc0 {
> > +	status =3D "okay";
> > +
> > +	flash@0 {
> > +		compatible =3D "jedec,spi-nor";
> > +		reg =3D <0>;
> > +	};
> > +};
> > +
> > +&spifmc1 {
> > +	status =3D "okay";
> > +
> > +	flash@0 {
> > +		compatible =3D "jedec,spi-nor";
> > +		reg =3D <0>;
> > +	};
> > +};
> > +
> >   &uart1 {
> >   	status =3D "okay";
> >   };
> =

> What is your baseline? I can't see "sg2044-sophgo-sd3-10.dts " on the lat=
est
> mainline yet.
> =


It seems like he forgot to remove this patch as the baseline is not
submitted.

> BTW,=A0 the name "sg2044-sophgo-sd3-10" seems a bit redundant. Wouldn't
> "sg2044-sd3-10" be better?
> =


I do not think so. we want <soc-vendor-board> format. In this format.
sophgo is a must.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
