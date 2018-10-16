Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7CCC5ACC6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 22:04:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 481C321471
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 22:04:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="khk8qn9Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHklnCrs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 481C321471
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/T51RKYPJ0WdwX+fh4ySOegx0QktEqPYzlBmE0zl2e4=; b=khk8qn9ZrcFgA0K7nlwB2anjx
	0pgsTXY0B69FOEri+AI5Dnu6twcA4vT4HH5vL5BJg4XUmX7FWQ5D+Dya1Lwv5q2Fvhl4Y2BLNW+V7
	RI240+7NtMC6B8Nek8qRvA3Dzm1/wygJSzojC8Pi1wOsWD7euxvH4oAJV0+9tVND+qEim7DWyiZki
	bfY8uC6p1C8sVRuDrofV3NNX2JT4NVzN4t9EEnVt/kgQSLS6nLN9t5oaPraGDFDJ7NAD/x73A029k
	WciKPnhmyQfXlkIcCwf9c6ayc9Arcxn9+LQARrFUfaWfIOuCkVxSV6PkXZZICKFiihtnFQUyj9Dil
	k8+VUszpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCXSR-0000en-GY; Tue, 16 Oct 2018 22:04:55 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCXSO-0000de-AQ
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 22:04:53 +0000
Received: by mail-ed1-x533.google.com with SMTP id l14-v6so13934167edq.0
 for <linux-riscv@lists.infradead.org>; Tue, 16 Oct 2018 15:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NXSAtxInDpav2TMfWlEdFVVydwk5NLD0uC7NkOBdkl0=;
 b=lHklnCrszkTaulrgZXfARRO9d77Wg+UDrSyaIEaly3GG8fB80q66Bl0brunxzs7E80
 KGZfHVG4jYvFGEow7yuwGk6w4fTqHakMt/vZzCop+14tndRJwrmKfJGBNf9Kq9V2oDeG
 MhTFSziEPWLymRgd3IlRYS+yiy/N3K6mPZvNRuLxzHjop5JICWlCVsXDrBZqBUEHCB5t
 nR3lD7RR64AoTupo8QA0c/kpeSB5W1q4UmTgKef0DLOZTf6W2eHg1US5SmfTE0ODpOwE
 BuonFXZkT6maYIgMRLAe/ve9sUGx7e4vq7wUVNwQY1Bq7knv8Dqx3CESKlensAEyqobA
 EgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NXSAtxInDpav2TMfWlEdFVVydwk5NLD0uC7NkOBdkl0=;
 b=fq0FYTgrFi+dVxtXIMN6ZsdBRKQCNuECBAi/Ryt/HExq5Q3MpupRgaXTusAQXB3fGw
 ZNJ4WmIOJ8IeORtzCmyBLWE7xd14cuMLyp2NPW0SGqkC9mbAxx+1hYd4n4pVnHxBytoR
 yOipFRIl3x+AEOM7oJNZRCc8p4f2LSdEIwIOh2JM6QpEhP7RHGBH2rynQ8x/A+mwkavq
 8IBVCyw9hti0lXMmWlo12nhhrj/0zoqYEb+chTU+W9Attilermy9XMnHLo0J4G/mLOjH
 nnMsCnklVy88Scd6o6MhtcA3UKJbrdJgY4Fp4Khf+9NrRClHs4pYyJA8lfwb+sKUY7LI
 YJrg==
X-Gm-Message-State: ABuFfojA/5a8KJtXlVAvs4+hdKoU4JrKOT5JgGo7i/ILymRVWST0KBQN
 w6wpw2DaKHR2KlXRzD4ZYpA=
X-Google-Smtp-Source: ACcGV60rrLbJWV/HWOuoMh3CcWXwYK9mvu3bgZZd43NHgPJnF7Ok448MJxN+vpAVjYkAUDXN8aqYZg==
X-Received: by 2002:a17:906:4583:: with SMTP id
 t3-v6mr25076310ejq.210.1539727480103; 
 Tue, 16 Oct 2018 15:04:40 -0700 (PDT)
Received: from localhost
 (p200300E41F201D00021F3CFFFE37B91B.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:21f:3cff:fe37:b91b])
 by smtp.gmail.com with ESMTPSA id f25-v6sm3258881ejb.29.2018.10.16.15.04.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Oct 2018 15:04:39 -0700 (PDT)
Date: Wed, 17 Oct 2018 00:04:38 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
Message-ID: <20181016220437.GB31973@mithrandir>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010134926.GD21134@ulmo>
 <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
 <20181016110142.GC8852@ulmo>
 <6e108e3c-15c1-b13b-ac3e-60c5eb209c7b@sifive.com>
MIME-Version: 1.0
In-Reply-To: <6e108e3c-15c1-b13b-ac3e-60c5eb209c7b@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_150452_520035_FA204A34 
X-CRM114-Status: GOOD (  23.10  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 Wesley Terpstra <wesley@sifive.com>, linus.walleij@linaro.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0377782278524974058=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016220438.-Z16xGEj2FrRuVZhlOp8awoJw_S8vRKsu5v6JO7RHqw@z>


--===============0377782278524974058==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2018 at 10:31:42AM -0700, Paul Walmsley wrote:
>=20
> On 10/16/18 4:01 AM, Thierry Reding wrote:
> > On Mon, Oct 15, 2018 at 03:57:35PM -0700, Atish Patra wrote:
> > > On 10/10/18 6:49 AM, Thierry Reding wrote:
> > > > On Tue, Oct 09, 2018 at 11:51:22AM -0700, Atish Patra wrote:
> > > > > +Required properties:
> > > > > +- compatible: should be one of
> > > > > +	"sifive,fu540-c000-pwm0","sifive,pwm0".
> > > > What's the '0' in here? A version number?
> > > >=20
> > > I think yes. Since fu540 is the first Linux capable RISC-V core, SiFi=
ve Guys
> > > decided mark it as version 0.
> > >=20
> > > @Wesly: Please correct me if I am wrong.
> > It seems fairly superfluous to me to have a version number in additon to
> > the fu540-c000, which already seems to be the core plus some sort of
> > part number. Do you really expect there to be any changes in the SoC
> > that would require a different compatible string at this point? If the
> > SoC has taped out, how will you ever get a different version of the PWM
> > IP in it?
> >=20
> > I would expect any improvements or changes to the PWM IP to show up in a
> > different SoC generation, at which point it would be something like
> > "sifive,fu640-c000" maybe, or perhaps "sifive,fu540-d000", or whatever
> > the numbering is.
>=20
>=20
> The "0" suffix refers to a revision number for the underlying PWM IP bloc=
k.
>=20
> It's certainly important to keep that version number on the "sifive,pwm0"
> compatible string that doesn't have the chip name associated with it.

Isn't the hardware identified by "sifive,pwm0" and "sifive,fu540-c000"
effectively identical? Is there a need to have two compatible strings
that refer to the exact same hardware?

> As to whether there could ever be a FU540-C000 part with different IP blo=
ck
> versions on it: FU540-C000 is ultimately a marketing name.=C2=A0 While
> theoretically we shouldn't have another "FU540-C000" chip with different
> peripheral IP block versions on it, I don't think any engineer can guaran=
tee
> that it won't happen.

I would argue that if at some point there was indeed a chip with the
same name but a different IP block version in it, we can figure out what
to call it. Sure there are no guarantees, but it's still fairly unlikely
in my opinion, so I personally wouldn't worry about this up front.

Anyway, I don't feel strongly either way, I'm just pointing out that
this is somewhat unusual. If you want to keep it, feel free to.

Thierry

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvGYHQACgkQ3SOs138+
s6Hahg/+NQ5CHvFT0bH8HcY8uoN6f7XFm/apwAkvBhdwjG5Cwrz5vvnWRk5T6kgu
Uwg9cLx/UDQPEoswnA6J7A/2UHzRojvLYhismbi4JPLxkTNEZEgwAN5VYbVrC1Dx
HBpFtfK30gXG207M27uMSOVf3xd4j1vYliUC662NG4cSOGZJZIjLRmooTIMPoYTk
ICh+GIvxgqw4PdgtyYGi1Yvi6upw9LqOSzUC0sQQNkQqZXv/4SwGeWxEGCOXNxof
Gvg3dUU5/N/jOQWlmZTSOuao1BeEUiGreLcCyv8PoMklYwFUJJlz0DauamuQGINy
WDtHAGcFiIRbrGNAVs59TSz0Wur/o3by9uRSE0UYfa2i2zrYE9PeNSGyunyeMrtu
VacYjYiGyUNRO20YGtn4/rHIOiPZT6vnFY+gj7q5T3q4KghiZgmoRhYHEagJwH8/
IwepyPsn3yKJvepitm1WF4oTQeyAYIIayTYKn25BXXtwv6T8oU6WYBDVvQttgLw4
m8kMf8DErLPwBBI8QGUGbrm5FpiJhX045kmRlSyqL6tXx/xopzNNdioRV7gRprE4
rBQfSrl90OxM9J58eUHeMmi/tasjlKAVmPoyUC04JyQM3IZIT/ZUYJ3sf/eYQigl
tjEHVAh68jtI8NJ1me9cT9z/7NoIDvG8qwQsFXytk51g7bu98DM=
=8BAi
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--


--===============0377782278524974058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0377782278524974058==--

