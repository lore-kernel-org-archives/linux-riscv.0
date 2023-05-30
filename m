Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE16C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 20:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cf7BJ9zjhA/Ieed7J8MKuBc95A3JhIIBRzkgT4DAlJY=; b=P7wmnHY7eBvoamN1lK41Ee10Rz
	JMUn4X1gDiwXp9f8rWNI/xncFFMAEtYxlo0hO7sSTDX82AWbghFSNbRcxND4khUA2ZBdNEUc7DKxs
	UE2O8i5TnpwFnUk46QB72UfWeM57Ca2nTp4jPjWF+9QqyvfItMAWGztkWj6726aiz4VSblX7ju2sI
	pQm1lH0SdEsGUdncxDdUEwqSsiqOiga40RqVTp01c0Z/IOeIzSpDaSXTr0RI+MtIrR1pyd89FeTid
	7WS5VHtx575Hywda157XegEZwTw4SPRX+1/r4DW52J0ymyu8neBQt5F2ulnB/poOfZ2UqxhsKwO4U
	6/O1Yovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q45rz-00F5UX-2s;
	Tue, 30 May 2023 20:23:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q45rw-00F5U2-2D
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 20:23:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C078360F13;
	Tue, 30 May 2023 20:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581A6C433EF;
	Tue, 30 May 2023 20:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685478179;
	bh=4DN+utQWh38lU/aZ6R0seCQUmXbUMKSQnd7XfU2PdBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hNT5Aoq3zxhrXOaYVXhGMDLVtwHCvTOzsTW0ypZB6kAVw7iLdTToHxM8bU2jg69+y
	 oIegGjzECGgRDYouWDmaa8ILaVM86EJgxsig8N+1y/p48kjte5LUzXfTwoLqreO7cw
	 4nv4Fn2LzzAboQN6t1GTPWJZHUoCRp1ySQF9a48qy3Bd7daj5Gn3bMLpF+5lW6nhbs
	 txu+OnlJw2v3Sk5XhuEmAjM4IaF31uwmqvpSwayudVkRrmVDTyzYKoi8Wg+WkSsOea
	 vNablcbJ4rwzMIl1RWSHlWZYvNs7XXxkXffTzDMKn3ty26puoZqn74fBrK9qgfyUz0
	 pzVQCGbEx3UAg==
Date: Tue, 30 May 2023 21:22:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Schwab <schwab@linux-m68k.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
Message-ID: <20230530-atrocious-control-bcb37de558fc@spud>
References: <20230528-darkness-grandly-6cb9e014391d@spud>
 <cf0d2d2a-c407-7b3d-a5ab-ea5c19e7b890@ghiti.fr>
 <20230528-uneatable-earpiece-3f8673548863@spud>
 <b71dc2f5-fdc0-2a8d-e1f9-696cd9a1529e@ghiti.fr>
 <20230529-skillet-quarters-3fbc3b6edb3a@spud>
 <41e57bb9-ce0c-7772-abeb-5c01d5ec19bb@ghiti.fr>
 <20230530-polka-trifle-7ccd7a093099@wendy>
 <92d4aaa8-a1ed-74e1-3a22-df9be1ca1e4a@ghiti.fr>
 <20230530-hatchery-unifier-64d7a2ffe0d0@spud>
 <CAHVXubgG31moSNOe3fRqFzUSJK9tRWKH1KPP_BO7wRNC4WzxTQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubgG31moSNOe3fRqFzUSJK9tRWKH1KPP_BO7wRNC4WzxTQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_132300_785630_AF7853EF 
X-CRM114-Status: GOOD (  11.77  )
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
Content-Type: multipart/mixed; boundary="===============3651214841246205679=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3651214841246205679==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Axts1iAZiGz20SHU"
Content-Disposition: inline


--Axts1iAZiGz20SHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 08:04:17PM +0200, Alexandre Ghiti wrote:
>=20
> Ahah, I think we found the culprit!
>=20
> With CONFIG_RELOCATABLE, vmlinux is actually stripped from all the
> relocations (so that it can be shipped) and vmlinux.relocs is what you
> should use instead, since it is just a copy of vmlinux before the
> removal of the relocations!

That probably makes us both eejits for not realising sooner...

Tested-by: Conor Dooley <conor.dooley@microchip.com> # booted on nezha & un=
matched

Thanks for your patience here Alex.

--Axts1iAZiGz20SHU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHZbHgAKCRB4tDGHoIJi
0jaVAP9PHoU5a5+zRhdA/FBl5TFJ8x8d2o/6P5u3gk9yQsxuzAD/dLh6VZFvWFlO
ETHZVpo1mS3y+rIvKBc3kHQ3cOpwGwY=
=uZdZ
-----END PGP SIGNATURE-----

--Axts1iAZiGz20SHU--


--===============3651214841246205679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3651214841246205679==--

