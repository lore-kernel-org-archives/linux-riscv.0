Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ACFCAC581
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 17:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=40zkYiFVCM1zf0D2vKl4S2CUDVyQRqea0PN+6y3Jn2I=; b=Eu6FQlOHBXaLXC
	jBSZ7VGJajhwBMRnq66LEoddXlpgASc+AL8ToHZZxZXabrl+dCrSdIKnRq/K47WjWW3HVL3GaenR9
	EswOxotjl1BOml0Rl1s5vjRNyOD+7QPoqKv3IWBU0vH7XzbozaxTej09lMrt26q8lotCQ2ing8Dte
	IOuK5EjiYzqTbdlMZKoqKzKDeRJWu9FqX6dFwrMW8eDVbZSqzzR94NHouODN2ttcJ+xQXkmcxEosb
	KHFTWmfOBiuejUXCnTRrLmf+IYvXnE0b5NcCSsOWWy6K0tUtq05/zhWkxohVvy69wYDIyr2PYX7bt
	tNModaeDHZw+3pyxSFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfOO-000000014j8-36Iy;
	Mon, 08 Sep 2025 17:11:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbgD-0000000HITu-46wr
	for linux-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 13:13:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15C97449D1;
	Mon,  8 Sep 2025 13:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEC8C2BC86;
	Mon,  8 Sep 2025 13:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757337188;
	bh=fQDFjQcz0IedbEFnJ9guRZ4GSjnRmUcisJu/YxLaXoM=;
	h=From:To:Cc:Subject:Date:From;
	b=G8l2QPQ41pxBIHkLR7HU/T70zTPGfaD187Bytk4z3y9NnnMHH5yWjZqiuCnTGTLU6
	 XzX7C409xVbJUG0ePo0vqWMsp1YwYOiSs5xTmzcLNLFDIySLH9IMsit3BTu0F7GpHB
	 aWwKZqwD+RsXOm/R9Slu+GRWDTE6AQ68yHTytJCo1nXWn2GlIPpSIFeMhdTHip/wQa
	 rqA282SGFv/PYKPIaY45pHpiAAGdHoUx3P/raUa0OYaTnZBgb5T6/h7SP3esTddSlO
	 g4bP4NLhrSQOH8qLD7HHYNCzbzkNX4+pSBmMBQWTXznI44pM2QLfiUa9f9Rnrf25jQ
	 apubOiibtlfAw==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Matthew Maurer <mmaurer@google.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	linux-riscv@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1] rust: cfi: only 64-bit arm and x86 support CFI_CLANG
Date: Mon,  8 Sep 2025 14:12:35 +0100
Message-ID: <20250908-distill-lint-1ae78bcf777c@spud>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2580; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=y1gmjhD9ErBCpNbGt7upWsHOxmK+aK3iAxT5o+MajMg=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBn7rjlxhZfcU/YQu8H4v4TLsG/KveL3veGXLzMLbDawt ytTPnW/o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABN5z8bwP+V27y2uE4eNuJQV ZovtdS37k5VzQvrbgY2LL0Z5XuK88Jbhf+TlnPWyUnEVERtu+kx71Wr8o3bR3PjZjPOmM/5ninL 4ywsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_061310_058667_0DB60664 
X-CRM114-Status: GOOD (  11.83  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClRoZSBrZXJu
ZWwgdXNlcyB0aGUgc3RhbmRhcmQgcnVzdGMgdGFyZ2V0cyBmb3Igbm9uLXg4NiB0YXJnZXRzLCBh
bmQgb3V0Cm9mIHRob3NlIG9ubHkgNjQtYml0IGFybSdzIHRhcmdldCBoYXMga2NmaSBzdXBwb3J0
IGVuYWJsZWQuIEZvciB4ODYsIHRoZQpjdXN0b20gNjQtYml0IHRhcmdldCBlbmFibGVzIGtjZmku
CgpUaGUgSEFWRV9DRklfSUNBTExfTk9STUFMSVpFX0lOVEVHRVJTX1JVU1RDIGNvbmZpZyBvcHRp
b24gdGhhdCBhbGxvd3MKQ0ZJX0NMQU5HIHRvIGJlIHVzZWQgaW4gY29tYmluYXRpb24gd2l0aCBS
VVNUIGRvZXMgbm90IGNoZWNrIHdoZXRoZXIgdGhlCnJ1c3RjIHRhcmdldCBzdXBwb3J0cyBrY2Zp
LiBUaGlzIGJyZWFrcyB0aGUgYnVpbGQgb24gcmlzY3YgKGFuZApwcmVzdW1hYmx5IDMyLWJpdCBh
cm0pIHdoZW4gQ0ZJX0NMQU5HIGFuZCBSVVNUIGFyZSBlbmFibGVkIGF0IHRoZSBzYW1lCnRpbWUu
CgpPcmRpbmFyaWx5LCBhIHJ1c3RjLW9wdGlvbiBjaGVjayB3b3VsZCBiZSB1c2VkIHRvIGRldGVj
dCB0YXJnZXQgc3VwcG9ydApidXQgdW5mb3J0dW5hdGVseSBydXN0Yy1vcHRpb24gZmlsdGVycyBv
dXQgdGhlIHRhcmdldCBmb3IgcmVhc29ucyBnaXZlbgppbiBjb21taXQgNDZlMjRhNTQ1Y2RiNCAo
InJ1c3Q6IGthc2FuL2tidWlsZDogZml4IG1pc3NpbmcgZmxhZ3Mgb24gZmlyc3QKYnVpbGQiKS4g
QXMgYSByZXN1bHQsIGlmIHRoZSBob3N0IHN1cHBvcnRzIGtjZmkgYnV0IHRoZSB0YXJnZXQgZG9l
cyBub3QsCmUuZy4gd2hlbiBidWlsZGluZyBmb3IgcmlzY3Ygb24geDg2XzY0LCB0aGUgYnVpbGQg
d291bGQgcmVtYWluIGJyb2tlbi4KCkluc3RlYWQsIG1ha2UgSEFWRV9DRklfSUNBTExfTk9STUFM
SVpFX0lOVEVHRVJTX1JVU1RDIGRlcGVuZCBvbiB0aGUgb25seQp0d28gYXJjaGl0ZWN0dXJlcyB3
aGVyZSB0aGUgdGFyZ2V0IHVzZWQgc3VwcG9ydHMgaXQgdG8gZml4IHRoZSBidWlsZC4KCkNDOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnCkZpeGVzOiBjYTYyN2U2MzY1NTFlICgicnVzdDogY2ZpOiBh
ZGQgc3VwcG9ydCBmb3IgQ0ZJX0NMQU5HIHdpdGggUnVzdCIpClNpZ25lZC1vZmYtYnk6IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Ci0tLQpDQzogUGF1bCBXYWxtc2xl
eSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPgpDQzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBk
YWJiZWx0LmNvbT4KQ0M6IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4KQ0M6IE1pZ3Vl
bCBPamVkYSA8b2plZGFAa2VybmVsLm9yZz4KQ0M6IEFsZXggR2F5bm9yIDxhbGV4LmdheW5vckBn
bWFpbC5jb20+CkNDOiBCb3F1biBGZW5nIDxib3F1bi5mZW5nQGdtYWlsLmNvbT4KQ0M6IEdhcnkg
R3VvIDxnYXJ5QGdhcnlndW8ubmV0PgpDQzogIkJqw7ZybiBSb3kgQmFyb24iIDxiam9ybjNfZ2hA
cHJvdG9ubWFpbC5jb20+CkNDOiBCZW5ubyBMb3NzaW4gPGxvc3NpbkBrZXJuZWwub3JnPgpDQzog
QW5kcmVhcyBIaW5kYm9yZyA8YS5oaW5kYm9yZ0BrZXJuZWwub3JnPgpDQzogQWxpY2UgUnlobCA8
YWxpY2VyeWhsQGdvb2dsZS5jb20+CkNDOiBUcmV2b3IgR3Jvc3MgPHRtZ3Jvc3NAdW1pY2guZWR1
PgpDQzogRGFuaWxvIEtydW1tcmljaCA8ZGFrckBrZXJuZWwub3JnPgpDQzogS2VlcyBDb29rIDxr
ZWVzQGtlcm5lbC5vcmc+CkNDOiBTYW1pIFRvbHZhbmVuIDxzYW1pdG9sdmFuZW5AZ29vZ2xlLmNv
bT4KQ0M6IE1hdHRoZXcgTWF1cmVyIDxtbWF1cmVyQGdvb2dsZS5jb20+CkNDOiAiUGV0ZXIgWmlq
bHN0cmEgKEludGVsKSIgPHBldGVyekBpbmZyYWRlYWQub3JnPgpDQzogbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZwpDQzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpDQzogcnVz
dC1mb3ItbGludXhAdmdlci5rZXJuZWwub3JnCi0tLQogYXJjaC9LY29uZmlnIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL0tjb25maWcgYi9h
cmNoL0tjb25maWcKaW5kZXggZDFiNGZmZDZlMDg1Ni4uODgwY2RkZmY1ZWRhNyAxMDA2NDQKLS0t
IGEvYXJjaC9LY29uZmlnCisrKyBiL2FyY2gvS2NvbmZpZwpAQCAtOTE3LDYgKzkxNyw3IEBAIGNv
bmZpZyBIQVZFX0NGSV9JQ0FMTF9OT1JNQUxJWkVfSU5URUdFUlNfUlVTVEMKIAlkZWZfYm9vbCB5
CiAJZGVwZW5kcyBvbiBIQVZFX0NGSV9JQ0FMTF9OT1JNQUxJWkVfSU5URUdFUlNfQ0xBTkcKIAlk
ZXBlbmRzIG9uIFJVU1RDX1ZFUlNJT04gPj0gMTA3OTAwCisJZGVwZW5kcyBvbiBBUk02NCB8fCBY
ODZfNjQKIAkjIFdpdGggR0NPVi9LQVNBTiB3ZSBuZWVkIHRoaXMgZml4OiBodHRwczovL2dpdGh1
Yi5jb20vcnVzdC1sYW5nL3J1c3QvcHVsbC8xMjkzNzMKIAlkZXBlbmRzIG9uIChSVVNUQ19MTFZN
X1ZFUlNJT04gPj0gMTkwMTAzICYmIFJVU1RDX1ZFUlNJT04gPj0gMTA4MjAwKSB8fCBcCiAJCSgh
R0NPVl9LRVJORUwgJiYgIUtBU0FOX0dFTkVSSUMgJiYgIUtBU0FOX1NXX1RBR1MpCi0tIAoyLjQ3
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
