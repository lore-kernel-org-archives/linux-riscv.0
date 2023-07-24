Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C74C41513
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 10:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSFN8xhq+A4AW2KOgnM1o6pkbf3rvAMmStzNOcUxOAA=; b=fL+fhUp8sbJX9ced4twCvuEUSm
	ORgQraERBN/FzcLC67A5FnMO3rqgXgUWxk/X6VMRH5aUSx5fZiA8oV9AuAABRgCWtClr9ZE0VzoVE
	YBYHxTnzxSt2pPIcYatl1MQqv5suQIa5fCZFhUKcMFDELxyICCX43MlyLTBsI70jj0K0hRtTbglET
	CmqHF5e78FRyH2cbVAEYDURtfqzjIKVaKeasdeG08ybqAzPytrKbH2rgh1/p0q060aNqtgSwi8h6L
	ZxHmTAeZDVOWYjmX83SaJLmOOPeYzYsZzIOWysYYhzt0pOIUEwZTUM1vaCy1vJWASL729t7OXaKuN
	kjdIpi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNt83-003t7c-2z;
	Mon, 24 Jul 2023 10:49:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNt81-003t6r-0m
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 10:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690195764; x=1721731764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=95EHCO33OSetnfRqpRYz6iJ7Qi/O2DorW4KOJ3tDnLo=;
  b=opfCpbcHxIhxnw4kbvKT/+2PsGFa/qHJXDi0mDsfdRXlZGvcXXL5gDVC
   Qy//OOT3g+yjQ2UyZHL4vCBoSjrYYyKAx5T2NmPCr9TZWgJqUbuXEIT3+
   zrUKwx5/sHabb4+ywfyQ6WRPTSu3ge/GFJmMM/laspBrT4Fu5ZCLI/u4z
   861BGBf7/MQTT462ne8K4pWYV/DtSjaKFzmYq6L6RXIcvPSvwrM+PU1zN
   grLSQs8S1Yy+Z85XfPLFjWuR02Hxxz2qetbd+6hlegjVPn/OJU1e7KtvJ
   A7PL8PCYyMcw1ETwAkwKdNpdaYmrL9L9Z38uEUY2Hxk6MxXqny3drbeb+
   A==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="asc'?scan'208";a="237303738"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2023 03:49:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Jul 2023 03:49:20 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Jul 2023 03:49:17 -0700
Date: Mon, 24 Jul 2023 11:48:43 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<vineetg@rivosinc.com>, <bjorn@kernel.org>, <greentime.hu@sifive.com>,
	<paul.walmsley@sifive.com>, <guoren@linux.alibaba.com>,
	<anup@brainfault.org>, <atishp@atishpatra.org>, <heiko.stuebner@vrull.eu>,
	Vincent Chen <vincent.chen@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, Xianting Tian <xianting.tian@linux.alibaba.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, Anup Patel
	<apatel@ventanamicro.com>, Jisheng Zhang <jszhang@kernel.org>, Masahiro
 Yamada <masahiroy@kernel.org>
Subject: Re: [v2, 2/5] riscv: Add support for kernel mode vector
Message-ID: <20230724-greedless-pardon-983bbe3178c0@wendy>
References: <20230721112855.1006-1-andy.chiu@sifive.com>
 <20230721112855.1006-3-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230721112855.1006-3-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_034925_286450_ACFCC031 
X-CRM114-Status: GOOD (  15.48  )
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
Content-Type: multipart/mixed; boundary="===============7207814320616306765=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7207814320616306765==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PhavLqLTBHwv0lK8"
Content-Disposition: inline

--PhavLqLTBHwv0lK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Andy,

On Fri, Jul 21, 2023 at 11:28:52AM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> Add kernel_vector_begin() and kernel_vector_end() function declarations
> and corresponding definitions in kernel_mode_vector.c
>=20
> These are needed to wrap uses of vector in kernel mode.
>=20
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v2:
>  - 's/kernel_rvv/kernel_vector' and return void in kernel_vector_begin
>    (Conor)
>  - export may_use_simd to include/asm/simd.h
> ---

> +/*
> + * kernel_vector_begin(): obtain the CPU vector registers for use by the=
 calling
> + * context
> + *
> + * Must not be called unless may_use_simd() returns true.
> + * Task context in the vector registers is saved back to memory as neces=
sary.
> + *
> + * A matching call to kernel_vector_end() must be made before returning =
=66rom the
> + * calling context.
> + *
> + * The caller may freely use the vector registers until kernel_vector_en=
d() is
> + * called.
> + */
> +void kernel_vector_begin(void)
> +{
> +	if (WARN_ON(!has_vector()))
> +		return;
> +
> +	BUG_ON(!may_use_simd());
> +
> +	riscv_v_vstate_save(current, task_pt_regs(current));
> +
> +	get_cpu_vector_context();
> +
> +	riscv_v_enable();
> +

> +	return 0;

This breaks the build as you have made the function void.

Otherwise, this looks fine to me.

--PhavLqLTBHwv0lK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL5XCwAKCRB4tDGHoIJi
0nMpAP9OzkcvJQKAaUisxkPO/0NsqpeNuJapuCCN3ntLg6wuSwD/Xw32TwzmNwM7
B7YKQYkTpHRfocCfWbH3tBswpFEhqwg=
=So5K
-----END PGP SIGNATURE-----

--PhavLqLTBHwv0lK8--


--===============7207814320616306765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7207814320616306765==--

