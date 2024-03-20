Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD40BC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 18:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdqFbbJ1Npz7PmH5XY5b8bk+BoSl6roTPCpSrI+NxyE=; b=lWNK4VGOsd+17wd0Mqv3hz778m
	x6aXUyI/6T1Xfqp6nsioTHil2j8QB3yCqlgMOYLTN/+SHjLmgtqll+sGaAogZ8FckzuUhxbD7Iy+r
	QhIdtyM5U5ypPErh08Rh+p+IbtWFQyapiFbr0QzJSUTzOxsa8U3tVDknH2G4lg6fflbPjkVKq91pR
	W3bmS+OZMOFz5Rcvm0KcW4ilNT0jkYCxBoAR3NVWjxUtjdGPO3qeurSCyu2qLzi45+NT9rH6rpBk7
	5LpjVZhNIeNYsCsa/1TfvuibMgywn93BGVIXJ7WPWP79hZbD2A811NnZ7bCTs1EA85pfEv8RnsdJy
	/VpIEPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn12h-00000000h60-21SC;
	Wed, 20 Mar 2024 18:52:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn12f-00000000h5Y-13qI
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 18:52:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 72FBACE11E9;
	Wed, 20 Mar 2024 18:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3383AC433C7;
	Wed, 20 Mar 2024 18:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710960718;
	bh=d6TEWqNHGarTNFqrsWL72liC44WwQujen/XgSqv+mE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tJgEulWZb6a9Mxsm87VZj70L5vi/qsM07l8UWwwHVxy601XWOo1CL64DxxjXBM8eS
	 iRHp+MgvuzrIojxYqpRWJorzS2mkyGPklEIQNbir5ZfwMiEXpUqvwF7+sMS5jukW+J
	 WXA6qqWF2f6gloX+W6AgF2BSf4StcZeg50qhA9ruELpijdc7QmVFngiCIlQBrgoX/l
	 n6oqoLsQQsPa1ulDvjIDDz09b5xV5x8ap+d5+t+GsdNajB/eDvjjOo04zLcORmFBP7
	 0GHbvASk59MiKYEiBAP8PSI0+DRQIkyV6waMfPGVrRNAm0lIeq8cuOsx+y1sqfN27l
	 bgSpcDiCedT4w==
Date: Wed, 20 Mar 2024 18:51:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/7] riscv: Kconfig.socs: Split ARCH_CANAAN and
 SOC_CANAAN_K210
Message-ID: <20240320-harmful-carpenter-40a7de0f273e@spud>
References: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
 <tencent_6F35FEF31908DE6AEB385AE30AC658863C0A@qq.com>
 <CAJF2gTS1-VQP=gQBx=SoUWsdap153EGOObKVn+2L7=kbP2CqFg@mail.gmail.com>
 <20240306-scowling-mortify-9b427c80e8ab@wendy>
 <tencent_91E604E3B4D51DA37045625242A81B07F909@qq.com>
 <20240320-ideology-pasty-d3aea07cc519@spud>
MIME-Version: 1.0
In-Reply-To: <20240320-ideology-pasty-d3aea07cc519@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_115201_495067_2EC29EF7 
X-CRM114-Status: GOOD (  11.09  )
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
Content-Type: multipart/mixed; boundary="===============8319038766368068346=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8319038766368068346==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yFaj5iez9WvDhwVq"
Content-Disposition: inline


--yFaj5iez9WvDhwVq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 20, 2024 at 05:39:14PM +0000, Conor Dooley wrote:

> I got a k230 board (the canmv one) so I should be able to test this
> myself before picking stuff up.

I've taken a bit of a look at the "sdk" and appears to be a complete
mess to a non-chinese speaker like me.
I know you linked a copy of opensbi to use with this, but do you also
have a version of U-Boot to use with this that is not riddled with
crap and will compile with a normal toolchain?

I have chanced upon Courmisch's repo that looks significantly more
usable than whatever Canaan have so I guess I will use that:
https://code.videolan.org/Courmisch/k230-boot

:)

--yFaj5iez9WvDhwVq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfswSQAKCRB4tDGHoIJi
0qlkAQC7FRjew00zC3r7BNoqFE00Z9wOqBZuIoF6dxLOsByqkwD+K9VLMOVa85Yz
5lMzqwe7/O9GkMdlnk6wso/HM0S7Kw8=
=jLB8
-----END PGP SIGNATURE-----

--yFaj5iez9WvDhwVq--


--===============8319038766368068346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8319038766368068346==--

