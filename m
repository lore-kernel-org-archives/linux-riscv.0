Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6AEC7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 10:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fanPQMZKrjcHlNIgS/ElNJ+BjL2iks8xTINj5rIZyBA=; b=QwKNyc73da/iEUnlU/5XHj18Lz
	p2yB44JhWvsDMHE8huXyGeaN89wWRNJ5l0vKPV7IKpjAqv03F1zCiRf05ja/dEuOamCv/fhgmmXFU
	lEhxvvwFrDnMZDqu9UKZUevGMjxo0DGApTJWWSYp6Lms5KIPj/PHYaYxTDQ6g7KjQeL3xdQNm1sOl
	nF46O15SBbzr8BDE7H2zuvibMdin51kFKwnjW9vWd4yIMvXghtuvQGqKoeR1UGqD16gK8S1UNTvVy
	+iCpfyQlFIe9rqrA/91IizhNfqZyvNIIcGnonAwyP7PbbdcHjF4sT0W3QCqg+AcNBkdqoNkmc6Kl5
	Cvtpt4pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6U7k-001HjF-1D;
	Tue, 06 Jun 2023 10:41:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6U7f-001He1-39
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 10:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686048068; x=1717584068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5gngC/o7dDVu0tjO/fekC+esw9RCF5CblBlDQvtOBCE=;
  b=wcOOWWLReHQ2/pUgmDQABKqrc4i+cv+98MGjzoKu4eAfcuUHfo2OaS3H
   5Bv0on+cYalle73aH2K2H7RF8y3H2UASAeN2tHPoPQa9XH2ceimYf9n5/
   YttLo2oUgLM1mF5o5KHvqTKTHjTvxvdIhI0m/MfjuIcg129Aio+Vu780B
   Q8JVUdw5NOoNJDTY5tICuwVymEpdTOF3crYmvykf8+JE58dBViFIQOO3C
   MPIfL3+0GZqozoJBWwOM1Pp5z63+MXV5fKbzoT6aiwUTruxipiQN3zXSX
   u7HUmG25kLV36z9HisdydEYu23Cqv2nBelqCfYWpwTqV8KLDol4FjikWV
   g==;
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="asc'?scan'208";a="214837298"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2023 03:41:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 6 Jun 2023 03:41:01 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 6 Jun 2023 03:40:59 -0700
Date: Tue, 6 Jun 2023 11:40:35 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: <gregkh@linuxfoundation.org>, <sashal@kernel.org>, <palmer@dabbelt.com>,
	<conor@kernel.org>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<ndesaulniers@google.com>, <trix@redhat.com>, <stable@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <llvm@lists.linux.dev>,
	<patches@lists.linux.dev>
Subject: Re: [PATCH 6.3] riscv: vmlinux.lds.S: Explicitly handle '.got'
 section
Message-ID: <20230606-exploit-refill-b9311f2378f3@wendy>
References: <20230605-6-3-riscv-got-orphan-warning-llvm-17-v1-1-72c4f11e020f@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230605-6-3-riscv-got-orphan-warning-llvm-17-v1-1-72c4f11e020f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_034108_254787_629C00A9 
X-CRM114-Status: GOOD (  13.37  )
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
Content-Type: multipart/mixed; boundary="===============1915491544165755044=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1915491544165755044==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hUdYCm5YT6D3efCv"
Content-Disposition: inline

--hUdYCm5YT6D3efCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 02:15:08PM -0700, Nathan Chancellor wrote:
> This patch is for linux-6.3.y only, it has no direct mainline
> equivalent.
>=20
> LLVM 17 will now use the GOT for extern weak symbols when using the
> medany model, which causes a linker orphan section warning on
> linux-6.3.y:
>=20
>   ld.lld: warning: <internal>:(.got) is being placed in '.got'
>=20
> This is not an issue in mainline because handling of the .got section
> was added by commit 39b33072941f ("riscv: Introduce CONFIG_RELOCATABLE")
> and further extended by commit 26e7aacb83df ("riscv: Allow to downgrade
> paging mode from the command line") in 6.4-rc1. Neither of these changes
> are suitable for stable, so add explicit handling of the .got section in
> a standalone change to align 6.3 and mainline, which addresses the
> warning.
>=20
> This is only an issue for 6.3 because commit f4b71bff8d85 ("riscv:
> select ARCH_WANT_LD_ORPHAN_WARN for !XIP_KERNEL") landed in 6.3-rc1, so
> earlier releases will not see this warning because it will not be
> enabled.
>=20
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1865
> Link: https://github.com/llvm/llvm-project/commit/a178ba9fbd0a27057dc2fa4=
cb53c76caa013caac
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Seems reasonable to me chief.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--hUdYCm5YT6D3efCv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZH8NIwAKCRB4tDGHoIJi
0uPMAQDmbQHzmgYV1anMuSfDVX2ah2UZzhysHE3OJcbQsgGvGQEArKBOtM1RdmbV
ucztRbZaGYtD6FTut83S/F6gJX64Awo=
=9b+g
-----END PGP SIGNATURE-----

--hUdYCm5YT6D3efCv--


--===============1915491544165755044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1915491544165755044==--

