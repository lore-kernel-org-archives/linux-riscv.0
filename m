Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3D5C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 20:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4VFHPrLvqOMHGqHGuyNn+D6wGbViGzAB7QV0bJW+N8=; b=Ave4zG42AQPFw3w0Zetx76LQHe
	cFeFm8nZx96SBvk1mWxNAt4iRe9egtldQ8hCYb8tWXZEIb+6Q7Pc7j1EWf0eUpG463k3+xI3JswV/
	mwBv1h07riQFUc+z42FkVLufYbH+pkHTNaDeRL+QJNQRe/LZYLasQWGLW87L69aYMGyggfpFkdeZv
	kqpkO9MJw1jvJSjaWuaw4ekWeMKJDF7AA34GDt7FP+Wb30r1qwZYRuFKfinnRfWgyTILpnoN+hS9T
	imn5pu37EfzcgHVeXW9rCP1IyWRo0Ff1IXxHS4mFOHXGz3XNtxLBma78W/G9QBeVSA+sXTwfyM4zK
	lPj8aHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMDhA-008pft-0n;
	Wed, 19 Jul 2023 20:22:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMDh7-008pf3-03
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 20:22:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88AD5617D6;
	Wed, 19 Jul 2023 20:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378A0C433C7;
	Wed, 19 Jul 2023 20:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689798163;
	bh=+TuQPa0/6AKwb7VKvotz3kL95KrA4s7VS8/HsfyxKhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GHJOppq/snFQmNDnAt58PcMQxBI7nTrHH/pQraw523/4bxYkDkg8WyzLdVDGI4JfC
	 gGPwJN3r2Umnr/c+EhyVkKUedoJaUkAuhTcSiuHM16vBYryCxBAMvC6rkw/KNpi35s
	 X5pcrUqrmnnS80jHmT08JI7XTChugLPK/0QAsiFzQNyg3e8Swq+X+80DJ3NRG+Vpfk
	 h3L9awqrsGJA8JgQ71bdVOV3hi/gwanv7fdtJXX5o3/6gmiWbcjeM483v71/m8mQxp
	 AWyHw3J04bWXj6wUDU4vCqnP3ieplhs+YLzucVxl77cYpHiK0HDegIBKVe5EmpEBLY
	 Yn1JZuallQe2g==
Date: Wed, 19 Jul 2023 21:22:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com,
	linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>,
	iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	Nick Kossifidis <mick@ics.forth.gr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 02/11] RISC-V: arch/riscv/config: enable RISC-V IOMMU
 support
Message-ID: <20230719-marbled-drivable-804aacbafee2@spud>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <961d125558137f7cb960de65e5f71da5d299d3bc.1689792825.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <961d125558137f7cb960de65e5f71da5d299d3bc.1689792825.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_132245_097344_31515747 
X-CRM114-Status: GOOD (  17.26  )
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
Content-Type: multipart/mixed; boundary="===============4201182228223655112=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4201182228223655112==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZC9b2YYOk1fPhC2j"
Content-Disposition: inline


--ZC9b2YYOk1fPhC2j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 12:33:46PM -0700, Tomasz Jeznach wrote:

$subject: RISC-V: arch/riscv/config: enable RISC-V IOMMU support

Please look at any other commits to the files you are touching
and use a subject line that emulates them. In this case, try
git log --oneline --no-merges -- arch/riscv/configs/
Same goes for the odd pattern in your driver patches.

Also, the patch may be trivial, but you still need to sign off on it
and provide a commit message.

Thanks,
Conor.

> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 0a0107460a5c..1a0c3b24329f 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -178,6 +178,7 @@ CONFIG_VIRTIO_PCI=3Dy
>  CONFIG_VIRTIO_BALLOON=3Dy
>  CONFIG_VIRTIO_INPUT=3Dy
>  CONFIG_VIRTIO_MMIO=3Dy
> +CONFIG_RISCV_IOMMU=3Dy
>  CONFIG_SUN8I_DE2_CCU=3Dm
>  CONFIG_SUN50I_IOMMU=3Dy
>  CONFIG_RPMSG_CHAR=3Dy
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--ZC9b2YYOk1fPhC2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLhGDQAKCRB4tDGHoIJi
0mLOAQCjr7sDbCmb9A6zxx6/5Do/Y1kCHUQH5CJPesMyClbqHQD/X5yNQ4zvkn+N
Q8dUU6CSaELl+p7aG4OKlflP3KBBOQo=
=pChR
-----END PGP SIGNATURE-----

--ZC9b2YYOk1fPhC2j--


--===============4201182228223655112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4201182228223655112==--

