Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A35DC5B572
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 16:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIhEOSMy5PJJxPHyzJM6S4Hifr1htFMb360WNoMkX4Y=; b=IniVGAluV+BiXMxo4CMvkWbX+m
	RlWHhBeQXHznEViPf7VDvgMrvtpM5l1GL1S0LD0jni/6l6nq+cuafP+5+IM3JzUa1hcGXkOHScnnt
	W6ld1gAIUS6KiBq7iiKk0VYG6aqVVTDorPUsh7LZ9RG+tUqX0C0ZdzOCxqlBG/J3rGZ6463r0qA3r
	gbrPv6xRcSEaZ0WsDVXraEPLSVeCQSG+2kcMcoxkcCjiLwZWGYF1WQ25LbaJmd2ojighD24JCvXXi
	vwHkQJ1IEvYhSE0ZS8tyvor45izZUm4O/I5H9N3wGeUKQvQ2bDyXkj/WDu8OcW09CBR6Ke7dWOUnf
	nkDqstjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBNf-0000000GY0d-2o34;
	Wed, 12 Aug 2026 16:00:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBNe-0000000GY0H-3wzv
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 16:00:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6683860A7D;
	Wed, 12 Aug 2026 16:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2241F000E9;
	Wed, 12 Aug 2026 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786550438;
	bh=mi/6rxdPx4Qp5CB2+flp3+6ZqboMB8sQ72KgtWG0b0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mo7mOvs5fg2GiAPXhY+sIT/vFO2vfgPCWAl/XqxBWYvp3ZHHDfWzBKRZeRmR1o64a
	 rXItrECmfZ9PG8KcFJuQBAYhtJMoKZoOTVB/PipS35O/JuSQNMHlp/hyhbzCRmrU+o
	 8CuJ/6FEpz4OZGRpFEEiHjlIo2Z+gg8A4du0qC0fUW0kjxVVPZAhSnlZf4UH9M9kVc
	 u20GA2ta+kukL3slGbeD+PImtS34T8iQ3mjsJNOFFfECBIBRWzubaUxaEU8wwUN4ds
	 wSyQNFRNkVwgknvS4K9VWT31ev9Nmvs3Kcp5x0eqlnK7aXXFoDvF5XPUPLwnuwIimk
	 N1Qe7HQkWU0oA==
Date: Wed, 12 Aug 2026 17:00:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Peter Chen <peter.chen@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/6] dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2
 compatible
Message-ID: <20260812-tinsel-tweet-8b3f49fcb4d0@spud>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
 <20260812-b4-spacemit-k1-usb2-v1-1-f28cf29e522b@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-1-f28cf29e522b@linux.spacemit.com>
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
Content-Type: multipart/mixed; boundary="===============4028463785236572208=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4028463785236572208==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Il514M+RL+ZQLgRP"
Content-Disposition: inline

--Il514M+RL+ZQLgRP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Il514M+RL+ZQLgRP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCanyYoAAKCRB4tDGHoIJi
0n3SAP9N4J4ZscMyDPBiwvCde+IGjl3ABzT2jDBEksf/YTZuZQD+K0xRBOk8Dwvs
vxKBxjnLYKdOTBA9Bw/YzopCdzNxTQk=
=sSFj
-----END PGP SIGNATURE-----

--Il514M+RL+ZQLgRP--


--===============4028463785236572208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4028463785236572208==--

