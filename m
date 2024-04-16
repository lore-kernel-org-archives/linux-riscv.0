Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D8FC04FF6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 07:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeHVYv9sTsIs2DhslpDd3Terzuov4OC9r+IpWAWMllY=; b=D5HP7g4mlqhte1odt6Y/kmo5oG
	EhXJv06kvCKjvoJzPUWcXYZWoyAJSZxauk2xBH9K6s9oC6O8w3GpU2xnOvPOuGfhKjFIuCYmF6zoT
	f37cavswTdYoxjO/rYz0VdXX2vplUIMZC4uOow9dEPINduWCEzfT7r+Yws7nxUxsVlx9TuJ239I4L
	+Z1c8X2pvxEoSVVdwJWJDGrdtfHYh+yfSEnk0LB+EmnpBDJmq6ozMyR3Bj2Ol7mJ1xuhfH3zK9IyR
	uO6EJ21+RQJxfPdun9gBWRpKOIKkMmXYeAuJIc85V256b3FM1hNX1mbbRJmwmkEf/jf+MuSjBOauX
	hxxEnJ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdOZ-0000000BIwK-1qpf;
	Tue, 16 Apr 2024 07:38:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdOQ-0000000BItL-2lrD;
	Tue, 16 Apr 2024 07:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1713253094; x=1744789094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x5lugkkuTzZRflrDEuf9ADF8MPGbuJ8c7gc3ccW/M98=;
  b=0D+LgkukX/ETlgoQP/a3Abq0sdrAlBijxykIwuoAl0W4sCgfylr6D1OE
   KSSjDs8RYmA8dDPz4RzGraMM9it+zDi1rCbn68I+/VMVsOTS7m2VdxWp1
   xPO0m+CKEJ3pfLYaxg4ZUMBprOR3qLjnMNTR7+1N7+oXGsS7N2drOTUQE
   slOQDAs0SFRMS6HjfJfuz8PvzUVeK5fiemp857+rFvs5+e4Y8ppOExUG+
   iCgbnAiBsOOowhuMATyjfeCTGiL1flrptiULjQdEoJS6fwN6hVYI4W5R5
   ey6xl6a2yxmslb3W5qmOKv4SWKYnT+UIABJ5y1P3/aZvH3k5gGpanfYAu
   Q==;
X-CSE-ConnectionGUID: 61Rrqh/nSVOeoxSPEgjDLA==
X-CSE-MsgGUID: Y9MCszL3RR+vu36uIQGM/A==
X-IronPort-AV: E=Sophos;i="6.07,205,1708412400"; 
   d="asc'?scan'208";a="21182016"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Apr 2024 00:38:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 00:37:29 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 16 Apr 2024 00:37:25 -0700
Date: Tue, 16 Apr 2024 08:36:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Evan Green
	<evan@rivosinc.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?=
	<cleger@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<shuah@kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Palmer Dabbelt
	<palmer@rivosinc.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <20240416-husband-flavored-96c1dad58b6e@wendy>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
 <20240412-tuesday-resident-d9d07e75463c@wendy>
 <ZhlrdGXfSushUNTp@ghost>
 <20240412-eastcoast-disparity-9c9e7d178df5@spud>
 <ZhmeLoPS+tsfqv1T@ghost>
 <20240412-chemist-haunt-0a30a8f280ca@spud>
 <ZhmoPuoR00aS6qZp@ghost>
 <20240413-sharper-unlivable-5a65660b19e2@spud>
 <Zh3xrTfjjk3b4GHb@ghost>
MIME-Version: 1.0
In-Reply-To: <Zh3xrTfjjk3b4GHb@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_003814_875239_29F5E3F8 
X-CRM114-Status: GOOD (  49.24  )
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
Content-Type: multipart/mixed; boundary="===============8580003495912143749=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8580003495912143749==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S0aAJ0pL4KXiXwbM"
Content-Disposition: inline

--S0aAJ0pL4KXiXwbM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 08:34:05PM -0700, Charlie Jenkins wrote:
> On Sat, Apr 13, 2024 at 12:40:26AM +0100, Conor Dooley wrote:
> > On Fri, Apr 12, 2024 at 02:31:42PM -0700, Charlie Jenkins wrote:
> > > On Fri, Apr 12, 2024 at 10:27:47PM +0100, Conor Dooley wrote:
> > > > On Fri, Apr 12, 2024 at 01:48:46PM -0700, Charlie Jenkins wrote:
> > > > > On Fri, Apr 12, 2024 at 07:47:48PM +0100, Conor Dooley wrote:
> > > > > > On Fri, Apr 12, 2024 at 10:12:20AM -0700, Charlie Jenkins wrote:
> >=20
> > > > > > > This is already falling back on the boot CPU, but that is not=
 a solution
> > > > > > > that scales. Even though all systems currently have homogenous
> > > > > > > marchid/mvendorid I am hesitant to assert that all systems are
> > > > > > > homogenous without providing an option to override this.
> > > > > >=20
> > > > > > There are already is an option. Use the non-deprecated property=
 in your
> > > > > > new system for describing what extesions you support. We don't =
need to
> > > > > > add any more properties (for now at least).
> > > > >=20
> > > > > The issue is that it is not possible to know which vendor extensi=
ons are
> > > > > associated with a vendor. That requires a global namespace where =
each
> > > > > extension can be looked up in a table. I have opted to have a
> > > > > vendor-specific namespace so that vendors don't have to worry abo=
ut
> > > > > stepping on other vendor's toes (or the other way around). In ord=
er to
> > > > > support that, the vendorid of the hart needs to be known prior.
> > > >=20
> > > > Nah, I think you're mixing up something like hwprobe and having
> > > > namespaces there with needing namespacing on the devicetree probing=
 side
> > > > too. You don't need any vendor namespacing, it's perfectly fine (IM=
O)
> > > > for a vendor to implement someone else's extension and I think we s=
hould
> > > > allow probing any vendors extension on any CPU.
> > >=20
> > > I am not mixing it up. Sure a vendor can implement somebody else's
> > > extension, they just need to add it to their namespace too.
> >=20
> > I didn't mean that you were mixing up how your implementation worked, my
> > point was that you're mixing up the hwprobe stuff which may need
> > namespacing for $a{b,p}i_reason and probing from DT which does not.
> > I don't think that the kernel should need to be changed at all if
> > someone shows up and implements another vendor's extension - we already
> > have far too many kernel changes required to display support for
> > extensions and I don't welcome potential for more.
>=20
> Yes I understand where you are coming from. We do not want it to require
> very many changes to add an extension. With this framework, there are
> the same number of changes to add a vendor extension as there is to add
> a standard extension.=20

No, it is actually subtly different. Even if the kernel already supports
the extension, it needs to be patched for each vendor

> There is the upfront cost of creating the struct
> for the first vendor extension from a vendor, but after that the
> extension only needs to be added to the associated vendor's file (I am
> extracting this out to a vendor file in the next version). This is also
> a very easy task since the fields from a different vendor can be copied
> and adapted.
>=20
> > Another thing I just thought of was systems where the SoC vendor
> > implements some extension that gets communicated in the ISA string but
> > is not the vendor in mvendorid in their various CPUs. I wouldn't want to
> > see several different entries in structs (or several different hwprobe
> > keys, but that's another story) for this situation because you're only
> > allowing probing what's in the struct matching the vendorid.
>=20
> Since the isa string is a per-hart field, the vendor associated with the
> hart will be used.

I don't know if you just didn't really read what I said or didn't
understand it, but this response doesn't address my comment.
Consider SoC vendor S buys CPUs from vendors A & B and asks both of them
to implement Xsjam. The CPUs are have the vendorid of either A or B,
depending on who made it. This scenario should not result in two
different hwprobe keys nor two different in-kernel riscv_has_vendor_ext()
checks to see if the extension is supported. *If* the extension is vendor
namespaced, it should be to the SoC vendor whose extension it is, not
the individual CPU vendors that implemented it.

Additionally, consider that CPUs from both vendors are in the same SoC
and all CPUs support Xsjam. Linux only supports homogeneous extensions
so we should be able to detect that all CPUs support the extension and
use it in a driver etc, but that's either not going to work (or be
difficult to orchestrate) with different mappings per CPU vendor. I saw
your v2 cover letter, in which you said:
  Only patch vendor extension if all harts are associated with the same
  vendor. This is the best chance the kernel has for working properly if
  there are multiple vendors.
I don't think that level of paranoia is required: if firmware tells us
that an extension is supported, then we can trust that those extensions
have been implemented correctly. If the fear of implementation bugs is
what is driving the namespacing that you've gone for, I don't think that
it is required and we can simplify things, with the per-vendor structs
being the vendor of the extension (so SoC vendor S in my example), not
A and B who are the vendors of the CPU IP.

Thanks,
Conor.


--S0aAJ0pL4KXiXwbM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh4qgQAKCRB4tDGHoIJi
0jJZAQDQmcK4nj841UhHcb8WvWbPC7o7TCt9g7AQS757vS0CSwD/XR1svOyQ4sAV
a2VdMwg8xaojsbGnITddWN30iDLuywA=
=fr0c
-----END PGP SIGNATURE-----

--S0aAJ0pL4KXiXwbM--


--===============8580003495912143749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8580003495912143749==--

