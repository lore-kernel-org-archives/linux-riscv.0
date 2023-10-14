Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDF5CDB465
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Oct 2023 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8VSOJZVbHg2GoN4QXPFrF/rRD+RG1IWQJwzzCCs9F8=; b=tNyrGN2X4Xnh5N6tEArzMIupA5
	j2U4aaPnZgoAYn8bdLvw0EgAUAvU+YZVvTcUGy+DmE2g0qtI3Xvc0CkFgj/dOl9XPNN9BXqWAreJm
	zoolxbH2ZdyBcK8INzQxZfTvJP4mpNqua20Ox/REqcgnd805vygV6wZpUWy1ozi4Ekl0VGJsy8v0m
	3iVSXvjBQ9CsU1yHohNMi3pPyHpGUWNTtZg/8JPcnfKe/NIIwI5WTh7mdSaNkPUFcvMBielu4PH+z
	eC8xtgbSEfuup9bgblXCvc/s5fpBId21df4GbW6Kn83jBkaulAiCOvMjADb8/P2vGuxj6EfCu9mnw
	aZIqH5dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qraxE-0052SX-2J;
	Sat, 14 Oct 2023 09:29:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qraxB-0052QU-36
	for linux-riscv@lists.infradead.org;
	Sat, 14 Oct 2023 09:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C83F660A50;
	Sat, 14 Oct 2023 09:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6E6C433C8;
	Sat, 14 Oct 2023 09:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697275734;
	bh=ZpEO1IMYtH2irsHJdzCqFNZXRTOe6izWzOLePcvLYVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFcq0GjznydPaTONKjqfjV1+Nr7NZVwNPCQW5bLkxT1fQZovxY9n1S6AvO4BFzWuU
	 TjR6cYOn61RQGer1aEsC4MPdJvFsGAslrjiZtzLUnGEUVNs91m9cmwvzq2qT5YNRcG
	 l6zO8wCj9jejD8frT/V93xclYkS6S3IXunPiHuLvx2EL7DTPGOcqkrwE9GpJh3M1ZK
	 bVFGRUI5GflYDnfCP5qrC+KThsY3q7iP4WZOoSlUM0lcAv1eUQc/UOZsCqUTEKyhVn
	 hB0u8fypH9jkVxH2IVGTufXhjD17LMQI5jPHVb5xCgF+Hp2fDvLmB6JXCIV3gLeuV0
	 n+y2+d3E6cfAw==
Date: Sat, 14 Oct 2023 10:28:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/7] riscv: dts: sophgo: Separate common devices from
 cv1800b soc
Message-ID: <20231014-scooter-blurred-995313b571ea@spud>
References: <IA1PR20MB49531C1C34C3E972DBBA4151BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231009112642.477337-1-inochiama@outlook.com>
 <IA1PR20MB49532560A3CA2670A0EAB846BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231013-catchable-wince-f24060feb639@spud>
 <ZSpZmsb29ZC5L9dS@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZSpZmsb29ZC5L9dS@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231014_022902_069462_9E6521AA 
X-CRM114-Status: UNSURE (   9.17  )
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
Content-Type: multipart/mixed; boundary="===============7295119584216661328=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7295119584216661328==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a/zpBNbMNsth1Q72"
Content-Disposition: inline


--a/zpBNbMNsth1Q72
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Maybe this has been discussed before but I didn't find it. I'm wondering
> the reason of adding each plic and clint binding for each SoC, can we
> just use the thead,c900-plic for plic?
> FWICT, arm gic dt usage follows this way, there's no binding for each SoC's
> gic but directly use "arm,gic-v3" and so on.

I'm not aware of why the gic-v3 is done like this, but having different
compatibles allows differentiation between implementations/integrations
of this interrupt controller. I think having that ability is especially
helpful given T-Head have open-sourced a bunch of their IP.

--a/zpBNbMNsth1Q72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSpfUQAKCRB4tDGHoIJi
0pX2AP4wYdW2thFcBTVUGxaO74xEyj4aQ1WBKWyE5D7v2uZ9JAEAkJn4LfRJBEGC
c4In3tyIqVJS+5Y1dWIQO6WzcjO0tgk=
=XuAN
-----END PGP SIGNATURE-----

--a/zpBNbMNsth1Q72--


--===============7295119584216661328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7295119584216661328==--

