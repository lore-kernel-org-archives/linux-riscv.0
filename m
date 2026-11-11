Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C917606A33C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bTXzMNSp;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=f7+rYJlO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BmYLkYeND/HiaVqv3NZKWra0pwEQIj4yliO9BjqTExc=; b=bTXzMNSpOeD5nBf2THDOPD0ks3
	wxKppoI9uU6ZzYMYABX+ei8rV67G+EKRegm71jXL0hlyUa6OSLZEmcQmckRiCmUqhdnEU9Hs/z3qf
	YTKUoe5My4UghKcRvNngKZvmc7+uYaZFAQ+aNLohoyC2m3cKXr7U5gD1qnKiNdFSu5CICxAY/PQ+l
	A46FaEl6zC/Df5wcUDJLl79QnuI4lkX5IeiaCBs7cIps56YLReXUOtci72pDQAAdtLSKKd6Vy4djr
	bTVp33qUfvZR3cdqgYzHkVwlg4XwpV7G0QHW1JHQLUHVj4bUwIm+j/vUifK5JbRAh87yYJ72+gYeQ
	XrPqtVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR50H-00000006FsI-0tK0;
	Wed, 11 Nov 2026 09:52:29 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR50B-00000006Fou-0tVn
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 09:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794390708;
	bh=GWi9Mrn0MCeiOZQc5+4kfVX0EHtk3DfuQOjdPxmcFTQ=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=f7+rYJlOFA26NTV0INBR35r0W21EOZe4WDucyr825KEFuCV1tXwNLgeCkfWBesNgj
	 OaP0KKJUiu4Y5UgsgNJIIHnyZg15a2FiSX87V5z2Fa4vZHpf+1ST88QJDW5t4++MNa
	 6KJlGjyANok5Rh/+YwWbgVe9TB7mE4viCdr8qmhs=
X-QQ-mid: esmtpgz16t1794390706t35ab9cf1
X-QQ-Originating-IP: 7/3GNwEBAt+0SADWshzJh1j73v8R28IgqdTX80eo1hM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Nov 2026 17:51:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6762194668848470308
EX-QQ-RecipientCnt: 20
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 11 Nov 2026 09:51:42 +0000
Message-Id: <DMSAF0L4F8ZU.1R534QOL67WB5@linux.spacemit.com>
Cc: "Vasily Khoruzhick" <anarsoul@gmail.com>, "Alistair Francis"
 <alistair@alistair23.me>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, <linux-bluetooth@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Conor Dooley"
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: net: bluetooth: realtek: Add
 RTL8852BS
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: =?utf-8?q?Fr=C3=A9d=C3=A9ric_Mah=C3=A9?= <frederic.mahe@cirad.fr>,
 "Marcel Holtmann" <marcel@holtmann.org>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261111094557.443481-1-frederic.mahe@cirad.fr>
 <20261111094557.443481-2-frederic.mahe@cirad.fr>
In-Reply-To: <20261111094557.443481-2-frederic.mahe@cirad.fr>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M83iEva+1QDBUBgdA7sSAtJcG3q5n/Zygl/jupVTurhnL4J4aBVtHSbE
	icNuHZVnyuKnrEe8xPNF8sjgyZtuyeDzcEZ0hebOWObGvoTG9OgrMG778xKPKL464aFiRux
	IoBuUmmOSZ47LZHGIvkdvdLuv/rQIBu4xw02iNIWRy1cnMppQSIwZZ4ZRY8wKZkln4iqDWX
	j3EK6Gjio29t3T9V55wvT62Q3dcppbiGhQ5g44W+URE0piS3QJVakXdZ9IH8r5gv0VlqKzQ
	kyby+dpDxy40j4+DuVLlkisrw0Vn/wfDU2KbpEGcfpqJKP5RGUlv4OH01bbE5uOETUpUMuI
	EIgLK+Y9kPim3QQvXhdUXZZXDp64ttK1z+QnL6wXae6oWhCz4BAkPZN57kn3kXElG3Z5Lfi
	rNkwe2B2/cVaVQZUuqyz7Pt2yEg+XGao8C3E2sLI9g3zAX1G1gtcFIe4df4Yaw4IetWg7PN
	oQnbYjygK3OOWeLitGY2nFnSstepc7C6UArtns4XlkeMGYzMEReFmKxQ6bM1zHuV/xAtl2N
	E2qu08efNj4RAF74CDMQdD2iTH+EuY/9pgEnWJsiJIaSytGzDmLaix6II1226hB5oF6M8Qz
	Zb2moevaDdTHMv+Ljb/4S8hc/ghEHx3u6iH6HcsD3fR1ANAx9Vd4K88Novrk1SCm0W+vin8
	7Cl6itjMSB/3BhNmf1bOXIwpTpI2C0yMacu1eNYB8CpqBcK07MUdI2MrV8Gvh6JdOQysqM0
	3hlHx9YBAZG8rGrvPfMMBQYS6r8h7dw8mcfZH1Qz1ZFEDpYxDrfLnOuCrWN7XEwbypZEWB6
	S1/xIx3e0tuB6AsahnqXkRSha5KyjF48t2jwVtrybsMPqopnEYHeab8UWQGI3/ruPg9yV6v
	VrdJFnNTSscLXfeFgfd1Yz3W8KoDGH2Fc8tVwJaSI2IQZpyfhnschD5K3sS7qK0PbgZBU7V
	w+HghMIBs+cugiPWEMd/z35Ril+6DUv45ePwEHq+l7vwjo97Vx9/+p3n0hRYpgquNxeP267
	dNzhlDCNG3wEHwZyPMcjgIyvZUFIz154GfvRnU5l8JrkgapwK5vHpGte+tg+KhckvmmLhwh
	A==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_015224_094646_6805F1DE 
X-CRM114-Status: UNSURE (   8.78  )
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
Content-Type: multipart/mixed; boundary="===============0931666547520044586=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0931666547520044586==
Content-Type: multipart/signed;
 boundary=25e53c27b1c6852924479b566cbfa263ebbd1c7ea96f00b6a8984ab5ea2b;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--25e53c27b1c6852924479b566cbfa263ebbd1c7ea96f00b6a8984ab5ea2b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 11, 2026 at 9:45 AM GMT, Fr=C3=A9d=C3=A9ric Mah=C3=A9 wrote:
> The RTL8852BS is a Wi-Fi 6 + Bluetooth 5.2 chip with Wi-Fi on SDIO
> and Bluetooth on UART (H5). Its Bluetooth part works with the
> RTL8822CS driver data, so use realtek,rtl8822cs-bt as fallback.
>
> This patch was prepared with the help of an AI assistant (Claude),
> which also ran the tests.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--25e53c27b1c6852924479b566cbfa263ebbd1c7ea96f00b6a8984ab5ea2b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavQ6riEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+JWwEAo3AjrXyZm7p4
9ZEUTYiTXAsJq4AVvELJfl2OA3dhFlYBAOWsMtFYDasIhrqeWg8qqk6/Kagb+qd1
IfEbAOyLKHIJ
=CYdm
-----END PGP SIGNATURE-----

--25e53c27b1c6852924479b566cbfa263ebbd1c7ea96f00b6a8984ab5ea2b--


--===============0931666547520044586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0931666547520044586==--

