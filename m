Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F449D33A22
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 18:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IXinzYZdYOLWyrjKUtRAcisKkkLNYQMZkJGYqfLAv1M=; b=PCZ/NvaU9meWdh
	KhTGJJeNcID6Mx4Gurowc/a77afqMAzXaaAwyhdJl3mBNfbU+zpUJTDixvykDJc/hT4RmKAZsic09
	ij+7g2O17eQcruDqubJQ3AshNpC2pc36ZypVxcwdtHrKPoxp34yv5973/CdQX5hqvAy30ZlG9kasO
	NHn/pBAmEy8VrCSXacTnYWoQufEhEm7fYAVxRwUTBFbD9qo8qK2CgphXPUHlo4wgzqDyCxeBR4ZVB
	96wHvx1fyLqbqQv6nbeRvZhxBrUWQp2p+BHW3Z0XjFnDKhbfns1bPTP25ck+tzmSHSYhfAsT1jGtG
	Lzfz7mawgL1G0Fu/2T/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OV8-00000000PmH-1iaI;
	Tue, 05 Nov 2024 18:42:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OPl-00000000OES-2SUh
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 18:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730831789; x=1762367789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o3lz7dS/0X/IsotdugNCOPCUgilgkWwAiXObrss6PhM=;
  b=PbE6aoxQnCiBrCUjnMPIlVAZKYlBsyg1GfJaxe4iA03IhqzXODVSL7bo
   vTrmJ1OMQBQCvYtdTqQZ4U1kDWq7QFKMfu1GWDI0Q4NfMQV+mUp1/UaT9
   8J35ryCWGHWTH/HP90HkL99Gttb5PWF12dBmatMVnej5a1dgq7r2PkpEW
   Xk6fImPWU8wN5i9NtW7BnvFuS0uoX/wGS95SE8UgPbKNJqBwb0VB3MBUR
   HJITm+661MEa86rnDktrH+gmEYQ5TFiJ6Zw/8VaYXH+RyIRFtQavJIB3a
   5Jo+Qz0ibVq9SZKEJGhRrkHVY0vreri1Jgl7YHdwuaJ9Lq4VpzcBavp7V
   Q==;
X-CSE-ConnectionGUID: T1uVhdVNQzWREZUebUBC5w==
X-CSE-MsgGUID: jf9X/ks1T1CHW9+cqU6PUA==
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="37385617"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Nov 2024 11:36:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Nov 2024 11:36:24 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 5 Nov 2024 11:36:21 -0700
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
Subject: [PATCH v3 3/4] dt-bindings: mailbox: add binding for Microchip IPC mailbox controller
Date: Tue, 5 Nov 2024 18:35:12 +0000
Message-ID: <20241105183513.1358736-4-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105183513.1358736-1-valentina.fernandezalanis@microchip.com>
References: <20241105183513.1358736-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_103629_678286_C623AC55 
X-CRM114-Status: GOOD (  14.73  )
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
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uOWU2N2MwOWU0YmVhCi0tLSAv
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
aWNhdGlvbiAoSUhDKSBJUC4KKyAgICAgICAgaXRlbXM6CisgICAgICAgICAgLSBjb25zdDogbWlj
cm9jaGlwLHNiaS1pcGMKKworICAgICAgLSBkZXNjcmlwdGlvbjoKKyAgICAgICAgICBTb0Mtc3Bl
Y2lmaWMgY29tcGF0aWJsZSwgaW50ZW5kZWQgZm9yIHVzZSBieSB0aGUgU0JJCisgICAgICAgICAg
aW1wbGVtZW50YXRpb24gaW4gbWFjaGluZSBtb2RlIChtLW1vZGUpLgorICAgICAgICBpdGVtczoK
KyAgICAgICAgICAtIGNvbnN0OiBtaWNyb2NoaXAsbWl2LWloYy1ydGwtdjIKKworICByZWc6Cisg
ICAgbWF4SXRlbXM6IDEKKworICBpbnRlcnJ1cHRzOgorICAgIG1pbkl0ZW1zOiAxCisgICAgbWF4
SXRlbXM6IDUKKworICBpbnRlcnJ1cHQtbmFtZXM6CisgICAgbWluSXRlbXM6IDEKKyAgICBtYXhJ
dGVtczogNQorICAgIGl0ZW1zOgorICAgICAgcGF0dGVybjogIl5oYXJ0LVswLTVdKyQiCisKKyAg
IiNtYm94LWNlbGxzIjoKKyAgICBkZXNjcmlwdGlvbjogPgorICAgICAgRm9yIHRoZSBTQkkgImRl
dmljZSIsIHRoZSBjZWxsIHJlcHJlc2VudHMgdGhlIGdsb2JhbCAibG9naWNhbCIgY2hhbm5lbCBJ
RHMuCisgICAgICBUaGUgbWVhbmluZyBvZiBjaGFubmVsIElEcyBhcmUgcGxhdGZvcm0gZmlybXdh
cmUgZGVwZW5kZW50LgorCisgICAgICBGb3IgdGhlIFNvQy1zcGVjaWZpYyBjb21wYXRpYmxlIHN0
cmluZywgdGhlIGNlbGwgcmVwcmVzZW50cyB0aGUgcGh5c2ljYWwKKyAgICAgIGNoYW5uZWwgYW5k
IGRvZXMgbm90IHZhcnkgYmFzZWQgb24gdGhlIHBsYXRmb3JtIGZpcm13YXJlLgorICAgIGNvbnN0
OiAxCisKKyAgbWljcm9jaGlwLGloYy1jaGFuLWRpc2FibGVkLW1hc2s6CisgICAgZGVzY3JpcHRp
b246ID4KKyAgICAgIFJlcHJlc2VudHMgdGhlIGVuYWJsZS9kaXNhYmxlIHN0YXRlIG9mIHRoZSBi
aS1kaXJlY3Rpb25hbCBJSEMKKyAgICAgIGNoYW5uZWxzIHdpdGhpbiB0aGUgTUlWLUlIQyBJUCBj
b25maWd1cmF0aW9uLgorCisgICAgICBUaGUgbWFzayBpcyBhIDE2LWJpdCB2YWx1ZSwgYnV0IG9u
bHkgdGhlIGZpcnN0IDE1IGJpdHMgYXJlIHV0aWxpemVkLgorICAgICAgRWFjaCBvZiB0aGUgYml0
cyBjb3JyZXNwb25kcyB0byBvbmUgb2YgdGhlIDE1IElIQyBjaGFubmVscy4KKworICAgICAgQSBi
aXQgc2V0IHRvICcxJyBpbmRpY2F0ZXMgdGhhdCB0aGUgY29ycmVzcG9uZGluZyBjaGFubmVsIGlz
IGRpc2FibGVkLAorICAgICAgYW5kIGFueSByZWFkIG9yIHdyaXRlIG9wZXJhdGlvbnMgdG8gdGhh
dCBjaGFubmVsIHdpbGwgcmV0dXJuIHplcm8uCisKKyAgICAgIEEgYml0IHNldCB0byAnMCcgaW5k
aWNhdGVzIHRoYXQgdGhlIGNvcnJlc3BvbmRpbmcgY2hhbm5lbCBpcyBlbmFibGVkCisgICAgICBh
bmQgd2lsbCBiZSBhY2Nlc3NpYmxlIHRocm91Z2ggaXRzIGRlZGljYXRlZCBhZGRyZXNzIHJhbmdl
IHJlZ2lzdGVycy4KKworICAgICAgVGhlIHJlbWFpbmluZyBiaXQgb2YgdGhlIDE2LWJpdCBtYXNr
IGlzIHJlc2VydmVkIGFuZCBzaG91bGQgYmUgaWdub3JlZC4KKworICAgICAgVGhlIGFjdHVhbCBl
bmFibGUvZGlzYWJsZSBzdGF0ZSBvZiBlYWNoIGNoYW5uZWwgaXMgZGV0ZXJtaW5lZCBieSB0aGUK
KyAgICAgIElQIGJsb2Nr4oCZcyBjb25maWd1cmF0aW9uLgorICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQxNgorICAgIGRlZmF1bHQ6IDAKKworcmVxdWlyZWQ6
CisgIC0gY29tcGF0aWJsZQorICAtIGludGVycnVwdHMKKyAgLSBpbnRlcnJ1cHQtbmFtZXMKKyAg
LSAiI21ib3gtY2VsbHMiCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCithbGxPZjoK
KyAgLSBpZjoKKyAgICAgIHByb3BlcnRpZXM6CisgICAgICAgIGNvbXBhdGlibGU6CisgICAgICAg
ICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogbWljcm9jaGlwLHNiaS1pcGMKKyAgICB0
aGVuOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAgcmVnOiBmYWxzZQorICAgICAgICBtaWNy
b2NoaXAsaWhjLWNoYW4tZGlzYWJsZWQtbWFzazogZmFsc2UKKyAgICBlbHNlOgorICAgICAgcmVx
dWlyZWQ6CisgICAgICAgIC0gcmVnCisgICAgICAgIC0gbWljcm9jaGlwLGloYy1jaGFuLWRpc2Fi
bGVkLW1hc2sKKworZXhhbXBsZXM6CisgIC0gfAorICAgIG1haWxib3ggeworICAgICAgY29tcGF0
aWJsZSA9ICJtaWNyb2NoaXAsc2JpLWlwYyI7CisgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZw
bGljPjsKKyAgICAgIGludGVycnVwdHMgPSA8MTgwPiwgPDE3OT4sIDwxNzg+OworICAgICAgaW50
ZXJydXB0LW5hbWVzID0gImhhcnQtMSIsICJoYXJ0LTIiLCAiaGFydC0zIjsKKyAgICAgICNtYm94
LWNlbGxzID0gPDE+OworICAgIH07CisgIC0gfAorICAgIG1haWxib3hANTAwMDAwMDAgeworICAg
ICAgY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAsbWl2LWloYy1ydGwtdjIiOworICAgICAgbWljcm9j
aGlwLGloYy1jaGFuLWRpc2FibGVkLW1hc2sgPSAvYml0cy8gMTYgPDA+OworICAgICAgcmVnID0g
PDB4NTAwMDAwMDAgMHgxQzAwMD47CisgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbGljPjsK
KyAgICAgIGludGVycnVwdHMgPSA8MTgwPiwgPDE3OT4sIDwxNzg+OworICAgICAgaW50ZXJydXB0
LW5hbWVzID0gImhhcnQtMSIsICJoYXJ0LTIiLCAiaGFydC0zIjsKKyAgICAgICNtYm94LWNlbGxz
ID0gPDE+OworICAgIH07Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
