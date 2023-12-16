Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED9CC46CA2
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 12:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgt4GM0MdviB/aQ632gH+FuN63T1yKPPkFoA2n/0FfQ=; b=2ZMmfjhj3TwBtDhDeqCEmT4rHF
	hJ20mMNJ8AOoREcR5M9JUXxmnFTP3U86VYc8lEIru4sFIKoZVFCBA8iZfa9u8EMXRfFzCnJ2qwkHj
	coS0kE85hObdP5H8kVHP4R4oJmRgt7FFD5cEmBYHmzZaJotsR4LTwt8mrdZ/fWrjn9Wgm3GKvqu5H
	xq7QBwkT0zi0xem+F9LkgeX0fZdmxqpV7kAqr3O3YSqEZC80WbBHSr8VttOQTEdpEf6uo4U1jO5vU
	sNeEQWrers1FB+Rhzip3EdD0UUG6e3vYd1ml7x8Bl4sLG0h+HHwuMAYxKfF9jq4oH7qvfqoQEEZ0K
	8wNcWx7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rETRP-00615T-1p;
	Sat, 16 Dec 2023 12:06:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rETRM-00614n-2r
	for linux-riscv@lists.infradead.org;
	Sat, 16 Dec 2023 12:06:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 08C60CE090C;
	Sat, 16 Dec 2023 12:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D13EC433C8;
	Sat, 16 Dec 2023 12:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702728402;
	bh=ymcicKWMiCxCMT8U9JeNofoguzL2CsM6z3lDqO7opc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NEoXliKlLKZM+VPPvJGFQ0cDl/+XWHpmp3v9vaTCZtHZ5MSA8XD70wSnh0d1d+ce0
	 cl+7suhC3o+jVhNEJmJnY1KnKTHwT/LCzM0MQIrkq5/OBK1SFxVwHyXKzsQVnN2MSf
	 /QWKdDyzCnvbwg29G83bCUleui3Z9GriILDkA8e+82yIENzPap5UU9PXnkqtsY5/cD
	 vhu5FFDdLoQNbmIwenotNbd9HmU/523SXXir3f+R9wZaLHO9T2WhdoooZglPZF8DoJ
	 LVSIvZIzL+6I+HzaLBM6yKZcRoxVsklWtAyXERd+TtgBMK3uqjFotH0qJZLeCBsigg
	 wzRplkWCImdpQ==
Date: Sat, 16 Dec 2023 12:06:35 +0000
From: Conor Dooley <conor@kernel.org>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	"kernel@esmil.dk" <kernel@esmil.dk>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"krzk@kernel.org" <krzk@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"anup@brainfault.org" <anup@brainfault.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	"jirislaby@kernel.org" <jirislaby@kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	"drew@beagleboard.org" <drew@beagleboard.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: riscv: Add StarFive JH8100 SoC
Message-ID: <20231216-unknown-shakiness-8c4a5cd53006@spud>
References: <20231214-platonic-unhearing-27e2ec3d8f75@spud>
 <mhng-fb85106d-c0bf-4f6f-8351-10d4a4da6eb6@palmer-ri-x1c9>
 <ab8bb47cbcca40649ff1e115ed34d3c1@EXMBX066.cuchost.com>
MIME-Version: 1.0
In-Reply-To: <ab8bb47cbcca40649ff1e115ed34d3c1@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_040645_104650_D3EC89C6 
X-CRM114-Status: UNSURE (   8.93  )
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
Content-Type: multipart/mixed; boundary="===============5847767559369353007=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5847767559369353007==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xnZVKVuLE9iuntqZ"
Content-Disposition: inline


--xnZVKVuLE9iuntqZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 15, 2023 at 01:49:02AM +0000, JeeHeng Sia wrote:
> Thank you everyone. I think I get your point. Is it possible to send "RFC"
> patches for things like DT, clk&reset, and pinctrl? Please note that
> these have been tested on FPGA/Emulator.

For sure you can send them as RFC, yes.

--xnZVKVuLE9iuntqZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZX2SywAKCRB4tDGHoIJi
0i7tAQDWY8CCVBgjwFAM48GbHbn6JwBmS6Odm7A3xAHVilTqcAD+JLVOfmzJi/Pg
YQekZntg/l4zEsu7HjxVLj9axaNDvgQ=
=mrO6
-----END PGP SIGNATURE-----

--xnZVKVuLE9iuntqZ--


--===============5847767559369353007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5847767559369353007==--

