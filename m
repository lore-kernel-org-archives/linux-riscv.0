Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9109C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 18:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFhx0unTZE6rs9n0amGW5nGjBeRo0TAGNAe7E8jki9s=; b=uIU7Qh0BSKj97JNsmTFYm3+ZRP
	hbiS/HuB6BY78FqZlHG/zMwFteEr/7f1JVidvAT9f4k47BMO5F3E0v9kAofcBw1IaY5RBePcdKMBv
	QwDaAaw7D5Ov9HcXo3kIhidkPS2uYAY8s6xkohsHa+D3Hpa0vRGvHLqmV26Ru8PzC2rAw8YA9C4cp
	mIqQydoj6XY8/1eaNg69+/zCN2ed6asNRadrLYRGsJ+kJeeekGqCvcPs/+6O9mWbVzKu4Ke7PWsvy
	WhKnYd2Vh0pGRdlI3S2vZEJlQ8DtpD4uwcjNCrf3iqu4uO7U23RbN85PmUW7rurDUUJnzM+U0f66p
	efzRngyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxWUd-00000003Kqy-0hyT;
	Thu, 18 Apr 2024 18:28:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxWUb-00000003KqI-1amA
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 18:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 276FF618A2;
	Thu, 18 Apr 2024 18:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5107DC32782;
	Thu, 18 Apr 2024 18:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713464895;
	bh=cGgGfWoLBTL/hlH67/DbM+A6HnH7a9Nxfw3eh40k+NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=muEcbSbweJZTF/50dnG30+3FBgk4dhTJAjrTNU8zPCoFdx02+VYfmgt2+l8Yw76eH
	 AOvwwO0DAU/ZlMZc5O40SwbuSlBUmBTP/xvTa/+8pBDSFOR6U/dr+AbLbIHiL+mn61
	 5LtET0WNB1Suj5Tkz8m7Axws78EbKHD3CeWxQVmJiVpef2W1T1sM2hyvsuCQyleJBC
	 iyIBOYIbfjO4QTN1/rPEpEA7bBCStNuFx5gVCoAZGv7CvSgdE8FqU3p/ZexVHPGruO
	 i+CX470+LManjtTT39CEEMKZPw6zZ8oAvD50eIMk230OqCzkeOzz4r3k/mAX0HOlPH
	 cVp09oOlZyeLg==
Date: Thu, 18 Apr 2024 19:28:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Joel Granados <j.granados@samsung.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: Re: [PATCH v4 7/9] riscv: vector: adjust minimum Vector requirement
 to ZVE32X
Message-ID: <20240418-critter-pulp-4d68456fccf3@spud>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-7-e0c45bb6b253@sifive.com>
 <20240418-brook-chili-4d3e61d1a55c@wendy>
 <20240418155256.GA2410@sol.localdomain>
 <20240418-ultimatum-yam-11de4b063b83@spud>
 <20240418173203.GA1081@sol.localdomain>
 <20240418173946.GB1081@sol.localdomain>
 <20240418-sterling-sanding-d59c3b0a2aaa@spud>
MIME-Version: 1.0
In-Reply-To: <20240418-sterling-sanding-d59c3b0a2aaa@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_112817_531871_3A0BB561 
X-CRM114-Status: GOOD (  57.68  )
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
Content-Type: multipart/mixed; boundary="===============3186639513677313832=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3186639513677313832==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mLAnJVt7uwsday9c"
Content-Disposition: inline


--mLAnJVt7uwsday9c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 07:26:00PM +0100, Conor Dooley wrote:
> On Thu, Apr 18, 2024 at 10:39:46AM -0700, Eric Biggers wrote:
> > On Thu, Apr 18, 2024 at 10:32:03AM -0700, Eric Biggers wrote:
> > > On Thu, Apr 18, 2024 at 05:53:55PM +0100, Conor Dooley wrote:
> > > > > If it would be useful to do so, we should be able to enable some =
of the code
> > > > > with a smaller VLEN and/or EEW once it has been tested in those c=
onfigurations.
> > > > > Some of it should work, but some of it won't be able to work.  (F=
or example, the
> > > > > SHA512 instructions require EEW=3D=3D64.)
> > > > >=20
> > > > > Also note that currently all the RISC-V vector crypto code only s=
upports riscv64
> > > > > (XLEN=3D64).  Similarly, that could be relaxed in the future if p=
eople really need
> > > > > the vector crypto acceleration on 32-bit CPUs...  But similarly, =
the code would
> > > > > need to be revised and tested in that configuration.
> > > > >=20
> > > > > > Eric/Jerry (although read the previous paragraph too):
> > > > > > I noticed that the sha256 glue code calls crypto_simd_usable(),=
 and in
> > > > > > turn may_use_simd() before kernel_vector_begin(). The chacha20 =
glue code
> > > > > > does not call either, which seems to violate the edict in
> > > > > > kernel_vector_begin()'s kerneldoc:
> > > > > > "Must not be called unless may_use_simd() returns true."
> > > > >=20
> > > > > skcipher algorithms can only be invoked in process and softirq co=
ntext.  This
> > > > > differs from shash algorithms which can be invoked in any context.
> > > > >=20
> > > > > My understanding is that, like arm64, RISC-V always allows non-ne=
sted
> > > > > kernel-mode vector to be used in process and softirq context -- a=
nd in fact,
> > > > > this was intentionally done in order to support use cases like th=
is.  So that's
> > > > > why the RISC-V skcipher algorithms don't check for may_use_simd()=
 before calling
> > > > > kernel_vector_begin().
> > > >=20
> > > > I see, thanks for explaining that. I think you should probably check
> > > > somewhere if has_vector() returns true in that driver though before
> > > > using vector instructions. Only checking vlen seems to me like rely=
ing on
> > > > an implementation detail and if we set vlen for the T-Head/0.7.1 ve=
ctor
> > > > it'd be fooled. That said, I don't think that any of the 0.7.1 vect=
or
> > > > systems actually support Zvkb, but I hope you get my drift.
> > >=20
> > > All the algorithms check for at least one of the vector crypto extens=
ions being
> > > supported, for example Zvkb.  'if (riscv_isa_extension_available(NULL=
, ZVKB))'
> > > should return whether the ratified version of Zvkb is supported, and =
likewise
> > > for the other vector crypto extensions.  The ratified version of the =
vector
> > > crypto extensions depends on the ratified version of the vector exten=
sion.
>=20
> That's great if it does require that the version of the vector extension
> must be standard. Higher quality spec than most if it does. But
> "supported" in the context of riscv_isa_extension_available() means that
> the hardware supports it (or set of harts), not that the currently
> running kernel does. The Kconfig deps that must be met for the code to be
> built at least mean the kernel is built with vector support, leaving only
> "the kernel was built with vector support and the hardware supports vector
> but for $reason the kernel refused to enable it".
>=20
> I'm not sure if that final condition is actually possible with the system
> ending up in a broken state, however - I'm not sure that we ever do turn
> off access to the VPU at present (after we mark it usable), and if we do
> it doesn't get reflected in has_vector() so the kernel and userspace would
> both break, with what a crypto driver does probably being the least of
> your worries.
>=20
> > > So
> > > there should be no issue.  If there is, the RISC-V core architecture =
code needs
> > > to be fixed to not declare that extensions are supported when they ar=
e actually
> > > incompatible non-standard versions of those extensions.  Incompatible
> > > non-standard extensions should be represented as separate extensions.
> > >=20
> >=20
> > It probably makes sense to check has_vector() to exclude Zve* for now, =
though.
>=20
> I think you might actually be better served at present, given the code can
> only be built if the core vector code is, by using
> riscv_isa_extension_available(NULL, v). That way you know for sure that
> you're getting the ratified extension and nothing else.

Poor choice of wording here - I meant, of course, the "main" vector
extension, rather than the Zve* variants.

> Prior to this conversation I thought that has_vector() should return true
> if there's a standard compliant vector unit available - given all users
> Andy added only need Zve32x.
>=20
> > I am just concerned about how you're suggesting that non-standard exten=
sions
> > might be pretending to be standard ones and individual users of kernel-=
mode
> > vector would need to work around that.
>=20
> I am absolutely not suggesting that non-standard extensions should
> masquerade as standard ones, I don't know where you got that from. What
> I said was that a non-standard vector extension could reuse riscv_v_vlen
> (and should IMO for simplicity reasons), not that any of the APIs we have
> for checking extension availability would lie and say it was standard.
> riscv_v_vlen having a value greater than 128 is not one of those APIs ;)
>=20
> > I think that neither has_vector() nor
> > 'if (riscv_isa_extension_available(NULL, ZVKB))' should return true if =
the CPU's
> > vector extension is non-standard.
>=20
> riscv_isa_extension_available(NULL, ZVKB) only checks whether the extensi=
on
> was present in DT or ACPI for all harts. It doesn't check whether or not
> the required config option for vector has been set or anything related
> to dependencies. has_vector() at least checks that the vector core has
> been enabled (and uses the alternative-patched version of the check
> given it is used in some hotter paths). That's kinda moot for code
> that's only built if the vector core stuff is enabled as I said above
> though.
>=20
> We could of course make riscv_isa_extension_available() check
> extension dependencies, but I'd rather leave dt validation to the dt
> tooling (apparently ACPI tables are never wrong...). Either would allow
> you to rely on the crypto extensions present only when the standard vector
> extensions unless someone's DT/ACPI stuff is shite, but then they keep the
> pieces IMO :)
>=20
> Hope that makes sense?
> Conor.



--mLAnJVt7uwsday9c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiFmOQAKCRB4tDGHoIJi
0g+gAP4s7Y89b7onb+pLQYPEYkcKkctnJghUX1iqKVYdBelnPAD/S4THtDLooTQC
2lj8IQLs4o9YycgtpSI8+TdZn/kMMgs=
=vPGx
-----END PGP SIGNATURE-----

--mLAnJVt7uwsday9c--


--===============3186639513677313832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3186639513677313832==--

