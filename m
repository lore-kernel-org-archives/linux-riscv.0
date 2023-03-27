Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EF2C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 22:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaZO1BFyRplFGH/NSMLcFupAopE1Nkp1X1oNH3WoA7g=; b=kgwOJtmqoANS6ljrxeMWAQeDTx
	Bkn7xMoPqVXOaZnPMCy1HG3eU6NC/QhlP9KOq5NPvutuKKJsO6h442yNHmNjDjEeIJyI+Isep7Atr
	sLNUV+ksHYyJrTG1b9HfvPOwD29QXjnEkmVRqZQ1xlf2TDlTp8XuX+p+Lk30sIrUnkROfySis/lHQ
	+Ocwe/m1PRsa8KSLAQIgdRuXKhUuj7IQtvbg+ohZMqZcrzzmUZEuiEm54xq4ydWiKwPZKWfcENxr6
	RfV83R2XSVfLftw7cxrAtqXl4CR+Y6qBy7SLb5Gjc+JHlkQvA9cLDs+Em43xZz2eTYc6ZjBta4q03
	ygdjjj5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgvfY-00CbV6-0w;
	Mon, 27 Mar 2023 22:50:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgvfV-00CbUa-1R
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 22:50:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 97DC261375;
	Mon, 27 Mar 2023 22:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D19C433D2;
	Mon, 27 Mar 2023 22:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679957424;
	bh=G4vSpWRXFWHWcZZEwCKRH35BlIP0Tx29Xiu9ic3cC+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RMmsuv/6IS08xb8zGe9H3FWIyEKz6OniqOjQXIT87SwSRPVrWdIwk/Kheo3XNHSwG
	 QkgPaD37hY4OZUmZ3eEXXnWVDMvs/ZP2cUQReHavAZqtSG88rKAlJiO0s5VqmgmgpA
	 cnjT6i18JHQ2Ks4w3I1R5D3jsgE1oNX9YfR2Mvp2K2ClJRdUpRz9uuxZReXhoTXBZ4
	 b+Ph66gsdGpGBnxY3P1nRhd7BrY7C9utjzOKb74fYPaC2rfVEErWeSV0arGw7582ko
	 L52jSXanh62mr+eUSOuEj+mkf/4G+LbcUWGfX0l3Nh6kB0UZnwecOpRkk8i+l11NPz
	 HDPzGsKeVgUeg==
Date: Mon, 27 Mar 2023 23:50:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
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
Subject: Re: [PATCH v6 00/21] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Message-ID: <29ba8a8d-940d-4b49-bd86-5cd5df002c23@spud>
References: <20230320103750.60295-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230320103750.60295-1-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_155025_522717_9FB18915 
X-CRM114-Status: GOOD (  13.09  )
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
Content-Type: multipart/mixed; boundary="===============8094683146870799639=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8094683146870799639==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EvmgkiZ1lEXclYTa"
Content-Disposition: inline


--EvmgkiZ1lEXclYTa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Hal,

On Mon, Mar 20, 2023 at 06:37:29PM +0800, Hal Feng wrote:
> This patch series adds basic clock, reset & DT support for StarFive
> JH7110 SoC.

Probably obvious at this point given the number of outstanding comments
on this version, but I'm gonna mark this series as "Changes Requested"
on the RISC-V patchwork. I'm not sure what Stephen's cutoff for stuff is,
but I'd like to have stuff ready to go to Arnd for -rc6, so you still
have some time for another revision I think :)

Cheers,
Conor.

--EvmgkiZ1lEXclYTa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCIdqQAKCRB4tDGHoIJi
0vYmAP4tJIxpbqPo89Mr6eQyscwzz5HyB5of8DCc+nuX/2v38gD/dP3dUrOdOFC5
HnIQm3HIRolqC9lBVMIu9urkf6xrGwA=
=cdfk
-----END PGP SIGNATURE-----

--EvmgkiZ1lEXclYTa--


--===============8094683146870799639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8094683146870799639==--

