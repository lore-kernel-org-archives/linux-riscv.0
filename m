Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C6CC83F1A
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 20:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=e/UnMg6f2gxRpk/O/X7svE/TKiSjO6H3pxPLMAYoA4k=; b=xKEZtlyZOHA1oaYFrVeu84BKW/
	YnkO3yP3jp4UYa+2XgzVwAkXSUCHT4znhiTfset5UnMvy7mfVVejS50YIFz0dTeR25Pttn8T0DZwF
	T/qEYj6CfOMI0xawJx/2UrpGlvgZOGqX+lgqesDEpeXWO98YTM6nvbhTUpyjtZwFujgVPVwrSAW7q
	9bCHjFNDtecC3ctiHDqx/LADliOGB1abneKNhZ/QAm5WVSA9yUvflRgfZPJCIVbRBkBLWD6RIMQPN
	ldkTXzb5rzLy6Vo22kkPXhXPwrAjnboB/ccTr537qgqTqt8nv1grq7ogxZ8Hc8QC6gTqbawf76Bfz
	rXUVUjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueJm4-00000003Rr1-2BWk;
	Tue, 22 Jul 2025 20:39:44 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueJRZ-00000003PoU-3Koc
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 20:18:35 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 69C67EC057F;
	Tue, 22 Jul 2025 16:18:30 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 22 Jul 2025 16:18:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753215510;
	 x=1753301910; bh=Ue3hOiZOTBwNx3gp3nlcLSOvWzsJyJAf9xZ1igy2wnM=; b=
	RD14oLRqFXYooq1HxJfFoI4GadRvd/tfyliOB62bB/tqyoOgqFAvCT1PngexCDcj
	vL0ztESxc35WTtHCgAoqURyN6rSlWV6UBD4jB7NVk9hwGdg+mYi7UTHOOC3tiddr
	MTY0qmuqTt/t2yDvuXVv1xtF6Hzj+ESYY36W5YVjecXFJD2Y9qtCePj1UUdnbq8r
	xtWaoVu6wNVKuvI1Vs9IlD+Ls3lDv4/YNptJPS7svS2HcHdDP+6tWDaVPNwn6B2P
	1+4aeyDSgi1pFD4dttKHz5B1vG0CgzckSRaexlKHKVeNKWJ5lZU8z0Vlu/DQIJwP
	t0ILxhlN4uciikNa9dmuag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753215510; x=
	1753301910; bh=Ue3hOiZOTBwNx3gp3nlcLSOvWzsJyJAf9xZ1igy2wnM=; b=Y
	p8M1S4UUSF+b7g0C3Ej0shzc4n816mtxBVGbrDZi56JW9EasHbufvReMTv0Iz57V
	vxNfLzkzG1iMmGq74lYyz/cx+w4qmvP6Jn8evdUlnkPM6fbPByfLYMeCHhedDzW6
	AXWGoKLJeSmNVzd5FELjsu2lHuVBXrIf0GJsSr57uORe1bOV33y8o6yzjx9+/7cm
	SNf8/qylJEmXMTDLRtnriZcJfSinm0KhM8sfy/FG4ArlJStdos/b4LvvEFrxOs9w
	tJyw1WL7t63PxqPilksHpFFRPNP6Uq7q0xHB70lVdv/WV7AMVUZPFqzoDG/bomXn
	c3ANuy422wxKy0GcERxGQ==
X-ME-Sender: <xms:FfJ_aHq1oXerL_j49jUbU7ITWARIc_x-M4Gyo-cUHuokCO5OmDPStA>
    <xme:FfJ_aBr9U5mgFibdRadpW6zZZPSnYycTpeGA4O4dtMzRBzUuDRkaOtHHoQe4GhIKF
    1OR4_tnkXfz1Cd1LPE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejheekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeetfeduheevuddtuefgueevffeludehheefheffueejudelvdehiedvffelffejtden
    ucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlvgigrghnuggvrh
    drshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhnohgthhhirghm
    rgesghhmrghilhdrtghomhdprhgtphhtthhopehlohhoohhnghdrsghinhesghhmrghilh
    drtghomhdprhgtphhtthhopehrrggsvghnuggrrdgtnhesghhmrghilhdrtghomhdprhgt
    phhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishht
    shdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsohhphhhgoheslhhishhtsh
    drlhhinhhugidruggvvhdprhgtphhtthhopehunhhitghorhhnpgifrghnghesohhuthhl
    ohhokhdrtghomh
X-ME-Proxy: <xmx:FvJ_aAiwYjrHcNNTfmKV2tv-dDBHob2hPztuW0vyr22F9uGyaouhIw>
    <xmx:FvJ_aKkfk4b_CJdAnhr1mnU5CZoEniDJ2ciK89GnwfNGAF4sY_OXLw>
    <xmx:FvJ_aOY3rrCY6HHa5Qtl7y2wvOWILQBoGsagw7S5QvF5DnGtEeml2g>
    <xmx:FvJ_aNGpFDCdakfFael6fJDf8ojRtvLd-mB3CVH20qxxthD9pVW0OA>
    <xmx:FvJ_aIODzRhOYzF843q6AJgK0Gaj5TAyxFsnGaQewSVO4xtlo5kYNnD0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E675A700065; Tue, 22 Jul 2025 16:18:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T807ab912e45cbdf6
Date: Tue, 22 Jul 2025 22:17:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chen Wang" <unicorn_wang@outlook.com>, soc@kernel.org
Cc: "Conor Dooley" <conor+dt@kernel.org>,
 "Inochi Amaoto" <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Han Gao" <rabenda.cn@gmail.com>, "Longbin Li" <looong.bin@gmail.com>
Message-Id: <217fec10-55f4-4a1b-a4a5-d498c42073a2@app.fastmail.com>
In-Reply-To: <MAUPR01MB11072115B8D6E3F2354840F5EFE56A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
References: <MAUPR01MB11072115B8D6E3F2354840F5EFE56A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.17 (v2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_131834_186889_5F91515B 
X-CRM114-Status: GOOD (  17.86  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMTYsIDIwMjUsIGF0IDAyOjMxLCBDaGVuIFdhbmcgd3JvdGU6Cj4gSGV5IEFy
bmQsCj4KPiBQbGVhc2UgcHVsbCB0aGlzIGR0IGNoYW5nZXMgZm9yIFJJU0MtVi9Tb3BoZ28uIFRo
aXMgUFIgaXMgdGhlIAo+IHJlcGxhY2VtZW50IG9mIHRoZSBvbGQgb25lIFsxXS4KPgoKSGkgQ2hl
biwKCkkganVzdCB0cmllZCB0byBwdWxsIHRoaXMgYnV0IHN0aWxsIHNlZSBhIGZldyBpc3N1ZXMg
dGhhdCBJIGhvcGUKeW91IGNhbiBpbXByb3ZlIGZpcnN0OgoKPiBUaGUgZm9sbG93aW5nIGNoYW5n
ZXMgc2luY2UgY29tbWl0IDM0N2U5ZjUwNDNjODk2OTViMDFlNjZiM2VkMTExNzU1YWZjZjE5MTE6
Cj4KPiAgwqAgTGludXggNi4xNi1yYzYgKDIwMjUtMDctMTMgMTQ6MjU6NTggLTA3MDApCj4KPiBh
cmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICDCoCBodHRwczovL2dp
dGh1Yi5jb20vc29waGdvL2xpbnV4LmdpdCB0YWdzL3Jpc2N2LXNvcGhnby1kdC1mb3ItdjYuMTcK
CllvdSBoYXZlIGJhc2VkIHRoZSBicmFuY2ggb24gbGludXgtNi4xNi1yYzYsIGJ1dCBteSBvd24g
YnJhbmNoIGlzCmJhc2VkIG9uIC1yYzMsIHNvIHB1bGxpbmcgdGhpcyBpbnRyb2R1Y2VzIGEgYmFj
a21lcmdlIG9mIGh1bmRyZWRzCm9mIHVwc3RyZWFtIGNvbW1pdHMsIHdoaWNoIEkgd291bGQgbGlr
ZSB0byBhdm9pZC4KClBsZWFzZSByZWJhc2Ugb24gdG9wIG9mIC1yYzEgaWYgcG9zc2libGUuCgo+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiBSSVNDLVYgRGV2aWNldHJlZXMgZm9yIHY2LjE3Cj4KPiBTb3BoZ286Cj4KPiBG
b3IgQ1YxOHh4IHNlcmlhbHM6Cj4gLSBBZGQgcnRjc3lzIGRldmljZSBub2RlLgo+IC0gQWRkIHJl
c2V0IGRldmljZSBub2RlLgo+IC0gQWRkIGV0aGVybmV0IGRldmljZSBub2RlLgo+IC0gQWRkIHN1
cHBvcnQgZm9yIER1byBNb2R1bGUgMDEgRXZhbHVhdGlvbiBCb2FyZC4KPiAgwqAgVGhpcyBib2Fy
ZCB1c2VzIFNHMjAwMChvbGQgY29kZW5hbWUgQ1YxODF4SCksCj4gIMKgIHdoaWNoIGlzIGR1YWwt
YXJjaCwgUklTQy1WIGFuZCBBUk02NC4gVGhpcwo+ICDCoCBwYXRjaCBhZGQgdGhlIHN1cHBvcnQg
Zm9yIEFSTTY0Lgo+IC0gRW5hYmxlIGV0aGVybmV0IGRldmljZSBmb3IgSHVhc2hhbiBQaS4KPiAt
IFJlbW92ZSB3YXJuaW5nIGZvciBtZGlvIG5vZGUuCgpGb3IgdGhlIGNvbW1pdCBsb2csIEkgZG9u
J3QgbGlrZSBsaXN0cyB0aGF0IHNpbXBseSByZXBlYXQKdGhlIG9uZS1saW5lIG1lc3NhZ2VzIGZy
b20gdGhlIHNob3J0bG9nLiBZb3UgY2FuIGxlYXZlIHRoaXMKcGFydCBmb3Igbm93IGlmIGl0IHRh
a2VzIHRvbyBsb25nIHRvIHJld3JpdGUsIGJ1dCBuZXh0IHRpbWUKdHJ5IHRvIHdyaXRlIGZ1bGwg
c2VudGVuY2VzIGRlc2NyaWJpbmcgdGhlIGNvbnRlbnRzIG92ZXJhbGwKYXMgeW91IGRpZCB3aXRo
IHRoZSBEdW8gTW9kdWxlLCBidXQgZG9uJ3QgbGlzdCBlYWNoCmFkZGVkIGRldmljZSBub2RlIHNl
cGFyYXRlbHkuCgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBBbGV4YW5kZXIgU3ZlcmRsaW4gKDcpOgo+ICDCoMKgwqDC
oMKgIHJpc2N2OiBkdHM6IHNvcGhnbzogY3YxOHh4OiBBZGQgUlRDU1lTIGRldmljZSBub2RlCj4g
IMKgwqDCoMKgwqAgZHQtYmluZGluZ3M6IHNvYzogc29waGdvOiBNb3ZlIFNvQ3MvYm9hcmRzIGZy
b20gcmlzY3YgaW50byBzb2MsIAo+IGFkZCBTRzIwMDAKPiAgwqDCoMKgwqDCoCBhcm02NDogZHRz
OiBzb3BoZ286IEFkZCBpbml0aWFsIFNHMjAwMCBTb0MgZGV2aWNlIHRyZWUKPiAgwqDCoMKgwqDC
oCBhcm02NDogZHRzOiBzb3BoZ286IEFkZCBEdW8gTW9kdWxlIDAxCj4gIMKgwqDCoMKgwqAgYXJt
NjQ6IGR0czogc29waGdvOiBBZGQgRHVvIE1vZHVsZSAwMSBFdmFsdWF0aW9uIEJvYXJkCj4gIMKg
wqDCoMKgwqAgYXJtNjQ6IEFkZCBTT1BIR08gU09DIGZhbWlseSBLY29uZmlnIHN1cHBvcnQKPiAg
wqDCoMKgwqDCoCBhcm02NDogZGVmY29uZmlnOiBFbmFibGUgcnVkaW1lbnRhcnkgU29waGdvIFNH
MjAwMCBzdXBwb3J0CgpJdCdzIG9rIHRvIG1peCByaXNjdiBhbmQgYXJtNjQgY29tbWl0cyBpbiBv
bmUgYnJhbmNoLCBidXQgdGhlIFNHMjAwMApzZXJpZXMgZnJvbSBBbGV4YW5kZXIgc2hvdWxkIHJl
YWxseSBiZSBhIHNlcGFyYXRlIGJyYW5jaC4gVGhlIHdheQpJIG9yZ2FuaXplIHRoZSBzb2MgdHJl
ZSwgSSBoYXZlIG9uZSBicmFuY2ggZm9yIGR0cyAoYW5kIGJpbmRpbmcpCmNoYW5nZXMgb24gZXhp
c3RpbmcgU29DcywgYnV0IHNlcGFyYXRlIGJyYW5jaGVzIGZvciBkZWZjb25maWcgY2hhbmdlcywK
ZHJpdmVycy97c29jLGZpcm13YXJlLHJlc2V0LC4uLn0gZXRjLgoKU2luY2UgdGhlIGFybTY0IGNv
bnRlbnRzIHRvdWNoIGJvdGggS2NvbmZpZyBhbmQgZGVmY29uZmlnIGZpbGVzLApJIHdvdWxkIGxp
a2UgdG8gc2VlIHRoZW0gaW4gb25lIGJyYW5jaCB0aGF0IGNvbWJpbmVzIHRoZSBzZzIwMDAKZHRz
L2RlZmNvbmZpZy9LY29uZmlnIGNoYW5nZXMgYW5kIHRoZWlyIHByZXJlcXVpc2l0ZXMsIHNvIEkK
Y2FuIGFkZCB0aGF0IHRvIG15IHNwZWNpYWwgIm5ld3NvYyIgYnJhbmNoIHRoYXQgY29udGFpbnMg
c2ltaWxhcgpjb21taXRzIGZvciB0aGUgbmV3bHkgYWRkZWQgcHhhMTkwOCwgY2l4LXAxIGFuZCBh
bmRlcy1xaWxhaSBTb0NzLgoKICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
