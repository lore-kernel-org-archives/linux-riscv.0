Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D75CD128A
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 17:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Lr6YLFb4DWGY1W0wPwSHfomq6HqeKxeoTGqSXDIk7o=; b=VsHVfU/8HI4DlQ
	L+MtrYDWazzBVHFqqzvyN6xfNgPjfO1HhCDhwonvFTcXr4HRaOenxXw3GttRxOyBhQTiTZIQkONKo
	cGl4ybhv4/v+PxtGjqbPzgUmUT2BYvZ+MleO1xCoJxt0Hu+Nfa/WBd0KrcGwt0pHhbiHIt6IMqc3U
	9QH5DMA2Zp9sEYjqzAT97/zH9QMT3t7eIMgAy+ietKacbpF02HmJQ8LtldctDaIclMq6ElExycrn8
	XfQr87mvCUgXgXjPM7AtCa4R3rkm4dzCuzFfTq9w3ok3QhFJ1PtjTaa5Akwzbu/6WiFIwQ8ml40uw
	auyDJmW/sP7tPBqm5zEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruFDr-000000038iI-3tW3;
	Tue, 09 Apr 2024 17:25:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruFDn-000000038hN-2ksW
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 17:25:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E869361694;
	Tue,  9 Apr 2024 17:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1450CC433F1;
	Tue,  9 Apr 2024 17:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712683522;
	bh=Z7G26vJ7drjhQBqY768GVlza2RGDKJV6xJzSOxOV+Ac=;
	h=From:To:Cc:Subject:Date:From;
	b=FtJpo53NtrsGi0x7/1DjifT6PbQ15bJ7LWhF0g/Hx+vT8eKEcS/ZCx2Cmb6mVgzja
	 lg3s6b0HjfMK0I0K4/ZtBW1quMJTMna+WqxR1MYR2SHNTn22vT8g3flWIUHSZANvoo
	 oxhp32sdJ1ETlfK+9F3s2LgUX3Ma5N0sF4yvXLyiteN/CJ08MyYSHQXX+3AioLSs9l
	 YAnf84ILVJr6jsi0v9CUycXXvcJRIUdY670pH4cZPAJe4cA9tQ1HRgVLR9bksHmQJE
	 ONVIS5XbnArcoDXpnGjALyOIgJapzffN9acXMW4Jj9CccObKivFpP18BqHp7L2yvz1
	 hK9TMdkBLarDw==
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
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 0/1] RISC-V: enable rust
Date: Tue,  9 Apr 2024 18:25:15 +0100
Message-ID: <20240409-unsaddle-skittle-c93eb77732bb@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2917; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=jBURk0m47eQdKCm4nsBSeG1Pgaujx2S3yr8amWAalEA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmilb/fpZtkTudRfTNRPWJyUuKBlfHWbe1qz/7HOzzr+ vWEQXprRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbSz8Dw38UquCjqvY73ndsO zGF/f/u//lDq2+rdPOmcC8OpKLXYCob/aa1ad8KXBRkkiD6OjTqRZCgS/Wy3hI6AxpPb937Uusz gBgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_102523_909352_AE8B5EE1 
X-CRM114-Status: GOOD (  17.42  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCkkndmUgaW50
ZW50aW9uYWxseSBub3QgdHVybmVkIG9uIHRoZSBnY2Mgc3VwcG9ydCwgYXMgZGlzY3Vzc2VkIG9u
CnYxLiBJJ3ZlIGFsc28gc3dpdGNoZWQgb3ZlciB0byB1c2luZyB0aGUgdGFyZ2V0LCBidXQgaXQg
aXMgYSBiaXQgaGVhdmllcgp0aGFuIHRoZSBvbmUgYXJtNjQgc2VlbXMgdG8gYmUgdXNpbmcuIFJJ
U0MtViBoYXMgZmV3ZXIgdGFyZ2V0cyBhdmFpbGFibGUKYW5kIHRoaXMgd2FzIHRoZSBjbG9zZXN0
LiBJIHByZXNlcnZlZCB0aGUgcmVkem9uZSBkaXNhYmxpbmcsIGp1c3QgbW92ZWQKaW50byB0aGUg
TWFrZWZpbGUuIEFueSBjb21tZW50IGZyb20gR2FyeSBvciB0aGUgTExWTSBsYWRzIG9uIHRoZSB0
YXJnZXQKd291bGQgYmUgZ3JlYXQgSSB0aGluazoKaHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFu
Zy9ydXN0L2Jsb2IvbWFzdGVyL2NvbXBpbGVyL3J1c3RjX3RhcmdldC9zcmMvc3BlYy90YXJnZXRz
L3Jpc2N2NjRpbWFjX3Vua25vd25fbm9uZV9lbGYucnMKYXJtNjQgaXMgdXNpbmc6Cmh0dHBzOi8v
Z2l0aHViLmNvbS9ydXN0LWxhbmcvcnVzdC9ibG9iL21hc3Rlci9jb21waWxlci9ydXN0Y190YXJn
ZXQvc3JjL3NwZWMvdGFyZ2V0cy9hYXJjaDY0X3Vua25vd25fbm9uZS5ycwoKSSB3YXMgZ29ubmEg
c2VuZCB0aGlzIHllc3RlcmRheSwgYnV0IGZvdW5kIG91dCBsYXN0IG1pbnV0ZSBJIGhhZCBpbnZh
bGlkCmNvZGUgaW4gdGhlIHRhcmdldCBnZW5lcmF0aW9uIHNjcmlwdC4gVGhlIGtlcm5lbCB0ZXN0
IHJvYm90IGhhZCBnaXZlbiBteQpicmFuY2ggdGhlIGdsb2JhbCBhbGwtY2xlYXIgLSB0aGUgcnVz
dCBjb3ZlcmFnZSB3aXRoIGFsbCB0aGUKImRlcGVuZHMgb24gIUZPTyIgbXVzdCByZWFsbHkgbGlt
aXQgdGhlIGJ1aWxkIGNvdmVyYWdlLiBJIGJ1aWx0IGZvciB4ODYKd2l0aCBydXN0IGVuYWJsZWQg
bG9jYWxseSB0aGlzIHRpbWUgdG8gbWFrZSBzdXJlLi4KCkFzIHRoaXMgYXMgbGlmdGVkIGZyb20g
dGhlIHN0YXRlIG9mIHRoZSBSdXN0LWZvci1MaW51eCB0cmVlLCB0aGUgY29tbWl0Cm1lc3NhZ2Vz
IGZyb20gdGhlcmUgY2Fubm90IGJlIHByZXNlcnZlZCwgc28gdGhlc2UgcGF0Y2hlcyBoYXZlIGNv
bW1pdAptZXNzYWdlcyB0aGF0IEkgd3JvdGUuCgpJJ3ZlIHRlc3RlZCB0aGlzIG9uIEljaWNsZSwg
YW5kIHRoZSBtb2R1bGVzIHNlZW0gdG8gd29yayBhcyBleHBlY3RlZC4KVW5mb3J0dW5hdGVseSB0
aGVyZSBhcHBlYXIgdG8gYmUgaW1wbGljaXQgMzItYml0IGRpdmlzaW9ucyAob3Igc2ltaWxhcikK
aW4gY29yZSBSdXN0IGNvZGUsIHNvLCBhcyBpbiB0aGUgZG93bnN0cmVhbSBSdXN0LWZvci1MaW51
eCB0cmVlLCBSdXN0IGlzCm9ubHkgZW5hYmxlZCBmb3IgNjQtYml0LgoKVGhhbmtzLApDb25vci4K
CkNoYW5nZXMgaW4gdjM6Ci0gVXNlIGEgYnVpbHRpbiB0YXJnZXQgYW5kIG1vZGlmeSBpdCBpbiBr
YnVpbGQKLSBEcm9wIHRoZSBrQ0ZJIHBhdGNoLCB0aGF0J3MgYmVlbiBtZXJnZWQgaW5kZXBlbmRl
bnRseQoKQ2hhbmdlcyBpbiB2MjoKLSBSZWJhc2UsIHNpbmNlIGEgZ29vZCBiaXQgb2YgdGltZSBo
YXMgcGFzc2VkIQotIEFkZCB0aGUgZXh0cmEgcGF0Y2gsIGRpc2FibGluZyB3aGVuIENGSV9DTEFO
RyBpcyBlbmFibGVkLgoKQ2hhbmdlcyBpbiB2MToKLSByZWJhc2Ugb24gdjYuMy1yYzEKLSByZXNv
cnQgdGhlIGB1bWAgZW50cnkgaW4gdGhlIGFyY2gtc3VwcG9ydCB0YWJsZSB3aGlsZSBhZGRpbmcg
UklTQy1WCiAgdG8gaXQKLSBkcm9wIDMyLWJpdCBiaXRzCi0gaGF2ZSBhbm90aGVyIGNyYWNrIGF0
IGFzc2lnbmluZyBhdXRob3JzaGlwCgpDaGFuZ2VzIGluIFJGQy1SRVNFTkQ6Ci0gZml4IHRoZSBh
c3ltbWV0cmljYWwgYWRkaXRpb25zIGluIHRoZSBNYWtlZmlsZSBiaXRzCi0gYWRkIGNjLWNvdmVy
IHRvIG15IGdpdCBzZW5kLWVtYWlsIGNvbW1hbmQuLi4KCkNDOiBNaWd1ZWwgT2plZGEgPG9qZWRh
QGtlcm5lbC5vcmc+CkNDOiBBbGV4IEdheW5vciA8YWxleC5nYXlub3JAZ21haWwuY29tPgpDQzog
V2Vkc29uIEFsbWVpZGEgRmlsaG8gPHdlZHNvbmFmQGdtYWlsLmNvbT4KQ0M6IEJvcXVuIEZlbmcg
PGJvcXVuLmZlbmdAZ21haWwuY29tPgpDQzogR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5uZXQ+CkND
OiBCasO2cm4gUm95IEJhcm9uIDxiam9ybjNfZ2hAcHJvdG9ubWFpbC5jb20+CkNDOiBKb25hdGhh
biBDb3JiZXQgPGNvcmJldEBsd24ubmV0PgpDQzogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xl
eUBzaWZpdmUuY29tPgpDQzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KQ0M6
IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KQ0M6IE5pY2sgRGVzYXVsbmll
cnMgPG5kZXNhdWxuaWVyc0Bnb29nbGUuY29tPgpDQzogcnVzdC1mb3ItbGludXhAdmdlci5rZXJu
ZWwub3JnCkNDOiBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnCkNDOiBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnCkNDOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCkNDOiBsbHZt
QGxpc3RzLmxpbnV4LmRldgoKTWlndWVsIE9qZWRhICgxKToKICBSSVNDLVY6IGVuYWJsZSBidWls
ZGluZyA2NC1iaXQga2VybmVscyB3aXRoIHJ1c3Qgc3VwcG9ydAoKIERvY3VtZW50YXRpb24vcnVz
dC9hcmNoLXN1cHBvcnQucnN0IHwgMSArCiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAg
ICAgICB8IDEgKwogYXJjaC9yaXNjdi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCA3ICsrKysr
KysKIHNjcmlwdHMvZ2VuZXJhdGVfcnVzdF90YXJnZXQucnMgICAgIHwgNiArKysrKysKIDQgZmls
ZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
