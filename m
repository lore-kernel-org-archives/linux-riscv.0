Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BD4C001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 13:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WQZBSufZ9h0s3nS2plQeQCkQiB9u3F6OlpQ9EHQM+Y=; b=gQkMSFnIFR+AeCm/524jfGWMbq
	9UmQTmAM1y1FNJmPVQOsA6gEiO7D+MRR+jmmM5ZcuDPOd52eN3OycRs8UdvMiOMwnU1h2r1VTRwo4
	EZYUD4MZTbHg2HZdA1CKgDKqEeZkefUYA7pyqzgyIUf/TNTZAArVRq2d6PoERLxAfZi3pJ+bicn/j
	EMiD6GBBWBnHU+kM3zpCzfz+IbVe0j6dOEUTsyyMncaC3MdGHJyXQ3gPCTndN4Tksm88iIBBwBlhq
	p1sAXxMmiqMs/c6hQVX6tQcMIpRs8rvD4dHtag5OdyeBLRyA5OQ07LoNiH+3hWIFZJbduRTBiJTQX
	u4PKVIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMWl-002cgP-0f;
	Tue, 08 Aug 2023 13:13:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMWj-002cfx-1k
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 13:13:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B7AAF61E9C;
	Tue,  8 Aug 2023 13:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A05FC433C7;
	Tue,  8 Aug 2023 13:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691500412;
	bh=CD0ufiG3nAoVG6VwJg+1gXVvFXW3WqH9W+OfEUubutU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xrd/rkrwZzOaPiJToz5IEiSANDWww27dyd63pY8Y3Xh3Y6r2ob4CEye9hp0bCkW3u
	 jxcEA1dGIZsW3JuwDjxhNeFT/yT8j0XwECU3HuMP1sQxFzjh+2lEgm28zQA/0yXeC8
	 +wkXDPOIUV2CJbvyz97qwyyOImcr5PiOLEdyZ3Ka0i7IVwTy92Ch3BlnB+t+hy8zME
	 l2Cb94VOWnB/Dkw4Ejc5SBgLIPlNCgSdBn2L2CuDpcl2Tc7Go8mCaw9JgKcThkGZEb
	 YG69lnEW+2OVCMZ2xYwA60ZmxkUVAtuXxVJn+9xqYKRt5SJa9mCISl7cZA0RiQ2ZKs
	 rQ5lgd45MyLbA==
Date: Tue, 8 Aug 2023 14:13:27 +0100
From: Conor Dooley <conor@kernel.org>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Song Shuai <suagrfillet@gmail.com>,
	Petr Tesarik <petrtesarik@huaweicloud.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [RFT 1/2] RISC-V: handle missing "no-map" properties for
 OpenSBI's PMP protected regions
Message-ID: <20230808-humility-rut-e1e46cf75708@spud>
References: <20230802-purse-hydrant-6f44f77364b0@wendy>
 <20230802-detention-second-82ab2b53e07a@wendy>
 <3e066032031e4552b4b7903755deb669@EXMBX066.cuchost.com>
MIME-Version: 1.0
In-Reply-To: <3e066032031e4552b4b7903755deb669@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_061333_621910_D260F205 
X-CRM114-Status: GOOD (  10.66  )
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
Content-Type: multipart/mixed; boundary="===============2710154583514222075=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2710154583514222075==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qg9u4gSpdwUq1o1/"
Content-Disposition: inline


--qg9u4gSpdwUq1o1/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 07, 2023 at 12:44:07AM +0000, JeeHeng Sia wrote:

> > +/* SBI implementation IDs */
> > +#define SBI_IMP_OPENSBI	1
> I would suggest to create an enum struct for the SBI Imp ID in
> the sbi.h file. What do you think?

I'm not really sure what the advantage of doing so is.

--qg9u4gSpdwUq1o1/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNI/dwAKCRB4tDGHoIJi
0g9OAP9rXh4mheB9oj7xanTMiA+0dCjIXkz4ZFQ5YWlhs+GuLQD+NdUYNiTilS/Q
A/GvpEnisAu6ETAprP5ROKjO+STbjQ8=
=ag5L
-----END PGP SIGNATURE-----

--qg9u4gSpdwUq1o1/--


--===============2710154583514222075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2710154583514222075==--

