Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34190C7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 12:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fYXLSZBef9cTYjKy3/BzJdZJAvaM/k5rsqWyphof48=; b=dgZVAaxXrEtlPmlM+W1Pw69etr
	SrnRHl0kt0rbWekAbtvPa9XicE9j0HHTO0jDOy+AGRzhlCU6RGGjinPKH21zoF6SSpGjY1HrZrsiu
	rb9f9mgMhmnuY7Y1LThETJ4oPI7miyGja+QpeREmZX/hh/TIEHbOaKWMnntLVUWIWipqSX7tTg5RK
	4GNjZWLZE0O4zJmd2De7i1gUoTlapC95XM1XHYO4MWLpfwSxSXJhHsn4aE8adxVXS5JcxzfOp4XF2
	W+xH1WS3i5I2CHYos57Al8AajOMGtugARseNCN+/aYDpEprBDOyEx91N2CK882RtR8sJTplY5CabY
	zZoq2prw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peF4K-0091fA-31;
	Mon, 20 Mar 2023 12:56:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peF4H-0091di-1L
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 12:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679317013; x=1710853013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JxYQs4vBC++B9Sz4RVW+Z4iBWNDki12w1yoHgV52Gxk=;
  b=Nqay76I22p++XKJ3kRwPJkrGqimbIjtL5nl4avJfgxj42+73+jW/RqqD
   m+5MC9mEfyEL3oxNGjR1uhlxIcy6wZ8zc9ST11PnnqnYIaM5XOg/Clorn
   L0vWSCBqLL/5BgtIp0utwo2z0pfgs6r8R3adJZU3pjyQ6ZxvAWLQEvsEt
   hV3NJZHk9ILo/R0fWxGs24RM6AXwhpRjiNJrmw83nY4hIo9LzZPR12ybd
   6YKrUaXV6R4HKsIppB23n4TvJfeF5EsJnHOONrDt31sjf/Jk4m0HTKFcU
   P+Fmp86WpM54F1wtMpCdUo/89PExkI76jrW3ZgrOJBT0lfFeXoEE+EaVm
   g==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; 
   d="asc'?scan'208";a="142921144"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Mar 2023 05:56:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 05:56:49 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 20 Mar 2023 05:56:48 -0700
Date: Mon, 20 Mar 2023 12:56:18 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<leyfoon.tan@starfivetech.com>, <mason.huo@starfivetech.com>
Subject: Re: [PATCH v6 4/4] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Message-ID: <ad8fcf05-0e3f-4350-b9ad-533cee984580@spud>
References: <20230314050316.31701-1-jeeheng.sia@starfivetech.com>
 <20230314050316.31701-5-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230314050316.31701-5-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_055653_516128_86702F31 
X-CRM114-Status: GOOD (  21.39  )
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
Content-Type: multipart/mixed; boundary="===============6506755589072224307=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6506755589072224307==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="92iwmNY3MZHZxEZB"
Content-Disposition: inline

--92iwmNY3MZHZxEZB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 01:03:16PM +0800, Sia Jee Heng wrote:
> Low level Arch functions were created to support hibernation.
> swsusp_arch_suspend() relies code from __cpu_suspend_enter() to write
> cpu state onto the stack, then calling swsusp_save() to save the memory
> image.
>=20
> Arch specific hibernation header is implemented and is utilized by the
> arch_hibernation_header_restore() and arch_hibernation_header_save()
> functions. The arch specific hibernation header consists of satp, hartid,
> and the cpu_resume address. The kernel built version is also need to be
> saved into the hibernation image header to making sure only the same
> kernel is restore when resume.
>=20
> swsusp_arch_resume() creates a temporary page table that covering only
> the linear map. It copies the restore code to a 'safe' page, then start
> to restore the memory image. Once completed, it restores the original
> kernel's page table. It then calls into __hibernate_cpu_resume()
> to restore the CPU context. Finally, it follows the normal hibernation
> path back to the hibernation core.
>=20
> To enable hibernation/suspend to disk into RISCV, the below config
> need to be enabled:
> - CONFIG_ARCH_HIBERNATION_HEADER
> - CONFIG_ARCH_HIBERNATION_POSSIBLE
>=20
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Reviewed-by: Mason Huo <mason.huo@starfivetech.com>

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index c5e42cc37604..473c2a1a6884 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -707,6 +707,12 @@  menu "Power management options"
> =20
>  source "kernel/power/Kconfig"
> =20
> +config ARCH_HIBERNATION_POSSIBLE
> +	def_bool y
> +
> +config ARCH_HIBERNATION_HEADER
> +	def_bool HIBERNATION
> +
>  endmenu # "Power management options"
> =20
>  menu "CPU Power Management"

Since these options are not user-selectable, how come these are
def_bools, rather than just selecting them in the main `config RISCV`
section? Is there some sort of dependency that goes wrong when
structured that way?

> diff --git a/arch/riscv/kernel/hibernate.c b/arch/riscv/kernel/hibernate.c
> new file mode 100644
> index 000000000000..f11be60b0668
> --- /dev/null
> +++ b/arch/riscv/kernel/hibernate.c

> +/**
> + * struct arch_hibernate_hdr_invariants - container to store kernel buil=
d version.
> + * @uts_version: to save the build number and date so that the we do not=
 resume with

nit: s/so that the we/so that we/

I noted previously that the page table stuff is beyond me, so modulo
that, I'm happy with how this looks now.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for adding hibernation support!
Conor.

--92iwmNY3MZHZxEZB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBhX8gAKCRB4tDGHoIJi
0l8vAP9Ee+Fz+1lL0amzFYBI/Hu68qUOkYzhS1WKahRNKBYm7wD/VHK4GaBsPUg4
KCiyt/fV6/UPkd/ICdIl2l/kmo6WUg0=
=Npkv
-----END PGP SIGNATURE-----

--92iwmNY3MZHZxEZB--


--===============6506755589072224307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6506755589072224307==--

