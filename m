Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96000C54798
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 13:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aVV9WLKE08N1dmnjbBLOkNUL+tpFoeGzwbvrIsVKtlw=; b=KJR8n1R6S6XdbE
	O0CMO2kMCnINuaOiFwyJshA6HBYoX0CjGH0fwjXHR8tC38TdnYpd/Er6a+ZBnv9XTy35b+oO2lxSZ
	lVLZAAkr/m1lSmG5auvr257OrNHMWCq2m8qWdrTUpeSKDKdL3St2SIbK27/ehFTQJWbol9havBrbj
	gF7LrMxbGFE1TL+9WfuZWQ7i3/zmoL5735nVfcRDqaI3mZrXUsgpZPw6gv4QKGtX98e8Ho66jsJBI
	l3+LynUfG2ZHfcizmFG65bLpW7rR5pFtEzxZ1Upk9BKxKy6yMpBQ6O1YokTS9ABcbWjHcZTbvSqy0
	O0QMazDnr9An5Fc33OpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdVlC-00000009b80-2vHR;
	Fri, 23 Feb 2024 13:38:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdVl9-00000009b5U-0PHl
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 13:38:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AE9BACE2A9D;
	Fri, 23 Feb 2024 13:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B284C433C7;
	Fri, 23 Feb 2024 13:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708695513;
	bh=7Fsxt5dUnwFrhpCWGP+0Mujqc3o+HtSLor3KISLhljg=;
	h=From:To:Cc:Subject:Date:From;
	b=XoneYX3fUtHPv/QtDZAlU3gHMtogjPJMXJG0fKir4kkVyqoMQML0T7gyb5110b4YG
	 KUCFwNlKqmsZfwbRrzD+8/a5t4Sa8LL+rwEElpO28omgZQxBqNIUxl/wsiDpL/xzx7
	 Ilrf3jD1w7e0snf14FHGxB9DyjgiYQTFh5ib2D2zquDh7vx84D/bCQn9SV+D7+8Zxj
	 UZFUmE3hQjFv6Z45O9WScBCiiqz4Lwe3ukGIUCXfeWptMwU1lhroo4BEXI53pRWgr2
	 nS7b1DRD0guVYixLerEMCwstXo8isimJ2KLRjToXNVws/oXu95oIXDY63mgKD1Sx3A
	 BPUJChTRrtryQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 0/3] RISC-V: enable rust
Date: Fri, 23 Feb 2024 13:38:02 +0000
Message-ID: <20240223-leverage-walmart-5424542cd8bd@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Q8gmemx8ug1xAd70cV163zIEsT6BGWLzhKHazmMK2rg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKk35u95x9GhKR107q3o3E9S/JuMvfbMDNu+5IpYxtQMh sazwsHsHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjI0kRGhr+fNvi/eLe2Xc6q o/h1Wg/PNvEtmt4G9+2XSp20c7VI/c/wi1lP9lxgrcS6zU92qRf1vp5zZNu/oh16AUHhxyf8uh+ xmw0A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_053839_535299_D5F72B89 
X-CRM114-Status: GOOD (  12.68  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCk5vdyB3aXRo
IGEgcGF0Y2ggdG8gZGlzYWJsZSBSVVNUIGlmIENGSV9DTEFORyBpcyBlbmFibGVkLgpJJ3ZlIGFs
c28gaW50ZW50aW9uYWxseSBub3QgdHVybmVkIG9uIHRoZSBnY2Mgc3VwcG9ydCwgYXMgZGlzY3Vz
c2VkIG9uCnYxLgoKQXMgdGhpcyB3YXMgbGlmdGVkIGZyb20gdGhlIHN0YXRlIG9mIHRoZSBSdXN0
LWZvci1MaW51eCB0cmVlLCB0aGUgY29tbWl0Cm1lc3NhZ2VzIGZyb20gdGhlcmUgY2Fubm90IGJl
IHByZXNlcnZlZCwgc28gdGhlc2UgcGF0Y2hlcyBoYXZlIGNvbW1pdAptZXNzYWdlcyB0aGF0IEkg
d3JvdGUuCgpJJ3ZlIHRlc3RlZCB0aGlzIG9uIEljaWNsZSwgYW5kIHRoZSBtb2R1bGVzIHNlZW0g
dG8gd29yayBhcyBleHBlY3RlZC4KVW5mb3J0dW5hdGVseSB0aGVyZSBhcHBlYXIgdG8gYmUgaW1w
bGljaXQgMzItYml0IGRpdmlzaW9ucyAob3Igc2ltaWxhcikKaW4gY29yZSBSdXN0IGNvZGUsIHNv
LCBhcyBpbiB0aGUgZG93bnN0cmVhbSBSdXN0LWZvci1MaW51eCB0cmVlLCBSdXN0IGlzCm9ubHkg
ZW5hYmxlZCBmb3IgNjQtYml0LgoKVGhhbmtzLApDb25vci4KCkNoYW5nZXMgaW4gdjI6Ci0gUmVi
YXNlLCBzaW5jZSBhIGdvb2QgYml0IG9mIHRpbWUgaGFzIHBhc3NlZCEKLSBBZGQgdGhlIGV4dHJh
IHBhdGNoLCBkaXNhYmxpbmcgd2hlbiBDRklfQ0xBTkcgaXMgZW5hYmxlZC4KCkNoYW5nZXMgaW4g
djE6Ci0gcmViYXNlIG9uIHY2LjMtcmMxCi0gcmVzb3J0IHRoZSBgdW1gIGVudHJ5IGluIHRoZSBh
cmNoLXN1cHBvcnQgdGFibGUgd2hpbGUgYWRkaW5nIFJJU0MtVgogIHRvIGl0Ci0gZHJvcCAzMi1i
aXQgYml0cwotIGhhdmUgYW5vdGhlciBjcmFjayBhdCBhc3NpZ25pbmcgYXV0aG9yc2hpcAoKQ2hh
bmdlcyBpbiBSRkMtUkVTRU5EOgotIGZpeCB0aGUgYXN5bW1ldHJpY2FsIGFkZGl0aW9ucyBpbiB0
aGUgTWFrZWZpbGUgYml0cwotIGFkZCBjYy1jb3ZlciB0byBteSBnaXQgc2VuZC1lbWFpbCBjb21t
YW5kLi4uCgpDQzogTWlndWVsIE9qZWRhIDxvamVkYUBrZXJuZWwub3JnPgpDQzogQWxleCBHYXlu
b3IgPGFsZXguZ2F5bm9yQGdtYWlsLmNvbT4KQ0M6IFdlZHNvbiBBbG1laWRhIEZpbGhvIDx3ZWRz
b25hZkBnbWFpbC5jb20+CkNDOiBCb3F1biBGZW5nIDxib3F1bi5mZW5nQGdtYWlsLmNvbT4KQ0M6
IEdhcnkgR3VvIDxnYXJ5QGdhcnlndW8ubmV0PgpDQzogQmrDtnJuIFJveSBCYXJvbiA8Ympvcm4z
X2doQHByb3Rvbm1haWwuY29tPgpDQzogSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD4K
Q0M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4KQ0M6IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+CkNDOiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFu
QGtlcm5lbC5vcmc+CkNDOiBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNv
bT4KQ0M6IFRvbSBSaXggPHRyaXhAcmVkaGF0LmNvbT4KQ0M6IHJ1c3QtZm9yLWxpbnV4QHZnZXIu
a2VybmVsLm9yZwpDQzogbGludXgtZG9jQHZnZXIua2VybmVsLm9yZwpDQzogbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZwpDQzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpDQzog
bGx2bUBsaXN0cy5saW51eC5kZXYKCkNvbm9yIERvb2xleSAoMSk6CiAgcnVzdDogbWFrZSBtdXR1
YWxseSBleGNsdXNpdmUgd2l0aCBDRklfQ0xBTkcKCk1pZ3VlbCBPamVkYSAoMik6CiAgc2NyaXB0
czogZ2VuZXJhdGVfcnVzdF90YXJnZXQ6IGVuYWJsZSBidWlsZGluZyBvbiBSSVNDLVYKICBSSVND
LVY6IGVuYWJsZSBidWlsZGluZyA2NC1iaXQga2VybmVscyB3aXRoIHJ1c3Qgc3VwcG9ydAoKIERv
Y3VtZW50YXRpb24vcnVzdC9hcmNoLXN1cHBvcnQucnN0IHwgIDEgKwogYXJjaC9yaXNjdi9LY29u
ZmlnICAgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2L01ha2VmaWxlICAgICAgICAg
ICAgICAgICB8ICAyICsrCiBpbml0L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKIHNjcmlwdHMvZ2VuZXJhdGVfcnVzdF90YXJnZXQucnMgICAgIHwgMTYgKysrKysrKysrKysr
KysrKwogNSBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCgotLSAKMi40My4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
