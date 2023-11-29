Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5FFC10DAA
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 14:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fnf1Pc/tPaPner9uqgG5UBK/dW+BkCg3M+jyq0KXye8=; b=NhGPJmTqo648Ae4wYItapCdLKK
	rtDffKXDvYgwhZ9LaRkeJfvC5ClIeMzLbpEyHkIjGQlgs1o5Xw4TQAeNbpyL4X0gx4Rlh5nsyIyCm
	7tq/ufa2molWWInC7uuhAA6YVXeooH5KKpXFZc4Ng25oqxLXRROjffyBqXf6Q3PGql/+79Ot6IqHt
	p6QJmas3eITVl7gdoAub7ZYZibuzxHobALVPbGZN/7zkOvWp0OeWb/uctPe5jkmRdbLZHh00ItVaW
	kBLBVa2j8EyjD8DZYhnuuiyPnOJiL3Uc2i7gQdp5eVypnsymAEczxJu9DJpPHCyi9rxQ0TlXfB/Ud
	bvTDlbcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Lu2-008goU-1T;
	Wed, 29 Nov 2023 14:51:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Ltz-008gmw-0X
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 14:51:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 23072615B4;
	Wed, 29 Nov 2023 14:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BF1C433C8;
	Wed, 29 Nov 2023 14:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701269457;
	bh=0VHSKBP1ReMABzZQC3fHKYxtIh+5pDAB20b4lDIyvBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fsrd95RHo63I/KiYnCu1p22EqZ5zkOBJx61wvudfvnKHia6k5apCzxVgjiCBJPMu0
	 kuFuH5a10xSmoBkHyjI6xkj+z1ayMfn/RWKD0WtZtf2ldM+K22jqDgB9ZcVRARkDiI
	 MskWm0JkzUmiR3P/gYdlsJIdi5WOkrUAOB5EWOu/6j3mXPlemOnBIP881yNBJ1x8Mw
	 IDGr4M0wjgi4DOOhpde2T9if5Jr9CP7hjjJXxB6PLuHL6SbIdeu0aJO4vlYUGnMPLW
	 CzT0jp6FR/6zQP9zDjTqjOJQiyACSt+Af2oObc6GmRmnjam86soE4y5uAXZeKZkeG0
	 MKnGO2f8ZZVbg==
Date: Wed, 29 Nov 2023 14:50:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: kernel@esmil.dk, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	krzk@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	daniel.lezcano@linaro.org, tglx@linutronix.de, anup@brainfault.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	michal.simek@amd.com, michael.zhu@starfivetech.com,
	drew@beagleboard.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com
Subject: Re: [PATCH v2 3/6] dt-bindings: timer: Add StarFive JH8100 clint
Message-ID: <20231129-junkyard-implosive-5b1d28976e63@spud>
References: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
 <20231129060043.368874-4-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231129060043.368874-4-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_065059_251940_923B79E5 
X-CRM114-Status: UNSURE (   7.72  )
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
Content-Type: multipart/mixed; boundary="===============7274200026152817375=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7274200026152817375==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qKdfr+4VHS8JTnF5"
Content-Disposition: inline


--qKdfr+4VHS8JTnF5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 02:00:40PM +0800, Sia Jee Heng wrote:
> Add compatible string for the StarFive JH8100 clint.
>=20
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--qKdfr+4VHS8JTnF5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWdPywAKCRB4tDGHoIJi
0hu3AQDko2ie3vpTPXfjxfnvgF6fp8Rl7pzo9cnDc63+d0kVjgD9FRImCWNbkv94
acKyBV66aqco9mGG9l/CojneYNWFswM=
=MwTW
-----END PGP SIGNATURE-----

--qKdfr+4VHS8JTnF5--


--===============7274200026152817375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7274200026152817375==--

