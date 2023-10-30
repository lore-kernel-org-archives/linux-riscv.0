Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A20BC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 10:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2V4Pg89ADqlb3VBxGqcLBJ3ta1pGWTqIlgF1du/Ohvc=; b=jCKD7p1uetziWRklDq/3rztbUW
	6mA5zSlj+nchZtaVPxk9YQBfjLDK01xJyDpRtFI1ncB9YTF5gTAFrSnciF/g1AzH3ii45jDLZUVIb
	P84hETRN64X7IPaNQVnesHPo63/uSa3Q1SqUoUQkAAZlTZ0QhRZmKYO6Z/LOatAattPYRfnJMkwdF
	gpk/8jkFWP46Xe5NTAcUakRsZ2KhcMcDUtSxW2/T3dI4/b1sBAcC3D86QQ4eEVniJmWZ4oKuEtwHP
	IAD1c9R8LpZUm7SpLAE+4c6qoKhyOsChkPAvI7n9SwUSr6h5RBOW9Dv7BcOrZNG2s0ZTIMurXqtzq
	uFnGH3hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxPwY-003DBY-2C;
	Mon, 30 Oct 2023 10:56:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxPwV-003DAO-34
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 10:56:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 63E09B809D2;
	Mon, 30 Oct 2023 10:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD9CC433C8;
	Mon, 30 Oct 2023 10:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698663381;
	bh=mscw5FoNP8WY7i1Rz1mdswb8KnRo5eaSMEj+P0a+Bt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKhdv2vFyRH3tqd9j6a6kIg80mr3hrBRMbYrR/GvVKU9SKJlfeh3EqFiJhrgjp9hb
	 LYbTjkvJ/xE0VKaq31fSNwioL2MqJZ+sRamOO5k5VeBxhkCSTsRa+ua3bko0uYLYde
	 MV1WSTYDpUInCc0lxrwFENVHgIsW8vYhLuS97PaYbPyE0lG69ozycYR64+9cGq4E/L
	 /Adw33OLkWrbqfaBLIfrk/pnxRxfqQfhFQVciR84B/zsgPCr7h+zNDb7qH7lk3UZ1J
	 ThqNvnHvafzgyWf44nTGpy7IcOfjquLKp9bSLbV/qmTgok/xu9lxSvyN17pRvlXmiy
	 C1qbXtNRX7mVw==
Date: Mon, 30 Oct 2023 10:56:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
	apatel@ventanamicro.com, palmer@dabbelt.com,
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] dt-bindings: riscv: Document cbop-block-size
Message-ID: <20231030-attest-unchain-ab99981a5738@spud>
References: <20231029123500.739409-1-dbarboza@ventanamicro.com>
 <20231029-kitten-provider-1602fa805c35@spud>
 <680a2f25-59e7-4757-ba93-1de7fe1279e3@ventanamicro.com>
 <20231029-sappy-ought-98fecff551fc@spud>
 <20231030-d3db6c3f8cf46bbdd8191d65@orel>
 <513ea612-b354-44d4-b6d7-490741ed14a3@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <513ea612-b354-44d4-b6d7-490741ed14a3@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_035624_163508_FEAF647E 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============8055422021790569907=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8055422021790569907==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IIaFEd3wvXZ+3DFb"
Content-Disposition: inline


--IIaFEd3wvXZ+3DFb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2023 at 06:14:45AM -0300, Daniel Henrique Barboza wrote:
> On 10/30/23 05:18, Andrew Jones wrote:

> > I guess after letting this ping-pong back and forth in my brain a few
> > times the ball is currently resting on the "let's add cbop-block-size"
> > side.
>=20
> I'll go ahead and understand that it is ok for QEMU to add a riscv,cbop-b=
lock-size DT
> then.

Aye. And in case it was not clear, here's an unqualified ack.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Can you pick this up Palmer?

Cheers,
Conor.

--IIaFEd3wvXZ+3DFb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZT+L0QAKCRB4tDGHoIJi
0hMPAQCMsCb+SvAVdgaM4m3P6r43xVt3M4diRiIs8T4bT4M6KQD/RIJ9/1xcf4eh
tb4QBNhay5DF281J59X1Vu84npUgawU=
=xciD
-----END PGP SIGNATURE-----

--IIaFEd3wvXZ+3DFb--


--===============8055422021790569907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8055422021790569907==--

