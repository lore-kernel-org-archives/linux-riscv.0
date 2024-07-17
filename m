Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5951C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 15:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pigb2CtQUs3lDUwzXMLxsLaAaeVM98KRnLVL5BQOqBk=; b=kgIOVUJYeQ80pgJsinGRDCYfUH
	xOIqDAt1Ae7Pq+9eT+wNYOFxK+15CRx3e8xB7SVIKNXHY3DJhIppu4hrOH3ox2nF9WDh81Q6AVlIo
	gphaBoOQeMp1eDa17tKhiDZe1HL0sfTlGD6wP5K2woEx9PFvwcxYIoPZjQLPabsvNd0axnbo0aB9z
	fLhGsGswLVLz0QR6ga+lv5Os6MsrfJRyDvRnkCjUJCjI35XZIkyov37XcjoI+YmsV4exT+aicc1nN
	ZTpMjmvUtzifLNFzRacwkDJAX9gJ0b0AFIFfOuYv1aqwMFJdesLG7d/HyG89XbuAxcBE2a+wDmKgu
	pS72UWuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU6b8-0000000ECwS-2sbu;
	Wed, 17 Jul 2024 15:29:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU6an-0000000ECrj-1uI6;
	Wed, 17 Jul 2024 15:29:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D3E73CE17E0;
	Wed, 17 Jul 2024 15:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4EEC4AF11;
	Wed, 17 Jul 2024 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721230117;
	bh=ukWBWdiCV90bf+K1lUELQn/UyLGZdA/ugOA19ZyBXHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3PIF9noxw/EmK0iQ64CIvMRoQtkUSZm+1XevS7zxoStKg5JQPXHJlg8IU5RJZpcr
	 kkF2HbTJe+ClHj3+rZQDKaKK2Cy4VcJvwK2A40VhLza++TNBmeFKpxsYozVv1V+RJd
	 BeHJUyzEuN47tHZ6V6NszSlSMSW94Va2/HjvLsAeMB6t5uPrWosA0FKDJ+PlgEaZog
	 3KzdUg9k+Nx1gMZjK7jl1xM1jAOpM3bo5Qp47w2Q9KaDwUpZns+jwrGfVa+4n+Wi50
	 DUlk9Lud/2N6I51hkdkPMdV+XmlL1vfq4/oVWxBdhChNqFtoGDJReknBht7B/a4Tbe
	 Y1QWQ/qq+FoyA==
Date: Wed, 17 Jul 2024 16:28:27 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "fweimer@redhat.com" <fweimer@redhat.com>,
	"sroettger@google.com" <sroettger@google.com>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"ross.burton@arm.com" <ross.burton@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"Schimpe, Christina" <christina.schimpe@intel.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"kees@kernel.org" <kees@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>, "maz@kernel.org" <maz@kernel.org>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"thiago.bauermann@linaro.org" <thiago.bauermann@linaro.org>,
	"Pandey, Sunil K" <sunil.k.pandey@intel.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"will@kernel.org" <will@kernel.org>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v9 05/39] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <dbc210a3-7653-444a-9dcc-b8d4ea92bd9b@sirena.org.uk>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
 <20240625-arm64-gcs-v9-5-0f634469b8f0@kernel.org>
 <87a5iph6u2.fsf@oldenburg.str.redhat.com>
 <Zo7SdDT_cBp6uXgT@finisterre.sirena.org.uk>
 <2fb80876e286b4db8f9ef36bcce04bbf02af0de2.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <2fb80876e286b4db8f9ef36bcce04bbf02af0de2.camel@intel.com>
X-Cookie: You should go home.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_082921_867928_B25BE678 
X-CRM114-Status: GOOD (  28.37  )
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
Content-Type: multipart/mixed; boundary="===============7458264680808584823=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7458264680808584823==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h9KvXQkczWY3GIVF"
Content-Disposition: inline


--h9KvXQkczWY3GIVF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 06:50:12PM +0000, Edgecombe, Rick P wrote:
> On Wed, 2024-07-10 at 19:27 +0100, Mark Brown wrote:
> > On Wed, Jul 10, 2024 at 12:36:21PM +0200, Florian Weimer wrote:

> > > We also have a gap on x86-64 for backtrace generation because the
> > > interrupted instruction address does not end up on the shadow stack.
> > > This address is potentially quite interesting for backtrace generatio=
n.
> > > I assume it's currently missing because the kernel does not resume
> > > execution using a regular return instruction.=A0 It would be really u=
seful
> > > if it could be pushed to the shadow stack, or recoverable from the
> > > shadow stack in some other way (e.g., the address of the signal conte=
xt
> > > could be pushed instead).=A0 That would need some form of marker as w=
ell.

> > Right, we'd have to manually consume any extra address we put on the
> > GCS.=A0 I'm not seeing any gagetisation issues with writing an extra va=
lue
> > there that isn't a valid stack cap at the minute but I'll need to think
> > it through properly - don't know if anyone else has thoughts here?

> Shadow stack has one main usage (security) and another less proven, but
> interesting usage for backtracing.=A0I'm wary of adding things to the sha=
dow stack
> as they come up in an ad-hoc fashion, especially for the fuzzier usage.=
=A0Do you
> have a handle on everything the tracing usage would need?

Yeah, the current instruction pointer seems fairly straightforward to
idiomatically fit in there but going beyond that gets tricker.

> But besides that I've wondered if there could be a security benefit to ad=
ding
> some fields of the sigframe (RIP being the prime one) to the shadow stack=
, or a
> cryptographic hash of the sigframe.

One trick with trying to actually validate anything extra we put in
there from the sigframe would be that one of the things a signal handler
can do is modify the signal context - for the specific case of RIP
that'd be an issue for rseq for example.

--h9KvXQkczWY3GIVF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaX4xoACgkQJNaLcl1U
h9Cgxwf9EtoH1wDADGEHB812knHuhpaXQ+HApRHTVo5CjSDf2jXeTXGAeof7B8TM
MLHNoO3uezt5r1bpHpC7gAruLzfAEs+G+rahhQswSuEDDGQLhcZga0SHFL2cmZpM
SZ2Lk3725bJaoUzexEHk/8ZjpXnrzWXi+U/YoTi9PfcX6bUfVufG0hPr/xR8836n
kKF9q2R93WTz8gIiIHpuUqgQ7jRjrDW5UIi0KhRobcLRKBhL5aYVQ1T9GVgwjA4v
7R3dDdrlAWQLJcjwjciJ3Ti6xSB2evfDt2FjmDE23My2AkO7dJebKhz7fABWCRbZ
f2X9PmkSZlUHX26EuZIME4o9ENxnWg==
=HySw
-----END PGP SIGNATURE-----

--h9KvXQkczWY3GIVF--


--===============7458264680808584823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7458264680808584823==--

