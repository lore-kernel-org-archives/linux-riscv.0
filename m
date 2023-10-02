Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932D7E784AC
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 13:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNYdphVNNztd5Ehr+ckWn3Ti5kaO1+uoI6hI9PZ2inQ=; b=jqOlrHWl6JQmViSwEEJ9AcEl2x
	cU5iA3EaK20dKcvgSbyV+lxkwS2HodhHFL5fN2bzGCmPE6o3APkBj6AaXR9O5EMn0EwiiNa2JMvxW
	NLYEgRz/gzdtZ5fE+fuf01Y1VUd3QdK4hIlavNP6mUvjX4Y9xEwSCnX7Gk+3083Y2/YqLkwEtHtpv
	YnyRiOmhdvYhuwQrC8Swest2jlO2iqsB93P54/Ri8pU7H1hMU1q8JdckXsEKhNGguex9BYiEjz8ho
	8f+nabuGVQXMj31rQi3b4vyw8OYWP/tfyLu+JY8EncF7f7SKmNg0+dGY+yhMZtMFJpsovvFAh/I/f
	WsaDnZxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnIvP-00Cmej-05;
	Mon, 02 Oct 2023 13:25:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnIvJ-00Cmdk-2M
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 13:25:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 24B84CE1034;
	Mon,  2 Oct 2023 13:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0E2C433C8;
	Mon,  2 Oct 2023 13:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696253117;
	bh=yMKiAZh8Zi1IRLurrlmkJCC3ZtBt6u8921RF62mKwiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ATTFpem79JBuSlV65H7DgvZGCj9e9VZO5bpbua2jGaJJsloz4yWNe4YgiS+6wNayG
	 rQEgXCWlRMulM13fhYzlXbYAwqONLzm/qUB0SaiJXCiA+Yy6lCXMWRVCVgf5bisGQu
	 lDhvgBWZc7iuYPaw1gmv6qN00GW/btCrvJ6n4Yp4hFy9rEoWOGRDj7HNaFukmL4xRP
	 jCS50V2El2LLMiQqRUvAzDJ8DsOFyiLbBWIjITnjJ9RyiJ6LJMNYHfpTCQmACQi6Fg
	 oyL4URChnP6XktZ8MRwUIx0VD+5mEPpJnvwozt1du0EMe33V34qcNcFUYE+NU9ijJt
	 5Z+qHR/n2lvsw==
Date: Mon, 2 Oct 2023 14:25:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH v1] docs: move riscv under arch
Message-ID: <20231002-exclusive-ebay-29cf9c449e2a@spud>
References: <87h6nbka8x.fsf@meer.lwn.net>
 <20230930185354.3034118-1-costa.shul@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230930185354.3034118-1-costa.shul@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_062522_121576_45E41989 
X-CRM114-Status: GOOD (  20.70  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@rivosinc.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Bagas Sanjaya <bagasdotme@gmail.com>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, Federico Vaga <federico.vaga@vaga.pv.it>, workflows@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, Charlie Jenkins <charlie@rivosinc.com>, Wu XiangCheng <bobwxc@email.cn>, Song Shuai <songshuaishuai@tinylab.org>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, linux-kernel@vger.kernel.org, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>
Content-Type: multipart/mixed; boundary="===============0959316356322842662=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0959316356322842662==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yyJILPRGEs0APJsw"
Content-Disposition: inline


--yyJILPRGEs0APJsw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Sat, Sep 30, 2023 at 09:52:00PM +0300, Costa Shulyupin wrote:
> and fix all in-tree references.
>=20
> Architecture-specific documentation is being moved into Documentation/arc=
h/
> as a way of cleaning up the top-level documentation directory and making
> the docs hierarchy more closely match the source hierarchy.
>=20
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>

Firstly, $subject is not correct - this is now v2.
Also, please do not send new versions as a response to old threads. It
buries them in people's mailboxes that do things like sorting by
threads. Clearly no resubmission should be required for either of those
items though, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> ---
> Changes in v1: rebased on linux-next
>=20
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/arch/index.rst                                  | 2 +-
>  Documentation/{ =3D> arch}/riscv/acpi.rst                       | 0
>  Documentation/{ =3D> arch}/riscv/boot-image-header.rst          | 0
>  Documentation/{ =3D> arch}/riscv/boot.rst                       | 0
>  Documentation/{ =3D> arch}/riscv/features.rst                   | 0
>  Documentation/{ =3D> arch}/riscv/hwprobe.rst                    | 0
>  Documentation/{ =3D> arch}/riscv/index.rst                      | 0
>  Documentation/{ =3D> arch}/riscv/patch-acceptance.rst           | 0
>  Documentation/{ =3D> arch}/riscv/uabi.rst                       | 0
>  Documentation/{ =3D> arch}/riscv/vector.rst                     | 0
>  Documentation/{ =3D> arch}/riscv/vm-layout.rst                  | 0
>  Documentation/maintainer/maintainer-entry-profile.rst         | 2 +-
>  Documentation/process/index.rst                               | 2 +-
>  Documentation/translations/it_IT/riscv/patch-acceptance.rst   | 2 +-
>  Documentation/translations/zh_CN/arch/index.rst               | 2 +-
>  .../translations/zh_CN/{ =3D> arch}/riscv/boot-image-header.rst | 4 ++--
>  Documentation/translations/zh_CN/{ =3D> arch}/riscv/index.rst   | 4 ++--
>  .../translations/zh_CN/{ =3D> arch}/riscv/patch-acceptance.rst  | 4 ++--
>  .../translations/zh_CN/{ =3D> arch}/riscv/vm-layout.rst         | 4 ++--
>  .../zh_CN/maintainer/maintainer-entry-profile.rst             | 2 +-
>  MAINTAINERS                                                   | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h                         | 2 +-
>  arch/riscv/kernel/sys_riscv.c                                 | 2 +-
>  23 files changed, 17 insertions(+), 17 deletions(-)
>  rename Documentation/{ =3D> arch}/riscv/acpi.rst (100%)
>  rename Documentation/{ =3D> arch}/riscv/boot-image-header.rst (100%)
>  rename Documentation/{ =3D> arch}/riscv/boot.rst (100%)
>  rename Documentation/{ =3D> arch}/riscv/features.rst (100%)
>  rename Documentation/{ =3D> arch}/riscv/hwprobe.rst (100%)
>  rename Documentation/{ =3D> arch}/riscv/index.rst (100%)
>  rename Documentation/{ =3D> arch}/riscv/patch-acceptance.rst (100%)
>  rename Documentation/{ =3D> arch}/riscv/uabi.rst (100%)
>  rename Documentation/{ =3D> arch}/riscv/vector.rst (100%)
>  rename Documentation/{ =3D> arch}/riscv/vm-layout.rst (100%)
>  rename Documentation/translations/zh_CN/{ =3D> arch}/riscv/boot-image-he=
ader.rst (96%)
>  rename Documentation/translations/zh_CN/{ =3D> arch}/riscv/index.rst (79=
%)
>  rename Documentation/translations/zh_CN/{ =3D> arch}/riscv/patch-accepta=
nce.rst (93%)
>  rename Documentation/translations/zh_CN/{ =3D> arch}/riscv/vm-layout.rst=
 (98%)
>=20
> diff --git a/Documentation/arch/index.rst b/Documentation/arch/index.rst
> index 194e7e797877..d27c360e0312 100644
> --- a/Documentation/arch/index.rst
> +++ b/Documentation/arch/index.rst
> @@ -19,7 +19,7 @@ implementation.
>     openrisc/index
>     parisc/index
>     ../powerpc/index
> -   ../riscv/index
> +   riscv/index
>     s390/index
>     sh/index
>     sparc/index
> diff --git a/Documentation/riscv/acpi.rst b/Documentation/arch/riscv/acpi=
=2Erst
> similarity index 100%
> rename from Documentation/riscv/acpi.rst
> rename to Documentation/arch/riscv/acpi.rst
> diff --git a/Documentation/riscv/boot-image-header.rst b/Documentation/ar=
ch/riscv/boot-image-header.rst
> similarity index 100%
> rename from Documentation/riscv/boot-image-header.rst
> rename to Documentation/arch/riscv/boot-image-header.rst
> diff --git a/Documentation/riscv/boot.rst b/Documentation/arch/riscv/boot=
=2Erst
> similarity index 100%
> rename from Documentation/riscv/boot.rst
> rename to Documentation/arch/riscv/boot.rst
> diff --git a/Documentation/riscv/features.rst b/Documentation/arch/riscv/=
features.rst
> similarity index 100%
> rename from Documentation/riscv/features.rst
> rename to Documentation/arch/riscv/features.rst
> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/arch/riscv/h=
wprobe.rst
> similarity index 100%
> rename from Documentation/riscv/hwprobe.rst
> rename to Documentation/arch/riscv/hwprobe.rst
> diff --git a/Documentation/riscv/index.rst b/Documentation/arch/riscv/ind=
ex.rst
> similarity index 100%
> rename from Documentation/riscv/index.rst
> rename to Documentation/arch/riscv/index.rst
> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/arc=
h/riscv/patch-acceptance.rst
> similarity index 100%
> rename from Documentation/riscv/patch-acceptance.rst
> rename to Documentation/arch/riscv/patch-acceptance.rst
> diff --git a/Documentation/riscv/uabi.rst b/Documentation/arch/riscv/uabi=
=2Erst
> similarity index 100%
> rename from Documentation/riscv/uabi.rst
> rename to Documentation/arch/riscv/uabi.rst
> diff --git a/Documentation/riscv/vector.rst b/Documentation/arch/riscv/ve=
ctor.rst
> similarity index 100%
> rename from Documentation/riscv/vector.rst
> rename to Documentation/arch/riscv/vector.rst
> diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/arch/riscv=
/vm-layout.rst
> similarity index 100%
> rename from Documentation/riscv/vm-layout.rst
> rename to Documentation/arch/riscv/vm-layout.rst
> diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Docu=
mentation/maintainer/maintainer-entry-profile.rst
> index 6b64072d4bf2..7ad4bfc2cc03 100644
> --- a/Documentation/maintainer/maintainer-entry-profile.rst
> +++ b/Documentation/maintainer/maintainer-entry-profile.rst
> @@ -101,7 +101,7 @@ to do something different in the near future.
> =20
>     ../doc-guide/maintainer-profile
>     ../nvdimm/maintainer-entry-profile
> -   ../riscv/patch-acceptance
> +   ../arch/riscv/patch-acceptance
>     ../driver-api/media/maintainer-entry-profile
>     ../driver-api/vfio-pci-device-specific-driver-acceptance
>     ../nvme/feature-and-quirk-policy
> diff --git a/Documentation/process/index.rst b/Documentation/process/inde=
x.rst
> index b501cd977053..db09a81d474b 100644
> --- a/Documentation/process/index.rst
> +++ b/Documentation/process/index.rst
> @@ -71,7 +71,7 @@ lack of a better place.
>     volatile-considered-harmful
>     botching-up-ioctls
>     clang-format
> -   ../riscv/patch-acceptance
> +   ../arch/riscv/patch-acceptance
>     ../core-api/unaligned-memory-access
> =20
>  .. only::  subproject and html
> diff --git a/Documentation/translations/it_IT/riscv/patch-acceptance.rst =
b/Documentation/translations/it_IT/riscv/patch-acceptance.rst
> index edf67252b3fb..2d7afb1f6959 100644
> --- a/Documentation/translations/it_IT/riscv/patch-acceptance.rst
> +++ b/Documentation/translations/it_IT/riscv/patch-acceptance.rst
> @@ -1,6 +1,6 @@
>  .. include:: ../disclaimer-ita.rst
> =20
> -:Original: :doc:`../../../riscv/patch-acceptance`
> +:Original: :doc:`../../../arch/riscv/patch-acceptance`
>  :Translator: Federico Vaga <federico.vaga@vaga.pv.it>
> =20
>  arch/riscv linee guida alla manutenzione per gli sviluppatori
> diff --git a/Documentation/translations/zh_CN/arch/index.rst b/Documentat=
ion/translations/zh_CN/arch/index.rst
> index 945b078168b0..71186d9df7c9 100644
> --- a/Documentation/translations/zh_CN/arch/index.rst
> +++ b/Documentation/translations/zh_CN/arch/index.rst
> @@ -10,7 +10,7 @@
> =20
>     mips/index
>     arm64/index
> -   ../riscv/index
> +   ../arch/riscv/index
>     openrisc/index
>     parisc/index
>     loongarch/index
> diff --git a/Documentation/translations/zh_CN/riscv/boot-image-header.rst=
 b/Documentation/translations/zh_CN/arch/riscv/boot-image-header.rst
> similarity index 96%
> rename from Documentation/translations/zh_CN/riscv/boot-image-header.rst
> rename to Documentation/translations/zh_CN/arch/riscv/boot-image-header.r=
st
> index 0234c28a7114..779b5172fe24 100644
> --- a/Documentation/translations/zh_CN/riscv/boot-image-header.rst
> +++ b/Documentation/translations/zh_CN/arch/riscv/boot-image-header.rst
> @@ -1,6 +1,6 @@
> -.. include:: ../disclaimer-zh_CN.rst
> +.. include:: ../../disclaimer-zh_CN.rst
> =20
> -:Original: Documentation/riscv/boot-image-header.rst
> +:Original: Documentation/arch/riscv/boot-image-header.rst
> =20
>  :=E7=BF=BB=E8=AF=91:
> =20
> diff --git a/Documentation/translations/zh_CN/riscv/index.rst b/Documenta=
tion/translations/zh_CN/arch/riscv/index.rst
> similarity index 79%
> rename from Documentation/translations/zh_CN/riscv/index.rst
> rename to Documentation/translations/zh_CN/arch/riscv/index.rst
> index 131e405aa857..3b041c116169 100644
> --- a/Documentation/translations/zh_CN/riscv/index.rst
> +++ b/Documentation/translations/zh_CN/arch/riscv/index.rst
> @@ -1,8 +1,8 @@
>  .. SPDX-License-Identifier: GPL-2.0
> =20
> -.. include:: ../disclaimer-zh_CN.rst
> +.. include:: ../../disclaimer-zh_CN.rst
> =20
> -:Original: Documentation/riscv/index.rst
> +:Original: Documentation/arch/riscv/index.rst
> =20
>  :=E7=BF=BB=E8=AF=91:
> =20
> diff --git a/Documentation/translations/zh_CN/riscv/patch-acceptance.rst =
b/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
> similarity index 93%
> rename from Documentation/translations/zh_CN/riscv/patch-acceptance.rst
> rename to Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
> index d180d24717bf..c8eb230ca8ee 100644
> --- a/Documentation/translations/zh_CN/riscv/patch-acceptance.rst
> +++ b/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
> @@ -1,8 +1,8 @@
>  .. SPDX-License-Identifier: GPL-2.0
> =20
> -.. include:: ../disclaimer-zh_CN.rst
> +.. include:: ../../disclaimer-zh_CN.rst
> =20
> -:Original: Documentation/riscv/patch-acceptance.rst
> +:Original: Documentation/arch/riscv/patch-acceptance.rst
> =20
>  :=E7=BF=BB=E8=AF=91:
> =20
> diff --git a/Documentation/translations/zh_CN/riscv/vm-layout.rst b/Docum=
entation/translations/zh_CN/arch/riscv/vm-layout.rst
> similarity index 98%
> rename from Documentation/translations/zh_CN/riscv/vm-layout.rst
> rename to Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
> index 91884e2dfff8..4b9f4dcf6c19 100644
> --- a/Documentation/translations/zh_CN/riscv/vm-layout.rst
> +++ b/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
> @@ -1,7 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0
> -.. include:: ../disclaimer-zh_CN.rst
> +.. include:: ../../disclaimer-zh_CN.rst
> =20
> -:Original: Documentation/riscv/vm-layout.rst
> +:Original: Documentation/arch/riscv/vm-layout.rst
> =20
>  :=E7=BF=BB=E8=AF=91:
> =20
> diff --git a/Documentation/translations/zh_CN/maintainer/maintainer-entry=
-profile.rst b/Documentation/translations/zh_CN/maintainer/maintainer-entry=
-profile.rst
> index a1ee99c4786e..0f5acfb1012e 100644
> --- a/Documentation/translations/zh_CN/maintainer/maintainer-entry-profil=
e.rst
> +++ b/Documentation/translations/zh_CN/maintainer/maintainer-entry-profil=
e.rst
> @@ -89,4 +89,4 @@
> =20
>     ../doc-guide/maintainer-profile
>     ../../../nvdimm/maintainer-entry-profile
> -   ../../../riscv/patch-acceptance
> +   ../../../arch/riscv/patch-acceptance
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 208cfcc1aee3..863ba7e0123c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18533,7 +18533,7 @@ L:	linux-riscv@lists.infradead.org
>  S:	Supported
>  Q:	https://patchwork.kernel.org/project/linux-riscv/list/
>  C:	irc://irc.libera.chat/riscv
> -P:	Documentation/riscv/patch-acceptance.rst
> +P:	Documentation/arch/riscv/patch-acceptance.rst
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
>  F:	arch/riscv/
>  N:	riscv
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 006bfb48343d..d43e306ce2f9 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -10,7 +10,7 @@
> =20
>  /*
>   * Interface for probing hardware capabilities from userspace, see
> - * Documentation/riscv/hwprobe.rst for more information.
> + * Documentation/arch/riscv/hwprobe.rst for more information.
>   */
>  struct riscv_hwprobe {
>  	__s64 key;
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 473159b5f303..b651ec698a91 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -79,7 +79,7 @@ SYSCALL_DEFINE3(riscv_flush_icache, uintptr_t, start, u=
intptr_t, end,
> =20
>  /*
>   * The hwprobe interface, for allowing userspace to probe to see which f=
eatures
> - * are supported by the hardware.  See Documentation/riscv/hwprobe.rst f=
or more
> + * are supported by the hardware.  See Documentation/arch/riscv/hwprobe.=
rst for more
>   * details.
>   */
>  static void hwprobe_arch_id(struct riscv_hwprobe *pair,
> --=20
> 2.41.0
>=20

--yyJILPRGEs0APJsw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRrEtQAKCRB4tDGHoIJi
0nrbAQDt+tijrtXHvRrRVExbW8E394V2d3fuesA3s5gWsmMhTQD7BPgN+CDXM6L5
JA9U4cUnXWiRYkikQn1VtlMF1oHF3Qk=
=FMgc
-----END PGP SIGNATURE-----

--yyJILPRGEs0APJsw--


--===============0959316356322842662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0959316356322842662==--

