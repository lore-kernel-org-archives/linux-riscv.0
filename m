Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB943C04FE0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 16:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0D/1zMHz6WjkaEvFZOz/2fjD6d5MXilcQDGSjj53bws=; b=w5ve7JEyhsSLrT5aBFWdtEbaz1
	tPBdriivmieyXF57HA85ejRzmw2a4jR0oVsfHydAWE88G+iOxHfXCWhGJuuzipWFgt1TG/faLkjAR
	2Q8GiKBl0BUq84j0eXu3q89Dg0IPEeGNlPZkpUYbtSpsPSBszTSDcWsDqIMYF7jIbOD5IHrT7kGbX
	rLjlogTqqCP4iHmhYZdYOvo4DFnaC82J6fbVNnJCbJBwOaN650tE0sVxOYAAYtpt82BJ+bCzf1I9z
	F++bNHnC4m5m4sXA/QbmIDWXQ4IpAGBt7LD+7y7I/akSvRVqhrIKvnH3Mjo1fSdqo3UJ1V6JcqCPz
	dX12MbIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8YJ-008CNv-1y;
	Thu, 10 Aug 2023 16:30:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8YG-008CMu-0V;
	Thu, 10 Aug 2023 16:30:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 97EBF60C06;
	Thu, 10 Aug 2023 16:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC34C433C7;
	Thu, 10 Aug 2023 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691685019;
	bh=6q/Y46TIpsSPhXSxrFEF/VLkfW3O+0fXt+mKjW7zycU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QBTjQqGMrvrEx1cPGNDE6eBGCUIGSu7QfnO9qJ2fxmYvkPqU3uHCMgyBgqQTf/an2
	 Z+gn6DD3Hyi2/XpbY+JVY1qMgaDWQl+2hnwz0tVPTFJ/aQbIQmVZ1kcfhhPjRdTHQE
	 pJIv156HmhMPVc4rUaGTnBIRVcIwyce9fqtZavbwMLCcXcb+iIRAvB+N8r6TXlneb4
	 UD2iv++wxJLA1MWi34RB4oGLv7/wnHhRqPZEFzgBWFZI+EWK5VqP8eJGXk5oRzCMEx
	 VVvgWtIxSwNXI117isSSjrqm7FKpRTocaPXB2KmulJEbsgbDl0ASgz97yEvHnqUTRR
	 0d2hwTU0pEbDg==
Date: Thu, 10 Aug 2023 17:30:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 03/36] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <e676deee-fc7a-4f7f-8605-41b4af274c81@sirena.org.uk>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-3-68cfa37f9069@kernel.org>
 <ZNOhjrYleGBR6Pbs@arm.com>
 <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
 <ZNSmFmYFHDw3NvvP@arm.com>
 <4e215e53-c7d1-4338-8df9-3f9bf783ced9@sirena.org.uk>
 <ZNTnTGb341TSMuvA@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZNTnTGb341TSMuvA@arm.com>
X-Cookie: Reunite Gondwondaland!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_093020_289630_45DC9440 
X-CRM114-Status: GOOD (  21.60  )
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
Content-Type: multipart/mixed; boundary="===============3714596729819694234=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3714596729819694234==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N3GIhup1qS9ZN5af"
Content-Disposition: inline


--N3GIhup1qS9ZN5af
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 10, 2023 at 02:34:04PM +0100, Szabolcs Nagy wrote:
> The 08/10/2023 12:41, Mark Brown wrote:

> > I agree that it's going to be excessive for pretty much all
> > applications, I adjusted it to match x86 as part of the general effort
> > to avoid divergence and because I was a bit concerned about non-PCS
> > cases (eg, JITed code) potentially running into trouble, especially with

> is that even possible?

> 16byte alignment is not a convention but architectural:
> access via unaligned sp traps (at least in userspace).

> it is possible to use bl such that the stack is not involved
> e.g. if there is no bl/ret pairing, but if we base the gcs
> size on the stack size then i'd expect one stack frame per
> bl/ret pair with 16byte alignment, or is there a programming
> model possible that uses 8byte stack per bl?

That's definitely what I'd expect most of the time.  You'd need to be
tracking what needs pushing in some other register but it's possible.
Quite why you'd do this is a separate question, I think I'm being overly
cautious worrying about anyone actually having done it but it wouldn't
be the first time I was surprised by someone doing something unexpected.
Like I say I think it's excessive and was erring on the side of being
conservative.

--N3GIhup1qS9ZN5af
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTVEI4ACgkQJNaLcl1U
h9A4Awf/bx8Lj3RQIsL13zO6Rcr8idtjPSrfssjIBQQtk+Ytcou3d6I0srD7ZcYS
KIOrfTZRe8dRpA45iRARURQA9vzzzeS2pMY0bviaHVPz0kbfeiJ8x/PXOgLOHMkX
EV2us3XQYCNpiGAozGpIK5m8GntmZotF3bJtqK8PDxzf+ujeo361xNzQFcBX7js/
YNED0FhW8OeI/+z7ztalZM26vZw05bE2MwbJmazHCO6L/flUyNSyrk+otZdC71s0
UEVhosgX4Ba4KFRmDBvl5JiCIohdEI+k5S3vJOAZiLauPFRDQuFlrNvs1SGkHcMv
WbwxA1SwHdT5GRMpJCXjvIAWhkckqg==
=j9pJ
-----END PGP SIGNATURE-----

--N3GIhup1qS9ZN5af--


--===============3714596729819694234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3714596729819694234==--

