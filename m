Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6945D29C58
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 18:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLBDxJ315D0YRipcpeeCNmaHdhWEpTGUFzJkFWeOreU=; b=Ter3zMs8UkxF/7neorEktvQHjS
	WGG+j3B8dGF7gLeo2Hd2J/hwTs0A9RD1EWF3hNSzjFInZCLngSpU2W/ZxtzHi5XhHcoqTOxZf8T9G
	JLzhJzs0i42I8HhXh7IfQE7dm4sJKOE22MQVrLsoLK1jjYhTTEOR0SQ84kZFiLlPATJzapvNBsw7h
	tbZPJs9QijVfRdqu6uQUgZn4cBJeV6K4kdMpwjl0+zBiiBms2uG/gftG8cDXJehXqmXUQJ+/pIZ/J
	7XEf2Scr8MZaRoqrIFzUZp+iPcCcTqbdWso/0RUxD+Fkymq8rDOwbh2JsW4sWspoBjtsA0PTD5x1b
	B/cs5BRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtsP-00000002hsw-1N8i;
	Mon, 19 Jan 2026 18:21:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtsL-00000002hsW-25G4
	for linux-riscv@bombadil.infradead.org;
	Mon, 19 Jan 2026 18:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u0I/1aicV2slNCT7hcGu/rFa259eUAuI9r5clWe49RM=; b=VLTkdiV1T0hKBa1NKgDpyetQee
	F4BM2fZnDRrCYt6ahHRcpv3UZxneufoERy7Iv846OPIMyd9leclDDBQHprKSLyuOTHDPtXl0RiE7Z
	B8X7b0w3jJ517q6kxyhdN2igq27bwz190ruDFocvh+HWtJd8P6K3LkCETFupCkYEQCC34JResc5Rr
	xPcNxeHtB+GLHSp7mLK9EgSnNIjbtd6dj8tQZ7YzZfIcbOAmRhTJ6FZ08Ly2rm5nIvm5VBp4ssaOi
	PhDCUn4+PbOguWo+R3zIOAXtsX4KsKFVwJSJJ24G4/BacTxw4w91HMtyiPpbk277tk/v5JmG8vb9m
	bsY4Hu/g==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtsI-0000000ClZ4-2sjE
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 18:21:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E3C2432DE;
	Mon, 19 Jan 2026 18:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A83EC116C6;
	Mon, 19 Jan 2026 18:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768846870;
	bh=u0I/1aicV2slNCT7hcGu/rFa259eUAuI9r5clWe49RM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMy2tsBDhGAJsNvySi2+8QIjlH/QpLph9hMXkLoxKwx+buyG4i9P5Rw423jPcqgc7
	 7ieZcbYtocYCMj88ovtnJsdEaUKahUF/bIcLV4mKArF627fqBqZ+qQ5xPlhXCYA5J2
	 4n9BrPWZTGqqVUTC1iBjeRfBPvxkkgDHFjtrVpT8QzvCy2ocdxY98f82wa5KBAgWk3
	 sMVcLVen0AUWLP08Mk7HNHlodQf43z9jJiigN6H8u8l92M59Nqeo6DwEAM2Db086PY
	 1RYhDravbz9mcr6pZOFGOJUyjXJrA9Md9WRSQnCwXOz17l+8H9W9o5B9Us2RJ+5CeO
	 zdy0Ku6TXZpHw==
Date: Mon, 19 Jan 2026 18:21:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: canaan: add reset controller for K230
Message-ID: <20260119-canister-stress-4058f52358c8@spud>
References: <20260117-k230-reset-dt-v1-0-c8cbaef1e1ac@pigmoral.tech>
 <20260117-k230-reset-dt-v1-2-c8cbaef1e1ac@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20260117-k230-reset-dt-v1-2-c8cbaef1e1ac@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_182114_928421_C227A06A 
X-CRM114-Status: UNSURE (   9.04  )
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
Content-Type: multipart/mixed; boundary="===============5386957917939932121=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5386957917939932121==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YAw2dKpN8sVaPBjg"
Content-Disposition: inline


--YAw2dKpN8sVaPBjg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 06:06:23PM +0800, Junhui Liu wrote:
> Add the reset controller node for the K230 SoC. Also add the reset
> properties for all UART nodes.
>=20
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Applied to k230-basic, building up quite a bit on it now pending the
clock series being applied!

--YAw2dKpN8sVaPBjg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaW52EgAKCRB4tDGHoIJi
0onCAQDY+C9x4563Z8vuA30dUgCmbzJswS6UpsNj1WTEzNi0GQEAu5dHeiSEYTcm
ffweNFMUq8e48H2qyJxtA8rb0X7OwAs=
=clQU
-----END PGP SIGNATURE-----

--YAw2dKpN8sVaPBjg--


--===============5386957917939932121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5386957917939932121==--

