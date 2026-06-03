Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA15CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 09:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OygRsyqcasyOwDaHKkTuD0IFLB+Th9udKd71nPToVuo=; b=xBhrpWq/FlbwKXBvnspt6Kyag1
	mtfp4fgYi7PsUbgwquV+yUVDiTyeN2jzIco4UtswTudBiWMm3yaJ5hG1ThpTMPoARBHJGhJoXCuku
	SjUHYZlxK4Rv2I8bpH/p7o3/yQAgz1saKaFrK8NlzjWRadIpFjXV+u8xjJevEi7Cb9geE9DlD5K9x
	Gjjg4L5dr1DYnCmoAq2C/ln+pLa3LRj4WkTHRmgSvmEA1P78tPmdGhdVObkp5mcLPUdt/++ASnxx8
	0kXVAe0DUXKz8Oss5tfnXQuqCLUmKey9iF0Y/y/RxEl+UV0A87VK17YG+aiiEIKbjL4seQ5LUKlq8
	UFVQaspg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhiT-0000000Egnt-2mFl;
	Wed, 03 Jun 2026 09:16:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhiR-0000000EgnX-3mOc
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 09:16:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F21C402D0;
	Wed,  3 Jun 2026 09:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113121F00893;
	Wed,  3 Jun 2026 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780478206;
	bh=S0Dp3roNTafspkw5dXHraXdzk0Q2pledRTqXBt74W9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XfY1Ggja5PfDw5V3R1IhEm11y6Fmp/WnqGZdWUa1emZlRg47O5AdZguDyh7S7ggZp
	 /LjEQZQfpwtlc/QwrYc+stfBK6CQNK6mk2x5UFeii24djZg4jebTkmvFZP6YLEV+p+
	 t0dw881j28wB9q2qs9F8SGZtjxMIOwtp3dUUUB5lod8uFfqPwnztaK02qhHX5u6X16
	 kRkthDlFAk8lUo4xJ/dwdn1MYngL4CaTUVyHyJ6AUyAUGYorjBQdqjli8X5WeFnOrP
	 a6L4FFvZ/uGo0gE//ZnqQQViOgeefKUHAztZv1ap/BFCT2WZj2KnsqWg83zJpQiwY+
	 McS90bsay30BQ==
Date: Wed, 3 Jun 2026 10:16:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 7/7] riscv: dts: tenstorrent: Add Atlantis platform
Message-ID: <20260603-selective-labored-f9afc652ac7b@spud>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-8-joel@jms.id.au>
MIME-Version: 1.0
In-Reply-To: <20260603074222.593243-8-joel@jms.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_021647_959885_ED2047D6 
X-CRM114-Status: GOOD (  10.79  )
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
Content-Type: multipart/mixed; boundary="===============2139299692764401240=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2139299692764401240==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v38FfJYRf01Nq9M/"
Content-Disposition: inline


--v38FfJYRf01Nq9M/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:12:19PM +0930, Joel Stanley wrote:
> Add initial support for the Tenstorrent Atlantis platform, based on the
> Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.
>=20
> The evb machine represents an internal bringup vehicle with just the
> interrupt controllers and a UART. This will be replaced in time with a
> full featured machine once details are available.
>=20
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Signoff chain here, and elsewhere is not right.
What did Drew do? Are they the author or is there a missing
Co-developed-by?

--v38FfJYRf01Nq9M/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah/w5gAKCRB4tDGHoIJi
0nXSAP9ril9N3Rwg+mCFumbafIDvR95k++C9ZqZMpl6sHtK68wEA8GkzsDBwpHkf
vShF75TGDsjz/1/VJFL0KRKfrFt3Xwc=
=/UR0
-----END PGP SIGNATURE-----

--v38FfJYRf01Nq9M/--


--===============2139299692764401240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2139299692764401240==--

