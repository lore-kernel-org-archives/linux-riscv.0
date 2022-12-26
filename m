Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0343DC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Dec 2022 23:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cq7Mcc2FOTnumRQJgnm6Bf/anDPKBZofcDsDng/0+5Y=; b=yJ8/2XafbOMTa+jXqwz1Nf+gdn
	0DkHEN9jP+cMjzMZWGuo7nHMscIC313jzXnQgJYaSGhUQUsE+Q+HsJibIfj2YV+8dr1yIVgklPHTJ
	D+pJV+irrkq0kCgAcXqRoPBPHoEfKol/DqWFJWaxaCD0anSTEAbW7ubWPBwlItbgzHwz/PYhj5x5V
	0GySz8wh4soQgv4U5EHB9RDBZzXlrTbLonuYhVnXs6VYNXgOhId+N+FSIXWVya1YYVanzoY1t5t6D
	/h4709VfDX+9XPjhA0nDB5JB6Iw5+mi4TvhBm3lALPCp/UvPe47PDmEEopRY3GVrBJaBFLruVdZd+
	nrH0s86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9wTr-0086Yu-Br; Mon, 26 Dec 2022 23:02:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9wTo-0086XX-C7
	for linux-riscv@lists.infradead.org; Mon, 26 Dec 2022 23:02:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C43D1B80DC2;
	Mon, 26 Dec 2022 23:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF9CC433F0;
	Mon, 26 Dec 2022 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672095717;
	bh=SX0BmzYTkCHs1PHSbj2Sqc0jerZcZXqTrHn2k8779eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwGcph3jDWpdUjn8PKQaR9ejzHI5fqrV9b9P06X97nG5sMCTGDO9HQEg4Pr2/eI/o
	 26/EW4ZJtG/QB2pl8o7gVPQlUMO4rlXHGuWslxcfAjdDTwnowdgwEh2YLgjJhz+j9W
	 rS2UUxD1E2L4jO0YsAF7YCBGUvCBJNAVcNc7CicZ79UdXix73w1xxENYjX06V5aflU
	 OreCAkz3XI3DbWaFkU72O8EXH/OqtM7aSMxClJqxr+OIl01r4PXSJxpCesBTKPixtt
	 M+CLKKuDRxlnj3AJc9/fJP31FSrDJpk5Ox0gYpzJ3QEsJv+lHzr6r1qKjy0aG2LqxT
	 eMcMcjS8+O7QQ==
Date: Mon, 26 Dec 2022 23:01:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] Basic device tree support for StarFive JH7110
 RISC-V SoC
Message-ID: <Y6on34WC2u3PSBHl@spud>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20221220011247.35560-1-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_150200_578049_1A976712 
X-CRM114-Status: GOOD (  14.36  )
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
Content-Type: multipart/mixed; boundary="===============5619056363200789951=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5619056363200789951==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f/iFEOT8SIj34xAh"
Content-Disposition: inline


--f/iFEOT8SIj34xAh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 20, 2022 at 09:12:40AM +0800, Hal Feng wrote:
> This patch series adds basic device tree support for StarFive JH7110 SoC.
> This patch series depends on series [1] and [2]. You can simply get or
> review the patches at the link [3].
> Emil Renner Berthing (7):
>   dt-bindings: riscv: Add StarFive JH7110 SoC and VisionFive 2 board

I've applied this one to riscv-dt-for-next
https://git.kernel.org/conor/c/97b7ed072784

>   dt-bindings: timer: Add StarFive JH7110 clint
>   dt-bindings: interrupt-controller: Add StarFive JH7110 plic

>   dt-bindings: sifive,ccache0: Support StarFive JH7110 SoC
>   soc: sifive: ccache: Add StarFive JH7110 support

And these two to riscv-soc-for-next
https://git.kernel.org/conor/c/1caf002efa22
https://git.kernel.org/conor/c/6635e91648ce

>   riscv: dts: starfive: Add initial StarFive JH7110 device tree
>   riscv: dts: starfive: Add StarFive JH7110 VisionFive 2 board device
>     tree

The rest I can take with maintainer Acks alongside the DT, or they can
go via subsystem trees.
The DT is waiting for the clock/reset & pinctrl binding headers anyway,
so IDC which it is.

Thanks,
Conor.


--f/iFEOT8SIj34xAh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6on3wAKCRB4tDGHoIJi
0tjwAP9w54bxRzyxyIptYDA+Fq7fMvb7SJHNF9qgWs6aGwBT1gD+OOPrBoNFXa9g
/EJQoDkPAke1E2T/1IuPwS5c7HAnUgU=
=r4lC
-----END PGP SIGNATURE-----

--f/iFEOT8SIj34xAh--


--===============5619056363200789951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5619056363200789951==--

