Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A75ACE8E96
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/diyMqE5ObAEk1UQuMND1mkkpRHGhFjATc6VRpSB48=; b=iP5hnuakhAbb0FzyInjH6phJx3
	kn87jIKCMvn7spBGJq8sJadJGtF/qSbuox6ggNW78Ba31peqvwKq9B5DwK7MV7o9rRsFtbDm94f57
	WoWG/DRi/ZCHlZv+WWAlPlPzHwH/KP96jrnwR7tcKruRVkV7UVvrAjRvgeVVyiDPwZF2r5Bb0iqgZ
	d/5BYxXENqd3gNzyuYyAaF1+Lu4OAE4nvGR5r32a6L4Cuu3EbSXiIsyiUqbTalIkiZCzSkD9zRIwb
	IZBqXTDr9sKHN7USUPcj/T5X4uXAvB5GPoQ482AKcHr54i9xX8NiqGc9MbTNjxlQp7ypgegKxYiTp
	yPgFWBfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40yO-00000001914-1QeR;
	Thu, 24 Oct 2024 16:46:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3znl-00000000v8l-3Tet
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 15:31:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9CCA25C5FCF;
	Thu, 24 Oct 2024 15:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E0BC4CEC7;
	Thu, 24 Oct 2024 15:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729783864;
	bh=K7zEZgEZbViwzMMRQ0QXl3jFAoDQTtP+TsdXxL72sZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oAjy6GCkFa++uK9gJOQ+t891g6XUimozmrKCz7H3uJArFIKFObdpZ6WocZIFukDlT
	 gVUcwttxb6SqDtTy9EGh8VMFmuTvSoPY0GkFnRr8WBTVg4s/BeGv0z6R/uCtdBMv4Q
	 ws7XxSyNHoip+3hOMCwUKT0rs3+bit34vF1vGx778t/C/3kFZ0B3EvayFqoNJwkRHk
	 Cy+4y28wLdaLJPxLhQlAY4NE+Xnm81Lif+924QYymQVly+X7ZBJv9FKNqA76WSEqlM
	 KL2i8I/1kMY0H9GRMN4qazaUAGlxJI2mjvPyaJuiGH5DJy44W9ifY+J1XzuuYfr/Um
	 ky27ue2/usQnw==
Date: Thu, 24 Oct 2024 16:31:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH] MAINTAINERS: setup support for SpacemiT SoC tree
Message-ID: <20241024-penpal-skillet-c44a389e0d4d@spud>
References: <20241023-00-k1-maintainer-v1-1-c06b791cc2ee@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20241023-00-k1-maintainer-v1-1-c06b791cc2ee@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_083105_992531_9E1E25F1 
X-CRM114-Status: GOOD (  24.56  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Meng Zhang <kevin.z.m@hotmail.com>, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, soc@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: multipart/mixed; boundary="===============5802207203632652495=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5802207203632652495==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9jdBzSMd637lxed/"
Content-Disposition: inline


--9jdBzSMd637lxed/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 12:18:19PM +0800, Yixun Lan wrote:
> Add myself as maintainer of SpacemiT's SoC tree, which
> suggested by Conor [1].
>=20
> Link: https://lore.kernel.org/all/20241018234615-GYA2124001@gentoo/ [1]
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> This will setup proper maintainer info about Spacemit's kernel tree,
> which should help to take soc and device tree patches, and send the
> pull request up to Arnd's soc tree.
>=20
> I asked Kevin to host the kernel tree under SpacemiT's account
> on github, which should help people to get access more easily,
> and promote the tree a little bit.

What do you mean by "get access more easily"?

In case it is not clear, noone other than those listed in the
maintainers entry should be pushing content to the fixes/next
branches and all patches must go through the mailing lists and review
process. I'm sure you're well aware of this, but I've never interacted
with spacemit and don't know if they are.

Make sure you add the fixes/next branches to linux-next when you have
the branches established.

> I could take this patch through this spacemit's soc tree if no objection,
> of cource, after got ACK.

Yes, do it along with the base series, when that goes in.

> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e9659a5a7fb3347d649855992a559e3526d18443..4087023593f7a0b2d5c5827df=
682230c329f82a9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19791,6 +19791,7 @@ F:	arch/riscv/boot/dts/
>  X:	arch/riscv/boot/dts/allwinner/
>  X:	arch/riscv/boot/dts/renesas/
>  X:	arch/riscv/boot/dts/sophgo/
> +X:	arch/riscv/boot/dts/spacemit/
>  X:	arch/riscv/boot/dts/thead/

Huh, this is not meant to look like that. Looks like the patch went
missing. I'll have to rectify that. You can drop this hunk. I'm going
to invert it:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=
=3Driscv-soc-fixes

> =20
>  RISC-V PMU DRIVERS
> @@ -21578,6 +21579,14 @@ W:	https://linuxtv.org
>  Q:	http://patchwork.linuxtv.org/project/linux-media/list/
>  F:	drivers/media/dvb-frontends/sp2*
> =20
> +SPACEMIT SoC Support
> +M:	Yixun Lan <dlan@gentoo.org>

I'd like to see someone else here, but if noone is volunteering
themselves, we can hardly force them!

> +S:	Maintained
> +T:	git https://github.com/spacemit-com/linux
> +F:	arch/riscv/boot/dts/spacemit/
> +N:	spacemit
> +K:	spacemit
> +
>  SPANISH DOCUMENTATION
>  M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
>  R:	Avadhut Naik <avadhut.naik@amd.com>
>=20
> ---
> base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
> change-id: 20241023-00-k1-maintainer-46eb3f31e6f2
>=20
> Best regards,
> --=20
> Yixun Lan <dlan@gentoo.org>
>=20

--9jdBzSMd637lxed/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxpoNAAKCRB4tDGHoIJi
0nd2AQClGkpei3Vuj3VpSnLrsS0fgviW2IJC3iM7EV2zPOp8oAD9EN4xl1JjRxGX
4gNDHVMG2ZH1kHcfs2M0mAqMMO+DtA4=
=4Zk+
-----END PGP SIGNATURE-----

--9jdBzSMd637lxed/--


--===============5802207203632652495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5802207203632652495==--

