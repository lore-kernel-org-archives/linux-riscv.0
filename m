Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EA9C61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 13:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HyFE89SFQw3o3z6Blq43ZNB69fuAsJaan74lMdc3Mv0=; b=N4VoqQoYcMotnh
	2/tovRWPBKZzbM2tf7t471T5u5cKF+ndn2l+UTM8OJLOAESibJ7kvwnTZ3FzMs/kEnM3zRck1D5am
	VyDz7hs97AwUUhLgquviigGhjgnAyWYIf3m5sXQamj1az9KzReQowDd7XEGZ5LYpALe8fH6JmFwOQ
	dzAH2bEEAtDvZQSGanTqa+ikVy02OTbMgAgcaoW1vzayqSRhSgK2UVkV5OXPiqF1tFsRKhxzj81aq
	n5p0vLUWtJArmtNC4CkDI86+odJqoLvk4YLjR0x8FPXSpO1xlKNoa6H661Br/f/sKspDhwWaYp5hy
	m2X/tUgGEdmQBbdlJ9yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYU0-002eqq-O2; Fri, 24 Feb 2023 13:51:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYTx-002epv-NL
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 13:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677246689; x=1708782689;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gL3Cs2+m/4fshHcUNF4uRlCTHPwu5XQNW/5CYVP3NRU=;
  b=yBFHIfqd0nQ/NWJU0wg3ClHM1oBUl4GrQWsGmQAhU956NVXP0k78AYpE
   smqOmzw6DHy0005r57Mb9gCD2dE1dgaSn5OAu/4+0IM3w+pPn+fKVGxeZ
   m1ODFWLVp1dcWf7JbsBqGgF1Yrjc69uqDQ/Ap1tpbUCUKQh6R2a4qZmZ5
   dPVH8+U6NqV/ackLOkOnJk67JIekh+gg1sHFHNFBx4zQVFY12GrN+XzYf
   II2vq6qsm3NV7jebOPqB1B8VmdH5eAr4TFM0ZmeHxhKs7mPwDar74aX2x
   tjAWXjyokUXgzRE472gAOsSs9ZYZ7FdOsKcK7hxkLc11PJW11gc6d4ZgG
   A==;
X-IronPort-AV: E=Sophos;i="5.97,324,1669100400"; 
   d="scan'208";a="138923417"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2023 06:51:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 06:51:24 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 24 Feb 2023 06:51:21 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>, <conor@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, "Wedson
 Almeida Filho" <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=
	<bjorn3_gh@protonmail.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, <rust-for-linux@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
Subject: [RFC RESEND 0/2] RISC-V: enable rust
Date: Fri, 24 Feb 2023 13:50:42 +0000
Message-ID: <20230224135044.2882109-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; i=conor.dooley@microchip.com; h=from:subject; bh=gL3Cs2+m/4fshHcUNF4uRlCTHPwu5XQNW/5CYVP3NRU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMk/DqyX/be4ynaJ06921nXKl9tk5qT9mD3X4ciGE9WnXQoS j77z7yhlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEoqsY/ucUZijfbD/GaTebVVrZwG PNqjed5778FN916Yi6WqpH+ndGhpUu9zVn9TZPebhcMPv6pm+CzSc8eFpXTAjz/PnG9P/ZaSwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_055129_838397_451F0BBB 
X-CRM114-Status: UNSURE (   8.81  )
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

VGhpcyBpcyBhIHNvbWV3aGF0IGJsaW5kIChhbmQgbWF5YmUgZm9vbGlzaCkgYXR0ZW1wdCBhdCBl
bmFibGluZyBSdXN0CmZvciBSSVNDLVYuIEkndmUgdGVzdGVkIHRoaXMgb24gSWNpY2xlLCBhbmQg
dGhlIG1vZHVsZXMgc2VlbSB0byB3b3JrLgpJJ2QgbGlrZSB0byBwbGF5IGFyb3VuZCB3aXRoIFJ1
c3Qgb24gUklTQy1WLCBidXQgSSdtIG5vdCBpbnRlcmVzdGVkIGluCnVzaW5nIGRvd25zdHJlYW0g
a2VybmVscywgc28gZmlndXJlZCBJIHNob3VsZCB0cnkgYW5kIHNlZSB3aGF0J3MKbWlzc2luZy4u
LgpJJ3ZlIHRhZ2dlZCB0aGlzIGFzIFJGQyBpbiBjYXNlIEkndmUgbWlzc2VkIHNvbWUgIldBYWFh
YSB5b3UgY2FuJ3QgZG8KdGhpcyIgc29tZXdoZXJlIDopCgpUaGFua3MsCkNvbm9yLgoKQ2hhbmdl
cyBpbiBSRkMtUkVTRU5EOgotIGZpeGVkIHRoZSBhc3ltbWV0cmljYWwgYWRkaXRpb25zIGluIHRo
ZSBNYWtlZmlsZSBiaXRzCi0gYWRkZWQgY2MtY292ZXIgdG8gbXkgZ2l0IHNlbmQtZW1haWwgY29t
bWFuZC4uLgoKQ0M6IE1pZ3VlbCBPamVkYSA8b2plZGFAa2VybmVsLm9yZz4KQ0M6IEFsZXggR2F5
bm9yIDxhbGV4LmdheW5vckBnbWFpbC5jb20+CkNDOiBXZWRzb24gQWxtZWlkYSBGaWxobyA8d2Vk
c29uYWZAZ21haWwuY29tPgpDQzogQm9xdW4gRmVuZyA8Ym9xdW4uZmVuZ0BnbWFpbC5jb20+CkND
OiBHYXJ5IEd1byA8Z2FyeUBnYXJ5Z3VvLm5ldD4KQ0M6IEJqw7ZybiBSb3kgQmFyb24gPGJqb3Ju
M19naEBwcm90b25tYWlsLmNvbT4KQ0M6IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+
CkNDOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+CkNDOiBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgpDQzogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhh
bkBrZXJuZWwub3JnPgpDQzogTmljayBEZXNhdWxuaWVycyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5j
b20+CkNDOiBUb20gUml4IDx0cml4QHJlZGhhdC5jb20+CkNDOiBydXN0LWZvci1saW51eEB2Z2Vy
Lmtlcm5lbC5vcmcKQ0M6IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmcKQ0M6IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcKQ0M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKQ0M6
IGxsdm1AbGlzdHMubGludXguZGV2CgpNaWd1ZWwgT2plZGEgKDIpOgogIHNjcmlwdHM6IGdlbmVy
YXRlX3J1c3RfdGFyZ2V0OiBlbmFibGUgYnVpbGRpbmcgb24gUklTQy1WCiAgUklTQy1WOiBlbmFi
bGUgYnVpbGRpbmcgdGhlIDY0LWJpdCBrZXJuZWxzIHdpdGggcnVzdCBzdXBwb3J0CgogRG9jdW1l
bnRhdGlvbi9ydXN0L2FyY2gtc3VwcG9ydC5yc3QgfCAgMiArKwogYXJjaC9yaXNjdi9LY29uZmln
ICAgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2L01ha2VmaWxlICAgICAgICAgICAg
ICAgICB8ICAzICsrLQogc2NyaXB0cy9nZW5lcmF0ZV9ydXN0X3RhcmdldC5ycyAgICAgfCAxOSAr
KysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
