Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7718AD0C603
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1EddVIEJnTA9UOxIKdfm0U7l0Ll0Qtpmyc8XJ18iH0=; b=lK5szK9/Oun9BQ
	PosabZH8eLfs0vFCti//oOIbsPzz9K93gQ6m+ZOKnjbi3Z1GSjw9wSVT44PsjnRjc2La8jM9mprNE
	16pMz0Z91T8gqGnkLHR2Zo4/erzSqhYS/bcPBtjJmLmfsKA+f/iTIEW5Q8BRy7jLarWHMHXrzxjrZ
	wwi1xyR13F7IWz4XSNqLoB22KzoBrmEGOzStnQcsnapwFeb87ky5rc+UwlobwBtReO5SBOTC0KD4R
	/Kmk3a029PJYg5E3Mrdfb0H7Gj2MuBKIO3vM9CLEfv31nbpl2Znul4wkeFI6Ns8KtKTEDScYr3wIk
	aPXtGje8mq/a4EtJ76ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JXt-00000003fnl-0nz8;
	Fri, 25 Oct 2024 12:36:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JXp-00000003fmU-1HgM
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 12:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729859757; x=1761395757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XNbe3RDia/LjR3HAQDs4QpuQr1O4y7m0scbekuFJ+hI=;
  b=A5T4jkXETBkl0VM+y+EHm6T3AbksBvjM5H27sLH2ocAI52SOKXBH3gdb
   p8FUOo/LXeH4XYr9cCfFYOt+/aSh9VCm/24+FYqxu7xNyzEs3cFqa3cmD
   f9vUfFwiFLwzXUFVOXHAYmOvrJPjnTa7iMK34q/OFEjdgQ06Lci7XKgbH
   kI6m8Odt4O+BVfbEobNHCXjm0GpKxV55kM00pzok6lmNt6cavUrDkoCYJ
   bgIdOVegEOBJIN1PZnsohtLFY9CvDJXtD7kRc3vN30nB296UAfM+L6Oif
   UzNelaTt7+G52wf5TT/92Uy57W3I998UNlnL3G0fzOXByZIssqKlaEGJS
   w==;
X-CSE-ConnectionGUID: y4wswUVQQmyiw8JWyq9nrg==
X-CSE-MsgGUID: iL7xKj86S06lVrFidrCREQ==
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="34016784"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Oct 2024 05:35:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 25 Oct 2024 05:35:50 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 25 Oct 2024 05:35:48 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterlin@andestech.com>, <conor.dooley@microchip.com>,
	<conor+dt@kernel.org>, <ycliang@andestech.com>, <dminus@andestech.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <jassisinghbrar@gmail.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: mailbox: add binding for Microchip IPC mailbox controller
Date: Fri, 25 Oct 2024 13:51:09 +0100
Message-ID: <20241025125110.1347757-3-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025125110.1347757-1-valentina.fernandezalanis@microchip.com>
References: <20241025125110.1347757-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_053557_444193_6151F03F 
X-CRM114-Status: GOOD (  15.82  )
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
LQogLi4uL2JpbmRpbmdzL21haWxib3gvbWljcm9jaGlwLHNiaS1pcGMueWFtbCAgIHwgMTA4ICsr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwOCBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gv
bWljcm9jaGlwLHNiaS1pcGMueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tYWlsYm94L21pY3JvY2hpcCxzYmktaXBjLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9taWNyb2NoaXAsc2JpLWlwYy55YW1sCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uOTBhNzkzMjExOGI1Ci0tLSAv
ZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gv
bWljcm9jaGlwLHNiaS1pcGMueWFtbApAQCAtMCwwICsxLDEwOCBAQAorIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0t
LQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tYWlsYm94L21pY3JvY2hpcCxz
YmktaXBjLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFz
L2NvcmUueWFtbCMKKwordGl0bGU6IE1pY3JvY2hpcCBJbnRlci1wcm9jZXNzb3IgY29tbXVuaWNh
dGlvbiAoSVBDKSBtYWlsYm94IGNvbnRyb2xsZXIKKworbWFpbnRhaW5lcnM6CisgIC0gVmFsZW50
aW5hIEZlcm5hbmRleiA8dmFsZW50aW5hLmZlcm5hbmRlemFsYW5pc0BtaWNyb2NoaXAuY29tPgor
CitkZXNjcmlwdGlvbjoKKyAgVGhlIE1pY3JvY2hpcCBJbnRlci1wcm9jZXNzb3IgQ29tbXVuaWNh
dGlvbiAoSVBDKSBmYWNpbGl0YXRlcworICBtZXNzYWdlIHBhc3NpbmcgYmV0d2VlbiBwcm9jZXNz
b3JzIHVzaW5nIGFuIGludGVycnVwdCBzaWduYWxpbmcKKyAgbWVjaGFuaXNtLgorICBUaGlzIFNC
SSBpbnRlcmZhY2UgaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBNaS1WIEludGVyLWhhcnQKKyAgQ29t
bXVuaWNhdGlvbiAoSUhDKSBJUC4KKyAgVGhlIG1pY3JvY2hpcCxzYmktaXBjIGNvbXBhdGlibGUg
c3RyaW5nIGlzIGludGVkZWQgZm9yIHVzZSBieSBzb2Z0d2FyZQorICBydW5uaW5nIGluIHN1cGVy
dmlzb3IgcHJpdmlsZWdlZCBtb2RlIChzLW1vZGUpLiBUaGUgU29DLXNwZWNpZmljCisgIGNvbXBh
dGlibGVzIGFyZSBpbnRlZGVkIGZvciB1c2UgYnkgdGhlIFNCSSBpbXBsZW1lbnRhdGlvbiBpbiBt
YWNoaW5lCisgIG1vZGUgKG0tbW9kZSkuCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6Cisg
ICAgZW51bToKKyAgICAgIC0gbWljcm9jaGlwLHNiaS1pcGMKKyAgICAgIC0gbWljcm9jaGlwLG1p
di1paGMtcnRsLXYyCisKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKKyAgaW50ZXJydXB0czoK
KyAgICBtaW5JdGVtczogMQorICAgIG1heEl0ZW1zOiA1CisKKyAgaW50ZXJydXB0LW5hbWVzOgor
ICAgIG1pbkl0ZW1zOiAxCisgICAgbWF4SXRlbXM6IDUKKyAgICBpdGVtczoKKyAgICAgIHBhdHRl
cm46ICJeaGFydC1bMC01XSskIgorCisgICIjbWJveC1jZWxscyI6CisgICAgZGVzY3JpcHRpb246
CisgICAgICBGb3IgdGhlIFNCSSAiZGV2aWNlIiwgdGhlIGNlbGwgcmVwcmVzZW50cyB0aGUgZ2xv
YmFsICJsb2dpY2FsIiBjaGFubmVsIElEcy4KKyAgICAgIFRoZSBtZWFuaW5nIG9mIGNoYW5uZWwg
SURzIGFyZSBwbGF0Zm9ybSBmaXJtd2FyZSBkZXBlbmRlbnQuIFRoZQorICAgICAgU29DLXNwZWNp
ZmljIGNvbXBhdGlibGVzIGFyZSBpbnRlbmRlZCBmb3IgdXNlIGJ5IHRoZSBTQkkgaW1wbGVtZW50
YXRpb24sCisgICAgICByYXRoZXIgdGhhbiBzLW1vZGUgc29mdHdhcmUuIFRoZXJlIHRoZSBjZWxs
IHdvdWxkIHJlcHJlc2VudCB0aGUgcGh5c2ljYWwKKyAgICAgIGNoYW5uZWwgYW5kIGRvIG5vdCB2
YXJ5IGRlcGVuZGluZyBvbiBwbGF0Zm9ybSBmaXJtd2FyZS4KKyAgICBjb25zdDogMQorCisgIG1p
Y3JvY2hpcCxpaGMtY2hhbi1kaXNhYmxlZC1tYXNrOgorICAgIGRlc2NyaXB0aW9uOgorICAgICAg
UmVwcmVzZW50cyB0aGUgZW5hYmxlL2Rpc2FibGUgc3RhdGUgb2YgdGhlIGJpLWRpcmVjdGlvbmFs
IElIQyBjaGFubmVscworICAgICAgd2l0aGluIHRoZSBNSVYtSUhDIElQIGNvbmZpZ3VyYXRpb24u
IFRoZSBtYXNrIGlzIGEgMTYtYml0IHZhbHVlLCBidXQgb25seQorICAgICAgdGhlIGZpcnN0IDE1
IGJpdHMgYXJlIHV0aWxpemVkLkVhY2ggb2YgdGhlIGJpdHMgY29ycmVzcG9uZHMgdG8KKyAgICAg
IG9uZSBvZiB0aGUgMTUgSUhDIGNoYW5uZWxzLgorICAgICAgQSBiaXQgc2V0IHRvICcxJyBpbmRp
Y2F0ZXMgdGhhdCB0aGUgY29ycmVzcG9uZGluZyBjaGFubmVsIGlzIGRpc2FibGVkLAorICAgICAg
YW5kIGFueSByZWFkIG9yIHdyaXRlIG9wZXJhdGlvbnMgdG8gdGhhdCBjaGFubmVsIHdpbGwgcmV0
dXJuIHplcm8uCisgICAgICBBIGJpdCBzZXQgdG8gJzAnIGluZGljYXRlcyB0aGF0IHRoZSBjb3Jy
ZXNwb25kaW5nIGNoYW5uZWwgaXMgZW5hYmxlZAorICAgICAgYW5kIHdpbGwgYmUgYWNjZXNzaWJs
ZSB0aHJvdWdoIGl0cyBkZWRpY2F0ZWQgYWRkcmVzcyByYW5nZSByZWdpc3RlcnMuCisgICAgICBU
aGUgcmVtYWluaW5nIGJpdCBvZiB0aGUgMTYtYml0IG1hc2sgaXMgcmVzZXJ2ZWQgYW5kIHNob3Vs
ZCBiZSBpZ25vcmVkLgorICAgICAgVGhlIGFjdHVhbCBlbmFibGUvZGlzYWJsZSBzdGF0ZSBvZiBl
YWNoIGNoYW5uZWwgaXMgZGV0ZXJtaW5lZCBieSB0aGUKKyAgICAgIElQIGJsb2Nr4oCZcyBjb25m
aWd1cmF0aW9uLgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Vp
bnQxNgorICAgIGRlZmF1bHQ6IDAKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIGlu
dGVycnVwdHMKKyAgLSBpbnRlcnJ1cHQtbmFtZXMKKyAgLSAiI21ib3gtY2VsbHMiCisKK2FkZGl0
aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCithbGxPZjoKKyAgLSBpZjoKKyAgICAgIHByb3BlcnRp
ZXM6CisgICAgICAgIGNvbXBhdGlibGU6CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAg
ICBjb25zdDogbWljcm9jaGlwLHNiaS1pcGMKKyAgICB0aGVuOgorICAgICAgcHJvcGVydGllczoK
KyAgICAgICAgcmVnOiBmYWxzZQorICAgICAgICBtaWNyb2NoaXAsaWhjLWNoYW4tZGlzYWJsZWQt
bWFzazogZmFsc2UKKyAgICBlbHNlOgorICAgICAgcmVxdWlyZWQ6CisgICAgICAgIC0gcmVnCisg
ICAgICAgIC0gbWljcm9jaGlwLGloYy1jaGFuLWRpc2FibGVkLW1hc2sKKworZXhhbXBsZXM6Cisg
IC0gfAorICAgIG1haWxib3ggeworICAgICAgY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAsc2JpLWlw
YyI7CisgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbGljPjsKKyAgICAgIGludGVycnVwdHMg
PSA8MTgwPiwgPDE3OT4sIDwxNzg+OworICAgICAgaW50ZXJydXB0LW5hbWVzID0gImhhcnQtMSIs
ICJoYXJ0LTIiLCAiaGFydC0zIjsKKyAgICAgICNtYm94LWNlbGxzID0gPDE+OworICAgIH07Cisg
IC0gfAorICAgIG1haWxib3hANTAwMDAwMDAgeworICAgICAgY29tcGF0aWJsZSA9ICJtaWNyb2No
aXAsbWl2LWloYy1ydGwtdjIiOworICAgICAgbWljcm9jaGlwLGloYy1jaGFuLWRpc2FibGVkLW1h
c2s9ICAvYml0cy8gMTYgPDA+OworICAgICAgcmVnID0gPDB4NTAwMDAwMDAgMHgxQzAwMD47Cisg
ICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbGljPjsKKyAgICAgIGludGVycnVwdHMgPSA8MTgw
PiwgPDE3OT4sIDwxNzg+OworICAgICAgaW50ZXJydXB0LW5hbWVzID0gImhhcnQtMSIsICJoYXJ0
LTIiLCAiaGFydC0zIjsKKyAgICAgICNtYm94LWNlbGxzID0gPDE+OworICAgIH07Ci0tIAoyLjM0
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
