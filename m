Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CBDC48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 13:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fA7wFhV90NVuwgFVqE0aQy8GbH0kk3Vx9MNXRG3Xxo=; b=GP1J092UlWaAslxONae6Jk90qR
	FYeeNatmJZ26pWSEvcFK+s0S2qN2XaqgpU/5VoOGukdd7vxzrPl+HJy+3aFdIqc8AT9uvnvuFtqO2
	r+/NhhUXr0GGEZanhGtF/DwDhT5/e/2L+wUwVKBSFLqFhxIM+V73YFmGyx/1mmLb3MXJ8mmTYyHvB
	2Rk8jCgVOgCh0LRmnpXrJ6PyQyvW0xJQ58Wpkl7/lyFaXyf/oscJv/keJpTVI1tL9bqsuzuT4NvPp
	IUBC79wPb6c9eY/AYk6XUiB9LxaAr4fC/fkbp3W2lGfdcHGY5gcmxfhrSQpuCsMgMjrzT3w/pPsAV
	tfIzg3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9aV-000000058lt-2wIl;
	Thu, 22 Feb 2024 13:58:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9aQ-000000058gu-1n2v;
	Thu, 22 Feb 2024 13:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 88B57CE22DB;
	Thu, 22 Feb 2024 13:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D645C43390;
	Thu, 22 Feb 2024 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708610282;
	bh=qjmPfoVywGfr4jqsh5FJ/yxg8KOM8vjU9JBU7Z2KpR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aanTBA7Q5SU1zTtPDaMhX4nwG1EogaRTB6711DBMiXTmU8FRFzAcB7zQYgcUM2OaJ
	 XHksqp0nMGR665Zm+lDgT+yDropmULnL8lKiWtjJKJ3NL1ecrCmrLU8OR7ZcsowhNV
	 u+zivFcDWQqEkxqOD8K6xYSAKOOwaNrLKqXv3SiHTMwf1JJvLKTjXxiKAVOfTIyX6A
	 QW2bcztZSCAVxYQoLX8XBJuGKkKkAorTgEuxggq4WcuU6lezBNTj3BInSRIVEXBTih
	 tlOZte74whZIn/QZQ00VCk0r89EM0A76cAGvXtNTTd6uAX30BQpy9H3OHFzXJG137X
	 8lNOIn1prx5Vg==
Date: Thu, 22 Feb 2024 13:57:53 +0000
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "dalias@libc.org" <dalias@libc.org>,
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
Message-ID: <c2426b69-5411-45fe-851a-219e1f4f9d3b@sirena.org.uk>
References: <20240221012736.GQ4163@brightrain.aerifal.cx>
 <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
 <20240221145800.GR4163@brightrain.aerifal.cx>
 <4a3809e8-61b2-4341-a868-292ba6e64e8a@sirena.org.uk>
 <20240221175717.GS4163@brightrain.aerifal.cx>
 <f4a54297767eb098d903404cbe8860d655d79bed.camel@intel.com>
 <20240221183055.GT4163@brightrain.aerifal.cx>
 <c3085fbe10193dfe59b25bc7da776e60779b0e8c.camel@intel.com>
 <20240221190639.GU4163@brightrain.aerifal.cx>
 <e3a432c0fa9f5fe837e9d2fc7b36304709a34428.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <e3a432c0fa9f5fe837e9d2fc7b36304709a34428.camel@intel.com>
X-Cookie: I have accepted Provolone into my life!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_055806_851627_66924CB4 
X-CRM114-Status: GOOD (  19.20  )
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
Content-Type: multipart/mixed; boundary="===============8241318425168725874=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8241318425168725874==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y7x2ZPCVf8cy8GEb"
Content-Disposition: inline


--Y7x2ZPCVf8cy8GEb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 21, 2024 at 07:22:21PM +0000, Edgecombe, Rick P wrote:
> On Wed, 2024-02-21 at 14:06 -0500, dalias@libc.org wrote:

> > It's fine to turn RDSSP into an actual emulated read of the SSP, or
> > at
> > least an emulated load of zero so that uninitialized data is not left
> > in the target register.

> We can't intercept RDSSP, but it becomes a NOP by default. (disclaimer
> x86-only knowledge).

For arm64 we have a separate control GCSCRE0_EL1.nTR for access to
GCSPR_EL0 (our SSP equivalent) we can use.

> > I have not looked at all the instructions that become #UD but I
> > suspect they all have reasonable trivial ways to implement a
> > "disabled" version of them that userspace can act upon reasonably.

> This would have to be thought through functionally and performance
> wise. I'm not opposed if can come up with a fully fleshed out plan. How
> serious are you in pursuing musl support, if we had something like
> this?

Same here, we have to be careful since it's defining ABI in a way that
we don't normally provide ABI but if there's a clear case for doing it
then...

--Y7x2ZPCVf8cy8GEb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXXUuAACgkQJNaLcl1U
h9CWhgf9ENKHpmQFWkFp9BvnSQpoqzt8GvTsea21+X/Sj2LF1t9awlhI1ZonFcLg
kiWOH7voRFXaX11HTooF+5zW0lljzQzeKy6a4cAqvyhV93pQz5U7Tzuk5xqkLe3o
mtXBUEWVIO/JPNSAwHNb44hXL7AjS1MEYgj0iqYvqWCYqikKit3kjOjJrc3jdb4y
3NQgra/qAykoQji1F3ZFkEtRyHALvMWET9TzzVyrCoTYPzIRzCWnkkBxKsNMokGC
nwxW+cuoESrLNygNc/V3CbbUqAYkdO7AbmSvBvzQ0pboXO5M+p4sPnapddZeoYiK
JVmWfU7+hu6JUz1Bj5tBIoRL24Q7Og==
=mhhY
-----END PGP SIGNATURE-----

--Y7x2ZPCVf8cy8GEb--


--===============8241318425168725874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8241318425168725874==--

