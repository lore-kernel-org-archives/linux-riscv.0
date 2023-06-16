Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F74EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 12:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aewTKbxS3OACiNZlHyBfdhGqDwCXC5NF3eh4mIdTttU=; b=iQYg2uFTd7hjf54whVQIqEoMb4
	vZ8g1y68GH+r6/Ee4890sTkrnuuzNuydZ3HZfLh/L6SfUrgKpMLvc1GsQn7yEaHT7dJhZnOy1rsI6
	z5H6nWXyZu5GaqLk74I2x9kqoJEDXgws7kI61PEOX1JITB1T79SOtVkcibFk5xbkkGwbpokpcI43m
	aVzDdLu5exh79vcJtH8RpfMAFDxOPVOoEn+LNzmGKS/AotrrG9szZVi101Nrxw/fSd/dbsEXfhuui
	hZ6dwWflz0R4vGh8J7m8wmeYkjdeZuu87cPLTqbnWuCZqWjjgHDuEobWb8AHy1wc/vg+sn6+CFWp/
	BmVHW07g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA8TZ-000YZB-1y;
	Fri, 16 Jun 2023 12:22:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA8TW-000YXu-2i;
	Fri, 16 Jun 2023 12:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686918166; x=1718454166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ex0yt1i7Cbl/SX0kQYlhzclSAQPI9Tm8drVNJbKVxxQ=;
  b=d4d/4hUkCbNeyXWlRGQ6ytap0delueS3jz4XYjY+xX5CBYLSZ6tBF0kT
   DIFlu3heaZwJVE3zcEJwjW5GzFQ8+KRzJysfto5oDNGSloB1fo7AI7n/b
   jf2vpQ3Do24wh4jyqjJF0sZl9szp9C2Z34XQcvVBsKNU0y3NyPm4MeK2p
   I5ZoFefgRQXt6aBgAEDdFzUI8UGAWbePrqInrSb+1p7pV9y8c5lvfWpVj
   dXXPlFVjv2obRZ+GIeiHEtuc2j13yFO8J+H3f2Bagdfw4jypPfjYL4upl
   vncd8p5RLSeKPVsMjoV693CponG4yzr5L9/WienGZYAR6YoB/gjKgjnf4
   w==;
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="asc'?scan'208";a="157265778"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jun 2023 05:22:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 16 Jun 2023 05:22:37 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 16 Jun 2023 05:22:36 -0700
Date: Fri, 16 Jun 2023 13:22:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
CC: <linux-riscv@lists.infradead.org>, <kvm-riscv@lists.infradead.org>,
	<kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <palmer@dabbelt.com>,
	<anup@brainfault.org>, <atishp@atishpatra.or>
Subject: Re: [PATCH] riscv: kvm: define vcpu_sbi_ext_pmu in header
Message-ID: <20230616-founder-speech-6f57f22e1412@wendy>
References: <20230616115410.166244-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <20230616115410.166244-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_052247_053989_F09BF8C6 
X-CRM114-Status: GOOD (  17.03  )
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
Content-Type: multipart/mixed; boundary="===============4711545458306033890=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4711545458306033890==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q6rxVgS4vXEezT6x"
Content-Disposition: inline

--Q6rxVgS4vXEezT6x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Ben,

On Fri, Jun 16, 2023 at 12:54:10PM +0100, Ben Dooks wrote:
> Sparse is giving a warning about vcpu_sbi_ext_pmu not being
> defined, so add a definition to the relevant header to fix
> the following:
>=20
> arch/riscv/kvm/vcpu_sbi_pmu.c:81:37: warning: symbol 'vcpu_sbi_ext_pmu' w=
as not declared. Should it be static?
>=20
> Fixes: 3e5e56c60a1477 ("riscv: kvm: move extern sbi_ext declarations to a=
 header")

You sure this is the right fixes tag? This code didn't exist when I
wrote that commit, should the fixes tag not be
	Fixes: cbddc4c4cb9e ("RISC-V: KVM: Add SBI PMU extension support")
instead?

Cheers,
Conor.

> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 3 +++
>  arch/riscv/kvm/vcpu_sbi.c             | 4 +---
>  2 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/a=
sm/kvm_vcpu_sbi.h
> index 4278125a38a5..b94c7e958da7 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -66,4 +66,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext=
_hsm;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
> =20
> +#ifdef CONFIG_RISCV_PMU_SBI
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
> +#endif
>  #endif /* __RISCV_KVM_VCPU_SBI_H__ */
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index e52fde504433..c973d92a0ba5 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -20,9 +20,7 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext=
_v01 =3D {
>  };
>  #endif
> =20
> -#ifdef CONFIG_RISCV_PMU_SBI
> -extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
> -#else
> +#ifndef CONFIG_RISCV_PMU_SBI
>  static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu =3D {
>  	.extid_start =3D -1UL,
>  	.extid_end =3D -1UL,
> --=20
> 2.39.2
>=20

--Q6rxVgS4vXEezT6x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIxT8gAKCRB4tDGHoIJi
0vXrAPoDbIl7+BtIQL9RSKnHHl+qR6AC1t2fNpqK2vRdGsayQwEAktGck+kuaWVm
Th3ycnNrUQaUtOO9UX0f+TD5F+ilKA4=
=BTVw
-----END PGP SIGNATURE-----

--Q6rxVgS4vXEezT6x--


--===============4711545458306033890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4711545458306033890==--

