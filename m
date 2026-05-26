Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12B6CD5BB1
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 16:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pO/T2q0kHWcW2uFWBTAg3vWU7vh5UfNswrATyMItYHU=; b=AJPjHp94aaBs5qubmBwvUtZt8M
	n1ShbqcnFRXrw9df1F6ulowM9cwCml0DWwUFPdmkjWwzRgXhDYgPrq177yq8P5ZT9KKJgKq8HgoDP
	4QyQuQXVob8aSnjWk8qyeGbKjlMgb1dPtZwXgdfek0NItFkGTQVi6ojTfuE+HgpvOB6L8fAJkmuaF
	WUghHCUuRv0sghSmFsK6e6938MXZlyyq6Iv2C+3bmQAwmHwpFF90zOaf3cy/BtzgdJQCVdk3UWMJl
	n/0+NA93gnIwv8zqqWdI3+Q8DimDAPKrz+E4vISdZ1HMv1C+/xI7pZjnjilwSMugbgek17QLJMdA7
	YMK2ITpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuuZ-00000002Yqa-11IE;
	Tue, 26 May 2026 16:45:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuuW-00000002Yoc-0vy0
	for linux-riscv@lists.infradead.org;
	Tue, 26 May 2026 16:45:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BF8743FCD;
	Tue, 26 May 2026 16:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E8F1F000E9;
	Tue, 26 May 2026 16:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779813943;
	bh=0TiSlD6zSpfeV3oD3I7wdOC0/YkDUgYQjtSiq6gyUuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EqKpzyVG0/+cavR/7gbcF7WNiocaqgfWOsoqo2lE+o+joDCuTpLqCym2opf6hCt6w
	 43CwAWcsNxEgMVZTj3YK/aW1cZZwZPZ66j5oG90z18L2K5xxIGrZfTXv52ChSvIJi6
	 GOWgTZ5P3Px+N70HXAGf5AIuOyRtFar75p41ETuXBgRrD8XuYzSCbWxzinvVdSZ2Wz
	 wy48YMXAXwPiXmeiZZHkEmlinmiROhyKVRs0Se3v/TszLQBZu+Rem5H9f7E9bJJH2q
	 2WQ48HpoN+3wcae1oYqXQHJMZhQuucEdjRT8aEyQgLwixvIxcR7+Z3Ksn1lRc8BP14
	 vjSWUplUBQyoQ==
Date: Tue, 26 May 2026 17:45:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Yao Zi <me@ziyao.cc>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] riscv: add Siflower RISC-V SoC family Kconfig
 support
Message-ID: <20260526-purgatory-undermine-a0093dcb9ba0@spud>
References: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
 <20260524-sf21-topcrm-v2-1-4527aae05c3d@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260524-sf21-topcrm-v2-1-4527aae05c3d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_094544_284851_0CD9C0A4 
X-CRM114-Status: UNSURE (   9.41  )
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
Content-Type: multipart/mixed; boundary="===============3476326265645615814=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3476326265645615814==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CgUzGrIEUFwNdM0d"
Content-Disposition: inline


--CgUzGrIEUFwNdM0d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2026 at 09:13:06PM +0800, Chuanhong Guo wrote:
> Siflower RISC-V SoCs, including SF21A6826 and SF21H8898, are RISC-V
> chips with T-Head C908 cores for home routers and gateways. Add a
> Kconfig entry named ARCH_SIFLOWER for them.
> Notably these chips uses ARM PL011 for UART. ARM_AMBA is selected
> for its driver.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--CgUzGrIEUFwNdM0d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahXOMgAKCRB4tDGHoIJi
0qVBAPdEdK65amzTKFcfhW5d75WKcdXJJSZCDpvq7/T+f3W0AQDH9DEbIor1nqRS
NW1zdvjzsV8PuCHA54tmhXrC2kOkCQ==
=zS7G
-----END PGP SIGNATURE-----

--CgUzGrIEUFwNdM0d--


--===============3476326265645615814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3476326265645615814==--

