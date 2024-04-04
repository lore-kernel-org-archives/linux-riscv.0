Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A566CCD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+G42ZeEMpqEOIdEjeexuzpkZTkgFk6k2rKU0WUVJoqY=; b=OKIy+sTy0umwvsXOs3QoxJlb/e
	LWuTOisw3H78LRJ+ACNrWkqXRGaxy7tJkgN53g46E5c+srvhznkZ/kTuHmaP489grF7tJi4XCdP56
	/eDq7CE8RG7nv4u9jUU+qJ8iZ3sb2zzdzKR0mrGV5VKL6Qm0LJKFvTSMoGMTewIiw9lTnSnuGGlKa
	VLRx2PB3iyzewsUGCzvn1mIfbRQOa844nCSMN1BI+PceSD+h0jdGHtXtLmrx1YJcThJU0YtCQfCot
	i/c0/cGSTCDDvQqL43upIyrTKC6RVivRu5wJAGcZw+JiBwSiLxUK2YveKxmKe19zD4k/WUer3qVkU
	kWkivWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsPYQ-00000003NCS-3u1i;
	Thu, 04 Apr 2024 16:03:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsPYO-00000003NBN-0ooF
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 16:03:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E427B61644;
	Thu,  4 Apr 2024 16:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46023C433F1;
	Thu,  4 Apr 2024 16:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712246582;
	bh=oygxtAYgo7ybilPD4TDbXauKq+YBViBtgvaImPWLI7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kf4ZmMZyEcoI29vi+4BvRfIYFMyEkLSITJ6nuExiwuz9p9HLGL9wSTeuO9kqFQpcr
	 onSSOu7kIaM8FQmm+0F9v2c8e1scpXxOK21tRZySKPrYLj488vJBEX6eYiO2kgviiW
	 9zAIbOHctgAVYhN6E3prvcefWdcyqA+tmLow7aPUVD2ocaJotmPnmoMmDIuvhT/Svf
	 +brI59zDzju6Sj6p/lkZiIwssGNY2rqoSbQcz/ZxZZYq4LX+4FPTXfYMThwAYZAunV
	 syvtrFymcGWRUWQWrrLzEu3Gp1sYxBrtlhyQ0iFiXr/Ej/YBAiBCtiONzWuFjOxgGk
	 BqFSPgaUfxN1A==
Date: Thu, 4 Apr 2024 17:02:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Cooper Qu <cooper.qu@linux.alibaba.com>,
	Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
	Huang Tao <eric.huang@linux.alibaba.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Qingfang Deng <dqfext@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v2 2/2] riscv: T-Head: Test availability bit before
 enabling MAEE errata
Message-ID: <20240404-drown-wronged-bfc421e412aa@spud>
References: <20240329121414.688391-1-christoph.muellner@vrull.eu>
 <20240329121414.688391-3-christoph.muellner@vrull.eu>
MIME-Version: 1.0
In-Reply-To: <20240329121414.688391-3-christoph.muellner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_090304_357123_ECEEA036 
X-CRM114-Status: GOOD (  16.27  )
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
Content-Type: multipart/mixed; boundary="===============4738589336018953373=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4738589336018953373==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wpMuYirtpZPsx9jO"
Content-Disposition: inline


--wpMuYirtpZPsx9jO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 01:14:14PM +0100, Christoph M=FCllner wrote:
> T-Head's MAEE mechanism (non-compatible equivalent of RVI's Svpbmt)
> is currently assumed for all T-Head harts. However, QEMU recently
> decided to drop acceptance of guests that write reserved bits in PTEs.
> As MAEE uses reserved bits in PTEs and Linux applies the MAEE errata
> for all T-Head harts, this broke the Linux startup on QEMU emulations
> of the C906 emulation.
>=20
> This patch attempts to address this issue by testing the MAEE bit
> in the th.sxstatus CSR. This CSR is available in HW and can be
> emulated in QEMU.
>=20
> This patch also makes the MAEE probing mechanism reliable, because
> a test for the right combination of mvendorid, marchid, and mimpid
> is not sufficient to enable MAEE.
>=20
> Signed-off-by: Christoph M=FCllner <christoph.muellner@vrull.eu>

Seems ideal to me, I'm guessing the QEMU guys were okay with emulating
the CSR. I don't see any screaming at the very least on the patch for
it.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--wpMuYirtpZPsx9jO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZg7PMQAKCRB4tDGHoIJi
0iaGAP9p8R6uT9Dq2VFAZHEcMfzw8GOIp1Ed5vkewkKknFDwcQD/dslVWUtYecpf
gVVa5+8uAg5289fOiPhqPgRKomQtwwk=
=NeFs
-----END PGP SIGNATURE-----

--wpMuYirtpZPsx9jO--


--===============4738589336018953373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4738589336018953373==--

