Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5085C54E67
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Mar 2024 15:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQC2ET77ZkmagFEZoZX/+bww5gfv8ryf/Du93sZMs8Y=; b=1gmPMCnQIzvkeHG3JHAAsjQ6/0
	Gv0I422507jKEzlm4cy2oAyvztO8kX5Zu44s5Ym5p6J4j/JUnLiDt5ulnG3vGH6StyuA8bsc4LDxX
	WcujZeHWXdHm7/MaStLdya5HtTgwDrh5rQhSLs8Ft1n985UuosBwbr99kVjl8gPSihHN3axdG2yhV
	njRfocmmkh1jT/qYiJbNxVdnx8FnTAnSI97IZghjkl+XHWhGBgXqPLatXrRr7PvzisvYywNYEhS42
	2wmQhJ9be+S2xgJ+gHhPMMs1N1HWcAqgqfXjUSF1mOr9844/YCl9E96M2p631QWDSHhP9GKxqVOtN
	ZcK6bQog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rls0j-00000005V3N-3RpT;
	Sun, 17 Mar 2024 15:01:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rls0f-00000005V2n-3Cn1
	for linux-riscv@lists.infradead.org;
	Sun, 17 Mar 2024 15:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E99860A2C;
	Sun, 17 Mar 2024 15:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A81C433C7;
	Sun, 17 Mar 2024 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710687672;
	bh=j7oxe8BD+mVFzgrsY6JafuiQy9oGRRV5ZitHBwsWITs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UFlbMl1tlfTfjCd9+pkxYpxlH5lOdt81iI7gKF6qORgShqzS3QzddQ3IosuKMXCZK
	 hJ/jYKZyEBOi/WONqsV4EswpVnEfSaM/bg3YvvQSwFdWUvKuJkgQaw0T9vb9IcYw7x
	 Uk2QxK4ss5jT9T8RatnMPUupjgglURpWSNR3q5/Id7jhnZ6oBoYmi/ceStU6C3Tics
	 5807V7kuwXgf6yPli2elDOdg2ueJcNeAfq0sM2RzZ+D9F1E4MMz3UamLIeyKOKcfJ1
	 2c7RH+UvUt4vx3n9Vrt23DA0oaEROlNlc3SeOKo6mdFCm2DfG8tbVWEC/41KtgZ+t8
	 1/Mn0r7lbHC2A==
Date: Sun, 17 Mar 2024 15:01:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Subject: Re: [PATCH 0/4] Add StarFive's StarLink-500 Cache Controller
Message-ID: <20240317-viral-handcraft-12b2519ff1be@spud>
References: <20240314061205.26143-1-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240314061205.26143-1-joshua.yeong@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_080113_946401_A593ED84 
X-CRM114-Status: UNSURE (   7.54  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, geert+renesas@glider.be, leyfoon.tan@starfivetech.com, heiko@sntech.de, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, jeeheng.sia@starfivetech.com, conor.dooley@microchip.com, evan@rivosinc.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, guoren@kernel.org, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Content-Type: multipart/mixed; boundary="===============4268084839405540541=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4268084839405540541==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rsMLDVhBuM3yu4xb"
Content-Disposition: inline


--rsMLDVhBuM3yu4xb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 14, 2024 at 02:12:01PM +0800, Joshua Yeong wrote:
> StarFive's StarLink-500 Cache Controller flush/invalidates cache using non-
> conventional CMO method. This driver provides the cache handling on StarFive
> RISC-V SoC.

Unlike the other "non-conventional" CMO methods, the jh8100 does not
pre-date the Zicbom extension. Why has that not been implemented?
How many peripherals on the jh8100 rely on non-coherent DMA?

Cheers,
Conor.

--rsMLDVhBuM3yu4xb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfcFsQAKCRB4tDGHoIJi
0t+UAP0Rd8gYpX+LqpilA/FjT0qP/H3kHE7pBMNt8b8513mNewD/W/chQLnb9a1Q
8T5MbISfMDawti8Fb7AVnmgEL4o8zQo=
=cPlm
-----END PGP SIGNATURE-----

--rsMLDVhBuM3yu4xb--


--===============4268084839405540541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4268084839405540541==--

