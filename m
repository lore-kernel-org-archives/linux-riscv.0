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
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD86C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 16:16:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA92120821
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 16:16:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G8Ohzoye";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crIgOcpI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA92120821
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3AE1+TpEVjZHh5uM86jSs41YW00rIjMeEqxCT9WJK58=; b=G8Ohzoyeg4bh2PTW1z2FCPGvm
	rV5LWHB8F5T17DWqBfatS/Hx/OerheSnzaJRR516nTYtHvw5qAH4M55qw/kttGATE4+Q+PoytLp+K
	JvfQzpltm0PxYYbyW/Md1+RxES/D9ojULW9m0Ax9tsRzdPiFQfyQKcK3fZT/QW/z53goJNazjS8I4
	jbkdwFsd/ptZ1FhySIiG6l93xfzJRZmYEyHt2EiwC5DYzkCFgMb+/wIKwaaYD3SZU+Fpi0qzyVVv7
	pYpIZ8orVFgtV0CCcGWx9U+MP2jzRxJq0JjZErKVRGv0slSVLay9r7YuxbY71PSKBk5MQOCvY8WlL
	YvxmKZUZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grPsR-0003mf-5N; Wed, 06 Feb 2019 16:16:43 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grPsN-0003lv-B1
 for linux-riscv@lists.infradead.org; Wed, 06 Feb 2019 16:16:41 +0000
Received: by mail-wm1-x343.google.com with SMTP id y185so2194231wmd.1
 for <linux-riscv@lists.infradead.org>; Wed, 06 Feb 2019 08:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q07IL42JU52Vm8uJdP+1JAei2+oUxgQSiUOLKXRXQI8=;
 b=crIgOcpIj9j0UJcq9yh5T8siD1cYDXGfuTIMyo/YFi9AT3k9bOGf5orNOrySSQI5FB
 xnsUwDKKwryZUYXIML6kl4WgpljSH1h3O0AhzKwjuJ4r7z+jBYpsBgojohM0gYPPKKgM
 KAVIqgF/TkIcfCgi2anWrcSVnAHVprjLT4kivQ3gODcvz3jWQu423jcluWliwRdFNhZE
 N9tuTpPmpnqEMQz6r4+LSzqsfoTl0l5Y7Anqd4omuQdqmu7DU6mOCMuS4TaRQUuvepMy
 US4ndelJhWFgbVeRMpHPbDqfIiB3oRytucs7TYuj6YcS+Pb47vzshL543VJwG+T2TkUl
 Bdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q07IL42JU52Vm8uJdP+1JAei2+oUxgQSiUOLKXRXQI8=;
 b=R/75UR59U1qkVlOyaWicCpV5SEKfaBxPL2weoI7DLtBb4Vu+Jz4JtrWFp0DtpA2eT0
 Eg6dA+uAmCkoar9IHZ2Svpt6f8kWiMq96ocHU2vrBkm9CSsvwzeE+PicOlSFD26PKzg3
 cLxP8CwFr+e/XPM1cgTIFHVKM9VWp5GO8vZLzzTGPo1b1MCWsM3uhEA4D9M6lXJP5ryW
 dOSN8eJtOcdbFxL1wvhz31oMJ2+x3ipIl3aUdxUPnsy6pyku1OG2FqYJTWuUOMnbo+16
 Q/nThruoDKw1GCnyYlZSp+0ZUqDeYHsQab74grDUDbYgAxbPyJ0yl8YxG/9ipeeeGPTB
 81Bg==
X-Gm-Message-State: AHQUAubQ/xekBD6aAQcL49pa/vCFUdinCdtlxS8nQgu+aisPkrduPPsA
 xOoMT+lYSjB/yTtxfdnkN78=
X-Google-Smtp-Source: AHgI3IaVueF8VmEsqoN/K/Yrib5UsIX7rQd4Ra8Xtsj8VB9ChqjWpsdKS6AtXeBOxymak2aKmnkrlA==
X-Received: by 2002:a1c:6657:: with SMTP id a84mr3543182wmc.23.1549469797046; 
 Wed, 06 Feb 2019 08:16:37 -0800 (PST)
Received: from localhost (pD9E51040.dip0.t-ipconnect.de. [217.229.16.64])
 by smtp.gmail.com with ESMTPSA id x22sm6660321wmj.40.2019.02.06.08.16.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Feb 2019 08:16:36 -0800 (PST)
Date: Wed, 6 Feb 2019 17:16:34 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v5 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Message-ID: <20190206161634.GB23805@ulmo>
References: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
 <1548762199-7065-2-git-send-email-yash.shah@sifive.com>
 <20190130081411.5rva7cpwoy2l5qjd@pengutronix.de>
 <CAJ2_jOHiJ3X5VYZMCNk2bpvUdDOsrqHJna3HPvtdNQpJB9fxjg@mail.gmail.com>
 <20190206110730.ogqxncrnblyazgjw@pengutronix.de>
 <20190206124055.GF21676@ulmo>
 <20190206153854.52bqbwf2ty2j7rvj@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20190206153854.52bqbwf2ty2j7rvj@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_081639_382665_6BBBCE34 
X-CRM114-Status: GOOD (  32.96  )
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
Content-Type: multipart/mixed; boundary="===============8166267040330248088=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8166267040330248088==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2019 at 04:38:54PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Wed, Feb 06, 2019 at 01:40:55PM +0100, Thierry Reding wrote:
> > On Wed, Feb 06, 2019 at 12:07:30PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > On Wed, Feb 06, 2019 at 04:18:47PM +0530, Yash Shah wrote:
> > > > On Wed, Jan 30, 2019 at 1:44 PM Uwe Kleine-K=C3=B6nig
> > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > >
> > > > > On Tue, Jan 29, 2019 at 05:13:18PM +0530, Yash Shah wrote:
> > > > > > DT documentation for PWM controller added.
> > > > > >
> > > > > > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> > > > > > [Atish: Compatible string update]
> > > > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > > > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/pwm/pwm-sifive.txt         | 33 ++++++=
++++++++++++++++
> > > > > >  1 file changed, 33 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-s=
ifive.txt
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.t=
xt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > > > > > new file mode 100644
> > > > > > index 0000000..8dcb40d
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > > > > > @@ -0,0 +1,33 @@
> > > > > > +SiFive PWM controller
> > > > > > +
> > > > > > +Unlike most other PWM controllers, the SiFive PWM controller c=
urrently only
> > > > > > +supports one period for all channels in the PWM. This is set g=
lobally in DTS.
> > > > >
> > > > > You can simply drop this if the first user can set this using the=
 usual
> > > > > interface. Don't you like this suggestion that I already made a f=
ew
> > > > > times now?
> > > > >
> > > > > Did you consider to make the driver support only a single output =
with a
> > > > > more flexible period setting?
> > > >=20
> > > > We cannot consider supporting only single output since we have boar=
ds that
> > > > use the additional PWM channels to control individual LED brightness
> > > > of a tri-color LED.
> > > > If we go down to one channel, then we can't control the brightness =
of
> > > > the individual LEDs.
> > > > It will break the use case.
> > >=20
> > > OK.
> > >=20
> > > > I am considering the below approach, let me know if it's fine by yo=
u.
> > > >=20
> > > > - Drop the global period property and allow the only first user to =
change period
> > > > using the usual interface.
> > > > - A note in the binding that all PWMs need to run at the same
> > > > period. If the driver already refuses to apply incompatible periods,
> > > > the users are going to notice that they've got the DT wrong.
> > > > - In driver code, count the users using the .request and .free call=
backs.
> > > > Based on this, allow changes to period iff the user count is one.
> > >=20
> > > Not sure you need to point this limitation in the binding doc. Other
> > > than that this is fine.
> >=20
> > I think it's useful to point this out in the binding documentation since
> > it's something that device tree writers will want to know.
>=20
> OK, we're talking about an FPGA implementation but I still think if the
> dt-author is the first to know about this limitation this is too late.
> The hardware designer must know about that, and they don't look into the
> bindind documentation. The binding documentation should IMHO only
> describe the binding and functional limitiations of the device are out
> of scope.
>=20
> The binding for the Freescale network interface doesn't describe that it
> only supports 480 MBit/s in its GHz mode, and that's good. The binding
> for i2c devices doesn't describe that a reboot in the middle of a
> transfer might block the bus.
>=20
> The target for the binding documentation is to document how a given
> device is described in a device tree. It's not there to duplicate
> information that belongs in the reference manual.

But the device tree bindings for PWM devices describe where and how to
describe the period for each PWM that you reference. That's entirely
different from the examples that you give above.

The generic PWM documentation implies that the period can be set per PWM
channel, so explicitly pointing out in the bindings for a specific
controller that this is *not* the case is a good thing.

And really, it's not like we're quoting pages and pages from technical
reference documentation. This is just a single sentence in a very short
document. Surely that's not going to hurt anyone.

Thierry

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxbCF8ACgkQ3SOs138+
s6EnRg/8DZPAgCNvPVS/a+jRlwqJhv9aVhz9u6XHyfVdbR/jHxlSqN6wOZMtA4H4
YRfV7z5sUgeHCLhE2/UJ8Tem5/Yl5z70+AaisEtl8jpdlKoyjFBd1CFI56rzV8KU
y41I72cvxyJaYJD3SsXKC08uSxJM6LI2k+69PR1grnl2p986E/jnl1SVtf3SdvqL
SZkUv6LeJso7xDQ0s3b2IR/EWBbf1gswgAMqF91Va3N4v3Zj6wdbEAEZ39BWeRG8
Ppsosf3ZT7MhJmNbH5HJVE25byLtQlSYmvZtWx8kgebtHeMXc+9y0KxvLJ2nXM9a
xohh9kQ7/oLpHWx5UeIaJjdDBTrhHqH+dhGqM4sLmc86uhn/QYu7PQfIJLhBRK7O
FsqLgLIG9lA1cx53ejwOHhJXRTpnknBGxBKSxcEXY/7o01SWql6ZmdjSV5rzR8UQ
eGCtKlxXzLu9IoIA/udKhB6PPaYZ2LFnQ+3Baxu4ClWqfbQifQbOfubs2+gxFcXw
pTVi67+UayYYDYPMd7opYBn0qrl8+PZnnacjEE1tvODxvrUBqma6UNlmes8AwO/b
n92XlnWNb5gcBBDUTO3Sgic9w1Z4B2rvVNvsjVy0AEe9IBecM2Xo/YI8nZdXoNPT
QZ0byEZtoIanOp3dQ7TuTxmp+w+HFtRjrlg496U5K4ZyQ3L5qFY=
=nSuJ
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--


--===============8166267040330248088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8166267040330248088==--

