Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD41D58D78
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 17:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwpS+SfmQm6swlExerVyc+tfW2Pas5hcYjbISK832gM=; b=4NuO+TAwiIWDzI
	IEjpMPj6w1DRKPo7Awcp9shhRJuHL2xOVevUylVbkhi3Yz67OE+9RrTmmyP1sOy+ep5U8bYKJxAa9
	tBap0nmOUP8NfBJb1TWzo6Wvdzve7F8cXRXEQd4o7ytdc2PiqRxzNveEmQipy0uD1awN2ZJEkBxOd
	+cZwUg2OyzsK0n+TwVzzzTSu+CzwIFdlqYAJmgZATutZvFbEXtru+A72Ey+2djKWapRptgTJBizMf
	TlXZUytaWQmsYk04gm5sXrm3pp+oYEEQWIW1uCnilAqGdarEoDRLsDllzHoPcdgXRZOXR8d+huNSp
	QOBDRUWjfIQpfsjpBMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdMV-00000008o4h-3rtt;
	Mon, 25 Nov 2024 17:59:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdMS-00000008o1j-1hvt
	for linux-riscv@lists.infradead.org;
	Mon, 25 Nov 2024 17:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732557540; x=1764093540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U+npF1NvJtoJ4T6hVxDwsCJ5YF+JSUTcWrivx8R4two=;
  b=DSSV+74dTFO1dT8hmwIO6BqdjFuvQnZakpYixbs/5xuL80qbzIKnPeMG
   JKv4bR08aDeZMdQEsNz0Aoihk0yMa82biWY3rbUz0n9nLewPe3XhUSDOO
   BzdQNZRzQpVAAkoby8fqdnWsLcS//0tXrqBDp+qti7I8CJ+AiFYjR1JBb
   jKLgkoW9lGrjgApYuWSXjC0rKLyd+pCkJZiMwHg+NAccjCNZlLIvqAlDW
   QZw4hBz5wNQA5GiBHFz2IssPnht6Ouuf6oIie+EcZiyFdpWgI556HHf3D
   tAF3pjHuZVTBfoEb5+VnAQ5IKIYsZIQGVdQ2g4k6mjqN0nEuOf/6rvStm
   g==;
X-CSE-ConnectionGUID: QcIy3zy5RLCJ7zVSqoxwVg==
X-CSE-MsgGUID: rlNRxlbmRjCAsP7JRKUTyw==
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="38361999"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Nov 2024 10:58:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Nov 2024 10:58:45 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 25 Nov 2024 10:58:42 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<ycliang@andestech.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<peterlin@andestech.com>, <samuel.holland@sifive.com>,
	<conor.dooley@microchip.com>, <alexghiti@rivosinc.com>,
	<ruanjinjie@huawei.com>, <takakura@valinux.co.jp>, <conor+dt@kernel.org>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v4 3/4] dt-bindings: mailbox: add binding for Microchip IPC mailbox controller
Date: Mon, 25 Nov 2024 17:58:17 +0000
Message-ID: <20241125175818.213108-4-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125175818.213108-1-valentina.fernandezalanis@microchip.com>
References: <20241125175818.213108-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_095900_474395_232A3F01 
X-CRM114-Status: GOOD (  14.28  )
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

QWRkIGEgZHQtYmluZGluZyBmb3IgdGhlIE1pY3JvY2hpcCBJbnRlci1Qcm9jZXNzb3IgQ29tbXVu
aWNhdGlvbiAoSVBDKQptYWlsYm94IGNvbnRyb2xsZXIuCgpTaWduZWQtb2ZmLWJ5OiBWYWxlbnRp
bmEgRmVybmFuZGV6IDx2YWxlbnRpbmEuZmVybmFuZGV6YWxhbmlzQG1pY3JvY2hpcC5jb20+Ci0t
LQogLi4uL2JpbmRpbmdzL21haWxib3gvbWljcm9jaGlwLHNiaS1pcGMueWFtbCAgIHwgMTExICsr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExMSBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gv
bWljcm9jaGlwLHNiaS1pcGMueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tYWlsYm94L21pY3JvY2hpcCxzYmktaXBjLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9taWNyb2NoaXAsc2JpLWlwYy55YW1sCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYjY5YWY4NWVjNjA4Ci0tLSAv
ZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gv
bWljcm9jaGlwLHNiaS1pcGMueWFtbApAQCAtMCwwICsxLDExMSBAQAorIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0t
LQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tYWlsYm94L21pY3JvY2hpcCxz
YmktaXBjLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFz
L2NvcmUueWFtbCMKKwordGl0bGU6IE1pY3JvY2hpcCBJbnRlci1wcm9jZXNzb3IgY29tbXVuaWNh
dGlvbiAoSVBDKSBtYWlsYm94IGNvbnRyb2xsZXIKKworbWFpbnRhaW5lcnM6CisgIC0gVmFsZW50
aW5hIEZlcm5hbmRleiA8dmFsZW50aW5hLmZlcm5hbmRlemFsYW5pc0BtaWNyb2NoaXAuY29tPgor
CitkZXNjcmlwdGlvbjoKKyAgVGhlIE1pY3JvY2hpcCBJbnRlci1wcm9jZXNzb3IgQ29tbXVuaWNh
dGlvbiAoSVBDKSBmYWNpbGl0YXRlcworICBtZXNzYWdlIHBhc3NpbmcgYmV0d2VlbiBwcm9jZXNz
b3JzIHVzaW5nIGFuIGludGVycnVwdCBzaWduYWxpbmcKKyAgbWVjaGFuaXNtLgorCitwcm9wZXJ0
aWVzOgorICBjb21wYXRpYmxlOgorICAgIG9uZU9mOgorICAgICAgLSBkZXNjcmlwdGlvbjoKKyAg
ICAgICAgICBJbnRlbmRlZCBmb3IgdXNlIGJ5IHNvZnR3YXJlIHJ1bm5pbmcgaW4gc3VwZXJ2aXNv
ciBwcml2aWxlZ2VkCisgICAgICAgICAgbW9kZSAocy1tb2RlKS4gVGhpcyBTQkkgaW50ZXJmYWNl
IGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgTWktVgorICAgICAgICAgIEludGVyLWhhcnQgQ29tbXVu
aWNhdGlvbiAoSUhDKSBJUC4KKyAgICAgICAgY29uc3Q6IG1pY3JvY2hpcCxzYmktaXBjCisKKyAg
ICAgIC0gZGVzY3JpcHRpb246CisgICAgICAgICAgSW50ZW5kZWQgZm9yIHVzZSBieSB0aGUgU0JJ
IGltcGxlbWVudGF0aW9uIGluIG1hY2hpbmUgbW9kZQorICAgICAgICAgIChtLW1vZGUpLCB0aGlz
IGNvbXBhdGlibGUgc3RyaW5nIGlzIGZvciB0aGUgTUlWX0lIQyBTb2Z0LUlQLgorICAgICAgICBj
b25zdDogbWljcm9jaGlwLG1pdi1paGMtcnRsLXYyCisKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAx
CisKKyAgaW50ZXJydXB0czoKKyAgICBtaW5JdGVtczogMQorICAgIG1heEl0ZW1zOiA1CisKKyAg
aW50ZXJydXB0LW5hbWVzOgorICAgIG1pbkl0ZW1zOiAxCisgICAgbWF4SXRlbXM6IDUKKyAgICBp
dGVtczoKKyAgICAgIHBhdHRlcm46ICJeaGFydC1bMC01XSskIgorCisgICIjbWJveC1jZWxscyI6
CisgICAgZGVzY3JpcHRpb246ID4KKyAgICAgIEZvciAibWljcm9jaGlwLHNiaS1pcGMiLCB0aGUg
Y2VsbCByZXByZXNlbnRzIHRoZSBnbG9iYWwgImxvZ2ljYWwiCisgICAgICBjaGFubmVsIElEcy4g
VGhlIG1lYW5pbmcgb2YgY2hhbm5lbCBJRHMgYXJlIHBsYXRmb3JtIGZpcm13YXJlIGRlcGVuZGVu
dC4KKworICAgICAgRm9yICJtaWNyb2NoaXAsbWl2LWloYy1ydGwtdjIiLCB0aGUgY2VsbCByZXBy
ZXNlbnRzIHRoZSBwaHlzaWNhbAorICAgICAgY2hhbm5lbCBhbmQgZG9lcyBub3QgdmFyeSBiYXNl
ZCBvbiB0aGUgcGxhdGZvcm0gZmlybXdhcmUuCisgICAgY29uc3Q6IDEKKworICBtaWNyb2NoaXAs
aWhjLWNoYW4tZGlzYWJsZWQtbWFzazoKKyAgICBkZXNjcmlwdGlvbjogPgorICAgICAgUmVwcmVz
ZW50cyB0aGUgZW5hYmxlL2Rpc2FibGUgc3RhdGUgb2YgdGhlIGJpLWRpcmVjdGlvbmFsIElIQwor
ICAgICAgY2hhbm5lbHMgd2l0aGluIHRoZSBNSVYtSUhDIElQIGNvbmZpZ3VyYXRpb24uCisKKyAg
ICAgIEEgYml0IHNldCB0byAnMScgaW5kaWNhdGVzIHRoYXQgdGhlIGNvcnJlc3BvbmRpbmcgY2hh
bm5lbCBpcyBkaXNhYmxlZCwKKyAgICAgIGFuZCBhbnkgcmVhZCBvciB3cml0ZSBvcGVyYXRpb25z
IHRvIHRoYXQgY2hhbm5lbCB3aWxsIHJldHVybiB6ZXJvLgorCisgICAgICBBIGJpdCBzZXQgdG8g
JzAnIGluZGljYXRlcyB0aGF0IHRoZSBjb3JyZXNwb25kaW5nIGNoYW5uZWwgaXMgZW5hYmxlZAor
ICAgICAgYW5kIHdpbGwgYmUgYWNjZXNzaWJsZSB0aHJvdWdoIGl0cyBkZWRpY2F0ZWQgYWRkcmVz
cyByYW5nZSByZWdpc3RlcnMuCisKKyAgICAgIFRoZSBhY3R1YWwgZW5hYmxlL2Rpc2FibGUgc3Rh
dGUgb2YgZWFjaCBjaGFubmVsIGlzIGRldGVybWluZWQgYnkgdGhlCisgICAgICBJUCBibG9ja+KA
mXMgY29uZmlndXJhdGlvbi4KKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0
aW9ucy91aW50MTYKKyAgICBtYXhpbXVtOiAweDdmZmYKKyAgICBkZWZhdWx0OiAwCisKK3JlcXVp
cmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSBpbnRlcnJ1cHRzCisgIC0gaW50ZXJydXB0LW5hbWVz
CisgIC0gIiNtYm94LWNlbGxzIgorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworYWxs
T2Y6CisgIC0gaWY6CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICBjb21wYXRpYmxlOgorICAg
ICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IG1pY3JvY2hpcCxzYmktaXBjCisg
ICAgdGhlbjoKKyAgICAgIHByb3BlcnRpZXM6CisgICAgICAgIHJlZzogZmFsc2UKKyAgICAgICAg
bWljcm9jaGlwLGloYy1jaGFuLWRpc2FibGVkLW1hc2s6IGZhbHNlCisgICAgZWxzZToKKyAgICAg
IHJlcXVpcmVkOgorICAgICAgICAtIHJlZworICAgICAgICAtIG1pY3JvY2hpcCxpaGMtY2hhbi1k
aXNhYmxlZC1tYXNrCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBtYWlsYm94IHsKKyAgICAgIGNv
bXBhdGlibGUgPSAibWljcm9jaGlwLHNiaS1pcGMiOworICAgICAgaW50ZXJydXB0LXBhcmVudCA9
IDwmcGxpYz47CisgICAgICBpbnRlcnJ1cHRzID0gPDE4MD4sIDwxNzk+LCA8MTc4PjsKKyAgICAg
IGludGVycnVwdC1uYW1lcyA9ICJoYXJ0LTEiLCAiaGFydC0yIiwgImhhcnQtMyI7CisgICAgICAj
bWJveC1jZWxscyA9IDwxPjsKKyAgICB9OworICAtIHwKKyAgICBtYWlsYm94QDUwMDAwMDAwIHsK
KyAgICAgIGNvbXBhdGlibGUgPSAibWljcm9jaGlwLG1pdi1paGMtcnRsLXYyIjsKKyAgICAgIG1p
Y3JvY2hpcCxpaGMtY2hhbi1kaXNhYmxlZC1tYXNrID0gL2JpdHMvIDE2IDwwPjsKKyAgICAgIHJl
ZyA9IDwweDUwMDAwMDAwIDB4MUMwMDA+OworICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmcGxp
Yz47CisgICAgICBpbnRlcnJ1cHRzID0gPDE4MD4sIDwxNzk+LCA8MTc4PjsKKyAgICAgIGludGVy
cnVwdC1uYW1lcyA9ICJoYXJ0LTEiLCAiaGFydC0yIiwgImhhcnQtMyI7CisgICAgICAjbWJveC1j
ZWxscyA9IDwxPjsKKyAgICB9OwotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
