Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8BDC7EE2E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 10:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9Iirc+G8RElbqks9dI+6AJCeJ59rLbDuKpcuFtsO5s=; b=bnxwZX9M5jISXz2w6Roz7wKUf3
	RNNPaSvmYLYuP+MgicCuboAD0EG1tzGIueFgdjWTVYNgJ+CbS565nmFyO+I3Wyw0cau/qPcAV9zVj
	sPIB38U13imY0zYLev2Dwyx4fN8e9eS2aUl0TtBsSmktqlOzFTWktRVVXp5f42X0dxStuOI/vI0yg
	lO67P69Qdr8C3/TmuIMcXIa6BwD+HjX5QHoMbjzWJNFZsDkM2bKJ+fjSVPZ/nVEQSGwkWpfvUrF55
	YlDEr0kL1hACReFQEOo66y2MOJ6YgaZ+WAMVtNSJA7iBSNhYWcHWHjviQR7ZbJCNSCMPwrWxOrn8V
	dL714L7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3aN5-00AAKQ-39;
	Mon, 29 May 2023 10:45:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3aN4-00AAJq-0o
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 10:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685357101; x=1716893101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YeK4bOaPPVED6M0jo6gE82z2OrZM4hi2gJuygqvi62w=;
  b=YAKy4wEfwTn3f+pZNB5VgiOB0bmhidbVEK93/V7dCXmCQrtqq+V9ybbS
   qO02x/FjJeTVJkVyMfRg+ctbh6OrTQnDsgpow6hQHlqab7iklffz8cJpp
   YzOM7oKl977rDT3O5dT14VlqPJVZaD0hXyM7TkWObEXeCTC2HN0GLS0/E
   PcXJkCfXdZYe29MFvpTgjXGJLFbJEijbr4oteU1Go+J/6v/GTaf+qSqOX
   tjRAUeMok7E22L2zHvSgDvFjJBXm6r+8SQHuFoIIIG4/F5S0YrWEH6My8
   bdJuw3o//2qjcfQnfKEAdeDlGX6T82rGYKPQNkMgwH5E9eq6K9k4F1quV
   w==;
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="asc'?scan'208";a="227430189"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 May 2023 03:45:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 29 May 2023 03:45:01 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 29 May 2023 03:44:59 -0700
Date: Mon, 29 May 2023 11:44:37 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 2/6] riscv: mm: mark CBO relate initialization funcs as
 __init
Message-ID: <20230529-borough-climatic-59605cdd65fe@wendy>
References: <20230526165958.908-1-jszhang@kernel.org>
 <20230526165958.908-3-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230526165958.908-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_034502_298084_777708CB 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4352152891510731902=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4352152891510731902==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BKsJkpcc/h7MB+TE"
Content-Disposition: inline

--BKsJkpcc/h7MB+TE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 27, 2023 at 12:59:54AM +0800, Jisheng Zhang wrote:
> The two functions cbo_get_block_size() and riscv_init_cbo_blocksizes()
> are only called during booting, mark them as __init.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--BKsJkpcc/h7MB+TE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHSCFQAKCRB4tDGHoIJi
0qcOAP9bmBs7+ststKrxj2fgL/PLc0wiDSRdWDPIllmdfLdQnQD/XP74ftRp7Jcm
0/AtBFBnSLBAQKE3KzLK1VcCxjrDbwk=
=Cas7
-----END PGP SIGNATURE-----

--BKsJkpcc/h7MB+TE--


--===============4352152891510731902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4352152891510731902==--

