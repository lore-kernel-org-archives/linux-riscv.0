Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78577C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 08:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnnHxuk/ik72/5YM1Jj3i8Gz9opSjfGPHfb/LpxxI3s=; b=UczGWpaSDkSUgq30gDelKlKG7b
	oRxnqE+CloYPcDMRu+lMJyYdTBXXtSQC0ZiKOCkKQuC6R3sk1ibXvQdM4UprSjWTBSWuJX43PyfW6
	3Tioyrv6+rGpoh9X/+mDwvc1Wm3xyqNaQdWuTDF8O4w2QwJV6wIWvu/v4Y7rUu4SkDWh9yjvgHPPG
	cG7iqQ6VyrHvypOBYQye8Cas/z7Flqbzoyyypzu6nyDC5rtuzOFsjWfnm9j3BgxYKXesZh91Ure6B
	P1XooSe95IwPxOBU3Memcn7rjr84gvkWrJ0qxNspq2ENWqawraPH94D6LsizLz/3UfzqLDKNUlzoa
	GvozvPWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2FP-006Eid-0P;
	Wed, 19 Jul 2023 08:09:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2FN-006Ehp-0k
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3I2CpintlfHm+8QY3K1kLfsNTB3VePggx7kBW6U190U=; b=iPhZEC8HwPYKPHZxzLqr+uPIGw
	GrLDVPObun+Z/QtWXNQy70sEKxuRkWHuOshpTZa1zZnwpiM4e2PW+3pilOHIJduwSG5Os89Fegm/F
	0ZQc6bpSYGz1wwkyj21DH9Bw0/gBI/uRfiDyJegdGPwJAc1wt3nhEGBkyCCFKalm9QVFsIE4gbK/9
	wpSM3PwB6Z9ShxIwWKRF/n0gNWBC5q87DeKD8k+W/xOWMF5XE7IotLe3lk4MWd4/r/vIY0O2LNdpn
	FfSkOx/sDnXYOBrZ6p171vrw4wAvTMXmmurQvz6KjUVYT0nlSsXGoI6YRli+IyEgkZizJg7vjKJ/z
	WG4/qshw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLi3v-00BPoW-33
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 10:36:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EFFE46150C;
	Tue, 18 Jul 2023 10:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088D0C433C8;
	Tue, 18 Jul 2023 10:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689676508;
	bh=ZaV5omOlT2FFoTiy5x+BQBA23UgpYYE/AVU0DfbIVtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TyAvhMU1M+Dc9IEDGp/WfPcK5G0ExSCINvtx/5zAyJyQyBHchSyuo6u/AxHdavCnA
	 yhxRxBBK8UqsbHGypBr8bT10T8RxkUyMNZdfSPcysSz8Ox49/jQ0CWAlmjJbh7kj4Q
	 /dgOQE3Gp/9wc+BRejZmlTZ6tmunMe6Z3y30Ibf/rBEwkeVI6NoA/37apg57rqBWXc
	 Cb6iaq4zhj37nrbGf7lUb+f3QQGP2JumhbV/CJZSwxE5csgsGNJbVcTtKs8l8HrvCG
	 1RvZd287l4/up933k2DXq1cpia/75oC3ZqVSrEPy32PiVb0etEGxEOyP5TdSkMnsiT
	 J3GnJYXLC7fXQ==
Date: Tue, 18 Jul 2023 11:35:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] riscv: Reduce ARCH_KMALLOC_MINALIGN to 8
Message-ID: <20230718-survive-duration-5bea1a07ece0@spud>
References: <20230716165147.1897-1-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230716165147.1897-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_113612_393473_C4FF0B44 
X-CRM114-Status: GOOD (  10.38  )
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
Content-Type: multipart/mixed; boundary="===============7677275729470390221=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7677275729470390221==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ohkQUed4+afNqPTA"
Content-Disposition: inline


--ohkQUed4+afNqPTA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 17, 2023 at 12:51:45AM +0800, Jisheng Zhang wrote:
> Since v1
>  - remove preparation patches since they have been merged
>  - adjust Kconfig entry to keep entries sorted

>  - add new function riscv_set_dma_cache_alignment() to set the
>    dma_cache_alignment var.

Yeah, looks a lot more straightforward now than in v1, thanks.

--ohkQUed4+afNqPTA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLZq2AAKCRB4tDGHoIJi
0lK/AQDpSk3Y7G5SPZ6seWkhMA17sWxm3a/pvfsQwgN+7QPyRwD+OP3z97omY0XI
MdkIwhNl2lMpl4EPexXOoDGtDSMNYAQ=
=1hO1
-----END PGP SIGNATURE-----

--ohkQUed4+afNqPTA--


--===============7677275729470390221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7677275729470390221==--

