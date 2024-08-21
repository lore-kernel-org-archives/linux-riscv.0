Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D653C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wu8roLarsqhfeEcix2FPLoKKKTfqlHA1YPQpcEbSISI=; b=Tsm+xBdT4Oqkjpc29o2O7j0zyI
	/Z7mgekZOpbwWU0KDArYZ/R5ra71fArBIinThJYtdw1aT9BVBSB2rz/4iRbZv7qMFXVy2LuHl8/f2
	UXYiGGMs+ZXELVkQHsYAK8xex0VDKDDoF3o1/LvJ8oZlyYm7FngU7SMYCAPG2BoRjW7NtYZa69LmQ
	VsGhwCqzusegXDPOvuESX+mp/iojPfsbSTeji9FHZExqaTO7ba5mKTR/TecCHtCLd4MKttNawA3/5
	qVWv0/Mz8OVlEW6uZNlKNbTwyRIlTODJCMd4032tNd11St+jYEP5si3+chSZbZH7QuZjfUrqUwu3e
	87k94m5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglba-00000009AVg-4Bg1;
	Wed, 21 Aug 2024 13:42:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglab-00000009AG5-2DLj;
	Wed, 21 Aug 2024 13:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EEBCEA41C64;
	Wed, 21 Aug 2024 13:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E120EC32782;
	Wed, 21 Aug 2024 13:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724247688;
	bh=eTD2Cb24CybXMxpAV7IV6bVikyFp8ac2v7wmurkqCBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YA0XHROXOcQsdivO+elHDRjUSAQW6gMvqksgn9sJYx6HIQqgOSqBWvwYAKEoAudJ6
	 jpQFknVrYgPzVDOARVuSc6ndK09miMBS/01QDO3m/u8EM9AE7JMF5GhbKwPzkFwqnw
	 y4RvjlX8hCT1cWOdz2s5B5Hg+habrQnztB9Vn3DjTJKQfLxzs9VNsSM74lIHD/r5pY
	 m8AgYIe8mNkTYx8Rh64Z2A5FYg/IGH8Rmd/TeKBCchC+7HTnea+t4Vt/fEOjItOCaD
	 P8WifT5qdMaqyT/W50EYvaoxCO/vst1XsHX+DsxGESHgI2BbyBJq/FsYuxD4uzQtP/
	 bmJqgBU9LV9bQ==
Date: Wed, 21 Aug 2024 14:41:19 +0100
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
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 21/40] arm64/gcs: Implement shadow stack prctl()
 interface
Message-ID: <ba752f63-6a6b-4353-b2c2-0531d943cfd6@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-21-699e2bd2190b@kernel.org>
 <ZsXjiTlfLE61-jJC@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZsXjiTlfLE61-jJC@arm.com>
X-Cookie: You are false data.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_064129_651254_66475BDE 
X-CRM114-Status: GOOD (  11.33  )
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
Content-Type: multipart/mixed; boundary="===============5167213516738623183=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5167213516738623183==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Si11auRToJrS8sAl"
Content-Disposition: inline


--Si11auRToJrS8sAl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2024 at 01:54:33PM +0100, Catalin Marinas wrote:

> Otherwise it looks fine.

> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

I've also added:

+
+       /* Ensure we remember GCSPR_EL0 if we're disabling. */
+       if (task_gcs_el0_enabled(current))
+               current->thread.gcspr_el0 = read_sysreg_s(SYS_GCSPR_EL0);

to handle the disable case.

--Si11auRToJrS8sAl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbF7n4ACgkQJNaLcl1U
h9Bergf+Lr+93qbWZ/k9ZOtInPd8jxasSRO+qC6wGQEBNiup/wbDIYe/v8WZVn5Z
w4bw2cz7o7ojaKCFrw6eAoto2EKZQXDc2r5UsFegjSdYsFudCg/L7odHSXP1ac2l
J8b/gmDEioJaw8kwgKsABb/7c2Knjpz7HxgzNTBhEV+DJ3ngHp81A7ehdvXyDLT5
C11CbLBC6dWDVxAlFPBR+WUwuIfQLjIfbbZfCl7L0sbtkPQZUTrRN7UhC4e+Ll7x
N01ynknfyTCaCqyfpyfuGxfi7+OKJeKZbGAcLiUvTRikhEIblv9PXLFW+FiUfNWw
SgJ1gyR8bJSUZHgN4w2DFsl0xhPcKg==
=tt95
-----END PGP SIGNATURE-----

--Si11auRToJrS8sAl--


--===============5167213516738623183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5167213516738623183==--

