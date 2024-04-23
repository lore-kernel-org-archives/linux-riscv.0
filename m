Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0BEC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 16:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6ERUXuNQla0/94wX2n6BUuJkoH9sRrtkDBjSpnTsMw=; b=HWLDwXgBh3vKUmbVwnsCEUzHrt
	uxaVEEtUW/KCkJS4CJ+/swoBixFPO0Ru+HyuiCerXke28RpUaZsF63AtLgbaZvYpe1msiE5yahIUN
	328P3GoHELI2MzxfjFr+UYqt+1gb2WhmczTCdAVnz0bODjZHSvk+ibeFhaMwc4y60r1588NZo53x8
	FjCS2k0J37M7BzCstrBvUEWmiAo1tonNUi5ofin4mJrvSXMw0ujI858mjz5NSxi1wTQhTpgU28h2Y
	sFcvQ1NCCUqx0fnEI/CBVRo/aIGu8wXe8eYz8uuL5SGIx9iqe/TTy+GX40+h/4jr0So7kHxiPWOZO
	sL5AmrkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzIwG-00000000irM-0Pvv;
	Tue, 23 Apr 2024 16:24:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzIwB-00000000ioj-3Dyz;
	Tue, 23 Apr 2024 16:24:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FFC461578;
	Tue, 23 Apr 2024 16:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04ACC2BD11;
	Tue, 23 Apr 2024 16:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713889446;
	bh=vwDBeno2e/iwFzcx2Jptp5EtMai4XbyUfnQr/YhkQrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GVLh/+KL+A2ou4nm3BK8fIxsTnG3oFQSbd5XmcVW6hiwzh/1+NniqvRGIQM5yx3JW
	 kBx33egZjJTAqa6A4L6pK99raX84GYy60a/TP5jm4BhCbC4lAi97mA0UpgRw571BoH
	 DVvX8iFUUNCnJOkbLiuKtBsKzXvRLgl+IpfuW6fFktxuTiE4gZ2sFcl4+qvlpLdb72
	 EekG76DBEJFWlrQxkzqNUaVgJctSF/4Fovb8e5LEIxdUv7iJ1pm3H0GkViOGPaHMmQ
	 FgKmTJJgd4ZB5JuFhPcuDrtS8airnRfI9ySbu7v2FOTS5QhAElYWszg1qbhIsBp894
	 4HjwlFWe0RvvQ==
Date: Tue, 23 Apr 2024 17:24:01 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, Ved Shanbhogue <ved@rivosinc.com>
Subject: Re: [RFC PATCH 0/7] riscv: Add support for Ssdbltrp extension
Message-ID: <20240423-fresh-constrict-c28f949665e8@spud>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240418142701.1493091-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_092407_872146_D3BFE2EF 
X-CRM114-Status: GOOD (  12.32  )
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
Content-Type: multipart/mixed; boundary="===============5553470316293861738=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5553470316293861738==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZyfNa3C9GxmtsB0D"
Content-Disposition: inline


--ZyfNa3C9GxmtsB0D
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 04:26:39PM +0200, Cl=E9ment L=E9ger wrote:

>  drivers/firmware/Kconfig                      |   7 +
>  drivers/firmware/Makefile                     |   1 +
>  drivers/firmware/riscv_dbltrp.c               |  95 ++++++++++

=46rom what we discussed with Arnd back when we started routing the dts
and soc driver stuff via the soc tree, riscv stuff in drivers/firmware
supposedly also falls under my remit, and gets merged via the soc tree,
although I would expect that this and the initial SSE support series
would go via the riscv tree since they touch a lot more than just
drivers/firmware.

Could you create a drivers/firmware/riscv directory for this dbltrp file
and whichever of this or the SSE patch that lands first add a maintainers
entry for drivers/firmware/riscv that links to my git tree?
It probably also makes sense to create per-driver entries for each of
the dbltrp and sse drivers that ensures you get CCed on any patches
for them.


--ZyfNa3C9GxmtsB0D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZifgoQAKCRB4tDGHoIJi
0gtxAP97veR232X2TcwIa1suQQaYkJFQCQQVnjXfjQbNWVcPOgEA9snlyFRloP4v
YPfhoD5GS61aDZ1CUlxZJeAcLoQN/QA=
=j5Fq
-----END PGP SIGNATURE-----

--ZyfNa3C9GxmtsB0D--


--===============5553470316293861738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5553470316293861738==--

