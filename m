Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3F5CD3442
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 17:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/G4ZtPBYcwq8DHjTiun/EoTw567YmZyJgQ9ltU9AnY=; b=PTcAEOSEEIti8gHpwhqWB0HICO
	AWz8njOa8JjA7oe+eTL3LFoB8cBtBRKvuVGfHfjlAskzCSpCUuOZpONbfWHCPVJrOsj6VLtljD5as
	PQ8Ifx8Ef29r19JT3WC+Meu85WLdZ7Xen5847SD5ZyrnIF5b9ZfY/GClZRYN04XPBbfrDm/XRN6cW
	ji+C8XRRTs0m2CSuEnvKcWahuo8h3+fCjtatLrTa5Ac8j19zRQuHVxHtVaZ3Gzg/NcX0LI4Z/N7V2
	h0mPd98sRLzUC9O7xyksh0Cnl6gP3XFpr58ROOPsk6H8EYhtZ8x1rBGrYY8CseGnNENXUaIJtSVZN
	z9XeOLGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2Uz-00000004UNO-3m7J;
	Thu, 07 May 2026 17:26:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2Ux-00000004UM9-09Ba;
	Thu, 07 May 2026 17:26:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CBF860181;
	Thu,  7 May 2026 17:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED508C2BCB2;
	Thu,  7 May 2026 17:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778174813;
	bh=er7IZqsDXotzcGfPcmmIPyaQW0ADB5ziNRRJ1mEtFyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iaOiXUwh/uomCsNrabYzY/9Tq0byHXu9pF8ugjLJqHjNOF+I+niGuRNL7oMtl+H+X
	 PJhklC0fAa8htxNJqPoqHxGT2R58vgMl6ftLCxMhNG822Cpv8ZEQ2OW9pc/FmWMUvZ
	 DYoS+Ags6/GkuS4PvCkr013ZrrLl7PGmzLRySdK1mSDosNqHOK58WFR+NPNuIoKk4y
	 PQRFS3tJT5QaKXyMuU1zhtSwiMmWBqelQOw29EydqHxSxD5j3KAipWCNausWbTLDbX
	 iE+GTSdx3gPqw+BiEklEumN9kg3SjBGEYarC04LPAW2e5GSWvp4bje6GOQcz1Uy5SJ
	 Mw/RX0jVz5GrA==
Date: Thu, 7 May 2026 18:26:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH 01/12] dt-bindings: clock: thead: add TH1520 MISC subsys
 clock controller
Message-ID: <20260507-conjoined-ripeness-6d612060a74a@spud>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-2-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260507081710.4090814-2-zhengxingda@iscas.ac.cn>
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
Cc: Drew Fustini <fustini@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yao Zi <ziyao@disroot.org>, linux-gpio@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============9182012481874623999=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9182012481874623999==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HWSihzaVh/hoYZ1P"
Content-Disposition: inline


--HWSihzaVh/hoYZ1P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 04:16:59PM +0800, Icenowy Zheng wrote:
> TH1520 has a subsystem clock controller called MISC_SUBSYS in its
> manual, mainly controlling clocks for USB and MMC/SD in non-TEE
> environment.
>=20
> Add device tree binding for it.
>=20
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--HWSihzaVh/hoYZ1P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzLVgAKCRB4tDGHoIJi
0vQOAQCs40DUjyqB6qe07Jwhs9TJUGp6ouBgTU9mEJbvp7W2gwD+NqsikfW+txt4
ZCBAgwG2gnWsVXZAJsmrxWYgEXgJgwM=
=Harj
-----END PGP SIGNATURE-----

--HWSihzaVh/hoYZ1P--


--===============9182012481874623999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9182012481874623999==--

