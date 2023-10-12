Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532CFCDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 14:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R28XbtN4w5zHM2ExiQujkLrZkfYc2mQNICEZCFB9VDw=; b=iWo/Ugo7MPyWLcq78pMroimK49
	wR6TQAwpuLOQn634pd2ITcUGpv6zZ/Lu6mbT2iYMYHNnIS6l4x9quOHrjNK5Vw+GyRm7wcp/NwefL
	KdGPUc4tKI87ER640Up3V/u9vX7Ez6fakzGEit8H7Ml/o/BtAu8aRD41XYMwlgUZfvacdKkPDyyh0
	JiewiICiyMzPfyxNUobDreUF3M+oCaFKQ6G6HCyNKaPviieAMLRb4iRoHuwihoXsxjBiRW7nwlFRE
	pR0dYJAjS6Zk97lmxSXiHtB9x0abih9O/w4vltYqnpWZah6Z+ps6xmDFhkswrf5uhW7FIBPFyfxxs
	yPEQhQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqwoK-001CNt-0u;
	Thu, 12 Oct 2023 14:37:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqwoF-001CKf-1F
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 14:37:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DBC0CB824C2;
	Thu, 12 Oct 2023 14:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DA8C433C7;
	Thu, 12 Oct 2023 14:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697121417;
	bh=tqPqmHok1AyU/GG626kkM4PFGH7XQeQEOYooofFbE+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BMAjov1X2fVRTyegaWW28iHtNCwbmTe1ER+CCckjzVHEl8moiISR5Ys0Ad3QBESNC
	 XCzNCnYLVTCqKSaKM+X5dbQ2oQl+p2lhzVyGRJsx9HwFVTyNZp6hYbj2fa7b8H5Sy/
	 3n81yeRGgGcmV45bY/mg97c7o6NNjMa/NIXvkR4apDIyYaVJ+nwDo/YyMLqmrx8Wil
	 nssBNW5fPPVUqURzE76CFjUp/JAzjV5vThzwy8HIRpmt8FpQ3euJxC1qiF9Qrwl8iI
	 THEa9ERLSlWS/JtSVovdCGce8bL3D1XBQ35AbEWpKtQJsSEbs4nHjn1kZTBV1jil2W
	 SLIyA23D6wRCA==
Date: Thu, 12 Oct 2023 15:36:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v3 1/2] riscv: errata: thead: use riscv_nonstd_cache_ops
 for CMO
Message-ID: <20231012-pranker-usage-09a85a36356f@spud>
References: <20231012141456.4078-1-jszhang@kernel.org>
 <20231012141456.4078-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231012141456.4078-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_073707_645984_1DFA67AF 
X-CRM114-Status: GOOD (  13.77  )
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
Content-Type: multipart/mixed; boundary="===============3519019621723201208=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3519019621723201208==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tLH7qnMb79tGa+m2"
Content-Disposition: inline


--tLH7qnMb79tGa+m2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 10:14:55PM +0800, Jisheng Zhang wrote:
> Previously, we use alternative mechanism to dynamically patch
> the CMO operations for THEAD C906/C910 during boot for performance
> reason. But as pointed out by Arnd, "there is already a significant
> cost in accessing the invalidated cache lines afterwards, which is
> likely going to be much higher than the cost of an indirect branch".
> And indeed, there's no performance difference with GMAC and EMMC per
> my test on Sipeed Lichee Pi 4A board.
>=20
> Use riscv_nonstd_cache_ops for THEAD C906/C910 CMO to simplify
> the alternative code, and to acchieve Arnd's goal -- "I think
> moving the THEAD ops at the same level as all nonstandard operations
> makes sense, but I'd still leave CMO as an explicit fast path that
> avoids the indirect branch. This seems like the right thing to do both
> for readability and for platforms on which the indirect branch has a
> noticeable overhead."
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Tested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

=46rom v2:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--tLH7qnMb79tGa+m2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSgEhQAKCRB4tDGHoIJi
0oQqAP9E3GPMvuDoXMFDfJdL0fEkQ1D91Q115ThR1vWUqlcKCwEAmZexxPc2Ytz3
XSpUhcOVF4jxrEhP3FjNPNvYpXJp6wg=
=NXCq
-----END PGP SIGNATURE-----

--tLH7qnMb79tGa+m2--


--===============3519019621723201208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3519019621723201208==--

