Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94883CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 09:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiDqgk6ml+xcwnZcMMuTwwPBmrJFmoKmKMonKEKyzlg=; b=5Ddcy4ACRgaxrvMk4OgGUrvm2U
	R543rlEdXr2kQDnDk9TnLYey2iQSzBWJqSMNcQz111BO8eZwMNz6bfGfpPhvRFJB7zPXieQHd8oxi
	iR4M82byAbi3FOQNJ0ZHauLs+s66lf7OzVZR9CF3hsXkXMDxcOGK79knw4h7yiJl2h6S6DD3qy3/U
	bZzKKl7K8RHasNlUDiN6T5DGOzv13wyvS7twmP4iiZCczXHDTUlw3aMbxyPQnSPiHoYTkLXWBpf2O
	mbd8DurR6LYBUeIgl5fzVx2q0vfT5W6npXBseH/duu4uOjTa3SPfOmMH9vM8XaEXtDURmPeSGm36D
	bRuuUltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtP8E-00GpXl-11;
	Thu, 19 Oct 2023 09:15:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtP8B-00GpW6-0q
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 09:15:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C8A69B82737;
	Thu, 19 Oct 2023 09:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EB6C433C8;
	Thu, 19 Oct 2023 09:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697706949;
	bh=0PZmpqxzGwjn9n6ql2tPU4w5KWFWK6hFe9b8EMIXp0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qn4cso2QxSqFLcdaSLL4PaFyhT0n0oa4FdmfJirYGFv8MXFfmmlEiae8SyXhLFXji
	 y9a9X6458VyIY/U699BbkIhjBbswZehRPhU+z3/lKmCewZzXKhmBPBS/wDcWhTgMYQ
	 mgVEyu/dzCUGG6wrpoPkoTxK1mR0TKbOZzlnO0hPMf0CC8Q4R/Mr1g4/CwVjrUesiy
	 GmjL0nnjh7QOPw8khHaLgj9FgD/7S4ZpJN/bHTBfTphDNgbl7lHUaHQ+4OhVKfOkrk
	 IPDNLI4LPyu4Y0uBR4DhPKF8/bS9xqw7r/r+JFg9PbekI4e26xUgETfBWrhXa7og4k
	 RZzcCnnMFZmvA==
Date: Thu, 19 Oct 2023 10:15:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	leyfoon.tan@starfivetech.com, jeeheng.sia@starfivetech.com,
	conor.dooley@microchip.com
Subject: Re: [PATCH v1 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <20231019-rice-stopping-c1c74396aa96@spud>
References: <20231012072148.7010-3-ajones@ventanamicro.com>
 <20231012072148.7010-4-ajones@ventanamicro.com>
 <20231012-powdery-demeanor-4d8dde576f24@spud>
 <20231012-pulverize-founding-f459336028a2@spud>
 <20231012-0cb15beef3128da9f3bd3299@orel>
 <CAK9=C2VFi+jtNGo+dueXcG8iRW=r1z-c1P_8SRGAxaByW=8tuA@mail.gmail.com>
 <20231012-b5b2d068ef07fd574207cc15@orel>
 <20231019-7499e3153836cb6c6353e578@orel>
MIME-Version: 1.0
In-Reply-To: <20231019-7499e3153836cb6c6353e578@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_021551_630547_32E791DE 
X-CRM114-Status: GOOD (  25.59  )
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
Content-Type: multipart/mixed; boundary="===============8430074978253169196=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8430074978253169196==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2pieAQAF6W8hr21G"
Content-Disposition: inline


--2pieAQAF6W8hr21G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Drew, Anup,

On Thu, Oct 19, 2023 at 10:36:50AM +0200, Andrew Jones wrote:

> I was just reviewing the DBCN series and was about to raise my thoughts
> there again about not being so strict about SBI implementation versions,
> but then I thought some more about it. I guess we should be strict about
> the version since it's otherwise not possible to any confidence that the
> extension advertised is the extension described in the frozen/ratified
> version of the spec (there could be implementations of draft spec versions
> which are not compatible with the final version and those will have the
> same extension ID).

TBH, I don't think that having the version check is a sufficient test to
stop things like that happening, but being insufficient does not make it
not worthwhile.

> The most confidence Linux can have in an SBI
> extension's implementation being what it expects to be will come from
> both the extension's presence and the SBI implementation's version
> being at least as big as the version in which the extension was frozen.

I am not sure what the status of the patches are on the OpenSBI side,
but this is kinda how I feel about the Andestech PMU series. They're
intending advertising having the PMU extension using the same interface
as the standard PMU stuff - at least, that is the basis on which the
kernel patches worked. The software doing the ecall to probe for support
does really need to be able to trust that when it is told the extension
is present that it is in fact the standard, or at least standard-compatible,
extension.

<20230906111455.4161641-1-peterlin@andestech.com> is the OpenSBI series
implementing this and I voiced my objection to the kernel patches at
https://lore.kernel.org/linux-riscv/20230911-worry-reformat-fbb5c473085d@wendy

> Long story short, I'll change the above condition to look for 2.0 and
> ask QEMU folks to put an OpenSBI binary which advertises 2.0 into its
> repo as soon as possible.

Cool, thanks.


BTW Anup, do you think we could get the OpenSBI mailing lists archived
on lore.kernel.org?

Cheers,
Conor.

--2pieAQAF6W8hr21G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTDzwAAKCRB4tDGHoIJi
0s36AQCkNr8bboLhzSr8KpoJ3qOOOsVQWwQN7ZkeFbrF4fsjIgEA1RUcEPHNVs0B
gMD3pVbQi8S5Mw70e00Y0QxXRGwP8gI=
=7dWG
-----END PGP SIGNATURE-----

--2pieAQAF6W8hr21G--


--===============8430074978253169196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8430074978253169196==--

