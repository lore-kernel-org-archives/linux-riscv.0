Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5167FC6379F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 22:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKxmX2NTMsGx3Pgu/PF5B6vMdr1V88cyeASqowwSvsc=; b=kdXl5GwcAu2oTnZphOOoZdBkP6
	k0pGNvJ8d68ed/tJLcClcB6/oYycWM2WuH5Y8mBmlzeIlPrulAT10SqDVzl3c2C2tgamn5S1qc76e
	2TfAiRxMXtX+a3Rp3jp0xtja8JPYW6THA0eWs1wMmiGvdD7X6YphnwvVXCNhe6Olo054E/L0+2iQf
	d1nqFIs2PPOOibcvBPO5+SSAtiai9sFSdWhId0vLowFmmhPwgOugLaLwm4KzoTipFfckazU1AHh6e
	WrGOpjx76T4aIS7N8SkQ7lx0zUMSoWYZg1W5YLue7OgPMqMSdMbTIl2gHoiDwVZmLsTDiDIgo3p4J
	NqIilbSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGScK-004kIr-T2; Fri, 13 Jan 2023 22:33:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGScI-004kIE-7U
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 22:33:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9175DB82263;
	Fri, 13 Jan 2023 22:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F46EC433D2;
	Fri, 13 Jan 2023 22:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673649219;
	bh=7RtzrSZmvbyKCGcxh5hCfSnZM5w+OhQN1AtIETLROfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozRXjuKWQQ+H3tRyn6S4ny/T/WeDnDMK54Aeu/LdYtJcXxWmSYR/bfjXGvYU+/nB5
	 U2yXieO4K8yFeLynebKG/L/x3y6EAcsO1Ki9duvovi5eD9P1nnoFpvFFkl1ZCDEz/O
	 HYyC/dJHBr1dwE2D06ZSWKByT8SdbXeMk3wxDn9xXjkJGDXw9/MizRx4qTLnbBqxy6
	 6gOitRPuXgIhtQB9DBym5eEVSupsc02HJLHotA6YfkJ4RgqiHAS+xH0yS2YFhs114d
	 DmufsovfRqeksupElEA9hgTaFeoc7P2993n1HKvQEA4e6CBTsq74W6ec0/Y1IYJDar
	 843+wg0TF6Ogw==
Date: Fri, 13 Jan 2023 22:33:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v5 2/2] RISC-V: add zbb support to string functions
Message-ID: <Y8HcPs9muzVf3fuD@spud>
References: <20230113212301.3534711-1-heiko@sntech.de>
 <20230113212301.3534711-3-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20230113212301.3534711-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_143342_438290_81C494BA 
X-CRM114-Status: GOOD (  16.30  )
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
Content-Type: multipart/mixed; boundary="===============8337673003123935052=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8337673003123935052==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oAes1mcfZBuzDH0y"
Content-Disposition: inline


--oAes1mcfZBuzDH0y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2023 at 10:23:01PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> Add handling for ZBB extension and add support for using it as a
> variant for optimized string functions.
>=20
> Support for the Zbb-str-variants is limited to the GNU-assembler
> for now, as LLVM has not yet acquired the functionality to
> selectively change the arch option in assembler code.
> This is still under review at
>     https://reviews.llvm.org/D123515
>=20
> Co-developed-by: Christoph Muellner <christoph.muellner@vrull.eu>
> Signed-off-by: Christoph Muellner <christoph.muellner@vrull.eu>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

Had a look through, again mostly examining b4 diff...
The changes look to match the suggestions on v4, but I was happy with
the un-optimised version so I have no taste.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--oAes1mcfZBuzDH0y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8HcPgAKCRB4tDGHoIJi
0vXlAQCInnvx8xSLiMpu+A8MSwY+Ygm5y8R5ihxDweKtkrqtyAEApuVkebxGS4E3
bkxSF1o3Fj8oxxFNR6LqJKnP7b1c4gg=
=aJa5
-----END PGP SIGNATURE-----

--oAes1mcfZBuzDH0y--


--===============8337673003123935052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8337673003123935052==--

