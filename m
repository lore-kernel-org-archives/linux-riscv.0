Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7358E606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 06:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vjiHNMtP;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Ax4+Nkf6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:Subject:Cc:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jCL/T96ofF4tLJEX/p0NU7zbztq2kC7rJth/62E9lbI=; b=vjiHNMtP+wROGuwRusC7hJgmeR
	MCrfBrRM+Hxcka6odGkXJqbbxab7F7Rco4CIR825nny3fJDqhxbcWOp7zErYu9CbY2XYGUpEI5jIc
	3TuCyNYNT2XTKMGZdOfnotCjcC1EDld3GZ7HPeUvUkKq6DdOdjPKCnqKnow07ka+NgJdmA3V3vJPK
	mAOzyCjT31/v9eSCWUgYJqJL6/wG7hNRYe3ojLPc4KiDxVgyFer7UTJU7IxbkhrUrv12cZ1MsaL/y
	08Eo7Yvq9GHkTnZzXNsm4CMA1GjFo4kiyPGAr6EkPqPq0LBJ6iKaixfhuaPr/sPrO+3F0TH/8hPW1
	hsv2uxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJ0Y-0000000HVj0-10H3;
	Mon, 09 Nov 2026 06:37:34 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJ0V-0000000HVhD-0Z7v
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 06:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794206210;
	bh=63Wz6ya2Ub8ladEeQkfoYbpXC+w/iRW/EVIKhqbn83Q=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=Ax4+Nkf6SlyJQVrqU8AOFCa29lZAIFOq45qmtxyFF3ZkKV/7vD8kXbksR6cRDDwqD
	 MSK3ifLWilMBhigQnVA+nle3PZ6byPJmL7KXdiHTX692AJjF6sjvdIRFEGyc+iBLXN
	 U8O78SZkH6OnHUvShtMHGWqSqN8E7nysNpND3aS4=
X-QQ-mid: zesmtpgz9t1794206208tf88a23fc
X-QQ-Originating-IP: 4Kw80jsSiSoIoW3m3hnDtE89tjQ7Tcvag4h7VzdEA+o=
Received: from = ( [183.48.247.17])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 14:36:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2280427375327430452
EX-QQ-RecipientCnt: 14
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 09 Nov 2026 06:20:18 +0000
Message-Id: <DMQGO2MLJM8M.27VP8Y08N5IXY@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>
Cc: "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Conor Dooley" <conor+dt@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add USB controller and USB phy support
In-Reply-To: <20261109033310.361435-1-sandie.cao@deepcomputing.io>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io> <20261109033310.361435-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Np0qb5kW85KCN6RNczVOG8oaLXglSpzXXuAybWojuRYr1mg7jMUi6E2D
	gTlc5jvpRRMCB/rDeskvsCr2p0U0CgezIW0didKXvhtHdismfcF7qg3Ha0kSPHi9UVofOO2
	RKo12Np2gNacKzyPGvgoc2Gsrl98FqctqhfF8V0TTNemPAMSknhDWUChrwwk5nXlePelnyS
	5Q79cD1+av2ArzEOHBycKkgub1lrSronvtSna5lc+uQOYACZQ+yHYf7dBdkIBEa+5UYOhmp
	mIK47rLQbhEpuIKD9on6d0ZgHoL0pICm8GMGvnVkfS0QNjxF4SxpvZimCJIhO2op+pZ3to5
	sGimaMmWcz+CXFNPn4XsF9lyJtVUXjVT2DZC0xTDMoEoK/43A36S4HzDrXa1EQpeVJomzLK
	2etwF1o7KaA1720BLmIdiW29y45m6bV+nv6wp1VO8hvGfjpOgi5cuYUaUeoQVn6pdbr90r6
	3O4Tgj7qNzTcGrkQcvQ25pO0zOfrysrA6QjTHHrA9PfRfwPAHswyBOC19UrAw88HJAM14vZ
	Q+0doWCYpg2b4E/6/AbXpef3iTlVW2xEKjT/5G6/NDI83nhBjjuzj9px3cDlSVkR3GGPnOg
	XSiybRz/E3o3tR1Hu2WPy6nkg3tWGE23GbgeaHEum0XKrL/EAKEDr8DNUG1S+BCqCctkukr
	u0RL4SJC3q1K3PWFudlRa+nnLyTW9+t5DGtXhFDICysNL88cY/kttxCKTcy7ejzrbsn94/5
	hv8mLa5vCdVP6bR5TUiisH1BZBjE48PIr80Ui3ZOFALoODS22MVGgMsMTEWMvjhq0WEmSU2
	uceWwbzyXRbDBPgjOXuiFThe10F12thAViTm8GO2k19nStzLZZO6J/kDM+cksXRZM8S8t7f
	yMCXgZW+4SYEJPAQxj0jw/cF+HMzxLrlUYjUCPy1uSMr/2Uepk3ORvfhe2qdDJZsMEZowNA
	yV2c93Csuc6w/M6fCGOxXxHln7NlM2NiMv0I4X6mh3mZ9S6L/Xbxuj/5LlxEgaYard60P1I
	OhmJ9W0B5X2jJrLE/50TGHb2guS+O7e+y3tKCxSoZqCvzHp7kNEBro4FHZeVAnkswKO2JJs
	Q==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_223731_936720_6518D18B 
X-CRM114-Status: UNSURE (   5.62  )
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
Content-Type: multipart/mixed; boundary="===============5948642589178468390=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5948642589178468390==
Content-Type: multipart/signed;
 boundary=07ff8aa27cbd94e52b83dc30c3f2c614bf3b214041dadeca72e11e5b6b3c;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--07ff8aa27cbd94e52b83dc30c3f2c614bf3b214041dadeca72e11e5b6b3c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, 9 Nov 2026 11:33:10 +0800, Sandie Cao wrote:
> Add USB device node (b, c, d) to DeepComputing FML13V05 board.
> USB A works on otg mode, it isn't configured currently.
> - 4 USB-C Ports
>      - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
>      - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
>      - Port 3 & 4: USB 3.2 Gen 1

This patch also enables usb2_host with a GL850G hub, which the commit
message doesn't mention.

Otherwise, LGTM.
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell

--07ff8aa27cbd94e52b83dc30c3f2c614bf3b214041dadeca72e11e5b6b3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavFmIiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8tWQEAvywcD7bi0gZG
WU0K8onUqh+/3IEyc9XrO53vzNr+45sA/jcO9Mg0Q8AqUYEJVihVUDygV2P5RiZj
MjJz0ZzzqV0A
=YdL4
-----END PGP SIGNATURE-----

--07ff8aa27cbd94e52b83dc30c3f2c614bf3b214041dadeca72e11e5b6b3c--


--===============5948642589178468390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5948642589178468390==--

