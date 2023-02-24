Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACD7C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 13:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tJ2NRHnf78DmZZBOwBGM2I16r8uevHSFr2la/cAKEQM=; b=gfgvt0PNEgdnN/
	XVvBXdqHcd20lPclwg6KET8HzpJDTCyKGD07PcvVTfFUjtmhr8Xc3I+XaSzQOBHC+cu4cRmEoIs80
	4K2eapycCztzTGUDl24qKSc2VNW37fuFO9sgph20zVRXWFPqSvD8XUbzc6+Mm/5E1iX62GvrnCqZf
	IJPl6XFNZ2Ve54mpsUPBuB8M6YAXK9t0/shVhXcii05f7auflkEGOAqPWIDRynpjUkxN+07lDkBpJ
	fif1HtAJVzsjLSzQK0mC/A3B84JeM80z8D05EPo1YXOoAlgYXGyohHn9IatFvxCKbzc050YH4bk2W
	UloHrtuvHiIh0A/Vtj7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYGR-002dE5-PL; Fri, 24 Feb 2023 13:37:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYGN-002dCU-CL
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 13:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677245847; x=1708781847;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aZzsSFvg1UfLqYXxjgJ2eB+4H3YgR+M3br8uQwZVD1w=;
  b=vGzLLIGjrRXtlNGz8ObzwXyEv1EZlnrmNb98Iyr+noxtL0gPaacuwN3w
   aAjcchHSSr12X8SYkXkv9J1sTCBt4hNnTmeFCBniin+1ZIQm4FnhrcdZZ
   5clNJZZLhi+lnm6wcQiOoDWfjczA8Q4DDDbunts9voaUY99JEhdqzb9nD
   Wbh3DuDYdEjx1HMk6p4va+6SDeW887iX41KI5IFs1+B08YKyGUXGfiAmE
   OG/j+c+NYqPuBDHtbfqHWc3BoDk5IoPKPLJPnT7d1VoyNxLAGuMnGpsnn
   WaUhWB8ifug7Dwt88KT0v74Z1pkX7AEfhB4xNZtfKfcfbLjiCs8lqUcLh
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,324,1669100400"; 
   d="scan'208";a="138922155"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2023 06:37:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 06:37:20 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 24 Feb 2023 06:37:17 -0700
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
Subject: [RFC 0/2] RISC-V: enable rust
Date: Fri, 24 Feb 2023 13:36:08 +0000
Message-ID: <20230224133609.2877396-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475; i=conor.dooley@microchip.com; h=from:subject; bh=aZzsSFvg1UfLqYXxjgJ2eB+4H3YgR+M3br8uQwZVD1w=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMk/9rocvX3IpcHZwESXJXif4QPzG+uS7Z+U/3R8YDjTJC6T zbipo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABOxMWRk2LhgbcZ94f3W9/ddLXNZq7 b64bvUiUmuPRJzVryeG7I6K4aRYUr5E82VBzfNVau2eiiQ6377v52T4gt7P5kbB5xL+Wr42QA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_053727_504029_CDC5E9E8 
X-CRM114-Status: UNSURE (   7.59  )
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
YSB5b3UgY2FuJ3QgZG8KdGhpcyIgc29tZXdoZXJlIDopCgpUaGFua3MsCkNvbm9yLgoKQ0M6IE1p
Z3VlbCBPamVkYSA8b2plZGFAa2VybmVsLm9yZz4KQ0M6IEFsZXggR2F5bm9yIDxhbGV4LmdheW5v
ckBnbWFpbC5jb20+CkNDOiBXZWRzb24gQWxtZWlkYSBGaWxobyA8d2Vkc29uYWZAZ21haWwuY29t
PgpDQzogQm9xdW4gRmVuZyA8Ym9xdW4uZmVuZ0BnbWFpbC5jb20+CkNDOiBHYXJ5IEd1byA8Z2Fy
eUBnYXJ5Z3VvLm5ldD4KQ0M6IEJqw7ZybiBSb3kgQmFyb24gPGJqb3JuM19naEBwcm90b25tYWls
LmNvbT4KQ0M6IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+CkNDOiBQYXVsIFdhbG1z
bGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+CkNDOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QGRhYmJlbHQuY29tPgpDQzogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgpD
QzogTmljayBEZXNhdWxuaWVycyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+CkNDOiBUb20gUml4
IDx0cml4QHJlZGhhdC5jb20+CkNDOiBydXN0LWZvci1saW51eEB2Z2VyLmtlcm5lbC5vcmcKQ0M6
IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmcKQ0M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcKQ0M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKQ0M6IGxsdm1AbGlzdHMubGlu
dXguZGV2CgpNaWd1ZWwgT2plZGEgKDIpOgogIHNjcmlwdHM6IGdlbmVyYXRlX3J1c3RfdGFyZ2V0
OiBlbmFibGUgYnVpbGRpbmcgb24gUklTQy1WCiAgUklTQy1WOiBlbmFibGUgYnVpbGRpbmcgdGhl
IDY0LWJpdCBrZXJuZWxzIHdpdGggcnVzdCBzdXBwb3J0CgogRG9jdW1lbnRhdGlvbi9ydXN0L2Fy
Y2gtc3VwcG9ydC5yc3QgfCAgMiArKwogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAg
ICAgfCAgMSArCiBhcmNoL3Jpc2N2L01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAzICsrLQog
c2NyaXB0cy9nZW5lcmF0ZV9ydXN0X3RhcmdldC5ycyAgICAgfCAxOSArKysrKysrKysrKysrKysr
KysrCiA0IGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0t
IAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
