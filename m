Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63FAC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 11:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlbQrKMR5xFITJR9zUs2Gv6yxiiUoX8a2046J8ttIgU=; b=qyzKd8D5LJk8t0c+KlQNUTx7ek
	IugoTREWn+TGF0Fc/EGIZ92WoN0Et/WqWfPhC7GvH2naLOnCN3DATwLp+adjsY54BcfhkIOlyqZgP
	PBNEfn10l3q6cxncUybykOOxTo0uoLlWzJOoRRvmajuIMPLKJbnG/vtc9HeFuqSUjc7+aeVsuLF7J
	kG/uLNanZSGgC4ut4GwdTC7YAhTAwnC5VzVyLfb7MHu63kErEOBiwp+f0WCeAszG43uOqSav3Y2uV
	Vll7EL5/mzEh6G+IFQ0OgaIZN3+0aARGwXhhUmjBVyV24o9N/BGSr+91ubaOZQYpDsZ4NpnRzGLCt
	6EDAR+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lvN-00000006DcN-357l;
	Tue, 30 Apr 2024 11:45:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lvJ-00000006DbW-2Zhy;
	Tue, 30 Apr 2024 11:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1714477525; x=1746013525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fHd/tvgknZmDQ1B+dKw15+R47eqN73inFJLNupe/g1s=;
  b=Z9ComrYxsJcwSImNF4XPZ9Uuz3Oq7KYlhddXUdmgJpHvc3JgUt1qjeVY
   SVwMvonwIHE4k/bDwUi8Wpxg39kmoCfaYVdE6ulJHULWaQDpuAIwOmHEf
   3OldCNKZVt4KrJqM37tQp1GY0EDNT3O54nrnoLz+vK5dhXUV4M33tZhW7
   peg0nabGqkhznQFRTnm8SerENBYDdkKO9Kx5qADwkCVrocL7E8lDC6/DF
   GhjzH0t4KsbdWTT6fAMm2cEyv+DJvSc/D6G/y4LlARkd+hriYodZbl0tK
   P6HFhQDm9ECX7HgKLhmJMp3N2G2dXJQZTfIaJ+lrozf9Pkcmf4JVI0Bx5
   A==;
X-CSE-ConnectionGUID: rJqdjKizQQ68Np9QZCjhLw==
X-CSE-MsgGUID: kyLwJnyCT2SNMFyBqjKUEg==
X-IronPort-AV: E=Sophos;i="6.07,242,1708412400"; 
   d="asc'?scan'208";a="190592988"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Apr 2024 04:45:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 04:44:50 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 30 Apr 2024 04:44:47 -0700
Date: Tue, 30 Apr 2024 12:44:30 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anup Patel
	<anup@brainfault.org>, Shuah Khan <shuah@kernel.org>, Atish Patra
	<atishp@atishpatra.org>, <linux-doc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v4 02/11] riscv: add ISA extensions validation
Message-ID: <20240430-payable-famished-6711765d5ca4@wendy>
References: <20240429150553.625165-1-cleger@rivosinc.com>
 <20240429150553.625165-3-cleger@rivosinc.com>
 <20240429-subtext-tabby-3a1532f058a5@spud>
 <5d5febd5-d113-4e8c-9535-9e75acf23398@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <5d5febd5-d113-4e8c-9535-9e75acf23398@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_044525_830185_E3A8EDA6 
X-CRM114-Status: GOOD (  37.66  )
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
Content-Type: multipart/mixed; boundary="===============8586285292826642799=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8586285292826642799==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o3hC9HS35D3JsI9f"
Content-Disposition: inline

--o3hC9HS35D3JsI9f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 09:18:47AM +0200, Cl=E9ment L=E9ger wrote:
>=20
>=20
> On 30/04/2024 00:15, Conor Dooley wrote:
> > On Mon, Apr 29, 2024 at 05:04:55PM +0200, Cl=E9ment L=E9ger wrote:
> >> Since a few extensions (Zicbom/Zicboz) already needs validation and
> >> future ones will need it as well (Zc*) add a validate() callback to
> >> struct riscv_isa_ext_data. This require to rework the way extensions a=
re
> >> parsed and split it in two phases. First phase is isa string or isa
> >> extension list parsing and consists in enabling all the extensions in a
> >> temporary bitmask without any validation. The second step "resolves" t=
he
> >> final isa bitmap, handling potential missing dependencies. The mechani=
sm
> >> is quite simple and simply validate each extension described in the
> >> temporary bitmap before enabling it in the final isa bitmap. validate()
> >> callbacks can return either 0 for success, -EPROBEDEFER if extension
> >> needs to be validated again at next loop. A previous ISA bitmap is kept
> >> to avoid looping mutliple times if an extension dependencies are never
> >> satisfied until we reach a stable state. In order to avoid any potenti=
al
> >> infinite looping, allow looping a maximum of the number of extension we
> >> handle. Zicboz and Zicbom extensions are modified to use this validati=
on
> >> mechanism.
> >=20
> > Your reply to my last review only talked about part of my comments,
> > which is usually what you do when you're gonna implement the rest, but
> > you haven't.
> > I like the change you've made to shorten looping, but I'd at least like
> > a response to why a split is not worth doing :)
>=20
> Hi Conor,
>=20
> Missed that point since I was feeling that my solution actually
> addresses your concerns. Your argument was that there is no reason to
> loop for Zicbom/Zicboz but that would also apply to Zcf in case we are
> on RV64 as well (since zcf is not supported on RV64). So for Zcf, that
> would lead to using both mecanism or additional ifdefery with little to
> no added value since the current solution actually solves both cases:
>=20
> - We don't have any extra looping if all validation callback returns 0
> (except the initial one on riscv_isa_ext, which is kind of unavoidable).
> - Zicbom, Zicboz callbacks will be called only once (which was one of
> your concern).
>=20
> Adding a second kind of callback for after loop validation would only
> lead to a bunch of additional macros/ifdefery for extensions with
> validate() callback, with validate_end() or with both (ie Zcf)). For
> these reasons, I do not think there is a need for a separate mechanism
> nor additional callback for such extensions except adding extra code
> with no real added functionality.
>=20
> AFAIK, the platform driver probing mechanism works the same, the probe()
> callback is actually called even if for some reason properties are
> missing from nodes for platform devices and thus the probe() returns
> -EINVAL or whatever.
>=20
> Hope this answers your question,

Yeah, pretty much I am happy with just an "it's not worth doing it"
response. Given it wasn't your first choice, I doubt you're overly happy
with it either, but I really would like to avoid looping to closure to
sort out dependencies - particularly on the boot CPU before we bring
anyone else up, but if the code is now more proactive about breaking
out, I suppose that'll have to do :)
I kinda wish we didn't do this at all, but I think we've brought this
upon ourselves via hwprobe. I'm still on the fence as to whether things
that are implied need to be handled in this way. I think I'll bring this
up tomorrow at the weekly call, because so far it's only been you and I
discussing this really and it's a policy decision that hwprobe-ists
should be involved in I think.

Implied extensions aside, I think we will eventually need this stuff
anyway, for extensions that make no sense to consider if a config option
for a dependency is disabled.
=46rom talking to Eric Biggers the other week about
riscv_isa_extension_available() I'm of the opinion that we need to do
better with that interface w.r.t. extension and config dependencies,
and what seems like a good idea to me at the moment is putting tests for
IS_ENABLED(RISCV_ISA_FOO) into these validate hooks.

I'll try to look at the actual implementation here tomorrow.

Cheers,
Conor.

--o3hC9HS35D3JsI9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjDZngAKCRB4tDGHoIJi
0jaXAQDZLEWybBZ6OTc/u2wI/xhLxITFoBF1IWTZ2CPcg9nOugD/e972YLWSGflR
ZM//z1//gOap3OewaAJgMnP4nvYeEA4=
=U5u8
-----END PGP SIGNATURE-----

--o3hC9HS35D3JsI9f--


--===============8586285292826642799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8586285292826642799==--

