Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEC1C7EE43
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 21:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIA5uuKBMSBDZQTZc6gj5aqpagxjVvFVdV3md2eBdtk=; b=npLRNN6dSCC+15QDXEWuJbcp8M
	j38vcuqifm4IpX1faO+4PftT8fcU1Bm5Dsb0mqRkYEods8cuwwiLBWoQpWzZqYiVfL892/gYpufE6
	9pXo7HHUfnlvOKT95/FouVV1lPHdo23jw7sig17b/NJHSJyfrxLhiXtgl34KhSNDwGS9zHF//91H+
	Ae6B3PoR9oCntB3mKu5PIeHvp5DrMsaSUAd+cy/GG93LFr0nSZl90srdsSKKMi5N92AWp7XMWvYn9
	GNuVNICKLLKFTxswUibuJsGBMhRfzTSJAf2+raqdHlWmrOJfDc+BOAGAtZU7iLGsHFS7kdT1Klhl/
	SolgOJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8pAW-005Wi5-17;
	Mon, 12 Jun 2023 21:33:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8pAU-005Whe-21
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 21:33:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A68261195;
	Mon, 12 Jun 2023 21:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DCAC433D2;
	Mon, 12 Jun 2023 21:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686605621;
	bh=+NGj3t4VzypRbCTZ4iQmjS2Wvh7LDX62WxdzAqXEl2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q5JkrBvOarwkALXD1ohc8mZUcdoQZzN7DpLN0TmW/QPV2mPEOOsbrllkXKW09Jbkc
	 NlB1+1ias5qQMHDF7KBaqX927lFXgsAULia9q2EkzVttgQGGnURfolHOMvD64TP6o2
	 lnSfiVQGatXdllWyXFiviJiDnjReBZ+BUEeSPUoaTtipaiNLohP7MRpM9KmL3VBxBB
	 tkZUTC10ByXcFw6im2WWNj7boDLwPKysA9n/IDv77Qa1asRXu865xLQIEt1SdvIGgZ
	 0VHM8w4yo5vUJObpyzcw8IxBqSoNdlDvj1WXiijWuE0LEjili5XzymPxdSzJv5lPD2
	 6GKQtQY+JAyUg==
Date: Mon, 12 Jun 2023 22:33:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v5 2/4] RISC-V: add Zbkb extension detection
Message-ID: <20230612-jumble-worshiper-2fef89b4f3d4@spud>
References: <20230612210442.1805962-1-heiko.stuebner@vrull.eu>
 <20230612210442.1805962-3-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
In-Reply-To: <20230612210442.1805962-3-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_143342_704907_055F68CD 
X-CRM114-Status: UNSURE (   6.77  )
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
Content-Type: multipart/mixed; boundary="===============2079579794766360986=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2079579794766360986==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RLdwK+thYKDT3g9A"
Content-Disposition: inline


--RLdwK+thYKDT3g9A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--RLdwK+thYKDT3g9A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIePMAAKCRB4tDGHoIJi
0s/ZAP9x5oSQ4Z7tadV7lwFQu4Jn14M18EW4rX+tma7eOEHEOQD9EQAXfJzfDILv
phOrPTLfu6crlwn/gZU3AxGnemFUkA8=
=ss8H
-----END PGP SIGNATURE-----

--RLdwK+thYKDT3g9A--


--===============2079579794766360986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2079579794766360986==--

