Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3351C5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 17:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MppwYYvK5AlNsuJ6q4Xt4Fw8/AkGD1QeL+v9ujozPo=; b=UxeBFHF5mDoJHTIbrxtfRUBudx
	Q18gFfQKoi1uOONfu1HBL30LAJ0+a27aIDSqrVmEt2Xw5upz/0zDMPL9o5uLOlT/+Dk8u8aqls7Fu
	7uTwu75ii3N4c/pIJtgWVJE+QHtUkJOK3rZP90zxdHBCeruKaBOHvF1D1WR2a2vNB+8In49p92Iet
	xGLTGnSU/G03z63XVE98urXh/4hrlJg+7WwkQqvoxXstOHtwKcLqJyZwXQTDMMEZ3YBYsZNvJ68ev
	DRCVN9E84xzYwjcoBa/iquXRlECN1lzcVU1xg9wM/xPPLsBRvUofwuuQ/DlzOrP7JkW7+gzPcxb/8
	28uRr93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEwOy-0034cd-VG; Mon, 09 Jan 2023 17:57:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEwLs-0033C4-A6
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 17:54:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8776961255;
	Mon,  9 Jan 2023 17:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EA3C433F0;
	Mon,  9 Jan 2023 17:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673286866;
	bh=ouqlx8GtcRbTh2qvs77h0nDGF3C0ShrvNQhaxu3JhEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PGewov7Zum8VwN8zfqe3itpWo+MPuj1+EIsUDQ2dLNnrWqu91dgUX7aZFV94WMzdp
	 txp2GUYVcUxas6MfpKQC8zgjgKhMyrhS2tbDSFezL9go3NWVmRYKGr52aVm+n9dO/3
	 aVod6B30F1gAUcDUibhsmukSrNiSJKaMP+x5XCXrRfcIbEG0Omx+5sbALb1LuGzVkD
	 4OJPrFUEjn4gslIcxluiNzZ44GGW3dqShSIhaM/HQTtk6xYqVIPUqHup6qYwN+zztv
	 r0iE2suS6Db37sUrs18xZrFQEdR1tbfhxrdKvd7rZSATX6QCrjLMkAGU2sTlYuDh7g
	 zkuYDLVjKntYw==
Date: Mon, 9 Jan 2023 17:54:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: rng: Add StarFive TRNG module
Message-ID: <Y7xUztHGvc/j5VHk@spud>
References: <20230109165249.110279-1-jiajie.ho@starfivetech.com>
 <20230109165249.110279-2-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230109165249.110279-2-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_095428_431547_315CFFBF 
X-CRM114-Status: UNSURE (   7.90  )
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
Content-Type: multipart/mixed; boundary="===============0826471551696652435=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0826471551696652435==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mMDiE/m6P+Qrq0i/"
Content-Disposition: inline


--mMDiE/m6P+Qrq0i/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--mMDiE/m6P+Qrq0i/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7xUzQAKCRB4tDGHoIJi
0qVXAP0UxXRirQU2Z4dgTlIcAFAV2RQWkdEm0PYG4jzntTJ57gEApAszKyseZMpS
aq+Xvm5rWXRTEPj9Wp1gfr29HM6tPA8=
=T3G5
-----END PGP SIGNATURE-----

--mMDiE/m6P+Qrq0i/--


--===============0826471551696652435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0826471551696652435==--

