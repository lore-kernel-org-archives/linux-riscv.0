Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D1EC77B76
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 17:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3qQLNHi0BN0QleAqBeiYy2oG5IDuhLVtHhBGiUJHvQ=; b=exrVHjmAL2j4+524q/E40D1sU6
	6tCb3CD9fKGBrIU9tRzjfk1SUsRMT0CM53zkjfY/N+qTeN/VD1IyqFfR4ynIIZsn3zU2rxxyOlR84
	ugFGm2FZYpHFuE0LCyWOg8NGI7e39L3O23BfhHBO/9GMxwi/4dXzF5zbYrDM6IZ+WG36GzEqCx+OI
	YScU/XISbpl/bdHczT9FK48GofiFKzvOuHg6l1yvR5kwLsV2Pc138Asb8OA4VmtdsWEpv0QweH/Uj
	r3yxw8HT+WreQjIx9VF63n2YSrxB1B1Q6XTugK+HuGj+fLVtqSh8gm/i8Agmy+Dt3GrGsAoziNI4m
	O7bJ4mSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppusF-00BXiZ-2s;
	Fri, 21 Apr 2023 17:48:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppusC-00BXhT-34
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 17:48:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 59F5460F08;
	Fri, 21 Apr 2023 17:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA67C4339B;
	Fri, 21 Apr 2023 17:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682099319;
	bh=Ii+umwiPLgHoqPjWpVsscc+8uzYEd6xFhrolQQm/Ak8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WXAcwdQ02eP9WM94jFJIStkVwvRoVn12l3/Io2y38uhwsw+tNWbH4bNgCYFKEh25l
	 qZ8FWbQt7DAwviohxha0vPtzUfrl7RIfUJ/LqBIMwEvZW8WwMiLPAGCLAPo6P8beN5
	 +wR15BdwtJtgCaO7tp9lGGeA1O3OWGcKRPRSDmHERG+H5otPnykPSYxqXGiSlJv++g
	 5+DHYuK3epfiIGN3eWjSBfKLzPz/L4aTy6CeIOZmV+fvGPibtvyBYPTnpacP9ODO5P
	 eDrTjm9oxC1q3+7td1u/XZimFrB0cJs+hbzzhRHWOyygItlvwxnvzyQMQL0ibIxqza
	 /4yfpIY/6Vqow==
Date: Fri, 21 Apr 2023 18:48:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: hwprobe: Remove __init on probe_vendor_features()
Message-ID: <20230421-humpback-thesis-052993278582@spud>
References: <20230420194934.1871356-1-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230420194934.1871356-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_104841_034099_4ED64C4C 
X-CRM114-Status: GOOD (  12.88  )
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
Content-Type: multipart/mixed; boundary="===============0649781249536385009=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0649781249536385009==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aRxAucu+VMU5sivz"
Content-Disposition: inline


--aRxAucu+VMU5sivz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo Evan,

On Thu, Apr 20, 2023 at 12:49:34PM -0700, Evan Green wrote:
> probe_vendor_features() is now called from smp_callin(), which is not
> __init code and runs during cpu hotplug events. Remove the
> __init_or_module decoration from it and the functions it calls to avoid
> walking into outer space.
>=20
> Fixes: 62a31d6e38bd ("RISC-V: hwprobe: Support probing of misaligned acce=
ss performance")
>

BTW, in the future, no empty line between trailers.

> Signed-off-by: Evan Green <evan@rivosinc.com>

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--aRxAucu+VMU5sivz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZELMcgAKCRB4tDGHoIJi
0r4oAP9MpkA95QmPfsVGArIe3XYGzsfJ9qessAghtLLA7WxNPQEA7mgwhKGzi3dJ
ox2EWtciEAdDRS5RDGNln4ou3RSMWwo=
=JmiQ
-----END PGP SIGNATURE-----

--aRxAucu+VMU5sivz--


--===============0649781249536385009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0649781249536385009==--

