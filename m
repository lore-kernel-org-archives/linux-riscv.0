Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBE4C32793
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 22:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmX1720otOIpwLR7nhSPHgVA0Ef4OA5OvWtQWIP24Sw=; b=ldAmBgiphvQvVjgphcFg0yY8Kx
	BMoU6JEkvMegQ1LrDryYCpQRc+vVkAbJw9WIdu65GvWDSA9Ma0zbVm+aO+iMleCsgdJq4Em7PiYA1
	vXEhjBDRdC4kEHdJ4x7p5CygR6l8FHe3B5urFNKRJ8l+97E3h8BZIkP3lnkRoNl+iggshgyD0EhPb
	/NmcK7mIt0F+QpG9BG6QW+pdNuRUzBkLu7fMGMin6qshNtHa0uvoMHtDuwrCnUSmPZsOz0PcZkbbk
	ZF0CM9LFyrFIdUPtlYpxMiZ5dmeD+vCjagytxT/Sf8Yc2xxMlp40lRo6rHq4OM9eHDhUX8YVgUDqK
	rdz6jUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIGvW-002rC7-8X; Wed, 18 Jan 2023 22:29:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIGvT-002rBK-HI; Wed, 18 Jan 2023 22:29:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C777EB81D69;
	Wed, 18 Jan 2023 22:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E249DC433EF;
	Wed, 18 Jan 2023 22:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674080936;
	bh=ScZ75Ow6zwZdhPgHHviF9EKWXuDCiB6x4DKzTlwd52g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cxwseR+yVfF10J5NX7hd+O0OucmJo+kF0g7/KV3nNGyAOwx42aihVfGyXM4PBk41t
	 Rb0eEbhVi8a5pGdbRn4t96eOGzIaE6n0RrPPq+UkdAdgpIrMIGjrB5LJDuQNWi2bvo
	 hjnv3lHSz+gU9PUmQnbz950hX4GJUvv1sISWrGgIekyT3X5P7lDIZee3mg56823ubS
	 O76VKhsK8DhEf6Imhi5WjcWY3AGuVuD+a6do4pweDq9Y+NVaOxqPktPsZ54rT0l3Nf
	 BQ6HZokzXRIbRRvEkQ+GyYQpnSwOiF6uJEYFFva+Xt8k14fdcNi+3KqA47j1Wawclv
	 QJy5NgSxHbJ2Q==
Date: Wed, 18 Jan 2023 22:28:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v4 05/13] riscv: cpufeature: extend
 riscv_cpufeature_patch_func to all ISA extensions
Message-ID: <Y8hyo573/Ts6K80s@spud>
References: <20230115154953.831-1-jszhang@kernel.org>
 <20230115154953.831-6-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230115154953.831-6-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_142859_746561_B68659C3 
X-CRM114-Status: GOOD (  11.44  )
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
Content-Type: multipart/mixed; boundary="===============3925571548545274643=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3925571548545274643==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tBo/phUjmG15esYd"
Content-Disposition: inline


--tBo/phUjmG15esYd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 15, 2023 at 11:49:45PM +0800, Jisheng Zhang wrote:
> riscv_cpufeature_patch_func() currently only scans a limited set of
> cpufeatures, explicitly defined with macros. Extend it to probe for all
> ISA extensions.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

With the same rationale as 6/13:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--tBo/phUjmG15esYd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8hyowAKCRB4tDGHoIJi
0u6pAP9JJDIa9Bpw5oTYPylFIJAIVzlaO7zYyPfjPRNnM2mARAD/d7Xbcmb7s8Ij
91eblxdkO20X/45seDyT7eKDOyBDvQk=
=whzM
-----END PGP SIGNATURE-----

--tBo/phUjmG15esYd--


--===============3925571548545274643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3925571548545274643==--

