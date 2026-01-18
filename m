Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2289DC9832F
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 14:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eRs43u0Fd/O1O2FJpm8vltqsItiQMj8+AqeKbzjlSsA=; b=3eVSUeJKMtgip8
	DGTfAwkvaqWrFrDJwpZfsSgluow1utag7AcULHuQZOaARzcYiqpLLM1M0R27mtkIYxnYp6/Cu7DId
	oJLOzm889jOFu9d71r0ITQ/Y742hgJQ4meABxMWzMuVNhgaBkb/hP9B/Yyq0VMvusbaGH1xCTMkOw
	jbhz0Ex5711mwPZxxhGkwkpqfclGofLMDEUHIdat3iRmFVbOLIDw/vlcpf75Wi6FX/MbImWRBa+8e
	Tj+gO5PrCs1NLhpwzSvpeIoK7m6A5qBd/VQovNu0gb2bUr0YC3ix7SUh2lXMzQ/42XC64EXIThAeB
	ez6RfkCG/Tod0axeNJpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhUBA-00000000IZN-3hgV;
	Sun, 18 Jan 2026 14:55:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhUB9-00000000IYa-04rr
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 14:55:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECEEA40255;
	Sun, 18 Jan 2026 14:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4F1C116D0;
	Sun, 18 Jan 2026 14:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768748097;
	bh=onnNKT9x+UxIhKfIKzWsdnLCVpP35zD12K4huZOgu60=;
	h=From:To:Cc:Subject:Date:From;
	b=YAGajqkXCOz8TZGrjf82Zod3IpwhCN/crMwFDOA6exb4MZ+nQvlJ17YarwHNwxbsk
	 YEPtI/13NLZfXbSCFoK0r2KnUlBxYouswZn/OfECJwob911/wgqBkXZBufVQ9U8YBF
	 F3a5KmPlMN1rMtkMzK2E+PlHV9bPFwQPi0KcUUaQ9hU/d10oyqc2fe1ElNwf/yLzJt
	 2AsOkQ1ezo2gotbYmYeUO1GQ3mf3Y+NSx6kgo+u/vHBQBVlOTWPZ9JSxoRejQl0LvG
	 DkHSLREQyrv4kvI8FkdI7yW7cieq8QPk6UOVXbyYDCVZu0BaXoXL1iaev7jP6ekl89
	 CGZ4IP88qMR0g==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@dabbelt.com,
	bjorn@kernel.org,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	pjw@kernel.org,
	alex@ghiti.fr,
	fangyu.yu@linux.alibaba.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH] riscv: mm: Fixup no5lvl fails on physical address base = 128TiB
Date: Sun, 18 Jan 2026 09:54:41 -0500
Message-Id: <20260118145441.291302-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_065459_120046_A784F0B0 
X-CRM114-Status: UNSURE (   8.05  )
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

RnJvbTogIkd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSIgPGd1b3JlbkBrZXJuZWwub3Jn
PgoKVW5saWtlIG5vNGx2bCwgbm81bHZsIHN0aWxsIGNvbnRpbnVlcyBkZXRlY3Qgc2F0cCwgd2hp
Y2gKcmVxdWlyZXMgdmE9cGEgbWFwcGluZy4gV2hlbiBwYT0weDgwMDAwMDAwMDAwMCwgbm81bHZs
CndvdWxkIGZhaWwgaW4gU3Y0OCBtb2RlIGR1ZSB0byBhbiBpbGxlZ2FsIFZBIHZhbHVlIG9mCjB4
ODAwMDAwMDAwMDAwLgoKU28sIHByZXZlbnQgZGV0ZWN0aW5nIHRoZSBzYXRwIGZsb3cgZm9yIG5v
NWx2bCwgd2hpY2ggaXMKdGhlIHNhbWUgYXMgbm80bHZsLiBUaGF0IG1lYW5zIHRoZSB1c2VyIG5l
ZWRzIHRvIGtub3cgdGhlCm1hY2hpbmUncyBleGFjdCBtb2RlIHdoZW4gdXNpbmcgbm81bHZsLgoK
Rml4ZXM6IDI2ZTdhYWNiODNkZiAoInJpc2N2OiBBbGxvdyB0byBkb3duZ3JhZGUgcGFnaW5nIG1v
ZGUgZnJvbSB0aGUgY29tbWFuZCBsaW5lIikKQ2M6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRp
QHJpdm9zaW5jLmNvbT4KQ2M6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KU2ln
bmVkLW9mZi1ieTogR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpIDxndW9yZW5Aa2VybmVs
Lm9yZz4KLS0tCiBhcmNoL3Jpc2N2L21tL2luaXQuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jp
c2N2L21tL2luaXQuYwppbmRleCBhZGRiOGE5MzA1YmUuLjZiNTI2ZjFlMjc2YSAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKQEAgLTg3
Miw2ICs4NzIsNyBAQCBzdGF0aWMgX19pbml0IHZvaWQgc2V0X3NhdHBfbW9kZSh1aW50cHRyX3Qg
ZHRiX3BhKQogCiAJaWYgKHNhdHBfbW9kZV9saW1pdCA9PSBTQVRQX01PREVfNDgpIHsKIAkJZGlz
YWJsZV9wZ3RhYmxlX2w1KCk7CisJCXJldHVybjsKIAl9IGVsc2UgaWYgKHNhdHBfbW9kZV9saW1p
dCA9PSBTQVRQX01PREVfMzkpIHsKIAkJZGlzYWJsZV9wZ3RhYmxlX2w1KCk7CiAJCWRpc2FibGVf
cGd0YWJsZV9sNCgpOwotLSAKMi40MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
