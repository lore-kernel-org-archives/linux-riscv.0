Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F1CC36011
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 14:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niID8yOXJ3gdYivJszZtLRLjC9JEw50h3DH1DGmVrpE=; b=k0HNdTdT1rW8nFVoGt5pMa5Tbe
	C6UAUBd69x7U6FnVAkWbZNaJ8A7hbhsv8WsAPVFSfdDyXylW6e48BrPo/eDbK2bNg++/wAJeACxUu
	+UfGCHPUfBzOZlNDrYAcvbrQx4BZtBejpwdV0zpPF6JSU2UrqprActotGQoQe2GQx15B/Na67iDwD
	BMYz4vAylLoAsQtmyNFjHU9UZfYAOh6KzQgcBA1OpQQ8mE5OeeyzS8wMknz1WxGttySQeAqRFFt4B
	NP62CojJOlThudcTj/Ngi9aq0hntF0HjtuXmsfCOcoRRfdKB/+iy14B8OAj61yQtYtqLhGNc9Zn1A
	UFxUBnkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyB8S-0000000DfYO-2hI5;
	Fri, 28 Mar 2025 14:56:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAZg-0000000DZpy-33Tg;
	Fri, 28 Mar 2025 14:20:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4050543803;
	Fri, 28 Mar 2025 14:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DECC4CEE4;
	Fri, 28 Mar 2025 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743171643;
	bh=52BY8RWxqGI39nW50Uzq7mTE1cOGjvlmsJ2EgrcA9Ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IaOtsJF9a/s3cBIUbR9Tqvn77dZbDpoeNbSKE+9o5W+xe5prQl6V2XimIGQqSPRYd
	 5VfjWfPhjXQLQfEz78hahUx8cEJL7qeI4fFnehitos4eSBhlzGDfRRklcoYjvM/zc3
	 wbOkObSERHHtODK1mOYAW8F2H76k54tegqVkAAw/dIGbiwRQ5/s/wDw9UA3HpXwpf8
	 0B2Nl82gf//PCjWjulAvtdo/KBcAQt6O9NX5qL98eSrWMUgTqOVgFni+sgSnln2Z/C
	 cQUX/fNo/MyENG5iKFB3pgZGXINNHdL08ZXVTjV4NCT5SQEjBauHzWcBKsahMmFGDS
	 lPH6H7hIUumIA==
Date: Fri, 28 Mar 2025 15:20:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Kees Cook <kees@kernel.org>, 
	Alessandro Carminati <acarmina@redhat.com>, linux-kselftest@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
	Arthur Grillo <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Guenter Roeck <linux@roeck-us.net>, Alessandro Carminati <alessandro.carminati@gmail.com>, 
	Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-ID: <20250328-visionary-archetypal-caiman-77dedc@houat>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <202503131016.5DCEAEC945@keescook>
 <20250313-abiding-vivid-robin-159dfa@houat>
 <20250328.sah9oog5ahSh@digikod.net>
MIME-Version: 1.0
In-Reply-To: <20250328.sah9oog5ahSh@digikod.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_072044_867077_D7775022 
X-CRM114-Status: GOOD (  24.18  )
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
Content-Type: multipart/mixed; boundary="===============7683924712966710341=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7683924712966710341==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="paxtxmnckc7vplgu"
Content-Disposition: inline


--paxtxmnckc7vplgu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
MIME-Version: 1.0

On Fri, Mar 28, 2025 at 11:38:23AM +0100, Micka=EBl Sala=FCn wrote:
> On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Mar 13, 2025 at 10:17:49AM -0700, Kees Cook wrote:
> > > On Thu, Mar 13, 2025 at 11:43:15AM +0000, Alessandro Carminati wrote:
> > > > Some unit tests intentionally trigger warning backtraces by passing=
 bad
> > > > parameters to kernel API functions. Such unit tests typically check=
 the
> > > > return value from such calls, not the existence of the warning back=
trace.
> > >=20
> > > Thanks for picking this series back up! I honestly thought this had
> > > already landed. :)
> > >=20
> > > > With CONFIG_KUNIT enabled, image size increase with this series app=
lied is
> > > > approximately 1%. The image size increase (and with it the function=
ality
> > > > introduced by this series) can be avoided by disabling
> > > > CONFIG_KUNIT_SUPPRESS_BACKTRACE.
> > >=20
> > > Yeah, as with my prior review, I'm a fan of this. It makes a bunch of=
 my
> > > very noisy tests much easier to deal with.
> >=20
> > And for the record, we're also affected by this in DRM and would very
> > much like to get it merged in one shape or another.
>=20
> Here is another case:
> https://lore.kernel.org/all/20250328.Ahc0thi6CaiJ@digikod.net/
>=20
> It would be very useful to have this feature merged.  Without it, we may
> need to remove useful tests.

AFAIK, it's been merged in next a couple of weeks ago, so it should be
in 6.15.

Maxime

--paxtxmnckc7vplgu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+awOAAKCRDj7w1vZxhR
xbs6AP9BZSaotqaSUmBTtc4k3Uj9az+ck0f+76K8QNHFnxjslgD/XFEDSUboHQ6N
QI2urzu11I1VyDIFnSJoU7c57HPzZQ0=
=XSrM
-----END PGP SIGNATURE-----

--paxtxmnckc7vplgu--


--===============7683924712966710341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7683924712966710341==--

