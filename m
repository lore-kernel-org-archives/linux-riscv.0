Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A06C3ABD9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hNV02jGlA7gPzmbetli6lrFA/FdtpAHUIDEfnoVPkos=; b=IDQVmTOnxRd4MA
	Ixx4kICK1XzkBg0xLP5mh9JKD6QDZ6vEyG5eUS2y17YDH0cJCEeWpFWk4bLGjPc83ay2KfsJAEdNy
	yOwh9cFYo0K21pdJ6tk1uJ8Wk4o/P5Q4mXEkLGQSc4SbP1yyuuTQKcrWm+aB1kPfAtF+KyVrhpjyx
	DR/P2wXdryO045+az3CzMNHgv0XjXd5y4TNyxaqHV+tlhyEnqBaFa1MowGUpqnB/czdZetVfluKMQ
	RJmR+baU6CTSg2ic0A37W0V2kHzHoXoPSVaONZDevYL9DTZKyvYg2DedlmpwzLUhp4p7etS92g2pf
	Gd/qBvPPncS/sTTD3lEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB5Y-0000000F3BQ-0OYD;
	Wed, 14 May 2025 12:19:56 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8p8-0000000EjFl-0L4S
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:54:53 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 54E9rpkt092294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 17:53:51 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Wed, 14 May 2025
 17:53:51 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>,
        Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v4 0/9] add Voyager board support
Date: Wed, 14 May 2025 17:53:41 +0800
Message-ID: <20250514095350.3765716-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 54E9rpkt092294
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_025450_481336_47607CE8 
X-CRM114-Status: GOOD (  14.10  )
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

VGhlIFZveWFnZXIgaXMgYSA5LjbigJ0geCA5LjbigJ0gTWljcm8gQVRYIGZvcm0gZmFjdG9yIGRl
dmVsb3BtZW50IGJvYXJkCmluY2x1ZGluZyBBbmRlcyBRaUxhaSBTb0MuIFRoaXMgcGF0Y2ggc2Vy
aWVzIGFkZHMgbWluaW1hbCBkZXZpY2UgdHJlZQpmaWxlcyBmb3IgdGhlIFFpTGFpIFNvQyBhbmQg
dGhlIFZveWFnZXIgYm9hcmQgWzFdLgoKTm93IG9ubHkgc3VwcG9ydCBiYXNpYyB1YXJ0IGRyaXZl
cnMgdG8gYm9vdCB1cCBpbnRvIGEgYmFzaWMgY29uc29sZS4gT3RoZXIKZmVhdHVyZXMgd2lsbCBi
ZSBhZGRlZCBsYXRlci4KClsxXSBodHRwczovL3d3dy5hbmRlc3RlY2guY29tL2VuL3Byb2R1Y3Rz
LXNvbHV0aW9ucy9hbmRlc2hhcGUtcGxhdGZvcm1zL3FpbGFpLWNoaXAvCi0tLQoKQ2hhbmdlbG9n
IGZyb20gdjMgdG8gdjQ6CiAgLSBSZXN0b3JlIHRoZSBtb2RpZmljYXRpb24gdG8gY2FjaGUtc2V0
cyBhbmQgY2FjaGUtc2l6ZSBpbiBwYXRjaCA2CiAgLSBEbyBub3QgY29uc3RyYWluIHJlbmVzYXMs
cjlhMDdnMDQzZi1heDQ1bXAtY2FjaGUgc2luY2UgaXQncyBpbmRlcGVuZGVudCB0bwogICAgdGhp
cyBzZXJpZXMuCiAgLSBEZWxldGUgdGhlIHJlZHVuZGFudCBleGFtcGxlIGFkZGVkIGJ5IHBhdGNo
IDYKCnYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA1MTMwOTQ5MzMuMTYzMTQ5
My0xLWJlbjcxN0BhbmRlc3RlY2guY29tLwoKQ2hhbmdlbG9nIGZyb20gdjIgdG8gdjM6CiAgLSBS
ZWJhc2UgdGhlIHNlcmllcyBvbiBDb25vci9yaXNjdi1zb2MtZm9yLW5leHQKICAtIFJlZm9ybSBw
YXRjaCA2IGFzIHN1Z2dlc3RlZCBieSBDb25vcgogIC0gTW9kaWZ5IGwyX2NhY2hlJ3MgY29tcGF0
aWJsZSBpbiBxaWxhaS5kdHNpIGR1ZSB0byBwYXRjaCA2CiAgLSBBZGQgQ29ub3IncyBBY2tlZC1i
eSB0YWcgdG8gcGF0Y2ggNAogIC0gQWRkIENvbm9yJ3MgQWNrZWQtYnkgdGFnIHRvIHBhdGNoIDUK
ICAtIEFkZCBDb25vcidzIEFja2VkLWJ5IHRhZyB0byBwYXRjaCA5Cgp2MjogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjUwNTAzMTUxODI5LjYwNTAwNi01LWJlbjcxN0BhbmRlc3RlY2gu
Y29tLwoKQ2hhbmdlbG9nIGZyb20gdjEgdG8gdjI6CiAgLSBBZGQgZGV0YWlsZWQgZGVzY3JpcHRp
b25zIHRvIFBMSUNfU1cgYW5kIFBMTVQwCiAgLSBNb3ZlIHRoZSBhbGlhc2VzIG5vZGUgYW5kIG1l
bW9yeSBub2RlIGZyb20gcWlsYWkuZHRzaSB0byBxaWxhaS12b3lhZ2VyLmR0cwogIC0gRHJvcCAi
c3RhdHVzID0gb2theSIgaW4gZWFjaCBDUFUgbm9kZSBzaW5jZSB0aGUgc3RhdHVzIHByb3BlcnR5
IGlzIGJ5CiAgICBkZWZhdWx0ICJva2F5IgogIC0gUmVvcmRlciB0aGUgbm9kZXMgaW4gcWlsYWku
ZHRzaSBieSB1bml0IGFkZHJlc3MgaW4gYXNjZW5kaW5nIG9yZGVyCiAgLSBBZGQgbXlzZWxmIGFz
IHRoZSBtYWludGFpbmVyIG9mIEFuZGVzJ3MgU29DIHRyZWUKICAtIEFkZCBSb2IncyBSZXZpZXdl
ZC1ieSB0YWcgdG8gcGF0Y2ggMgogIC0gQWRkIFJvYidzIEFja2VkLWJ5IHRhZyB0byBwYXRjaCAz
CiAgLSBBZGQgUm9iJ3MgQWNrZWQtYnkgdGFnIHRvIHBhdGNoIDYuCgp2MTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjUwNDA3MTA0OTM3LjMxNTc4My0xLWJlbjcxN0BhbmRlc3RlY2gu
Y29tLwoKLS0tCkJlbiBab25nLVlvdSBYaWUgKDkpOgogIHJpc2N2OiBhZGQgQW5kZXMgU29DIGZh
bWlseSBLY29uZmlnIHN1cHBvcnQKICBkdC1iaW5kaW5nczogcmlzY3Y6IGFkZCBBbmRlcyBRaUxh
aSBTb0MgYW5kIHRoZSBWb3lhZ2VyIGJvYXJkIGJpbmRpbmdzCiAgZHQtYmluZGluZ3M6IGludGVy
cnVwdC1jb250cm9sbGVyOiBhZGQgQW5kZXMgUWlMYWkgUExJQwogIGR0LWJpbmRpbmdzOiBpbnRl
cnJ1cHQtY29udHJvbGxlcjogYWRkIEFuZGVzIG1hY2hpbmUtbGV2ZWwgc29mdHdhcmUKICAgIGlu
dGVycnVwdCBjb250cm9sbGVyCiAgZHQtYmluZGluZ3M6IHRpbWVyOiBhZGQgQW5kZXMgbWFjaGlu
ZSB0aW1lcgogIGR0LWJpbmRpbmdzOiBjYWNoZTogYWRkIFFpTGFpIGNvbXBhdGlibGUgdG8gYXg0
NW1wCiAgcmlzY3Y6IGR0czogYW5kZXM6IGFkZCBRaUxhaSBTb0MgZGV2aWNlIHRyZWUKICByaXNj
djogZHRzOiBhbmRlczogYWRkIFZveWFnZXIgYm9hcmQgZGV2aWNlIHRyZWUKICByaXNjdjogZGVm
Y29uZmlnOiBlbmFibGUgQW5kZXMgU29DCgogLi4uL2NhY2hlL2FuZGVzdGVjaCxheDQ1bXAtY2Fj
aGUueWFtbCAgICAgICAgIHwgIDE4ICstCiAuLi4vYW5kZXN0ZWNoLHBsaWNzdy55YW1sICAgICAg
ICAgICAgICAgICAgICAgfCAgNTQgKysrKysKIC4uLi9zaWZpdmUscGxpYy0xLjAuMC55YW1sICAg
ICAgICAgICAgICAgICAgICB8ICAgMSArCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9h
bmRlcy55YW1sICAgICAgfCAgMjUgKysrCiAuLi4vYmluZGluZ3MvdGltZXIvYW5kZXN0ZWNoLHBs
bXQwLnlhbWwgICAgICAgfCAgNTMgKysrKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgOSArCiBhcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhICAgICAg
ICAgICAgICAgICAgICAgfCAgIDIgKy0KIGFyY2gvcmlzY3YvS2NvbmZpZy5zb2NzICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgOSArCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgfCAgIDEgKwogYXJjaC9yaXNjdi9ib290L2R0cy9hbmRlcy9NYWtlZmlsZSAg
ICAgICAgICAgIHwgICAyICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMvYW5kZXMvcWlsYWktdm95YWdl
ci5kdHMgICB8ICAyOCArKysKIGFyY2gvcmlzY3YvYm9vdC9kdHMvYW5kZXMvcWlsYWkuZHRzaSAg
ICAgICAgICB8IDE4NiArKysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3YvY29uZmlncy9kZWZj
b25maWcgICAgICAgICAgICAgICAgICB8ICAgMSArCiAxMyBmaWxlcyBjaGFuZ2VkLCAzODcgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYW5kZXN0ZWNoLHBs
aWNzdy55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L2FuZGVzLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvYW5kZXN0ZWNoLHBsbXQwLnlhbWwKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FuZGVzL01ha2VmaWxlCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9hbmRlcy9xaWxhaS12b3lhZ2VyLmR0cwogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvYW5kZXMvcWlsYWkuZHRzaQoKLS0K
Mi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
