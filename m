Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97323C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 12:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwXihZzmLf8YvoBrsRIeY4WqyuDWkmgQTErQ89TKXJc=; b=DXdWYnCReZyl5tBMXcBD7QEHjc
	trwB0nDjwLQEiajW4NUziRtuv3okZN5nXEJxcLIBDjAGF5E0LuH6UI9IaAYz4AbI8l9brfBPxDm5u
	nJS8xk1adz4asNxMQlSwE9hS6J00j1f3cB9uBkVQpBCsR+AB/qHWdmXFr3sAKMhcRVZMBubTEsaxG
	KiDYk32SIsw3I/KCRsxDxZdRSrNPhXPK32RCOKYh9+AaTWgwaeqpW663KRXCzs1Tkq4B77Jf20wzc
	K2Ph70GWuQU5whWTOXTR1lVsLY8rSOILV6EtpP8Ll9zaGeA7G24reihlOe2gbo54j/Y0ILb27yoJW
	cnOdnNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGPF-0000000HB4A-2POJ;
	Fri, 12 Apr 2024 12:53:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGPA-0000000HB37-4BXt
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 12:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712926401; x=1744462401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RCL3GDBIalzPPzrhwInTi0of4Qd4xYEJFXocUFu6jL8=;
  b=ItupTJHZEuy+LQlG86tRYnguc0NQULE6u0qrMMa+7MxzXapSl+d4vLfm
   RCv0Zal2dby+FFo18kEzBmi7TiY15J/R9aYt3xu9frI5PJL4jzz+bqDkW
   Bgrljsl9pXucF9fIGlUkB1ZEVlyXFZgXlY/e2VgJHS1Ww1zK8Ex0fpArI
   Pjob0uRCoe4FQfT8rytt4xcINUnx15vtejNJrjFonffsqK/+ByEesfhyR
   bX3xBPOqEff76MwML8A4F2azA0lIL7z2OsB1p4VipTDeYaTcLMvIH/mlH
   OhZH6tOa4V9o/7TkOReLFdXutOX3wsrA1jO7B2FbRTsEEenAujrJTWlK9
   w==;
X-CSE-ConnectionGUID: xvHXmpfzT7GCi3Fou8Incg==
X-CSE-MsgGUID: GwH4QwB0SG69V1ZPGXUWHA==
X-IronPort-AV: E=Sophos;i="6.07,196,1708412400"; 
   d="asc'?scan'208";a="251536449"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Apr 2024 05:53:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 05:52:37 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Apr 2024 05:52:36 -0700
Date: Fri, 12 Apr 2024 13:51:45 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] cache: sifive_ccache: Auxiliary device support
Message-ID: <20240412-antacid-pretzel-c25d707f02cf@wendy>
References: <20240410232211.438277-1-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240410232211.438277-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_055321_069607_937221BA 
X-CRM114-Status: GOOD (  13.81  )
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
Content-Type: multipart/mixed; boundary="===============3092428419433257228=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3092428419433257228==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KR2qWsXqqA2l3aGz"
Content-Disposition: inline

--KR2qWsXqqA2l3aGz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 10, 2024 at 04:22:02PM -0700, Samuel Holland wrote:
> As of commit c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a
> platform driver"), the cache subsystem binds a platform driver to the
> Composable Cache's DT node. This prevents the perf subsystem from doing
> the same for the new PMU driver[1]. To allow using both drivers at the
> same time without conflicts or module linkage dependencies, attach the
> PMU driver to the auxiliary device bus. While at it, prepare to use the
> auxiliary device bus for the EDAC driver as well, which significantly
> simplifies that driver. The actual EDAC driver conversion has to wait
> another development cycle to avoid dependencies between git trees.


I'm not really keen on the partial conversion, I'd like to see a
complete conversion where the ccache driver calls
"sifive_register_ccache_pmu()" and "sifive_register_ccache_edac()"
and has no part in creating the aux device itself, like Philipp and
Stephen asked me to do here for the clock/reset drivers on PolarFire SoC:
https://lore.kernel.org/all/20240409-shallow-voice-c84ed791bc7d@spud/

Thanks,
Conor.

--KR2qWsXqqA2l3aGz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhkuYQAKCRB4tDGHoIJi
0kVAAP9mbHOk0zEUzhsEt4WvIpaZeCF/FXZSFyZyWTiFCHFLzwD9GBDJql4D9mri
vjwiORtlGvkcH2+Idjuh0kEeqcGP3ws=
=KzTj
-----END PGP SIGNATURE-----

--KR2qWsXqqA2l3aGz--


--===============3092428419433257228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3092428419433257228==--

