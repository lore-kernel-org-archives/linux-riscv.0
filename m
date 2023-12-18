Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E47C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 16:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJQqQLXAvDN5+YRKzwkMwel2+DlPIId7Erd5faTiUBE=; b=r9tUfmtlOnLt28Mf9+Schb9qPS
	Tx5RlKO3Ihlz0VJGjmS9KeMeOaeQvM5Q+aUJVTXhkNX8u/vzyB0ej/OGvIP2YidFr45X9j08a/L19
	S4HHRdDaYHIDc5VbaQGjqHSnnNNXzQvv0Y2ge1hXwzZ56grKjT7rdJW24N1w+gXH3DCQpz0W3uXfm
	OF2vM0fBmVOunlwm3j7Zw2IDyOX7Yr3uDbf4mpOG+WG93MNlpAaP3lXkfmayHFfKpuI9ffmyIjDK8
	PooWCslW1k9LrXg+BEEP75lXKjgFGpVG6iQjSOcKLnmMBSqu5JActvjw5ofgA5Zm0m/28ucSrzOIY
	SgU01elA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFGM0-00BQGd-1m;
	Mon, 18 Dec 2023 16:20:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFGLx-00BQFC-06;
	Mon, 18 Dec 2023 16:20:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A1498B8100B;
	Mon, 18 Dec 2023 16:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F76C433C8;
	Mon, 18 Dec 2023 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702916423;
	bh=1TJ6z/2n5yA1zKpBSS1FKvSKJzOxpKY5yqQW1tlh3co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ql8mNLtJYBvIiyP75UozTFORi+cRvJHqYZbr7sAFqi66/8aSUlHiXNL51rrGy2dok
	 8doZaNXnZHhNtVjjZzV6nyiJOmMQ1/cEHLxQOtHLn3tiKLyoXVbDSiyqQdEpvWrb5V
	 TkIGqehOMGrXN0733jM7IzJtmC2Pbdo//TwYiDCY4nfGhBApRE9yEQxRtK+kRYOmhY
	 5dtMfc5y6VIIUx+oszI1dYeATjexh3TeWf8dkME8TnJqMj/1sXCIRI0ZS9oA7T1esq
	 xJKoCOmZkWNvuujL5cjgQ/7nvNs7fsb7X6RmlJurC7hAwem/sQmRLEc0IwcPWoG42E
	 LkDgspBOMPyLQ==
Date: Mon, 18 Dec 2023 16:20:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/5] dt-bindings: opp: sun50i: Add binding for D1 CPUs
Message-ID: <20231218-unsavory-private-50e5b52c632f@spud>
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
 <20231218110543.64044-3-fusibrandon13@gmail.com>
 <20231218-disprove-judgingly-ee54d39474a7@spud>
MIME-Version: 1.0
In-Reply-To: <20231218-disprove-judgingly-ee54d39474a7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_082025_243430_6C907BB5 
X-CRM114-Status: GOOD (  17.13  )
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
Content-Type: multipart/mixed; boundary="===============0924018972904808453=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0924018972904808453==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PwKTfaebQ6MCV6JT"
Content-Disposition: inline


--PwKTfaebQ6MCV6JT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 02:54:35PM +0000, Conor Dooley wrote:
> On Mon, Dec 18, 2023 at 12:05:40PM +0100, Brandon Cheo Fusi wrote:
> > Add binding for D1 CPU OPPs.
> >=20
> > Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > ---
> >  .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml    | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-=
operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun=
50i-h6-operating-points.yaml
> > index 51f62c3ae..fddaa3216 100644
> > --- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operati=
ng-points.yaml
> > +++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operati=
ng-points.yaml
> > @@ -23,7 +23,9 @@ allOf:
> > =20
> >  properties:
> >    compatible:
> > -    const: allwinner,sun50i-h6-operating-points
> > +    enum:
> > +      - allwinner,sun50i-h6-operating-points
> > +      - allwinner,sun20i-d1-operating-points
>=20
> This doesn't match what you have in your devicetree.

Per Samuel's comments in
<aad8302d-a015-44ee-ad11-1a4c6e00074c@sholland.org>
it looks like this binding is correct but the devicetree is wrong.

Thanks,
Conor.

--PwKTfaebQ6MCV6JT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYBxQAAKCRB4tDGHoIJi
0vHVAP0ZNkABGZhaykdtLfenWxGy/DxKf2+/30Xy3k645aMFswD+P5h11MvaPRsk
hQWx46DLx9lxxmCqqlWZxNdXTrfSUA0=
=W9Bc
-----END PGP SIGNATURE-----

--PwKTfaebQ6MCV6JT--


--===============0924018972904808453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0924018972904808453==--

