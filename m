Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F108606A32A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S3Oqo8Rn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=bpRmjo+T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oBr/25dt/vB55SXDV8kQSRmuf9nDoOmn3sxlwe5tfJ8=; b=S3Oqo8Rn3DrLyqwWoW9Bke/k+K
	y3YdB7ULyxG9eAQ+70XA6l9Xr0aRs2rh7yneH0mOFrEIzycKIdgIYyJP5JNKoL+TzcAqXolNRzj7G
	sHtvAYtpnUzFVM27VitKEas8QR/MUx9UzAFqOldmPxAeCdJMhVayPFI2ExPaTpLB/K4IwV/9ZianD
	ibvKgyA/sxLr8NPpssluIwBqjuzKiXk93LH/3RpxLmhaCAh8XamdcgeOZ1JF4qUHopORHu1X9Vylv
	Ctfws0KvW8HkH1rxELiQAFADVqGWakr/y/GLXXwxjfYoeHuZRlCq2tZf1bvqxULQXCUBqEJoZTtTH
	YrKQfCdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQJY-00000002hzD-1olu;
	Mon, 23 Nov 2026 09:26:20 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQIp-00000002hqZ-3nYG
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 09:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795425902;
	bh=JBgmFwI3d+bD4ZeA1f4oLGcqRjnONiXOuExZb/PYGVU=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=bpRmjo+TJx+EXAXz2i836hOhcde9JmnBTLwhD0g1BaaFKQNTrON1PGAQwc3yRdzrm
	 41bmzeSSsrcjx6NQa68swL7yBgkHVHMg+hWf1STDN+vB8C7Mk98uEOC4QJIHRKDLWy
	 S1Pi6ko6FisVuT8IZteniiOgdPEWLZ1ty8DsBpLc=
X-QQ-mid: esmtpsz10t1795425896tea819c39
X-QQ-Originating-IP: uO/dN4xpVqcgehUM7VHVJuhKXoP0Sa6dV1wDnAUdss0=
Received: from = ( [183.48.244.245])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Nov 2026 17:24:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6983506776198614728
EX-QQ-RecipientCnt: 18
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 23 Nov 2026 09:24:52 +0000
Message-Id: <DN2HD0L9B12P.2EK0R922TOV3U@linux.spacemit.com>
Cc: <srini@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <dlan@kernel.org>,
 <troy.mitchell@linux.spacemit.com>, <me@ziyao.cc>, <aurelien@aurel32.net>,
 <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Jiayu Du" <duge1256@gmail.com>
In-Reply-To: <20261122173810.2409146-3-duge1256@gmail.com>
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-3-duge1256@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MEc+ZvFxT3Id0mAMkmwJzZjB6ZNyp0/aYoFf2CjA8h2Ltgc8qHtV+DEz
	5bcTeMx4e4O3r7ZxURvIvVt4LoL3UdHpShdjxlg5uiK8zRcretqGgTQGYP0LzK7AW168M/n
	faT8uAseSChacGFN5G6/+5TMtHzzlPGABmg8y/OqJLS6yDasxfFu4LJjN1FEKucamEtgZct
	bWlLUQTi5jr93gYFhvQzdq4c1C7b5fgEezVkC4GVI3enZFmhdOBwAR8lSxZ0Gd4yOsGW5cU
	LhWOR2iwdhFbs3qqSON6uhaYS1liM2bsV2w9v/iId8tbCT2rcQyD21S8EU6qezXXh/AgOno
	Pba8S9KCPMkI1kBxnLCyXOtBhs2wz7xvjEbtTfPmyKvWrUlZfNsABRc+M+uZqvVRUmbaelO
	6ydr5lYoriIy7AUP2+eX+M7Mg8wx94d5oWrapWtf1vaxyHx3KjuIXFDu+JTX/lSkVS6xxjn
	/OGF8MMCN/kXoS0SCjbBL4pyLfTy9sgjTXszerguHYQfNVUZyH5pU+oAASzwdJMgtcJN/DH
	STY/0Jk9ppMC8ukeKlikhYME3wb+TIk4Dsj1dPQjqP/C8VapPtUskc1BLJYFmtqxq4KMbaD
	UlPoJ7qvJUjfAcdrmJswcLKL7+7OVaL470oba763476UOt2YjGV9IvpYItUPcpbh56aeOXh
	2JYioBhVQwz0luyo09qZa+auJOsA2LAYWZ8VQy9bHHr8Cxa1SS3jyopBg4EljVj2nqG8S17
	IF2sF8fTdhhHFiUlE0aTJdMtc3P9t7Axyf8NyuIKswUYiO1Q6NyQs+UrtDbhu2xZuiB2Y8d
	/hRo0UvgOWfQ3nM5+NVPuRIStmMcINRch9ouwYg1QVW+D7463iiehIVbV06ft/dyLXkf88m
	m1DauE0J94WwfQvKX1sfALa0iRhAbyTs7lh3gglA3QRls695C7GT2qoZnnbHuYsV/bmZhrW
	QNKmXQcHSmKrD70GWi09bOhf7n+p9VIzWXStZj/HfXan8kUbM3lW5pgvScy1dShrgN3VY7B
	pMzl5Ov5y+sP3xes3hRAht0Xlz1viQ4nOlnOabCkgjd1lE8Q0SgbNPrhYMpcldEly2s0out
	rBNPyXu9huv
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_012536_923034_818A4AE8 
X-CRM114-Status: UNSURE (   8.10  )
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
Content-Type: multipart/mixed; boundary="===============0602048663088725505=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0602048663088725505==
Content-Type: multipart/signed;
 boundary=d2ee13a6a85992f018305a6f724e47d00c2db0323c1bf1b05267470c5e8a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--d2ee13a6a85992f018305a6f724e47d00c2db0323c1bf1b05267470c5e8a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, 23 Nov 2026 01:38:09 +0800, Jiayu Du wrote:
> Reload the shadows during probe and cache the data for subsequent reads.
> Use a 512-byte NVMEM space with bank-based offsets and keepouts for the
> other banks.

v2 said why only banks 0 and 7 are exposed, here and in a comment
above k3_efuse_keepouts. v3 drops both. Banks 1 and 2 hold the root
key and the SSK, so please keep that explanation.

[...]
>
> +static const struct nvmem_keepout k3_efuse_keepouts[] =3D {

The comment belongs here.

--=20
Troy Mitchell

--d2ee13a6a85992f018305a6f724e47d00c2db0323c1bf1b05267470c5e8a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawQGZCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8cbgEAyeUFitMIdIlR
gQa3GssF970F0URLGWsxfc3ds7zjEf0BAOJNKKuprXjtRVCBte1FETP5UaTR1Gb3
jxY5BVbWXI0P
=GIiJ
-----END PGP SIGNATURE-----

--d2ee13a6a85992f018305a6f724e47d00c2db0323c1bf1b05267470c5e8a--


--===============0602048663088725505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0602048663088725505==--

