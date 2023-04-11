Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB80C76196
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 21:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xPRhXGIy6yIEFSO5gpfzV//7umRleEEkEgoCBmqFRA=; b=idfNbPCj8PIujPTYKa7vgVOt1Z
	RJ0Z3lDlhPCVnDUNDHGBGNVlu6Jc8CjGtGpIdsZgXhlUXKq+BdGKxVEnbQ7R+njB1eak3N6pRIf+t
	HBob+2N9jh5os2mpPLGL3tgxpxz2eRGxHwO32A3JQgfGuG++XgaYmhFYte9jH6Rw2GoUaN/NBk/W+
	TNBBI8mrb7E5cu3/zJOxANenP5NzidTQ68VLvYNVXgd2zUEMbiO7euMDFkL5kfDPrKqzedKtp1XKe
	9p9muKkzHOgg4rv2Wyv0igNNLl4BRcQPI/SMKYBIP8rGN+cEMl47SbQ3Aj6Brs26dI3TFtb45XHjg
	rXkeGmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmLdz-001Cav-0J;
	Tue, 11 Apr 2023 21:35:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmLdw-001CZu-0C
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 21:35:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EF2E60F4D;
	Tue, 11 Apr 2023 21:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADD6C433D2;
	Tue, 11 Apr 2023 21:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681248911;
	bh=EdaTBmGx5ipL6ZGZ09wYqo4JAou9hrLMcyRMGOrp9DQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhUFqokuwM/PyAhB7StoT6t2VzBtM7UGp+T7j4inc9RuXXVwW/5E2V+fqSftbitNw
	 E3thFeDNKDeNS20UZTghwRH+tmRCrWsH8X1f9kOn1+uGEXTFXfOwaMQX25IqoHHFhS
	 vf/pxUp8kjgqzQUYbyDfuhXWTz7Hvv1euQ7mp1HFYs8/ui43r/IiG8pjy3pYhJgP34
	 wLgmuk1aJ09RsqsSwQhaaQJYnmCpPLdjyli+UZkiJg3VffSny90DRwnkJuS8FJo/wM
	 UQq/lWZnxtz9xnoEmEZ27TbK/ghWyFzvYDUVqjZgYSeg2smR3zOkFDJyZp2R+p1swE
	 lR0OvIJSlBIRg==
Date: Tue, 11 Apr 2023 22:35:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/22] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Message-ID: <20230411-gleaming-parasail-34e2b7c3de2e@spud>
References: <20230401111934.130844-1-hal.feng@starfivetech.com>
 <20230405-wharf-rejoin-5222e5958611@spud>
 <ce311dcf-67a5-bf15-d0da-88967baf4ee9@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <ce311dcf-67a5-bf15-d0da-88967baf4ee9@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_143512_139150_693ED138 
X-CRM114-Status: GOOD (  13.68  )
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
Content-Type: multipart/mixed; boundary="===============1612043276504297171=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1612043276504297171==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YCHkUOSmswIkgJOR"
Content-Disposition: inline


--YCHkUOSmswIkgJOR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2023 at 03:03:14PM +0800, Hal Feng wrote:
> On Wed,  5 Apr 2023 22:30:45 +0100, Conor Dooley wrote:

> > Hal, can you get your folks to resend whatever dts bits that are now
> > applicable? IOW, the dt-bindings for the entries are in a for-next
> > branch for some subsystem.
>=20
> Of course. As far as I know, these nodes include trng / pmu / mmc / qspi.

Just FYI, you can get the lads to resend them whenever, but it's too
late for v6.4 now.

Cheers,
Conor.


--YCHkUOSmswIkgJOR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDXSiAAKCRB4tDGHoIJi
0n8bAP46Wjui6uRCpo1EmY/80+MrDWfxuiE6As1sjptafoKLNQEAltQ+fCrJjdwm
DA8tnYqSuOh1dsY1ECOqI2M2mTb6EwU=
=8yVv
-----END PGP SIGNATURE-----

--YCHkUOSmswIkgJOR--


--===============1612043276504297171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1612043276504297171==--

