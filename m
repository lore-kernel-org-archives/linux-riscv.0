Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89DBEB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIaRxN/vShDPNz/PCFzAojT5AgafYkayCUyY4EDKCwE=; b=3FrrBN6YrbUJ/hnDgK1YWU8+cA
	Y1UppZqpiPHB06d9pDYFksYyxQXZHIKpjwvngJogqg4trGUFxFbLXQuG0/9RyVTdUnR0Jn+OBxSr1
	so70XfkF3628rRpiaTpYNVjyDUzAiwpi6yXbHkSK0x6sXHC5qmhVLxjgW2EhQ0BQNne3Anx+emh84
	zhYJOIVjUeTb5qRMddh/7nuJ+TC1aJiE7NBz3U42jwbtfDd9Ghoeip7UrrnrG8K+wlHMqjRusQ2GD
	FZu12TMnCKjY6MQOgiav0CHeBrT+rLWTSa4nBRADwuWHk/qKBFDQLvNExATvHduFdfr6jP523mzu1
	sfoM0YnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMmgE-00DZvA-2w;
	Fri, 21 Jul 2023 09:44:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMmgB-00DZuL-1d
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 09:44:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB5DB60C55;
	Fri, 21 Jul 2023 09:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F9EC433C8;
	Fri, 21 Jul 2023 09:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689932646;
	bh=vg1iS6TqPnxcsCXPtgC9VmWtpHR/B3JeLo+VLSKPK+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k0RxbaTdEsTplNhbhV08j63QtGMQ47JHzKg1tDYO7xQFdL9/I05jKzr/G48yQduOS
	 g29jvId3iFQfWQdtLonrRE72g+T5nIvjjGdmE+vef0412/x9oX2sru9Y2Uji7wfMDu
	 Vo2jtdxlpgtLtgKU13Y5Gz5yqsX8rgttZQE7h95dZCa9OUERka8xZHwOmhrRi4+3iu
	 PMO00nDPB7AKMXpzWi0uTNSRqIeeNOQssbHUfNLa7qp/kZ81NEY05GUh+lwBMuA0GH
	 lfwqUGX7Q37BQg4cfu9DNEIegKM80Im0fjUQryr3MBYV1AcBvV8S+qqHnyKfvtJprI
	 7GEXkiQHTkJrg==
Date: Fri, 21 Jul 2023 10:44:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com,
	linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>,
	iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	Nick Kossifidis <mick@ics.forth.gr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 01/11] RISC-V: drivers/iommu: Add RISC-V IOMMU - Ziommu
 support.
Message-ID: <20230721-obedience-prenatal-77f3c02632be@spud>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <c33c24036c06c023947ecb47177da273569b3ac7.1689792825.git.tjeznach@rivosinc.com>
 <20230719-confront-grass-6d0eb304b94f@spud>
 <CAH2o1u5pZQ6iKThFLgnn+_BBZ=j8fu91URYYxwWbfVt3OyerAA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH2o1u5pZQ6iKThFLgnn+_BBZ=j8fu91URYYxwWbfVt3OyerAA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_024407_607088_3D9B9666 
X-CRM114-Status: GOOD (  18.93  )
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
Content-Type: multipart/mixed; boundary="===============7190285754984162342=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7190285754984162342==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bb74xYmNkzitL0eS"
Content-Disposition: inline


--Bb74xYmNkzitL0eS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 02:43:51PM -0700, Tomasz Jeznach wrote:
> On Wed, Jul 19, 2023 at 1:50=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:

> > Also, since I am not going to reply to any of these iommu driver patches
> > in a meaningful capacity, please run checkpatch.pl on your work. There
> > are well over 100 style etc complaints that it has highlighted. Sparse
> > has also gone a bit nuts, with many warnings along the lines of:
> > drivers/iommu/riscv/iommu.c:1568:29: warning: incorrect type in assignm=
ent (different base types)
> > drivers/iommu/riscv/iommu.c:1568:29:    expected unsigned long long [us=
ertype] iohgatp
> > drivers/iommu/riscv/iommu.c:1568:29:    got restricted __le64 [usertype]
> >
> > I can provide you the full list when the patchwork automation has run
> > through the series.
> >
>=20
> Thank you, a list of used lint checkers definitely would help.

checkpatch is mentioned in the patch submission documentation ;)

Anyway, here's the series on patchwork:
https://patchwork.kernel.org/project/linux-riscv/list/?series=3D767543
You can see there's quite a few failure for each patch, so you'll need
to resolve those.

Also, I noticed the 32-bit build is broken in some patches, so please
build this driver for 32-bit before sending a v2.

Thanks,
Conor.

--Bb74xYmNkzitL0eS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLpTYQAKCRB4tDGHoIJi
0gp3AP9Uu+N+UWJpTrOtyTMHJZALMqgzVXOLJnRbY6L5gf62VgEA/3W2q8TO3Y/X
leRuhecE+t9nh2XAuTKFTKQn/I0vgwQ=
=YnhF
-----END PGP SIGNATURE-----

--Bb74xYmNkzitL0eS--


--===============7190285754984162342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7190285754984162342==--

