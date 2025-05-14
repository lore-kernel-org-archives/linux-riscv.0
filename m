Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3387CC3ABD8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWa2x3gwka2UI6FyHBOUcd7eLcOT9shz8kIlAIJDFBo=; b=OjRi4/Hjfcgcw/FSk0K6dGQyKx
	6rgXi96s60RsXc3sbJ5tE6fFcgrZXwX0pAapmDKarY7E3hxKH8HtG7QQGssXxLC/9uxiGiKYe2YVh
	VaqVYaA7yyDHLoOXHuCWX3eTYHgHtVdCnK52KNVmvjXZm9PqQZCzQdgZ5Usrs9DYX5TSusupOtr9b
	Yas3Bv41L1imHSn8p7VhoC9NKbLcyEClf0i99Nm9vwXqIiRsjpFQQSj4sb81vLGH476JFq+w188Iz
	FmaGAmIHJlPv+RnKWc+eP2ti4Sc4QhgX7Dk43GrdT2IF7bEEqmVtJZdoBHI7jQW0eEuEBCUMRgEAv
	8ke8gMLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFF1b-0000000FlDN-1saL;
	Wed, 14 May 2025 16:32:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFES9-0000000FeiK-0GLK
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 15:55:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4AC5BA4DEDE;
	Wed, 14 May 2025 15:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D39FC4CEE3;
	Wed, 14 May 2025 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238127;
	bh=+h4Sfsax8izb0iegJaiPTNkMvhFd8oYAzDM8I20tMvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDaABTOue6pdFohNIhff+Lr0CXP9ak4MbrYCB8OZpcTA8kix+7QX2TvoDCxrTuPWV
	 rAjghtbBS0mEo4Omi+5XoimHzfNdVTqzVfwUw87GJzgB6eHjFUK5/AiPvCiYTdVCMW
	 OUJkg04/yhlqobxSn8q1mwiNqkxQuw/i1J2Vg7tZEdI/VpmmO7NznfaZ5MZMbU+UVm
	 8wtmXf/nVPrQiOc1OKVl4I2uAk7tyWBPzdSDwVdG0BecDbM4+eQRUR+LkfTGTP7luo
	 luYK6GUvEHI2LXRHj5Ixw/kv6T0JDui+vf2zFbxxLPHn33FPYRf4Jz71Lh9siwazfa
	 lvSo62fW0512w==
Date: Wed, 14 May 2025 16:55:22 +0100
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: mti,gcru
Message-ID: <20250514-shaping-strive-3041294b6c70@spud>
References: <20250514-riscv-time-mmio-v4-0-cb0cf2922d66@htecgroup.com>
 <20250514-riscv-time-mmio-v4-1-cb0cf2922d66@htecgroup.com>
MIME-Version: 1.0
In-Reply-To: <20250514-riscv-time-mmio-v4-1-cb0cf2922d66@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_085529_166015_61E589BF 
X-CRM114-Status: UNSURE (   9.53  )
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
Content-Type: multipart/mixed; boundary="===============5512168983028432300=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5512168983028432300==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KqQqrX7qoMOwsoOT"
Content-Disposition: inline


--KqQqrX7qoMOwsoOT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 10:51:50AM +0200, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Add dt-bindings for the GCR.U memory mapped timer device for RISC-V
> platforms. The GCR.U memory region contains shadow copies of the RISC-V
> mtime register and the hrtime Global Configuration Register.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--KqQqrX7qoMOwsoOT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCS86gAKCRB4tDGHoIJi
0o6LAPwMzLfr21Cf+1WiqzTQZ7MXalJFDE0qM293QqB29ADuXAEA6D5GoBA8LnuD
U7YEsN4IXgIgJmmTEb4ZUxoEku2Kbw8=
=EUjp
-----END PGP SIGNATURE-----

--KqQqrX7qoMOwsoOT--


--===============5512168983028432300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5512168983028432300==--

