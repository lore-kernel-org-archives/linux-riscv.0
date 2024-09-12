Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A9EEED621
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 16:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GGZpeB1Px2oYPhSTbAp6LmKEBv8dZ9fDY3SJdfZ2ifQ=; b=l5ORFZgueB8CYV
	yng73+e8flI6rEdh/6N0qcS60RWyW2mi39aIdEN0CfCxHH8nOp+kw1R8IS0b5KapiklezZfTyLH6K
	TJes7N5CLJnWPjWx9wrJa/wVydnFTOFJ597RgXcv3ct5Vw39D2DR+lEQ9dQG/LH0iw0vckkcPajTu
	FdpuaaUDkqi7UIQRkV7hqRrSVm2j17PeWr7EHnhufSANHKdO4sThPtgAGpBFwWQJJAYBi3kSK2lc4
	u8pWi6DREUayKVW+EaIGNrNqgA7VwfMw5apQRPf0S6HMZ4rg1df99ybXDsHfhfK8hHRq3Nl9/JnBw
	4cBzx9wAl1y08r5kpNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1somzf-0000000Dkmg-3S1m;
	Thu, 12 Sep 2024 16:48:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1somzc-0000000DkkE-48Z4
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 16:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726159709; x=1757695709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p6ecNLRCNl8ZScR0QmZtUArOMDDADkweuv7R/dv0qE4=;
  b=me6RtNSj+bB/BV6BYKmKojnglqjWy8DUwJ9G9EOxh+JUBjkorG8/NJIa
   E/QHR02QBBH8UYaGhOeW3WojxOgjIHqZzxAjNMHxHFcaF86WzoGY4FNTB
   +WSds7p9WCunPytqQAptQaPPQ8M17IXiNLTTBsmSyKkBJG7/tS8u5cA1P
   sHVpQqg/YUzn2TudH5Nt/BGlyIlsOPE40DmM5PAk+QdgZxZOB+/lPJNbj
   vNhmF9G0zANPng9xhVNTn3XDKzrzX9VV2ITXFttuN5uQoKt/J4CrnEqwI
   jlMjPg1VUtRqj3JUCkaklj4gkCNJEGi9IISH1ZmXH6pHVQQ0eJtgVPLS+
   A==;
X-CSE-ConnectionGUID: DQLE4LE3SvKX/JE8rC2tCg==
X-CSE-MsgGUID: 0fRRQu/LQvGxmgv7mbYjtg==
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="32331228"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2024 09:48:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 12 Sep 2024 09:47:50 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 12 Sep 2024 09:47:47 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterlin@andestech.com>, <dminus@andestech.com>,
	<conor.dooley@microchip.com>, <conor+dt@kernel.org>, <ycliang@andestech.com>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
Subject: [PATCH v1 2/5] dt-bindings: mailbox: add binding for Microchip IPC mailbox driver
Date: Thu, 12 Sep 2024 18:00:22 +0100
Message-ID: <20240912170025.455167-3-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_094829_126208_5037FDC3 
X-CRM114-Status: GOOD (  16.07  )
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
LQogLi4uL2JpbmRpbmdzL21haWxib3gvbWljcm9jaGlwLHNiaS1pcGMueWFtbCAgIHwgMTE1ICsr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExNSBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gv
bWljcm9jaGlwLHNiaS1pcGMueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tYWlsYm94L21pY3JvY2hpcCxzYmktaXBjLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9taWNyb2NoaXAsc2JpLWlwYy55YW1sCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZGMyY2JkNWViMjhmCi0tLSAv
ZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gv
bWljcm9jaGlwLHNiaS1pcGMueWFtbApAQCAtMCwwICsxLDExNSBAQAorIyBTUERYLUxpY2Vuc2Ut
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
ICAgIG1pbkl0ZW1zOiAxCisgICAgbWF4SXRlbXM6IDUKKworICAiI21ib3gtY2VsbHMiOgorICAg
IGRlc2NyaXB0aW9uOgorICAgICAgRm9yIHRoZSBTQkkgImRldmljZSIsIHRoZSBjZWxsIHJlcHJl
c2VudHMgdGhlIGdsb2JhbCAibG9naWNhbCIgY2hhbm5lbCBJRHMuCisgICAgICBUaGUgbWVhbmlu
ZyBvZiBjaGFubmVsIElEcyBhcmUgcGxhdGZvcm0gZmlybXdhcmUgZGVwZW5kZW50LiBUaGUKKyAg
ICAgIFNvQy1zcGVjaWZpYyBjb21wYXRpYmxlcyBhcmUgaW50ZW5kZWQgZm9yIHVzZSBieSB0aGUg
U0JJIGltcGxlbWVudGF0aW9uLAorICAgICAgcmF0aGVyIHRoYW4gcy1tb2RlIHNvZnR3YXJlLiBU
aGVyZSB0aGUgY2VsbCB3b3VsZCByZXByZXNlbnQgdGhlIHBoeXNpY2FsCisgICAgICBjaGFubmVs
IGFuZCBkbyBub3QgdmFyeSBkZXBlbmRpbmcgb24gcGxhdGZvcm0gZmlybXdhcmUuCisgICAgY29u
c3Q6IDEKKworICBtaWNyb2NoaXAsaWhjLWNoYW4tZGlzYWJsZWQtbWFzazoKKyAgICBkZXNjcmlw
dGlvbjoKKyAgICAgIFJlcHJlc2VudHMgdGhlIGVuYWJsZS9kaXNhYmxlIHN0YXRlIG9mIHRoZSBi
aS1kaXJlY3Rpb25hbCBJSEMgY2hhbm5lbHMKKyAgICAgIHdpdGhpbiB0aGUgTUlWLUlIQyBJUCBj
b25maWd1cmF0aW9uLiBUaGUgbWFzayBpcyBhIDE2LWJpdCB2YWx1ZSwgYnV0IG9ubHkKKyAgICAg
IHRoZSBmaXJzdCAxNSBiaXRzIGFyZSB1dGlsaXplZC5FYWNoIG9mIHRoZSBiaXRzIGNvcnJlc3Bv
bmRzIHRvCisgICAgICBvbmUgb2YgdGhlIDE1IElIQyBjaGFubmVscy4KKyAgICAgIEEgYml0IHNl
dCB0byAnMScgaW5kaWNhdGVzIHRoYXQgdGhlIGNvcnJlc3BvbmRpbmcgY2hhbm5lbCBpcyBkaXNh
YmxlZCwKKyAgICAgIGFuZCBhbnkgcmVhZCBvciB3cml0ZSBvcGVyYXRpb25zIHRvIHRoYXQgY2hh
bm5lbCB3aWxsIHJldHVybiB6ZXJvLgorICAgICAgQSBiaXQgc2V0IHRvICcwJyBpbmRpY2F0ZXMg
dGhhdCB0aGUgY29ycmVzcG9uZGluZyBjaGFubmVsIGlzIGVuYWJsZWQKKyAgICAgIGFuZCB3aWxs
IGJlIGFjY2Vzc2libGUgdGhyb3VnaCBpdHMgZGVkaWNhdGVkIGFkZHJlc3MgcmFuZ2UgcmVnaXN0
ZXJzLgorICAgICAgVGhlIHJlbWFpbmluZyBiaXQgb2YgdGhlIDE2LWJpdCBtYXNrIGlzIHJlc2Vy
dmVkIGFuZCBzaG91bGQgYmUgaWdub3JlZC4KKyAgICAgIFRoZSBhY3R1YWwgZW5hYmxlL2Rpc2Fi
bGUgc3RhdGUgb2YgZWFjaCBjaGFubmVsIGlzIGRldGVybWluZWQgYnkgdGhlCisgICAgICBJUCBi
bG9ja+KAmXMgY29uZmlndXJhdGlvbi4KKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy91aW50MTYKKyAgICBkZWZhdWx0OiAwCisKK3JlcXVpcmVkOgorICAtIGNvbXBh
dGlibGUKKyAgLSBpbnRlcnJ1cHRzCisgIC0gaW50ZXJydXB0LW5hbWVzCisgIC0gIiNtYm94LWNl
bGxzIgorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworYWxsT2Y6CisgIC0gaWY6Cisg
ICAgICBwcm9wZXJ0aWVzOgorICAgICAgICBjb21wYXRpYmxlOgorICAgICAgICAgIGNvbnRhaW5z
OgorICAgICAgICAgICAgY29uc3Q6IG1pY3JvY2hpcCxzYmktaXBjCisgICAgdGhlbjoKKyAgICAg
IHByb3BlcnRpZXM6CisgICAgICAgIHJlZzogZmFsc2UKKyAgICBlbHNlOgorICAgICAgcmVxdWly
ZWQ6CisgICAgICAgIC0gcmVnCisKKyAgLSBpZjoKKyAgICAgIHByb3BlcnRpZXM6CisgICAgICAg
IGNvbXBhdGlibGU6CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogbWlj
cm9jaGlwLG1pdi1paGMtcnRsLXYyCisgICAgdGhlbjoKKyAgICAgIHByb3BlcnRpZXM6CisgICAg
ICAgIGludGVycnVwdC1uYW1lczoKKyAgICAgICAgICBpdGVtczoKKyAgICAgICAgICAgIHBhdHRl
cm46ICJeaGFydC1bMC01XSskIgorCitleGFtcGxlczoKKyAgLSB8CisgICAgbWFpbGJveCB7Cisg
ICAgICBjb21wYXRpYmxlID0gIm1pY3JvY2hpcCxzYmktaXBjIjsKKyAgICAgIGludGVycnVwdC1w
YXJlbnQgPSA8JnBsaWM+OworICAgICAgaW50ZXJydXB0cyA9IDwxODA+LCA8MTc5PiwgPDE3OD47
CisgICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAiaGFydC0xIiwgImhhcnQtMiIsICJoYXJ0LTMiOwor
ICAgICAgI21ib3gtY2VsbHMgPSA8MT47CisgICAgfTsKKyAgLSB8CisgICAgbWFpbGJveEA1MDAw
MDAwMCB7CisgICAgICBjb21wYXRpYmxlID0gIm1pY3JvY2hpcCxtaXYtaWhjLXJ0bC12MiI7Cisg
ICAgICBtaWNyb2NoaXAsaWhjLWNoYW4tZGlzYWJsZWQtbWFzaz0gIC9iaXRzLyAxNiA8MD47Cisg
ICAgICByZWcgPSA8MHg1MDAwMDAwMCAweDFDMDAwPjsKKyAgICAgIGludGVycnVwdC1wYXJlbnQg
PSA8JnBsaWM+OworICAgICAgaW50ZXJydXB0cyA9IDwxODA+LCA8MTc5PiwgPDE3OD47CisgICAg
ICBpbnRlcnJ1cHQtbmFtZXMgPSAiaGFydC0xIiwgImhhcnQtMiIsICJoYXJ0LTMiOworICAgICAg
I21ib3gtY2VsbHMgPSA8MT47CisgICAgfTsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
