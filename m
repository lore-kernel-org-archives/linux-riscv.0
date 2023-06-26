Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0879BEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 17:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5f/S7PEvM5e2+xlZcZUkUasfJymf9ialpfAPRIul+k=; b=xp6ba+/icBD5nBN0HjoPTaW8UZ
	fXx7+nqYef87dFoA6OqBHilK/YFVXdL9zWuzz0o3hOgGpOv5F17oEoGMa6WaLkTyp/jrxA1ESAXzA
	EkN6Kh7ckRytVCFjbozRCbfJqv+MqZRGCeKWCbY4u40oaBMfqwaoM2ScdLh2l+l4/oH9S7Y4UVRHo
	e2gZ+27hG9l/av9jinGgpAlHM7mLjZsD2TCtVyyTDNvPqdlU9bugBBwoZuKeWPju8RO0CAn25YO5u
	fdxV0iPDLmrRd2P/eTFvJ2XUnM5UUC8b7exa3jmHHodE3uqeEBd07oEFRPLD6lOYWtz5uVyX/6OsB
	m1kvRdWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDqM0-00AnF8-2S;
	Mon, 26 Jun 2023 17:50:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDqLy-00AnEM-0W
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 17:50:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF68660F0F;
	Mon, 26 Jun 2023 17:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80599C433C8;
	Mon, 26 Jun 2023 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687801817;
	bh=s4nqEhUfqmqOPxDNx5EU+3Otzr9YMuFYasx7vWRTl7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BUi3o0EUGax7OuYJDS2t1keD6ocU7m+LNpkHxmMX6C+bs9JlOACvcRkXqAxfYgb7P
	 JK7UHHt8lcVq+ADNCujsH5eo4qhfWCQufbWhtJW7Zojw7WrQbZIt9Zzw7RT4CIpCl2
	 sa1IN70Xv9F8Qpl2Gdw9U7ZfsE3dNjRtCe3tZx9XnBWI2eZQI0F4Gdy9DvIbS80RGd
	 HKBUm4qzDoUr0JvVZey1UqzJgF4czdWf33ArnasCpYhtNp0V9Uh1ZnM5YHh63tDdE7
	 oEFqynFE7kHhsW1acYcfSxYSa1jT8fZZA+WTziE89DucFONUqEwsBuCt5mqwVnhR0V
	 0sx0FDWtERGfQ==
Date: Mon, 26 Jun 2023 18:50:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen <rick@andestech.com>,
	Leo <ycliang@andestech.com>, Oleksii <oleksii.kurochko@gmail.com>,
	linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org,
	u-boot@lists.denx.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230626-eliminate-grimy-b229724dc830@spud>
References: <20230626-unmarked-atom-70b4d624a386@wendy>
 <CAK9=C2UesoUCeb8k0DSCHi7Zr+B5U26KQ9oCs9map3a2zzYqAw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2UesoUCeb8k0DSCHi7Zr+B5U26KQ9oCs9map3a2zzYqAw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_105018_237070_A96F3269 
X-CRM114-Status: GOOD (  11.46  )
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
Content-Type: multipart/mixed; boundary="===============6031697662025567452=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6031697662025567452==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m57Jtotn9Env+EUp"
Content-Disposition: inline


--m57Jtotn9Env+EUp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 11:08:43PM +0530, Anup Patel wrote:
> On Mon, Jun 26, 2023 at 3:42=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:

> > acpi
> > =3D=3D=3D=3D
> >
> > The current ACPI ECR is based on having a single ISA string unfortunate=
ly,
> > but ideally ACPI will move to another method, perhaps GUIDs, that give
> > explicit meaning to extensions.
>=20
> Drop this paragraph on ACPI.

Sure.

--m57Jtotn9Env+EUp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJnP0wAKCRB4tDGHoIJi
0s8VAQCUTZ2Haqv+3bKnIWj5oQn4AdHRibKGwI2p8ygrlmJ+1gD8CvNs5ZjWLL3X
2Qo1nAeXl/D8F50sG29i3UXpjYBj5wM=
=7wbM
-----END PGP SIGNATURE-----

--m57Jtotn9Env+EUp--


--===============6031697662025567452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6031697662025567452==--

