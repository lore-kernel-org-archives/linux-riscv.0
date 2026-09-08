Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F059C79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 17:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0twDjI523KUqL+VcOZY2N4Itu/MSkMy1iiMRuTElEc=; b=kHECHv/KJAo5BtyAXImaaCxmeT
	ZCDqIRynn9AFW3C3VKb3u7oCuhecsOh84VfmZhpu1hzru66B5rvNqhdfecsuEGDQoyoZDTU91/Bat
	Gz5f+wMoyVMQEyg5Wt+5+n2GMIHFmaEHapXE261XjO9zv7f/XBrXfLzE61fmszCR53KvR9wFEkjbq
	iKYD6vV24jarRUoFSR4rb9GrcXZPiT/G+kIF29m9uEoZ5ul+keI9HKzQhB7Wh2CrT/xJwCkscxg0G
	j116YplpMsM8D6NLn6f0mZKN7A4QhhGfflsjsuPrjaCCKgid2KD94BWtd6JVk8IayAOZvnV6hQbn8
	N0GNZ1Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zlp-00000009qoc-2Sz7;
	Tue, 08 Sep 2026 17:38:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zlo-00000009qnw-09By
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 17:38:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ABE7A601F6;
	Tue,  8 Sep 2026 17:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957711F00A3A;
	Tue,  8 Sep 2026 17:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889085;
	bh=5OSF8OpLe53rcAeoaJaYe4ad8o0J6Caass++HtpXOLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jtIE0sTT1coPloJ9LxLMWL5CN1lftZc5h6nVlPSm9xffJJERWVqa/7K99o/QtaGS9
	 YOiatZfAw8B6zogweOsq+QvP4q/jteblf00Rglc+5nsUUl4Ybm2h0V5TedWR3GGNHh
	 IeCWvjw3MftJUr6BFs37FDjFln2XjSdTKPB1u4risrgND8q4oOS/ZXBzoavdd1P+QE
	 OnJAe4q09IXq3Z2RgmUwYTuTSLe85T7qUsmU6CvpZjt9I65CiToobxxaHURDS+y7HV
	 d2GJ1LqsMRkt9Gb1Bne2C50qt4za8mDD2ztp605s0xxml8UE0uF3J2h7w5ahjoUoI+
	 DdoAgR/ibFXyw==
Date: Tue, 8 Sep 2026 18:37:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: interrupt-controller:
 thead,c900-aclint-mswi: Add SpacemiT K3
Message-ID: <20260908-pacifist-fasting-441391d1da02@spud>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
 <20260909-k3-aclint-v2-2-7931e5bc86ad@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20260909-k3-aclint-v2-2-7931e5bc86ad@pigmoral.tech>
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
Content-Type: multipart/mixed; boundary="===============3017634097298470769=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3017634097298470769==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+IC9M6TKls+gJoKb"
Content-Disposition: inline

--+IC9M6TKls+gJoKb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--+IC9M6TKls+gJoKb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBH9wAKCRB4tDGHoIJi
0scKAQCeP6smL6SZJH1DKuxzB28cxYUgVBWkZAmP+aL9ZQXLFAEA77aaIRW1pK/K
1fN4Xt2mAIYBanL/UtvGXOVyIxwqtA8=
=UyDT
-----END PGP SIGNATURE-----

--+IC9M6TKls+gJoKb--


--===============3017634097298470769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3017634097298470769==--

