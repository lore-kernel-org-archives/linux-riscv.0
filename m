Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41904C52D73
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fHrbEwbhlFYB1ghtXju53UtcTCsAidhG4vJwJmvfiU=; b=QVzZI/TFc4sCbZxQOClLAFL2aa
	HVEKtKfP2m80bDkcmGrNzB6yyHOfqTUI//GXzUjeX3GTdefv/nF/B3lHP9uAY3uwXond7TtMgIEtZ
	luo+7YNXP/9phGrxfd/Kami1kWHBQ26+A6HN0atKPv58d5ZPjsPwms6a3inQ5GDHhSYHZKavpvEXx
	LgdoT+huph3WS/4fr4cR4Fnp3jgd+cBS84CndeMKUI3mYzbN8BqDWpQcgZiAiXH+puuY9YjOo4Db1
	DVTD8PlXA18h+bEHxqihFeZPbhaXHkKWf3HRl04iBBSHPXAXP9B3pwBdHGkUfoWtPXa2i0oaz0wIi
	by/IQUgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbyOg-00000007ZDH-09Uz;
	Thu, 08 Aug 2024 08:21:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbyM9-00000007Yuk-0p9b;
	Thu, 08 Aug 2024 08:20:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EB2A5CE131F;
	Thu,  8 Aug 2024 08:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F67FC32782;
	Thu,  8 Aug 2024 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723105122;
	bh=BR4CYQvHKo7S4XehLC4CADBELA11Nm62X+WdUtFf9n4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jc1TkavT0yEwNQChojDNn6AzGcsiESQp68rBPCuDzS3h7cmm5mLAyY/voHLXit3ob
	 YkYUfwcDxzH57mFobw6RuiTbcQDB7A/Dj18LPpDs/7TM+IzPBk1iMMJa8aGs8NIabQ
	 rLTZBdmlTgnZinuKZ6W70lM90r+vHQruMzAhCDUOcQPyLqDx4HgggSMUhP/irHTGzK
	 XLQkATMF3M9dx/Iw7RIjCYaaU8Opo84nZlHK4TCSxzmpVukJESm7/IP13d0V+6AyDb
	 xJw618pEuua6MmBDeXs0tcK8qgBBc2CVlYuyDwUg1htX4TnGHXSl1aUscA1F2nWxgC
	 BiJGXD7RqbUwQ==
Date: Thu, 8 Aug 2024 09:18:37 +0100
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
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 38/40] kselftest/arm64: Add a GCS stress test
Message-ID: <ZrR_XZ3JCCIrZUIo@finisterre.sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-38-699e2bd2190b@kernel.org>
 <877ccsdkjp.fsf@linaro.org>
 <ZrP-9gHsvVHr2Y5B@finisterre.sirena.org.uk>
 <87y157cz2h.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87y157cz2h.fsf@linaro.org>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_011845_599655_23D4BD66 
X-CRM114-Status: GOOD (  12.54  )
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
Content-Type: multipart/mixed; boundary="===============1695976984573667154=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1695976984573667154==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2xjwlae8dVoFu1hA"
Content-Disposition: inline


--2xjwlae8dVoFu1hA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2024 at 03:23:50AM -0300, Thiago Jung Bauermann wrote:

> Thank you for the pointer. It turned out that I accidentally ran the
> selftests binaries from the v9 version instead of the v10 version, and
> the gcs-stress-thread binary failed because it was using the old value
> for PR_SET_SHADOW_STACK_STATUS.
>=20
> Using the v10 version of the selftests the gcs-stress test passes. Sorry
> for the false alarm.
>=20
> Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

Ah, that's a relief thanks!

--2xjwlae8dVoFu1hA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma0f1wACgkQJNaLcl1U
h9AAlAf3QAXjvC2gygXbsaueHos4q0nKMAX2bdp+mK3zjoJgg9+GqHPoEFx3Efja
cj5Ct4enLdN36SwqP5OU/agevzvPdKsT2CstNckW/VhAbkgbEi4F8w62q9q2NBO2
gyXPx0aWtgmzptzEPgrEl8+PeL/kyPB9DVnbYGfMI5X2xeMgn4XRyZYjLYuuBWAR
2BlS1DNybUyfO+005zhZnrjlbTN56woklGF9gOfbNT8HoKpWh/VcX9giGP9v/EFi
e+Qpos4Bb9+b3JKeJo2EFjdgvborCnQQJxvGSEMp7QB9wrOs0QsrrhD+Jvs6rmcg
J0pHE5R3OyGMXNNpg2MHtg9o1FPh
=uK/+
-----END PGP SIGNATURE-----

--2xjwlae8dVoFu1hA--


--===============1695976984573667154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1695976984573667154==--

