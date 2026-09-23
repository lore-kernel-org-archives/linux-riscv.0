Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365CBC98302
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJenfs2QbK0TzGMTm3JlCcsHvZ91R6rrVWWJv0HkVoM=; b=0CqDqznjrMEaob
	hPAcOU9d/neAuEIBJp65HEjypD8pzau4yF0A5eBMIUf6ipRVz4j2bQjQiBhyLjz5R6jTP0dBWkfxZ
	KtpkkWHKnAqcy78fd1K4W7tPo/ZfZcNYI7nINm7+O39f8f4TT/iwTtD7IB5sY9K+UJY7UqBCKNwLk
	QQPdANgen8aGfFtqbrnpRAbezz533ddGfyzExBshw4Nh9BhUHURccVgyA/8kWa0s1EO60ObDbxqdP
	pcFzz5PQga2qoOYlb9xss1UP+5voc3c18dw/WOseM/UvUVtOygeahzzfsEcDF87RKamxbaPlBX6xG
	za5ShkJ6Y0/zHt6DQFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qcr-00000008zyQ-2cmV;
	Wed, 23 Sep 2026 17:19:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qcn-00000008zwY-1A7x;
	Wed, 23 Sep 2026 17:19:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B5BA60515;
	Wed, 23 Sep 2026 17:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533291F000FF;
	Wed, 23 Sep 2026 17:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790183956;
	bh=EwUTC03iMe3mqDQCwXS0ElhwJ195RFfSMSvYZMg9K5c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ajlS9RgcgJmPHoodht9q1Tjuf5/xG6VV5yZ0cMtOxjKRN40NqZx25yf2S1S46TbTx
	 oxL+FAeAVUQPgrWhhpeL06lXnXe1S/qond5RIz1HEwTOZuD5t9JqOgfg7JjcHEBVaT
	 i9JEHZPLF466KVBqI6pEXknFBlyCthgTa1D6vtH8CjUGlNJYO5+ocBLw+G2PJstRaB
	 v2GnA5/E6Mwqt/ORFNEIVMJzqBncb9oR+8w5WNLjj+Qy/uoYYXVFFuSngalJiiZ39Y
	 26VOG4Fme44YuFKGl0jBz7vhNF4xbEu+vi+CFEZafSkhxd7KffQAzwp1GJZfn05/hq
	 OZqSvZaZeGShQ==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Wed, 23 Sep 2026 18:17:53 +0100
Subject: [PATCH v4 04/22] sorttable: parse nm output correctly
MIME-Version: 1.0
Message-Id: <20260923-build-speedup-v4-4-73128809a4a4@kernel.org>
References: <20260923-build-speedup-v4-0-73128809a4a4@kernel.org>
In-Reply-To: <20260923-build-speedup-v4-0-73128809a4a4@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
 linux-hardening@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2694; i=ljs@kernel.org;
 h=from:subject:message-id; bh=wNUVaWGrUfq1J8fZ3VtZkSo4KZCUQiuLpouzmc9mPms=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLK2cF7yMz8as2ltfPXBEIaTk5edNbUrLlkulXbQrz9Mn
 6O992lyRykLgxgXg6yYIsvzL+L7g0TC5nVe8HeDmcPKBDKEgYtTACZyew4jw6bmxf1ON1g32D6L
 KxSzr41NTJnFaaTQn2nM7rPySN3BTwz/s180n1zKz7WxfIvY/3ueffm+MzeY/j/64e4/i7m3ck/
 z8gMA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

c29ydHRhYmxlIHJlYWRzIGEgbGlzdCBvZiBmdW5jdGlvbnMgZnJvbSB2bWxpbnV4LCBwcm92aWRl
ZCBieSB0aGUgb3V0cHV0IG9mCm5tLCB3aXRoIHRoZSAtUyBmbGFnIHNwZWNpZmllZCBwcm92aWRp
bmcgZnVuY3Rpb24gc2l6ZXMuCgpJdCBkb2VzIHNvIHVzaW5nIGZzY2FuZihmcCwgIiUxNnMgJTE2
cyAlYyAlKnNcbiIsIC4uLikgcmVhZGluZyBhZGRyZXNzLApzaXplLCB0eXBlIChhIHNpbmdsZSBj
aGFyYWN0ZXIpIGFuZCBuYW1lLgoKSG93ZXZlciwgbm0gb3V0cHV0cyBubyBzaXplIGZvciBhIHN5
bWJvbCB3aGljaCBoYXMgbm9uZSwgbWVhbmluZyB0aGF0IGl0Cm1pc2ludGVycHJldHMgdGhlc2Ug
ZW50cmllcyAtIGludGVycHJldGluZyB0aGUgdHlwZSBjaGFyYWN0ZXIgYXMgdGhlIHNpemUsCmFu
ZCwgaWYgdGhlIG5hbWUgaXMgYSBzaW5nbGUgY2hhcmFjdGVyLCBpZ25vcmVzIHRoZSBuZXdsaW5l
IGFuZCBzd2FsbG93cwp0aGUgYWRkcmVzcyBvZiB0aGUgbmV4dCBlbnRyeS4KClNpemUtbGVzcyBz
aW5nbGUgY2hhcmFjdGVyIG5hbWVzIGV4aXN0IChlLmcuIHRoZSBhc3NlbWJsZXJzJyBsb29wIGNv
dW50ZXJzCmxlZnQgb3ZlciBhcyBsb2NhbCBhYnNvbHV0ZSBzeW1ib2xzKToKCiAgICAgIDAwMDAw
MDAwMDAwMDAwMDEgYSBpCiAgICAgIDAwMDAwMDAwMDAwMDAwMGYgYSBpCiAgICAgIDAwMDAwMDAw
MDAwMDAwNTAgYSBqCiAgICAgIDAwMDAwMDAwMDAwMDAwNTIgYSB0CiAgICAgIDAwMDAwMDAwMDAw
MDAwOWYgYSBpCiAgICAgIDAwMDAwMDAwMDAwMDAyMDAgYSBpCgpzb3J0dGFibGUgaXMgbG9va2lu
ZyBmb3IgZnVuY3Rpb25zIGFuZCB0aGVzZSBhcmUgbm90IHRoYXQsIGFuZCB3aXRoIG5tJ3MKb3V0
cHV0IHNvcnRlZCwgaXQganVzdCBzbyBoYXBwZW5zIHRvIGJlIHRoYXQgd2hhdCdzIHN3YWxsb3dl
ZCBpcyBuZXZlciBhCmZ1bmN0aW9uLgoKSG93ZXZlciB0aGUgbmV4dCBjb21taXQgaW4gdGhpcyBz
ZXJpZXMgc3RvcHMgc29ydGluZyBubSdzIG91dHB1dCwgc28gdGhpcwpidWcgY2FuIHJlc3VsdHMg
aW4gZnVuY3Rpb24gbmFtZXMgYmVpbmcgbG9zdC4KCkZpeCB0aGUgaXNzdWUgYnkgdXNpbmcgJyUq
W15cbl0nIGluIGZzY2FuZigpIHJhdGhlciB0aGFuICclKnMnIHN1Y2ggdGhhdAp0aGUgc2NhbiBj
YW5ub3QgbW92ZSBwYXN0IHRoZSBuZXdsaW5lLgoKVGhlbiwgY29tcGFyZSB0aGUgYWRkcmVzcyBh
bmQgc2l6ZSBmaWVsZHMgKHdoaWNoIGFyZSBhbHdheXMgcGFkZGVkIHRvIHRoZQpzYW1lIHdpZHRo
IGlmIG91dHB1dCBieSBubSkgLSBpZiB0aGV5IGRpZmZlciwgdGhlbiB0aGlzIGlzIGEgbWlzcmVh
ZCwgc28Kc2ltcGx5IGRpc2NhcmQgdGhlIGVudHJ5LgoKSXQncyBmaW5lIHRvIGRpc2NhcmQgdGhl
c2UsIGFzIHNvcnR0YWJsZSdzIHJhaXNvbiBkJ8OqdHJlIGlzIHRvIGRpc2NvdmVyCndoZXRoZXIg
YSBjYWxsIHNpdGUgaXMgY29udGFpbmVkIHdpdGhpbiBhIGZ1bmN0aW9uIGFuZCBhbiBlbXB0eSBm
dW5jdGlvbgpjYW4ndCBjb250YWluIGFueXRoaW5nLgoKQXNzaXN0ZWQtYnk6IExMTQpTaWduZWQt
b2ZmLWJ5OiBMb3JlbnpvIFN0b2FrZXMgKEFSTSkgPGxqc0BrZXJuZWwub3JnPgotLS0KIHNjcmlw
dHMvc29ydHRhYmxlLmMgfCAxNSArKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9zb3J0dGFi
bGUuYyBiL3NjcmlwdHMvc29ydHRhYmxlLmMKaW5kZXggZDdiNTA1ODFjNzMyLi44OGU0OWE1YzQy
NTEgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMvc29ydHRhYmxlLmMKKysrIGIvc2NyaXB0cy9zb3J0dGFi
bGUuYwpAQCAtMzIyLDEwICszMjIsMjMgQEAgc3RhdGljIGludCBwYXJzZV9zeW1ib2xzKGNvbnN0
IGNoYXIgKmZuYW1lKQogCQlyZXR1cm4gLTE7CiAJfQogCi0Jd2hpbGUgKGZzY2FuZihmcCwgIiUx
NnMgJTE2cyAlYyAlKnNcbiIsIGFkZHJfc3RyLCBzaXplX3N0ciwgJnR5cGUpID09IDMpIHsKKwl3
aGlsZSAoZnNjYW5mKGZwLCAiJTE2cyAlMTZzICVjJSpbXlxuXSIsIGFkZHJfc3RyLCBzaXplX3N0
ciwgJnR5cGUpID09IDMpIHsKIAkJdWludDY0X3QgYWRkcjsKIAkJdWludDY0X3Qgc2l6ZTsKIAor
CQkvKgorCQkgKiBubSBvdXRwdXRzIHNpemUtbGVzcyBlbnRyaWVzIHdpdGggYSBtaXNzaW5nIDJu
ZCB2YWx1ZSwgd2hpY2gKKwkJICogbWVhbnMgZnNjYW5mKCkganVzdCBtaXNyZWFkIGl0cyBmaWVs
ZHMuCisJCSAqCisJCSAqIFRoZXNlIGRvbid0IG1hdHRlciBhcyBhIGNhbGwgc2l0ZSBjYW5ub3Qg
YmUgaW4gYW4gZW1wdHkKKwkJICogZnVuY3Rpb24sIHNvIGp1c3Qgc2tpcCB0aGVtLgorCQkgKgor
CQkgKiBubSBwYWRzIGFkZHJlc3MgYW5kIHNpemUgdG8gdGhlIHNhbWUgd2lkdGgsIHNvIGlmIHRo
ZWlyCisJCSAqIHdpZHRocyBkaWZmZXIsIHRoaXMgaXMgYSBtaXNyZWFkLgorCQkgKi8KKwkJaWYg
KHN0cmxlbihzaXplX3N0cikgIT0gc3RybGVuKGFkZHJfc3RyKSkKKwkJCWNvbnRpbnVlOworCiAJ
CS8qIE9ubHkgY2FyZSBhYm91dCBmdW5jdGlvbnMgKi8KIAkJaWYgKHR5cGUgIT0gJ3QnICYmIHR5
cGUgIT0gJ1QnICYmIHR5cGUgIT0gJ1cnKQogCQkJY29udGludWU7CgotLSAKMi41NS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
