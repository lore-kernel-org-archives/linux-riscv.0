Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406BCC0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 13:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UX5DNYQeb6a/pLDmLR6g2yn7VyMuchHtwU7zLFfNxyI=; b=z+2K/BLY99az5Pa/EgS6UmKvvc
	vpAHnnMT8Jf6eCJO5hTkDDrjziV+g+VxhaQw5owIZw6HsFsOyz1pOkHIKmaaJEWQ7wJ6Qr3H4/bk5
	rf5fWM3QV62Fwz6WxgVFXaS813ZzbFIysD5sTpN9JDa3avwlf56WrdrkASjPuf7XYtJmbyyZD8cSK
	+0x+5Sd6kAtbJi36GDbnDY4rzbPJr2F5b+I5i7JpEca3WZ8w8gk1+RmSwXACm5bvX12l7Mj8yLrZd
	nylCeyqQyyon0PaF+64eTQ/JXHCw/3nP3mrvDuuv82COnUKRB5eTI10Q7xQsZF91nSoUk+FwKBtOR
	AnRDHNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVtxq-001gHm-1M;
	Tue, 15 Aug 2023 13:20:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVtxm-001gGw-2j
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 13:20:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 57CAE636CF;
	Tue, 15 Aug 2023 13:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58714C433C9;
	Tue, 15 Aug 2023 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692105597;
	bh=K7YTqAP0RGgZX1LRZhXYoqqi7CimYh6mAtmpOIFrXz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XLeWTROCdHPDhpWq7RWlndfXAgk+6gc49euGSQBEL8OhPbVNR9a6meyBwQSZ9uVxR
	 lOsxzhHGaCwqKFfu9jv5/Tci6C13iJJJe03w0mBs4AOZTGuEDFcIP63wVxuPSDYdtw
	 hp4ZjaG2vzWD2b4WpFdoPHXheVyn+feSb1VQ8EWK31498jQlm74+VHJX67m2kO2hJi
	 bsHeEc0h4fYGlkDU5emCshU+RtUcRUwGv4+g5y0mtB4j1HiC8HILf7vuaxm/IWvtOL
	 qzk+uSUIEXOe53KEINJKrotO71Qcbv5n1cZ2RCpyFqpRQeThYKBUCmEa8sQ1TnEJTk
	 ANsF657VxvkYw==
Date: Tue, 15 Aug 2023 14:19:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] drivers/perf: Risc-V: Update platform specific firmware
 event handling
Message-ID: <20230815-myself-disk-61b0a5535624@spud>
References: <20230814043134.367280-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230814043134.367280-1-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_061958_924054_694059A3 
X-CRM114-Status: GOOD (  14.98  )
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
Content-Type: multipart/mixed; boundary="===============6639174851602441779=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6639174851602441779==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zHo1NH3FUc73hCjw"
Content-Disposition: inline


--zHo1NH3FUc73hCjw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 10:01:34AM +0530, Mayuresh Chitale wrote:
> SBI specification [1] reserves an event code for platform specific
> firmware events. Update the driver to use the new reserved event code
> for platform specific firmware events. Also update the raw event parsing
> to use bits 63:62 instead of only bit 63 to distinguish between the raw
> event types. The platform specific firmware events must be specified in
> the perf command as in the below example:
> perf stat  -e rc000000000000001 <command>
> where [63:62] =3D 0x3 indicates a platform specific firmware event
>=20
> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/commit/c4bfdf9 [1]
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Hmm, another question - is this actually in a frozen version of the SBI
spec? I might've got distracted during the last PRS meeting and be
unaware, but I had it in my head that it was not frozen.

--zHo1NH3FUc73hCjw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNt7eAAKCRB4tDGHoIJi
0gt0AQCYUQ0g3d2oVtG021fr50+Bozt6RyXO/Y3RQ4X9Er2e0AEAirv5S7hIlZ9y
LtVRlitp7m2o2d8UOc6kVjOd+qtthAI=
=mxDr
-----END PGP SIGNATURE-----

--zHo1NH3FUc73hCjw--


--===============6639174851602441779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6639174851602441779==--

