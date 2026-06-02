Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57581CD6E57
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 09:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=exU+ysMfresG2yw/m1wN4fyZ6rkZNU1CalsAxtuT+PM=; b=cIb
	UlptlVggNr3fpAkXlwfM/JruaIp7KjDsPMAYCVMQ61tBcGwV+66/tHnlLrGN+6W3W1wB/FBuTUhg0
	LHrfj1QErPwshRyvPVGi0G2Q/yE+l9McDwhHQHqvEUkGMbsU72b0Pdage00H2kd+K6bKF17UFo4kx
	NLJ9m28DIWSWRNpimgJ6n6yKRjvQkzmlbypkTSH0eQymgLz+nZEtWIwb4eJVvwE1o4JcpNA3B7l2G
	Me4iAuZ1dmvxlwaJ6rAf1l936cRNhMNURnK3Oq8c08dT9a9uz0NBlIPvYegiyS9Aop5e4LzkQc6Ac
	YkuYIVctHjWXP/Kqhp18rf8HiqgZyzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULCb-0000000CdOk-2Vbk;
	Tue, 02 Jun 2026 09:14:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULCa-0000000CdOb-13QS
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 09:14:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 609826001A
	for <linux-riscv@lists.infradead.org>; Tue,  2 Jun 2026 09:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268771F00893;
	Tue,  2 Jun 2026 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780391663;
	bh=vtlReEb+fitYDnn2AECwEnIKcGiaa/0Qcud+2B4xY04=;
	h=Date:From:To:Cc:Subject;
	b=XnJbnEBnEikSpe7xzBasBpNsfePZbYmDD4XSHbcEHrP83Paq0aICBPassN36RJwDw
	 0ysgoLJaqlJyTcLCcwGSXQsFYXDon3yLjs/tSHkejW4v+ert5TECJSllmdmxaR9xhi
	 g5noy9dLAx1CY8dCAAHDoPtaU1WBQlmDiQstgnJS5D/OzlhjjNihvGjUUDF0LIYlrf
	 9yFS6gajyPfNfWZd11etmuwb8Ct9mjLrzcSO6nTLaWu/47PwDluoS8Z/gBIioWLqDL
	 DHMMAZGjouOzjaKuyRhohAfnlvpgn6cuTZMwpYz3xfb1a+djoSY4OHD9WNo8AVjQ5v
	 Z+37HR+32R4hw==
Date: Tue, 2 Jun 2026 10:14:20 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V soc fixes for v7.1-rc7
Message-ID: <20260602-brought-impaired-e5cc81043a9e@spud>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============1445547740222249926=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1445547740222249926==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kZxeEu5T5ohTJHqe"
Content-Disposition: inline


--kZxeEu5T5ohTJHqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull a single minor fix.

Cheers,
Conor.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v7.1-rc7

for you to fetch changes up to 75ef233975589d9a8c88bc8822a7c725c71ff650:

  soc: microchip: mpfs-sys-controller: fix resource leak on probe error (2026-05-14 21:03:34 +0100)

----------------------------------------------------------------
RISC-V soc fixes for v7.1-rc7

Microchip:
Fix a resource leak in an unlikely probe failure case.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Felix Gu (1):
      soc: microchip: mpfs-sys-controller: fix resource leak on probe error

 drivers/soc/microchip/mpfs-sys-controller.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--kZxeEu5T5ohTJHqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah6e7AAKCRB4tDGHoIJi
0twHAP4l+t/k8RmJleiq+9W6StNpGFdjnATo/PGRBbTCqDVbsAD+O2ZK/BQCpOVJ
IcTS2uJAv/rJOSxEcUHmrQ/JqMzSbAs=
=V7+B
-----END PGP SIGNATURE-----

--kZxeEu5T5ohTJHqe--


--===============1445547740222249926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1445547740222249926==--

