Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873C2C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5L9kK/rl2UWpaHuL7EgMv+0XXDHC6dBir93O5EohJ9s=; b=rQ7d/zCK4eYEx7z+2oksmhsXoC
	YJkZHp5tNVuTBa226qKjxx4qvQ0mGiT1Vi9BJA7KNc592Euwfxuy7X8/LYfiLwdUiPGKKb3gRNH24
	SEpsovtR4rN5RkGm564busO0xjwBGQae+juWPs1MP6tK1mgEctoJnD18ISCwYeh7qr7cycbJ4GJsa
	U7fdxQfO7S4jOeguiaff0q5nfEZ+/ewDynd1ID+vJxjrM5tFWtV3ibJgzDs1ZMqqh8POtcjlr7yOf
	qqHmBXrC+apF2eCzvCLEyK+doTFS2FeNdoK4uQC6+CIB+1iMHzYUbfC+sq+VU0GWJ28DBTe3nwqio
	i/JmSv/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHGf-00000003X8C-1Wxn;
	Mon, 01 Jul 2024 13:40:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHGc-00000003X6V-26IJ
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 13:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2AE361309;
	Mon,  1 Jul 2024 13:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEFCC116B1;
	Mon,  1 Jul 2024 13:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719841225;
	bh=ZuA4npQw/3KBd1b/wEJD3ILE1EjeGCsbLKCslufsChw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LIj/mVazpSLHabizbUMe4MNoQhJtY0iDVzjyPIWsjsmmoq27oiv9hiflq1whlitdw
	 tmUwaQhDaRuITjyoyOocKjP6GdxmLYBxcP11Y/SukMasKYbilpmTDCn+HJNcPi84Ls
	 t9lVC8lia93i+SthF3WjNZS1WMJfoMmRLXtD2aL3TISEAfE7QNExtLLNa13+690cJ8
	 HquaRHSEDkOD/gCRJP6E3510HF9zoEiUXwUVbdx1EkbcPWe5mHizWB/dFXnOOzwJbE
	 sRa3hqeFygcbjNP5++UCuHJwjWtI10zGIeRUe5qrwhwgZUOsokXmbiu2AwU+P+A7OV
	 CZqSbs1rmTZlg==
Date: Mon, 1 Jul 2024 14:40:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Robbin Ehn <rehn@rivosinc.com>
Cc: riscv-port-dev@openjdk.org, Ludovic Henry <ludovic@rivosinc.com>,
	yangfei@iscas.ac.cn, linux-riscv@lists.infradead.org,
	Hamlin Li <hamlin@rivosinc.com>, Tony Printezis <tony@rivosinc.com>,
	caogui@iscas.ac.cn
Subject: Re: Vector on Banana Pi BPI-F3
Message-ID: <20240701-apostle-rack-d4d31c30ce49@spud>
References: <CAEEvPLBZQnG2=-+P8rS3jE0HkZjfNZy+tcZTRMw9wuLnGudkug@mail.gmail.com>
 <20240701-fog-pagan-0a22fefaf297@spud>
 <CAEEvPLDHUN87p3kJQmSm8tcEwENA+3xan6TEKJaJAy3NVDS5hw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEEvPLDHUN87p3kJQmSm8tcEwENA+3xan6TEKJaJAy3NVDS5hw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_064026_722095_C913F97F 
X-CRM114-Status: GOOD (  54.67  )
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
Content-Type: multipart/mixed; boundary="===============6662055888759143690=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6662055888759143690==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iC9DSOsDpGDrTKnY"
Content-Disposition: inline


--iC9DSOsDpGDrTKnY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 03:19:51PM +0200, Robbin Ehn wrote:
> On Mon, Jul 1, 2024 at 2:09=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> > On Mon, Jul 01, 2024 at 11:08:31AM +0200, Robbin Ehn wrote:
> > > There seems to be a large interest in running openjdk with vector on
> > > this board out-of-the-box.
> > > The vendor kernel have vector from 6.4 back-ported without hwprobe.
> > > And FYI: the vendor kernel for k230 has THEAD vector patches.
> > > Both do the right thing during context switches (sources have been ch=
ecked).
> > >
> > > It seems like we have three options, anymore?
> > >
> > > A:
> > > Keep what we do: i.e. no hwprobe no V.
> > > Downside no V (default) on contemporary boards.
> > > Hence no V coverage in CI testing and disappointed early adopters.
> >
> > Upside: pressure on vendors not to ship old, heavily modified kernels.
> > I'd be pretty vociferous about pushing the blame on the vendors were I
> > in your shoes! There's some work in progress for mainline spacemit k1
> > support that would allow you to get something usable for CI although
> > obviously these things move slowly. Palmer did mention that if this
> > board is helpful for compiler testing that some of the Rivos folks might
> > work on support for it in mainline though, which would be neat...
>=20
> Yes, I know about the mainline effort, I didn't mention that because
> if that work is not picked up by the vendor, most will probably stick
> with the vendor kernel.

Right. I meant that specifically on the CI point.

> > > B:
> > > Enable it for triplet mvendorid/marchid/mimplid.
> > > Only V for this specific board, other boards and/or updates to this
> > > board require new binaries.
> >
> > And, depending on implementation, may break if the kernel running on the
> > board doesn't support vector. You'd need to check hwcap and the triplet.
> > m*id all come from the CPU, so you can't be sure that the values there
> > will uniquely identify a specific board or SoC for you anyway. If you
> > want to support the can of worms you're opening there with m*id stuff
> > for vendor kernels, then go for it. If you start it for vector on one
> > board, where do you draw a line in terms of either extension or boards?
> >
> > > C:
> > > Enable it for boards with V in hwcap.
> > > Downside boards false reporting V (1.0), such as K230 small-CPU and T=
HEAD,
> >
> > Why does the small K230 CPU falsely report that? Does it have no vector
> > and report that it does? Or does it support 0.7 like the other T-head
> > stuff? I suppose the latter given they the patches you say their kernel
> > has.
>=20
> If you are running on the small CPU0 (no V) I was told hwcap still report=
ed V !?
> My board just runs the big CPU1 core with V 1.0, so I have not verified t=
his.

"At least" falsely reporting vector when there's none is a pretty simple
fix for the vendor (if they care). Having different versions of vector
on different CPUs would be much more annoying. And ye, I asked on IRC
and someone said it does report V as you say.

> > One thing that we did in the kernel was, when parsing a devicetree, to
> > ignore v in riscv,isa where the CPU vendor was T-Head and the archid was
> > 0x0. It wasn't meant to be a perfect detection of incorrect devicetrees,
> > but a simple best-effort attempt to handle vendor provided dtbs for
> > Vector 0.7 devices. Best-effort is fine in this case, cos ultimately it
> > isn't the kernel's problem if someone has incorrectly described their
> > hardware. Guo Ren claimed that no vector 1.0 devices have a 0x0 marchid,
> > but I do not know if there are vector 0.7 devices with a non-zero march=
id.
> >
>=20
> As we are talking about kernels without hwprobe, userspace can only
> get it if it's reported via proc. (?)
> (my k230 kernel for example does not)

Oh god, does that come with the crappy old "5.10.4" kernel from T-Head?
I was expecting that info to be available in /proc/cpuinfo, but IIRC it
was only added in 2022's 6.1. That "5.10.4" vendor kernel is a parasite.

> > I'd be very curious as to what the small cpu reports for marchid/mimpid,
> > to see if that rule would still hold true. If they happens to be non-ze=
ro,
> > mainline wouldn't even run on it, even ignoring vector, without either =
an
> > OpenSBI and devicetree replacement or kernel changes, so the courtesy
> > disabling of vector wouldn't even trigger. What it would mean, is a
> > similar approach to disable vector on 0.7 devices wouldn't suffice for
> > you.
> >
> > > needs to be handled, safe fetch vsetvli and vsetvli v1.0 check can fix
> > > those two examples.
> > > If we miss a board or a new board comes out we may lack proper check =
thus crash.
> >
> > With my only mainline matters blinkers on, that's another tick in the
> > "pressure on vendors to not ship old, heavily modified kernels" box!
> >
> > > In PRs:
> > > https://github.com/openjdk/jdk/pull/19472
> > > https://github.com/openjdk/jdk/pull/19679
> > >
> > > Options A was used.
> > >
> > > The question is if we can reconsider due to the benefits and use
> > > another option allowing V to automatically work?
> >
> > I think whether you reconsider isn't really a topic for lkml, it seems
> > more like a policy decision for your project as there's not a magic bul=
let
> > we can offer you that can be sure not to break if you intent supporting
> > "random" vendor kernels.
>=20
> Yes, wrong list :) And I yes that's my opinion also.
> But as it will signicant make life easier for many, I'm willing to let it=
 slide.
>=20
> Added the correct list, but I'll keep lkml if anyone else wants to chime =
in.

Oh, I was almost not going to mention the list, glad I did if you
actually meant to send it elsewhere.

Cheers,
Conor.

--iC9DSOsDpGDrTKnY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoKxrQAKCRB4tDGHoIJi
0vIDAQDnWIndxUsvNNt37lL87Vc1Gi9ZQ9yA3vL1i/T1fa4pPgEA817QfzDzVotg
AAtG52BmyvlFWSqS8yLX0cL6D+mNJwI=
=gOhf
-----END PGP SIGNATURE-----

--iC9DSOsDpGDrTKnY--


--===============6662055888759143690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6662055888759143690==--

