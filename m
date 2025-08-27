Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00CBCA0EFF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 19:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5vzYm7jj0Z+wJasnSYZ4llcxUsfwUsIGMVndXPUf/I=; b=trs3sv68rEghEt5wSy30SYRisr
	U3z/SdqtEhyWhxebhj9mHbJplIIfANoJgniLGUNAlrcBZxIDgMymcL+5fr9BaeyUlfib+YkX9jAnB
	G53A/Nyp3tog9OXIuiUwRqhCBuvyb71TMC/8qgDObr3DqlmKm8Za4xlwf8tTxs9qT2oXYjJI+SAtN
	O80TaEQa1gujA0pOoZ1L3CBsHmOtw1pjuP9dsqTDTmpOm6cF3VZ30/9kWspAibecIesrhn2YMSykK
	ueakJ2YijFPCqlL9+m56p8NdlMkZ2Zl9JIqLFNUEJNXC41PyG7SWjYpPPoeJVgaiCtvxW+he31ZfZ
	tYX0oG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLxm-0000000GdDB-1bJN;
	Wed, 27 Aug 2025 19:37:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJzQ-0000000GK8C-30Cg
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 17:31:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11F93601DA;
	Wed, 27 Aug 2025 17:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7677EC4CEEB;
	Wed, 27 Aug 2025 17:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756315875;
	bh=cXxFf40MPDViexLTcqO0ztrjyez1wiDGf0ZJBEGexao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tyR2QNtN22RvMDohWgsRxKLr4FDC+++nmC+K23QB0czoCoV9wY0GfXKCx6P+xDtW/
	 ZpCPe49Yu4BqdPI9kZYDJxp4y1dzpN/OrQCtYTlfNu1SFTfGBjJCWlz5Qt0mJaoOCh
	 5V5ecyHf9IgmKtmyaoOZm47WjmTTPimv+CSUN+toJ2qxd00wwzRpzKoXwLJN0ao5eY
	 05XOUjLA/cCTP6ENn5rv5r59tJEoE3yfUjWqZiu6Go3M/yFqAVbfFtr4JVSlh5Sg5g
	 l4sD/2Ko33Vlga370ZkhPXbMhiaZy1lOsdYrovz/unS6m2srqvq3UJkAj3R73vKjyq
	 9Q78SHoGD+pHQ==
Date: Wed, 27 Aug 2025 18:31:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	patches@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 07/12] riscv: Remove version check for LTO_CLANG
 selects
Message-ID: <20250827-stick-duly-b40d7e90de1f@spud>
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
 <20250821-bump-min-llvm-ver-15-v2-7-635f3294e5f0@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-7-635f3294e5f0@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============1536348893854432894=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1536348893854432894==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9hV4SjGmbLMT0uH7"
Content-Disposition: inline


--9hV4SjGmbLMT0uH7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 02:15:44PM -0700, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been bumped to 15.0.0, there is no need to check the LLD version
> before selecting ARCH_SUPPORTS_LTO_CLANG{,_THIN} because it will always
> be true.
>=20
> Reviewed-by: Kees Cook <kees@kernel.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--9hV4SjGmbLMT0uH7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaK9A3wAKCRB4tDGHoIJi
0nSUAQCDJ2G/cZdQFmAmDOl90XeIgL2nlWFCnq0Pv2BL+l+WwQEAlL0ORgY2kcgL
CJQL4AtmMpjkg5O2g+HksQ80QfPKFgo=
=KfEH
-----END PGP SIGNATURE-----

--9hV4SjGmbLMT0uH7--


--===============1536348893854432894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1536348893854432894==--

