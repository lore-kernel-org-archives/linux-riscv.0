Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD16C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 17:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LtBppkvQleimBLNp3wfD1f0D5ekpzmTqX15WsfG07g=; b=OTxGwiqKoB5dsNwZkORnGur3MG
	udUE8RvVIxV4r2usICpHgjf+UF2kJrDbvko6w7WcRk7wvvYC1e57YAaCLUqyCJV7VbpM+Ji+CWJGc
	MFDCGcFptUJ+CnCA5L+ddb4bifwJPt609NuuaQE12qo56xha6vpbSolwo+09O/Xp+AZJZkG8dX/Tm
	L2jj76FNFGiekRAInpCElCyGX9a71hLO8ULt0DlqP1rp5oHVdd50zKCKRKFEVFTN2M3+jpFeSFqfp
	qwM16c9ee/gJOp4tIjpWafECK0ZPM8f3jxE49uSboWPCcwjhTy0NfflSN2bxtewgOEBcSqYTPVfeA
	/nBiVvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJz9j-00000002E84-2yDW;
	Wed, 19 Jun 2024 17:31:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJz9f-00000002E6j-2rrx;
	Wed, 19 Jun 2024 17:31:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7AE65CE2113;
	Wed, 19 Jun 2024 17:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D67C2BBFC;
	Wed, 19 Jun 2024 17:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718818288;
	bh=bNbJpcBWGT1xRYaIE35wecL9KukS5Hjd/5wYjRFLVDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/dk1rhZzghzcx6W6HS5oz93Kqa4dMi2OYt+yM6S0XEkYVXSE4FZ67++6tZx2Xib6
	 mrLh+FWQq1HlVHuVcDGcvjTFjYCaPARhrozQvfYDNCQO+tOJh5CxIihZd58SgSWjm9
	 57hYB+/S0mZ9NAxVOFG02hWPuuI7LRDEjwYco2Iawrafnq2MDYXOROUH3jl/r9bNnM
	 wqaCNfVrKcqxe4r75eWtwhEMkTW9wlMFo0SzkuPCjTipDzNsb4dCcY0a92c+E3VDyP
	 UpEacnPakVuls+rlMulsWZr1FB5junWyt2wjRlNEMd1D516NfWFuPj/TxuAvBdpoHE
	 WLL7Xj+igijfw==
Date: Wed, 19 Jun 2024 18:31:22 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/5] riscv: add parsing for Zaamo and Zalrsc extensions
Message-ID: <20240619-fernlike-pang-b7e589a9c342@spud>
References: <20240619153913.867263-1-cleger@rivosinc.com>
 <20240619153913.867263-3-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240619153913.867263-3-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_103132_021603_39630474 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============1254169158424679629=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1254169158424679629==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iV+yM3vkV0Ir3FfM"
Content-Disposition: inline


--iV+yM3vkV0Ir3FfM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 05:39:09PM +0200, Cl=E9ment L=E9ger wrote:
> These 2 new extensions are actually a subset of the A extension which
> provides atomic memory operations and load-reserved/store-conditional
> instructions.

I wish this silly degree of fragmentation didn't exist.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--iV+yM3vkV0Ir3FfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnMV6gAKCRB4tDGHoIJi
0qAUAQDw/gNvekOwsKBLPCVUvdyo5mT7zMA99GfeGa8SdS1l7AD/TOVlB4vJ/kdJ
lM7BcEX02d9bYhknwsJvyV68q9DzfQI=
=PfOT
-----END PGP SIGNATURE-----

--iV+yM3vkV0Ir3FfM--


--===============1254169158424679629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1254169158424679629==--

