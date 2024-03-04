Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E02C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 20:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZPjnP7CVkq/YKBilIh1Aom4bou07Vmhh5m5DJY5QMU=; b=twOojTG42erTGNdP+4QZpOWhv4
	cuir5kYFS0mF7o3zWJLYUolWbVMacds8pdXc+NYx2UFVRba4JEHIiP2DFBhA1PCh+VMY8xXXjBy1S
	0gdFdC7+Lf6tzdbr4a6aOgBoLc/TIR1+CAi4hTBMoe1yZCwZ0hts/pZNbvXKH4XBlOol7Tyo2CezZ
	8HI+d9Sp9ze5Ck+KIT/Pm4TFGMwqr3PlylajqhOVLEPvQxeWrAHkQ4Dg/N/ttHblPSQAKFG0+2yxN
	NayqXPcTPzUqZlYkkUMXqr0UBKzYjoRkCygdjp+UpibmnKzFKmfjQSigwt5xBgyGz/atBWdTN31hD
	RwAgHeMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhF1o-0000000Ad4O-16Sm;
	Mon, 04 Mar 2024 20:35:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhF1l-0000000Ad1Y-1lBT
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 20:35:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AC4F60687;
	Mon,  4 Mar 2024 20:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912F0C433C7;
	Mon,  4 Mar 2024 20:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709584508;
	bh=NJDANWRGqAfFUEhKbR3uU6wp4qNAJ2qDc7OSyP9otQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NciIjyYJlyEGnplFPM3wx9LGv8TOaJiDLLY4GqwleDW2qaZzFcIEcAZNbK2k+SLyF
	 4yLrMPxpNKsqHzyD5iSmsJ8pQGf3vY8QchZWbTkiLmOa3jqP9vCVT/uFnas+H6CSOj
	 Lk5cbL6jtIRy0DNgJyyknD10pTbD0J5mZSms4dr2XDLbOMoawlgwhQ83X579p163M/
	 KBpKTi4a98vy/wD128VqoqIuYGPogM0Pr4e77DIP6smZZ44ASuhXdPgtcODahGou7D
	 qY/5+WdqOrAuG+KWxq2Xu3CR5Ox28B9eQbgB1crEw/hHwm57CLRfnTZuXbX2OFuEt2
	 BxU3o33LZ3Dug==
Date: Mon, 4 Mar 2024 20:35:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] riscv: dts: add initial canmv-k230 and k230-evb
 dts
Message-ID: <20240304-outnumber-tapeless-b916970a3307@spud>
References: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
 <tencent_1352FBDA710F572F663E44B9B19BAF453005@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_1352FBDA710F572F663E44B9B19BAF453005@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_123513_528972_B35DF644 
X-CRM114-Status: UNSURE (   8.03  )
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
Content-Type: multipart/mixed; boundary="===============7504321227752206580=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7504321227752206580==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D394WKXK63iejAQo"
Content-Disposition: inline


--D394WKXK63iejAQo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 04, 2024 at 11:16:25PM +0800, Yangyu Chen wrote:
> Add initial dts for CanMV-K230 and K230-EVB powered by Canaan Kendryte
> K230 SoC [1].

I left some more comments on the v1 before I realised you'd sent another
version. Can you apply the comments from there please?

--D394WKXK63iejAQo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeYweAAKCRB4tDGHoIJi
0uoBAP9bvUqhubnsIr9kZg3/Ja1q/24TYzVui/yAyehAUYqU7wD/QSpy30wbJOYB
3M1gKYPUDXxSXfFp5qZ7mSSz9WMd5gs=
=x2SJ
-----END PGP SIGNATURE-----

--D394WKXK63iejAQo--


--===============7504321227752206580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7504321227752206580==--

