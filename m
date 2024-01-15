Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACEFC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PouxPkabs0LD512l4ANuts7mH2jTH0poU6P6rjioLdY=; b=KTgs4W9Y0vPuP7A0T9DzC3so0y
	bu++E6AaQhsbYpG3EspJs87GBl9tJTwwxgJzTTV+JlMErHyCRLct94V2oQ42yiFklXB37LMn7OyQ3
	nIcgqQ8JK4MCe33I0y+91CglCCkSeOaNw/zabcN1Yl02JncU9UA8iLdgzm7M3Jj8XKizyw7sweBY9
	o0e1kaX9/5LBPxdjcKKBjeOU0cZJKU3Inln/+N8nWD9toqAeqrYaEGaLVWSUySDWD11O0Q1Sfrf+i
	Z05QD1BuxSIKj54KohbqEggbVC4kpqImQbab6CuNHtBwFNTmEaj3bM0yyebWeiR2ptrqjYFpDl0py
	JmO1unZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMnM-0092FH-0n;
	Mon, 15 Jan 2024 13:14:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMnI-0092Dz-3A
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 13:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1705324464; x=1736860464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jFA3loSz7KBaa/Y2oZSte/KcReqaqC7L01dAxlTOXyY=;
  b=uscVtDYtCrsQymCWmveFgeUqY/YIzdCgk13Z2HnhAcqoI8OC0khS7yqf
   ytYq2VS6y17f5omCgBVUxOpn/xQHVjB0+ZlP2niPK+8w1v3Spf7O9gLBn
   UU7+e7R4mppb67G4ECp14f3VR72bwgZteOCpd2+SmZTwCNR48aoTmt/bm
   /Nwfp0hUOlqjEsTkWuFyRO0mJOCB8robb598f/Jpe5j/Kc0n24FFa+GWt
   73vR3CSnD9lsX+PevGq8PAOvkdGmbNG/u5ARX0Al89AmJn2gxGydQUfGP
   3otPRrYzsv4inUaCK5dV50R/SZYNYoeM3o1yCLAV1Y0ix9VPdklx8x/40
   Q==;
X-CSE-ConnectionGUID: lKQerpMqQvmPFpiQXHFOyA==
X-CSE-MsgGUID: +966s/esQnO+EyrA43oQ3g==
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="asc'?scan'208";a="14745244"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Jan 2024 06:14:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 06:14:07 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 15 Jan 2024 06:14:04 -0700
Date: Mon, 15 Jan 2024 13:13:28 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Drew Fustini <dfustini@tenstorrent.com>
CC: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Han Gao <gaohan@iscas.ac.cn>, Xi Ruoyao
	<xry111@xry111.site>, Robert Nelson <robertcnelson@beagleboard.org>, Jason
 Kridner <jkridner@beagleboard.org>
Subject: Re: [PATCH RFC 2/3] dt-bindings: clock: Document T-Head TH1520 AP
 clock controller
Message-ID: <20240115-canteen-erupt-6634a1deece4@wendy>
References: <20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com>
 <20240110-clk-th1520-v1-2-8b0682567984@tenstorrent.com>
MIME-Version: 1.0
In-Reply-To: <20240110-clk-th1520-v1-2-8b0682567984@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_051425_149924_7D2BAC98 
X-CRM114-Status: UNSURE (   8.08  )
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
Content-Type: multipart/mixed; boundary="===============3434472241033309891=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3434472241033309891==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rMErKyKoeRnUvEeF"
Content-Disposition: inline

--rMErKyKoeRnUvEeF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 08:35:16AM -0800, Drew Fustini wrote:
> From: Yangtao Li <frank.li@vivo.com>
>=20
> Document devicetree bindings for the T-HEAD TH1520 AP sub-system
> clock controller.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

> [add link to reference manual]
> [fixed dt_binding_check warnings]
> [revised commit description]

btw, can you remove this sort of thing from the commit message and put
it in the changelog instead?

Cheers,
Conor.

> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>

--rMErKyKoeRnUvEeF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaUveAAKCRB4tDGHoIJi
0o71AQC7nn7S9wVZcBWfek1L479XEOdH1Z5hOxIxFhTm1tvM5wD9FzT/nkA5j93k
DdcuMppH6E9l1Sx1mO8fXbTXey55jwY=
=DAbR
-----END PGP SIGNATURE-----

--rMErKyKoeRnUvEeF--


--===============3434472241033309891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3434472241033309891==--

