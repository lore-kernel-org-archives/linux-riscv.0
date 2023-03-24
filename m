Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0457C6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 11:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6wCzcuPMBB9cTucMRJ0ZXDj/edesFox2XcuILwy1vE=; b=Pv9shFfPr/vm6ieMpTLTPyPE0Z
	t3Sn0BKKLLYeDO1VUfxOFOWoksTBxIlwM4ah4Mfoi6gpASH6cA9meNE0ePHU7D2e+PXrJu3JSZPv6
	X4YRnK32g0wB3HXMS2DIgM0usdBYjx6AV0HamHOK/mUMCnpNDgNm9zTAHZx+hmyslnenTlqP5StXq
	Dx38M8NpsJCAgvNnhv9uTZdUrlRh42XpxVOoiwggTtTDqxEe+jCryPq8QjwgCcAOkCOFXy7S3U6GM
	4i7u+bP/g3tYZlZ8GswmDzMlBmPMf5OkACKpTm//ePOQg/T/EVU6QDx1eW+RNciZLbrwuF2/tp/Xe
	jApqWSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pffyH-004Hru-1X;
	Fri, 24 Mar 2023 11:52:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pffyF-004Hql-18;
	Fri, 24 Mar 2023 11:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679658755; x=1711194755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3SAe9NA99yijRVFr2DtUytgS4xXVhnx+0/LcEsruog0=;
  b=S0U/KpJETBNU0IJqcdjcDUstjNPbK5oht45yz9AqSF3UXz6Ai5O48IYg
   IS0SDodULtFujg45GUXBZ5zhCpkXwcsXVh7F3nOAqID0BSNOKtH45S18d
   D3Ab1HRCU/rilQtRlJMjlvsN8py38K/0+1zFVupjf+lkj9x62CLM5LEgH
   3QatYcVbSyZxTvEFJbYFYnMAUh37J15i0G66apbpONKmGr6JumBs1jCLB
   V3JN6VKuZIAhT2Gj0lD5zihIjB00SF41Im6mKHET9bFoyjWoYeatrjlJC
   KseC7ITjlUrbIOr9daY/jm/q1aYAmZYaMOIqDCslBuCMHt4+Fd5dZEdPz
   g==;
X-IronPort-AV: E=Sophos;i="5.98,287,1673938800"; 
   d="asc'?scan'208";a="143716479"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Mar 2023 04:52:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 04:52:33 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 24 Mar 2023 04:52:32 -0700
Date: Fri, 24 Mar 2023 11:52:13 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<kvm-riscv@lists.infradead.org>, 'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Anup Patel ' <anup@brainfault.org>, 'Paul Walmsley '
	<paul.walmsley@sifive.com>, 'Atish Patra ' <atishp@atishpatra.org>, 'Albert
 Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 0/2] RISC-V: KVM: Require alternatives
Message-ID: <a58c463e-a3f3-4a4c-8c6e-df707bbd76e0@spud>
References: <20230322192858.1189272-1-ajones@ventanamicro.com>
 <6d263b50-e2f0-4331-b930-c54e27f52fcc@spud>
 <427628e0-4c6d-4934-b873-fa1b81b7daa0@spud>
 <20230324113259.jbfncctnclvkzjkz@orel>
MIME-Version: 1.0
In-Reply-To: <20230324113259.jbfncctnclvkzjkz@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_045235_452600_113C18AF 
X-CRM114-Status: GOOD (  25.37  )
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
Content-Type: multipart/mixed; boundary="===============1540436031489111777=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1540436031489111777==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/b3VworECjemzE15"
Content-Disposition: inline

--/b3VworECjemzE15
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 12:32:59PM +0100, Andrew Jones wrote:
> On Thu, Mar 23, 2023 at 05:57:14PM +0000, Conor Dooley wrote:
> > On Wed, Mar 22, 2023 at 07:40:14PM +0000, Conor Dooley wrote:
> > > On Wed, Mar 22, 2023 at 08:28:56PM +0100, Andrew Jones wrote:
> > > > KVM makes use of riscv_has_extension_unlikely() to check for the
> > > > svinval extension. riscv_has_extension_unlikely() is built on
> > > > alternatives, which means KVM should ensure alternatives support
> > > > is available.
> > > >=20
> > > > The first patch takes the opportunity to cleanup KVM's select
> > > > list. The second patch selects RISCV_ALTERNATIVE.
> > >=20
> > > Reminds me, I need to re-submit my patch doing that for the top-level
> > > RISC-V Kconfig...
> > > For the pair:
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Actually, I would like to take this back for patch 2.
> > Per the discussion on the other thread about XIP [1], I don't think
> > that KVM should be selecting alternatives like this.
> > Would you mind if I picked up these patches & submitted them as a v2,
> > alongside a patch trying to make sure that we do not clip the wings of
> > of XIP kernels by selecting RISCV_ALTERNATIVE?
>=20
> Hi Conor,
>=20
> I take it that resubmitting these patches is no longer part of the plan.

Ah crap, sorry. I meant to reply here after submitting and forgot.

> Should I rebase on "[PATCH v1 0/2] RISC-V: Fixes for
> riscv_has_extension[un]likely()'s alternative dependency" and change the
> select to a depends on?

I don't think you need to. Does KVM actually make use of alternatives,
other than for riscv_has_extension_unlikely(), that are not gated by
extension/erratum specific config options?

With my patch 2/2, alternatives are always enabled for !XIP_KERNEL
builds, and will fall back to the "slow" path in
riscv_has_extension_unlikely() otherwise.
If KVM doesn't need alternatives for another reason, I don't think you
need to introduce a dependency on them and just inherit the decision
made by CONFIG_RISCV.

--/b3VworECjemzE15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZB2O7QAKCRB4tDGHoIJi
0k2HAP9SOvu2jqzjMxKXZwE3REvyGJsEaCb4j7pinn4j+WA/awEA9ipq+EcH0FVu
FysoSj6FUnlN3V5QbmUI/6OmPAZ+/QU=
=pwqz
-----END PGP SIGNATURE-----

--/b3VworECjemzE15--


--===============1540436031489111777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1540436031489111777==--

