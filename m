Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F7EC5478A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 16:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=f90bB62bAJyfkYkcjyPBi5kMOsVs4DN3zKIc3YrgJX4=; b=je/
	H+miWWmjngyKxJ2Lu2XnhcJ/IpjcZYqqeb+iO73/qq8KJDRS3rlcVa5aTiSVaJSP7KCv5JoCO0VRa
	c/GCNNCAnw8HKS1RoaMd+PFqpRWyCNSvdOX6G6YdKC95vEQhXa0nTqvexi6GqCIjFVO3XCWQE1Sod
	OJ1hSUYs0vE2mlvF5GixxYPUP5/a8PkMEydm5LlNw5oVOAfNVwpYjEVkSbgj1mnT6qBDh8rCnsqd5
	yrxlmzqY+tnC8HKTHd1UDtxoJtjoBFT+Wbe8tHpo4SPQDWo2bV1WARjVJ1kOeU+WPXNoUvUCnSLsZ
	7FRI33A7MLPMaRafwHQHxrL3AX0n4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcpi4-00000001mSE-36CH;
	Wed, 21 Feb 2024 16:44:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcphz-00000001mPO-22pc
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 16:44:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9179BCE1E41
	for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 16:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009E8C433C7;
	Wed, 21 Feb 2024 16:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708533872;
	bh=adPCF7GE4pA1OZWsyJfWUEapm8IoQ3KpCeHzSdFyfs8=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=H2r5ZGbd7dIT1epkPmsHO7eC6iFBmFOGdRA6K8FfYaih5RPZxKnX5r33BMYS2uhZH
	 LPI+SP7qZqgN8ZR/tGRWlisG5Esq4NLZBvvLSanQ5bO5Mo8OG+GujDiNe/PBc+FZd8
	 qk5DJUCT2tf1RDGUcvFbYEkt7bIM4zkfIZ54/sdzoX+RPjGWRJshP7ebz0oHmElDqz
	 ZdR/aB+1PhLiwKeDKGTlRj6l4VdbNf1muOhMTHUYIpe8w/v8pYi1Pu3dHwtITnMRy7
	 Mui0yRlW8kQdLLvc6b+idNnDXKmRYUAZMHp/kflL2ysxx1SOAHvg0ikw7bs++w1VTD
	 vu5s/7+4Gzwkg==
Date: Wed, 21 Feb 2024 16:44:29 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V SoC driver fixes for v6.8-rc6
Message-ID: <20240221-irate-outrage-cf7f96f83074@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_084436_488108_21C60E7A 
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
Content-Type: multipart/mixed; boundary="===============0924550501622682466=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0924550501622682466==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ek76tPQc7fRP6EsS"
Content-Disposition: inline


--ek76tPQc7fRP6EsS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Arnd,

Yet another 1 patch PR.

Cheers,
Conor.

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-drivers-fixes-for-v6.8-rc6

for you to fetch changes up to 6dd9a236042e305d7b69ee92db7347bf5943e7d3:

  soc: microchip: Fix POLARFIRE_SOC_SYS_CTRL input prompt (2024-01-22 16:39:40 +0000)

----------------------------------------------------------------
RISC-V SoC driver fixes for v6.8-rc6

A fix for a kconfig symbol whose help text has been unhelpful since its
introduction.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: microchip: Fix POLARFIRE_SOC_SYS_CTRL input prompt

 drivers/soc/microchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--ek76tPQc7fRP6EsS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdYobQAKCRB4tDGHoIJi
0n8eAP9xmMmRer5fvXu8n3UM7MLdLzUeF9tBKDcZ5J66HbO8fAD/ZOegM7TrO6tB
VM0v61jFWBTT7S9MEN6A/EwAwIA60AE=
=JHto
-----END PGP SIGNATURE-----

--ek76tPQc7fRP6EsS--


--===============0924550501622682466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0924550501622682466==--

