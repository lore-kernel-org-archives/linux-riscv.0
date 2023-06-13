Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F02EB64D0
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 14:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iC53Z9UKBWjJlfLxZcpOfYA3BfI0/OhbrncdgxMs+3g=; b=xmrFIJ14E4fce5ZCCBBg7GD/6V
	eFmjIyERGs85Lq30L60I69P+3KfmOQFFpsVjKLfvdcYa1yTtKayIa7wzzF4Lyou4bM5tRLS5kknYF
	/wh0sKyBFK5gr+PFtdZgfoO5WjGM3bAKpJ7Ct63fS37eifs+AUV1Ruz+gUX0KcbhdjMtE8Zj3tlc7
	nHEPSpWFchsQwdTvFwA90HIqAMb8bRQSOkh+yzcQ0OB2SMYtT8HaOCszkcFsdMYKLyQBMrMIXJ1Zy
	DuGlogGW6PHvriWEM4DETr9LqtgRJaEBuNrjoiLL5ewrTp0IOR3iDM5sdAx3YoAqX2LXhetRQuYJn
	kFFgUmlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q94l3-008HZ6-2F;
	Tue, 13 Jun 2023 14:12:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q94ky-008HX9-24
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 14:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686665545; x=1718201545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hfxBhUgx7NXJ6JdXeA8drLUkBlBlA9y7CgQi6V3xvlI=;
  b=ufikcluv0m4C8tnSN8lMGRYIM2I5PrE+a6N0zqVJhY1+9T8fyEMP6UYp
   7LM6wIOdW7vTxpzq5/xUWwh6dnCLwd6ue68jdLLHh5EgQk1jW9gyz/R3d
   xbDU29VSprxXc0dhG7e7QEGVf8+AqiD4momiFzEnyJnJvQaywOZQ8DIwl
   y6d7kAjGTGVEXcMKMQMCBz9JuB3P1Rwth3wv/ssvnxy9kPZEic178+ejY
   6TypVHe7WjQeI6WYk9U6zIf/nTBRs1ldyLhniqb1vpq10RSj4iLcYUn8C
   3iGNar5iM/CauYxVlnrGOf1CT7tfnxlawVd9wvpRCtZnM/hGQwv/7d+nu
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="asc'?scan'208";a="218264434"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jun 2023 07:12:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 13 Jun 2023 07:12:16 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 13 Jun 2023 07:12:13 -0700
Date: Tue, 13 Jun 2023 15:11:47 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Sean Anderson <sean.anderson@seco.com>,
	Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>,
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alistair Francis
	<alistair.francis@wdc.com>, Anup Patel <apatel@ventanamicro.com>, Atish Patra
	<atishp@atishpatra.org>, Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen
	<rick@andestech.com>, Leo <ycliang@andestech.com>,
	<linux-riscv@lists.infradead.org>, <qemu-riscv@nongnu.org>,
	<u-boot@lists.denx.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230613-outbound-exchange-cf48ad61d31c@wendy>
References: <20230518-4050231ca8dbe93c08cf9c9a@orel>
 <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
 <20230518-hammock-doornail-478e8ea8e6a7@wendy>
 <f7c20090-220c-2805-86ba-b174a89f65b3@seco.com>
 <20230518-monkhood-dispersal-6749b1228b0d@spud>
 <20230530-duller-reset-a34ae111f207@wendy>
 <20230608191537.GA3233857-robh@kernel.org>
 <20230608-cobbler-giving-e0fac2185e11@spud>
 <20230612-relic-fetal-1beeae3455aa@spud>
 <CAL_Jsq+CJ-mEcEujd5Sk4SLvgTfUX1A7NRXYcMDqkoViDYxTXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+CJ-mEcEujd5Sk4SLvgTfUX1A7NRXYcMDqkoViDYxTXw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_071224_805042_3E911141 
X-CRM114-Status: GOOD (  19.22  )
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
Content-Type: multipart/mixed; boundary="===============8800723012729343108=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8800723012729343108==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X3sgJjRgCn4CtUIw"
Content-Disposition: inline

--X3sgJjRgCn4CtUIw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 07:28:34AM -0600, Rob Herring wrote:
> On Mon, Jun 12, 2023 at 3:23=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Thu, Jun 08, 2023 at 08:30:28PM +0100, Conor Dooley wrote:
> > > On Thu, Jun 08, 2023 at 01:15:37PM -0600, Rob Herring wrote:
> > > > On Tue, May 30, 2023 at 03:12:12PM +0100, Conor Dooley wrote:
> > > > > On Thu, May 18, 2023 at 10:42:34PM +0100, Conor Dooley wrote:
> > > > > > On Thu, May 18, 2023 at 02:30:53PM -0400, Sean Anderson wrote:
> > > > >
> > > > > > >
> > > > > > > Why not just have something like
> > > > > > >
> > > > > > > mycpu {
> > > > > > >       ...
> > > > > > >       riscv,isa {
> > > > > > >               i;
> > > > > > >               m;
> > > > > > >               a;
> > > > > > >               zicsr;
> > > > > > >               ...
> > > >
> > > > I prefer property names be globally unique. The tools are geared to=
wards
> > > > that too. That's largely a symptom of having 0 type information in =
the
> > > > DT.
> > > >
> > > > For example if you had an extension called 'reg', it would be a pro=
blem.
> > >
> > > Per the current ISA rules, that'd not be valid. But then again, I do
> > > have trust issues & it's not like "reg" is the only property name in =
DT
> > > land.
> >
> > ...you say "prefer" here. Is that a NAK, or a "you keep the pieces"?
>=20
> Don't do the above node.

Yeah, that's more helpful wording than "prefer" for sure!

If that's a no-go & so are the booleans prefixed with "riscv,whatever-",
since people have size concerns, I guess that leaves your string
suggestion (there is a helper in Linux at least, haven't checked
elsewhere yet).

I guess that means something like:

  riscv,isa-extensions:
    $ref: /schemas/types.yaml#/definitions/string-array
    minItems: 1
    description: Extensions supported by the hart.
    items:
      anyOf:
        - const: i
          description: foo
        - const: m
          description: foo
        - const: a
          description: foo
        - const: f
          description: foo
        - const: d
          description: foo
        - const: c
          description: foo
        - const: zifencei
          description: foo
        - etc

Obviously with "foo" replaced by the existing descriptions in this
patch.


--X3sgJjRgCn4CtUIw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIh5IwAKCRB4tDGHoIJi
0qHeAP4vJ0QRi7YJAoUUY9FMywRtOb4MKioKJLodiR5tQ3sA3gEA/oOKmdPiwKIP
32NtYdVYP78YjeI+omupwDOZZfgQEQw=
=td6r
-----END PGP SIGNATURE-----

--X3sgJjRgCn4CtUIw--


--===============8800723012729343108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8800723012729343108==--

