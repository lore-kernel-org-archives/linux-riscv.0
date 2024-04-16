Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE2EC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 15:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUJV7x+RDxOYFIQFzmXGjr59J58W1DVFTSsowtO2NYo=; b=o3GQ4KgdH2tVHUDmko+nu6J0TN
	DmtgK6xxpDJdFvICgpGy2ZxoprXqZeummZR07W8YFdUZ6SuMqHR+WlL6tQJ9sAYgD+mRbDlhoYADF
	pHzP5pIyOrXXjJb4+5hecZl35UWkEstcH/mlrLNuMKH75x643frHAdDHqj69cuZiFi1uQjfDFVlpI
	cFWBWief4mjhGMRBCV+b7ewXwQnUIGItm1qayJFoz5rlR/r8GW1ECcetbcKZvdcslDJnmLlM3LvLU
	hV2THxE8U276y7WB49CK6JK4zQ7jAC4rxVftLYOsSO2ZZ0aY5IhHv2daAgVgmlYy2XqnyTkJbGPrQ
	Dl2pP87g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkuR-0000000Cnc6-48cO;
	Tue, 16 Apr 2024 15:39:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkuM-0000000CnYq-1Ryh;
	Tue, 16 Apr 2024 15:39:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 81D95CE10AE;
	Tue, 16 Apr 2024 15:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4CAC2BD10;
	Tue, 16 Apr 2024 15:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713281974;
	bh=KJDi6z6/U9cziW9yQDAhSzhquj/YiV34HJLdtVilEJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujZk1EHTMYG6e3LIKsVhqs298UOQP1HsHzdkcfICrpHwZ3YUadJ4RC2OobgfiPNHI
	 lAtOcI+YXVprYmBTkU2ebh69W4CDs8tLl+aB19+l8f7FcutfSctw0Aa6boskTtBI+D
	 AWFlkLNLrnMUx2/zFkx8yQ/J+g9wO6I5/R6lR+a0vv2CHU7SZWJSu9Xkxk5xEeQbXx
	 37RokpQuCiFj6tviL8/Ae8K84VyLdbTd2ubOoeeJ5Pmw0VdDAPXE/RJDHPB8NigPsR
	 aL1UjrRjQT6wIjr9mDMEuT0mlNfdfCKuFi14iFBvH8AGKKx3s1z0luTqJLt7Mdembq
	 IJwgP4grIJdvA==
Date: Tue, 16 Apr 2024 16:39:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 00/17] riscv: Support vendor extensions and
 xtheadvector
Message-ID: <20240416-hurry-garbage-c5b43241dbe0@spud>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_083942_612849_8B49E39B 
X-CRM114-Status: GOOD (  17.06  )
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
Content-Type: multipart/mixed; boundary="===============1711248371045957124=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1711248371045957124==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MtdbaA8z8FH3b/rB"
Content-Disposition: inline


--MtdbaA8z8FH3b/rB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 15, 2024 at 09:11:57PM -0700, Charlie Jenkins wrote:

> Changes in v2:
> - Added commit hash to xtheadvector
> - Simplified riscv,isa vector removal fix to not mess with the DT
>   riscv,vendorid
> - Moved riscv,vendorid parsing into a different patch and cache the
>   value to be used by alternative patching
> - Reduce riscv,vendorid missing severity to "info"
> - Separate vendor extension list to vendor files
> - xtheadvector no longer puts v in the elf_hwcap

> - Only patch vendor extension if all harts are associated with the same
>   vendor. This is the best chance the kernel has for working properly if
>   there are multiple vendors.

I don't agree with this lack of trust in what firmware is telling us.

I'm not really gonna review this v2 until discussion has finished in v1
about some things, I fundamentally disagree with handling the same
extension differently for different CPU vendors and I don't wanna
fracture that conversation further.

> - Split hwprobe vendor keys out into vendor file
> - Add attribution for Heiko's patches
> - Link to v1: https://lore.kernel.org/r/20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com

--MtdbaA8z8FH3b/rB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh6brwAKCRB4tDGHoIJi
0mfRAQDv3w5+C9suCRRRiwfjjVWoUxMRKczJo1O3djhERhZohQEA3PKM7ixcBZ/+
gCDOCf12p1w6L8bmXsvYZ36xQsLl6g0=
=ZdJE
-----END PGP SIGNATURE-----

--MtdbaA8z8FH3b/rB--


--===============1711248371045957124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1711248371045957124==--

