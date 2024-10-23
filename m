Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52C0CFA45F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 19:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohgCX7YF7HjKY/v2pdIuyShnZhE8amqJz9N7ctpVsEg=; b=0jzuqhKeSUOaMY2zeUvkduA+kK
	o1ebYOzqvUKWu9AW/2H0pwVhRbKIJXCQ2q84HqyHMDr6TDTAMLJCV3QEDzujUD293Ls7pK98u0Fm1
	3tOmkOEHiW7ESodntdrluLEF6s12kPGUnz7PHbkZnsbPq4woxuViXPu8Pjsg0JIibWvTWb4JGrvq7
	FC3Q0pcgPFA29cmRDFVzrgto7AT2jm8XCi9uTeNEq/7FxBYTgt93VSUnwoMntWqmvfywHu6uOfGmd
	1/U0H+a78kn8OyKBb9XYkvqZjO7ktyMGO9rid2ME9p4xdQTZ9JTSyt1Q3CXTx8QZX2ILPbx3qRAf8
	jBRWxtDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3h0q-0000000FgbN-11Gy;
	Wed, 23 Oct 2024 19:27:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gUb-0000000FbFv-08ff
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 18:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9FF89A4444E;
	Wed, 23 Oct 2024 18:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFF3C4CEC6;
	Wed, 23 Oct 2024 18:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729709639;
	bh=5Pt3SczTg9tl+y/wXVlx0w43lG1EclvLYHV4haFhs1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNzG/EMybBKcPcmF6JfUU7O4/pzCGNTc3FbY2AIPk/pV3i5r0q014C7hxyUIa7Swe
	 83cLVQ0Qm/Tv5icgh/xnE2rzGVXkpsvBSE0fPRJPGGlJiGl1djU8uXU30T/SzwX0J2
	 6A0ovwGz6FhgUiKLeHO0bT4wBfESzEOjUurXDFdtjLOac66fE6s+OvAHffCi9JxaX+
	 7wPAyPlOi7fdRt0GQjzZbFfA4LhTBUdTv1QSUWP7hpxi50iE2uMClB+4lSxmPQopUp
	 fIJkkTLJPSRN7s3oaMTBVdgdZ2+oHWdRcivGEi7L6QmHoB5ntutdiButfQ6XdtYZ1d
	 gYPoS2hBUFyoQ==
Date: Wed, 23 Oct 2024 19:53:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: snps-dw-apb-uart: Add Sophgo
 SG2044 uarts
Message-ID: <20241023-backroom-pending-279f9d12e9d8@spud>
References: <20241021072606.585878-1-inochiama@gmail.com>
 <20241021072606.585878-2-inochiama@gmail.com>
 <20241021-outlying-washday-8f171dedc703@spud>
 <r5ngs2j776jcy6sfirwzmtsoljotatfvgmlmv4sj4xksye2bff@xtn7adafbpfz>
 <20241021-rosy-drove-1ae3c8985405@spud>
 <2zawe64brm3sfuslh443352wfupgnhb4xw7jragkzxu6kgg6t7@b4qiya3jdij4>
 <20241022-washday-glass-3db9f6a2cd27@spud>
 <e32xi34m4lubrquluk7uu6nvqgarnxtmj57ricxg2gv45xpgcs@x6t7itvwng4h>
MIME-Version: 1.0
In-Reply-To: <e32xi34m4lubrquluk7uu6nvqgarnxtmj57ricxg2gv45xpgcs@x6t7itvwng4h>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_115401_408553_8D5CD66A 
X-CRM114-Status: GOOD (  30.63  )
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
Content-Type: multipart/mixed; boundary="===============1941628706095645498=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1941628706095645498==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+Tk608JwS4IXNVJ/"
Content-Disposition: inline


--+Tk608JwS4IXNVJ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 08:32:42AM +0800, Inochi Amaoto wrote:
> On Tue, Oct 22, 2024 at 06:25:00PM +0100, Conor Dooley wrote:
> > On Mon, Oct 21, 2024 at 08:23:30PM +0800, Inochi Amaoto wrote:
> > > On Mon, Oct 21, 2024 at 01:21:58PM +0100, Conor Dooley wrote:
> > > > On Mon, Oct 21, 2024 at 08:18:58PM +0800, Inochi Amaoto wrote:
> > > > > On Mon, Oct 21, 2024 at 01:10:52PM +0100, Conor Dooley wrote:
> > > > > > On Mon, Oct 21, 2024 at 03:26:05PM +0800, Inochi Amaoto wrote:
> > > > > > > The UART of SG2044 is modified version of the standard Synops=
ys
> > > > > > > DesignWare UART. The UART on SG2044 relys on the internal div=
isor
> > > > > > > and can not set right clock rate for the common bitrates.
> > > > > > >=20
> > > > > > > Add compatibles string for the Sophgo SG2044 uarts.
> > > > > > >=20
> > > > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > > > ---
> > > > > > >  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml        =
  | 4 ++++
> > > > > > >  1 file changed, 4 insertions(+)
> > > > > > >=20
> > > > > > > diff --git a/Documentation/devicetree/bindings/serial/snps-dw=
-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.=
yaml
> > > > > > > index 4cdb0dcaccf3..6963f89a1848 100644
> > > > > > > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-ua=
rt.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-ua=
rt.yaml
> > > > > > > @@ -58,6 +58,10 @@ properties:
> > > > > > >                - brcm,bcm11351-dw-apb-uart
> > > > > > >                - brcm,bcm21664-dw-apb-uart
> > > > > > >            - const: snps,dw-apb-uart
> > > > > > > +      - items:
> > > > > > > +          - enum:
> > > > > > > +              - sophgo,sg2044-uart
> > > > > > > +          - const: snps,dw-apb-uart
> > > > > >=20
> > > > > > Why does each vendor have an items entry of its own? Seems like=
 needless
> > > > > > clutter of the file IMO, except for the renesas bit.
> > > > >=20
> > > > > I just follow others when writing this binding. I think it may ne=
ed
> > > > > another patch to fix this problem, right?
> > > >=20
> > > > Yeah. But I'd hold off to see if someone gives a rationale for it b=
eing
> > > > done this way before sending that. I've not deleted this thread, and
> > > > will send an ack if someone justifies why the binding is written li=
ke
> > > > this.
> >=20
> > Well, Rob doesn't think they should be separate so please add that
> > additional patch in your next version.
> >=20
> > Thanks,
> > Conor.
>=20
> It is OK for me. I will add a fix patch in the next version. Can
> I add you with suggested-by tag in this fix patch?

If you want, but I don't really care for one.

--+Tk608JwS4IXNVJ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxlGQQAKCRB4tDGHoIJi
0lWCAQDLqp4C3pRf90+AdSgA9vyQTtFUkYtMqLHF8L01+nyJ2QD/cvLql7LjVd04
9Mv7I4joqV3H0Gvfo2rKjnJsSHJcfQw=
=SV4x
-----END PGP SIGNATURE-----

--+Tk608JwS4IXNVJ/--


--===============1941628706095645498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1941628706095645498==--

