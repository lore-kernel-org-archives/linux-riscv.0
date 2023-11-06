Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BD4C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0hZ4aTZaHiDmfu3YkidxGiAdZ3qopCi5ONjda6VCLs=; b=EtAWVZqZjjZr9c28XBBd6xl56j
	ZUwQuVxAF5ZWTTqq1cdrPWeswKyGOgUspVag/YObu6K8mgKY5loxXcCjIatj13jl/e3sNhB1G1v5c
	E4K9YbrMk5QGRytB6uLrK//dhCErcH+XpnAF34m1M5FecvUh4TCm/YOxUqSmoH08Q7RTCS0YNiAjN
	q8K0xWFT5D5ske3moEWN4S5Rn36SLAFre4JFUD57UpzYThYsGtRdSuHGNpyEan7BVXVGQRK8kHqp1
	M3i9uThNJqgS8+iAiKO27QgtHQ1U8NoG7wb63PreYU4DwI36SbLDEdVIfj+ovHsUGn0doeOgIKKoh
	u+cwhNog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r01lX-00H0xc-38;
	Mon, 06 Nov 2023 15:43:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r01lV-00H0wI-1Y
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 15:43:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r01lE-0006yR-Qo; Mon, 06 Nov 2023 16:43:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r01lE-0074oJ-7b; Mon, 06 Nov 2023 16:43:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r01lD-00DmxG-UN; Mon, 06 Nov 2023 16:43:31 +0100
Date: Mon, 6 Nov 2023 16:43:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/2] pwm: add driver for T-THEAD TH1520 SoC
Message-ID: <20231106154331.yonhekamzrhl4jct@pengutronix.de>
References: <20231005130519.3864-1-jszhang@kernel.org>
 <ZUj8/fhitNf8fRMf@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZUj8/fhitNf8fRMf@xhacker>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_074349_515047_E6CDFBB1 
X-CRM114-Status: GOOD (  13.50  )
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
Content-Type: multipart/mixed; boundary="===============7637680607577492469=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7637680607577492469==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jsf3f7vbz6to4kdv"
Content-Disposition: inline


--jsf3f7vbz6to4kdv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 06, 2023 at 10:49:33PM +0800, Jisheng Zhang wrote:
> Kind ping, is there any chance for this series to be merged for v6.7?

I didn't forget about reviewing your driver, but as such a review takes
quite some time I often fail to do the review in a timely manner. Sorry
about that.

Having said that I guess Thierry's tree won't pick up any new patches
given that we already crossed the middle of the merge window and patches
are supposed to be in next for some time before being sent to Linus.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jsf3f7vbz6to4kdv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVJCaIACgkQj4D7WH0S
/k4QCAf/acNnr3Gu4/8Kw26Tso95OH5ZRC6qvEoB9lCUTWMCS92Q96p+w12Y7cpU
FwP+u2j1ZU75B9rU9/ghwcMSpeBkm0EvcVhxFJCcRfQCfqhNb4ZZosZs+xyNnEzC
dCIdbtRKzpejhd/rrzN9h9RrS9XrxO0rqp1Bx0zuQIz1S+SXmeQlBIXBrt8lJTSQ
XGLco64DSob6ydIuTMXMy4hsk7v5bp/2NaXoPKR2TusZ0PRjQ9uqPbtlkDHOKyh6
OvbK3CTWZTxLGQPtrUhuY0FwA5kbyMj/f0CzFLySXVzR8W+Pocnu5W7cSaMFqoBH
25rzVqBG6j12xDq3k0JwXL+jDoepLg==
=G7ji
-----END PGP SIGNATURE-----

--jsf3f7vbz6to4kdv--


--===============7637680607577492469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7637680607577492469==--

