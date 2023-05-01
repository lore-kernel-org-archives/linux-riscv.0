Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCD8C77B61
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 11:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuuRv17d1gld0rIJnYqLZpS5Qi8PvvsTfD2CvVDcOB8=; b=o3dE501nYSAtuRyXr4MC3zdNPV
	tNsergyoLlmaGa4+qTxxJc5AvUO/3ly0cItizK4fIVTgMq0CD3pBIy/h7VbdLIS9IxSi/b5eMcUpn
	mh9+NEmfiprNgcsRIMHoK7F2To4BSm8dNcZ41gDhyJh7XfLdXJjPKSuZvCIqMEsuZpiinhMKsFPv9
	4JwmSuzYOLmMm77IyW/6wYnHRWSLvLVjnDL3U9B0Zbdd0V7wMouGzij7nDqX8KXU25DAZ/PXfwZph
	qLdHkWIefHamI2TsjQnxVskGuF5j7NdQDM3kjTAxS6/SFPHNjpf3JKil/wedfCyC+kEahCxk4QFrA
	aNCBk8Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptS4X-00Fmb6-39;
	Mon, 01 May 2023 11:52:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptS4V-00FmaV-19
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 11:52:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B03960C98;
	Mon,  1 May 2023 11:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD65C433D2;
	Mon,  1 May 2023 11:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682941915;
	bh=PTUqml0KfqhJWIeXuByhnhJKI3zhK3+wmQdyCWWC3EI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LcvXXDaVbwhEyH6POjahCb0dacnt3BwqfxUx7gQUYEPMUDfSxOTc8jao38qfMTJOp
	 65gmkXiMSxb616qP+iMTrqyXG8pm9N6rLc0kLPAfz1T8elAmSzRjF1L14NKCh8GyZ0
	 WZboT+B4ZOycuS+ZrvBUssys3U5PDgQxqFXRzQHeAFs3nxOKi5ElYPKGY9E5mwNbLb
	 zgxmRqGGMQUgYwCSYj//GVzOITdRSrqTWdLzxouRKE01cBITvL9g8DhOkN16t8jK8N
	 pnoazmVlJiPgvJvWMEZ1xNT8rkpaVVNZ7jAU3o4m1gFGLMFFlkFBid1ndR0vzQkoRl
	 QBvdpQx10Gdug==
Date: Mon, 1 May 2023 12:51:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Wende Tan <twd2.me@gmail.com>, Soha Jin <soha@lohu.info>,
	Hongren Zheng <i@zenithal.me>
Subject: Re: [PATCH v2 1/2] riscv: allow case-insensitive ISA string parsing
Message-ID: <20230501-chosen-aliens-31d8bf864c22@spud>
References: <20230428141601.678489-1-cyy@cyyself.name>
 <tencent_BC90DDC6093E3E41246D3EC73F5CAB189007@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_BC90DDC6093E3E41246D3EC73F5CAB189007@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_045159_457320_8DA93D4E 
X-CRM114-Status: GOOD (  12.70  )
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
Content-Type: multipart/mixed; boundary="===============0169478547804442898=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0169478547804442898==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1JCA6WPwtEwqPNSb"
Content-Disposition: inline


--1JCA6WPwtEwqPNSb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 28, 2023 at 10:16:00PM +0800, Yangyu Chen wrote:
> @@ -205,7 +204,7 @@ void __init riscv_fill_hwcap(void)
>  #define SET_ISA_EXT_MAP(name, bit)						\
>  			do {							\
>  				if ((ext_end - ext == sizeof(name) - 1) &&	\
> -				     !memcmp(ext, name, sizeof(name) - 1) &&	\
> +				     !strncasecmp(ext, name, sizeof(name) - 1) &&	\
>  				     riscv_isa_extension_check(bit))		\
>  					set_bit(bit, this_isa);			\
>  			} while (false)						\

I was doing some poking in this area the other day & noticed that the \s
being misaligned isn't just the diff's fault and they are now misaligned
in the code.
If you are re-submitting, then I think you could align them.

Thanks,
Conor.

--1JCA6WPwtEwqPNSb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZE+n1gAKCRB4tDGHoIJi
0v6lAQChAe/yJ4cHi/l2cp8YBucpqz62jqpHexJm2U3KsYSaHwEAylnjecClaueT
nQCcOTduxbsZRr0VzwpZiHfG3MGSRwA=
=9WPD
-----END PGP SIGNATURE-----

--1JCA6WPwtEwqPNSb--


--===============0169478547804442898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0169478547804442898==--

