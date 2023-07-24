Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E93C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6EAt7LjbQo9uI7Za0C+yhVrAdxbn22Qe1+wsbTRRsE=; b=l57JU0UQa1CIvJFEg+cj6JN3V4
	8AOIGKTOtMe0CnSuLIH5bKL0jyBslSxKNhnMojBU/h4+zzZGgXIN5E/nEKnCckM1hAjteH8s17MDc
	7M9dD2EmjmPVDR7P2TB8uobr5W+z7UlnvZvuvQf8400sN5Gz+MEYtPO2JcNdwBnWWXAjQ43bUqKug
	/iIZzJZ+CI3W1hogwZTnoOUOwNIJo2JNP9FD07N2kaXClFHfwHN35+i4fkWmXG9MmwKgxjXgkmA1l
	2m7idPMd63o/mEtV1BSSIOjCgMfmL3UsmsERMb9Clob6tkSoXyXTMzJjSrhnKZ9KcuIxesof8Ky3/
	goZVYjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNtX2-0040uN-1I;
	Mon, 24 Jul 2023 11:15:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsMb-003YwR-0z
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 10:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690192825; x=1721728825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7W6ps/8Cg91gSa3DYMMMR8pTKl+/b3TOAhGDrv2gtYk=;
  b=vzIh+QknOj2Vsc7Hb7Vlcdh0Ca+6veHrd9n4u5WiyFtMnb+lECwT7cb8
   skQ8ef0eVCoBC0Z5Zo0tiFKGyzKTyCpQGBFC9bS7od8Q6kyRWso0xXpl1
   naNVo0gBEK0ClHA0I5CDne37ic8P0YtwXcHY+yJ/1fK5aSnTu30GChstQ
   DRp8SbCVQK3Sjmv3kwVp4KGcgCHB7FvQG7osTkkFENsKHDX1usbQT1GCU
   OGMZGGatDw8eRRcYTbs+xGxsdmEyhIDcxywXurbj2umN6m0COze+8ialM
   tBLm04cCyEV8KfXvOB9ZwlrUTa5VmChaMK2SinEr7gT/PExDLzAyb0tFK
   g==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="asc'?scan'208";a="226147368"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2023 03:00:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Jul 2023 03:00:17 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Jul 2023 03:00:16 -0700
Date: Mon, 24 Jul 2023 10:59:42 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann
	<arnd@arndb.de>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v2] riscv: support PREEMPT_DYNAMIC with static keys
Message-ID: <20230724-work-headboard-b1a4f5286ada@wendy>
References: <20230716164925.1858-1-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230716164925.1858-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_030025_560955_681C805F 
X-CRM114-Status: GOOD (  23.22  )
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
Content-Type: multipart/mixed; boundary="===============4707031764948818046=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4707031764948818046==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LITXHKhDZjLv/zTW"
Content-Disposition: inline

--LITXHKhDZjLv/zTW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 12:49:25AM +0800, Jisheng Zhang wrote:
> Currently, each architecture can support PREEMPT_DYNAMIC through
> either static calls or static keys. To support PREEMPT_DYNAMIC on
> riscv, we face three choices:
>=20
> 1. only add static calls support to riscv
> As Mark pointed out in commit 99cf983cc8bc ("sched/preempt: Add
> PREEMPT_DYNAMIC using static keys"), static keys "...should have
> slightly lower overhead than non-inline static calls, as this
> effectively inlines each trampoline into the start of its callee. This
> may avoid redundant work, and may integrate better with CFI schemes."
> So even we add static calls(without inline static calls) to riscv,
> static keys is still a better choice.
>=20
> 2. add static calls and inline static calls to riscv
> Per my understanding, inline static calls requires objtool support
> which is not easy.
>=20
> 3. use static keys
>=20
> While riscv doesn't have static calls support, it supports static keys
> perfectly. So this patch selects HAVE_PREEMPT_DYNAMIC_KEY to enable
> support for PREEMPT_DYNAMIC on riscv, so that the preemption model can
> be chosen at boot time. It also patches asm-generic/preempt.h, mainly
> to add __preempt_schedule() and __preempt_schedule_notrace() macros
> for PREEMPT_DYNAMIC case. Other architectures which use generic
> preempt.h can also benefit from this patch by simply selecting
> HAVE_PREEMPT_DYNAMIC_KEY to enable PREEMPT_DYNAMIC if they supports
> static keys.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> since v1:
>  - keep Kconfig entries sorted
>  - group asm-generic modifications under CONFIG_PREEMPT_DYNAMIC &&
>    CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
>=20
>  arch/riscv/Kconfig            |  1 +
>  include/asm-generic/preempt.h | 14 +++++++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4c07b9189c86..686df6902947 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -130,6 +130,7 @@ config RISCV
>  	select HAVE_PERF_REGS
>  	select HAVE_PERF_USER_STACK_DUMP
>  	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
> +	select HAVE_PREEMPT_DYNAMIC_KEY if !XIP_KERNEL

Had a go of this, and it seems fine to me, as do the asm-generic bits
seem fine from a single arch perspective.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--LITXHKhDZjLv/zTW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL5LjgAKCRB4tDGHoIJi
0nJOAQDVwcZ9xhtArPHW8vfa6H/+/R06yt6lycDcQIEurnKR9QEAmupS+LHdvohd
H0H9yLqR5F78hTmvW/ipHX4SxS+oxQQ=
=IK0A
-----END PGP SIGNATURE-----

--LITXHKhDZjLv/zTW--


--===============4707031764948818046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4707031764948818046==--

