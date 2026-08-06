Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476A5C56205
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 16:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJgsxJ1sh9W6EXmmO+mUU9BVCwr21l3SLF5amOASldc=; b=q6g3XQ0op1X7gOr7yTX0sEUZ/W
	/yuJeCAyjv/gCLJRYHAaFwxoynfXI8UlJbTd5xZ9JnADAZM+idhOuEft3wNGgyMpkt3L4pX9zZ4/i
	IZNTJTlqDARaMVDOxln9BO8YkaaZ1Va0/gQHBoBcmW06jr6hiFOghWP7Z2vtH+zAqYjHPRzXcU1Pn
	bFx+1Jrknjr5h7H0cm/npV0wzYUUTt0FtOOxz1O+fes/YxDrPJx+AJK1Y/9xCs00EZYR+yAfA5D6j
	QNsV765vbCad73lJ/kLeQaPOcdDcDM5RPec2VeB1ZIjVxlQ7cf85AODVm3KHQCrtSmT/xv62ly3fa
	NhnQgzXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1IK-00000006FpM-21Kw;
	Thu, 06 Aug 2026 16:50:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1II-00000006Fp8-3Uzj
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 16:50:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 61A1D4193B;
	Thu,  6 Aug 2026 16:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEC51F00A3A;
	Thu,  6 Aug 2026 16:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786035010;
	bh=aPuc2zrAltbKZ+fdJlnFtsRY+93S9N5SzridiGPT78Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OyGnuFWe/TkpxloNsc16W5dSNtg4znh+eh21NtKS/AObZgnftJ01Qitp3p7IAW2TU
	 vGWp+VGsAaEw1G3iNwYnkdjX0VKy0OXtp2rEqJ9VZE/XjnxRS5mQWmb2Wk9ht8nPyu
	 GdiaywnCBX7KYRH14hZupfjw395iK4gvTpL+yNvVtab4DaCFP1eEaF2MHv6H3mZENq
	 gDapFG6DbrdGlB/CznFnM357PU9hzNo3wOEM8x6143mcRzVFzPeeZD4EN3tXvTJyme
	 ULP4Fu/flvODpF+4SxJfsXMwMxfowJX2zQH+e5z0AMkCztGxHtOlPcuaihTH7aqZu6
	 inG7Nrx621A7Q==
Date: Thu, 6 Aug 2026 17:50:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: serial: snps-dw-apb-uart: Add
 StarFive JHB100 UART compatible
Message-ID: <20260806-submitter-retrace-ba05dcf14938@spud>
References: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
 <20260806122553.182449-5-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260806122553.182449-5-changhuang.liang@starfivetech.com>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Joel Stanley <jms@oss.tenstorrent.com>, Drew Fustini <dfustini@oss.tenstorrent.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>, Yixun Lan <dlan@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, E Shattow <e@freeshell.de>, Junhui Liu <junhui.liu@pigmoral.tech>, Daniel Lezcano <daniel.lezcano@kernel.org>, Michal Simek <michal.simek@amd.com>, Paul Walmsley <pjw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============5527859999645304020=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5527859999645304020==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gTvjWTvn0oJlfixR"
Content-Disposition: inline

--gTvjWTvn0oJlfixR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--gTvjWTvn0oJlfixR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCanS7OwAKCRB4tDGHoIJi
0qIvAQD60eZJPBahWlIn01C8IQAuZOIIppV7zo0c41CY/TyZCwEA5+TJNoLvB0BT
7JvXHXIbDZmbJI8yHggizIQFJJz0IgY=
=BpJA
-----END PGP SIGNATURE-----

--gTvjWTvn0oJlfixR--


--===============5527859999645304020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5527859999645304020==--

