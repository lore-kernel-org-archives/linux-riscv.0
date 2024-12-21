Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029C1E7718B
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Dec 2024 14:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42nHtuwnLJ/KXr2DDIt5jQsrmasmHL+IZZIbu3GDnU8=; b=1uaz65qHzMSGZV
	j0/PMK2pOzh+UUq2f2HWJ7NnjKPUhJE2ETTttDJ7/hGvAmFO9VOAXsEvtqCX/AusF44UPInMna1/L
	XhITGZaHi2QxrsvSdc20RNDUaRXeR2+Gnxf7+6UomKoF6zWIZbVhgrQDBquVYMmcHnS7BBwp89Nhj
	QyhjWgJN6ACBm+ESdV+r4dYvT5X70xlqBLKF9esXKlp3QFrVnO1NZPztWdMIiZReEabdsgdUdzJiZ
	NDbyc1qHN/md2S6wERGty0717XZWHIIeakodUycF7+yqgR9jIFemmCF7hAUYNP8FZJt3v1YXNnjEi
	ZOJgiCFZ9YECk0EQL84Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0if-000000074je-27AJ;
	Sat, 21 Dec 2024 14:44:41 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0ib-000000074gT-2Kvm
	for linux-riscv@lists.infradead.org;
	Sat, 21 Dec 2024 14:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792272;
	bh=nlgKA1aWXtMZ4vLJ+M3UslYSVWgrW4lQ46FIgxLbuk0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KT0linBfSK3yb1tVBfOsrUo0Qmsy5DtV5NcKzkVfQADhnVJN5E0BXAJCApmsPsHr3
	 zVQ0RXn1dybDs65olAHAF0Rn8yy9IR9JJcg+jYFJGtfGw1QqslTzaN5dc1I3IX/PcO
	 i5EQl6N4KZ5WUhbhi1y94htVb3UCXl/uEKsEVeZA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 21 Dec 2024 15:44:28 +0100
Subject: [PATCH 1/6] tools/nolibc: add support for waitid()
MIME-Version: 1.0
Message-Id: <20241221-nolibc-rv32-v1-1-d9ef6dab7c63@weissschuh.net>
References: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
In-Reply-To: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Zhangjin Wu <falcon@tinylab.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792271; l=1451;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=nlgKA1aWXtMZ4vLJ+M3UslYSVWgrW4lQ46FIgxLbuk0=;
 b=Ig+cd8xPaVLdOY8TmrPbOeWu/tTdW9wbIV95eO+fM2u8WdX0eUj3Ua2COzeHZgYnv1GPCWsmN
 o6sEOaa5ANfBUMHGbBZVGucYzVcpNMAel6JpLdzkUuzwQvKrCwZnr79
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_064437_743969_82315399 
X-CRM114-Status: UNSURE (   6.30  )
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

d2FpdGlkKCkgaXMgdGhlIG1vZGVybiB2YXJpYW50IG9mIHRoZSBmYW1pbHkgb2Ygd2FpdC1saWtl
IHN5c2NhbGxzLgpTb21lIGFyY2hpdGVjdHVyZXMgaGF2ZSBkcm9wcGVkIHN1cHBvcnQgZm9yIHdh
aXQoKSwgd2FpdDQoKSBhbmQgd2FpdHBpZCgpCmJ1dCBhbGwgb2YgdGhlbSBzdXBwb3J0IHdhaXRp
ZCgpLgpJdCBpcyBtb3JlIGZsZXhpYmxlIGFuZCBlYXNpZXIgdG8gdXNlIHRoYW4gdGhlIG9sZGVy
IG9uZXMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3NzY2h1
aC5uZXQ+Ci0tLQogdG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmggfCAxOCArKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9v
bHMvaW5jbHVkZS9ub2xpYmMvc3lzLmggYi90b29scy9pbmNsdWRlL25vbGliYy9zeXMuaAppbmRl
eCA3YjgyYmMzY2YxMDc0MzlhM2YwOWY5OGI5OWQ0ZDU0MGZmYjliYTJhLi5kNGE1YzIzOTlhNjZi
MjAwZWJmN2FiMjQ5NTY5Y2NlMjI4NTQ4MWE1IDEwMDY0NAotLS0gYS90b29scy9pbmNsdWRlL25v
bGliYy9zeXMuaAorKysgYi90b29scy9pbmNsdWRlL25vbGliYy9zeXMuaApAQCAtMjMsNiArMjMs
NyBAQAogI2luY2x1ZGUgPGxpbnV4L3ByY3RsLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzb3VyY2Uu
aD4KICNpbmNsdWRlIDxsaW51eC91dHNuYW1lLmg+CisjaW5jbHVkZSA8bGludXgvc2lnbmFsLmg+
CiAKICNpbmNsdWRlICJhcmNoLmgiCiAjaW5jbHVkZSAiZXJybm8uaCIKQEAgLTEyMjUsNiArMTIy
NiwyMyBAQCBwaWRfdCB3YWl0cGlkKHBpZF90IHBpZCwgaW50ICpzdGF0dXMsIGludCBvcHRpb25z
KQogfQogCiAKKy8qCisgKiBpbnQgd2FpdGlkKGlkdHlwZV90IGlkdHlwZSwgaWRfdCBpZCwgc2ln
aW5mb190ICppbmZvcCwgaW50IG9wdGlvbnMpOworICovCisKK3N0YXRpYyBfX2F0dHJpYnV0ZV9f
KCh1bnVzZWQpKQoraW50IHN5c193YWl0aWQoaW50IHdoaWNoLCBwaWRfdCBwaWQsIHNpZ2luZm9f
dCAqaW5mb3AsIGludCBvcHRpb25zLCBzdHJ1Y3QgcnVzYWdlICpydXNhZ2UpCit7CisJcmV0dXJu
IG15X3N5c2NhbGw1KF9fTlJfd2FpdGlkLCB3aGljaCwgcGlkLCBpbmZvcCwgb3B0aW9ucywgcnVz
YWdlKTsKK30KKworc3RhdGljIF9fYXR0cmlidXRlX18oKHVudXNlZCkpCitpbnQgd2FpdGlkKGlu
dCB3aGljaCwgcGlkX3QgcGlkLCBzaWdpbmZvX3QgKmluZm9wLCBpbnQgb3B0aW9ucykKK3sKKwly
ZXR1cm4gX19zeXNyZXQoc3lzX3dhaXRpZCh3aGljaCwgcGlkLCBpbmZvcCwgb3B0aW9ucywgTlVM
TCkpOworfQorCisKIC8qCiAgKiBzc2l6ZV90IHdyaXRlKGludCBmZCwgY29uc3Qgdm9pZCAqYnVm
LCBzaXplX3QgY291bnQpOwogICovCgotLSAKMi40Ny4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
