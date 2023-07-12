Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9EAEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 17:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJiRWosRAhCEq7pJvih7KI7GLZDlqU0OJQN6JX02eFs=; b=oDAuApQ5ahElEQS5jOHcdqdOVD
	/hP0pW9hdpPg23F+us4lyWLlCmhLfN++vt14nnYITBTQ43xstHKhjkgyIammBbmJDCdQrZYz90L+I
	suhr5D3dkw/r6yWwTaPr2Yv7t2G9jb4sTXFwi3W2bCkrS8dn23T/HdEZBxiBy/CI7EJzoGF8TscAk
	66BGMW5ntaJ5nMLwzMgHkwHAtpU4SRKVZdVThtRyqn6QcIoHCBWppV4uK/WxcScbGXE7XTerUEOQl
	lrUrLRGFsoEgLzg9YJmq/VsD1PWWj1y5LOtT8tC5AcMkyOhre8r6tesFRMyQVcYVBTEYmGB6Y2UCo
	BhoorHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdXd-000k53-1h;
	Wed, 12 Jul 2023 17:22:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdXa-000k4A-1g
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 17:22:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D2C3961879;
	Wed, 12 Jul 2023 17:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D0CC433C8;
	Wed, 12 Jul 2023 17:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689182533;
	bh=aS9kpgc3y2owb1Zs5DUyARVxTNu6MZcbtmAkTQ8AxSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BNfwY05bBjrokN4kedGl6cQA5bhwuvBJvxahz44mpM6XboJhCcu8i3a76MG3mAYLo
	 0EVWRRVCYIWypqOY0QKH6qMDXIDRI3muhJM0KCgHwC8a1ANUe7KW9iC4gRhB1gaPDn
	 oltfAU31S/uKEaVzEq/oZmFe/HlxkTkPjjBCOsECdrry5BvDpRCWhKwikwpwRY1whf
	 EzvDs1PN3kQ4LFxmp7SGIx9A/WfvfzKUJgKnx9K4JqcndC2MAHsV96WgBDpK/l93s8
	 +3Ua8pr68/1gH0/XWQ/6u2U/E8n+80qjYsDSx4c7b1nYy7sJxmPBWvCpd/1+OQa1Zl
	 Z/oK7z5adk6Og==
Date: Wed, 12 Jul 2023 18:22:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	Charlie Jenkins <charlie@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] RISC-V: Don't trust V from the riscv,isa DT property
Message-ID: <20230712-tilt-dinginess-c4fc0dee5d63@spud>
References: <20230712-legislate-dental-8488c6b9c0cf@wendy>
 <mhng-821b3125-d05c-4a68-8952-1c54397451c3@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-821b3125-d05c-4a68-8952-1c54397451c3@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_102214_601150_51DAAEDE 
X-CRM114-Status: GOOD (  10.28  )
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
Content-Type: multipart/mixed; boundary="===============2647524792696813430=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2647524792696813430==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s90ZiMxgcvGvI3HZ"
Content-Disposition: inline


--s90ZiMxgcvGvI3HZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 10:17:49AM -0700, Palmer Dabbelt wrote:

> Do you want to re-spin the patch?  I can dig it out of the email if you
> want, but looks like you've got the diff already...
>=20
> No rush on my end, just LMK -- it'll be too late for this week either way.

I wrote it at work, I'll be digging it out of my email too ;)
I'll send it now before I get lost in my DT review queue.


--s90ZiMxgcvGvI3HZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK7hQQAKCRB4tDGHoIJi
0pXaAQCC12sBkaJyMG/t3redf7faDZqblD/aN4Wn5C0EVbfuDwEAl4+T5PZvBYb0
ufuVlvrpJgDASWOlcSHDQ4OYWJDELAk=
=9l29
-----END PGP SIGNATURE-----

--s90ZiMxgcvGvI3HZ--


--===============2647524792696813430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2647524792696813430==--

