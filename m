Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B4DC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 18:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyFSZE2XkJR2s3ktMephusWlITG1AqizGNL6nSDnbKY=; b=4QVEkdV8mbtzsBKtpBiiLJCJS9
	um5X1VhQ5fm670DuK7HfBrykK16FJnMvMEdeZ/Mrze8lp0UYLZpPSP7iS14U1Kd8ZYMAc3T4O6g2t
	deGoJ2uIxPJIRcJgaGYNMn2SqfvYKMvbR6iernLZ8qRR8B1298CLp6iFaJib78033/3JgM46gLEEW
	l46EZ+O1SMpnWniM1HhV0K1zT7IU7TucrsYEMhPPAKDtv0iJy72/iTANIkYXR9BnRQZXuOJQAGqkR
	J1kxcnbV4tUiUgohLLnMkZdi3TwLy4mcPWHBDcGTHewADZyl+xZSWWnyWH4YI2qBgwp2LK6v+J4Ys
	AZBoICtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPpWr-00Gfek-2L; Wed, 08 Feb 2023 18:50:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPpWo-00Gfdu-BY
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 18:50:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9970E616C6;
	Wed,  8 Feb 2023 18:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F0AC433D2;
	Wed,  8 Feb 2023 18:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675882245;
	bh=aj8x5SDs25y8h+VPsvp1Z3QlTPzHoa2icbVCfoaqexE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hAJ8Sm/EsdS5aquTPc13W7ADNi5CwgFTirWqfzYHXRuA5abvJXKH/fzDIPBAhrBGi
	 prsnPoOwSUOWQUoP4k0GxcJVSKYTKc9qbqnPTbbpBiCYrnWxFiRLXWGp1knjhJDe7y
	 5bR6laiAZ5ICnUFMCBMuaxQ2fdcyvYDv1fDJNojs3dkt0ZlS4CfeHuPJOfWJMUXPzB
	 nWHQa7sbV+BlxsUEvGQOnqqINg8IyNbr/o9IEMbZqisJ+PMFl6JWZxmibB05zcWoMp
	 HIxOnf0WbFRGbmaAyk3i585IP23qUdGL32Jz3pzR9Sl1CKHPnuYnKHZfrPrtRd71TS
	 lAf1QO+yvLqRA==
Date: Wed, 8 Feb 2023 18:50:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 00/24] Add basic ACPI support for RISC-V
Message-ID: <Y+Pu/z7dN87v3udc@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <Y+Ppv6kB1iksf+TF@spud>
MIME-Version: 1.0
In-Reply-To: <Y+Ppv6kB1iksf+TF@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_105046_450214_29D31AB0 
X-CRM114-Status: GOOD (  20.78  )
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
Content-Type: multipart/mixed; boundary="===============0698704570089490004=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0698704570089490004==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aaYcc/YKkg738NAj"
Content-Disposition: inline


--aaYcc/YKkg738NAj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2023 at 06:28:15PM +0000, Conor Dooley wrote:
> Hey Sunil,
>=20
> On Mon, Jan 30, 2023 at 11:52:01PM +0530, Sunil V L wrote:
> > This patch series enables the basic ACPI infrastructure for RISC-V.
> > Supporting external interrupt controllers is in progress and hence it is
> > tested using polling based HVC SBI console and RAM disk.
> >=20
> > The series depends on Anup's IPI improvement series.
> > https://github.com/avpatel/linux/commits/riscv_ipi_imp_v17
>=20
> In the future, please provide links to patchsets rather than "random"
> git trees.
>=20
> > Jisheng Zhang (1):
> >   riscv: move sbi_init() earlier before jump_label_init()
>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> What has this patch got to do with your series? Just something that was
> sitting in your tree?
>=20
> If you need this, it'd be ideal if you would submit *with* the R-b tags
> it appears to have had by v6 [1] & add the reason that you need to move
> it to the commit message.
> In Jisheng's series that was obvious, but this is a significantly larger
> series and it is hard to spot your reasoning for it.

Apologies, I forgot to provide the link!
https://lore.kernel.org/all/20220821140918.3613-1-jszhang@kernel.org/

Cheers,
Conor.


--aaYcc/YKkg738NAj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+Pu/wAKCRB4tDGHoIJi
0pqjAP9v4xdzdROd07gJezBPig/rkwOEA+Nl74MUMwUBEgsVJwEAlKLC7xLXGfWy
pbk12modw39jo6nvkXOoN9lAb7SH9QM=
=465b
-----END PGP SIGNATURE-----

--aaYcc/YKkg738NAj--


--===============0698704570089490004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0698704570089490004==--

