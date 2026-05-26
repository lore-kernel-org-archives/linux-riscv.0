Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA096CD5BC8
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 16:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkKAbPpTzMxVM0yezERKHpPhZ93Yi1623aEtJesESJw=; b=UqP9rZ+evoyjeBj4xBIe9h/gC2
	r2URTvAnNRtoVhYt30BaYU/Wzpr5byz3PkUuvJOejIRCR9gLxsueXIc/OgmW0Imd6Aq4jRIy8UHKn
	7D91r7hQ8Y9mzZaQ05XfSdo+1pNkS5bHQUk5Os1HtCnfaivrhmSdnTuK0xtxzxmtN6qqarYlAlKFv
	GFDvtIfqpNPHBAvpUx9qBkozyMbpbtSOvhYvmHWEAGSJJX4LIzNKWT4QDC/rgt6Hv2Ce4qzYIubS4
	enzneEiX80P4Doqm6em2Juy3IpjOmWyMaie7nGMBDsId5vhJxCy5R9Tl+aBLBh+wknc5IPrOIVEZy
	OOu/7BYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuuB-00000002Ygq-0TyD;
	Tue, 26 May 2026 16:45:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuu9-00000002YgK-2WRy
	for linux-riscv@lists.infradead.org;
	Tue, 26 May 2026 16:45:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FDD960018;
	Tue, 26 May 2026 16:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771461F000E9;
	Tue, 26 May 2026 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779813920;
	bh=4YuWWIChWk0yUgGUXU1F+I0lhuLlhRPeMLXGEXAPs28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kU9oDuNcoTuvDqZ9Wz0Ekupccbo+RQmdoM8U0EVV8yQjju8SNIxYlqY026mKu2E7y
	 WY0IS7ZDgmHo13iaRn6a2dhZf+5xwoBTE+nqyM5eW5OzpQzJ2Mp5ZJQZj+ofSvtA7u
	 63/TZhl7XbX8LHL/4ZvGbr/2UJxrpXooPOTzhOk6lbm6F7HEwjWg63RVecI/AJW2rX
	 vKZl35OosHQmjgophyUgD1h8YMf+JNh0BDvhu5nhs/zu8xOL2EDuGt+grOHwm5DwE4
	 OFoz2gAyh6AJSn4LOqsWBC4hveIZoPAKlLNHpoMFspXP+NIO41/a8918N74cQcj2rT
	 Y4CU7rU/zPaeg==
Date: Tue, 26 May 2026 17:45:15 +0100
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
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: add header/doc for Siflower
 sf21-topcrm
Message-ID: <20260526-outbreak-triceps-48ac74ceea05@spud>
References: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
 <20260524-sf21-topcrm-v2-2-4527aae05c3d@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260524-sf21-topcrm-v2-2-4527aae05c3d@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0295800724461608192=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0295800724461608192==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FzGP7dsmN1NUJIaP"
Content-Disposition: inline


--FzGP7dsmN1NUJIaP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2026 at 09:13:07PM +0800, Chuanhong Guo wrote:
> Add the device tree binding header and binding doc for
> Siflower SF21A6826/SF21H8898 toplevel clock and reset module.
>=20
> CLK_ETH_REF_P is a clock name that exists in the vendor datasheet.
> This clock connects directly to CLK_PCIEPLL_FOUT2 and there's no
> clock gate/mux in between. An alias is created for this clock
> to make available clock names align with the datasheet.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--FzGP7dsmN1NUJIaP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahXOGwAKCRB4tDGHoIJi
0sPuAQCmij/iq15WxKbT7Sk29Pt6Mx4jeETaq//KaAOiasXL5QEAiTcmMKmssmw2
6N4ZR50/hHMSMwZfyHd4FvdXI+pa4QY=
=TsNU
-----END PGP SIGNATURE-----

--FzGP7dsmN1NUJIaP--


--===============0295800724461608192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0295800724461608192==--

