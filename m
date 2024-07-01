Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD9EC30653
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 12:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epq/sUkpkwQVmXiBstpaRMRroKg6cE5Mkpds48AV/qI=; b=DkWSUSGfbITaRkz/JI6O/W9wsa
	EvyVo0LIU3NMJxjiht7JBVhtqymQEJ9Cw3+7aN+1HyrC2io3do68tJRDwGkerw6WtTa0woOqfB6UZ
	ZZ/NPRJ8FQNuZJ83gweaT4RSDDqy7ViVxMIb7FpDbEQI2w0Bn/aEkc/aHGN+tu3zp5p9JrskOkKWZ
	JGoUopetHwCBVrywBeGXfvApuWUUCQ1k+Ub2ML4pUW9WrI4xBYP8JD8rTRyBg7sMptSnl33jlK5IZ
	JvWBKIHNdDy10Wo+JKWUDreZPVG55etrth157Kv6rtbR9dSpZTl1NvxoMtM64OOHtSqR3woDZkW8v
	NDjUxSZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGG8-00000003Fhb-06G4;
	Mon, 01 Jul 2024 12:35:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFqP-000000033cg-0esK
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 12:09:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6779261268;
	Mon,  1 Jul 2024 12:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DA6C116B1;
	Mon,  1 Jul 2024 12:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719835756;
	bh=uNxwrspYdfcgKZkau1ianppe9a1j5MNN2u9wVOf0fZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKPEGjReNkMH66tCLa/3WX2LrX8ygff0seg8UW8KLM/3d1jzWydrv9nqOXXscDEAO
	 IiDEwU4E5QqYk5HNtqGVXbqQlsIJmBho+m4SNP3a3IOCjihvhZmvR8i0v7QMne5Ert
	 x3+LdfE/B2GOfslb0nOHt91HFs37A3rR/U9xIB2DO6+NQN94/AUVMK9SfLggmgcVXj
	 aG+aES2IHBDfvOYVtmOC1mc9ezlXm4T0vz45hfdORxFGJKC8OBfwtofpp0g9ChSWyP
	 1SSrlrlUoULUSYi2qaWnaD3y15b/4wh6dDwawoYeS8VlmA6PN/dwon8lXHsAuse7XF
	 KHZfhByNYCE7g==
Date: Mon, 1 Jul 2024 13:09:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Robbin Ehn <rehn@rivosinc.com>
Cc: Ludovic Henry <ludovic@rivosinc.com>, yangfei@iscas.ac.cn,
	linux-riscv@lists.infradead.org, Hamlin Li <hamlin@rivosinc.com>,
	Tony Printezis <tony@rivosinc.com>, caogui@iscas.ac.cn
Subject: Re: Vector on Banana Pi BPI-F3
Message-ID: <20240701-fog-pagan-0a22fefaf297@spud>
References: <CAEEvPLBZQnG2=-+P8rS3jE0HkZjfNZy+tcZTRMw9wuLnGudkug@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEEvPLBZQnG2=-+P8rS3jE0HkZjfNZy+tcZTRMw9wuLnGudkug@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_050917_353578_1F912403 
X-CRM114-Status: GOOD (  28.07  )
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
Content-Type: multipart/mixed; boundary="===============3712413343687144958=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3712413343687144958==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="raAhaki8MAgzjZyg"
Content-Disposition: inline


--raAhaki8MAgzjZyg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Mon, Jul 01, 2024 at 11:08:31AM +0200, Robbin Ehn wrote:
> There seems to be a large interest in running openjdk with vector on
> this board out-of-the-box.
> The vendor kernel have vector from 6.4 back-ported without hwprobe.
> And FYI: the vendor kernel for k230 has THEAD vector patches.
> Both do the right thing during context switches (sources have been checke=
d).
>=20
> It seems like we have three options, anymore?
>=20
> A:
> Keep what we do: i.e. no hwprobe no V.
> Downside no V (default) on contemporary boards.
> Hence no V coverage in CI testing and disappointed early adopters.

Upside: pressure on vendors not to ship old, heavily modified kernels.
I'd be pretty vociferous about pushing the blame on the vendors were I
in your shoes! There's some work in progress for mainline spacemit k1
support that would allow you to get something usable for CI although
obviously these things move slowly. Palmer did mention that if this
board is helpful for compiler testing that some of the Rivos folks might
work on support for it in mainline though, which would be neat...

> B:
> Enable it for triplet mvendorid/marchid/mimplid.
> Only V for this specific board, other boards and/or updates to this
> board require new binaries.

And, depending on implementation, may break if the kernel running on the
board doesn't support vector. You'd need to check hwcap and the triplet.
m*id all come from the CPU, so you can't be sure that the values there
will uniquely identify a specific board or SoC for you anyway. If you
want to support the can of worms you're opening there with m*id stuff
for vendor kernels, then go for it. If you start it for vector on one
board, where do you draw a line in terms of either extension or boards?

> C:
> Enable it for boards with V in hwcap.
> Downside boards false reporting V (1.0), such as K230 small-CPU and THEAD,

Why does the small K230 CPU falsely report that? Does it have no vector
and report that it does? Or does it support 0.7 like the other T-head
stuff? I suppose the latter given they the patches you say their kernel
has.

One thing that we did in the kernel was, when parsing a devicetree, to
ignore v in riscv,isa where the CPU vendor was T-Head and the archid was
0x0. It wasn't meant to be a perfect detection of incorrect devicetrees,
but a simple best-effort attempt to handle vendor provided dtbs for
Vector 0.7 devices. Best-effort is fine in this case, cos ultimately it
isn't the kernel's problem if someone has incorrectly described their
hardware. Guo Ren claimed that no vector 1.0 devices have a 0x0 marchid,
but I do not know if there are vector 0.7 devices with a non-zero marchid.

I'd be very curious as to what the small cpu reports for marchid/mimpid,
to see if that rule would still hold true. If they happens to be non-zero,
mainline wouldn't even run on it, even ignoring vector, without either an
OpenSBI and devicetree replacement or kernel changes, so the courtesy
disabling of vector wouldn't even trigger. What it would mean, is a
similar approach to disable vector on 0.7 devices wouldn't suffice for
you.

> needs to be handled, safe fetch vsetvli and vsetvli v1.0 check can fix
> those two examples.
> If we miss a board or a new board comes out we may lack proper check thus=
 crash.

With my only mainline matters blinkers on, that's another tick in the
"pressure on vendors to not ship old, heavily modified kernels" box!

> In PRs:
> https://github.com/openjdk/jdk/pull/19472
> https://github.com/openjdk/jdk/pull/19679
>=20
> Options A was used.
>=20
> The question is if we can reconsider due to the benefits and use
> another option allowing V to automatically work?

I think whether you reconsider isn't really a topic for lkml, it seems
more like a policy decision for your project as there's not a magic bullet
we can offer you that can be sure not to break if you intent supporting
"random" vendor kernels.

Cheers,
Conor.

--raAhaki8MAgzjZyg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoKcaAAKCRB4tDGHoIJi
0pQfAP9dV5WG8iezEYKsDmEfkdUxjVp7glzpv6hrtlxltFvCSgEAiAWHTs1jDiND
XCyLH7T5bTybRV+EwWAU52N3ljaftgQ=
=vMhe
-----END PGP SIGNATURE-----

--raAhaki8MAgzjZyg--


--===============3712413343687144958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3712413343687144958==--

