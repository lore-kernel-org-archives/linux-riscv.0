Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A66C25B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 17:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ac+096RK7RUbf3fk77UpkfPuJbUG+VACLLxToFwC57s=; b=sBv7lwpDjVUYp2
	/YzFtekfaaITbm5L03a4P54D58crYSaVsEY8DDgAZa8h6foWKjxX4ox2F54es3/6vxsQU5ahqvyBf
	aca5YaqBaXgeJzNrv8cXnukPt16o1/enC0g0Diq+XSbupM/QREUIYCMZaicpQwDCyXI44Rt0XgiJT
	2NwxmfoM63RliIzg0x8WKKhheW9YwQ5Anjy6DBQNGHoSBy82+Ar05eXN+KjhxvJH3GPOEq++oo2YI
	QkMvBWJ0F60dqrCtG18WXefi654Tb0Fk1RXJnLL+ouq19y+n61+OiPF3j1IPi+nxOh+3a8WSEAwXx
	zLj5Vene+C6GuzfFejjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0Qr-00000001WQO-0Ppy;
	Tue, 28 May 2024 17:16:17 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBXrB-0000000EcoK-2det
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 10:45:35 +0000
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id BU1Jsv5uprtmgBXqwsr1HU; Mon, 27 May 2024 10:45:18 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id BXqvsLdSLIbmHBXqvsb8xQ; Mon, 27 May 2024 10:45:17 +0000
X-Authority-Analysis: v=2.4 cv=V/R70/ni c=1 sm=1 tr=0 ts=6654643d
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=TpHVaj0NuXgA:10 a=-Ou01B_BuAIA:10 a=thD_vAUaAAAA:8
 a=PHq6YzTAAAAA:8 a=VwQbUJbxAAAA:8 a=q2727y1HDB8PbVJpZgoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Kl19cmx7V54we018lLRm:22 a=ZKzU8r6zoKMcqsNulkmm:22
 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=aUdqAH9GyHh2gGt9rAEDpDY6ZVQgxj4JgC7F5xnaUIY=; b=AW08ziETFpPq9nt3K5E4rg9qIb
	TB8iJt/978hcyy9ZJMDZOLzFEdiWeCN0A1pFVYpc+WFqsx3ZAWz11DdCxkbws8zHXx6of35e0m0Ba
	x8xa53VRegGuwEs7i/7rzZJjktPia6dFyec59HPHoDtvf3OQwUcAN7+CeJMUZk7/Ga123viY73W3c
	BlGhixembTig/EKu5yBGKjcyaCsLt+UwD+qNkvUtz91DKI9CFLNBQaHDFOVtY+PVWpzBGhy0sZ2MJ
	HMX/bvLLqcO8chkjzWzoJTCoqAWDCbw8rsmdld9AFRnW7qbWq+WDjr3rvvE6QTWqAAKY+nc/mY/om
	SzXiD6pg==;
Received: from c-98-207-139-8.hsd1.ca.comcast.net ([98.207.139.8]:40150 helo=[10.0.1.47])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <re@w6rz.net>)
	id 1sBXqu-001gJc-2a;
	Mon, 27 May 2024 04:45:16 -0600
To: Guenter Roeck <linux@roeck-us.net>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 regressions@lists.linux.dev, linux-clk@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
From: Ron Economos <re@w6rz.net>
Subject: Re: [PATCH] clkdev: report over-sized strings when creating clkdev
Message-ID: <28114882-f8d7-21bf-4536-a186e8d7a22a@w6rz.net>
Date: Mon, 27 May 2024 03:45:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux armv7l; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 98.207.139.8
X-Source-L: No
X-Exim-ID: 1sBXqu-001gJc-2a
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-98-207-139-8.hsd1.ca.comcast.net ([10.0.1.47]) [98.207.139.8]:40150
X-Source-Auth: re@w6rz.net
X-Email-Count: 6
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJaWEs+X2kufase7fvcHs0hQE+4JEXlUfirU6oA0yskJK/TvfTbr5R1l/+CIBo7S9y7IfPYXQ+IT5ioJP1Hj1BxA+nvHz6RXJ2LoLo0gcKC9nV2rwUrj
 Rg9NuDJTao+oRvgrakyH/ozM9+OS44QT/2S5z97zIOpf521kVqGQWXuAgUQQ9HrR/iZ/3u7Ao5rvag7A0aYICRhpwv2wPysrctY=
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_034533_756989_BCF390C9 
X-CRM114-Status: GOOD (  17.67  )
X-Mailman-Approved-At: Tue, 28 May 2024 10:16:13 -0700
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXkgMTcsIDIwMjQgYXQgMDM6MDk6MTRQTSAtMDcwMCwgR3VlbnRlciBSb2VjayB3
cm90ZToKID4gSGksCiA+CiA+IE9uIEZyaSwgTWFyIDE1LCAyMDI0IGF0IDExOjQ3OjU1QU0gKzAw
MDAsIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKID4gPiBSZXBvcnQgYW4gZXJyb3Igd2hl
biBhbiBhdHRlbXB0IHRvIHJlZ2lzdGVyIGEgY2xrZGV2IGVudHJ5IHJlc3VsdHMgaW4gYQogPiA+
IHRydW5jYXRlZCBzdHJpbmcgc28gdGhlIHByb2JsZW0gY2FuIGJlIGVhc2lseSBzcG90dGVkLgog
PiA+CiA+ID4gUmVwb3J0ZWQgYnk6IER1YW5xaWFuZyBXZW4gPGR1YW5xaWFuZ3dlbkBuZXQtc3dp
ZnQuY29tPgogPiA+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1rK2tl
cm5lbEBhcm1saW51eC5vcmcudWs+CiA+ID4gUmV2aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2Jv
eWRAa2VybmVsLm9yZz4KID4KID4gV2l0aCB0aGlzIHBhdGNoIGluIHRoZSBtYWlubGluZSBrZXJu
ZWwsIEkgZ2V0CiA+CiA+IDEwMDAwMDAwLmNsb2NrLWNvbnRyb2xsZXI6Y29yZXBsbDogZGV2aWNl
IElEIGlzIGdyZWF0ZXIgdGhhbiAyNAogPiBzaWZpdmUtY2xrLXByY2kgMTAwMDAwMDAuY2xvY2st
Y29udHJvbGxlcjogRmFpbGVkIHRvIHJlZ2lzdGVyIGNsa2RldiAKZm9yIGNvcmVwbGw6IC0xMgog
PiBzaWZpdmUtY2xrLXByY2kgMTAwMDAwMDAuY2xvY2stY29udHJvbGxlcjogY291bGQgbm90IHJl
Z2lzdGVyIGNsb2NrczogLTEyCiA+IHNpZml2ZS1jbGstcHJjaSAxMDAwMDAwMC5jbG9jay1jb250
cm9sbGVyOiBwcm9iZSB3aXRoIGRyaXZlciAKc2lmaXZlLWNsay1wcmNpIGZhaWxlZCB3aXRoIGVy
cm9yIC0xMgogPiAuLi4KID4gcGxhdGZvcm0gMTAwNjAwMDAuZ3BpbzogZGVmZXJyZWQgcHJvYmUg
cGVuZGluZzogcGxhdGZvcm06IHN1cHBsaWVyIAoxMDAwMDAwMC5jbG9jay1jb250cm9sbGVyIG5v
dCByZWFkeQogPiBwbGF0Zm9ybSAxMDAxMDAwMC5zZXJpYWw6IGRlZmVycmVkIHByb2JlIHBlbmRp
bmc6IHBsYXRmb3JtOiBzdXBwbGllciAKMTAwMDAwMDAuY2xvY2stY29udHJvbGxlciBub3QgcmVh
ZHkKID4gcGxhdGZvcm0gMTAwMTEwMDAuc2VyaWFsOiBkZWZlcnJlZCBwcm9iZSBwZW5kaW5nOiBw
bGF0Zm9ybTogc3VwcGxpZXIgCjEwMDAwMDAwLmNsb2NrLWNvbnRyb2xsZXIgbm90IHJlYWR5CiA+
IHBsYXRmb3JtIDEwMDQwMDAwLnNwaTogZGVmZXJyZWQgcHJvYmUgcGVuZGluZzogcGxhdGZvcm06
IHN1cHBsaWVyIAoxMDAwMDAwMC5jbG9jay1jb250cm9sbGVyIG5vdCByZWFkeQogPiBwbGF0Zm9y
bSAxMDA1MDAwMC5zcGk6IGRlZmVycmVkIHByb2JlIHBlbmRpbmc6IHBsYXRmb3JtOiBzdXBwbGll
ciAKMTAwMDAwMDAuY2xvY2stY29udHJvbGxlciBub3QgcmVhZHkKID4gcGxhdGZvcm0gMTAwOTAw
MDAuZXRoZXJuZXQ6IGRlZmVycmVkIHByb2JlIHBlbmRpbmc6IHBsYXRmb3JtOiAKc3VwcGxpZXIg
MTAwMDAwMDAuY2xvY2stY29udHJvbGxlciBub3QgcmVhZHkKID4KID4gd2hlbiB0cnlpbmcgdG8g
Ym9vdCBzaWZpdmVfdSBpbiBxZW11LgogPgogPiBBcHBhcmVudGx5LCAiMTAwMDAwMDAuY2xvY2st
Y29udHJvbGxlciIgaXMgdG9vIGxvbmcuIEFueSBzdWdnZXN0aW9uIG9uCiA+IGhvdyB0byBzb2x2
ZSB0aGUgcHJvYmxlbSA/IEkgZ3Vlc3MgdXNpbmcgZGV2X25hbWUoZGV2KSBhcyBkZXZfaWQgCnBh
cmFtZXRlcgogPiBmb3IgY2xrX2h3X3JlZ2lzdGVyX2Nsa2RldigpIGlzIG5vdCBvciBubyBsb25n
ZXIgYSBnb29kIGlkZWEuCiA+IFdoYXQgZWxzZSBzaG91bGQgYmUgdXNlZCBpbnN0ZWFkID8KClRo
aXMgaXNzdWUgY2F1c2VzIGEgY29tcGxldGUgYm9vdCBmYWlsdXJlIG9uIHJlYWwgaGFyZHdhcmUg
KFNpRml2ZSAKVW5tYXRjaGVkKS4gVGhlIGJvb3Qgb25seSBnZXRzIGFzIGZhciBhcyAiU3RhcnRp
bmcga2VybmVsIC4uLiIgd2l0aCBubyAKb3RoZXIgaW5kaWNhdGlvbiBvZiB3aGF0J3MgZ29pbmcg
b24uCgpHdWVudGVyJ3Mgc3VnZ2VzdGVkIHBhdGNoIHNvbHZlcyB0aGUgaXNzdWUuCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbGsvc2lmaXZlL3NpZml2ZS1wcmNpLmMgCmIvZHJpdmVycy9jbGsvc2lm
aXZlL3NpZml2ZS1wcmNpLmMKaW5kZXggMjViOGUxYTgwZGRjLi4yMGNjOGY0MmQ5ZWIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvY2xrL3NpZml2ZS9zaWZpdmUtcHJjaS5jCisrKyBiL2RyaXZlcnMvY2xr
L3NpZml2ZS9zaWZpdmUtcHJjaS5jCkBAIC01MzcsNyArNTM3LDcgQEAgc3RhdGljIGludCBfX3By
Y2lfcmVnaXN0ZXJfY2xvY2tzKHN0cnVjdCBkZXZpY2UgCipkZXYsIHN0cnVjdCBfX3ByY2lfZGF0
YSAqcGQsCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIHI7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9CgotwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByID0gY2xrX2h3X3JlZ2lzdGVyX2Nsa2RldigmcGljLT5odywg
cGljLT5uYW1lLCAKZGV2X25hbWUoZGV2KSk7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHIgPSBjbGtfaHdfcmVnaXN0ZXJfY2xrZGV2KCZwaWMtPmh3LCBwaWMtPm5hbWUsICJwcmNpIik7
CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocikgewogwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl93YXJuKGRldiwgIkZhaWxl
ZCB0byByZWdpc3RlciBjbGtkZXYgZm9yIAolczogJWRcbiIsCiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5pdC5uYW1l
LCByKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
