Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ADA606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 06:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=21cZqIyV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=KcAjQ0Si
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DWWYc2o7hAZvCcSqB+XMhf4+c4tiT/d7p12WQmtF8XA=; b=21cZqIyV0s9MD9bsY+8Rx/jAKv
	pJDeyKp7gY7uzpGZ4RiaRl9ZMfWKYBY8BwE3XgbXZ9JKdsQDjMMCxPn+Nntzk0oEEO0HXK0NBfOmO
	EbMSJ0trNqWMSq4UUCc6j+EqozdbpWi/FloGZPhE5nQBhZ9X7WuWSvQL6mNFMQL75o4I12QCH0fGi
	/9GFFh9925pVQjCWZKwwskMmgZ0EKFW3LKHnwUmpZQZSs61nXifR+JU7ssOw14inQSKc/wwbHoAJh
	aONOB0AnIS+kixfbG5FYeHLPXlbVAsd38+5/MJzTXAF56q4N/7r6975nK2iYn9xKS0go4sbk8Yqw5
	vzuQ/MWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWp53-0000000F06E-3DaC;
	Fri, 27 Nov 2026 06:05:09 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWp4y-0000000F02L-0tk6
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 06:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795759445;
	bh=7MogPv/8rDNnLROh2lJqUbjxxMwzFQktEETGe7LKoj8=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=KcAjQ0Si0uqyawIDoZlyH5MMR3Cj4jedNyeUQLbcacXQb87gJymIiEnk7EHw+WFmN
	 g7eej1bwZqfqtsV0Lakx9m1mMgisIwCbnYBMwSwut9+pAYU+jjbWK0EL8brtsnpI8e
	 qYI0OzIKwHsxZt/SA5ptBY/kCrW1SyBQiekD/qdc=
X-QQ-mid: esmtpsz16t1795759443te5c7fabc
X-QQ-Originating-IP: w9ScYnFOG3tL2kivETE6oRptnE7ii6xkMYvcHsfyRpU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 14:04:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5566147713049927069
EX-QQ-RecipientCnt: 13
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 27 Nov 2026 06:04:00 +0000
Message-Id: <DN5RLE33ZA2I.31YRV21UEQO2T@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] riscv: dts: spacemit: k3: Add alias for MicroSD
 Card
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
 <20261125-09-k3-dt-minor-misc-v1-3-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-3-dd887a8eb326@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ne6A6eRT3vSHjLBydMUawiFpAPx1wjo4FjP0zt1A++O0f22aAFsb+WCq
	pNiYYrWHNbABgGylE4FxhVKSJvQJcbTRlGc78OAtVxxPljcwqvMzxT+G4ROOjTqoPmRxjZ1
	iGQ1cUS6LN9oH/UHm0thEQxB2u/SncJQTv89gjnublLr8cIx/QvI1mpkHfnWQIjZl5GNc+W
	z4rOfjeoqvUGtBcF8suV+eocrlx8dEoiVwGRRVx9li9ohf0VhuomeqCGuIzRmA0EGXBzGVY
	qMB11Yt2DbhXTAsC+B9ZkxajOnc+cuuQQiWMS492UYYITq7arWcS2lJPnumhwFSxO8IezVs
	828gR3H0dctcwWxmwPtDW3EeTt2wnyNn6uQhSoPt+5OfRVIaI1tvXKKN7VPKsAxty6AGfT4
	3xC5wa6YotCeT2vPCJBIzghrr56ksJEcEyW0oAxck8S/1tYuOL26Nlib1BKlnKOXOEocIvw
	7IWAqfJRtAOkucNYFiGKh1Q9SWvmsgzDZIrVLoWk38kSRYzRCwm76pit4arah/kOlT5DkNs
	xSY6Zc4kMnvnk1xp/2b+6+0gXLXDHt5ylC6vLfkEEdDvUZ31s3yeUURKh7XAwcdONwmzU71
	4+S6ijR6iBqi4aQGoef0QNMEEACNnmEdsEgcuqXQDnQCZ5oIKXg9r3euXOMESKTwjfpfAsa
	C+WN2LmD7mx4nIurP8l6OgylfbymA6UXNUX4g7Ffm5Kr85eP0TukqfPDDOHcKwKznXFNUXk
	Rsd3sokgJnLZRGbGuNs/e5IF6h+nd+8il2FLNWKqqfGHjmtsU74mZ0CfOEoNDzoskjrRUUd
	Z+TQezRI7wzOQ32aACh8zk+XMJhumWfhRTjcveAuu/Q8Grb76mw+udQZX9ZS0v4GSu7K+x9
	Ha351s8qy8zdzLqiNLOlttm1SPuKGU4c7LH4ZdPaQ1r9167tmPM11HUvzTjU7KG9F1P3Kv8
	HF9KDKwwMw6f6WdMLvzKiSGTn3rG+uz0F/63fKMLbBsqyFu9QP/RGjdgXaRNEdtGYRJ0l1a
	vghvBZFQW+E5WKPAYVA6i7xkExT3D9umLTcnqr3oVV50S85TeOBK8sxRHhhT5HDaJb4QQwy
	il5ukVL76XiRJSAykEme0VR7wf32SzZ+3Dk2fFl08jHTn+yzObmrRI=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_220504_904383_4D1BE4DB 
X-CRM114-Status: UNSURE (   4.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5625874713599812974=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5625874713599812974==
Content-Type: multipart/signed;
 boundary=511ec13c2b7141be0104885f7a52a1b4dfa31b6f2847b9143b414700b4f6;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--511ec13c2b7141be0104885f7a52a1b4dfa31b6f2847b9143b414700b4f6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 25, 2026 at 7:46 AM GMT, Yixun Lan wrote:
> Add an alias to the MicroSD Card for CoM260-IFX board.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--511ec13c2b7141be0104885f7a52a1b4dfa31b6f2847b9143b414700b4f6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawkdUCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/ntwEAta30V/NVIohc
hMoxmKN0JKEAvLmQLLUpsNQ2ycAEFqwA/jDC2OlAs1T+oRQtn9mzwDtIxwKOZTqN
V0t3Xn2x+akI
=E6T9
-----END PGP SIGNATURE-----

--511ec13c2b7141be0104885f7a52a1b4dfa31b6f2847b9143b414700b4f6--


--===============5625874713599812974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5625874713599812974==--

