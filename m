Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5BAD609BB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 16:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+g3me4A1kGzLHe06Pj2llOgbuU6Ai43Ia5uSYLIbeg=; b=0n9yEYnysQ9H8X+pF7CPUhRSnW
	+QhqjwK8MuSiHVzFjoQaDAIv2x72203y0ivoNtstSmbjnEVGpQUC4ObJX6fXTD0CcipES2le5KoUt
	k0KsR60i1pwOq4GCWX2YmwhGliaI3GUcvJeKtCW3EvnnmX2F/ZRaj70McFIikl8hwk4PaOdRySDsg
	owdyUzrdVlOjXxiVMTdTagrySwf5TmQpFMMxzBMTWJbUmmwKV0kDzgpYLYOTgl4pESOjxenH0tIB7
	KKLaRxUOtQIUTezdB8TgwJ36o2SZX7xhOxAnIih6DdvhY/BsUyT1+OYcBo9LtO6jn9rr205xZkTSj
	f1vsHwpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY6k-00000005Xqt-04wH;
	Tue, 16 Dec 2025 16:41:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY6h-00000005Xpt-2yI5
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 16:41:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6497643F6B;
	Tue, 16 Dec 2025 16:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF88C4CEF1;
	Tue, 16 Dec 2025 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765903263;
	bh=gLWf9IOQkDnImM+DlGc+esOKlGsP0FIXh/V7uRJefKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JhazTWPdLbi3i9qJUTN2ZC43I/OyNoykyVQ0xg6mHucOwLfANYHpJX3FvMkWYufcV
	 o1RLSXsuF/lOQg+3/VSHMkKPppBRH/y73XBRjFmP8ixqdymFVjTIGYz4P6QfrQA/oP
	 Mxq9VZXUYBrQ4XX4M/I2MFVEeBsXbut4pn5xDBj2B4znltfNhrqgsOAoAfuuXCF2cV
	 apKdfLFJWpf6JHn3XhwjMJQfYDlASZCciMeyLQcPlRFlh3ReVnoJgWSOdsTRNYQNYF
	 0nNRGg3RULKZ+u9oqvEdIIUbIaf1yJ1t2dxIe8c6w4IlD0MgPzNfW49klSwZg609BB
	 Roeq9iRc82hxg==
Date: Tue, 16 Dec 2025 16:40:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: interrupt-controller: add SpacemiT K3
 APLIC
Message-ID: <20251216-aching-feed-1d27e71a0c63@spud>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-3-a0d256c9dc92@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20251216-k3-basic-dt-v1-3-a0d256c9dc92@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_084103_765936_F3B750D6 
X-CRM114-Status: UNSURE (   6.06  )
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
Content-Type: multipart/mixed; boundary="===============8075963358099583141=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8075963358099583141==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JhmyKJ6DVv3RyAWJ"
Content-Disposition: inline


--JhmyKJ6DVv3RyAWJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

pw-bot: not-applicable
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--JhmyKJ6DVv3RyAWJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGLmAAKCRB4tDGHoIJi
0pcqAQDpB+Dg1i3rnP/xTAl/Jw8jDSstTyZ2dBxoRyt/wHK9CgEApR/0s8e6AF1M
cF49Ot1LSkgE66g/pqgEEP0wGxzizg4=
=JI5p
-----END PGP SIGNATURE-----

--JhmyKJ6DVv3RyAWJ--


--===============8075963358099583141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8075963358099583141==--

