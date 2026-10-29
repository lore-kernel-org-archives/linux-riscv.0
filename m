Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D40606A329
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 23:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zOsCSMa9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vlu78CTP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VlNDmz1WBMg/yow7ikqBZRVrow22KsahZX3GSYnyebA=; b=zOsCSMa97TJK0SlHvYmbvdG4hp
	zYc5RVA3Kn9NPzxNPNcWrt0ovHCz7DwLmK0TT9chW5Iew0CvzrWoJPfQobys665K9CarGsNrreTIx
	tZPsEKWNxfl6Km8FtJ8Q6Bs9sQDyPTAqJOUPiPbK80wkdFpg24tUXGO4KP5g99YLR6AXbHa70D+Ba
	q6J35NtNCgc/7HwKwA9bJwcnk7w83GdhGRFxaBqx3liiPPyMljr4NgMCx61RCwP9h3yy7nCOhp+W1
	6F0OTVZXhBfz3q6SKRwt/4Je4CNw2CCMwbPKJfvX4nr7/FuS+rdTmH0uVO9tauoqCm6a7siDl94g6
	sQ8yt1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZFD-0000000AWc5-0Ven;
	Thu, 29 Oct 2026 23:09:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZFB-0000000AWbw-0Cmm
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 23:09:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C3A9A600C8;
	Thu, 29 Oct 2026 23:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED671F01816;
	Thu, 29 Oct 2026 23:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793315351;
	bh=60uiQLKWD96KNyNA8n1SFH/9ebNVNGe69HhykEBopfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vlu78CTPyf+ZyY+6ssCTxabXF8StOgXlJTsB8rxtQsxtjj+HkyKmR5Uwb579/tLj6
	 +zSzMd5S7bFy4FRVCskYPFFb9odTDQ9Nw7618th22JQa7FSyX75FWZenMNGNsHkgwO
	 M7p+XN2mnP5UeWEPfLyQC6qpJ7+dDhqHH93bcaObz/qaE9RU3DOrrU/JRAD9nVN1Vh
	 7naVbLRzCja4Zla2Y24qeex84MAMc7RPm0c6rGOuxC9yBTn0+S0dNGqfsmNxBTk2he
	 an6ZJHJX3iZRnGI4AVVnzUD+YrmzjSrpYS+y0un3VgY/y+ryce03Z4N+Pjj9txHyV9
	 MW4JC83uKif9w==
Date: Thu, 29 Oct 2026 23:09:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
	yuanzhu@bytedance.com, yang.yicong@picoheart.com,
	yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v12 09/11] MAINTAINERS: add RISC-V SSE maintainers and
 file coverage
Message-ID: <20261029-tidy-scorpion-c8601a1761ba@spud>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
 <20261029114953.27453-1-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261029114953.27453-1-zhangzhanpeng.jasper@bytedance.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1560009765013499827=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1560009765013499827==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xqo+bfadgatXB3Qq"
Content-Disposition: inline

--Xqo+bfadgatXB3Qq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 07:49:51PM +0800, Zhanpeng Zhang wrote:
> Add the RISC-V SSE maintainers and cover the architecture entry,
> firmware driver, PMU documentation and selftests in a separate patch,
> as requested by Himanshu Chauhan. Also add coverage for RISC-V firmware
> drivers and the architecture selftests.
>=20
> Link: https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.=
com/
>=20
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  MAINTAINERS | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 65e8a4b5c90..f275e9d4847 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23506,6 +23506,7 @@ C:	irc://irc.libera.chat/riscv
>  P:	Documentation/arch/riscv/patch-acceptance.rst
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
>  F:	arch/riscv/
> +F:	tools/testing/selftests/riscv/
>  N:	riscv
>  K:	riscv
> =20
> @@ -23518,6 +23519,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel=
/git/iommu/linux.git
>  F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>  F:	drivers/iommu/riscv/
> =20
> +RISC-V FIRMWARE DRIVERS
> +M:	Conor Dooley <conor@kernel.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
> +F:	drivers/firmware/riscv/
> +
>  RISC-V MICROCHIP SUPPORT
>  M:	Conor Dooley <conor.dooley@microchip.com>
>  M:	Daire McNamara <daire.mcnamara@microchip.com>
> @@ -23573,6 +23581,7 @@ M:	Atish Patra <atish.patra@linux.dev>
>  R:	Anup Patel <anup@brainfault.org>
>  L:	linux-riscv@lists.infradead.org
>  S:	Supported
> +F:	Documentation/arch/riscv/pmu-sse.rst
>  F:	drivers/perf/riscv_pmu.c
>  F:	drivers/perf/riscv_pmu_legacy.c
>  F:	drivers/perf/riscv_pmu_sbi.c
> @@ -23612,6 +23621,19 @@ F:	arch/riscv/boot/dts/spacemit/
>  N:	spacemit
>  K:	spacemit
> =20
> +RISC-V SUPERVISOR SOFTWARE EVENTS
> +M:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> +M:	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> +R:	Yunhui Cui <cuiyunhui@bytedance.com>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +F:	arch/riscv/include/asm/sse.h
> +F:	arch/riscv/kernel/sbi_sse.c
> +F:	arch/riscv/kernel/sbi_sse_entry.S
> +F:	drivers/firmware/riscv/riscv_sbi_sse.c
> +F:	include/linux/riscv_sbi_sse.h
> +F:	tools/testing/selftests/riscv/sse/
> +
>  RISC-V TENSTORRENT SoC SUPPORT
>  M:	Drew Fustini <dfustini@oss.tenstorrent.com>
>  M:	Joel Stanley <jms@oss.tenstorrent.com>
> --=20
> 2.50.1 (Apple Git-155)
>=20

--Xqo+bfadgatXB3Qq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauPSDwAKCRB4tDGHoIJi
0kttAP9dzoNQAI2SKPQomjar/n9Qd4olyeHc1OusqrZHxxNv7QEApaGoAI0AgXlN
NFcCol7iifOclsEwiEBBMmF4CzFvhAc=
=aCSu
-----END PGP SIGNATURE-----

--Xqo+bfadgatXB3Qq--


--===============1560009765013499827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1560009765013499827==--

