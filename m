Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8B8CD6E77
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Vo3IwAaykCbiEm2DurSrMPLcmKEvVTjyd1IOR97hY0=; b=S75br2ueVLcbOTured5RngikLx
	MbkZswFTBHO7633nNMG3PiNf5q+6MYB8839V3S5hhNNeBdeuQrb/CfRShrzDg9Vm9oI5ujXpImZMu
	5H2CWu3+Joe3ee5nRUxROJYQ+o0S3JPiyyoObGCMGqvsqIb5Yfm4bmvYDhDC+2wpKkMzb20dUG1OM
	m5n+Wfd6zDR5gi1L7JQGU4+es9u8MM7xfrzINADWZ5MqoGB3KSWGf7+vI+mEtcma1/rB0mI92V+sW
	mOm8uUo22DbgU0wOYsXvP20uowzqK0RAhMI3VPCx0LjDMJsLqhC4WrqvlXWGFBZDeMEHf1ZIQflzN
	ydsu9bAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBAo-0000000H5ZA-3w4B;
	Thu, 04 Jun 2026 16:44:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBAn-0000000H5Yd-1wc1
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 16:44:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D1D740423;
	Thu,  4 Jun 2026 16:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEA61F00893;
	Thu,  4 Jun 2026 16:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780591441;
	bh=un8Kxi+33XkckldocBTb2XKQweQo4BXJdzHopHXMtVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n/iNoBgo2Depx7nYsTc3KwTLA3DbIPmutalaVXGMGZ4rDCckApIPN3gYhko9t9sPq
	 duiDD3isSepnxpjFjCo0MWzyupWioN04URUH7qE4iYh/DjyycAkdEOUcRtOPODXPaJ
	 XjMuWE2Wpc9DfsNL/83AEpBSu8JcBYAHUleXiZN2GMj++OVLEUehqxDKg/gKWAvTnm
	 6HH71A+5EiZrmMXJ6eNGWIe+F79AqZlbqavdGUaOVB1rFPA9rKFGf+J1gXjKBTXt0A
	 /RV0hvSEMFJiLP3Cn52clxfbkmQlzHs6ZJtnFPATUfXilrynOPezbMpLY0i4jlNTdf
	 dUDSRTSUEMXWg==
Date: Thu, 4 Jun 2026 17:43:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/7] dt-bindings: riscv: Add Tenstorrent Atlantis
 platform
Message-ID: <20260604-vengeful-revert-f3a6bf41c2f4@spud>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-7-joel@jms.id.au>
MIME-Version: 1.0
In-Reply-To: <20260604143957.668047-7-joel@jms.id.au>
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
Content-Type: multipart/mixed; boundary="===============4636475983899773400=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4636475983899773400==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yC3GRaW3SPm4usBz"
Content-Disposition: inline


--yC3GRaW3SPm4usBz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--yC3GRaW3SPm4usBz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGrTAAKCRB4tDGHoIJi
0ggpAQDztB2cm5I3v277eJRxjrQzPIXG04r3fYSDoFINzFoSbAD/c7XKcUnaPg2G
RcKzNnlPHuJLxIvbQnEfyxQlY5JOrg4=
=t4RF
-----END PGP SIGNATURE-----

--yC3GRaW3SPm4usBz--


--===============4636475983899773400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4636475983899773400==--

