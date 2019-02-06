Return-Path: <SRS0=S271=QN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC63C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 12:41:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5787B20818
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 12:41:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZBlq7PZ/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7VGxFoZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5787B20818
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DIaluk1CbOlK4G2URn74oyP+8llKDO4llZAmhM1ePuE=; b=ZBlq7PZ/EEThLTklmfqjNG9St
	GS5FBaF8jZ0L+1GWU8vyjJXQD3YEkKVOMA9dgWh8wB/KxSTQPL3P7F4dOfiUZAjAdaGLOC3iq56Yd
	czxmBvVB114y5jiYur47rUKuDJdDojPSY5woLh0mnfR8LxkUAHV9oBXqbKxvK1Rq5gesE4RY+sGip
	6m97G2OUQ94nNOUxQ/eyXwqiBTokIKXgxGb6Bn/x7tvA1m+7Bw7+gJmI6b4sBqISvu+gC0mk8HvD4
	EMUW96GKkBysH+4p52k04xDxsgvqEcmZgzPjFSyaHAXp2WUnhRRZwDfCI1UZHsqMnnioK7yJ43djR
	6MtiRQXNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grMVi-0002T6-7f; Wed, 06 Feb 2019 12:41:02 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grMVf-0002Si-Cs
 for linux-riscv@lists.infradead.org; Wed, 06 Feb 2019 12:41:00 +0000
Received: by mail-wr1-x442.google.com with SMTP id q15so7324612wro.12
 for <linux-riscv@lists.infradead.org>; Wed, 06 Feb 2019 04:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tis5SAcrLw0sVnBACth58RVphDEDrVdV+7xU8ZHdREg=;
 b=g7VGxFoZh70yxpHWhuFlu5bNfmisB9CFRcCXckmywRVmxLe1iJnd8af5dInPjTIdTS
 lyKy3J7fCpIyjZAt4ONhVPs2FMRjptaBj+pmZE6q003fv9sWukJQAodtAnygANv8Q2O0
 vKuAbYwR8V0MkkAULmNWIG7DmV+DTH6ulTWuZhdNbhSBHnjCjKZexf+aBJ/HiqGP/T4s
 KDcgaBuz1nVEM49e8kP/KoE/bMOt2fOKHlpIcxDAHG+nCAy1MzgH7QcU/Fnk+5sM9RDP
 ywFjJq13b+8EvBqV+KObk07tsorOvXtoTQM5+8pp1ppw1S/SAMEpsLz1j9SM5rHgYTbl
 rQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tis5SAcrLw0sVnBACth58RVphDEDrVdV+7xU8ZHdREg=;
 b=oHFYjUWyOe+hSl5SALYAwj1cZQOTcxZgVK7+AYs6dyOTp7KHdnOARXUI1TP7PBUhAO
 IcZfBuESBdy/aQ9/WR5rRPtqb1+Fu7nTacG4t8gZKorIR+cl2EQk94vaGiStM0uyRGP7
 rLF6l7NZ51p5jJSJ6UlR8gBJminDq0MM78FC2jKNVnuv78p8yYuCs4c7iwSjWXcd12Ug
 xJyCxNShSjkpCjHZNKiIwPy71tK3iuxZgpckDanGiLR7DILinSW+lnJ1KCFM1s0ZivSY
 KchyPbn41QstgVk+iFlGZH2MHs6LDOOJNFQh8mZYavC+AJqhHq81gwFiAO2Llv+Bt6x+
 JhQw==
X-Gm-Message-State: AHQUAuaD7b2LQkvIQUhM/2YyulEkM5yRlW5k8bJKeapI0mT+FIhFTJkx
 fMoNoxxY+lS7WpUCDIoZnHE=
X-Google-Smtp-Source: AHgI3Ibwj8kdKRUo8QAgRdIUcEgTemw7KxE3Q+5xKOsLuCBn1qnLB4YrBHNwAdhndeu9/ErvbEuUYQ==
X-Received: by 2002:adf:fd50:: with SMTP id h16mr8396338wrs.231.1549456857554; 
 Wed, 06 Feb 2019 04:40:57 -0800 (PST)
Received: from localhost (pD9E51040.dip0.t-ipconnect.de. [217.229.16.64])
 by smtp.gmail.com with ESMTPSA id f8sm7471981wrv.41.2019.02.06.04.40.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Feb 2019 04:40:56 -0800 (PST)
Date: Wed, 6 Feb 2019 13:40:55 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v5 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Message-ID: <20190206124055.GF21676@ulmo>
References: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
 <1548762199-7065-2-git-send-email-yash.shah@sifive.com>
 <20190130081411.5rva7cpwoy2l5qjd@pengutronix.de>
 <CAJ2_jOHiJ3X5VYZMCNk2bpvUdDOsrqHJna3HPvtdNQpJB9fxjg@mail.gmail.com>
 <20190206110730.ogqxncrnblyazgjw@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20190206110730.ogqxncrnblyazgjw@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_044059_463966_C71C44DA 
X-CRM114-Status: GOOD (  26.07  )
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
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Sachin Ghadi <sachin.ghadi@sifive.com>, Yash Shah <yash.shah@sifive.com>,
 robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7026711403947977610=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7026711403947977610==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eDB11BtaWSyaBkpc"
Content-Disposition: inline


--eDB11BtaWSyaBkpc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2019 at 12:07:30PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Wed, Feb 06, 2019 at 04:18:47PM +0530, Yash Shah wrote:
> > On Wed, Jan 30, 2019 at 1:44 PM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > On Tue, Jan 29, 2019 at 05:13:18PM +0530, Yash Shah wrote:
> > > > DT documentation for PWM controller added.
> > > >
> > > > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> > > > [Atish: Compatible string update]
> > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > > > ---
> > > >  .../devicetree/bindings/pwm/pwm-sifive.txt         | 33 ++++++++++=
++++++++++++
> > > >  1 file changed, 33 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifiv=
e.txt
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b=
/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > > > new file mode 100644
> > > > index 0000000..8dcb40d
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > > > @@ -0,0 +1,33 @@
> > > > +SiFive PWM controller
> > > > +
> > > > +Unlike most other PWM controllers, the SiFive PWM controller curre=
ntly only
> > > > +supports one period for all channels in the PWM. This is set globa=
lly in DTS.
> > >
> > > You can simply drop this if the first user can set this using the usu=
al
> > > interface. Don't you like this suggestion that I already made a few
> > > times now?
> > >
> > > Did you consider to make the driver support only a single output with=
 a
> > > more flexible period setting?
> >=20
> > We cannot consider supporting only single output since we have boards t=
hat
> > use the additional PWM channels to control individual LED brightness
> > of a tri-color LED.
> > If we go down to one channel, then we can't control the brightness of
> > the individual LEDs.
> > It will break the use case.
>=20
> OK.
>=20
> > I am considering the below approach, let me know if it's fine by you.
> >=20
> > - Drop the global period property and allow the only first user to chan=
ge period
> > using the usual interface.
> > - A note in the binding that all PWMs need to run at the same
> > period. If the driver already refuses to apply incompatible periods,
> > the users are going to notice that they've got the DT wrong.
> > - In driver code, count the users using the .request and .free callback=
s.
> > Based on this, allow changes to period iff the user count is one.
>=20
> Not sure you need to point this limitation in the binding doc. Other
> than that this is fine.

I think it's useful to point this out in the binding documentation since
it's something that device tree writers will want to know.

Thierry

--eDB11BtaWSyaBkpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxa1dcACgkQ3SOs138+
s6FwnxAAnOiWlI5IXor27eIlWOEiHliIvBCTzMGSSDQ44AM/j+38k8KSzvq+n1qW
s207o9cjcOdJ3RCDh3fc26RLUVDJktckltr3KErgeaWuHZOktAlCznk6dlr8KNgo
eNTM31TqOtDKo5w6bWLvJ1hL+VUgqOCQDvHmyKzPIN8mfde3E+qegEq67QLicCzx
f9TPgGt6rBW5T7dGYgFmXcScanUrsJJsNSZchz3Jr8rhwQH6yzngWiaKVQJAZFfi
/elDBQecb/RGrFWae136qGSkcc1iXs613WCotxx9VwS1LeboMOXNSbsZOaBNK4JK
4948roLoBNZePVPaUfDFZjc6JiVOZO7cjJWystXdniw2DjYjjT8jeAX6Ib2uSOcw
/nZg7dd7t5XATDLe6X8WHvcgmrBZJ9pzEtFfcZfYy9yS3qD6f1fGxn3x+s9lbbzp
MA89TJdvZw1frVRbYq4dn5fMwqSm8Xkk/0f+aP8JyYYPgbDDnHl3vxja1wop6X2P
XjomhsxSXcUZ8ingcWpVZdrFQXKzg7iZKxRLI0UUl/6mwfflq7vOZ1DsuRYkBLvw
sXel5NH8sm2LHdnGl2ygss++aOhS5ycN9jwMHhxA+PqUz+geiXNWMD36ufKuq32O
IZZoeldKTLKTKcuouWqYIuc9unhQRvbNQTATCoLe4FRJw3bmBWE=
=l1j6
-----END PGP SIGNATURE-----

--eDB11BtaWSyaBkpc--


--===============7026711403947977610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7026711403947977610==--

