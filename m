Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5793C04EBD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 11:02:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68B682086E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 11:02:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yb9CR5/H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HijZaiu5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68B682086E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0pbTS1zUC8onDWldGNgXP+2oe2tJG5sGebnhe5gJmOY=; b=Yb9CR5/HpVWf6hpaHxJem10Xz
	M7URcLDeA4Lya+etU7jLrJ0N4RgPfIYLDGrtqJC1D/Zcsp2VCsuPYCyCEnqnXXvpfDCgu5paROsUD
	a3IzsXekLqXEAOMcWMIR7bfXhiXOXROdUaDWjNMeDKiAXhxHF1J3eeB2zZMUosNFmFw2YaBHd/qhR
	n1+bFVFmYlAAOgut9Tyya8kqGcu7DsAeXP0/eDbbwCW2XpfiXHdGaIbbPTAja3ywc5BdeCaKEbopJ
	RpB3GeYsH4odwPXhQ9VE2E6p2nI+bCcZrPBg74WuOcnrPBggEkzMyXrAgGkW0f0LPZf5WpJjV4jU9
	lZbq7LsCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCN7b-0000GW-Rt; Tue, 16 Oct 2018 11:02:43 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCN6q-0008N0-2e
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 11:02:18 +0000
Received: by mail-wr1-x444.google.com with SMTP id d2-v6so24979496wro.7
 for <linux-riscv@lists.infradead.org>; Tue, 16 Oct 2018 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fnGCS83Z0SZAGsiz42xG0H+2VU7WB1tZuj9DdgTIoQQ=;
 b=HijZaiu5sP3vZtlCbpQZqyDsGFpqIRHQgyMltErHDYKNDutFb6azEo8VWcnZxd2HPx
 x3idSsHg0FEecmvOeEtF+ayf1448eR/5B4WThHpMoY2b51hdjAqJhfR7CnPBk4MYl8KX
 lQmCEkKamsvEETtB/xtK07w1qfQpxsS3idFMb32Yph9yC1kPRbPu7PXEbraYL232zBkb
 2Vj61TBwHnC5+A1SqriQa/PP4xuZ/lKezYqu4HdgqDAcHpoBhHQGawH2pgc1tE5veLoY
 DAF3XE+qtpJsX0RMLiCJrWEwiZM+IzIG6eqv+NEoHydy3uXzjvkQSk/f5y3CMOATWM3U
 yfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fnGCS83Z0SZAGsiz42xG0H+2VU7WB1tZuj9DdgTIoQQ=;
 b=hKFc/SNxCJMdZFFjFmjPIas4Ts9FkRNnRs67No2YGgwdnkAQV72axtSZ4lmgLIclem
 dSI8kM1f5OUIiBT9eJYj+Hwhhz//Xdi9VOtQPQCMqc1GqkUM2VqWF2ztveDrt+ULciyt
 lcxPSiQ/pcYIPLg73DSPf6vlW+JmUHTRV6eGb3tQL7AZWZjWymJA6QP9QscGE3fwShix
 +VVgrsKxvbeTPrKvmuL+HDzgVDZsxq+EZeKAVuHv9qFNYURkdJ0P2VI9unHcdAhXCaV1
 YlHFo46yzc+yYO1KIjQFtMaQ8k3vrl+gcHTjTO8nt6aqS0neF5VqX+C4QKiLm+VNeWZL
 GC+g==
X-Gm-Message-State: ABuFfohWWUDV5qlgm0maVukeLXhVAcgCOQ8kCmlKFxnoN/4otnB0H17m
 QfvO62mNas3wy/tU7QGGaHA=
X-Google-Smtp-Source: ACcGV60XPHlPvtT49HYyLOubtJz18+BHFeC1YnHOQgMbaW99bDWRvBFlBT3htyhCBzTfO1CtCq3UIg==
X-Received: by 2002:a5d:4208:: with SMTP id
 n8-v6mr17033485wrq.260.1539687704113; 
 Tue, 16 Oct 2018 04:01:44 -0700 (PDT)
Received: from localhost (pD9E5106D.dip0.t-ipconnect.de. [217.229.16.109])
 by smtp.gmail.com with ESMTPSA id 126-v6sm11977018wme.48.2018.10.16.04.01.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Oct 2018 04:01:43 -0700 (PDT)
Date: Tue, 16 Oct 2018 13:01:42 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
Message-ID: <20181016110142.GC8852@ulmo>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010134926.GD21134@ulmo>
 <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
MIME-Version: 1.0
In-Reply-To: <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_040156_156336_9CE02EF1 
X-CRM114-Status: GOOD (  30.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Wesley Terpstra <wesley@sifive.com>, linus.walleij@linaro.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5046195507495047457=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016110142.9yyj4Qt3wobg7fn_mKOAk3HPkXwXAboEbKziL-e-vks@z>


--===============5046195507495047457==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline


--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 15, 2018 at 03:57:35PM -0700, Atish Patra wrote:
> On 10/10/18 6:49 AM, Thierry Reding wrote:
> > On Tue, Oct 09, 2018 at 11:51:22AM -0700, Atish Patra wrote:
> > > From: "Wesley W. Terpstra" <wesley@sifive.com>
> > >=20
> > > DT documentation for PWM controller added with updated compatible
> > > string.
> > >=20
> > > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> > > [Atish: Compatible string update]
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > ---
> > >   .../devicetree/bindings/pwm/pwm-sifive.txt         | 32 +++++++++++=
+++++++++++
> > >   1 file changed, 32 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive=
=2Etxt
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/D=
ocumentation/devicetree/bindings/pwm/pwm-sifive.txt
> > > new file mode 100644
> > > index 00000000..532b10fc
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > > @@ -0,0 +1,32 @@
> > > +SiFive PWM controller
> > > +
> > > +Unlike most other PWM controllers, the SiFive PWM controller current=
ly only
> > > +supports one period for all channels in the PWM. This is set globall=
y in DTS.
> > > +The period also has significant restrictions on the values it can ac=
hieve,
> > > +which the driver rounds to the nearest achievable frequency.
> >=20
> > What restrictions are these? If "nearest achievable" is too far off the
> > target period it might be preferable to error out.
> >=20
>=20
> @Wes: Any comments?
>=20
> > > +Required properties:
> > > +- compatible: should be one of
> > > +	"sifive,fu540-c000-pwm0","sifive,pwm0".
> >=20
> > What's the '0' in here? A version number?
> >=20
>=20
> I think yes. Since fu540 is the first Linux capable RISC-V core, SiFive G=
uys
> decided mark it as version 0.
>=20
> @Wesly: Please correct me if I am wrong.

It seems fairly superfluous to me to have a version number in additon to
the fu540-c000, which already seems to be the core plus some sort of
part number. Do you really expect there to be any changes in the SoC
that would require a different compatible string at this point? If the
SoC has taped out, how will you ever get a different version of the PWM
IP in it?

I would expect any improvements or changes to the PWM IP to show up in a
different SoC generation, at which point it would be something like
"sifive,fu640-c000" maybe, or perhaps "sifive,fu540-d000", or whatever
the numbering is.

> > > +	PWM controller is HiFive Unleashed specific chip which warrants a
> > > +	specific compatible string. The second string is kept for backward
> > > +	compatibility until a firmware update with latest compatible string.
> > > +- reg: physical base address and length of the controller's registers
> > > +- clocks: The frequency the controller runs at
> > > +- #pwm-cells: Should be 2.
> > > +  The first cell is the PWM channel number
> > > +  The second cell is the PWM polarity
> > > +- sifive,approx-period: the driver will get as close to this period =
as it can
> >=20
> > Given the above comment, maybe "sifive,period"?
> >=20
>=20
> ok.
> In Unleashed board, the DT is loaded by FSBL (first stage boot loader).
> Thus, changing device tree entries requires a FSBL update. If we update t=
his
> string, we need to update the driver to parse both properties so that
> existing devices with older firmware continue to work.
>=20
> This is probably ok as we anyways do that for compatible strings. Just
> wanted to update that here for the record.

I'm going to defer to Rob on this. He's said in the past that he doesn't
care about existing bindings that haven't been vetted through upstream,
even if that means that bootloaders may have to be updated. I know he's
been fairly strict on this in the past, but let's see if there is room
for exceptions.

Thierry

--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvFxRMACgkQ3SOs138+
s6GhURAAmC6vuSADDLFab6WEqwRLFGoo9to8KJZ7D+7hu7qf/bAwo8RXJ30UXWyE
72UmII/bY4sTDaBAPU0e4LhN7fwp4TaOWqV03FN2zalTxPeeVF7zEE7elulhsZNp
9UuSTvIAXvHK8FmE3mFoGXduSaDAfpDmx2CzLZrHtJ14JSK2xpRr6z7K2OX2XdWP
YsPglyv40v1e/x8p/GlsiO8fo8+AtOFyyCvIq/IcI+o3ynQZXwyYsGOdSrtPYHTj
51ZDLXJK4dAxLijoJ/MPpZGq50BNbtSlgsylEkHV/7iLhGqskQkjXlUlM1zPBTeX
VWHK+/akjOzlEhase3MaBA4wNgZZ0JPXWn+pUWIK4CjL9A6sTbxWEiVGBK9Heo5O
3ghb8BcJolWVgS0Z9xnamcs1SXODhqwQzZhVNNSW2xQTsdEW0+OKcwWuNANOOzrr
a7yZQYL55G+C3cBL74Kc4n82gjlIsl+q85OD0XMyhpoVRPd2SvLFqy7nHXVRl50K
PGEJNwLIFYgKzFcHUQI7uO+wBAo9Lx92QPBVtUJCrbBwJxcgkCXwwWMQqLyR5WbL
Uaw2K5rb6ICdIxzlsd4C97alXe/7xCU0tSLiUmieno02appctkBQEoceKqeVAbOZ
A2+T8lVGEmPg3ugVzeSyvJxDXo679KUNQAGHz7GgTg3yJmDhraI=
=UizH
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--


--===============5046195507495047457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5046195507495047457==--

