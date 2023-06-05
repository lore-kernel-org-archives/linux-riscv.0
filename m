Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61A5C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 09:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8b2lPYJlT52UGDk5SL/fiohYSeJkdXC4t64KEzwUSvc=; b=GOq7KnjwzlCuSEi3K2nisuW6SI
	yRoKI//h5z2o07+jNgE1Z8ZB4EPZR/a5zT05y3Ap/bteNFvYR8xsAmp9DY/7PUhrRJe0Z+OOsg/8b
	++Knu43KhRCAwPvGrSbo5lqga1XGeaoY8aOUse9TASwglqxgfjG0jUMtwi0JIGxj3IGCBMef5tvLZ
	x7OnyrrCuXADqsEuhZOc2ZyGcRmuAYMimQ81YTA9eKtQwQoZqZiQw0hGYfk6+L0CvFs2tMlYifIvy
	ehoAkSd3vkEoEQorUxFozQLv7uWuudj+pDE2P1KfYzVbrQeNfFPIr8nDht8n4Xn9gUq0cvjsVPwM0
	9Xk/wXpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q66vR-00EvTy-1s;
	Mon, 05 Jun 2023 09:54:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q66vO-00EvT4-2P
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 09:54:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A62061014;
	Mon,  5 Jun 2023 09:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1332DC433D2;
	Mon,  5 Jun 2023 09:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685958893;
	bh=Ry2SkmA+K00RMMRxzGwH6nLi2ayMp2/LpHhS6bn9nV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=toHpX+gklKJh1L5yc2c/GTNVoNN+0VS1HrIpySdQra3F3OzY8AJ6Xor8gOOt6uxoX
	 VZg5XtlZ+nEjaHNz9MgW7ZIBgcuZy/7+tibEQtNanNrxtZg+jyYTdMmFrfys1GvU1M
	 J9HIqPU3Fg2PLyA64MUSbFEGMPPNH0YfSTISRbmvCWIT5e6eefeylQt1ojeVGhSgIG
	 vzA9hAqoqVhytIL8oLgK5KG+b3o6C7R7uk5DgljkKUtBYcJ1kDNqsrPrDcg9Gp9+fR
	 74shnODvYY4j2YyxCWzrly366sni8imCjoWiqkaiB7bD3gYHalmUBd7J2+Yg50EF3p
	 9SStQpDrE699g==
Date: Mon, 5 Jun 2023 10:54:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Mason Huo <mason.huo@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shengyu Qu <wiagn233@outlook.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 0/3] Add JH7110 cpufreq support
Message-ID: <20230605-strive-caddie-e570c6c4f958@spud>
References: <20230421031431.23010-1-mason.huo@starfivetech.com>
 <457c35b5-aec4-1147-673f-947052b5f944@starfivetech.com>
 <20230505-gusty-corset-e451d947c10d@wendy>
 <c5bde0d92d514250a21120ed33e0f6b2@EXMBX067.cuchost.com>
MIME-Version: 1.0
In-Reply-To: <c5bde0d92d514250a21120ed33e0f6b2@EXMBX067.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_025454_886740_BDD38DCB 
X-CRM114-Status: GOOD (  19.45  )
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
Content-Type: multipart/mixed; boundary="===============3334575160897680315=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3334575160897680315==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PLgiS43f5xmwF/2A"
Content-Disposition: inline


--PLgiS43f5xmwF/2A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 09:36:51AM +0000, Mason Huo wrote:
> > On Fri, May 05, 2023 at 09:38:38AM +0800, Mason Huo wrote:

> >> Thanks for your review, and is there any comments about these v3 patch=
es?
>=20
> > Firstly there appears to have been some mess-up with the driver/bindings
> > for 1/3, so I am waiting to see if the binding gets reverted before
> > doing anything and secondly it's the merge window so I can't do anything
> > about 3/3 until next week.

> Could you help to check if this patch can be moved on?

The dependencies are in, I guess when I went checking through things on
patchwork after the merge window I spotted some issue & didn't reply to
the patch. So sorry about that.

The issue that I must've spotted is that patch 1/3 doesn't pass
dtbs_check:

arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: pmic@3=
6: 'interrupts' is a required property
        From schema: Documentation/devicetree/bindings/mfd/x-powers,axp152.=
yaml
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: pmic@3=
6: '#interrupt-cells' is a required property
        From schema: Documentation/devicetree/bindings/mfd/x-powers,axp152.=
yaml
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: pmic@3=
6: 'interrupt-controller' is a required property
        From schema: Documentation/devicetree/bindings/mfd/x-powers,axp152.=
yaml
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: pmic@3=
6: 'interrupts' is a required property
        From schema: Documentation/devicetree/bindings/mfd/x-powers,axp152.=
yaml
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: pmic@3=
6: '#interrupt-cells' is a required property
        From schema: Documentation/devicetree/bindings/mfd/x-powers,axp152.=
yaml
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: pmic@3=
6: 'interrupt-controller' is a required property
        From schema: Documentation/devicetree/bindings/mfd/x-powers,axp152.=
yaml

Could you please fix that up & resend the 2 unapplied patches?

Cheers,
Conor.

--PLgiS43f5xmwF/2A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZH2w5wAKCRB4tDGHoIJi
0pk3AP98k50f8b6t8gc+CLxz5l794W8A1lozutZce8eNutCddwD/ZWLXNAoLg/aP
o8umGak3dTZZlLPTKRbxJal+Dq/i+AU=
=vA5j
-----END PGP SIGNATURE-----

--PLgiS43f5xmwF/2A--


--===============3334575160897680315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3334575160897680315==--

