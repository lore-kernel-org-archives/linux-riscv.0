Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A12C52D7C
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 22:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7iUEmbSKIdrRJ56KHvQD2EVdBhJgnV2TGbGN2CPBsM=; b=x5bEzEnbx0QH+m9OB52PEMF0QA
	mU671LAAmgV6vskfw4gYPaWwR9wf+rOgJ33RUhHZEmsZNm/YXYLkhqtAWdblxCQjmzzv4f3alcCjJ
	+WU1/2dUKlAfIc+Eog9DETe7Cp23I3QRlrVU5x3+dw5ufgjDdWdvxd/jS0kRJUKJ7Xj39Rf6Wggs7
	Jq8uraTro6rHJmzeqzgnsPsR53Ze22IBzL47PYWibnTox3fHUUX1+iD/2sYObz1PmaTBCJZCIfGq6
	ELVxffooDY5+CW4mUgShoGV+apQwEmO17UzCkfl8aNm4WpCsXRZIm5mJZl0HFf24iil0FbZGCMWQp
	IYXJkFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scY8u-0000000Cg1q-2G6x;
	Fri, 09 Aug 2024 22:31:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scY8p-0000000Cg19-2v82
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 22:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A3B6061758;
	Fri,  9 Aug 2024 22:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7583BC32782;
	Fri,  9 Aug 2024 22:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723242682;
	bh=ST2yZJ1z3NPLh4z1Z9oZd5wDiM05Ls+yHvSmTrATXTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdfNHUFSCvgO3CKBq6FBAR2WeVIHxj1nhcVXFpM90cS4e3R4lvmJlY0jAlCdyiao7
	 bTvJg/0lzSHLV2vMiVmamYiBijYQA7Pk2WZwG1Oz99TlRYq9G0qi36ZCnWiBELc8Yk
	 GfwK3agTSeyPYjBV0GypsBfN0gzSVGty7jXfSJzACMBD9gTH0M3QegApEtBVPfkeux
	 ELsWhY/ZLNszj9JXhqp/fWzZ4s8WZOi84U2YqzhC8CkAd4vT5rzdhPbDvI2X1azdyS
	 PC+9Lmwr28VwuRYElgTjS2Anp0/hkhMnQK7CtWsea9xdVT0ZwIV1fR9oepAD0hYJq3
	 lvy0RwPbyqe6w==
Date: Fri, 9 Aug 2024 23:31:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v9 00/13] riscv: Add support for xtheadvector
Message-ID: <20240809-slapping-graph-461287bac506@spud>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_153123_825511_E0BA58A8 
X-CRM114-Status: GOOD (  15.17  )
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
Content-Type: multipart/mixed; boundary="===============1100864033261606263=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1100864033261606263==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UxYzrmqfRoz1zos6"
Content-Disposition: inline


--UxYzrmqfRoz1zos6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2024 at 05:31:36PM -0700, Charlie Jenkins wrote:
> xtheadvector is a custom extension that is based upon riscv vector
> version 0.7.1 [1]. All of the vector routines have been modified to
> support this alternative vector version based upon whether xtheadvector
> was determined to be supported at boot.
>=20
> vlenb is not supported on the existing xtheadvector hardware, so a
> devicetree property thead,vlenb is added to provide the vlenb to Linux.
>=20
> There is a new hwprobe key RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 that is
> used to request which thead vendor extensions are supported on the
> current platform. This allows future vendors to allocate hwprobe keys
> for their vendor.
>=20
> Support for xtheadvector is also added to the vector kselftests.

So uh, since noone seems to have brought it up, in the light of the issues
with thead's vector implementation, (https://ghostwriteattack.com/) do we
want to enable it at all?

--UxYzrmqfRoz1zos6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZraYswAKCRB4tDGHoIJi
0tonAQDXX0xZWgDaeNkL+G/im0IoleTzmXCNVYAibHmhnDOBLQEAu5Jwr4Jh84y8
So09QD8P3MlYkua1tqt96HA8i7/76ws=
=PJBU
-----END PGP SIGNATURE-----

--UxYzrmqfRoz1zos6--


--===============1100864033261606263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1100864033261606263==--

