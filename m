Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B41ED2CE0D
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 17:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPE+qEUiL3Up9bEMcXbY/Aop4tk+YFZ/+vMebLP6Ah0=; b=vyjvCUo0jhPA0R6bx3JS+AR0g5
	RuCZLOZGEdAQtTRl4qjQxgBW2agvINqR/3Syw71tmT4HSzj/E7QtJyfyS+AgGe/6c1iCADCWJIATI
	zA4kiBk/1Bf9/KlqcZww7GCnXx+hjjXAsC5Aw+mEwXtlPtbtWMxWHkRQj5nvTmhbMqacrWalkQLux
	aA/EJxH5IHEd1O71lAbeNb+rS12o2VZzhoe4/Sfh806ACu4BMid2ynyyWJhCyfw+NrLkfP8A5UAnr
	kQqE/D5DcZX0bkP7/DoZ9AFqLQ61MaT5HGGzce9S7ibuZfVdW3FxmIDxSNyJ/1M4MYLuWhiqxLj0V
	0sJCFzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Iv2-0000000BhJC-363t;
	Tue, 22 Oct 2024 17:43:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Id1-0000000Bdjb-3osO
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 17:25:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99EFE5C3F87;
	Tue, 22 Oct 2024 17:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE3DC4CEC7;
	Tue, 22 Oct 2024 17:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729617906;
	bh=J2g2Yu6XyCY4XxVZm/Amweebvid8FNKBJjTzHEntF58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JeQzAJXGWXioB0cHPEFbrENDMSeYJUT03aeULihkKQElFB6xnYz1EOYWyKa6WrQpk
	 WNcCZKfWABw93ZSg7IRsJpU/cxYxfyA+Am4Lt+EDh7vTPeW9TQa7uMiLYwJg9uVP3A
	 2D2RsgFnaxZYsmTRxWgxNtJrltZx+CcTzkqtw+pt+oWPKdeFCrSQ7jrZmT4BkSupLw
	 zgZ3pXZ2yoth+v6ThAGGnx8SSKEXF1ml2kgN7enbFdh/hEt1nTQzT80Db9/xa60aOR
	 PAasYmEBq13zODGSBBg3njNkaCJt1uECwCLgzCl7ulobqiqR/jLlMP3ZNkwHSyVO9Q
	 NZ3EDGtCdhAqA==
Date: Tue, 22 Oct 2024 18:25:00 +0100
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
Message-ID: <20241022-washday-glass-3db9f6a2cd27@spud>
References: <20241021072606.585878-1-inochiama@gmail.com>
 <20241021072606.585878-2-inochiama@gmail.com>
 <20241021-outlying-washday-8f171dedc703@spud>
 <r5ngs2j776jcy6sfirwzmtsoljotatfvgmlmv4sj4xksye2bff@xtn7adafbpfz>
 <20241021-rosy-drove-1ae3c8985405@spud>
 <2zawe64brm3sfuslh443352wfupgnhb4xw7jragkzxu6kgg6t7@b4qiya3jdij4>
MIME-Version: 1.0
In-Reply-To: <2zawe64brm3sfuslh443352wfupgnhb4xw7jragkzxu6kgg6t7@b4qiya3jdij4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_102508_077214_457D15AF 
X-CRM114-Status: GOOD (  26.53  )
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
Content-Type: multipart/mixed; boundary="===============4477188918340250452=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4477188918340250452==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IG32fQA576T6oNHT"
Content-Disposition: inline


--IG32fQA576T6oNHT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 08:23:30PM +0800, Inochi Amaoto wrote:
> On Mon, Oct 21, 2024 at 01:21:58PM +0100, Conor Dooley wrote:
> > On Mon, Oct 21, 2024 at 08:18:58PM +0800, Inochi Amaoto wrote:
> > > On Mon, Oct 21, 2024 at 01:10:52PM +0100, Conor Dooley wrote:
> > > > On Mon, Oct 21, 2024 at 03:26:05PM +0800, Inochi Amaoto wrote:
> > > > > The UART of SG2044 is modified version of the standard Synopsys
> > > > > DesignWare UART. The UART on SG2044 relys on the internal divisor
> > > > > and can not set right clock rate for the common bitrates.
> > > > >=20
> > > > > Add compatibles string for the Sophgo SG2044 uarts.
> > > > >=20
> > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > ---
> > > > >  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | =
4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb=
-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > > > > index 4cdb0dcaccf3..6963f89a1848 100644
> > > > > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.y=
aml
> > > > > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.y=
aml
> > > > > @@ -58,6 +58,10 @@ properties:
> > > > >                - brcm,bcm11351-dw-apb-uart
> > > > >                - brcm,bcm21664-dw-apb-uart
> > > > >            - const: snps,dw-apb-uart
> > > > > +      - items:
> > > > > +          - enum:
> > > > > +              - sophgo,sg2044-uart
> > > > > +          - const: snps,dw-apb-uart
> > > >=20
> > > > Why does each vendor have an items entry of its own? Seems like nee=
dless
> > > > clutter of the file IMO, except for the renesas bit.
> > >=20
> > > I just follow others when writing this binding. I think it may need
> > > another patch to fix this problem, right?
> >=20
> > Yeah. But I'd hold off to see if someone gives a rationale for it being
> > done this way before sending that. I've not deleted this thread, and
> > will send an ack if someone justifies why the binding is written like
> > this.

Well, Rob doesn't think they should be separate so please add that
additional patch in your next version.

Thanks,
Conor.

--IG32fQA576T6oNHT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxff7AAKCRB4tDGHoIJi
0tUyAP4uTBvEkU56jMMlkmGFlti+ugxYK6+lqTVuXMm0srEjLwEA20y1lnrqE8Vh
eeC6n/MJPkUuZNkNk3KAqX3EZkGfQQg=
=blFm
-----END PGP SIGNATURE-----

--IG32fQA576T6oNHT--


--===============4477188918340250452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4477188918340250452==--

