Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2263C48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 00:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czWryz/XHQBBVCuhiPa6RJheeIeGzIyp/VQ5cC/y7r8=; b=AvHS5U20EgB9YgChEPjt1Kz5+r
	f3E+ei421QbxPNtq419PUNsdofTeaaysUliBY0D05Os2RrP62JvlyiffY1PQpgIOAMkf70ZAuDVm7
	Oa35OqpnXKuzsZDzjtajDq4pW+latzcYjK5VGXyKIkiqcVNg1omig7rMlSZEaRwZ0leW4xmmsOYE4
	3SgXH0f7TEidKCnb0/JnM889rYWCgC0W4DG1QlqudPjJdTbCLT9Ysm0rd7MWop/QfpqSBMKXLTgqM
	yljstC9pKRzeA5urXmUryfV8fyEFBPjfVj8MR3XxIg45kjrDNlJfuUW0uk6qahBZd260yfYVuDkDu
	8/44AKcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcaf0-0000000GeRj-1hSv;
	Wed, 21 Feb 2024 00:40:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcaew-0000000GeQP-2jGV;
	Wed, 21 Feb 2024 00:40:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E27BF6131F;
	Wed, 21 Feb 2024 00:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD31C433F1;
	Wed, 21 Feb 2024 00:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708476025;
	bh=4oc1pZky5HkjCTR+BuVavdWJx7t0uS02Mzr1ZCWHjCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VXXGDS8ThunN70a0rYLJLDyy89pGrp2M3fSV0kNxp/p/8CGEClIOL4nl+ZzbTjuIV
	 8V6uBESKVIYNjOAaa8Uo/S6TiQUo9smlP+Yw+uyKF1sXBB96kRwPAL6dnJjedxyo6k
	 4qbYaZ9JN4f9mZjp3cNgSl3cbBK9AnbdforPZw6T9Sb2nChqCEt0AgeAAASchO8E6a
	 ez7o0m5s5o/RTEFvNxASj/1hCwyW75ZRt4zTttSENFrinE4aZ9eLNeLRP+SphzQMF6
	 qqBsMn6ugGGsgIJzoiO9Uxo6EPe3R7ANKhZYz08gVHsrHyerm0ZL7k0trACQOzI77b
	 d6YNu+2OHW7dQ==
Date: Wed, 21 Feb 2024 00:40:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Stefan O'Rear <sorear@fastmail.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>,
	Rich Felker <dalias@libc.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"musl@lists.openwall.com" <musl@lists.openwall.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	Oliver Upton <oliver.upton@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>, debug <debug@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"shuah@kernel.org" <shuah@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>,
	"oleg@redhat.com" <oleg@redhat.com>,
	Florian Weimer <fweimer@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	James Morse <james.morse@arm.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Will Deacon <will@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS
 in userspace
Message-ID: <4be8dc73-4873-44e5-8ef6-62e55d5023a7@sirena.org.uk>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <22a53b78-10d7-4a5a-a01e-b2f3a8c22e94@app.fastmail.com>
 <4c7bdf8fde9cc45174f10b9221fa58ffb450b755.camel@intel.com>
 <20240220185714.GO4163@brightrain.aerifal.cx>
 <9fc9c45ff6e14df80ad023e66ff7a978bd4ec91c.camel@intel.com>
 <063acc75-ea1d-4dd3-aecb-e5c8884005db@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <063acc75-ea1d-4dd3-aecb-e5c8884005db@app.fastmail.com>
X-Cookie: E = MC ** 2 +- 3db
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_164026_799604_92D4742F 
X-CRM114-Status: GOOD (  29.43  )
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
Content-Type: multipart/mixed; boundary="===============5476824188163400484=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5476824188163400484==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EBD7P8ZrkhP4e0ph"
Content-Disposition: inline


--EBD7P8ZrkhP4e0ph
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 20, 2024 at 06:59:58PM -0500, Stefan O'Rear wrote:
> On Tue, Feb 20, 2024, at 6:30 PM, Edgecombe, Rick P wrote:

> > Maybe I'm misunderstanding. I thought the proposal included allowing
> > shadow stack access to convert normal address ranges to shadow stack,
> > and normal writes to convert shadow stack to normal.

> Ideally for riscv only writes would cause conversion, an incssp underflow
> which performs shadow stack reads would be able to fault early.

> For arm, since a syscall is needed anyway to set up the token in a new
> shadow stack region, it would make sense for conversion from non-shadow
> to shadow usage to never be automatic.

Well, we only need the token to pivot in userspace so we could
*potentially* work something out as part of the conversion process.
It's not filling me with enthusiasm though, and I've certainly not
actually thought it through yet.

> > I agree though that the late allocation failures are not great. Mark is
> > working on clone3 support which should allow moving the shadow stack
> > allocation to happen in userspace with the normal stack. Even for riscv
> > though, doesn't it need to update a new register in stack switching?

> > BTW, x86 shadow stack has a mode where the shadow stack is writable
> > with a special instruction (WRSS). It enables the SSP to be set
> > arbitrarily by writing restore tokens. We discussed this as an option
> > to make the existing longjmp() and signal stuff work more transparently
> > for glibc.

We have this feature on arm64 too, plus a separately controllable push
instruction (though that's less useful here).

> > BTW, when I talk about "not supporting" I don't mean the app should
> > crash. I mean it should instead run normally, just without shadow stack
> > enabled. Not sure if that was clear. Since shadow stack is not
> > essential for an application to function, it is only security hardening
> > on top.

> I appreciate that.  How far can we go in that direction?  If we can
> automatically disable shadow stacks on any call to makecontext, sigaltstack,
> or pthread_attr_setstack without causing other threads to crash if they were
> in the middle of shadow stack maintenance we can probably simplify this
> proposal, although I need to think more about what's possible.

Aside from concerns about disabling over all the threads in the process
(which should be solvable if annoying) this would be incompatible with
policies which prevent disabling of shadow stacks, and it feels like it
might end up being a gadget people could use which will concern some
people.  There's a tension here between compatibility and the security
applications of these features.

--EBD7P8ZrkhP4e0ph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXVRm8ACgkQJNaLcl1U
h9C3fgf/Vl3KFlMHtkZvrz9cGvE2TbC0mqrxMOeapZww/WMKCmIqHtFjSPzmQOKB
im3jrrFwQk29IabWprHeQo3+DYZFyMTugJwwJEv4rd++VT8MzDo90LzRjpj4WVzS
aCfx0m/xEicqx9wCP0hcygDCzrktn/MTm4+/b7fTIzhDobIOvheS2/tRMwq7x8HD
DTzVsfLNoau1eSLjxdfkFA+/rAkUuoNVqjDs33Sxiw9mBtoi0jNLc07YvZQm8u27
ijTimNGyEbckTAafaHEd86bwPjHRaiCTEsF4PP55m/lZrpYKjeSDVJw6H6skSvmm
ubMgYOa5diXQA6KCtKkjvhptV/C+oQ==
=FQI7
-----END PGP SIGNATURE-----

--EBD7P8ZrkhP4e0ph--


--===============5476824188163400484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5476824188163400484==--

