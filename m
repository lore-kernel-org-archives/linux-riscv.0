Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AF0EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 20:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w81fT1+s0vTafj7/KLQwes6M7/bzyDSQ+08+J5xBpo4=; b=n28CV9XINZKjRTz4ng89LuYrI6
	uK0Ui0XasZwjcvMNqTKF7X6ytUoNRgOWSEUNdYbJv3PzeTLkjqQNp4PIwFe4J5o2uDD/AWgEcEbpJ
	O4Ci9yC7NPctD5trXiwJYNZR0EikZ/0nPHsAszOzNbo1+JXbIoOhd0tn6VdElEmSMgNV1LaUtN3cH
	Wfqlamof3xqYbQ/OY1/DyHNCil6I9ZAERVEJzK2RyIpx/wVQhZpma+H6L6gqkVfkWgzypbBisIvBz
	ZPFIAahARJY4FmcfD1zlVw3n35ykfsMz1ORaNpLIoXcfJxNy8EE4N6UVSCZ8X71poXb5A4caQRRve
	NdNVB7WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH8fs-00GyTl-1b;
	Wed, 05 Jul 2023 20:00:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH8fp-00GySv-2w
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 20:00:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7B65D616E4;
	Wed,  5 Jul 2023 20:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58CEAC433C8;
	Wed,  5 Jul 2023 20:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688587222;
	bh=RgYgbdXhSlYQN8weRZoRBXRzgMTlKKE50pkJaWLiPNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R+kbhJaftkJQmJpHlFNPOTgXT8LfVU0wL1ZKB38nWPPSUBZctfs16kfrhyHcR/WZq
	 n5pSQORPvikhmOG0EFqme5Lbsf579CVjksMXoM0ckK/RGTC4PBPZId/7YVZCqV9IBd
	 onEyZpkG9UlvMaUewCTB/wly09rUaxLu4SrzM0EeHfW+e5ntAGOYYYAZSM8/0WE2+u
	 uMxezkn50OvQlxUUatfGA9Y6oow7YLbbxKHIXFBLJgVpXonDTNaK8R2OcCT5r6RYmb
	 04T0xMIkhGJ5nAJEGKXztVaGaLoveEx3oBG7IF8Ul3vRr9nnoGtvTXH4mjTe7nyuUf
	 qmmzXze14M7sA==
Date: Wed, 5 Jul 2023 21:00:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, anup@brainfault.org,
	konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	mick@ics.forth.gr, jrtc27@jrtc27.com
Subject: Re: [RESEND PATCH v3 0/2] RISC-V: mm: Make SV48 the default address
 space
Message-ID: <20230705-gloater-relation-29a6080ec87d@spud>
References: <20230705190002.384799-1-charlie@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230705190002.384799-1-charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_130025_994837_74AD1853 
X-CRM114-Status: GOOD (  12.46  )
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
Content-Type: multipart/mixed; boundary="===============0716069360375531765=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0716069360375531765==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CH8f+iAqQ0AXuK8P"
Content-Disposition: inline


--CH8f+iAqQ0AXuK8P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Charlie,

On Wed, Jul 05, 2023 at 11:59:40AM -0700, Charlie Jenkins wrote:
> Make sv48 the default address space for mmap as some applications
> currently depend on this assumption. Also enable users to select
> desired address space using a non-zero hint address to mmap. Previous
> kernel changes caused Java and other applications to be broken on sv57
> which this patch fixes.
>=20
> Documentation is also added to the RISC-V virtual memory section to expla=
in
> these changes.

I can't find a changelog in any of these patches, nor an explanation for
why this is v3 (or a RESEND). All I can find on the list is a v1. Could
you explain and provide a changelog please?

Cheers,
Conor.

--CH8f+iAqQ0AXuK8P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKXL0QAKCRB4tDGHoIJi
0mSkAP9isKRIaAMcF9iEh5CS2rWMPBczaNg2fqUkVSbIo2jW4wD/UFz0hRhkMWtF
RirBLo291AQ15KrXyMt6MRTbQ7dNtA8=
=YMSS
-----END PGP SIGNATURE-----

--CH8f+iAqQ0AXuK8P--


--===============0716069360375531765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0716069360375531765==--

