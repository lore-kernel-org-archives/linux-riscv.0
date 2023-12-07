Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9710CC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 14:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkH2woBxtC0g6w5Lu2mqkQ97C5paAUGVgaXu8GB2n8A=; b=I5mX5iGpntqRWq1PByls6Ha7ib
	FkaFRGs6zAJy+wy4OyPiSUnk0+oeIFw3W91ZRpdkzj7FuOV8ecCgZa+K3fuUMvOjRuo1Sh7ll7m2e
	mWvwIFUy6ArylnwZdsZ1pammze2XBwkdLUkseplYcOs/a4tbE++l2r198pvTARkQMFGCqv7SRRW3S
	D1wfXO9ozGv0bdMES8KKoix21UB+1u1xG+QN5NGKO47Tl3mNvUph5gedkhu/hYa6Q0Zb6DEjSDAOo
	WGE9KxtlIeTf6osFKrOb2dWNBEHcO/s9dCtngVVchgsjeqdmLmOlp9foDhdfWkUlFVqKDpv4GmfZB
	gbzl+1gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBF3G-00Cylk-2b;
	Thu, 07 Dec 2023 14:08:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBF3D-00Cyky-2k;
	Thu, 07 Dec 2023 14:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701958108; x=1733494108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GKKiprSC301Q/AIeayiNtJoUwjj/0Z6QsX3HsdR0aTM=;
  b=yswXfyitDKFKlY3VDjtDPf04N7FSKZJHvOHEipFy56QzcScEJtTe8jEc
   hoWt/Roc7t3ck28IhcTBLEA91mUbQcwA5gqwWnVqVmB0kV1umbSaJNXiA
   ED6exSps1QkvbCISApVWo1YIwEz1fXXpzd9teRv6kkhlI+gdE1fN99VE2
   DPSFJYRumyfn8mETiAjYIkcfKuOXAU1LN4y0wX13J934rRsROzSLLh7Lj
   8IydQcfsG4advLnLHudZSDONmJAL+ifsqvmYmH/2ruBTcn6KVhgpEsQ74
   T1z/MbDTgWAE8+JitpflxaGF3z5ONs9Ue1X35im3++jnrvPg8M5woywt7
   g==;
X-CSE-ConnectionGUID: m2fZxj86SumexGQMB9uwOQ==
X-CSE-MsgGUID: B0qPIv/8T4KE8pZ2VLe+tA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="asc'?scan'208";a="12934293"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Dec 2023 07:08:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 07:08:01 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Dec 2023 07:07:58 -0700
Date: Thu, 7 Dec 2023 14:07:28 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<virtualization@lists.linux-foundation.org>, <anup@brainfault.org>,
	<atishp@atishpatra.org>, <pbonzini@redhat.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <jgross@suse.com>,
	<srivatsa@csail.mit.edu>, <guoren@kernel.org>
Subject: Re: [PATCH v1 04/14] RISC-V: paravirt: Add kconfigs
Message-ID: <20231207-unsealed-bunkhouse-bd79271b4896@wendy>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
 <20231205181119.207204-20-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20231205181119.207204-20-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_060827_891533_E0E21FCC 
X-CRM114-Status: UNSURE (   8.31  )
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
Content-Type: multipart/mixed; boundary="===============6445441921007192729=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6445441921007192729==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f2Nei8/R6cqxLGD+"
Content-Disposition: inline

--f2Nei8/R6cqxLGD+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 07:11:24PM +0100, Andrew Jones wrote:
> Now that we can support steal-time accounting, add the kconfig
> knobs allowing it to be enabled.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

In hindsight, should this be squashed with the code actually adding the
support?

--f2Nei8/R6cqxLGD+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXHRoAAKCRB4tDGHoIJi
0qUfAQCqwJvSwf/igC0LLRE8vbiSENZiLROkCzNiXFQVBy2CXAD+J8Bq9Z5EDEBC
tchBjiYy3HOQKbc+BqTmd6Wq3zjSDwk=
=Wn6E
-----END PGP SIGNATURE-----

--f2Nei8/R6cqxLGD+--


--===============6445441921007192729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6445441921007192729==--

