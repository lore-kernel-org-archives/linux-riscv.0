Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC35E7AD5E
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 14:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2ypZX2Po79/UZsUOBqWzfeMj3fgaE2qqTkTZrvo+LA=; b=suNMx1u4hv1tbpF6J+1n8NTTMQ
	Dyhpr+dczbo0RubIysxku32d6O6gboUxzTrvnkHBAyK0SlpcowjZ29uxNvvVqcvTeWDasVesppGwS
	EuNNf6gCzxwt2qARhO6K4ReLbyz31NuMK4AsSZHJZ+EAGb/0p8bZG+nO2c7os9IZxqHjLVS45c+UA
	YyAT6ufPE8+jPvlcESXXs4JNymDIb8mr45Lde4Scj5gXBGfAYPkQ5bTxrWqHzjKte6sRUaU+Uu8n8
	MXu+BG3SGkPOchXDEJsKnnu2VNHH+08xrFmqBPmyqKYgwyX78Q4mPwzxZxJ/sBrrf2sOBC9Jb30LI
	QDZJbeJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qngMc-00En98-2v;
	Tue, 03 Oct 2023 14:27:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qngMZ-00En7x-0C;
	Tue, 03 Oct 2023 14:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B9C8DB81B1F;
	Tue,  3 Oct 2023 14:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CB2C433C8;
	Tue,  3 Oct 2023 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696343221;
	bh=fHO6Z58J7VfsEj58RJs1tu4Owi0xG1v6AW4/0YSyTUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DyIy3Yv+W/CyQ0YMjTSv84e9IfSa4C42rHX7FzcqawTdjAVka4EOVLyvr/YyCMX1c
	 odzbNo2zKoZUztGOLt6XRaIkN5f142zGU5/3Ggqxro2C84FL1rDyPp08VMU5MG10Fx
	 GkVgHQiKhmdfUPqW8Um1FIq2jMkuy7aFDL37p0oeMYLirBJy8+c15bCa7v9005CwDV
	 vPhuRQkLPUo2NOslC7Y6Q284DYNNncBJJCf3kX/xZtMGoRk47+N+eWY0fhGL7bQ5B/
	 uA6az4zEwL7+A16vgdwSsSWiVMenTAeoIyWauQa5q7N2DqlCCR3GYZo1lQ533slcrI
	 1isHnZlKYDz/Q==
Date: Tue, 3 Oct 2023 15:26:51 +0100
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
Message-ID: <a7d2fd66-c06b-4033-bca2-4b14afc4904f@sirena.org.uk>
References: <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
 <ZN+qki9EaZ6f9XNi@arm.com>
 <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
 <ZOTnL1SDJWZjHPUW@arm.com>
 <43ec219d-bf20-47b8-a5f8-32bc3b64d487@sirena.org.uk>
 <ZOXa98SqwYPwxzNP@arm.com>
 <ZOYFazB1gYjzDRdA@arm.com>
 <ZRWw7aa3C0LlMPTH@arm.com>
 <38edb5c3-367e-4ab7-8cb7-aa1a5c0e330c@sirena.org.uk>
 <ZRvUxLgMse8QYlGS@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZRvUxLgMse8QYlGS@arm.com>
X-Cookie: Oh Dad!  We're ALL Devo!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_072703_387645_DFB20800 
X-CRM114-Status: GOOD (  18.82  )
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
Content-Type: multipart/mixed; boundary="===============3926570676893752920=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3926570676893752920==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CnsHSUBemytPXFhS"
Content-Disposition: inline


--CnsHSUBemytPXFhS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 03, 2023 at 09:45:56AM +0100, Szabolcs Nagy wrote:

> clone3 seems to have features that are only available in clone3 and
> not exposed (reasonably) in libc apis so ppl will use clone3 directly
> and those will be hard to fix for gcs (you have to convince upstream
> to add future arm64 arch specific changes that they cannot test).

Ah, I hadn't realised that there were things that weren't available via
libc - that does change the calculation a bit here.  I would hope that
anything we do for clone3() would work just as well for x86 so the test
side should be a bit easier there than if it were a future arm64 thing,
though obviously it wouldn't be mandatory on x86 in the way that Catalin
wanted it for arm64.

> where this analysis might be wrong is that raw clone3 is more likely
> used as fork/vfork without a new stack and thus no gcs issue.

> even if we have time to fix code, we don't want too many ifdef hacks
> just for gcs so it matters how many projects are affected.

My impression was that raw usage of the APIs was a specialist enough
thing that this was viable, ICBW though - I might not have been
searching well enough (clone is an annoying term to search for!).

--CnsHSUBemytPXFhS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUcJKoACgkQJNaLcl1U
h9D1+wf9E8KLlwo7oauOMfMCaEHN33slVADlMHmi/XAO6e+v3qV+f+jIWgnm7QVZ
NXQYwsmD9BjcMdlgDmlglFSC1Ui3L1auA8BtZNc0XaYT49uDudcAO4sxApsu0Ei4
YG1WN+8MyabX/ktfHNf2XyosySVjLipmkrlWSJaI89BnELx681xWUf+Ew7KDX6on
I62ZOCIMFM9V0kfe8cIbwGsSRXm53lb29tDkOSKWRWQaNw8faH2YiSbmWG4kSF8u
+dSRg051fgrBUj1dttRgE3oVlKaOAKF5+XtNe27dNeFpxXMMs6pZTjdZd0Us4QjE
ETLB2y5WLQvi5XfxRiQqlJopkuzikA==
=/LLg
-----END PGP SIGNATURE-----

--CnsHSUBemytPXFhS--


--===============3926570676893752920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3926570676893752920==--

