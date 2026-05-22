Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1315BCD5BB1
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iBrY+eq/BAeKtNu+SDmU851KDmVA1ot0ZhgULMq1BmE=; b=SmQK4I9H7VeWyo
	VMQzXik/Xs00m1V148rm5vSTos1qdUtI72NOxz1qI6afZe/8VsFWsBxlNFgC+Y8ppwy6mnPAG0Q6N
	ynnhQVLQTuOJIEak4v18QFaQd44T4apa8wF4kYichApP4ll2QlU86G0g2RXrUJHSA88EEphvBq5LE
	D9zNJkQvK0b3i02XMr4QN6ix2szEgsIioJFzD2rVFXnfYHUxdadHEOzXX2GBU1nuNpmte0HqxmLEV
	3acslHwjsJklVqDG+bnWNTfu1kXXdUtkrH47wDuTfoZHEtHvNS4h2e7SqlcXZmG+BLeOnmgNYcG6Z
	MXWEDEu0ckJpEVM7Eu5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPh1-0000000AvF5-2EfG;
	Fri, 22 May 2026 13:13:35 +0000
Received: from smtp-usa1.onexmail.com ([52.205.10.60])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPgz-0000000AvDp-1GRg
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 13:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779455546;
	bh=Yh/ET9BIE0+DfHxutKWeEWc5++1D8UEwlk+vOWotn00=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=ro3CP7j3gYX6dAaADsBSK9GT79EJLGy5J8ZpAdzoquJV0vd10yzhXFSSf8bkMf9gB
	 pffT/Zx3OtfRde92kCs6tvcVHW3auOTYa5xpqYdLa+UhziQcJ7nYn9lQBAGIws/omK
	 q1IM9xOUdzTdNvagLbxoBrTI8lvDEWaqjDXI1DpY=
X-QQ-mid: zesmtpgz3t1779455537t7d74ee71
X-QQ-Originating-IP: IxTqUQlS3b6S7BGCxY9uBCCoeQZJ4+tCFShJs25qSqQ=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 21:12:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8814191299974206583
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v3 0/2] ASoC: spacemit: add K3 SoC support
Date: Fri, 22 May 2026 21:12:13 +0800
Message-Id: <20260522-k3-i2s-v3-0-08e3eb811d93@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBBFf4V0bUk7vKwr/8O4oGWQUXmEQoMh/
 LsUg25c3uScMzMziz2hZadgZj06stQ264gOATNV3tyQU7FuBgJSEUPGHxEnsDyBHEEeRRanKVv
 hrseSpi10uX62HfUdzeBtT1Rkh7Z/bZec9NweVXvUSS44lKhUoaVEo89PasYptF1usKYhNG3Nf
 N3Bz0/E9ykHq69MoUuV6CyJor/+sixv2a6YYfcAAAA=
X-Change-ID: 20260427-k3-i2s-52ae21807466
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779455534; l=2050;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=PtpF+cuIJUZq/GMFnyapf2U8HG58qtqnHkvpxeqSh3c=;
 b=lTteNfa6oOcdvZ49tS0OQzaY1PQEqdcFR/zGqzJDm+azeZdn0b1eUdD+QeiGs6e28rC2Juh0q
 LWCxiRIuQTOCrqijofRYzVLD6Y3xZgPyV6KDe7OTgPAkotf+1/o5gDd
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NXNjDmVQe9XhOvLTqG33Fgga9sfP7+EI4E115ho4dbUqhhHB4U+T76Hb
	YcEOf+fviXDYbgolEnGWdcnFzyMO5aqbxuCv+tYo6h0ZpJWhQZQ2P0owRy581bXOPb/riD5
	+604n22oRM3eMUP/kQ2SHOZXxUAniAwYQa9YC2aY5rpSyL8NWbExKD48ohZE+RQRiI2uUX7
	2zJ14b7Co26670hfHcoIRxCl2Rrn64IVTFUqYYoqQTZQ7/pIY5VggXA1GL0OBcOF/lgMS9D
	OKMcoc9wjauyAOXaLDq++B5k7uXpfF89pImvo6sUCqlsPHdkBry7BSsvCRsUFFMNygFDUJm
	6AX7hiyJpOcZdYgOUteiRjHRUuLfGbvE5zmLAST8Jks++/YGEPsfQ3/NBqKuNMk9wCQ/FXA
	xIHwsitex46HlcTe6Tazr/HgiPDnBdthJ08E2nTbIVmbRvxeBnmHpx6d61wGfx8EqTnJeR7
	YkLNi6e4mqpYpIR0wsugLeyPxbxjRXeU9XeVkB6czjRqYo33e2XPhHnMnK+IdQQZWLMJASA
	75C+UBUt0ahZJFxeg3xSGFBVQilgWO8xv+NeETG9O1Y7VQMWuhLM4XTbCV1WZnlodSYnp5T
	mQ5BXS5/WONXav+XwJYkKYqi1hLW1oVOnyLgSgzlCBS2O0z560ZMm9GTGMCYUqwejGpi7Yh
	gP1jQy/JCdHbMOk/EAFt52iUqZa9v0DzKovcuejWBcHxY173/eMtJAGYtSshUWobvTcjqrc
	klQV7dcy3cJAOpGhMsxZvn2743iaZTwRCZY4HqOpioenJlVr83anEQWotY39bvfWd03TGix
	JajSQH4TiLulueNHw1aGbf0tBEO9lPCbs+YanLUTNrk2uNyFnPSvTCR38zXN8k0YtelVZSW
	gk11sXEok03BgTS5LKUTDYQg6sNdBexLUjg+/FFl3781I9SLvq1ZZ6CSfT25B+yio/VPrxq
	1TtksOcQfhfZgCnePRKcGt9YkN6t4WCF8L3a5/ZhLzeUDrNH6cLUITnGgP3vMuZ05tnLgEO
	Vau5kT/otvEclDz3vXfyBtCDqKEXTP5+sYiW0pPA1oNO+Fm5izjV6x61uTuiNY4X9VsZnZT
	cxeSpJPpTGQiodoqqStS/O7kVenOUC+3Wi/dwNe+VLYvB6oDenkAhEmAkZOnPe8Rdv+5CDU
	GzmjU6ebAg13JFepDOBwZ4BSLSs8OkhgXFGA4rA2zKB+QYU=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_061333_879857_DFE0155F 
X-CRM114-Status: UNSURE (   8.67  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBzZXJpZXMgYWRkcyBLMyBTb0Mgc3VwcG9ydCBmb3IgdGhlIFNwYWNlbWlUIEkyUyBjb250
cm9sbGVyIGRyaXZlci4KClBhdGNoIDEgYWRkcyB0aGUgZHQtYmluZGluZ3MgZm9yIHRoZSBzcGFj
ZW1pdCxrMy1pMnMgY29tcGF0aWJsZS4gVGhlIEszClNvQyB1c2VzIHRoZSBzYW1lIEkyUyBJUCBh
cyBLMSBidXQgcmVxdWlyZXMgYWRkaXRpb25hbCBjbG9ja3MKKHN5c2Nsa19kaXYsIGNfc3lzY2xr
LCBjX2JjbGspIHRoYXQgYXJlIHNoYXJlZCBhY3Jvc3MgbXVsdGlwbGUgSTJTCmNvbnRyb2xsZXJz
LgoKUGF0Y2ggMiBhZGRzIGRyaXZlciBzdXBwb3J0IGZvciBLMyBTb0Mgd2l0aCBhZGRpdGlvbmFs
IGNsb2Nrcy4KClNpZ25lZC1vZmYtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGlu
dXguc3BhY2VtaXQuY29tPgotLS0KQ2hhbmdlcyBpbiB2MzoKLSByZW1vdmUgcGF0Y2ggMy8zLCBz
ZW5kIGl0IGFzIGEgc3RhbmRhbG9uZSBwYXRjaCBsYXRlcgotIExpbmsgdG8gdjI6IGh0dHBzOi8v
cGF0Y2gubXNnaWQubGluay8yMDI2MDUwNy1rMy1pMnMtdjItMC05Y2RiZjk1Yjc1MzNAbGludXgu
c3BhY2VtaXQuY29tCgpDaGFuZ2VzIGluIHYyOgotIERyb3AgYnVnIGZpeCBwYXRjaGVzICgxLTMv
Nykg4oCUIHBhdGNoZXMgMi0zIGFscmVhZHkgbWVyZ2VkLCBwYXRjaCAxCiAgc3BsaXQgaW50byBh
IHN0YW5kYWxvbmUgc2VyaWVzCi0gRHJvcCBmaXhlZC1zYW1wbGUtcmF0ZSBwYXRjaGVzICg1LTYv
Nykg4oCUIHdpbGwgYWRkcmVzcyBzaGFyZWQgQkNMSwogIGNvbnN0cmFpbnQgYXQgdGhlIEFTb0Mg
Y29yZSBsZXZlbCBpbiBhIHNlcGFyYXRlIHNlcmllcwotIHVwZGF0ZSBjb21taXQgbXNnICgxLzcp
Ci0gQWRkIHJvYidzIHRhZwotIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8y
MDI2MDQyOS1rMy1pMnMtdjEtMC0yZmU5OWRiMTFlY2JAbGludXguc3BhY2VtaXQuY29tCgpUbzog
TGlhbSBHaXJkd29vZCA8bGdpcmR3b29kQGdtYWlsLmNvbT4KVG86IE1hcmsgQnJvd24gPGJyb29u
aWVAa2VybmVsLm9yZz4KVG86IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+ClRvOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+ClRvOiBDb25vciBEb29sZXkgPGNv
bm9yK2R0QGtlcm5lbC5vcmc+ClRvOiBZaXh1biBMYW4gPGRsYW5Aa2VybmVsLm9yZz4KVG86IFRy
b3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPgpUbzogSmFyb3Ns
YXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej4KVG86IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5j
b20+CkNjOiBsaW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnCkNjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBzcGFjZW1p
dEBsaXN0cy5saW51eC5kZXYKQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKCi0tLQpU
cm95IE1pdGNoZWxsICgyKToKICAgICAgQVNvQzogZHQtYmluZGluZ3M6IGFkZCBTcGFjZW1pVCBL
MyBTb0MgY29tcGF0aWJsZQogICAgICBBU29DOiBzcGFjZW1pdDogYWRkIEszIFNvQyBzdXBwb3J0
IHdpdGggYWRkaXRpb25hbCBjbG9ja3MKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9z
cGFjZW1pdCxrMS1pMnMueWFtbCB8IDMxICsrKysrKysrKysrKysrKysrLS0KIHNvdW5kL3NvYy9z
cGFjZW1pdC9rMV9pMnMuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMzYgKysrKysrKysrKysr
KysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQotLS0KYmFzZS1jb21taXQ6IGY1OGYyZTAxMzdjMjEzMmEwOGExYWI0MjcyMGE5NTQwY2Yw
MDkzYTgKY2hhbmdlLWlkOiAyMDI2MDQyNy1rMy1pMnMtNTJhZTIxODA3NDY2CgpCZXN0IHJlZ2Fy
ZHMsCi0tICAKVHJveSBNaXRjaGVsbCA8dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
