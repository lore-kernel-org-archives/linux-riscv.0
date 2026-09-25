Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA22CC9830D
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzavAjmCkvuQ0CkNDlYUi8B0MeDoPjoHlloP9j4ZNko=; b=Vit769fU77CEOL9YLGV9M3HbHU
	aYCt2KwKfd2zZRTc4ALje5MMU4DBwd16c563ADDQ9eI4bs+pFZxwh22Bkk1oAfmCt68eO7YiyzqyG
	5w2kB4v127Yagt9MLqLgFuT1L4WfReT2pGYnU16Q9jhaFfmcvE17UV8ryabk2Fi+8p+FeDZm/2+j5
	W3XiMAgHmqomDUnVZAHsLWA7bfS0VixoGvu21Yx0xJiFwANHagwZtgxjSfGv7yPiadorTszhZsF0/
	OVXi4DoXN/WjBbbqFnMBnY2BdtlqredT/HSTWHoHZl15BodsX4Az+P30bWWNTIhs9rkbwvWkBeFQu
	tojla/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA798-0000000DcxT-1yDM;
	Fri, 25 Sep 2026 14:43:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA797-0000000DcxM-2s00
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 14:43:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 14F3D40645;
	Fri, 25 Sep 2026 14:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F2B1F000FF;
	Fri, 25 Sep 2026 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790347409;
	bh=KofIWNtmb1qqto6MD7r3iF7UB8pI1v98Fhmikrkkvg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O/U0ajwLlpZ/h1E1akRYotuBuQaJkoDl0ELsOkYJCq5emoBn+vIEY7I6WD6BT7NVV
	 sUgL3HcblTcP8ht/VRQCE7MFxy7V3MBGqyF2L9XCDxkqUt46gD7hAeuBvq943pVNIq
	 10Wxt5CXV3cnf3tsS4gm0lACbps7dtVJiB20W/7zGhFFpsqiD0IKVYuAZGHCzv2dgP
	 9Q2cmtjfjdCFgl/es6OG0uB6KDjYRGJsZFKMmBU9hyfvLhejkR1Wg/SsjtSFuIiB7n
	 ACaEvwMsItmrNgqgCHDZQNXVQzMW+/0fhs8zJjnajV0KFYYkyLUoOvmhXzB9B8HaMN
	 yq2+Hrgr9O5Sg==
Date: Fri, 25 Sep 2026 15:43:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v3 4/5] riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57
Message-ID: <20260925-stuffing-lunar-5a44380ebaf1@spud>
References: <20260909150158.9313-1-jszhang@kernel.org>
 <20260909150158.9313-5-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260909150158.9313-5-jszhang@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============1181495852015477672=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1181495852015477672==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CtrRTUfPvVMhZ05e"
Content-Disposition: inline

--CtrRTUfPvVMhZ05e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--CtrRTUfPvVMhZ05e
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaraIjAAKCRB4tDGHoIJi
0kZXAQCdCUMwLH3cbqAlvwFTrxqdTCWLDqfHAlQdXZaU/uiqlwEAle9ieF89bnnI
R4C1qhlh+i9RWd5TzD2+WmJQ99vfngs=
=uahc
-----END PGP SIGNATURE-----

--CtrRTUfPvVMhZ05e--


--===============1181495852015477672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1181495852015477672==--

