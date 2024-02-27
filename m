Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B783C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uy2LzQxu27HedjFPTtLce4Vl5FJ6j8+j9YDf7TdgtY=; b=yGa0DszvRkpsjdxrZEgRkGaTLm
	dpcXY2EGndhre6frSi9DtJIyp6la+7dM+NzxOnETcL7521lskB7NyjYd8eOTaQSklMNK/iceklRnx
	ensY2aNk6h3HmZ9eRmIgVuNsjVVSzU0bYuccduwymQZzbd+BRvC9UsMrppUnsEyJS5d+W2zBA6Nx7
	EUPRKKDGNSJCnjwsdkJemgs5fH6/neI6DMX3sSPcd/tUoW5YIOgIfI5ypXeaEBzOXFVM8mrqOR5Vc
	bAI7Hm8PI7/owsCIkzXD3RjaVZBRexWezrVjHMpNOJanHmdBiWp8UIu7a+8KYgaGOISIfT/usRpkp
	wbKdIE3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1revJc-00000004ss3-0vdG;
	Tue, 27 Feb 2024 11:08:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1revJZ-00000004srR-2qsG
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 11:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709032081; x=1740568081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=91zHcn3MJxhMJjDwzdIUiuB3M2CKCuchs9SG2CkeaW8=;
  b=aSOu/gAU5Ra83maQjMsOhJ7PqR3PgFutLGdKf2J7bUrWCh0j4PkDOLaH
   /wUz2la/dKPxCj520aXmrIZVX6mfY1NQP5VgmtUrqZ/RrqnOjNzSzMFBK
   V07Z1xH3JEwFQs8plnVTI+jjmNgzo755jb3krej79SRPzv/qyWF53tfwb
   xz9dLPumiR/iz0haPx0RTVFVvA5+US4SrguKok/oRYu/5Npl0oLgzfwyb
   sDfO7q4LvGr6mT+r1CU8wCW5XOMb8hsW5keFluGEUeN7GspUCz9bTwZY3
   Gu42bX1OXG9ffkEsdRDiHhsUfAJy24BHQCtfBmU2ZASgRYsFtEqKyRtvH
   g==;
X-CSE-ConnectionGUID: ISOzzPUQSGWIbJkVIBtfBA==
X-CSE-MsgGUID: eG+1hg29Rg+lI88KmeakeQ==
X-IronPort-AV: E=Sophos;i="6.06,187,1705388400"; 
   d="asc'?scan'208";a="184154380"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2024 04:08:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 04:08:00 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 04:07:58 -0700
Date: Tue, 27 Feb 2024 11:07:15 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Yangyu Chen <cyy@cyyself.name>
CC: <linux-riscv@lists.infradead.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	<linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] riscv: dts: Move BUILTIN_DTB_SOURCE to common Kconfig
Message-ID: <20240227-lifting-durable-484a2f1ddedc@wendy>
References: <tencent_61DFA8E0B13696A3256E538C4BC856633406@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_61DFA8E0B13696A3256E538C4BC856633406@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_030801_864919_087181F8 
X-CRM114-Status: GOOD (  19.76  )
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
Content-Type: multipart/mixed; boundary="===============5668701236493473876=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5668701236493473876==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k8Kp3dpRM3Rjn4tM"
Content-Disposition: inline

--k8Kp3dpRM3Rjn4tM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 24, 2024 at 04:05:07AM +0800, Yangyu Chen wrote:
> The BUILTIN_DTB_SOURCE is only configured for K210 before. Since
> SOC_BUILTIN_DTB_DECLARE is removed at commit d5805af9fe9f ("riscv: Fix
> builtin DTB handling") from patch [1], the kernel cannot choose one of the
> dtbs from then on and always take the first one dtb to use. Then, another
> commit 0ddd7eaffa64 ("riscv: Fix BUILTIN_DTB for sifive and microchip soc=
")
> from patch [2] supports BUILTIN_DTB_SOURCE for other SoCs. However, this
> feature will only work if the Kconfig we use links the dtb we expected in
> the first place as mentioned in the thread [3]. Thus, a config
> BUILTIN_DTB_SOURCE is needed for all SoCs to choose one dtb to use.
>=20
> For some considerations, this patch also removes default y if XIP_KERNEL
> for BUILTIN_DTB, as this requires setting a proper dtb to use on the
> BUILTIN_DTB_SOURCE, else the kernel with XIP but does not set
> BUILTIN_DTB_SOURCE or unselect BUILTIN_DTB will not boot.
>=20
> Also, this patch removes the default dtb string for k210 from Kconfig to
> nommu_k210_defconfig and nommu_k210_sdcard_defconfig to avoid complex
> Kconfig settings for other SoCs in the future.
>=20

> Changes since v1:
> - remove default y for BULTIN_DTB in any cases
> - remove default DTB_SOURCE for k210 and moved to its defconfig file
> - remove building dtb object file for other SoCs
> - reword help message to say N if unsure for BUILTIN_DTB_SOURCE
> - reword commit message
> - v1: https://lore.kernel.org/linux-riscv/tencent_AB625442CC1BCFF86E04D7B=
5891C43719109@qq.com/

This section here (the changelog) should be below the --- line so that
it does not get into the commit history.

Otherwise
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--k8Kp3dpRM3Rjn4tM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd3CYwAKCRB4tDGHoIJi
0nqDAP9ZSWhGK0NbSy2naaZGv5BXsi+RLfI7+rTaQogrTDN45QD9F4Dn8U8zNXOG
7jz12a3xzz+19gUbN2sU+O8G2vwdoQ8=
=7IVR
-----END PGP SIGNATURE-----

--k8Kp3dpRM3Rjn4tM--


--===============5668701236493473876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5668701236493473876==--

