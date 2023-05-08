Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F05C7EE2E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 07:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMSFLcIZOFGcFb0xfcnzvVp9UWyQWHnG8hsp4i3uNP8=; b=mg/M5/uhaUEaXzME7Q5afS0asY
	zkl1+m6IcPkDypoa7QW0Ab905Hidj2sOJXWrKkB7yRU4t66j2LiYFHvN2DhNaK6qw5NRQ1aMYwvfr
	DvnmYfwDHyOY3iNld+E/Ej5QGhH6QAUjosfiYnsveGgysrcRS4jv93zGASaGT+YFCL752pkuvTKiK
	IApgwNK6RdLRYtMXdvOR0CoIbWVKLPOL2S3TRzOm4JUDPwf3aLaGiwpHiMz/mReSD7BM5tJUlQrlm
	HJEAbNdxwlYw6nzMJDWGt94ujkvI3pWBFIBzN9SYJeSiNO7hfNb1xIpzf4vAXVVnj2tevmSwGoJcr
	IGg9X7HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvuyZ-00HScl-37;
	Mon, 08 May 2023 07:08:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvuyX-00HScP-2r
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 07:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683529681; x=1715065681;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gIJQeimsaJg9aD/2efIKyUiZi5Rpjyt1p5VyLjuLh18=;
  b=2FIrb6OclJWnt6oF6YHRv03VAlgiURB7mQpfLCs5Xo8zbYaj8hkMwgga
   LMKWvy+tQD92kFaZmhDeqqyz/Rr9dvyYhIdzDyX+mQZOe77xcJdKt5C1Q
   j2vy20v97CLSgvGDgPcEboQl+CMRcTbT08Qq21/tJ2UVOr86DMS3plT5l
   ca/DFqzSsKQvXlVuXPDYH7A3cIna8XfRzoc4T46yyn0FswQ+V2GbrZmhk
   U+qG/D3RlNlKFYuV59ch4UQuJAS68IJLedMqFAnMCIS9PvbTy1sUKrYvz
   NxU08d4ZaiWy1dTgc4A7dv5228u2wMUU7baGxjefiifDyxij7TtaxfJjS
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,258,1677567600"; 
   d="asc'?scan'208";a="224269826"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 May 2023 00:08:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 8 May 2023 00:07:59 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 8 May 2023 00:07:57 -0700
Date: Mon, 8 May 2023 08:07:37 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Guo Ren <guoren@kernel.org>
CC: Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/5] irqchip/sifive-plic: Support T-HEAD's C910 PLIC
Message-ID: <20230508-shining-slug-ac097b6e84ae@wendy>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-2-jszhang@kernel.org>
 <CAJF2gTTni=G5FP80rSArErXGWQatR1P8rCy9nNOggeA4vtXftQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTTni=G5FP80rSArErXGWQatR1P8rCy9nNOggeA4vtXftQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_000801_954821_65328EBA 
X-CRM114-Status: UNSURE (   8.05  )
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
Content-Type: multipart/mixed; boundary="===============5756775688062819735=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5756775688062819735==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7VenwF0zXlIg4UWR"
Content-Disposition: inline

--7VenwF0zXlIg4UWR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 08, 2023 at 02:52:29PM +0800, Guo Ren wrote:

> Another question, Could we change the name of Sifive to RISC-V when
> "cat /proc/interrupts" ?

Previously NAKed by Marc as it is ABI:
https://lore.kernel.org/all/20511a05f39408c8ffbcc98923c4abd2@kernel.org

Cheers,
Conor.

--7VenwF0zXlIg4UWR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFifuQAKCRB4tDGHoIJi
0h/FAQD5GQTBSDo5ioR96jkLYSfHS+30cKqxlbjj1g/5O8mwYwD/dNHbabmC3eDn
FM78yqmpsQLOkYOMt/l/5SXnme+0Cws=
=jZRC
-----END PGP SIGNATURE-----

--7VenwF0zXlIg4UWR--


--===============5756775688062819735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5756775688062819735==--

