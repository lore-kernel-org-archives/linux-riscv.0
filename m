Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13053606A321
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 06:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VB2s93kw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=e00NYSWw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Subject:Cc:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QAK+UdjNi0I4CGK7zkbhdmBFB2Aln7pQx+xSSoVlmIg=; b=VB2s93kwBxpvSGpuvnbIrqviQV
	6h39a+Tp7FBsT8fAb780IWRCbIJTR73JaQDcK34/xwIOFW9fIbMlnVSQg4J4TmIyQflIGdhxJkMZZ
	qaH4RFLqgeQZyWjxULKtYeYxY5rfgriUmyVF37zufbn85W5u/qlaTZNIkVC4g42Yt/tNP5JDNjjKl
	/BCw1ZxGEdpPUsjOnL1mLvK/WCCj+IOeTTETiTw4scNCs5Eb/NKLL5Y2crFr9ZGq06JWEdTJAUETi
	PG565YHSS2MCWvwq872BCBNaqXGiR/MiVIOYo5kviNW985kIHAIqp9Ym7KJE9DOWX1HJdK+UXY5Er
	vWUJvUYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJ0q-0000000HVnE-1RRH;
	Mon, 09 Nov 2026 06:37:52 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJ0j-0000000HVj5-43FO
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 06:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794206215;
	bh=hb7HGbX0oSahgSBh/HsCEGBA4WObvvoSCDVjmlK2qNw=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=e00NYSWwXhqlXUw/bJrllbR2ZdnMeumI2uEKFADgiMyDE1SjH3KeOSFnveVkLWvL1
	 q8eGre7GOTW+O3EMy8EiWboV7YwzCgn9zAxWzMiuanfKFtJ+pzjrV0nA5d0XzZnv8V
	 y5OZ9zfXBtXlapOpMyLRDgfi/Xml4TX5xOAejXSo=
X-QQ-mid: esmtpgz11t1794206213t932fa143
X-QQ-Originating-IP: uNnEt3FdwN2rX55aSzOWdv/vmKtzNzVEL643pzBitQ8=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 14:36:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14632916415313039984
EX-QQ-RecipientCnt: 14
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 09 Nov 2026 06:20:55 +0000
Message-Id: <DMQGOJQ78RU7.NI4IASG2PBGO@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
 <20261109033348.361452-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20261109033348.361452-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OLsBWtCIHsg6SofOgZXJhA1zQ7RMvyJ6xPalg27ZygpG9xmlXkitp0yD
	zaFhREgLxU/zqPP+LlbwGf4pN/OIjUkB9ia8ZVBG4m9439PgZcxnkzcZVerriEH8NpDjrW1
	GzNI4ysxfheiR9/iQetleRMzqQqwyUWi1W6H1EQKVPkgBr7A62nQ7lBxnaB9jY2BLe72OvP
	ktH6ge0Od1ILD7hHBlI8eydOlPqlkZ8lXiFaPwTGogPkiq9uSHi/rpQNxRgEpI+OBN1GtAZ
	UnuxVAtX9P9Xn/aU2pE7NxwgI7sE6AzHtROdh6WClTmt1XWUQfWcQJ9xdcUy8DwUv94LdZo
	qsvurFoaJ8cIVRHAsDUggTD0YRrbN7GF14Ijy1rKOC2eHnzczHXQXapKLeFiPDK+cKwn2G4
	AhxIpGJ06Tbt1i+d1txTS3XdJF01OS9bA172syncguvFHAts+gOpBDyI/yxP2WmjDjMfFSH
	PhQVaM0JKvntpf1/AdMVP1a5uq3G/phnwJ8PhRTyGhxb9Zr4idhMj+qiUsRO6OEJwhzq3dK
	u97M1e2lDfxYjDvZEaYjZ5+hPW/O369ncNnMCFNRFnwvLTKS0cZv/MYH7Ioz8wBxmNXRmZj
	43XQByUqyJFi7eP3NQ4ZkfWXQpqCpevHQoKsotUIHUvPj2hNOo2wUATCWnVlLdcjGpsA7E+
	sIse0C5VXXnlcL4ECyHsaReOVs62g7kCo9PdveCNJbc+9bPr/CFTmeY5kKUzl6VB1U846+M
	RpBZa5pVOIwbOd1cae6+BW8vkAdauZOyXHVrnHTC8KfkGyBaWa5GIuQtEXV8UBEkDDIGZgF
	eDN64mzxsYkjgYd96IoWiLPzv6Zt6puTpMg1Qc8oeKU0KqKGmWtfZi24kXOdUHn+yNQxDFZ
	UnGf8fig+1nM3xAPelLgowfYqj0XPa7/DrHDx+34ok+LFpbMIN+tjMT5snha+l0npKq3LqZ
	uyB253rM5M/Uki6Fgj4o8PmKxx75rAoh2GMDjju05+lKJd2oiby1HCFIq8L1YQPTG2QZMQQ
	BzDIbifeloRZZ/QZzZ4fS9Mm0OtGZ5UFOpSgCfIjis41Y83aXNXIjwvmC6HuIfdJENeu1o2
	2UapgubO+CU
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_223749_618830_4F0CE7EB 
X-CRM114-Status: UNSURE (   5.20  )
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
Content-Type: multipart/mixed; boundary="===============0993834653571714058=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0993834653571714058==
Content-Type: multipart/signed;
 boundary=78dedb1dc94b18e0f8a4169292210791aa26539c13513ec0cf52409d3674;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--78dedb1dc94b18e0f8a4169292210791aa26539c13513ec0cf52409d3674
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 9, 2026 at 3:33 AM GMT, Sandie Cao wrote:
> Add the device tree node SDHCI-0 controller for onboard Micro SD card slo=
t.
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--78dedb1dc94b18e0f8a4169292210791aa26539c13513ec0cf52409d3674
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavFmRyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8TRQD/QnNxKjP9gh5K
HAnHWjTo2zHzwTp4TNY9rvjpSYQ9RO4BAOY3+m+hFCumO8ziKLwAT6WNAUI+BNIs
sETLiVSYc0AP
=OKWu
-----END PGP SIGNATURE-----

--78dedb1dc94b18e0f8a4169292210791aa26539c13513ec0cf52409d3674--


--===============0993834653571714058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0993834653571714058==--

