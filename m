Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FFFC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 14:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esvWSTf2QJsEWC0mcFHDcM0pkPMMdM99nLP4zSrhTIg=; b=J2oEGzhwqmAUvzagWgex87zidV
	JuS+KaANeCnGzW2azeDFt076w2nt4rueKhwC3Jt86hJESV/4Kp3Y/Q4hamJOWRV8vZ+OhNNSlMB4K
	mIJdXNkHMjq6oth0vslTlLy5K9kwCYnSlvZ9lnKGs7oP1695+HKxUnmPJyS7UgooVmaIjn+M8jLHw
	q6+bLGFe/lzj60NbFebEyIULzA7M8eQbQaNgGTmiBAmRQ2Sut8NagddE9qdqe6i5K+04sW2b1ZE0a
	mMpcGE5CRaDwagFoV+VUYNcomgKuAP74RVA3BPoqLwRkSe51zAmlynd8kmzNPK3RygOaOGtBt8oDH
	Kcn/E2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZtYW-0000000988r-15VB;
	Fri, 02 Aug 2024 14:46:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZtYT-0000000987V-1iq0
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 14:46:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EE419CE1AFB;
	Fri,  2 Aug 2024 14:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4589C32782;
	Fri,  2 Aug 2024 14:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722610010;
	bh=0B04wVki9G0yvxf18iermuBnvEqCoQZgAVStJfZayRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mR0WO4H3CHo4CDRMsplIKoppPnHrrAbbdCqAJ9yH+/mgDzNuWDn5IWdExszj6TYqp
	 p3M9u/GnMdZ2hFeL+hWS2UraUs/Fr0EewdUl3/RLxFQGAt60wmqu4zP9Zghr4Ur5nk
	 lkjLyJsfLyRKJcmlWhjawFSC1d2zqlcVinW9tEmJbI14PhUo5HPQ5NiwBAKCzlTVOZ
	 1c+Z6FcCOTlmHpmNZkCjWz3zlG2csKgE6U/8bCuxp9rs84Xp02mKxA8IE9HFZ4Q3R9
	 djuEMM1yjCU3uJulkQeJb/B5YMpdtsksxLG8FJQ2F0OFw/fIXg5ehoDxbXH4ASivYk
	 8mLh9yavg4dOw==
Date: Fri, 2 Aug 2024 15:46:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 12/13] dt-bindings: riscv: Add Ziccrse ISA extension
 description
Message-ID: <20240802-frighten-flail-fddc8136b69d@spud>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-13-alexghiti@rivosinc.com>
 <20240801-unlighted-senator-cc60d021fe28@spud>
 <4b890910-ed3b-47e1-a895-48ae3d47e958@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <4b890910-ed3b-47e1-a895-48ae3d47e958@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_074653_846422_4569136D 
X-CRM114-Status: GOOD (  27.37  )
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
Content-Type: multipart/mixed; boundary="===============6240496559774981468=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6240496559774981468==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wOGS7rCkyPiSGxrA"
Content-Disposition: inline


--wOGS7rCkyPiSGxrA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2024 at 10:14:21AM +0200, Alexandre Ghiti wrote:
> Hi Cono
>=20
> On 01/08/2024 16:44, Conor Dooley wrote:
> > On Wed, Jul 31, 2024 at 09:24:04AM +0200, Alexandre Ghiti wrote:
> > > Add description for the Ziccrse ISA extension which was introduced in
> > > the riscv profiles specification v0.9.2.
> > >=20
> > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > Reviewed-by: Guo Ren <guoren@kernel.org>
> > > ---
> > >   Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml =
b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > index a63578b95c4a..22824dd30175 100644
> > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > @@ -289,6 +289,12 @@ properties:
> > >               in commit 64074bc ("Update version numbers for Zfh/Zfin=
x") of
> > >               riscv-isa-manual.
> > > +        - const: ziccrse
> > > +          description:
> > > +            The standard Ziccrse extension which provides forward pr=
ogress
> > > +            guarantee on LR/SC sequences, as introduced in the riscv=
 profiles
> > > +            specification v0.9.2.
> > Do we have a commit hash for this? Also v0.9.2? The profiles spec is a
> > crock and the version depends on the specific profile - for example
> > there's new tags as of last week with 0.5 in them... The original profi=
les
> > are ratified, so if this definition is in there, please cite that
> > instead of a "random" version.
>=20
>=20
> That's not a "random" version, please refer to the existing tag v0.9.2 wh=
ere
> this was first introduced
> (https://github.com/riscv/riscv-profiles/releases/tag/v0.9.2).

That might be your intent, but the versioning in that repo sucks. If
you'd said the v0.9.2 *tag* that would be clearer than what you wrote,
as there could easily be a v0.9.2 of a new profile - there's already a
v0.4 etc.

> But I'll change that to the profiles specification v1.0.

Still vague IMO, please provide a commit hash.

--wOGS7rCkyPiSGxrA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqzxQQAKCRB4tDGHoIJi
0kz2AQDjtdPseCng2S+4ONZZ0SQUpo8PNoH5fYL4FOkdI8i/XgD/UWt6cymyJp12
kVz40SPUpdTEuDlR9fA8oueX+EaJIQI=
=xbhP
-----END PGP SIGNATURE-----

--wOGS7rCkyPiSGxrA--


--===============6240496559774981468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6240496559774981468==--

