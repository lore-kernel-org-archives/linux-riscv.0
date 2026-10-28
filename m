Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B883606A322
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 18:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WJB9gOe5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zpmpp+Zq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MeEtFT1tLfglCIxypDJor1JJFh8+Il78ErHZRWL4om0=; b=WJB9gOe5Nz9+4P/4E79kg6J+A7
	yM/wDIJJupIBpbF5w1sBg8tOzvrFzTcq0WWmJK464E2AwHjlGq2dri2/mYEBFCSN/BviypuQVWE8E
	kHUgg/TlDHfrCEMk7wgX42DUEbcaa1dtFg/fr7MtLS0nvo8ye/SlSfZVp99OForNWY/tSGIQ9xaEm
	DEs65Ga85bwMcvwmo3PkAbplLBrsPfJPEuz+BIcGdgtA7EnaxQXL26B7o7CZxaBydZ5BP5qwG2cgH
	ewJnR3HCe5Vr1xXeKFhUz1wvebAJ++1IO73vpmFYvJupBflp3tDDUzs6bo8Y4Bz/gHTGAhcF+2Ns6
	P72aiEYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8R6-00000007kqA-1wl0;
	Wed, 28 Oct 2026 18:31:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8R5-00000007kpj-1IKQ;
	Wed, 28 Oct 2026 18:31:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7364243E52;
	Wed, 28 Oct 2026 18:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC831F01825;
	Wed, 28 Oct 2026 18:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793212302;
	bh=AhGwMBlXb9QayOpoIgLMCOSWoppIw0OFkOZJ4bKojBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zpmpp+ZqiBhJDbBCqSiYhds7+OsBVknD16S19y+dM78X5O/2NLnnQRzQOLKxa8rGm
	 AWqo+psYcNkpxa6CU3ZqLQdv8kJ99QKbFsX9D4xU6HdBguei7iRkKuyf7kWDdnfHsV
	 OC4dqatLiE6pCPji5GpazeqoFSPDjfKBmCbiejFHseBoyEd+vz8vmZtKtXJWVO3u8G
	 CnT39zMnWqvR/Y6RjfoqHd4qyzplNXVVG1rCNuCzVBNR9OlXr4qENeCdlqU74jx/Gr
	 Wl5SPcdhBeHdJyjHOj78fuDRzRC7sKcwWhK/WpzEyj8isUevSlSjmE/yFsABpvz+lk
	 JtLqsxrGGZcUw==
Date: Wed, 28 Oct 2026 18:31:34 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Iv=E1n?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Deepak Gupta <debug@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: [PATCH v3 3/4] selftests/arm64: GCS must not leak on a failed
 clone3
Message-ID: <e87dc329-3f77-45bd-89af-c98551801658@sirena.org.uk>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
 <20261028154315.1272705-4-ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261028154315.1272705-4-ivanrwcm25@gmail.com>
X-Cookie: Pushing 30 is exercise enough.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2303095782037557116=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============2303095782037557116==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EgSzcDImSQq/kPzv"
Content-Disposition: inline


--EgSzcDImSQq/kPzv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:43:14PM -0300, Iv=E1n Ezequiel Rodriguez wrote:
> KTAP coverage for clone3(CLONE_VM|CLONE_PIDFD) with a bad pidfd
> pointer: sixteen failures must not grow the parent's GCS VMA count.

Thanks, this is a lot cleaner and easier to understand than the original
version.  It'd probably be nicer to do the refactoring of the existing
code in a separate commit but that's more nice to have than essential.

> +TEST_GEN_PROGS :=3D basic-gcs libc-gcs gcs-locking gcs-stress gcspushm g=
csstr \
> +                 gcs-clone-pidfd

We should update .gitignore as well (or merge the test into libc-gcs but
that's a bunch more work and definitely into bikeshed territory).

I verified that this fails with the current kernel and that the kernel
change causes it to pass so with the above:

Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>

--EgSzcDImSQq/kPzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmriP4UACgkQJNaLcl1U
h9BzNwf/fWeDVy8I0F3zpUZkbDWBz+B0NHeFLUK3At/UfT7hecHF42jNPNh3Xc0b
uZQr3+cver9uHhs6hWET4qJctAOzVU204Lc2PNA9Flr42rh8h8+MkwwoBwGZ0r3f
r78kAheb3Kt0vcKAZW6uISJLn5jW5Wf4RNxgh91OlNstBhasep2Bso5Oc6GuIBpG
mbX/7VW4hG9auddgjYFwLW7hxBPt2ktTN52xxWwPuvaUSShN6ymkddfN+FJFeGIm
axGOVeyLJGYFaZ/z93kpVAeO6SbO4+dvJJWdyGXHcrax1CUI9ACivl3bMEBehioB
T7NHKcS/pNoywh81iKvz7auWKzyETQ==
=XNL0
-----END PGP SIGNATURE-----

--EgSzcDImSQq/kPzv--


--===============2303095782037557116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2303095782037557116==--

