Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA93C54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZszz9ZizGbrCXgHvv4mEJoQiCUwoik26uQiqWBiLKc=; b=G965lrJW6bNg+/pg3WCCqnMXbG
	lXf2vAwIMU/Y+mhFArCj/ZbnW0WaOlr/rsjQROD9bJ88XwhfTGnosZSFL7ZgdjYhsFXLItU/hN3Cd
	uGZ45UF9fViWhnRVtl+bU25Rqc6gHripmGWdpE7YibYcD1sfeJ1hmAzqnmAw09jtXSZb+AiMiR5cJ
	b3Bo16ncNIUIiYjUENP8+YLL189PeIE5rWM6JdjCvdB+Chs+V8IpvuIInLH60hm/FOpgtmH7OHsvI
	go+dQDh5Jwyos9aHH3Kf5DDraybVmIDQAy7i0wuSzWJ7fLc3/Tl7llFP/u04DsA1giAn8FEWo/r0B
	WDNAgSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEy64-003iOQ-9w; Mon, 09 Jan 2023 19:46:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEy60-003iMu-UE
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 19:46:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C76EBCE0F95;
	Mon,  9 Jan 2023 19:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37066C433D2;
	Mon,  9 Jan 2023 19:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673293569;
	bh=hhpFMtEwC7+bjpDcSFBG5j75Z8R1xgpJe/q4zRbnu/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lkW5aT8ViBhn1t9Vk+8YIJ8iYR+2SaXunLqJIzsHWAM1+TY+HM6d3I56nj4yRUtde
	 Pbu+b6d+yPavtzrUGsuUqo3oepftg4kOobL3eZ+JJo77kWPrxhdNhP0yeLn6kV15Ph
	 6tPap/A80n5YU/Rzla52ZtWCxTmTkZZ5heQt7nHfQDgdbPWiVpci2Uagky+828Kr81
	 wE9T8UfAOlMZnhR3bT/qB9PMlivWQ+m1DDO0v6bnTy/kIP1RD9E7GauRUeNnQycCZw
	 VIbd0TBQZtA1bK8hsedr9qGxVNF/Pt8CWBgOKf03MAgr+WX20hZ+RMFLmENeuLvS4s
	 vf2rLjPgHd3mQ==
Date: Mon, 9 Jan 2023 19:46:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Sia Jee Heng <jeeheng.sia@starfivetech.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com
Subject: Re: [PATCH v2 3/3] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Message-ID: <Y7xu/Oj07F7/e8F1@spud>
References: <20230109062407.3235-1-jeeheng.sia@starfivetech.com>
 <20230109062407.3235-4-jeeheng.sia@starfivetech.com>
 <20230109193624.iiuguwgimpn7zbyw@orel>
MIME-Version: 1.0
In-Reply-To: <20230109193624.iiuguwgimpn7zbyw@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_114613_782612_6CA8C2F9 
X-CRM114-Status: GOOD (  13.15  )
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
Content-Type: multipart/mixed; boundary="===============6299702625337706682=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6299702625337706682==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fH41y5PUQ8JO9uEa"
Content-Disposition: inline


--fH41y5PUQ8JO9uEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2023 at 08:36:24PM +0100, Andrew Jones wrote:
> On Mon, Jan 09, 2023 at 02:24:07PM +0800, Sia Jee Heng wrote:

> > To enable hibernation/suspend to disk into RISCV, the below config
> > need to be enabled:
> > - CONFIG_ARCH_HIBERNATION_HEADER
> > - CONFIG_ARCH_HIBERNATION_POSSIBLE
> > - CONFIG_ARCH_RV64I
> > - CONFIG_64BIT

> What's blocking this for being for both 32-bit and 64-bit?

Just from checking with b4 diff, it's because I told them they broke the
rv32 build with their v1 implementation.

I'd rather they fixed whatever the issue was with rv32 than ignored it.

Thanks,
Conor.


--fH41y5PUQ8JO9uEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7xu/AAKCRB4tDGHoIJi
0rbHAQC/EoLOn3l9FXeFdNHGzV2XbStGO7oAZevQkCdxwu85EgD8C139RXfKcavb
BgwsCyV/74ABSmP/cr/hrLi/vb3EXgc=
=rPlV
-----END PGP SIGNATURE-----

--fH41y5PUQ8JO9uEa--


--===============6299702625337706682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6299702625337706682==--

