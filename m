Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AFEC3DA6F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 17:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v06lTS//dww1R8/yd/z0YQ4CsHIMTsZFtKT3uzP7ce4=; b=uCHAox+i8qlolwyWW6F06bcbQy
	jLuXVvK4thudtEcINAl6RdJbjnO0ZrxDdTgFXJdFawwTzOWNt/5W06jCmzkGbcWL29eHHr4qlFO7K
	i5jJndMVQcaTsrW9NSAbBF/NCkJWYBpGvdOitdTVIIFQN38W7hYcO2KpBvgfUtgrl876EyRMuCRpD
	YF1+1A/pHSrpMCTO4tfm/ny52ucX31vQGA+wpk6BRoTIc7u4TE098xholFi/Ney5TPjxA1iEk1d3R
	OXClymcQPcbo0KECnhiUpg4IqHgyjeOStpusTkpylqa53RUVstjws9kvDpO/NnQuvG3XaUCItx0zD
	rBwfjmXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYrVU-001Cnx-3D;
	Wed, 23 Aug 2023 17:19:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYrVS-001CnK-06;
	Wed, 23 Aug 2023 17:18:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7FFA26450D;
	Wed, 23 Aug 2023 17:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10068C433C8;
	Wed, 23 Aug 2023 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692811136;
	bh=3HK+7HvBNxbV1P+aiK9hr3XF3Ps6uIkOCiLCB9Xo9iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TLQVJWTMSbpVFHXaSy3LDCgnAS85gL2dId3RmdwQ88J03SgSRomfu15hlCvmrfX7a
	 o1v2U7nrQu7DYM2lU8OIP0jOhMlWWXolByjQHf90LY1wrfYUcFgg/g5zmED3h/S1C+
	 d8Skc40K5SVdvzHX8sm6m9qfDVUC6U4zEitZseegCbW7m3kFTorOwv3nSaZJLJ77ha
	 /7RlXIyOiwbJeZDQpg/YC72tiVRkCbB3qFcTStKEvqsSZnGPsR/551JlYJVYUyySfV
	 /7bOLRqUEDeVb6qlnB6KF6yUCnIN1WTp7fmos3NmNcegNWAg+jq/80ovlYCOzjzp8h
	 mCrdyvvaZK6sQ==
Date: Wed, 23 Aug 2023 18:18:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will@kernel.org>,
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
Message-ID: <cb449f6e-cebf-44df-8ef4-fa3cd5979b6c@sirena.org.uk>
References: <20230807-arm64-gcs-v4-3-68cfa37f9069@kernel.org>
 <ZNOhjrYleGBR6Pbs@arm.com>
 <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
 <ZN+qki9EaZ6f9XNi@arm.com>
 <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
 <ZOTnL1SDJWZjHPUW@arm.com>
 <43ec219d-bf20-47b8-a5f8-32bc3b64d487@sirena.org.uk>
 <ZOXa98SqwYPwxzNP@arm.com>
 <227e6552-353c-40a9-86c1-280587a40e3c@sirena.org.uk>
 <ZOY3lz+Zyhd5ZyQ9@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZOY3lz+Zyhd5ZyQ9@arm.com>
X-Cookie: Some optional equipment shown.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_101858_156128_206EFFAE 
X-CRM114-Status: GOOD (  15.15  )
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
Content-Type: multipart/mixed; boundary="===============9182350060955798180=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9182350060955798180==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JpUNoCeyjQJaWYxw"
Content-Disposition: inline


--JpUNoCeyjQJaWYxw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 05:45:11PM +0100, Catalin Marinas wrote:

> I don't mind the divergence in this area if the libc folks are ok with
> it. x86 can eventually use the clone3() interface if they want more
> flexibility, they'll just have to continue supporting the old one. I
> think we already diverge around the prctl().

Yes, though that's basically the same thing - the difference is
basically just that x86 uses their custom arch_prctl() thing and we use
a regular prctl(), there's nothing conceptual going on like there is
here.  I don't really mind either, it's just something where I'd
anticipate pushback.

--JpUNoCeyjQJaWYxw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTmP3YACgkQJNaLcl1U
h9AOCwf+OerN1+mzW9/0IjP9fXY5wok+REaliBdQNCxxSEl/snEQ7luADrnORRq8
DT1fhc5ANklKGYAIzyPsjMBAdZi4fR8tKHL3WPuPVqT3qBWcqUSW4R4Mhte3XvDR
PQzkrqEedjqVwOmyg+vdQ/0C4r/QwVXLvNbQVNCKEEFq8F33xIUkf5risFgPn36b
3+Ilc5zXBc4Jk734QUR+g9ql73T33O6Dro5yKxYCXO1dDxv+GkbBWgtYO+mNPWgP
b8entl/O6uaEVlStYe/f9mK7+AH9xFhdE8olsbk4Qi5C1BPQuAy1ZOFuTtF5nFvw
kbzVJrh2uSfkLI7kaAwM2rU12SkyWQ==
=ZWCg
-----END PGP SIGNATURE-----

--JpUNoCeyjQJaWYxw--


--===============9182350060955798180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9182350060955798180==--

