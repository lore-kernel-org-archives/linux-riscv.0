Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDACEC02180
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 18:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZX0fSZAwkUt3EuEJm+nipVqMlZw6vuq3Pg6rp0pce28=; b=cMVldDD+rtS8oEChEKirUnYNhK
	fZJ+YawU6THmDuOpMjSwcbVC979swX26OXp/tHHgjARo2mSchSRcPyvJ3a4EKIcwy0kTiMihNSfvy
	Zdk1CSZd90W8SkKX0sX3W2b3cqS9NaHpAeg4LblIJWzGykfMTJmARkQFfDjADp+dMI/85W9vVjNaC
	i+YmrAZkHt1UqGouQJG78vUsZ/nzl6sWdMmuFodG2Cq4aMR08t/I5yxrHUmCUWpTem+pMGes6wRS9
	5eZuHS2Zt8pD3tsulNlOy4nwOOP39QAWH7E3lFUvZHQ4XReOQf9759C5pWoqkJmcOVd9SZighDZiD
	EKrY1tJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPPU-00000006Fz3-0iO1;
	Mon, 13 Jan 2025 18:43:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPNj-00000006FSu-1fJK
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 18:41:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6D0F9A412F6;
	Mon, 13 Jan 2025 18:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25BCC4CED6;
	Mon, 13 Jan 2025 18:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736793706;
	bh=5x7pczxxR+kIty5Ix1+YasbOKxJL6vgG0kDV2oCaLMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJ1OD+YlTmV7f4ulBE1x33WjKRh4LTZANllWGTtu8lq/wrHHsdJ2DaD5F6CH3mGpf
	 az1bOOFV2MroZUvXaiydfgJco4RWOKS3aHrb9IN0stq40yIQEjN8AMm26MnrK94VSu
	 VFKAL8RLJET6YaUx/KDW2mqDjiPl6w7DpRY1C8yZ5T9eZ/0V8fJ/CW4Z/Z1+YKTQcD
	 VhBYGWZujkBPNEzCYnPcxZNG3A/lRp5xOSMulxLw5Jaxn9vFXdPEEq006U3gxDVJGO
	 MRNuqhwoXOsD2CtbLlYzFX5DPJSleb/PBNh+hiQWwobnTfT+4a6jMAU5IftRfWtyne
	 I5iaij3rdgzJw==
Date: Mon, 13 Jan 2025 18:41:42 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/3] riscv: dts: starfive: jh7110: More U-Boot
 downstream changes for JH7110
Message-ID: <20250113-catacomb-rewire-2b460d688f40@spud>
References: <20250102204137.423081-1-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20250102204137.423081-1-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_104147_495641_82E44EE2 
X-CRM114-Status: UNSURE (   9.51  )
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
Content-Type: multipart/mixed; boundary="===============4302086819023419313=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4302086819023419313==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pO2rOC5E5CHwbl3a"
Content-Disposition: inline


--pO2rOC5E5CHwbl3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2025 at 12:41:20PM -0800, E Shattow wrote:
> U-Boot boot loader has adopted using the Linux dt-rebasing tree for dts
> with JH7110 VisionFive2 board target (and related JH7110 common boards).
> Sync the minimum changes from jh7110.dtsi needed for boot so these can be
> dropped from U-Boot.
>=20
> This series of jh7110.dtsi changes is RFC as being uncertain about what is
> required for boot. Testing, review, and suggestions are appreciated.

I don't see a reason not to take this stuff, provided it passes
dtbs_check.

--pO2rOC5E5CHwbl3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4VeZgAKCRB4tDGHoIJi
0v3bAP9nsO92koWJAw14oYplCfHLKHtzgdj16/DrlMr9BPFubgEAo7PTnFHo/DTd
Aafegu9+9sekIOjGnBmkeYiYJqrGSA4=
=fflB
-----END PGP SIGNATURE-----

--pO2rOC5E5CHwbl3a--


--===============4302086819023419313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4302086819023419313==--

