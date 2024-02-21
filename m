Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E238CC48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 14:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZW4C0QvPQzyJUrHZN0vqFHFZYU+1mnwgkmlUMv7Nb4=; b=wKzu/bHIuLR9h2S8PXg1mXZlei
	Ju4nkJrOHi0Sa6kfIXv0e155FzcmaK/uOi1ICiBV9lHVj0dh8gxD5z8R+IApWtW48tun2BcoJLkfO
	79s8bys9TUh662HcigFZI58k6udKGOO/IZO8gye3w+zXzWoTd4l1RkqA1Ps4/6N5wyu2eDiZZthKE
	tnQ8cAUnWIOL+1mZ1sxruVsgslhACsB3iDuBZqFEtY1xZFDyG+kvBl5l4y1R+Fa6nxuNb7nYcRkwF
	yBq4JRW75yH+SsW6TIf6u1NgbCFsHRSOFeU5bzAUBivSsiS5Lj1G0Dbf18kX4t04bemfSQRHcdFi3
	DvapCRjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcnww-00000001MPW-4BGv;
	Wed, 21 Feb 2024 14:51:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcnwu-00000001MNy-0TkR
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 14:51:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AB6D6144B;
	Wed, 21 Feb 2024 14:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE38C433C7;
	Wed, 21 Feb 2024 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708527111;
	bh=HPUPYQyaExW8zA3yPaGmJKIXa5Geol1ui08QSwOJ+e8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dMFnpjLXedjM59DSIP7iXzY0WAdOEKWw2u/GS9ufpmMUhyN1gq2g56jJr1k5cb6me
	 ndysQF7iAZHjVGkxJl2V/twPaSZxqgpBWSG/5mJYAUw71cd0FPPz7UvcHNaAaYvbP2
	 hCl9qtJuDmcpRxM2uSR7CoNhU60gCMgSxl75YS+dcLs8NvtMmXH/jcfLfoTxla6Eam
	 4dGj5WLY8810xEziHMVbFfO3CV5HbXz1e5ojaa/UFlnVAbanhfqAuR0ETEC1wbqWTL
	 nlYTECKP+aLri0NjRU/zScHoCyXQzwcaWAtm3Wa2kgdC6Iqzs/IdkfsR62xmNe2RO9
	 t2iypTiwEKWqQ==
Date: Wed, 21 Feb 2024 14:51:46 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robin Ehn <rehn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Stefan O'Rear <sorear@fastmail.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v2] riscv: hwprobe: export largest userspace address
Message-ID: <20240221-pacifism-seismic-589dbbcbf38b@spud>
References: <20240220110950.871307-1-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240220110950.871307-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_065152_287841_2514ACE9 
X-CRM114-Status: GOOD (  12.05  )
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
Content-Type: multipart/mixed; boundary="===============8029550320392333227=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8029550320392333227==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XafRae+w6EWwmvjz"
Content-Disposition: inline


--XafRae+w6EWwmvjz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 12:09:46PM +0100, Cl=E9ment L=E9ger wrote:
> Some userspace applications (OpenJDK for instance) uses the free MSBs
> in pointers to insert additional information for their own logic and
> need to get this information from somewhere. Currently they rely on
> parsing /proc/cpuinfo "mmu=3Dsvxx" string to obtain the current value of
> virtual address used bits [1]. Since this reflect the raw MMU mode
> supported, it might differ from the logical one used internally.
> Exporting the maximum mmappable address through hwprobe will allow a
> more stable interface to be used. For that purpose, add a new hwprobe
> key named RISCV_HWPROBE_MAX_KEY which will export the maximum mmappable
> userspace address.
>=20
> Link: https://github.com/openjdk/jdk/blob/master/src/hotspot/os_cpu/linux=
_riscv/vm_version_linux_riscv.cpp#L171 [1]
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Doesn't build for nommu:
https://patchwork.kernel.org/project/linux-riscv/patch/20240220110950.87130=
7-1-cleger@rivosinc.com/

Cheers,
Conor.

--XafRae+w6EWwmvjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdYOAgAKCRB4tDGHoIJi
0obVAQC6GAs9ZIYjcC3yuuwCX/HL09UmNvDXdYBZhG/lJ6OKywEAp01wPF8n5uxf
K6XtGuHbFpAbomgUMPBexQpL2ieUxgM=
=gv0b
-----END PGP SIGNATURE-----

--XafRae+w6EWwmvjz--


--===============8029550320392333227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8029550320392333227==--

