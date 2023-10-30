Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492B6C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 10:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-ID:Date
	:Subject:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yfMXIpSZn+XTrO8X90mkaGgQFrE7J9GYjsTMpjZrR0=; b=2RjBC9NRPLGbBI
	SXyUX1O3Q4XYHyzadszooWgCDuLrpu0XNf2W5OVXqNANMacKN016xJJM11ZLzhipTlaVrtjzpWcJW
	vwCGMJG+PBcYWv8vyZbtU2GUPspcqBKOFzdoM08NBOqlQ5mEkfbA64jCK/qB61sxFWFx24k1y40G8
	SKHBU+xzYJm5JajGiUPKOM0wlN4V8VpJNBrio0mKO5FMggearZelqL3dW9FC/3Yi8mVNfsfemeIFh
	uYOyS6/I/cAIpFqvInR2PoRZPo1Ok6AxneW6G8o/i1gTqL6EffDPd2YTH2pMy/wp2o8/6JnydbyvH
	6TklaUMIVR5WFVPf9lyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxPBg-00317n-31;
	Mon, 30 Oct 2023 10:08:00 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxPAs-0030eU-02
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 10:07:14 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20231030100656epoutp03e2e78a925f714dbea3c6e2a10bd9e994~S2qYSyTBK0581305813epoutp03w
	for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 10:06:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20231030100656epoutp03e2e78a925f714dbea3c6e2a10bd9e994~S2qYSyTBK0581305813epoutp03w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1698660416;
	bh=FC3SFCt3oDONkXbchccf6ka1zKQR7N9YRKyvHAgwSBk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ow2CxM0y2wegoqldHBfevqpId/N9y0ERUfdkLZSX2QTUI/z7qDAi97t6dUdGpywfD
	 g+ACoiYKCvHUhHzQOpICegvBN0pFpRpaB217zh5zyE0Fovnc6IZ5qt4qAAOz3wLVqk
	 OVxnGlMy22ui3EK1tUuPdIcRYFS4rDU/bNKnrvZw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20231030100655epcas2p3e47b138fb98c30a4d6dbdb5e4123a34c~S2qXyLX3M2647026470epcas2p3V;
	Mon, 30 Oct 2023 10:06:55 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.92]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4SJppR1QR8z4x9Px; Mon, 30 Oct
	2023 10:06:55 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	AB.5F.08648.F308F356; Mon, 30 Oct 2023 19:06:55 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20231030100654epcas2p11df3f52fb337aa99140e6e5792d1b3bb~S2qW9U3nH2625326253epcas2p1s;
	Mon, 30 Oct 2023 10:06:54 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231030100654epsmtrp1a87e785a45e3f2ae120b4483a55a0a01~S2qW8VXY92852828528epsmtrp1X;
	Mon, 30 Oct 2023 10:06:54 +0000 (GMT)
X-AuditID: b6c32a43-4b3ff700000021c8-3a-653f803f493a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	1C.02.08755.E308F356; Mon, 30 Oct 2023 19:06:54 +0900 (KST)
Received: from KORCO082417 (unknown [75.12.40.192]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231030100654epsmtip164540064cd0d27d880368f0ee1568041~S2qWuLyKs3070430704epsmtip1l;
	Mon, 30 Oct 2023 10:06:54 +0000 (GMT)
From: "Chanho Park" <chanho61.park@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Paul Walmsley'"
	<paul.walmsley@sifive.com>, "'Palmer Dabbelt'" <palmer@dabbelt.com>,
	"'Albert Ou'" <aou@eecs.berkeley.edu>
Cc: <linux-riscv@lists.infradead.org>
In-Reply-To: <df5d83c6-00c4-43fa-bd83-10c3389689df@kernel.org>
Subject: RE: [PATCH] riscv: defconfig: Regenerate defconfig
Date: Mon, 30 Oct 2023 19:06:54 +0900
Message-ID: <007701da0b18$cf5a8e70$6e0fab50$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGPkBUARv/hmrp8TjnmWcURBB+R6AJzOGHEAt2ZccCwzIhkcA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupik+LIzCtJLcpLzFFi42LZdljTXNe+wT7V4Os+Noutv2exW5w/v4Hd
	YtvnFjaLl5d7mC3aZvE7sHq8efmSxeNwxxd2j02rOtk8Ni+p97jUfJ09gDUq2yYjNTEltUgh
	NS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaLeSQlliTilQKCCxuFhJ
	386mKL+0JFUhI7+4xFYptSAlp8C8QK84Mbe4NC9dLy+1xMrQwMDIFKgwITtjYl83e8FUgYq9
	h9+zNDDu5+1i5OSQEDCR6Lp9lQXEFhLYwSix/kZ1FyMXkP2JUWLK98nsEM43RomfB2YydjFy
	gHX0b6qDiO9llFjU8AGq+wWjxMwXCiA2m4C+xMuObawgRSIC6xkldnT9ZgZJMAuoSsxp72QH
	sTkF7CQ6b91kBLGFBawl7vx+DGazANXc6dkONpRXwFJixqK/zBC2oMTJmU9YIOZoSyxb+JoZ
	4gUFiZ9Pl7GC2CICThKHz+1hh6gRl3h59AjYBxICUzkk3jY/YYVocJE4eeEBlC0s8er4FnYI
	W0riZX8bO8SX5RI7liVB9LYwSjS37YFaZi/x4+YUVpAaZgFNifW79CHKlSWO3II6jU+i4/Bf
	qCm8Eh1tQhCN6hIHtk9ngbBlJbrnfGadwKg0C8ljs5A8NgvJA7MQdi1gZFnFKJZaUJybnpps
	VGAIj+rk/NxNjOBEqeW8g/HK/H96hxiZOBgPMUpwMCuJ8DI72qQK8aYkVlalFuXHF5XmpBYf
	YjQFBvVEZinR5Hxgqs4riTc0sTQwMTMzNDcyNTBXEue91zo3RUggPbEkNTs1tSC1CKaPiYNT
	qoHpxNvEpfo1ky61fG554JzMwehiPzvD7hjHccnYmSoFdzaIcIr7svXvf2S0Q1DrhGjonOrp
	h9c+mSeeFu61d9mOMMsXE5/MeL6J0zJbJLt9/5LoeQxrm5TWugueuijNu8Be8je305Tb+pUs
	TSHHGyM31J4xFfHQlA2aZFkkodXzVa37iFDUj+mli9xuuUW8sDG55Rpe9vHC3VX23jdOc1x6
	k9MvkF25RPDUl/PvTPy37f59vyxXfP7zbdKbwlvWvLt25JDlPcvJdQ7XQx8YTH4jmHs0Y0bZ
	B6ngYMbpbVXqO6fumbrwW2r/wr5tdt33THjvMJ7bzax89vf37lVyP7T279q4vUgs5P7/pBdf
	P8W5KrEUZyQaajEXFScCAEYDvDAdBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsWy7bCSnK5dg32qwceD2hZbf89itzh/fgO7
	xbbPLWwWLy/3MFu0zeJ3YPV48/Ili8fhji/sHptWdbJ5bF5S73Gp+Tp7AGsUl01Kak5mWWqR
	vl0CV0ZvwxaWgu/8FVuP/WNpYFzI28XIwSEhYCLRv6mui5GLQ0hgN6PEsi9/GbsYOYHishLP
	3u1gh7CFJe63HGEFsYUEnjFKtOyMBrHZBPQlXnZsYwVpFhHYyChxecEGsGZmAVWJOe2d7BBT
	jzBKdD9+BJbgFLCT6Lx1E8wWFrCWuPP7MZjNAtRwp2c7C4jNK2ApMWPRX2YIW1Di5MwnLBBD
	tSV6H7YywtjLFr5mhrhOQeLn02WsMJe+Or6FHeaDP0fnsoHYIgJOEofP7WGH6BWXeHn0CPsE
	RtFZSFbMQrJiFpIVs5C0LGBkWcUomVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJERxpWpo7
	GLev+qB3iJGJg/EQowQHs5IIL7OjTaoQb0piZVVqUX58UWlOavEhRmkOFiVxXvEXvSlCAumJ
	JanZqakFqUUwWSYOTqkGpozVn17tmrMjvPmTv9WfJt/coAQJs8sPNOLWzbSJUS1POSmcfPPj
	PalQca/nzvyea3cv6Zj/hD0y9sU2m5ibff1St+N3xx7W7xUOnpYdcM19wYqJ2zLLxHV+rGzP
	89TsiVHdn6h4+1rP+VvfZmp6LU38feuUuSTXtmafyTzVye6dp9w+r/z/u0m4dFOowg39cyvd
	jnb/ZlPMOfpi9Tcd8/Mi0pcPc7xlj++J4j2dLnQwz9JT7EX9toPm+6rLuGRnno6vj3DX/6nu
	uK9TauXDr5MmfvpeX/b3lNy1tl1/Oe/oaXPPtLa9o/fOwfXY+d/mtf/i5ytff7CP89uf7Imn
	/d3ixcX+tsnfOdsduHi/hRJLcUaioRZzUXEiAI5QaHQjAwAA
X-CMS-MailID: 20231030100654epcas2p11df3f52fb337aa99140e6e5792d1b3bb
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231027113547epcas2p1c6b08e800408ee234230d3d02b8301d0
References: <CGME20231027113547epcas2p1c6b08e800408ee234230d3d02b8301d0@epcas2p1.samsung.com>
	<20231027113525.2227513-1-chanho61.park@samsung.com>
	<df5d83c6-00c4-43fa-bd83-10c3389689df@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_030710_654953_F0F8CE65 
X-CRM114-Status: GOOD (  19.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Sunday, October 29, 2023 4:50 PM
> To: Chanho Park <chanho61.park@samsung.com>; Paul Walmsley
> <paul.walmsley@sifive.com>; Palmer Dabbelt <palmer@dabbelt.com>; Albert Ou
> <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Subject: Re: [PATCH] riscv: defconfig: Regenerate defconfig
> 
> On 27/10/2023 13:35, Chanho Park wrote:
> > Run 'make defconfig savedefconfig' and copy the defconfig file to
> > arch/riscv/configs/defconfig.
> >
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > ---
> >  arch/riscv/configs/defconfig | 10 +---------
> >  1 file changed, 1 insertion(+), 9 deletions(-)
> >
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index ab86ec3b9eab..83fa02611284 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -27,15 +27,12 @@ CONFIG_EXPERT=y
> >  CONFIG_PROFILING=y
> >  CONFIG_SOC_MICROCHIP_POLARFIRE=y
> >  CONFIG_ARCH_RENESAS=y
> > -CONFIG_ARCH_THEAD=y
> >  CONFIG_SOC_SIFIVE=y
> >  CONFIG_SOC_STARFIVE=y
> >  CONFIG_ARCH_SUNXI=y
> > +CONFIG_ARCH_THEAD=y
> >  CONFIG_SOC_VIRT=y
> >  CONFIG_SMP=y
> > -CONFIG_HOTPLUG_CPU=y
> > -CONFIG_PM=y
> 
> User-selectible options should not be removed from defconfig via
> savedefconfig. Please do not run blind savedefconfig, unless you are
> okay with actually loosing these options. We discussed this multiple
> times...
> 
> https://lore.kernel.org/all/20201130202501.GA32878@kozik-lap/
> and some other threads
> 

I see. When I run savedefconfig, I always checked .config changes between old and new to avoid such missing.
I thought there were some things that needed to be fixed manually, which could lead to mistakes.
Also, if you make a mess with a manual update, it makes the next update harder.
Thanks for pointing that out and explaining the history :)

Best Regards,
Chanho Park


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
