Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80EEC3063F
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 17:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dW/bwGLDRl0FwMz0q5PmOnM2NUsaIxX1pygn5s8pL38=; b=gKy+fzm9ny3K6+KqJ4iXlkM4yg
	5WB5L/UNm7Y9PxDzTFX3HQGnhZ0n6m6IJaCLACq7i3oNpJoBBhairwqo2NtMHBjj/dUIvQ08I/rTh
	sr7Ba7hFCgrfeMOf0dHLu4PAtRAVQgU/qVf+PQa0jCk3Xa/HIN0YoGToVHAyYDLhH5YQJNdshdj4F
	qTyZbnRnjEBueM4QUBgHMr/pau8lvh2oUvnlSxiumGxhVaCsAWMaVPDQxqE4tLLxbyijh/WSr4243
	YJpHTWlmOyR82zmDY4IHXzp3Olu3M4Q3ovIna1f5ELbkQqU01OaVBZ5tLsjNxUdF5IGf46espTPn8
	Tj4TW6WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGNWj-00B7c6-1t;
	Mon, 03 Jul 2023 17:39:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGNWg-00B7be-2M
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 17:39:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E74260FF4;
	Mon,  3 Jul 2023 17:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3945DC433C7;
	Mon,  3 Jul 2023 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688405989;
	bh=OntLpPnFpu6a5AZn6p9k4IDUTa9DeesaKC3dsarBEQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmrFmh5lmxYbn4ure2V67iG4eEuApA+cAlmqBLLlcm22Zr08WKxQHX28dD2UKLsjd
	 DP+rbcQDXn3UG4NI77qkloLUuYM7fnmFG7citty9W43xTWEfujhRokN0XnVCTrEGSl
	 +s+hFLWXSRReOk0GYeB4H1sfXuFS5SYtVcdj2dFDXj+FWNkYQAkaih8GJVBwHN+U/e
	 BRv5FkW5UqRxzuussLA9sDCiLF7Q29Q5GHLyox7pAPttgayI8CuAD6RLZWMTswWaSy
	 yLFcxHVZT0QRlQpWQL/hSfB4BGXEx15i67N+6yqO0ZNIdEbFUTISuT79ubCc2ybOzL
	 R8pY7TlcX5mkA==
Date: Mon, 3 Jul 2023 18:39:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>, linux@rivosinc.com,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Jiatai He <jiatai2021@iscas.ac.cn>
Subject: Re: [PATCH 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing from DT
Message-ID: <20230703-mangle-panning-75909ebbe30c@spud>
References: <20230627143747.1599218-1-sameo@rivosinc.com>
 <20230627143747.1599218-2-sameo@rivosinc.com>
 <CALs-HssMkVikspnEi-Ek2t=ABvFvgptAhsBjk1+aLuVjiP7P7w@mail.gmail.com>
 <20230627-debating-twelve-da2c1ed60948@spud>
 <ZJwE5wRVkoND3Z6P@vermeer>
 <20230628-unfeeling-tavern-edd4f58396fa@wendy>
 <CALs-HstZe+bw_fY--4FQXfFoA67tvMSaEjKhZ2pRstNT07xBxA@mail.gmail.com>
 <20230628-dragonish-lullaby-b44d2df09d66@spud>
MIME-Version: 1.0
In-Reply-To: <20230628-dragonish-lullaby-b44d2df09d66@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_103950_858033_99E230A3 
X-CRM114-Status: GOOD (  37.47  )
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
Content-Type: multipart/mixed; boundary="===============2666038995022215580=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2666038995022215580==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JgFm48JGbULM0hnk"
Content-Disposition: inline


--JgFm48JGbULM0hnk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 06:24:40PM +0100, Conor Dooley wrote:
> On Wed, Jun 28, 2023 at 10:18:34AM -0700, Evan Green wrote:
> > On Wed, Jun 28, 2023 at 4:10=E2=80=AFAM Conor Dooley <conor.dooley@micr=
ochip.com> wrote:
> > >
> > > On Wed, Jun 28, 2023 at 12:01:11PM +0200, Samuel Ortiz wrote:
> > > > On Tue, Jun 27, 2023 at 07:48:15PM +0100, Conor Dooley wrote:
> > > > > On Tue, Jun 27, 2023 at 11:14:30AM -0700, Evan Green wrote:
> > > > > > On Tue, Jun 27, 2023 at 7:38=E2=80=AFAM Samuel Ortiz <sameo@riv=
osinc.com> wrote:
> > >
> > > > > > It would be nice to consolidate the ones together that search f=
or a
> > > > > > single string and set multiple bits, though I don't have any su=
per
> > > > > > elegant ideas for how off the top of my head.
> > > > >
> > > > > I've got a refactor of this code in progress, dropping all of the=
se
> > > > > copy-paste in place of a loop. It certainly looks more elegant th=
an
> > > > > this, but it will fall over a bit for these "one string matches m=
any
> > > > > extensions" cases. See here:
> > > > > https://patchwork.kernel.org/project/linux-riscv/patch/20230626-t=
hieving-jockstrap-d35d20b535c5@wendy/
> > > > > My immediate thought is to add another element to riscv_isa_ext_d=
ata,
> > > > > that contains "parent" extensions to check for. Should be fairly =
doable,
> > > > > I'll whip something up on top of that...
> > > >
> > > > Nice, and thanks for the review.
> > >
> > > > Should I wait for your refactor to be merged before pushing this on=
e?
> > >
> > > I don't know. I think that you should continue on with your series he=
re,
> > > and whichever goes in second gets rebased on top of the other.
> > > I don't think it makes material difference to review of this patchset=
 as
> > > to whether you rebase on top of what I'm working on, so I wouldn't
> > > bother until it gets merged.
> > >
> > > Rather hacky, had less time than expected this morning:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commi=
t/?h=3Driscv-extensions-strings-supersets
> > > Clearly there's issues with looping to RISCV_ISA_MAX_SUPERSETS & I ju=
st
> > > repurposed Zicsr for the sake of testing something in the time I had.
> > >
> > > Evan, at a high level, does that look more elegant to you, or have I =
made
> > > things worse?
> > >
> >=20
> > I see what you're going for at least. It's unfortunate that when
> > someone bumps up RISCV_ISA_MAX_SUPERSETS it squares the whole array.
> > Another way to go might be to define the elements in a separate array,
> > like:
> >=20
> > unsigned int riscv_zks_exts[] =3D {
> >        RISCV_ISA_EXT_ZBKB,
> >        RISCV_ISA_EXT_ZBKC,
> >        ....
> > };
> >=20
> > then the macro entry looks like:
> >=20
> > SET_ISA_EXT_MAP_MULTI("zks", riscv_zks_exts),
> >=20
> > where the SET_ISA_EXT_MAP_MULTI() could use ARRAY_SIZE() to stash both
> > the pointer to the array and the number of elements.
>=20
> Yup, I like the sound of that. I like the variadic stuff as it'd not
> require defining a bunch of sub-arrays of supersets. I guess if it grows
> too badly, we can just dump it off into another file or w/e.

Also, I realised the other day that I had a bug in my series - I was using
"name" to read the property, not "property", which is what required the
extra "supersets" property.
The simplest thing to do actually seems to be to expand the "property"
member to an array of strings named "properties", rather than
introducing a "supersets" or similar.

Perhaps I am forgetting a good reason for why I had it split, but I'll
give it a whirl and see what I think...

Cheers,
Conor.


--JgFm48JGbULM0hnk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKMH3wAKCRB4tDGHoIJi
0t+YAQCaAdQcKzF/7Wkkp8B3/aBhZXO+q4AFQeKrzR3oAw54bwD9G6x/Upc4snIB
z7KVmZAXIYejb0tOCXe33BZlBfBWUAg=
=UEKI
-----END PGP SIGNATURE-----

--JgFm48JGbULM0hnk--


--===============2666038995022215580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2666038995022215580==--

