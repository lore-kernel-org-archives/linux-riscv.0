Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4A3C79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 13:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCe0SffxAJkA300wyvyvAQMqXdH2/ImDOqVnnMIe0V4=; b=WhqPG0ahUVJZQ0NAx4fQ0Gt1Gd
	bY9Oclqw7/QuX4Z8MdypeE+BXgN02kzGQQfuBTHfiHyQYjHd0TKNM8wXPnFIa2IC6CTFnNSxB2s+g
	B279OKzXwhqFuSVl44pw8TC8PkNmoqex1lYrXE8LEKqfhVlshzFxymrqTl/81NEHglZF566NxiQch
	+Wfa2f+qEXFzuxFTvDrKOPFtShLa6IVnruRH0JNrsXx5K+o218VRggRPMy706EyJghD475vGKLCGa
	gEXO//t3MHLIaq1Oe0qbxe0KUCNWIKGp5d2mWEB6Erdi3hhVC5bP1aVeR3ypS0yWwkS5nbZX6RWyu
	Z72GZDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vcq-000000097d8-4291;
	Tue, 08 Sep 2026 13:12:36 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vcn-000000097Zn-17u6
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 13:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788873126;
	bh=mIWyqqRMsfpDKfz/nz9NbsL48iyrcIIeqP8orz9L/8M=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=FTMLz2EsWPsSiHxnudJaDopeTZI2t1PwzM7zATruCquh7F0eFfZhPak9fSP4kHP5l
	 KAdJL2XNBagLwhHX4Bzm+uFCVwvlxtWMFFe606Zylb01dcxRNLHZO7Qjq+ZDJ+4+ll
	 lkG7oNOK0gPockjo4nVsN7S4UYZkrGyBBNzXB55Y=
X-QQ-mid: esmtpsz21t1788873119tb9caac5d
X-QQ-Originating-IP: OzT991yKTm8aPCZVAdh22ewUudNoGlUr/PsMZfz1plg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 21:11:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17554750982614222209
EX-QQ-RecipientCnt: 21
Mime-Version: 1.0
Date: Tue, 08 Sep 2026 21:11:54 +0800
Message-Id: <DL9YLFXV5XHU.2GLN2OSEB8EV@linux.spacemit.com>
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Ze Huang" <huang.ze@linux.dev>
Subject: Re: [PATCH v2 5/9] usb: chipidea: usb2: add SpacemiT K1 support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>, "Xu Yang" <xu.yang_2@nxp.com>, "Peng Fan"
 <peng.fan@nxp.com>, "Peter Chen" <peter.chen@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com> <20260908-b4-spacemit-k1-usb2-v2-5-f07342ffa051@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-5-f07342ffa051@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NOSiq+6X1Fi2h96Ve7jtwZRi4zyHPpUx4yY2i1Wz+CloC3OzfV/KJww2
	ioJLxYrTwx9BTJk7Cg2AcHWll571CY7ZIxkNuhGXlQEJ+x9A3y1XAKX6mLfPigK4nwCzKBW
	M07bO1UefBd2BKZZVYkefDz1RS5wigfHTYuesYlPeM/CP36u0QnulTx1UDojC74fbhl5yvh
	hblfK4rgt8B+3mFo+rrbOkRlrEvc0qROqtO/7edaGK3/Y8kvKFuLTXRY+f3u15JCXn9CSBm
	vPRcUqxpf53DWPvt7+KOb5I7j3kB2glYCnnRj8LNSEtGmi8FzinkE/h8mbKX6amJKnOw1AN
	kTkYo0R+ELBP6JIe6v4rwqp9bWW5KRwcYkG2cMZP+CrgJdDmezhFFSIi1D6JxWaf5OtSm7u
	SLNAEanUjuyQs6qbS4koaPwwI/NcotQzlmloWUJ8224o2veInNasOHuTGx+t8qNL9WmEyd2
	m/nmM/RaC8h4Y+kD0UeWDyVxMBt+w4fF4YHaiSOoT7ptZeKjdiBznJcEmFAf5wqf9xGAS6d
	Zzz8cbKm+8lzRAbnp2YTQNpy0/ZZw4orAjRQmyGvwu284eb+UxtBB2BjuMCPsaF43TcE/ol
	iRKNiX7P8OlOUt8wX1f6Agodm3svsbZS0nwCy3NRmCMZ+gugrqNEnPcgGkSAwpoeEjz6WqS
	K8Kakho+QZv84ymQsI2dfni/eRv7NABPJCSiwZdnGeUz/GVJRtnUA2eh+ZekOq6QYgfSihI
	rLv2P26xZ/iN1sqIQXZNvJ50uTqlfeJNnBycnooZrs6mhR+WbNVWZAwutZjqd4bX9wzpdch
	QRICN1OAeQ+07XtsjV4jlTcoJAGqoTmRefRv7VbnIWucOqnjhlC5lQbvhz4LUazfL932kck
	8DkAZ9FId8TjvQ7tx8LV3h5Xw3ifx3cJe9+ERolvW3LwnAgASZ6H18CaJJfRK2t4RmRZjmm
	+tNZfids3xUStUyuC4HK0COsbX/4eiv55bgdAh6d2NVHgaPgIalg0MiZd5Y7sRH7XCjKQkH
	/omtsvyh7r1Ch1G6SZkyCDGtJ0M7ONKME4oqmeKEaUBJNxNm8ulj4nfyKnxWzzkTZoeuaz7
	6PmAM622eIsmwCCzBEPAAJcfexy89sM2g==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_061234_009521_2B4FED76 
X-CRM114-Status: UNSURE (   6.49  )
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
Content-Type: multipart/mixed; boundary="===============0370038012457840019=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0370038012457840019==
Content-Type: multipart/signed;
 boundary=c8689e971497ee65ed5d0babc05266408e6f8eba1d89b75ccbd7b9d886cb;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--c8689e971497ee65ed5d0babc05266408e6f8eba1d89b75ccbd7b9d886cb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 8, 2026 at 5:48 PM +08, Junzhong Pan wrote:
> Add a compatible for SpacemiT K1, and add platform data with correct
> flag since the hardware doesn't have internal otg register support.
>
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

--=20
Troy Mitchell


--c8689e971497ee65ed5d0babc05266408e6f8eba1d89b75ccbd7b9d886cb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqAJmg0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv4x0A/j9HUTzRUUs/A5yTaji1bts8yMGFvIYujiOYT58W
BYd+AP97yqSaybxN4+y/r68x8lBLo8FQ4tFvWHotMVs37WmsBQ==
=cVfF
-----END PGP SIGNATURE-----

--c8689e971497ee65ed5d0babc05266408e6f8eba1d89b75ccbd7b9d886cb--


--===============0370038012457840019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0370038012457840019==--

