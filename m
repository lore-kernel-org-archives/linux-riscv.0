Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9B2C43327
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 17:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TWC2EENleNUXzG4GmrGzaBy64LzXJJIkiigeCTfVKE=; b=FG8PFfcLIB7rZMBY4p/cNa2KL4
	BZuKqoU2APA9LM0vJ0y/uwPn/tvSEyaU4aOVtVwqWq91TpRPN24qIxp7ViwtBvAlm3lDR64NmH4fW
	g6VYPnrTMcAPGZm9lokDaYR2FWqJghlyOAT8AImaZUypa3lLKnEn1pjAkbZ6PIgnpUzb3D0RS9MeS
	z4JAL77ccDV/CyLTT7tcNvwkKVmbQ2cQ00BJ0JDstMdwsorFfBkl0yT2lVVQwEwCeIWV1dPMM9lzz
	zTSMD5tbDuZCQ+7zt1u875vQQnpkqmHWNvMCRl4OpyLpltz9PmFILg+xNLON9JAiX/+xTlPLPdTAb
	gOxhTkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webxb-0000000HXy5-1jUD;
	Tue, 30 Jun 2026 17:09:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webxZ-0000000HXxn-2jq3
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 17:09:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 160CB43710;
	Tue, 30 Jun 2026 17:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3D71F000E9;
	Tue, 30 Jun 2026 17:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782839361;
	bh=ZQ463BWcNQ/hsjfVmxHntb0h6n+WMBn6b+KUF4VdkJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OJC0kuXFbpCHeFcfZ07jJhUKplyTMiBXEM9OSj/u9f8yTTW396S7BV0YqTO9NPtq8
	 37RTHUZWNEzm8WptAvGvWC5kupdrZ5e8ctKl1It0Bqasiaj+mRMWUKZYdI9PXV+bGI
	 ACPqkKZqpTNEyiM0b4FB6na7X8IFsR+zOJY8XSJ1SDPwchr7vf5LmTA6q2/Q7TxoxO
	 wnhXc05th0hS5uLLZQ1oyeC3xxxdKrwJTqdTPxCMKo9DXuFnWkSRvUYAneDLCVZNqK
	 7lXZxopgwWoB0xOdGrNNiHnMQP9g0958Z8zFcR4dpAjjYxt9YwJMbWIHvjNRV/4JK3
	 Ejizw6JINVrHQ==
Date: Tue, 30 Jun 2026 18:09:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: soc: spacemit: k3: Add clock ID for UFS
 refclk
Message-ID: <20260630-bullish-backed-1790f501d5c3@spud>
References: <20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org>
 <20260630-06-clk-ufs-support-v1-2-cf7521d1d0fe@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260630-06-clk-ufs-support-v1-2-cf7521d1d0fe@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============0075359708776717434=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0075359708776717434==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="35b+5CeuJkFuBDwY"
Content-Disposition: inline

--35b+5CeuJkFuBDwY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--35b+5CeuJkFuBDwY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakP4PAAKCRB4tDGHoIJi
0nL1AQCAysfwv7mxL9RNVgQOqyZA/A0wbsLRrMZcK/NPCNXj5gEA7gWOJunVrkxY
IOk+VgtGB5f3YAg2sJPX5py6JGPkVwc=
=Y+s9
-----END PGP SIGNATURE-----

--35b+5CeuJkFuBDwY--


--===============0075359708776717434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0075359708776717434==--

