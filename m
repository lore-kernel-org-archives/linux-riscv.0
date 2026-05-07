Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD14CCD343F
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 17:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=CP0jdsCcuQe1I2VMS87DLArLO22kXr/kr/q/IpMqVl0=; b=IR2
	6t9wrdLNH93/Eqtx/sTwja4Nn3P0Bgo+Dr2+VI0gDW+KqI4l3JzVgJGZx5AYudgiHETsKVL1RNGEg
	exYRIigY1Ul77x7y41T/sNynLfEU7ymojv35aMOvNVVW+f5HmC2UE3K62DC/hm2b+oPSUUZg87kOE
	YzwFp/IeNkYhb11d1Cg98WzCLPShq7PKlMjtnB7NYqH7I3kEY6d1nzQdUM9q7cHXEYJQ8ub5Iwtfa
	i5x8FqomZBlWS/Ka0dmxX9e/r3s4J/Z/DNGbKvbe5dmm39x5Gtav2RDoFPpPrXWFUL+1ei9KMOl9D
	larp+GT7SI7iTXV16GuWbzDw+cydiDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2vO-00000004Wra-3lMF;
	Thu, 07 May 2026 17:54:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2vL-00000004Wql-49UJ
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 17:54:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E1EF4361C
	for <linux-riscv@lists.infradead.org>; Thu,  7 May 2026 17:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF07C2BCB2;
	Thu,  7 May 2026 17:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778176451;
	bh=xDacGMvvzPmsE/iO9k/VkS15Yv8TKnxQDlE6Ud9l47c=;
	h=Date:From:To:Cc:Subject:From;
	b=p7o5P/bFde+3X0B4/e3CnBLyHflwWlJqQvVLFUvnZvq6Hbn7eyHLsnaNHrDxpXcSW
	 92LWmHZvf1dFy4rKeDAaN9+vLHtNTadwB6HBwUUi0+dLQWSis4ry5tovfGeECATQc2
	 oKuFfzGDJnv6voPZF6kPJL4MqP6FZqatWDfWxgu6mBiwLtE3jpc5pOvA5vxXpCv36K
	 922p1Gz95B79a67bIn3yu6qQCDCdkDb2F1wXnMVVUNwL3WhXz0RUclD315eJfaOiUV
	 7w4Q0sjBcO1aVne6va75iHvKBJzRtyFmMOogTURs471mDIsStMbG9cdXj3sIMQ1/s3
	 G6wTzpR9GDKww==
Date: Thu, 7 May 2026 18:54:08 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V devicetrees fixes for v7.1-rc3
Message-ID: <20260507-blush-secluding-aae99d404f6f@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_105412_055813_F6312A32 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Type: multipart/mixed; boundary="===============3373972022825184449=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3373972022825184449==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KYu/UkfaUcfJ3dJ2"
Content-Disposition: inline


--KYu/UkfaUcfJ3dJ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull two relatively minor fixes.

Cheers,
Conor.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-fixes-for-v7.1-rc3

for you to fetch changes up to 0df8aa2b9aec5cd21e8c71d9cc1227e57bea43b3:

  riscv: dts: microchip: fix icicle i2c pinctrl configuration (2026-04-27 20:12:51 +0100)

----------------------------------------------------------------
RISC-V devicetrees fixes for v7.1-rc3

Microchip:
Fix a pinctrl misconfiguration caused by a erratum fixed between
engineering sample and production silicon, that causes settings for one
to not apply to the other.

Starfive:
Remove nodes relating to the "camss" video device that has been deleted
entirely from staging.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: microchip: fix icicle i2c pinctrl configuration

Jai Luthra (1):
      riscv: dts: starfive: jh7110: Drop CAMSS node

 .../boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 10 --------
 .../boot/dts/microchip/mpfs-icicle-kit-prod.dts    | 10 ++++++++
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts  | 19 +++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 27 +--------------------
 arch/riscv/boot/dts/starfive/jh7110.dtsi           | 28 ----------------------
 5 files changed, 30 insertions(+), 64 deletions(-)

--KYu/UkfaUcfJ3dJ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzRvwAKCRB4tDGHoIJi
0m+dAP4kfTtXjWW+yv2V46nbdCJLIoIsgFfHdA2Z9DxsK1GB5gD+Npd2n1NI8aB4
gmmHReY2KXLaVmkSMdrggUHatlXo9wM=
=24Qz
-----END PGP SIGNATURE-----

--KYu/UkfaUcfJ3dJ2--


--===============3373972022825184449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3373972022825184449==--

