Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8063DC001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 08:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kv8is8yQEL0lcN/5wiZYzzhABpWuNrY7AGeHAOnJy9c=; b=SjzkW4QGhxyfwu3Ncav/NbzWon
	nu7e9pBT1ypQQIQiT+uXvKIgKgFKACenHl5nXtRSlhPw/I6VZsGfunUcUZD0mzSekce/QbV7EH3cc
	YNRxfaRD8/djfgU6mgH2cadFbctHgT61mJdYrcG0p+PGBD0zkOi/+jylMULQRrlFSinKVn9SV//iB
	hW5axSINWYkB8U2dqmgFf5x/229hxIEIhWgBuR1k1R+DMUwdmbEWlJYI16ez5XW7gQCrB3F4CMpfY
	4jbfI8x0Ks6JVKzjRGbrGqbGAQqqEd/JKA2p97eL+vvbzli3NN/0flcB9jGoy6WE00Ew6kVfYIdkf
	hZ83VtUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2f0-006Oap-0O;
	Wed, 19 Jul 2023 08:35:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2ey-006OZV-0b;
	Wed, 19 Jul 2023 08:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=530e7OPCMZ/z+1qv3pvHEOo/j6Qsz1yU3WxgaPojYZ0=; b=jyLPnxfsyBzCFIH/OBALC7saPm
	v96uKm40Gm5p8sepT/k/kW3Ncmf8Fuj3+yNLdI7aaNz/BFGCD1ROJ1BdyxgoyUZWwljPeVtX/kD5j
	jU81c9my0wrGte1tQyPXTCPJhJn7NOjRxwNXkbIk9S4E/avQr7x+lMe9+axObfEXhUS7ux9oP2hut
	80wnIy+3JcalIrDVf1vQx418VjJISMtjk76xRtXG0g1F3wV5+5NK11M5UD/5vqR5EzRZsPLJck5Af
	JSUApiv38IdcGI0Ee4ISjr54s8XdAQ7oSL78EZjuwMs+VJ0XiKjt2mc9efnsz81PwFss6gIS3IaaK
	3X3iyfyg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLqVl-00BwPw-1F;
	Tue, 18 Jul 2023 19:37:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A40260B45;
	Tue, 18 Jul 2023 19:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F4AC433C7;
	Tue, 18 Jul 2023 19:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689709043;
	bh=ZxtPv1D0nptmBko9s7OKhZDvD31woHBZFfU7oYY10b8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HMLY8kCEqG0wMS07BdWto8m0clJr2/78xvRh1w9dZf9yG8l29QftXXKHFF55EFsz3
	 rMx0ONDAp3wXEMIlVWX54Q8iMQycKnWpkwPHNUgvAd6rMgpv3P0Yoj8MIFKE/aOJ6F
	 LRmzXHn9sUf5TWmvjnegDi3yttbTb0Zz6AagJoP4t5CylB1YdgUOjZPrtgkqdRnacp
	 g4lHW0S/qAk6zPJYXKsgsuJglyVgIy3O5bIBW60emia1334fKYVwDNILv497vXIGse
	 MTMybqf0Swz27NUZmnrkgdv5Kv9IGHQvU3SGj3GplW2cBlx4sxBs/AzGXS1s65Y7jR
	 vKNy338gfsWYg==
Date: Tue, 18 Jul 2023 20:37:14 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "ardb@kernel.org" <ardb@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"will@kernel.org" <will@kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>
Subject: Re: [PATCH 21/35] arm64/gcs: Implement shadow stack prctl() interface
Message-ID: <22a53782-7c8b-409e-92b5-ce89e2a86e2d@sirena.org.uk>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
 <20230716-arm64-gcs-v1-21-bf567f93bba6@kernel.org>
 <2e1c24e343fb920e1f8616e083bba625717c384d.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <2e1c24e343fb920e1f8616e083bba625717c384d.camel@intel.com>
X-Cookie: Nothing happens.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_203729_924018_2ECB9BB8 
X-CRM114-Status: GOOD (  14.92  )
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
Content-Type: multipart/mixed; boundary="===============3234055001285327071=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3234055001285327071==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+LcC9ieUsmFeoYzA"
Content-Disposition: inline


--+LcC9ieUsmFeoYzA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 05:51:54PM +0000, Edgecombe, Rick P wrote:
> On Sun, 2023-07-16 at 22:51 +0100, Mark Brown wrote:

> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0g=
cs =3D alloc_gcs(task->thread.gcspr_el0, size,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00, 0);
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0i=
f (!gcs)
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0return -ENOMEM;

> > +=A0=A0=A0=A0=A0=A0=A0task->thread.gcs_el0_mode =3D arg;
> > +=A0=A0=A0=A0=A0=A0=A0if (task =3D=3D current)
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0gcs_set_el0_mode(task);
> > +

> Ah! So does this task =3D=3D current part mean this can be called from
> another task via ptrace?

Ugh, right.  So I had been worried about preemption rather than invoking
prctl() via ptrace, though since ptrace can change the syscall invoked
by a task it could cause prctl() to be invoked that way (but that should
look like being run in the target process).

I'm not aware of an interface specifically intended to remotely invoke
prctls via ptrace but that doesn't mean there isn't one that I didn't
find yet.  I can't remember why I'm aware of the task !=3D current case as
a concern which is worrying me.

> If so, then is the alloc_gcs() part on the wrong mm?

Yes, it will be.  I'll add a check in there to reject attempts to enable
GCS when task !=3D current.

--+LcC9ieUsmFeoYzA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS26eoACgkQJNaLcl1U
h9CYygf+IDDkv7ACSKD5nM6hnqcKIlhFl4zq3viBlcIX0vXYzPVupOCAbCarTXX9
8ONJZvPpTQjznNjMcmvWut8WU+hWOW/UvsbtftxjLJRyoioHPqwZHy7KVVYYWUwv
FIGO+d+5I7UpABBVNJsdHFSGthvOxBPGzFMNqyi/0wO8rtRAlfdg+cmMkGgpxoel
HEC4D5W7U+X5BEs1wnPKZZuvTvt5hbqeLbY4VSyKqfqjryTxnqebHLo5RzW3PKdH
ZDcn47+rFqdw4kMF7gsLWp++R3fZXCO5PRO6B+Ok6A12Hh3ICV+MbVPdeDrzhfiw
s1AEnkG+S/KEme6d6O1scSv5RQymhg==
=hLC+
-----END PGP SIGNATURE-----

--+LcC9ieUsmFeoYzA--


--===============3234055001285327071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3234055001285327071==--

