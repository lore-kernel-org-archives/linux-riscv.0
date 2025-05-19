Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB4AC2D0CD
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 12:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIWzQpc39SkDbR7fg2EreKZIOKBjZlga9oovF6Voksk=; b=eO22bgkVknwXVHFYuaGxQdS/1j
	tUp6aIybxL/ArN+d1r9NCf3zIH1o+ZcZHHDXKXtmHybpy5SfGSxeVAgROBOr5Cm5q+uODc7vIzG1C
	1XWMT0Go9OOn7OHV5k0p+7kegtu+KJUqXwarcr5npg1NfumM9+nnPkQgPcA/OKGCB05+fh11/6v3o
	NblXx8IsVL/2epKNn/epvViFkf071pE2IQcTrKnPqFiAUkCs/wEHa62tIEtDA2AqIQ7ubXDUVz2oU
	oMr2iDPAnjdAzbI24tQlcRjE+gJO7HfXnslfDDQiJN88VXdS7G0e/U8Pca3/fVAbrIr48IL2zVDlt
	M4iLExzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzFo-000000095hJ-2igB;
	Mon, 19 May 2025 12:06:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzBt-0000000959w-0qNx
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 12:01:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 697D543810;
	Mon, 19 May 2025 12:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACF1C4CEE9;
	Mon, 19 May 2025 12:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747656116;
	bh=Zf9gz2Q4q1qJ6K136JlNwatN69nhNVbGzKy8s8ubJ+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzlAp7kzkoeCPmb5UunEHlWgmAl6Q6kbrRzx4rW7AoTfmckiFONvJq29T9drSlON3
	 0WTijnMEjM1LxWh1MJ44JOmw/AXLRzUlRgFCnnbHP6m7yRtJ5uA1ripR22NSvNB32r
	 kQYSTDTBa/fEC2p2ucqCtrtoAIS3bBAI+ESwcnaGqho5wBp0a7ZAzceHbP86hbsSY4
	 k81oLtVguNRmvh1Caq0PNj5V++HjyH59/IC98Gx97Tw1mK/MVG/IyXU0/5pJsPLVBV
	 BDFHQ/+Xh7csYJSI92XW2xtTnditMy/PgO5HTb6vo8NGS+RYH0Yz7XE+64KhtcUlGO
	 yV+mxK1yLpdaw==
Date: Mon, 19 May 2025 13:01:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X
 bindings
Message-ID: <20250519-geek-slept-8cae4fc6d548@spud>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
 <b538e2b24eab8b740091d80ca76b20ef6014a4e5.1747231254.git.rabenda.cn@gmail.com>
 <20250514-showplace-yahoo-e3c306355288@spud>
 <CAAT7Ki9Fw0+Ntv+oFqr2R=EHnFZrT6KmyTPN2MCDDGvSn-Wi8A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAT7Ki9Fw0+Ntv+oFqr2R=EHnFZrT6KmyTPN2MCDDGvSn-Wi8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_050157_269670_08F1A635 
X-CRM114-Status: GOOD (  16.56  )
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
Content-Type: multipart/mixed; boundary="===============8299655861182418343=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8299655861182418343==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p3QpKvf7RfTC567z"
Content-Disposition: inline


--p3QpKvf7RfTC567z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 01:11:46AM +0800, Han Gao wrote:
> On Thu, May 15, 2025 at 12:22=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Wed, May 14, 2025 at 10:08:59PM +0800, Han Gao wrote:
> > > Add DT binding documentation for the Sophgo SG2042_EVB_V1.X board [1].
> >
> > 1.x? Is the v1.0 something people can get their hands on, or just the
> > v1.1?
> > What differences do the boards have that are minimal enough that
> > specific compatibles would not be required?
> >
>=20
> First of all, v1.1 and v1.0 are compatible boards.
> There is no difference between v1.1 and v1.0 from dts.
>=20
> Both v1.1 and v1.0 have been discontinued.
> About 80 pieces of v1.1 are in the hands of community developers.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--p3QpKvf7RfTC567z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCsdrgAKCRB4tDGHoIJi
0kd5AQCYs1Sq3GD4kaz3DoAtIrt6+FU4CPdjvAtv8vhTf1N5uwD9FTZzafSC58rf
8spnL07wKGQMM9LFZN9yxZ8RvCxKagU=
=ZRoH
-----END PGP SIGNATURE-----

--p3QpKvf7RfTC567z--


--===============8299655861182418343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8299655861182418343==--

