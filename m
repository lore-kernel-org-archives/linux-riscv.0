Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250BEC98302
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 07:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8ZsIomdcSa/LoMGRSMl6ZUJgQ1X271pJr9QVKhgLc0=; b=bmUJGr6OU1iPu+CGJgcwmbzgLc
	Mgh5p9Js6+qypG8lIVb8xkyizOmVjd4ZrpbZJe7VLNqn8TiPK//bZAQaApfOrUMWLMhAmM3dTQZlU
	W8PsQoWyXOpxVYu6gHG0veqZ4v6yXHHd0/N2l/MqRZQ40oh13ppzWSpDLuO0e/zwpv+0w7qWliEnq
	shdqUrCTDVOgJTEsjQFZr2EMiD19FkQ8fumS8ZWDcxgDGBgAS7DVVAAKXiNYRt5uHreDCFO00lKxh
	GDGhinyMV1MBFIiLkGJ0+OatfAF7wnxTsF4AT3+awAFSvMPywnLRxd3TwbEy+FSJJVP32YAeIcNqk
	Xka3TVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H0U-00000007LBE-1BHj;
	Wed, 23 Sep 2026 07:03:06 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H0R-00000007L8i-26a8
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 07:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790146938;
	bh=vV1f8XOtnhd4PUrG7fI1WwmGeEfJB8B4vF5GJJspy7w=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=GmpybhRJZLnP/9/jb4XSUy7O32pj4B3yhNJVR2LvRoowBjsTu3k33P33u55vgKoRh
	 LJX4XuGWBOAmgBIx0erzZGXQmy3EVUAv5mIpLq6uxkGxDXv6vtqlPtrYfJL5e0lYin
	 Jo6YalOWSWi6Gc05xP7y0DSpkUzg1s5pHC3UUcJg=
X-QQ-mid: zesmtpsz7t1790146937t51512584
X-QQ-Originating-IP: 6YGW9d+Woa+ee2SDpHWKexzNo7pMSO7+fqf4Wn3ed+Q=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 15:02:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5313365158734513458
EX-QQ-RecipientCnt: 14
Mime-Version: 1.0
Date: Wed, 23 Sep 2026 15:02:12 +0800
Message-Id: <DLMI4JHT5Q8L.2MHI30VCCP3W9@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Conor Dooley" <conor+dt@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
 <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MX+1SEN3H+wAUfb4Ey5q4ZrmV6yQqozBu/17RdL0+kSNSqdqFk/k2wfE
	hrNcx5S/e6tJ4OjSYyM6DIbMsr449EUy2LKBuXuHC0kVUD/VKDs+EAgMdYmD673rr1V4xLX
	yykITqKDcrNqGbnFgkaMo0GJj8NXSS1Jn6/2YFhoKSgI8O4NAQBDs3CCPCN0H9Ts6AhPgqu
	y//SnxcP3fuCRpCsckyDI5cLcmMADzyFsBxZC0L1Q9zbay7fMfZXp2yKYnfWAEdSIRPDhBa
	frSvXXCQ9lQrnJ25iPXFaa+k2szOKlXAAy05uWETc/kO/huQi73XqCDJ5s5Rrzv1GUBDuws
	mc8rgIA2FjsosAWjkJhmpeAjQ6Lj2ewcHWbblRH4q75CwRpwtlkFhAmDkPRgcfAHa7UMHLn
	3XslGjk/BUUrqhB7P4iG4mtMQ/7j5QFdrV7RTfhyCafO5uL98BEeax2UEj5cP8SHrlW7cMR
	Ds6ZGyBCyzl4bMuvdtE/PK+yyPHVKcaqC52XDuJv0g+FsDQONUoc7+jP1y3Q+3EJO20l1N7
	UAuDHjJybvD4ZK//NpsfKG4z/urJI2GM7GKJ1jZA/O73aAXajk6RUX0OQYfgb3DnrgirksI
	w3zsKg1x6nTE+SUtfeuo4FS3cimIzIO6HRZ+xPsa0BSIHKXyN3J2rdh1729jaRZzmPMbSWG
	8riTXOJi1BRVbeeYxAYl7s9RZneNNqiiGzrR7zL1S+3WU4G+p9Pb/Bz8MxpRid+6WrUOf0z
	XvspBZiWYm3fqOVmHeUGXExbOSwCqfQ2qOLDF7qgVbIClSn8jG/EAnzAY/V6QcO/T/R6mhk
	y/BGjxz1plcJ4D7I/y6V1W3BIFtzJWDmzkSfsaYwD3jMxykDsZ0Fi6WPOV7Bb6a23hp2Djk
	or5C8rRZoUdUZUVJRzKu0Q75Mr8e4NFbiEK9DpwP2L+qRjfQqpBnUQE1AK+Nf+kjuKS0FIw
	G6Y6aesXpIjH+VZKVYPWhxoyfcLKEOYsdr11FH7irZRHHSl3Vo9SxYhxZhKgz60Q5MROJr5
	BbMPLzWc7SwXvKfb3SphUQAm0SeR2DlI2zK2iMkLRq8+8aD7DBZLESDnyBLP6zrMhGvimVb
	MGX9BO7H5rDyqFCV188aC0=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_000303_822904_9FB2D3BE 
X-CRM114-Status: GOOD (  13.12  )
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
Content-Type: multipart/mixed; boundary="===============4258157916033218566=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4258157916033218566==
Content-Type: multipart/signed;
 boundary=1d5c24782d6347cbf5fcdf0c6fbf3eaef92642292ff9818598bdb521dc6b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--1d5c24782d6347cbf5fcdf0c6fbf3eaef92642292ff9818598bdb521dc6b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 23, 2026 at 02:35:20PM +0800, Sandie Cao wrote:
> FML13V05 SD card slot is inside the board, it doesn't need cd-gpio,
> FML13V05 Keeps GPIO88 to low, Then SD card is always on for SD Card
> driver.

An internal slot does not necessarily mean the card is non-removable.
I don't think its location alone justifies keeping card detect asserted:
GPIO88 would report a card present even when the slot is empty.

> We check the vmmc-supply is p3v3. We have the same SDK DTS config with
> k3_com260[1] , so, this patch follows the SD card patch of k3_com260
> dts[2].
>
> If this is not correct, we will change it.

Could you confirm from the schematics that the SD power wiring matches
CoM260 and that the card's VDD is actually connected to ALDO4? If so,
this supply reference is fine. The same SDK configuration alone does
not establish the wiring.

If the card instead uses a fixed, always-on supply with no software power
control, vmmc-supply is optional for the MMC core; it should not point to
an unrelated ALDO4 rail.

--=20
Troy Mitchell

--1d5c24782d6347cbf5fcdf0c6fbf3eaef92642292ff9818598bdb521dc6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarN5dA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv0SkBAJoTYlHEntw6qzTvJySy6HApBMRe5LlDuAd7JRLO
XP9NAP0XoDVs3rpymXWxOxY0Su4MGjNUGi1VGG4nipsub909DA==
=Ux3W
-----END PGP SIGNATURE-----

--1d5c24782d6347cbf5fcdf0c6fbf3eaef92642292ff9818598bdb521dc6b--


--===============4258157916033218566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4258157916033218566==--

