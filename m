Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE48EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 22:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WElCgDTN346mz+sgV2qixeNMznv5HeaGN+hiiB7Pq4o=; b=ArtWMQ3PX93Rb3XN99wMHKWLHY
	oVJnDTODD6vc6+RpnZTqba+zqgallVUDuj5x29DRW5olb9WOu7Tz7swfD67r2+r3DUwamEhLoMhSm
	VfA/svFwTvZl9NBifjVvVKk9DUhjDeKcSOhxySBryRn3or2ESJRQ94eQ5WZP/jpqJTNYJJuFc0rIN
	WWjV4q0MUieLAr96Y6pNWM3P0btKQzoFOkaiNrB7c/urCpGvSwUNgC3IystnDig2gguHVMBZ25JGh
	mY/0E61ZYK1nSRAEV9uChiE0gV29hLT6cmCOdtxTcqTMNft0v6gDFl1QcU3YtqUkbgeYXFlf+BRLm
	4qfPjDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMbpR-00CMC7-0S;
	Thu, 20 Jul 2023 22:08:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMbpN-00CMAt-33
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 22:08:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B9F361C9A;
	Thu, 20 Jul 2023 22:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAAEC433C7;
	Thu, 20 Jul 2023 22:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689890932;
	bh=Z5s9oLlOTT+MLoGJ5I83fWvkRr0YoIV/xJy4YEJUgtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t0XsLlQQATT/gwcGZUW2DUbvGbOilzbNnHvR4yU3t7nXjnpzgwle8lagwXaOH993P
	 dNC+u9nKfZkC+Az6XPGRksZ+hDSHDJwq6WIo7s97j4A/sUN6tbV5ELf8ZVi+ADwyvQ
	 /fTDctNQdflbUcnQnd5kSQtVbi/XiLHtI1V17PKCM0Farsaf2bfL2RbmZLtgY2249c
	 SD3HCak7x86hAoe1XUjsQDTq/4jKmHG7Sh7GI7WhxgGZzWAZotqbWA9srxhGrH6/O+
	 jWOau6Tnvi/WTonz6i0fF5kj1inLN1NcgJZn1X6++sBDF1RZD8aDYQt5FkIXit4J6K
	 H8+mBM70ijQIA==
Date: Thu, 20 Jul 2023 23:08:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 05/11] RISC-V: drivers/iommu/riscv: Add sysfs interface
Message-ID: <20230720-bully-famine-dfc9a5e688ef@spud>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <610abe685f90870be52bc7c2ca45ab5235bd8eb4.1689792825.git.tjeznach@rivosinc.com>
 <c26d029e-dabc-9ad2-ed42-bb6ee276e3fb@kernel.org>
 <CAH2o1u6pMF3MN=oFBcs9kOf-nwnEYfD2Vv=89+DzUanV59R5dw@mail.gmail.com>
 <69800c58-2df8-25e5-09e0-c9929bae2193@kernel.org>
MIME-Version: 1.0
In-Reply-To: <69800c58-2df8-25e5-09e0-c9929bae2193@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_150854_067542_6EE58AB7 
X-CRM114-Status: GOOD (  17.57  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>
Content-Type: multipart/mixed; boundary="===============6308300493694621997=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6308300493694621997==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bcun5Y1HEGvpIqWO"
Content-Disposition: inline


--bcun5Y1HEGvpIqWO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 11:37:50PM +0200, Krzysztof Kozlowski wrote:
> On 20/07/2023 20:30, Tomasz Jeznach wrote:

> >>> +#define sysfs_dev_to_iommu(dev) \
> >>> +     container_of(dev_get_drvdata(dev), struct riscv_iommu_device, i=
ommu)
> >>> +
> >>> +static ssize_t address_show(struct device *dev,
> >>> +                         struct device_attribute *attr, char *buf)
> >>
> >>
> >> Where is the sysfs ABI documented?
> >>
> >=20
> > Sysfs for now is used only to expose selected IOMMU memory mapped
> > registers, with complete documentation in the RISC-V IOMMU Arch Spec
> > [1], and some comments in iommu-bits.h file.
> > LMK If it would be better to put a dedicated file documenting those
> > with the patch itself.
>=20
> I meant, you created new sysfs interface. Maybe I missed something in
> the patchset, but each new sysfs interface required documenting in
> Documentation/ABI/.

| expose selected IOMMU memory mapped registers

| Enable sysfs debug / visibility interface providing restricted
| access to hardware registers.

Documentation requirements of sysfs stuff aside, I'm not sure that we
even want a sysfs interface for this in the first place? Seems like, if
at all, this should be debugfs instead? Seems like the only use case for
it is debugging/development...

--bcun5Y1HEGvpIqWO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLmwbwAKCRB4tDGHoIJi
0j3GAP4sKlFBg9b3mVUW8DI1uEli6p+U8QzmKoSPgvciU6lUXwEA/kTBkmBeUY/1
NthONKHle/tjSb9Hf+te2bjd72ZZGgM=
=lL8V
-----END PGP SIGNATURE-----

--bcun5Y1HEGvpIqWO--


--===============6308300493694621997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6308300493694621997==--

