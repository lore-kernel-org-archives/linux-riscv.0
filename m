Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13483D78327
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iuln7Asf2sk6T1KB718GaCXMKZ2pisgOVpEb46dk6fQ=; b=H/lYH1ZyoU8c6e
	e9aI36cHQ34CT9m0nwryObzPhLlxfkPAIs4yDyf94IDEz8os+zB+eX0YohdAXsDHmM8U02Is+56WA
	f4Yv4QamliO++TtrgUoF9lfS2lp9DroAfCTQzG/6AO/iHehF4sEPdigJIy+bhzmaorRwcshs1bM+V
	CVBXP82hDXebQFeFHYBkfeeHkiVdt8ik0htgPeL6hCGqHOLa0q1FyJHpQ64kdWVr7cNZLsqJvydGz
	v3gXj5UzRnuKEU+H/CuQBffgMb34m7Dhx1+PRptjmcUWSp5BldLNHd6tpDpejxxjBfhJyljyR+2zs
	RMT4PIbwhN83l1S/dQgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI78s-00000006NH7-31jy;
	Mon, 02 Dec 2024 14:11:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI78p-00000006NFd-3FQD
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 14:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733148672; x=1764684672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z2yMR3HeLu7KsABDCKgRF2wGwySvMO/GUfxeUu1aVEE=;
  b=sHqyQfn2GnIKpKzF33+qSi5fbn0aqlbCrAPx80YgFcSok1jtmsTnRhlR
   mpx0Jh2MKO9ZJ4eHldFlwMvyzWyoKinVIX0FUa2X1eee7w/a6ijXaw6YD
   cGfFYuKUzc82tgorZ6RFhqoeEEILlqb5YsgAxTWEXjFOhKlxE3YH85uYb
   E1dK+76C3P5SFVw9R+U+O4hjq9M2omk2LLpgSpFOeDlTXr2zEVVUnXhj3
   UivBms5Vxthm8LOn8Rn4VI9M9nuS6A8mHpO6MW6VFIKQ6XUvIyndGnQBe
   /1GQEpdOZeP2FOvO6bu04lti1kE3BIZcg6EwibU5ND3I4MtBgoHlwjLNm
   w==;
X-CSE-ConnectionGUID: 2KutSU5NQueuFpBXpCyxJA==
X-CSE-MsgGUID: K3v+bPITSaGMmmI42Ho0gA==
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="266205962"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Dec 2024 07:11:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 2 Dec 2024 07:10:57 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 2 Dec 2024 07:10:55 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<conor.dooley@microchip.com>, <conor+dt@kernel.org>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v5 3/4] dt-bindings: mailbox: add binding for Microchip IPC mailbox controller
Date: Mon, 2 Dec 2024 14:11:06 +0000
Message-ID: <20241202141107.193809-4-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202141107.193809-1-valentina.fernandezalanis@microchip.com>
References: <20241202141107.193809-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_061111_813380_944A96F4 
X-CRM114-Status: GOOD (  13.71  )
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
LQogLi4uL2JpbmRpbmdzL21haWxib3gvbWljcm9jaGlwLHNiaS1pcGMueWFtbCAgIHwgMTE3ICsr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExNyBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gv
bWljcm9jaGlwLHNiaS1pcGMueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tYWlsYm94L21pY3JvY2hpcCxzYmktaXBjLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9taWNyb2NoaXAsc2JpLWlwYy55YW1sCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZTEwNDU3M2Q0NWMxCi0tLSAv
ZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gv
bWljcm9jaGlwLHNiaS1pcGMueWFtbApAQCAtMCwwICsxLDExNyBAQAorIyBTUERYLUxpY2Vuc2Ut
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
dGVtczoKKyAgICAgIGVudW06CisgICAgICAgIC0gaGFydC0wCisgICAgICAgIC0gaGFydC0xCisg
ICAgICAgIC0gaGFydC0yCisgICAgICAgIC0gaGFydC0zCisgICAgICAgIC0gaGFydC00CisgICAg
ICAgIC0gaGFydC01CisKKyAgIiNtYm94LWNlbGxzIjoKKyAgICBkZXNjcmlwdGlvbjogPgorICAg
ICAgRm9yICJtaWNyb2NoaXAsc2JpLWlwYyIsIHRoZSBjZWxsIHJlcHJlc2VudHMgdGhlIGdsb2Jh
bCAibG9naWNhbCIKKyAgICAgIGNoYW5uZWwgSURzLiBUaGUgbWVhbmluZyBvZiBjaGFubmVsIElE
cyBhcmUgcGxhdGZvcm0gZmlybXdhcmUgZGVwZW5kZW50LgorCisgICAgICBGb3IgIm1pY3JvY2hp
cCxtaXYtaWhjLXJ0bC12MiIsIHRoZSBjZWxsIHJlcHJlc2VudHMgdGhlIHBoeXNpY2FsCisgICAg
ICBjaGFubmVsIGFuZCBkb2VzIG5vdCB2YXJ5IGJhc2VkIG9uIHRoZSBwbGF0Zm9ybSBmaXJtd2Fy
ZS4KKyAgICBjb25zdDogMQorCisgIG1pY3JvY2hpcCxpaGMtY2hhbi1kaXNhYmxlZC1tYXNrOgor
ICAgIGRlc2NyaXB0aW9uOiA+CisgICAgICBSZXByZXNlbnRzIHRoZSBlbmFibGUvZGlzYWJsZSBz
dGF0ZSBvZiB0aGUgYmktZGlyZWN0aW9uYWwgSUhDCisgICAgICBjaGFubmVscyB3aXRoaW4gdGhl
IE1JVi1JSEMgSVAgY29uZmlndXJhdGlvbi4KKworICAgICAgQSBiaXQgc2V0IHRvICcxJyBpbmRp
Y2F0ZXMgdGhhdCB0aGUgY29ycmVzcG9uZGluZyBjaGFubmVsIGlzIGRpc2FibGVkLAorICAgICAg
YW5kIGFueSByZWFkIG9yIHdyaXRlIG9wZXJhdGlvbnMgdG8gdGhhdCBjaGFubmVsIHdpbGwgcmV0
dXJuIHplcm8uCisKKyAgICAgIEEgYml0IHNldCB0byAnMCcgaW5kaWNhdGVzIHRoYXQgdGhlIGNv
cnJlc3BvbmRpbmcgY2hhbm5lbCBpcyBlbmFibGVkCisgICAgICBhbmQgd2lsbCBiZSBhY2Nlc3Np
YmxlIHRocm91Z2ggaXRzIGRlZGljYXRlZCBhZGRyZXNzIHJhbmdlIHJlZ2lzdGVycy4KKworICAg
ICAgVGhlIGFjdHVhbCBlbmFibGUvZGlzYWJsZSBzdGF0ZSBvZiBlYWNoIGNoYW5uZWwgaXMgZGV0
ZXJtaW5lZCBieSB0aGUKKyAgICAgIElQIGJsb2Nr4oCZcyBjb25maWd1cmF0aW9uLgorICAgICRy
ZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQxNgorICAgIG1heGltdW06
IDB4N2ZmZgorICAgIGRlZmF1bHQ6IDAKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAt
IGludGVycnVwdHMKKyAgLSBpbnRlcnJ1cHQtbmFtZXMKKyAgLSAiI21ib3gtY2VsbHMiCisKK2Fs
bE9mOgorICAtIGlmOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAgY29tcGF0aWJsZToKKyAg
ICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiBtaWNyb2NoaXAsc2JpLWlwYwor
ICAgIHRoZW46CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICByZWc6IGZhbHNlCisgICAgICAg
IG1pY3JvY2hpcCxpaGMtY2hhbi1kaXNhYmxlZC1tYXNrOiBmYWxzZQorICAgIGVsc2U6CisgICAg
ICByZXF1aXJlZDoKKyAgICAgICAgLSByZWcKKyAgICAgICAgLSBtaWNyb2NoaXAsaWhjLWNoYW4t
ZGlzYWJsZWQtbWFzaworCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6
CisgIC0gfAorICAgIG1haWxib3ggeworICAgICAgY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAsc2Jp
LWlwYyI7CisgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbGljPjsKKyAgICAgIGludGVycnVw
dHMgPSA8MTgwPiwgPDE3OT4sIDwxNzg+OworICAgICAgaW50ZXJydXB0LW5hbWVzID0gImhhcnQt
MSIsICJoYXJ0LTIiLCAiaGFydC0zIjsKKyAgICAgICNtYm94LWNlbGxzID0gPDE+OworICAgIH07
CisgIC0gfAorICAgIG1haWxib3hANTAwMDAwMDAgeworICAgICAgY29tcGF0aWJsZSA9ICJtaWNy
b2NoaXAsbWl2LWloYy1ydGwtdjIiOworICAgICAgbWljcm9jaGlwLGloYy1jaGFuLWRpc2FibGVk
LW1hc2sgPSAvYml0cy8gMTYgPDA+OworICAgICAgcmVnID0gPDB4NTAwMDAwMDAgMHgxYzAwMD47
CisgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbGljPjsKKyAgICAgIGludGVycnVwdHMgPSA8
MTgwPiwgPDE3OT4sIDwxNzg+OworICAgICAgaW50ZXJydXB0LW5hbWVzID0gImhhcnQtMSIsICJo
YXJ0LTIiLCAiaGFydC0zIjsKKyAgICAgICNtYm94LWNlbGxzID0gPDE+OworICAgIH07Ci0tIAoy
LjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
