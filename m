Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC82C4829B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 08:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtOXoMl6I5GKypYhpM+oqZd1T3JMrBUfGCGMxsEuYxA=; b=qBoebthydMxWEYkFCi09xeYQow
	ZiNeH6wZXIJQjo0G0shpus2SizH/loPXnCRz2np7sratXGzGMy9lyh1sdBN4dxQ8XNtJhWNo6EJap
	hl6Dzus+ka92+vV+WhhxTvOFVxCGVwsC0ctVL3pIWfXJ0M3nWfDlM8rypFd5RLWS4UzsHXVQGgVGK
	oMSE75+GZJ+pNO8jZr321l5evozuF4jGHgrI/1117PM4PLlZAsMsxs9BcealktWkPPg0tnL7QAYik
	FVTuFJvtsaEsEu+rLIav28aaQqw/dSGQr8Irt83DBDq20z4lq2y/bXxtMklinitntQI+rcxthfFo1
	lmbIbQIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZRF5-00000004ZBd-0Zhz;
	Mon, 12 Feb 2024 08:00:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZRF1-00000004Z9b-2j1y
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 08:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1707724839; x=1739260839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7hH3HoelP79fA4EAxydxPVb1FLMbOKAgQjwJa4s2m3A=;
  b=zBymmUXiWTCKLkNUK8np2MHmB2GvhjbNvJwhFMkumo9j3A141ngD8nW7
   o32cNB0WPJZzl9kyxQZfbEbjAIc2DbvoqQ8kcyv3EcbjMoEnUqiGdkOXW
   OnBbo/pt46fwp55e+DELrDpotEIu//73FYptHsV5ux1/TEqNvu2bfxtgN
   aTWOKnkehiXWZdMAe//MM7DC/RQTXs4shUNiFg8L0BOG9CrhsB+yibU0V
   BHb7Ie9SGL9/Ki/kAvlmDZ50rmHN5o30p8uULaOlqrNxD9Z8jyKf//Muz
   uBn7uE4d3OYGIyCjFAeZk5sh6dtaAsKFHobnm6Ia1Wwe/Zfi12kCHsEJQ
   A==;
X-CSE-ConnectionGUID: j3L9bk1uS4yWcLk3T9PAMA==
X-CSE-MsgGUID: RWmzpzmsTxGGlYSqjesXwQ==
X-IronPort-AV: E=Sophos;i="6.05,262,1701154800"; 
   d="asc'?scan'208";a="17510501"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Feb 2024 01:00:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 01:00:17 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 12 Feb 2024 01:00:16 -0700
Date: Mon, 12 Feb 2024 07:59:36 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Andrew Jones <ajones@ventanamicro.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <stable@kernel.org>
Subject: Re: [PATCH -fixes 2/2] riscv: Save/restore envcfg CSR during CPU
 suspend
Message-ID: <20240212-sneezing-lifter-d7d390f764e1@wendy>
References: <20240212022642.1968739-1-samuel.holland@sifive.com>
 <20240212022642.1968739-2-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240212022642.1968739-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_000039_893310_0A7B6E38 
X-CRM114-Status: GOOD (  12.54  )
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
Content-Type: multipart/mixed; boundary="===============0887283641835937089=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0887283641835937089==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L/yK4/dJDBsDnoeq"
Content-Disposition: inline

--L/yK4/dJDBsDnoeq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 11, 2024 at 06:26:15PM -0800, Samuel Holland wrote:
> The value of the [ms]envcfg CSR is lost when entering a nonretentive
> idle state, so the CSR must be rewritten when resuming the CPU.
>=20
> Because the [ms]envcfg CSR is part of the base RISC-V privileged ISA
> specification, it cannot be detected from the ISA string. However, most
> existing hardware is too old to implement this CSR. As a result, it must
> be probed at runtime.
>=20
> Extend the logic for the Zicsr ISA extension to probe for the presence
> of specific CSRs. Since the CSR number is encoded as an immediate value
> within the csrr instruction, a switch case is necessary for any CSR that
> must be probed this way. Use the exception table to handle the illegal
> instruction exception raised when the CSR is not implemented.
>=20
> Cc: stable@kernel.org
> Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

On nommu:

  /build/tmp.RcQwFfgWA4/arch/riscv/kernel/cpufeature.c:967:21: error: expec=
ted ':' or ')' before '_ASM_EXTABLE'
  /build/tmp.RcQwFfgWA4/arch/riscv/kernel/cpufeature.c:967:34: error: inval=
id suffix "b" on integer constant
  /build/tmp.RcQwFfgWA4/arch/riscv/kernel/cpufeature.c:967:38: error: inval=
id suffix "b" on integer constant

https://patchwork.kernel.org/project/linux-riscv/patch/20240212022642.19687=
39-2-samuel.holland@sifive.com/

Cheers,
Conor.

--L/yK4/dJDBsDnoeq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcnP2QAKCRB4tDGHoIJi
0hjAAQCt4j31pCTvptmmA76wZTddnhiSMe01Y8CWQitdGCpgAQEA7HxAbB32HLnX
2BntqCYs/siyDbQdgmD9km29tULQKAQ=
=22Gm
-----END PGP SIGNATURE-----

--L/yK4/dJDBsDnoeq--


--===============0887283641835937089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0887283641835937089==--

