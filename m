Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AFEE77188
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 11:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZ02zQkjp3LGRmooD67T5eB3dZl0ir41HAQNFFq+9Lo=; b=EiftP0nrH++rKj
	lPskh1waue1l4fdyjnN8NqX9udk/JhSMsSU5lTBLJu0m2AYBAcuob81c/VrK+1UJGdyMnIIRL3TiU
	VpHPICwj/hnwjSijGq6zM7tvfDX2qJum+yfCifr5oYeqfy2deU1XFISXC3BIigkSVTr3rsNtWjmzD
	jihjHQG3pK/toa2OA0zW0r6YOfqxHdknr1vxJ5SSp5VOnQcSJ8u7v70rHVIUYA2nwVhrtgG4y1NKL
	wi17HHI7nynBVOy9ihWN4OkAZ00olKAzHzUc02lr3cwr5KIYKhq9/iUnH0yC6YFP30QtvXfgNEoQ5
	cCQZrR52J/9doMDVTeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVnm-0000000DG8x-2dHH;
	Tue, 17 Dec 2024 11:31:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVnh-0000000DG6S-3WSc
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 11:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734435101; x=1765971101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jb8YqOp2h/g+W5ZwU09IpQtNOQClMuCx3xE6O2uXec4=;
  b=kYV9gmz0nhpqI2r4isNkBqv/ZfeFD6o8TZoLu2g6lPsbj6TpQQvLqkwZ
   m4RKu0tsgm9FqIFB+/hyVFqCFirhbJqMIBzV94j2h0AjbwegyZylZBfF9
   8rkkzzCgjzDr3U+V00J75XUGd9xBJx1KlyZihbpRCxs2JB2RcLHnodn3f
   uHCuN1wPskFbDCjP1VoMeLooylIS94Mk3B1fpYcq0nb0MIi3EIalN+Lhs
   XPDQx5VFBA13gILU9rYirN2F6/nmJF/zcnxJK6py0ltqwxAg4VDAjkQO6
   zNELN3X+2a9Xl239qhKXziFPTcZ6H877iIDVTlW87mGB2fPv35Q95d/nN
   g==;
X-CSE-ConnectionGUID: AFXRsVMVRgWVCl8fi3oPIQ==
X-CSE-MsgGUID: K06UQkBfSqOrMAX67yaMCA==
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="39361182"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Dec 2024 04:31:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 17 Dec 2024 04:31:13 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 17 Dec 2024 04:31:11 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<conor.dooley@microchip.com>, <conor+dt@kernel.org>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v6 3/4] dt-bindings: mailbox: add binding for Microchip IPC mailbox controller
Date: Tue, 17 Dec 2024 11:31:33 +0000
Message-ID: <20241217113134.3508333-4-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
References: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_033141_893437_3904695F 
X-CRM114-Status: GOOD (  14.34  )
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
LQogLi4uL2JpbmRpbmdzL21haWxib3gvbWljcm9jaGlwLHNiaS1pcGMueWFtbCAgIHwgMTIzICsr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyMyBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gv
bWljcm9jaGlwLHNiaS1pcGMueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tYWlsYm94L21pY3JvY2hpcCxzYmktaXBjLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9taWNyb2NoaXAsc2JpLWlwYy55YW1sCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uOGVkNjdlYTdjODgzCi0tLSAv
ZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gv
bWljcm9jaGlwLHNiaS1pcGMueWFtbApAQCAtMCwwICsxLDEyMyBAQAorIyBTUERYLUxpY2Vuc2Ut
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
ICAgIHRoZW46CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICByZWc6CisgICAgICAgICAgbm90
OiB7fQorICAgICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlICdtaWNyb2NoaXAs
c2JpLWlwYycgb3BlcmF0ZXMgaW4gYSBwcm9ncmFtbWluZyBtb2RlbAorICAgICAgICAgICAgdGhh
dCBkb2VzIG5vdCByZXF1aXJlIG1lbW9yeS1tYXBwZWQgSS9PIChNTUlPKSByZWdpc3RlcnMKKyAg
ICAgICAgICAgIHNpbmNlIGl0IHVzZXMgU0JJIGVjYWxscyBwcm92aWRlZCBieSB0aGUgbS1tb2Rl
L2Zpcm13YXJlCisgICAgICAgICAgICBTQkkgaW1wbGVtZW50YXRpb24gdG8gYWNjZXNzIGhhcmR3
YXJlIHJlZ2lzdGVycy4KKyAgICAgICAgbWljcm9jaGlwLGloYy1jaGFuLWRpc2FibGVkLW1hc2s6
IGZhbHNlCisgICAgZWxzZToKKyAgICAgIHJlcXVpcmVkOgorICAgICAgICAtIHJlZworICAgICAg
ICAtIG1pY3JvY2hpcCxpaGMtY2hhbi1kaXNhYmxlZC1tYXNrCisKK2FkZGl0aW9uYWxQcm9wZXJ0
aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgbWFpbGJveCB7CisgICAgICBjb21w
YXRpYmxlID0gIm1pY3JvY2hpcCxzYmktaXBjIjsKKyAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8
JnBsaWM+OworICAgICAgaW50ZXJydXB0cyA9IDwxODA+LCA8MTc5PiwgPDE3OD47CisgICAgICBp
bnRlcnJ1cHQtbmFtZXMgPSAiaGFydC0xIiwgImhhcnQtMiIsICJoYXJ0LTMiOworICAgICAgI21i
b3gtY2VsbHMgPSA8MT47CisgICAgfTsKKyAgLSB8CisgICAgbWFpbGJveEA1MDAwMDAwMCB7Cisg
ICAgICBjb21wYXRpYmxlID0gIm1pY3JvY2hpcCxtaXYtaWhjLXJ0bC12MiI7CisgICAgICBtaWNy
b2NoaXAsaWhjLWNoYW4tZGlzYWJsZWQtbWFzayA9IC9iaXRzLyAxNiA8MD47CisgICAgICByZWcg
PSA8MHg1MDAwMDAwMCAweDFjMDAwPjsKKyAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JnBsaWM+
OworICAgICAgaW50ZXJydXB0cyA9IDwxODA+LCA8MTc5PiwgPDE3OD47CisgICAgICBpbnRlcnJ1
cHQtbmFtZXMgPSAiaGFydC0xIiwgImhhcnQtMiIsICJoYXJ0LTMiOworICAgICAgI21ib3gtY2Vs
bHMgPSA8MT47CisgICAgfTsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
