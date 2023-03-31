Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68091C761A6
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 20:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THg+x5a90FIDSywIn/3i/+MBpZkEsA5nfANRyhb3f1E=; b=GRB+V6P9ce45U/98P/D4Z1lxSy
	hzC65bah67VqGteMwd7JB8hLl97w2gmYZG+Wu+0K9dvW4H01JS1d682vOQ8hZQ/JCJF7zajl9W7I8
	VAla6lSCmO4Ieb9Bd99OBqnRfjiGBhOW2bR9vyHIa+pV+ehGb3gQi9fYklSnuo8EktYFVe2rE79KZ
	qd6U96cG1YI+dCZ999SRcTF7APJKDOt15py7luXIwwZ/GkIT2WLEmtjk9cD/HlIe01xrORkNIh6pW
	/I3nWozed2RGzMFDFtvO/jfNQwh8TXPsYLPg/cgXYZ8YUONfWxW1xsiIvBlCI2IEIbfENVFZiw163
	rMYbzZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piLAI-008jfl-0z;
	Fri, 31 Mar 2023 20:16:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piLAA-008jej-10
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 20:16:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B97A62BB3;
	Fri, 31 Mar 2023 20:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44293C433EF;
	Fri, 31 Mar 2023 20:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680293753;
	bh=16dwsgZWYBPEcC5Mo0pKMFJte2h3ZbqjXpx66wj21YA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tukh8HKpkIKrGnzD7GGfO5MBqpoaQ94utwny7C0Hv4uqcjdYsFR0z6rZPGeDBkhkg
	 UwBnGYapRWzEQTpmeQK6vxn6mahEdbz+h0kGVRKpRKCzKtH9izPGLQ8BrIZx9nNy4a
	 oa5nxeK7E3RiDg5FtX5u734NQKO0m9EX2XM2RRZbNCbWEGxe6Jkm1A6nHN0fCrCLAt
	 Fa3hwloajB0ybTUimh06xCDoXuRDrJU5CJF+nRpsbAZaTQNPmA6SrZot7MALuqW4+6
	 eYmxF0KHLzrpRETlghwGq8GNwE+UWox/oX6+nQ3n0XsIaChqIoLVpZSissV2T5s9Ww
	 JdnlG/vn8JZlg==
Date: Fri, 31 Mar 2023 21:15:46 +0100
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v7 0/6] RISC-V non-coherent function pointer based CMO +
 non-coherent DMA support for AX45MP
Message-ID: <0d5590e4-e78b-4197-bf17-9de54466470d@spud>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <b2dcda17-5850-47c1-94bc-4ca87f900581@spud>
 <CA+V-a8s+=OY6CX4XTUwyAE9b=rdJZZfgAaY2nU+6aqnu=X9nxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+V-a8s+=OY6CX4XTUwyAE9b=rdJZZfgAaY2nU+6aqnu=X9nxQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_131558_530613_A08179A0 
X-CRM114-Status: GOOD (  19.13  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Samuel Holland <samuel@sholland.org>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Biju Das <biju.das.jz@bp.renesas.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============8786480078718674177=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8786480078718674177==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r7DYywVukqmnzbkh"
Content-Disposition: inline


--r7DYywVukqmnzbkh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 08:09:16PM +0000, Lad, Prabhakar wrote:
> Hi Conor,
>=20
> On Fri, Mar 31, 2023 at 7:05=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, Mar 30, 2023 at 09:42:11PM +0100, Prabhakar wrote:
> >
> > > - This series requires testing on Cores with zicbom and T-Head SoCs
> >
> > I don't actually know if there are Zicbom parts, may need to test that
> > on QEMU.
> > I had to revert unrelated content to boot, but my D1 NFS setup seems to
> > work fine with these changes, so where it is relevant:
> > Tested-by: Conor Dooley <conor.dooley@microchip.com> # tyre-kicking on =
D1
> >
> Thank you for testing this. By any chance did you compare the performance?

No, just tyre kicking. Icenowy had some benchmark for it IIRC, I think
mining some coin or w/e. +CC them.

--r7DYywVukqmnzbkh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCc/cgAKCRB4tDGHoIJi
0qcNAQCb/JCLCWAyFRm/yAdbNFnCLXnc2InpcdffRHVHLrmn2QD9HXRaoIyBKy8C
+GZGUxjBua3BKi4ILC22+PF1eF7MvAk=
=W6KH
-----END PGP SIGNATURE-----

--r7DYywVukqmnzbkh--


--===============8786480078718674177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8786480078718674177==--

