Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6163EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 10:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESx/JeeQ7cfC1seVgLE4bUgWLrykWLrWpXswoMPMGq8=; b=VeW0OsFAQZLeSc0Ek990MowV4K
	aixOXz4RSUKnxyYhs5JOISHqoSaOtOHrPcOhsjvcFLrDkWffIQ8mgCLmo+rvZdioqgl/rFmIyunZn
	pguRo1CjmChQnW6NYYsf3hJUNSXFp8/WOFrNi6BT8FA1MLhY2VJ+TnIadmN35NYzrx/Ek/fUWC6jI
	OkCkf8gMsDJ0MpR3M5OO0qI0DJ82taqpHJSwpBeFs77NFKUKFU6OkXffcvFiJrucUVE6h+1pVW03h
	O5f70Qc8cenIjYJqjzDPDgjIUDeDGx87bsgtXqFGaFWZnDUX0imOYXhah9UxIvjMEYCVsjVrsXZL6
	ezbRaBDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6SR-00HZlq-0e;
	Fri, 16 Jun 2023 10:13:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6SO-00HZlO-1q
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 10:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686910408; x=1718446408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YpSM1w+IYXXoUKSojagF+UoCf/8hiOK0HsM860yz38E=;
  b=x8GaDBO93AJNI8beGQfsCylbIlpJpJ1JtTbkYnJJ2VixP1g/c5tHwlEj
   mwOZMy22M9szW7tj+PWRko9VdMntMEmJFxSQpEQ4Xsni6N08QnyrdPoED
   whnePP9zBT/opuxDiSo4b9Ny+Yk0MtQKtAPnLrsb1C6YBl4WmampdEPFn
   yvsGfErYNlmY+mUPjHVyKvQaMY5hH48//RmX0EDWaqsGz+8V7I7wUs1hs
   oOQQo2zb74lZjeIAuHA4Xkwbz5TGKPPauPSyMeLyaUqSm3E5m7hWXtzUi
   3Xj+AC/Of7TGmjYdIX3lrYtQ4GuMEbhWxoyPzdcztwmRfZpEQHId0OqsP
   w==;
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="asc'?scan'208";a="157251792"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jun 2023 03:13:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 16 Jun 2023 03:13:27 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 16 Jun 2023 03:13:23 -0700
Date: Fri, 16 Jun 2023 11:12:57 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Eric Lin <eric.lin@sifive.com>
CC: <conor@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <maz@kernel.org>,
	<chenhuacai@kernel.org>, <baolu.lu@linux.intel.com>, <will@kernel.org>,
	<kan.liang@linux.intel.com>, <nnac123@linux.ibm.com>,
	<pierre.gondois@arm.com>, <huangguangbin2@huawei.com>, <jgross@suse.com>,
	<chao.gao@intel.com>, <maobibo@loongson.cn>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dslin1010@gmail.com>, Greentime Hu
	<greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>, Nick Hu
	<nick.hu@sifive.com>
Subject: Re: [PATCH 2/3] soc: sifive: Add SiFive private L2 cache PMU driver
Message-ID: <20230616-revision-speed-a83dc926b334@wendy>
References: <20230616063210.19063-1-eric.lin@sifive.com>
 <20230616063210.19063-3-eric.lin@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230616063210.19063-3-eric.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_031328_733263_B06DF74E 
X-CRM114-Status: GOOD (  10.62  )
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
Content-Type: multipart/mixed; boundary="===============0393246782216082584=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0393246782216082584==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ElvD8fTDzec/LOV5"
Content-Disposition: inline

--ElvD8fTDzec/LOV5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 02:32:09PM +0800, Eric Lin wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> This adds SiFive private L2 cache PMU driver. User
> can use perf tool to profile by event name and event id.
>=20
> Example:
> $ perf stat -C 0 -e /sifive_pl2_pmu/inner_acquire_block_btot/
>                 -e /sifive_pl2_pmu/inner_acquire_block_ntob/
>                 -e /sifive_pl2_pmu/inner_acquire_block_ntot/ ls
>=20
>  Performance counter stats for 'CPU(s) 0':
>=20
>                300      sifive_pl2_pmu/inner_acquire_block_btot/
>              17801      sifive_pl2_pmu/inner_acquire_block_ntob/
>               5253      sifive_pl2_pmu/inner_acquire_block_ntot/
>=20
>        0.088917326 seconds time elapsed
>=20
> $ perf stat -C 0 -e /sifive_pl2_pmu/event=3D0x10001/
>                 -e /sifive_pl2_pmu/event=3D0x4001/
>                 -e /sifive_pl2_pmu/event=3D0x8001/ ls
>=20
>  Performance counter stats for 'CPU(s) 0':
>=20
>                251      sifive_pl2_pmu/event=3D0x10001/
>               2620      sifive_pl2_pmu/event=3D0x4001/
>                644      sifive_pl2_pmu/event=3D0x8001/
>=20
>        0.092827110 seconds time elapsed
>=20
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Eric Lin <eric.lin@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Nick Hu <nick.hu@sifive.com>
> ---
>  drivers/soc/sifive/Kconfig            |   9 +
>  drivers/soc/sifive/Makefile           |   1 +
>  drivers/soc/sifive/sifive_pl2.h       |  20 +
>  drivers/soc/sifive/sifive_pl2_cache.c |  16 +
>  drivers/soc/sifive/sifive_pl2_pmu.c   | 669 ++++++++++++++++++++++++++

Perf drivers should be in drivers/perf, no?

Cheers,
Conor.

--ElvD8fTDzec/LOV5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIw1qQAKCRB4tDGHoIJi
0q20AP0SJ+XMu+AbrLQcuJNmsYqvVW9wc6xBagHa9pzRoEw0mwD+K5s2+gB8wow+
BqnI6l1BRUx8VsrF6VfTnTaE4ZlUJQM=
=YDC2
-----END PGP SIGNATURE-----

--ElvD8fTDzec/LOV5--


--===============0393246782216082584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0393246782216082584==--

