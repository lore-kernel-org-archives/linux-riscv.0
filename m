Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473C0CFA76F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6U6EvwPW3lXfSV9bRXW+fRF/MekJofPS2K+15M7hf/k=; b=hW0kgcutVRQtFDAFyjYjA87FoO
	QfYHCgui23F0UZglx4sN+M2D9wkPv5iv8ALJHmr4Fss8Ce65D7QsefT/PuQp6TUwJmErlmhMpvRAQ
	j4GQBPPp8Wa0Z8Gx0WL9cAbnw9Q91fZSki5aUMHy9+q0tnJsrBnPB3iZ/yZ8tO1l8gyWzw4TJGF5q
	Ojb39qEIOjcRvCVrhhPK9DwX9fVZhH0MkbwtyUbj9EFc3x8oigiMhYWGUk6YpLvDFaTaBqBptYu4H
	JkaSaZBMVNhDIArHWQcrqnnmiC8e1XkP53ovTwnd8JjYQB7LeU1sdF5Bes4uno+CdLzyGwqIAPh4R
	VwyAN1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swgqR-0000000CC1f-3Be4;
	Fri, 04 Oct 2024 11:51:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swgp9-0000000CBhD-3JIR;
	Fri, 04 Oct 2024 11:50:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 574F0A448C9;
	Fri,  4 Oct 2024 11:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83680C4CEC6;
	Fri,  4 Oct 2024 11:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728042618;
	bh=+BeodDaFGWOje549S0KudeQ/WQofpaiwc9P5QexdJr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6TkvVj7GMjGbmKB1HJLF/vkMjkfzBK2z4CFAq24H++hZNqit5hWnu+qiurDMqtJ9
	 DW7IidlCRTM3QaMhphpojCHjZ9fTG9JpZUW3qZPbU5yq9fQl1YgOGiV+fPAEKsj4YY
	 lHObhuf9Yt8SIkxWEEYLeXqbYgcv7Or4B9En46bl/EKtkJpsJKrdkSrdZTlfIUvbGS
	 HHtgo5u5ZT9DkHGaMrAGkcfT9+xGVcKVHfYCKheZIw9xBKQUz0jS4MB3qmjis5vPXQ
	 hgzdrNECfwJPJwiQuKv4im1uOOuAQYJSeqvyP18pTTVOMYiRTqVEpfylWiGr7FpOK+
	 w/AUkl/4UDraA==
Date: Fri, 4 Oct 2024 12:50:08 +0100
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
	David Spickett <david.spickett@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v13 22/40] arm64/gcs: Ensure that new threads have a GCS
Message-ID: <0e4d84e6-81ae-41ea-a17e-484df90f4444@sirena.org.uk>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
 <20241001-arm64-gcs-v13-22-222b78d87eee@kernel.org>
 <Zv_PFVffwIkKevzE@arm.com>
MIME-Version: 1.0
In-Reply-To: <Zv_PFVffwIkKevzE@arm.com>
X-Cookie: A bachelor is an unaltared male.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_045019_912194_4CDDBAFE 
X-CRM114-Status: GOOD (  11.41  )
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
Content-Type: multipart/mixed; boundary="===============0663024872442806496=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0663024872442806496==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LKVsNEPzgkEHa/nF"
Content-Disposition: inline


--LKVsNEPzgkEHa/nF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 04, 2024 at 02:18:45PM +0300, Catalin Marinas wrote:

> I think Szabolcs mentioned a GCS leak with v12:

> https://lore.kernel.org/r/ZtrihWQFyb2/XrQV@arm.com

> (and in some private messages IIRC)

> Has this been identified? The changelog only mentions a leak in v8.

Yes, it's this in the changelog:

  - Implement mm_release() and free transparently allocated GCSs there.

--LKVsNEPzgkEHa/nF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb/1m8ACgkQJNaLcl1U
h9CX5Qf/YXV4PCUMoouOlHODLlWL0QpqxDnrB4g2yYs90X9BTpJIF7Ax3i9mVe6N
UETYxylUWRj9l39/OFtO1HFZkJcLdlWYkYREST9X6NX4htudvuu/5oAN06NXH9jd
znOG1a/FdzPxRygtN3Lt6P6eodHJct9XRgduDANTu4oCEl7PAuW6ob88izh/c+FO
MaiKZXsdWB+nc0KOSVk3HA0ogs8szrCQcWNti/LArlYFZWwurCtfYxgCUQFEzSSh
SDemv5W+sFX+l7V/S4YCawDcIcLv0B+jV9lx0ECWzyhLeOrIxBDTYSKr3ukgLR7n
+XdVZaKYGBSKeIaoCVbZcVM3Ul+CTQ==
=zRYX
-----END PGP SIGNATURE-----

--LKVsNEPzgkEHa/nF--


--===============0663024872442806496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0663024872442806496==--

