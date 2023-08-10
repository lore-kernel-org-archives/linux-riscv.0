Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542C4C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORMIpWN/w4Rfl7hUCdAMHrTFFRuYkV4aqzBBZ9GVcGA=; b=lKVr5Ab2pjCAdbL3XUwVaeljpj
	aD1xlm0ni5Du7QHvqtbCIBFpisvtWARTQ+EUCkbZnUclaxTQ8wm57ICe2CBey1O5GF4QYRAdul6bU
	qE1zLqEwI4FgAY0tHsiUPJiFt/IqCOwiAukuiAOD9i38SQdCN3DpJ8VfyNNtbRL3RoFyW0pKG3TTY
	0vbea338ePahp+B/vQ6pt9poETKCyZh6wDuRJ0EFdZoOLYrz6j84uAxZW7XILfNJK8vZQXTU3HFhr
	oHb+U7wO1AjJaHGNSbmuOYWHgBZ7MS2J5oX/qxDEL7DeYn/o0CUjTEu3QPBU1Tm5oC/fsO/pDUws3
	Ml0XyfXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8A5-0088P0-1a;
	Thu, 10 Aug 2023 16:05:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8A1-0088O5-38;
	Thu, 10 Aug 2023 16:05:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E472866220;
	Thu, 10 Aug 2023 16:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDCAC433CA;
	Thu, 10 Aug 2023 16:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691683516;
	bh=3dqXqxLfF0EBUTIcyGpG0Y9ki6xtjmzbbUkts8u5Ikg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3iKU92fRFQ5ebgkTvsvwFRj8QHGGGfCT7avNetLStA0oCGGNiMdq5s1BU8wM99Wq
	 cpLnFaNt5Y/WyIo/3u3hcU8KPqIxozR1VglUeMDq2sISkdEnj+wwOSJf5AiYhtT/2t
	 SlMvoi2pAG8JQpJHfXVLKoIXBMd/GoSC3dKXIxNGFzZv2lBL0ArZI8WA6y2eAtJcRX
	 2yzhhaPLgupPXHj9POOF9o54cYVHYP/0Hy8nP/kWQ2V3qULt/iXLK2gYREqJTs0WZH
	 k57P/Xu/0fJfpnylthHNhnuqqHv1d5rI1cRLVMcxAkA8mAVUExfN6T2BKpjM/k5CMd
	 yEHBV303fFSGA==
Date: Thu, 10 Aug 2023 17:05:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 00/36] arm64/gcs: Provide support for GCS in userspace
Message-ID: <137de09e-6341-4c97-96ca-116e40c9cb8b@sirena.org.uk>
References: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
 <20230801141319.GC26253@willie-the-truck>
 <09b7a94d-cc88-4372-85de-52db26bc2daf@sirena.org.uk>
 <20230808133857.GC2369@willie-the-truck>
 <f279ec25-e1c7-48e6-bd9d-5c753e829aad@sirena.org.uk>
 <20230810094016.GA5365@willie-the-truck>
MIME-Version: 1.0
In-Reply-To: <20230810094016.GA5365@willie-the-truck>
X-Cookie: Reunite Gondwondaland!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_090518_113340_E1D6BADF 
X-CRM114-Status: GOOD (  46.85  )
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
Content-Type: multipart/mixed; boundary="===============8382663618734392578=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8382663618734392578==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5H6oHgjZfBXx+cAU"
Content-Disposition: inline


--5H6oHgjZfBXx+cAU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 10:40:16AM +0100, Will Deacon wrote:
> On Tue, Aug 08, 2023 at 09:25:11PM +0100, Mark Brown wrote:

> > I'm not sure that your assumption that the only people would would
> > consider deploying this are those who have deployed SCS is a valid one,
> > SCS users are definitely part of the mix but GCS is expected to be much
> > more broadly applicable.  As you say SCS is very invasive, requires a
> > rebuild of everything with different code generated and as Szabolcs
> > outlined has ABI challenges for general distros.  Any code built (or
> > JITed) with anything other than clang is going to require some explicit
> > support to do SCS (eg, the kernel's SCS support does nothing for
> > assembly code) and there's a bunch of runtime support.  It's very much a
> > specialist feature, mainly practical in well controlled somewhat
> > vertical systems - I've not seen any suggestion that general purpose
> > distros are considering using it.

> I've also seen no suggestion that general purpose distros are considering
> GCS -- that's what I'm asking about here, and also saying that we shouldn=
't
> rush in an ABI without confidence that it actually works beyond unit tests
> (although it's great that you wrote selftests!).

It defintely works substantially beyond selftests.  For the actual
distros there's definitely interest out there, gated on upstreaming.

> > In contrast in the case of GCS one of the nice features is that for most
> > code it's very much non-invasive, much less so than things like PAC/BTI
> > and SCS, which means that the audience is much wider than it is for SCS
> > - it's a *much* easier sell for general purpose distros to enable GCS
> > than to enable SCS.

> This sounds compelling, but has anybody tried running significant parts o=
f a
> distribution (e.g. running Debian source package tests, booting Android,
> using a browser, running QEMU) with GCS enabled? I can well imagine
> non-trivial applications violating both assumptions of the architecture a=
nd
> the ABI.

Android is the main full userspace that people have been working with,
we've not run into anything ABI related yet that I'm aware of - there is
one thing that's being chased down but we're fairly confident that is a
bug somewhere rather than the ABI being unsuitable.

> > > If not, why are we bothering? If so, how much of that distribution has
> > > been brought up and how does the "dynamic linker or other startup cod=
e"
> > > decide what to do?

> > There is active interest in the x86 shadow stack support from distros,
> > GCS is a lot earlier on in the process but isn't fundamentally different
> > so it is expected that this will translate.  There is also a chicken and
> > egg thing where upstream support gates a lot of people's interest, what
> > people will consider carrying out of tree is different to what they'll
> > enable.=20

> I'm not saying we should wait until distros are committed, but Arm should
> be able to do that work on a fork, exactly like we did for the arm64
> bringup. We have the fastmodel, so running interesting stuff with GCS
> enabled should be dead easy, no?

Right, this is happening but your pushback seemed to be "why would
anyone even consider deploying this?" rather than "could anyone deploy
this?", tests on forks can help a bit with the first question but your
concern seemed more at the level of even getting people to look at the
work rather than just rejecting it out of hand.

> > The majority of the full distro work at this point is on the x86 side
> > given the hardware availability, we are looking at that within Arm of
> > course.  I'm not aware of any huge blockers we have encountered thus
> > far.

> Ok, so it sounds like you've started something then? How far have you got?

I'd say thus far text mode embedded/server type stuff is looking pretty
good, especially for C stuff - setjmp/longjmp and an unwinder cover a
*lot*.  We do need to do more here, especially GUI stuff, but it's
progressing well thus far.

> While we'd be daft not to look at what the x86 folks are doing, I don't
> think we should rely solely on them to inform the design for arm64 when
> it should be relatively straightforward to prototype the distro work on
> the model. There's also no rush to land the kernel changes given that
> GCS hardware doesn't exist.

Sure, but we're also in the position where there's only been the very
beginnings of kernel review and obviously that's very important too and
there's often really substantial lead times on that, plus the potential
for need for redoing all the testing if there's issues identified.  I'd
hope to at least be able to get to a point where the major concern
people have is testing.  Another goal here is to feed any concerns we do
have into what's happening with x86 and RISC-V so that we have as much
alignment as possible in how this is supposed to work on Linux, that'll
make everyone's life easier.

In terms of timescales given that users with generic distros are a big
part of the expected audience while we're well in advance of where it's
actually going to be used we do need to be mindful of lead times in
getting support into the software users are likely to want to run so
they've got something they can use when they do get hardware.  We don't
need to rush into anything, but we should probably use that time for
careful consideration.

--5H6oHgjZfBXx+cAU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTVCrIACgkQJNaLcl1U
h9BHVwgAgSbEUGUic59Pll+iHR6rMHH93h8r1BQCHM7w3dxRlH4WQAvF84q/FUw2
BvNcZc0s34e1gGq9GO3VlDPB0v1oMiJOjyjZ4V147fI5yH9YpEN93CoddrH+4Q9Z
hN/7EJ0PHxL/eaJM5EKzuAYo3iWQGg1IQRQ4XQugjYa4ID2KHo9OWVXpMTq+swnQ
pgGXC+k61Wjov3YeJwwBcZc8b9Ev2QE0T09jigsR6IRmYS+nD+LQWi2s9Utb7b+v
CE8pnWa10JCf8Or6Pft32TX975ZpuvLHvEoHdRlUHZqpl96Nj5yj9ZFX2q3Efvg1
veMSeRwi5FXGa41z5bay9s/8jeTTMg==
=NmPw
-----END PGP SIGNATURE-----

--5H6oHgjZfBXx+cAU--


--===============8382663618734392578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8382663618734392578==--

