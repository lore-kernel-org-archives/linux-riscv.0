Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3E5C48BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 19:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTZlmTZtTPfOp+e0tSUO4eEKMAFE+FChOCDgJbzKqE0=; b=VR0otp4/rE2q3CXJOQ7uSDpiFZ
	gD5Thb9wB/WuA5Ag2ym96Ap6quTvtWXyrqJFu3K54l+XmZp/nOCwuYzCTNT3ZJO0ui67HSkt7iQZQ
	gVg2RH1t8SnrQwUdfHyZUJEgk1q2G+LRjQLAZIlDpG6Wb3sjLT3H9LEfDyPl5LZVM2uS4ZGLYsEW7
	fXXHoNdnwLvgDjdLXOG+D2gT+uyfn82vrMf24OwRfnKi/RgR+jljLC+iNLmbPDqSHebc/PWx5z2C1
	fJh5wknuNyTA7log/5HP/Ot69QHSocBPP964QR9uKgOHGufFbyt7lC5XYQWnqVj7j97bEihfvnkUL
	pUdwW8mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcs8n-00000002Fc8-3p8v;
	Wed, 21 Feb 2024 19:20:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcs8j-00000002FaP-1xRX;
	Wed, 21 Feb 2024 19:20:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD3CA60C5E;
	Wed, 21 Feb 2024 19:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5294CC433F1;
	Wed, 21 Feb 2024 19:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708543220;
	bh=LHJE1R6CeCVbz5voxdhxWZEEGGRoTCqvuitIhyGxW/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fM7bxuzf37U7KgkBjE4t6xl7196zWQ3zUCNoJ+agd+QN1cy+Xyq7yQXJHO1ESLu+m
	 WfRkNjkseH24zdDLgFE1SQHiWbwcIsKTde/kK/nypgvvdaArvLxpMbxTv/DpPdea0Y
	 h/S2n8KTkPnE0y1deFIAUzbMSfmwY+RBO7FMARe9q8Qz3/FxPYnixoXp6/h5t4/vuP
	 uoT778pZQf+ryGuzNashUCuvUxs+4C4xh9U2NIQYurkPfiYpJq05pv7AaQTTfFstDU
	 3dg2YeZnziQRTHuGFAV/FX2fhdlhfvtEv0Qil9L1OpaX49KYycDzgKOwtGXtT8v3X9
	 UMMPgrMEFWVIg==
Date: Wed, 21 Feb 2024 19:20:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
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
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 33/38] kselftest/arm64: Add a GCS test program built
 with the system libc
Message-ID: <084d97c0-a84c-49e1-a1e2-d864dbfcce0e@sirena.org.uk>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-33-c9fec77673ef@kernel.org>
 <87sf1n7uea.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87sf1n7uea.fsf@linaro.org>
X-Cookie: The second best policy is dishonesty.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_112021_624661_0F871E13 
X-CRM114-Status: GOOD (  15.72  )
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
Content-Type: multipart/mixed; boundary="===============1107717156815079789=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1107717156815079789==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2wtnap7o07IPW6JY"
Content-Disposition: inline


--2wtnap7o07IPW6JY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 19, 2024 at 11:15:57PM -0300, Thiago Jung Bauermann wrote:

> The only issue as can be seen above is that the can_call_function test
> is failing. The child is getting a GCS Segmentation fault when returning
> from fork().

> I tried debugging it with GDB, but I don't see what's wrong since the
> address in LR matches the first entry in GCSPR. Here is the
> debug session:

I'm simply not seeing this in my testing.  There's *something* going on
somewhere, I had another report of a similarish thing elsewhere, but not
in any way that I've ever been able to reproduce.  It smells like there
might be something missing with the page tables...

--2wtnap7o07IPW6JY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXWTOoACgkQJNaLcl1U
h9BQigf/fQNxlJZgGDgIILMsKObHoXWsq3JdCPlraW9xJegPTEC5/TbR57O6F0Ds
/m4Si6b75N7h1+TLJWetmyKnGAMNBss9qHx2swhi78CdwKsefp4GKaivaFWVKxRx
srdyCavP5tHvbc4O2WqN4A8HZY2ekXKnaXvmz/1DtfvKpV5hgYKBo99ISPLrMVpC
gX/jBaUd5GFOX6ImWBzN30pXfHRJXBr0DiXBrTlxoevDfu7GvQN4qECSqBxM2s1F
Q0vvblI/SBO9CX3h1Pnbdr4VleVLI3arjc4YTBiaPY8cVjHyb1RkUeUrRWVXRzU8
pzYSSKqd4kQ61qa9FEiZhZs13o9otQ==
=eqM2
-----END PGP SIGNATURE-----

--2wtnap7o07IPW6JY--


--===============1107717156815079789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1107717156815079789==--

