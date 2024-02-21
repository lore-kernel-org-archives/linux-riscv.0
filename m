Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA6BC48BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 17:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccO8uX+qrLoxfku8lbhDgplF6mZdo5MeyIC1kcmPa6w=; b=fTAVJB9yzB2kjzXWT2Cu+H0/Bf
	xq0hwVGOnjtemS7YP+ynRy+SAtN9+CfIEPcA5jF5KV3yX70pekPNtEw2XCaoYXUCyYJrrGKHolVm1
	0+B2v1ZSOERxOePAQmKL/9e5ZjK8B3vIhSZlDKpGzX7ghxIpB06qsrz+OB42cZZYMuP6AeDkuTG3Z
	Ul6mD0ccSF7Lp1m17D2wixwC6jJTatrKFT31seneC5Q7vW7KLPG+dz+cEIy4F7tuAloD81pM69OOT
	SwTEexwijYm4VlxWVkkgi3T9JJrGbMv1itKiHarY3L7OE0w2VZTSETMDxV0x2/vN3RM8fOq/cZ7T4
	gzK0V7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcqWD-00000001wem-0ci5;
	Wed, 21 Feb 2024 17:36:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcqW8-00000001wcu-2eZW;
	Wed, 21 Feb 2024 17:36:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E04F161587;
	Wed, 21 Feb 2024 17:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 569D2C433F1;
	Wed, 21 Feb 2024 17:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708536983;
	bh=yiMUcDHHU5n4NoQ84wGw656HnuqVIwBmqSIpUYSySM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O12n148tnxl0hHrH0KNUw308nap2CMfsjiJaCO+G6etl5udAA3V57bqbWZBFQUGZs
	 Kj4x4GxnB2NHbhBuzMjO33ReX0o4unLwDVUsx7rE6BrK0mSY+AQVi1U20errE3mUk7
	 nVTIbjx7vjPf0I68CWxX1fA4b1OFc0RyrKyDq5swD9NlwBDQWruvA/i+WNXsvWkpRM
	 uYyCW+odtKyrAny0HBpdXJaxNnNh93OFpmEFT500VAoVKZsfjMLpKQM8nF17WmQNVZ
	 f7b+uqFxyhSA53z6Utjz7HKlp+QYfzdvrhQRfPQSg/ENFM+J0kh3Y5lihL5FmDHnX1
	 07XkRuq4u5RdA==
Date: Wed, 21 Feb 2024 17:36:12 +0000
From: Mark Brown <broonie@kernel.org>
To: "dalias@libc.org" <dalias@libc.org>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"musl@lists.openwall.com" <musl@lists.openwall.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>, "maz@kernel.org" <maz@kernel.org>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"will@kernel.org" <will@kernel.org>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"thiago.bauermann@linaro.org" <thiago.bauermann@linaro.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"sorear@fastmail.com" <sorear@fastmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS
 in userspace
Message-ID: <4a3809e8-61b2-4341-a868-292ba6e64e8a@sirena.org.uk>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <22a53b78-10d7-4a5a-a01e-b2f3a8c22e94@app.fastmail.com>
 <4c7bdf8fde9cc45174f10b9221fa58ffb450b755.camel@intel.com>
 <20240220185714.GO4163@brightrain.aerifal.cx>
 <9fc9c45ff6e14df80ad023e66ff7a978bd4ec91c.camel@intel.com>
 <20240220235415.GP4163@brightrain.aerifal.cx>
 <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
 <20240221012736.GQ4163@brightrain.aerifal.cx>
 <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
 <20240221145800.GR4163@brightrain.aerifal.cx>
MIME-Version: 1.0
In-Reply-To: <20240221145800.GR4163@brightrain.aerifal.cx>
X-Cookie: The second best policy is dishonesty.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_093624_792828_D055ECA1 
X-CRM114-Status: GOOD (  24.94  )
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
Content-Type: multipart/mixed; boundary="===============7380138926304465497=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7380138926304465497==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SXzKVr6cSzokmvVK"
Content-Disposition: inline


--SXzKVr6cSzokmvVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 21, 2024 at 09:58:01AM -0500, dalias@libc.org wrote:
> On Wed, Feb 21, 2024 at 01:53:10PM +0000, Mark Brown wrote:
> > On Tue, Feb 20, 2024 at 08:27:37PM -0500, dalias@libc.org wrote:
> > > On Wed, Feb 21, 2024 at 12:35:48AM +0000, Edgecombe, Rick P wrote:

> > > > (INCSSP, RSTORSSP, etc). These are a collection of instructions that
> > > > allow limited control of the SSP. When shadow stack gets disabled,
> > > > these suddenly turn into #UD generating instructions. So any other
> > > > threads executing those instructions when shadow stack got disabled
> > > > would be in for a nasty surprise.

> > > This is the kernel's problem if that's happening. It should be
> > > trapping these and returning immediately like a NOP if shadow stack
> > > has been disabled, not generating SIGILL.

> > I'm not sure that's going to work out well, all it takes is some code
> > that's looking at the shadow stack and expecting something to happen as
> > a result of the instructions it's executing and we run into trouble.  A

> I said NOP but there's no reason it strictly needs to be a NOP. It
> could instead do something reasonable to convey the state of racing
> with shadow stack being disabled.

This feels like it's getting complicated and I fear it may be an uphill
struggle to get such code merged, at least for arm64.  My instinct is
that it's going to be much more robust and generally tractable to let
things run to some suitable synchronisation point and then disable
there, but if we're going to do that then userspace can hopefully
arrange to do the disabling itself through the standard disable
interface anyway.  Presumably it'll want to notice things being disabled
at some point anyway?  TBH that's been how all the prior proposals for
process wide disable I've seen were done.

--SXzKVr6cSzokmvVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXWNIwACgkQJNaLcl1U
h9CDBQf/b2osUy8IL9ugqihJXvxZdZ2gjHyphrXKAEbbUT4oT2dVS/P4nlvlYurY
9IML2O8yTSshh0R+WaZCQ28PqhVENeRSLmgsuSIDiSrLY66okGApL4XVaAWAek2d
KvQ3CU5OkGfGONdHJpiaDdcQbFBuEvUq258Kv+jUJnTKUnmFIjGeM1SIZzQMbrUH
6cXrpAA0Pqc5yrwYFzYxky0ZScQRgr1RQMV43e7IbCtfGnFfbvevfzgWwzZINjf9
kjz8RcfyhXuAoW1sAaXsPz49nL0NGr4l5riEdr3SmDYyvhJ5LEpDnFtANzD4lD3E
cZMNKqJyog/SgaLaqh6dMTlV5Qd9gw==
=pmML
-----END PGP SIGNATURE-----

--SXzKVr6cSzokmvVK--


--===============7380138926304465497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7380138926304465497==--

