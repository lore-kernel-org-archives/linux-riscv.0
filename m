Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA07606A33A
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 08:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YUjpC+Q7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=GDD+UBy8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ramM0BAyBEiJqksTC4Sz6DMQZGG0XkzQene9Xis5q7E=; b=YUjpC+Q7fzxGRRMtHq+qRdUftI
	FCQsaJ+0Ll0kGZy/tqd13Gx83soVzVkgkNm8tmdDYW4Ez5VShxcoMfaQS9goFKYAixlLgUl7WQSJl
	L1Mr44FALuwCGQ05dAfI/apFUSRHBbj6ioxOoavinMIUzP2u1MFWC/y919+P29SwKLw+JZ23bXh5f
	EjTZwyGSjI/8WfVJao+SYjGJfz5+2vMATlbNGr+f8pk9mtjO9qmtZxJ1/Yiq03DLNY1ycApUyVLRy
	D/yAt8C87q0yubTCDfkuxhYKyMx5CSp3FOoaLOhAy+dKkNng3nsWksIZ+H0AieKWsZ82Jtu2bLfjJ
	sbysHHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmqT-0000000C6fC-0baA;
	Fri, 13 Nov 2026 08:41:22 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmqO-0000000C6aX-0uAr
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 08:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794559258;
	bh=V7eTuFZjA4PWQbmvW7OqH4LWvNJaPry6cfmPeAjXhow=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=GDD+UBy890+t1OqxUqT6aVPC/Eci7C0ywc2RKPpo4OTJstzH9v8qRTqrT9cOeu0x7
	 ibnZKScrB9qkkDHT/h1JJ5BbpaQJxwRWrzhF/YqIlbJ7gHWvQ6BFJQFWihVGLJp6z6
	 Dqi3cadrQ/iUNosJjPmtz8EgESVp1Kj6/31ana0w=
X-QQ-mid: esmtpsz16t1794559257t5d9dba59
X-QQ-Originating-IP: wBSvX1BtCBZPqne4sQMbScd0WRDo3uqiRi+rcmrw9o0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 16:40:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8217629100914442193
EX-QQ-RecipientCnt: 17
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 13 Nov 2026 08:40:53 +0000
Message-Id: <DMTY5W1EG9R9.2OG78EAK5J7UG@linux.spacemit.com>
Cc: <troy.mitchell@linux.spacemit.com>, <wangruikang@iscas.ac.cn>,
 <guodong.xu@oss.qualcomm.com>, <jyc0019@gmail.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <pjw@kernel.org>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: give each PCIe port its
 own DMA window
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Vlad Banea" <montrealtango@gmail.com>, "Yixun Lan" <dlan@kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261113023158.2872492-1-montrealtango@gmail.com>
In-Reply-To: <20261113023158.2872492-1-montrealtango@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ndw/mc8X39Obev2zZ1A5EG8IHfjrQAbdcWNAb46z087/j3yzHaV7SbzF
	jhVGS0YYDZVdVCfwhWzkbt1u02/C8DmUqeVuRmMgWMwVc4nqrJQR+QtmV3keTlMDWbTFyPM
	1ySSydmiptj5afB+a8//jmcOOYUIEkaRpMSFnt41KFb0E3HsuWvS8Qo7kRgEXyZsFlU6WZL
	My5FdLl/QNpCjlmRfB1KR52ZPP6hrxvBdk1WKerky2pDgPj6kyesbDEmwJxkfBeaHCVAF/P
	p2wD4UXGEHH2Ze+x7HnbJGPSRa2MxOQSNx5Edkt7DdM/ab8wr+mRzVKxvAqkBhjy0Ze5mrL
	zI7PjgKQlBxStYyOWVPdR8yOxi/dL3aTrNGGuwFkdmY/oGPoNju5kyIZQNWxbfVBmjOHX0b
	iz168pmwVCOdvoNystu3xV+rkp3RI88PX7fGzbrdN2YDjk5cC7+cwbC/g4MGVuHnMNLJFhU
	/VIlBtNS/NqNNBL45MSUqzB0ePIwZWIna4UoYzUJVIy/OVoGgfWhtmjqAG7r8u3ekK7U1FH
	z6LWlkkfAATLtEX9iY6AaGi0qzotMykgslEqeZ2VlbE62PPuxS/HVreDo1t6jCE6tlmuFSo
	TYAWDRE7xUwxdOss6KHs+W9ebeAEsPNq7WxYin7tu13UpxFj2xdifO5A8SOtz+INB+bNcNt
	AO7GDyg7p+v+t0uIu2rQk32TByjMcUNsHVIUVLV03CbRUC360/+8kryKnUotK00SwQcCWMY
	IqQ0vczCGaStTn/ivUJuPwYOGRN6/+2G1SYbSHYTsqLC9g0kyepezluwqm7rTSK6i7mCRwr
	1JTrNOIJPqK9/ueeu+/tG/gFBrqRv26teMY+4i0lnzGkw/ZxkFF6qgjetpXThcs6LsEMjWK
	NQITjADyLn+r88GATcCM7f5Wei8zOuoBumNYIt9EcPb/Fb6UeABkJwYJVw7hU0fdMsThuy7
	fRJTiavsbW6gK1lFpcFvMQc/dKjPj59fIb1ucouqXHCvZKGVRAEJ1Nf93vb+QEc5HiIG9li
	wqqQhJ523Afj5oVO0QkVpSYPXRw6ajzQP9VC+6ZYdJKf7eOdlw0uklv3f4lC40ZtqRKrJl1
	g==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_004113_041874_48CDCAF8 
X-CRM114-Status: UNSURE (   7.25  )
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
Content-Type: multipart/mixed; boundary="===============4879541716893821289=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4879541716893821289==
Content-Type: multipart/signed;
 boundary=d13001a16f081259898c54cd2d9bc8d1c58a841de8fa9c26a1bf406aef65;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--d13001a16f081259898c54cd2d9bc8d1c58a841de8fa9c26a1bf406aef65
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 13, 2026 at 2:31 AM GMT, Vlad Banea wrote:
> On K1 a PCIe master only sees DDR: bus addresses 0-2 GB map to CPU
> 0-2 GB and bus 2-16 GB to CPU 4-18 GB. A root port does not forward
> upstream an inbound access that falls inside its own memory window, so
> dma-ranges must skip each port's own outbound window; the other ports'
> windows reach memory.
>
> The shared pcie-bus skips all three windows, bus 0x8000_0000-0xb7ff_ffff,
> which leaves CPU addresses 0x1_0000_0000-0x1_37ff_ffff unreachable from
> every port. Give each port its own bus that skips only its own window.
> On boards with more than 2 GB of RAM, each port can then reach another
> 512-640 MB without SWIOTLB bouncing.
>
> Signed-off-by: Vlad Banea <montrealtango@gmail.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--d13001a16f081259898c54cd2d9bc8d1c58a841de8fa9c26a1bf406aef65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavbNFSEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/H2AD/ZBD7XI22R1Ie
I6EnaBMP4TJ3LTUz+Sq1k4mPe76lNf4BAKulU+P4zOed+4ID8p+GEHDcy/ynwbZX
Ra6R4TzswjoJ
=nCa0
-----END PGP SIGNATURE-----

--d13001a16f081259898c54cd2d9bc8d1c58a841de8fa9c26a1bf406aef65--



--===============4879541716893821289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4879541716893821289==--


