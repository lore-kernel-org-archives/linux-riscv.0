Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D276CD5BAC
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 20:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBTxmeosNF1L1pW2KdeZhVrZCgQ4cmkKl406CY7zSqQ=; b=NDMsj901kF4uV4wEqU7iru9zxi
	6GL8GwsXc8ral8w5FtMKMhG1qPmBIUkDT+yGgzt1Ku9pJIY4fgb7j/HQEtmPmhDZlXgVe5eluuqXc
	DM8I4xZKMRv3g8HQkGZmzJ86W7dRym/hOFc3kdYhCSErclQ/A781uw+AntFjgl/gTrYK5aIyGodK1
	CKCvKPW/kV7m2/u2WFZLkAaNhzc04fssZzhybNUa/+nObsqFjg8w8COJv03N7K9xYyvAqg1UMcZDT
	seIuZL6FyJpqeKQjmtm8/CrskE9t3qIacwKbpZiYq5pwm3U06wfXfnUNCK88xIs3YBC5x6qmv+qyx
	yWFjrsxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ9hH-00000008z6C-14HQ;
	Thu, 21 May 2026 20:08:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ9hE-00000008z5j-1j9K
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 20:08:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B9FB842AD3;
	Thu, 21 May 2026 20:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301021F000E9;
	Thu, 21 May 2026 20:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779394123;
	bh=LX25OAouGCUkwIUsH/CgO/KHGaNp0WXm0L13yzUGE9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i+QvHvUJ5rP8KILkj9S0qJ9caOpGy//mbvHRkbux0e8U4epJEEt7KNa36cFXd2y4E
	 pJXmadLuJaipUja77UccM6WOs9EFLziCnx7Ywj22Evdodrw7bDkmsFRIxMFD1OV9Fm
	 iqQTUfsy5Uv6j23fA+jYUp0SztnvQnnYD8tIRPUzok5Npxm+mxqAdE/smkFVFgIOLe
	 F1xeFXwSdLspcemVUWsVjyZ0Obi7ZbMLfeMtUgbixDUV7orDDPwb7PQedTdu2PUrnO
	 KeDG+V1gnbtHqntN0up/OR0p7CGMIoLS+ZFfPI/J6QerY52D62m06ab/xaOnrBlU/q
	 qd16erxI2ktFQ==
Date: Thu, 21 May 2026 21:08:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>, Joerg Roedel <joerg.roedel@amd.com>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
Message-ID: <20260521-suitably-garbage-92893a650399@spud>
References: <20260521170652.1880662-2-fustini@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260521170652.1880662-2-fustini@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_130844_468284_BF4C8045 
X-CRM114-Status: UNSURE (   6.16  )
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
Content-Type: multipart/mixed; boundary="===============4090549345167478195=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4090549345167478195==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8kRpkwagpEPKzIo+"
Content-Disposition: inline


--8kRpkwagpEPKzIo+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--8kRpkwagpEPKzIo+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag9mRgAKCRB4tDGHoIJi
0kkfAQCEPEV84IChw1+tVxeKSuSuVeIGVSqqvtIut5hq89RTQwEAvB09+rxsdwVY
CAyXvLRgCDpQRJz5nDwmr822zC65+Qc=
=4J9n
-----END PGP SIGNATURE-----

--8kRpkwagpEPKzIo+--


--===============4090549345167478195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4090549345167478195==--

