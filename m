Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC11CCD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 10:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=klJ4WpZhaC6EKGVr889+TdmMtPQ0FOOMYUekYUVU71w=; b=GNH
	xBwI34d9Pj74OWG/sbpqipxHU9pRnAKrApwouTgpO6JwidigFxL47mPxYF0Rf2RS1T0zcPVKJMWpH
	FzsOz26wM35xYfsy1y8m4gvR7hAnxYBZFlWCf9nbloxFsuh/YFZDsryGyhB2L+AtGJVTkQQOeUlbm
	L7mQw06OV66v8325YLZhn2WFTvUZ/wx83oRZo3+RhgK7Kdet9YVmuZhQGeDVg1XRcEfeWHPmdu5o/
	lSjIF1vzthcFEH1o6aXhpAwDg0o9putxtXfmz53INksnShrMZ2QAWaT7L57si07vXPIf9gs+v5WhI
	MFUWkYXmjWfL9I96gIS0iL9jFDosBjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBcY-00FCRf-2Z;
	Mon, 18 Sep 2023 10:36:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBcV-00FCNY-2K
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 10:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695033407; x=1726569407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=45EWWhl+W/dF46c9zVATx49jdMHzZ7N/Vpt42wM+9PU=;
  b=dE+Zd8nQARaDSsP0HHBHTpTx43bnQIFTUnFBHnJZ3E5kR0wg4+GysX71
   uKLOIwdUf8PpI16BrmFahlcoi+tWp8/TpiJ6CM3Ld0Vpa3YNMg/gr9oVa
   N20qsuuNw2bLNr9chDCLIf3eKR8h55K5KKcGyuPadT7P8sHYNqE6CHG9W
   CFqaeaLi/jxzjX8hxhxNBYW58LMxEl/JhLBoT21ve1vQ5vlKv8AnVW356
   cmdEULU+3zkQt/F1QpYA3han3KJ6jetCzhIVgCSpkSjw5idouZKflZCEa
   IbDNQTyDkrboCS9jyTyMiwLk3FWNF4SYNsQvVUKKkBOSZECKlm7vrPThY
   Q==;
X-CSE-ConnectionGUID: RV5cahfSSHCtRXg2ArBihA==
X-CSE-MsgGUID: S80qPqi9SxyWaXpoW6HSgg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="asc'?scan'208";a="172196851"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2023 03:36:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 18 Sep 2023 03:36:20 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 18 Sep 2023 03:36:19 -0700
Date: Mon, 18 Sep 2023 11:36:03 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Palmer Dabbelt
	<palmer@rivosinc.com>, <linux-riscv@lists.infradead.org>
Subject: more RELOCATABLE + errata code model issues
Message-ID: <20230918-retool-presoak-e47ed2f2b8d3@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_033647_951707_1D39038A 
X-CRM114-Status: GOOD (  15.75  )
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
Content-Type: multipart/mixed; boundary="===============8688643687520045617=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8688643687520045617==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sj/yOhfTldg67vR+"
Content-Disposition: inline

--sj/yOhfTldg67vR+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hey Alex,

LKP reported [1] some issues with relocatable kernels & code models.
You didn't touch the commit that caused the issues, so you didn't see
the failure report I guess, but Prabhakar is looking for some guidance
on what he should do to resolve the problems. Copy-pasting from his
mail:
> > All errors (new ones prefixed by >>):
> >=20
> > >> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against
> > >> symbol 'riscv_cbom_block_size'; recompile with -fPIC
> >    >>> defined in vmlinux.a(arch/riscv/mm/cacheflush.o)
> >    >>> referenced by errata.c
> >    >>>               arch/riscv/errata/andes/errata.o:(andes_errata_pat=
ch_func) in archive vmlinux.a
> >=20
> I did reproduce this issue locally. The andes errata is not compiled as m=
edany. The config is RELOCATABLE + MEDLOW. I can see the cacheflush.o is co=
mpiled with medany flag.
> I can fix the build by adding a medany flag as below:
> +#ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
> +CFLAGS_errata.o :=3D -mcmodel=3Dmedany
> #endif
>=20
> But I am not sure if this is correct approach. Any pointers on this?

The T-Head errata have something similar, so seems like fair game to me.
Any thoughts?

Thanks,
Conor.

[1] - https://lore.kernel.org/all/202309111311.8tcq3KVc-lkp@intel.com/

--sj/yOhfTldg67vR+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQgoEwAKCRB4tDGHoIJi
0rsgAP40HFfe6SLVBiFexHJQnUV/f93ncBhuYNCqV2LOqK6b7wEAzdYvzF76hmLa
oKxjjRvRgYGVp8Vk0rsP+mB6TK76lgQ=
=tbVk
-----END PGP SIGNATURE-----

--sj/yOhfTldg67vR+--


--===============8688643687520045617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8688643687520045617==--

