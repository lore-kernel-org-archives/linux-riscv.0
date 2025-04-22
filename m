Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF40FC369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 16:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbRmU+R7+WovP1Y1upJUwcSs0O85Gf9sw4ApkZ789H4=; b=p9KSVD5WRYoMVb2JAtxl5q/x+Z
	jF7O5C0Qs+GhuxIHzT8xHUg8K3rawNYkQJC8LP9D4DwOfYortRzdukQMiosYUirl1UxQIrJCmpYch
	0VclKjoEZADB9zG0bN5qjHypiL9rnIz4OuRRviOJqpL5ALbt0VwAqN2Qaske7h53hFjieYXlGMD42
	Qysvd+6tQp8zFFBRpkEUS8xJwsN44lL1Vr9SAdXto/rnDtuTYVAnOt9QX6/7YGzppxjB+xqBv/RU2
	Be1siqKVTgCt0bozzYXQIDTOQuUhO6pbbZ8N/WJ0KIRAG88dA3PxlnRRx312YkRY/jBPHaGPCbFFo
	4ilYyMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GgU-00000007wtD-1IRo;
	Tue, 22 Apr 2025 16:41:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FO4-00000007gFJ-17te
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 15:18:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1FAE5C5C87;
	Tue, 22 Apr 2025 15:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4E6C4CEE9;
	Tue, 22 Apr 2025 15:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335095;
	bh=lIJ8OMpe6o0RJlsNwJEObuhE/ZfUC8shg/qLjSO5CPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTiEbaEuBqPt/jRTIPIz8oqgKZ2DFQVhIa2kj1DfXI18yTgPmr4+BBO4dX7j4lHdq
	 EOsKwV/nySfe1TT9uB4sRncYi1Wesp/u6aLpn9TcD/BvrvUZvt2c0UlarrrJjVOd1E
	 n35r+DC6KTXbcarwNmJRisf86i3ESRPMWL3kbmIg8jGRq41DSDNALyumhfALywlHPN
	 iJF6TcHMjo34MAXhqNc+IQ/TKP9A4jRqTs+zE2y37sjD7pkLhoXRpEU4OM709TlEBi
	 LwzZR6DeEIlx8XctPG+fGTrWMGJCV3CAg7B2wiZqn2iiInVK7lgXRPSGK2dqrfJ9sA
	 vWmfgMiK/QYAA==
Date: Tue, 22 Apr 2025 16:18:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Cyan Yang <cyan.yang@sifive.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/12] dt-bindings: riscv: Add xsfvfnrclipxfqf ISA
 extension description
Message-ID: <20250422-troubling-hurried-59aa22f18ec7@spud>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
 <20250418053239.4351-6-cyan.yang@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20250418053239.4351-6-cyan.yang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_081816_346642_F91864E1 
X-CRM114-Status: UNSURE (   7.54  )
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
Content-Type: multipart/mixed; boundary="===============8441946897401074549=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8441946897401074549==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1351njui3Y9pEl1D"
Content-Disposition: inline


--1351njui3Y9pEl1D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 01:32:32PM +0800, Cyan Yang wrote:
> Add "xsfvfnrclipxfqf" ISA extension which is provided by SiFive for
> FP32-to-int8 ranged clip instructions support.
>=20
> Signed-off-by: Cyan Yang <cyan.yang@sifive.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--1351njui3Y9pEl1D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaAezMgAKCRB4tDGHoIJi
0kv5AQCiaBozksjVGzTlFnAMyJDetHCUR0v40jrk1MMpqnSDzwD/Z0w0GOhTsT+s
tZ9aQktx0FdiWM1RWq+DV25AzoPWUgo=
=/16H
-----END PGP SIGNATURE-----

--1351njui3Y9pEl1D--


--===============8441946897401074549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8441946897401074549==--

