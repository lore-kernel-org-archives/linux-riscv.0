Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9153FC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 16:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCOTv3yhcnFLnT/DY941ge2ITjfcPo37+UtmM9yLep0=; b=ALblrPFejHoofiQWuyPeXFDTLY
	WGYnbtzFzHjMvhBzDe2P4h3Znf3cfY47BcXZV694VTiuZ1c3tLb8IZXdRg0pWcn5dj9vs9rvHMO1x
	kd4IjHDhtcYYmjUQEGrkCMrERcxGS554vWoi+rJ/EAvwxa/SAIOQfCqpDVlvQLv5wb0ozCoxztsp6
	mOZ89M6lIX2JGuQM5zrTOMYh+xOmTb18YAknjdzmkkgS+egRRTlEN/NHOyu9UAO/yW8ZK61FMJE0P
	Ex/mNa2T+XH1IMN3krAgyoZVN+I86Y1HTbQ87WS1/RmCh1K3DxzaO7A0j5ilchAYyoEv1HFwrw8su
	gW285M2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEHn-00000005IWV-3CaR;
	Fri, 10 Jul 2026 16:41:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEHm-00000005IW9-351n
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 16:41:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA9D16132C;
	Fri, 10 Jul 2026 16:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF821F000E9;
	Fri, 10 Jul 2026 16:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783701669;
	bh=zpfe15YD5JBM8nm7Z4e88EWsxxEDDJVjveJb96Udl1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Raqyok6tlRT/4cby1PEBf5/rh/wNKpXiLRaosxHRR9kljMWZEc2yixcn1gqzF1oaA
	 l4WseRf1xIjtP+UuoYnPi83bBYQRgZt1EZLDHwUpzax3Y38wsGRlgtmodzozSuRLCJ
	 1wfuX+Ux0APaXfkcgtIZG1s77GBY900+0KS6jMKyBV1LLSAVr6l6ohtZruTj00Cxc9
	 QvLpoqP9H/m4PNffM0dI5nX4JVqZNZS1QkwTETKXxyOJRU7tfV6d3exceFOAjzNeCb
	 YiEaAY9XqIpzeBEso0+t70VkuFUh9dPJikkb1dCRQcNw7jBf5c+W/gNqw7i3xWh1SS
	 2bRezy0GYFpPA==
Date: Fri, 10 Jul 2026 17:41:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: soc: sophgo: add Milk-V Duo 256M
 board
Message-ID: <20260710-sarcasm-manmade-bdd889cefddf@spud>
References: <20260710075917.159969-1-chenyou910331@gmail.com>
 <20260710075917.159969-2-chenyou910331@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260710075917.159969-2-chenyou910331@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5305008753606061535=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5305008753606061535==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S5DilZCTUEyk3TU+"
Content-Disposition: inline

--S5DilZCTUEyk3TU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--S5DilZCTUEyk3TU+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalEgoAAKCRB4tDGHoIJi
0o40APsHyfBdrwi5DEqjFKf+ydGAfwMVF+1WyDtDvkRSSpFRhwEAzJoVLx0+/wGV
216f1ky/vnBNHJy/A2aBhugERQadDgM=
=hC18
-----END PGP SIGNATURE-----

--S5DilZCTUEyk3TU+--


--===============5305008753606061535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5305008753606061535==--

