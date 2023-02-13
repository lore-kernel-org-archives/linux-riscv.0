Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EE7C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 19:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DA9Xdd5zvdk8opWP6Qwzv64ili8Zjn/AnaiyGtKkkfo=; b=YaCe0GjbIJt2TGG6wtLvWAED+H
	LyaKq2Jyz72gRqprR1/kBYb0B6EFQDHBqT61qt6m0gO6h48i2rM7m+YmTXTXIZe/Km7qyNtI8XtiP
	38dcIqFP+9L1idzoyNNSMbKOtQPysdOT1IIX9LAXFx8poFBy5slUdm0uESTi5BQ5TFfGrbolEadp/
	SeDpmstcw8BKR20J/Yayvd8jrjgmmYYkGtPlCzJX19Yiot/MJ4ublWUgEVDgDCnPIhYKmi1PQY+wT
	LQcgLLkkBJ3bdcHwhaMQBdBcCWDCLAERk49mCmqgJaoQa9Si7uw68DvJ54ZrzCdt0ryJiPg+9FCoK
	5j3iUwGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRepj-00G3dO-DI; Mon, 13 Feb 2023 19:49:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRepg-00G3cZ-DU
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 19:49:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E80A2B81617;
	Mon, 13 Feb 2023 19:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05913C433EF;
	Mon, 13 Feb 2023 19:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676317785;
	bh=mhvgqYfAqTjy/VKv9b0aYKBmBeJxoIq2bTrUjjXJRqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=brVXOcna0MFGLoe+hPERwo6OwYDuT73MEadplSo7J4EbFvsgokLiDws3SRCHwfPDX
	 R48jBuHv7CERQ1kbKdhib11togTXY6iNnSFt4PHRw39ZtSSg1ba0PSXm21d7l+qSwW
	 2i6K5dv/CTN8wMQCurBIClODHk5cxEJ3aD/hzaigLpbzAjjiby2oBVzgv8CQrAw9kJ
	 05H7av4Ulx+5PJ8L8ffAi5yRWfCwoN3CrJZs+Ahy3Oke7ef2x3jQL5C3Nd+lf34Qh2
	 gUlQFNO6uLVn4gidD5e5GRQUByHYXKKXQRU1H7V0sTuyO1ythyn3j1MB9b8Rdit8bf
	 PNU0zAj4cS+Fg==
Date: Mon, 13 Feb 2023 19:49:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yimin Gu <ustcymgu@gmail.com>, Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 3/3] riscv: configs: Add nommu defconfig for RV32
Message-ID: <Y+qUVbhFUrb289xG@spud>
References: <20230212205506.1992714-1-Mr.Bossman075@gmail.com>
 <20230212205506.1992714-4-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230212205506.1992714-4-Mr.Bossman075@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_114948_618324_BCE9506D 
X-CRM114-Status: GOOD (  14.28  )
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
Content-Type: multipart/mixed; boundary="===============4363187933133648659=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4363187933133648659==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ebkPMjNMgdMpUKGJ"
Content-Disposition: inline


--ebkPMjNMgdMpUKGJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Jesse,

On Sun, Feb 12, 2023 at 03:55:06PM -0500, Jesse Taube wrote:
> 32bit risc-v can be configured to run without MMU. This patch adds
> an example configuration for RV32 nommu virtual machine.

There's a patch on the list (I think it came in after you sent v1) that
pointed out that the rv32_defconfig in the tree is not actually used if
you do `make ARCH=riscv rv32_defconfig`, but instead a make target is
used. How would you feel about replacing this final patch with the
below? That way rv32_nommu_virt_defconfig would always be kept in sync
with the rv64 version.

Cheers,
Conor.

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 7123511d977c..785d438ae5fe 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -173,3 +173,7 @@ rv64_randconfig:
 PHONY += rv32_defconfig
 rv32_defconfig:
 	$(Q)$(MAKE) -f $(srctree)/Makefile defconfig 32-bit.config
+
+PHONY += rv32_nommu_virt_defconfig
+rv32_nommu_virt_defconfig:
+	$(Q)$(MAKE) -f $(srctree)/Makefile nommu_virt_defconfig 32-bit.config


--ebkPMjNMgdMpUKGJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+qUVQAKCRB4tDGHoIJi
0kFgAQCYPofRMpx2bKqIEIsrpZ9a6/XDF3qu48tQ1nCqMAhS7wEAxLDTChTgBccl
Jwsbb/bx+fBRBYIUI22Ki1sDz+k1uwA=
=YZsi
-----END PGP SIGNATURE-----

--ebkPMjNMgdMpUKGJ--


--===============4363187933133648659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4363187933133648659==--

