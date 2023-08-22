Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CB2EE4993
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 17:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+I9dsZ9tic1bdpn94UIIxPbIHKKOuFgaWwYMn0GSZ0=; b=WgTziBhrcgafv7SAs3li/vmdiJ
	9rskm+zUCLsAnkAWRaF0uivvvOUPmDcmzO+oW/yHGzjOLJ88++3O1/tJ0/44EnrLuUIpe7pDPGWp4
	wfYvhzPi7W3GfKhSyGO5XO3ejytTmheHdSo1JRNW8TE6NWhnGlbPPNnxUqmguIDkMs0qjrn70xnvV
	aSYuGzIGslwwunV40v0I54+xRzef17Fbg5FS1SrI+AoRtdJBDD4h+JseaEcOoociGDIcZj74YQo6U
	nGjCXcq2/uZVCQcCaKolT5SqFnbcDsT6Xrt1iuWEFT334hLOxBtxIXS5WUXZzZbBukZWbFnB+KMdy
	+Fxg9GZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUlC-00GYAH-06;
	Tue, 22 Aug 2023 17:01:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUl5-00GY7R-2j;
	Tue, 22 Aug 2023 17:01:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0B18C6228D;
	Tue, 22 Aug 2023 17:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E4BC433C7;
	Tue, 22 Aug 2023 17:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692723694;
	bh=4CwJzH4TL2Y8EXaFoTYYQXYVEx5uhhyOhGKEBL5M5a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwIELk0L965ZZxRQU/I6AfIxI41pPfoJ/8ilmpqMMDxttWnkizigjluGn+Ari53wx
	 MqNyiNJuURRYl2rCuLNJJ2Cs85l4nwq7Q2vWycN3a3XFaBaWvpt/KvtYd4TWJtE93y
	 2mhcqEGqeiz2SkybCYJmTOdlsX5/UNDCZXZ+F5YxZ6vS1R+LOWxtY7m0pc+kMGPPlJ
	 kPp/83wuyHdo3Irho6uo8xb6TPcAKTt8iUzDXu8bbnYEB9weodOZjJ9UCKfJORCNeV
	 gnjnzeyg+Tps+7sTo22OVIrcM6LgodrBWVlbjMG9YcUoS05XXyscb+z/gcliAOGlOk
	 ceFShSQCdJEsg==
Date: Tue, 22 Aug 2023 18:01:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH v4 18/36] arm64/gcs: Context switch GCS state for EL0
Message-ID: <699c1105-df8e-4a08-ae6c-8c01a13e4a3d@sirena.org.uk>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-18-68cfa37f9069@kernel.org>
 <ZNZUerbrJmzqZzJw@arm.com>
 <28a61b5f-db65-427e-8e92-60dd61549da5@sirena.org.uk>
 <ZOTjnmwwZ+iMsi6Y@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZOTjnmwwZ+iMsi6Y@arm.com>
X-Cookie: MIT:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_100135_979088_F9086395 
X-CRM114-Status: GOOD (  22.98  )
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
Content-Type: multipart/mixed; boundary="===============4890064729955957435=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4890064729955957435==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/y5R8A5W/qG63MLx"
Content-Disposition: inline


--/y5R8A5W/qG63MLx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 22, 2023 at 05:34:38PM +0100, Catalin Marinas wrote:
> On Wed, Aug 16, 2023 at 07:15:53PM +0100, Mark Brown wrote:

> > Right, it's for the GCS memory rather than the registers.  I'm fairly
> > sure it's excessive but but was erring on the side of caution until I
> > have convinced myself that the interactions between GCS barriers and
> > regular barriers were doing the right thing, until we have physical
> > implementations to contend with I'd guess the practical impact will be
> > minimal.

> Well, I'd say either we are clear about why it's (not) needed or we ask
> the architects to clarify the spec. I haven't checked your latest
> series but in principle I don't like adding barriers just because we are
> not sure they are needed (and I don't think having hardware eventually
> changes this).

I should probably also mention that another part of my thinking was that
when we implement GCS for EL1 we'll need to ensure that everything is
synced during the pivot of the EL1 GCS (each EL needs an independent
GCS).  We won't be able to rely on having an ERET there so it's going to
have more stringent requirements, I was partly punting to think things
through fully there.

--/y5R8A5W/qG63MLx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTk6eQACgkQJNaLcl1U
h9A05Qf/V5pH2tcF7cng/WQnlzNdmdQF2NZIRZuZVVzKe1JQ/d5SGT8sP/2ifM6m
wN2P+4yqnMpjdMltFNtMpcnsMQDx7U6kGEmfdBOpr7tmr3dLxpE9snGGTiwRWUtu
Th+Jz7B9omQ+w4wFZLCcZZtpiQcjpDwzqiW8ubZdoqdvyGOSkRO9xx6P47d07ter
dmAEKsDiEQbU/2eFycrJRA85aSwx6Kv1tAC3ZPjigcmFnCGqomM3VzJ0QZNCsMTz
SiUY5GKoO9gk9JPNd4c57jhzWikGGoFFzivLbal/hPfr8MzeIIrVCR7Jxm4ZNRkX
zs3fDy9ePEheBAThiikuE6F7aPriRw==
=VUaf
-----END PGP SIGNATURE-----

--/y5R8A5W/qG63MLx--


--===============4890064729955957435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4890064729955957435==--

