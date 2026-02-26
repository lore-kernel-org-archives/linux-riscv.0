Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A06FC590F
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 08:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJuQdEkE9hJJChK8f6QGRQDX2ek8JK1wbi8P8kTYiNE=; b=ddv7NRR9tbVMkh7delSXsOuZHg
	bGcql+Ult1PNsHFBpSToSxV8QBqFddxRTqB7FCyEA3j6tfJshaPk/SJUNxPtRFQY/CB7b6xpfdePQ
	7mXzUqvfIveg1CBMzd+r7mQyi9OrB1KGJ78O0HHoR7/1ZWcdI6clwDwAzmTNj8A9p74io9yUraaQS
	wziuc2EdQehCjEqalPNbIhENrzLzDnbyIOP4dJuMrUkIZyh0vkFP58zlrAaAdk2PEXtX4yAaVkjsp
	1dq//+wphW/3AO1OzltPf4YNJniGkE110FZjIBzmc5XVsflsRXeSMkHxlufyo0q0QZB4sCpkvCz6t
	jm0vQBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWyg-00000005gcP-0O2A;
	Thu, 26 Feb 2026 08:44:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWyf-00000005gcC-0Nh4
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 08:44:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B19C60097;
	Thu, 26 Feb 2026 08:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7792C19422;
	Thu, 26 Feb 2026 08:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772095447;
	bh=KT+n7lGou2MwWb/kPhjb2wieItjTek3mHY+ZvxMDcs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dh3ExGoBaw+jCSb0OM/XWNE+dZiU0bxQ3eM42o13hylnazJYhVxm0pxcAztbnaEsE
	 MIljxm7A6t1Mmco51FTPgUr6KVY4yPpOhNMGzzrQi4piPuy07Ktml9ViXRHsKhG0OC
	 1yfY3vfol03ILL5nb3zPliJqtZzPcbYcJC4b2Ei531flm13Pk1E+sRw/7Xe1I+YYqI
	 tIdA6ibvAk9btg/Wy8TmqlLFc7FTZmsDAucB5NkIfJA6uCxXtm9at/Yn2JNNBmYbif
	 8EQQ45AYQmTbdHQw//psdGP58IcONgvXeXIb4P7YkhO4SAVtjlS03L2hubh+X1d5XX
	 t/DoV5iYYa7nA==
Date: Thu, 26 Feb 2026 08:44:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, shuah@kernel.org
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <20260226-shifty-stingily-acfd81c08fde@spud>
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <20260223-mouth-plated-50294c7a6ac0@wendy>
 <CA+Ht8=aoxQp-RcFGWXXsfDyNarCn=zRhUOoG9rUCGeEw83BQvw@mail.gmail.com>
 <20260224-likewise-rimless-151f6a12b092@wendy>
 <CA+Ht8=Z-iaQ+zys5UOy6iNtdTsdtjq7mARwz=KJA_vbNYcfF6w@mail.gmail.com>
 <20260225-compress-moody-400a1e2f46fb@spud>
 <CAAhSdy2WHLahqPMTCqoSff6Z3no8sX2j_g858jp4XW5Et4dJXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAhSdy2WHLahqPMTCqoSff6Z3no8sX2j_g858jp4XW5Et4dJXw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7346138572288693376=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7346138572288693376==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4uVDXKIANR8kRBf5"
Content-Disposition: inline


--4uVDXKIANR8kRBf5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 11:05:14AM +0530, Anup Patel wrote:
> On Wed, Feb 25, 2026 at 2:31=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, Feb 25, 2026 at 10:33:27AM +0530, Himanshu Chauhan wrote:
> > > On Tue, Feb 24, 2026 at 1:33=E2=80=AFPM Conor Dooley <conor.dooley@mi=
crochip.com> wrote:
> > > >
> > > > On Tue, Feb 24, 2026 at 09:30:24AM +0530, Himanshu Chauhan wrote:
> > > > > Hi,
> > > > >
> > > > > On Mon, Feb 23, 2026 at 3:55=E2=80=AFPM Conor Dooley <conor.doole=
y@microchip.com> wrote:
> > > > > >
> > > > > > On Mon, Feb 23, 2026 at 10:19:17AM +0530, Himanshu Chauhan wrot=
e:
> >
> > > >
> > > > Did you miss the comment at the end about the remaining TODOs?
> > >
> > > No. As I mentioned in the cover letter, the ptrace support is not
> > > implemented here. I am actively working on it and these are
> > > implemented in ptrace work.
> > > The test is done using the perf events directly. The second patch in
> > > this patch set has the test application.
> >
> > Then the patchset should still be marked RFC, since it is not finished.
>=20
> Wow! let's all of us post only large series (covering multiple features)
> which are difficult to review instead of making life easier for reviewers
> through incremental series which make gradual progress over-time.

Where did I say don't post it? In fact, marking it RFC *requires*
posting it. Don't put words in my mouth.


--4uVDXKIANR8kRBf5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaAH0wAKCRB4tDGHoIJi
0irUAQD9jzZIENl7Ss7qLQhBYrb+IP2exfxBH958HMUbfJcIPAD/e1PRRrnbojxe
gOrCfktdMAf68Wb1V46UylpoPPVoowE=
=Wn2B
-----END PGP SIGNATURE-----

--4uVDXKIANR8kRBf5--


--===============7346138572288693376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7346138572288693376==--

