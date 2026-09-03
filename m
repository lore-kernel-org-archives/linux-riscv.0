Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F471C624D4
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yv+cvinCvHskIVaCCc5FfroglHrlU3qumGYKPV2Hrr4=; b=r+jKVR/bq+Zmvo
	LwTggnEMvyG9Dd3h/jLe9PGJkAtILkvqzLWqc9vovfanM70WgZkEWMCPKx1A2PLzCeNICQh3cAEz5
	FSrNsRsy+i9voSJ2s8x156UYeefCd/nE3E68k27zZkZ4OboLsIytrcTId607g0m2yZCs16mNcmiMZ
	mUU7lMMJm1E63BCBsIDNDGyVlQ7LyKWaDwZheVunTBmr07TcW/nKB62IO792HcdR1dLQjKH2LWeD/
	UaZO2c0xnoz6KrS9d7CN4fsHVgWiq2y66cxmn3Oe7+qsSApwmN4BwaGQD+iQdkMk3mnAp02lphUlU
	JD1fPjpSerWnulFdHZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2254-0000000GdJv-2iVb;
	Thu, 03 Sep 2026 07:41:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224p-0000000Gcoq-2uAs;
	Thu, 03 Sep 2026 07:41:50 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rrF5e3YgB+atcHD5Gfa4JDkXTz+7YXoVXv9oxsgM/c=;
	b=XvaTjzYVh0HucbGPiPARvWRn6wVYgsx+Csp2bfua/QOqfVCXtGr02dq9QV/NIgKdrmQttN
	FruSzRbjGV2ltb8/SOj7JTLix/fJZVbI+j5Ihb3ZDpTm9XgO+CVNAi1KGHNu8modprd4sx
	vkfb4UP1bfOYEiO25nbrMDeHeIFboyfqD/hgadHhg6C9qPWzibZS6r8QLE9hRF1PQ//5se
	ouoFxnd7ZLe4sa78VjkPB4220N3XCrJT5IaQiUF3lV/yfjq+0w2UO+nVMsmD0xDcfEP6cw
	d8JWdATeYQ0teA0PFMluj9KnXp8rrJpvWvmGfu+qMoJuGF9YZd9f/btvsvTkJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rrF5e3YgB+atcHD5Gfa4JDkXTz+7YXoVXv9oxsgM/c=;
	b=uYmG0xv0qojWcb+hNeKMxC7/rqCyITMqfBa/1k5/2s66l8mXzXZhdsVPFBCJGgk8R1nWYV
	/D031BwFTFBTL0Bg==
Date: Thu, 03 Sep 2026 09:41:29 +0200
Subject: [PATCH v2 14/15] alpha: remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260903-at-vector-size-arch-v2-14-5bc32a71e3d8@linutronix.de>
References: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
In-Reply-To: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Magnus Lindholm <linmag7@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=1710;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=mT6IunlNmVAACIv/qOnfprsS76yyb9kAy/7Jf1UY23I=;
 b=yYjljrbgHd9g0YvBGpHX18OgBAHjsDzVbGwiInZAXSnDdTlr6s+0cRT5wpLbzZrAcLw7t0bCW
 UZTIpaJMtZoDO1+CQ6vAol3PKC5JWA+jRIyABLT06nkmg8XMLKxb5lc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004139_895875_B1399AE3 
X-CRM114-Status: GOOD (  11.91  )
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

VGhlcmUgaXMgbm90aGluZyB1c2Vyc3BhY2UgY2FuIGRvIHdpdGggdGhpcyB2YWx1ZS4gSW4gdGhl
IGtlcm5lbCBpcwphbHdheXMgY29tYmluZWQgd2l0aCBBVF9WRUNUT1JfU0laRV9CQVNFLCB3aGlj
aCBpcyBub3QgZXhwb3NlZCB0bwp1c2Vyc3BhY2UgYW5kIGFsc28gY2hhbmdlcyBmcm9tIHRpbWUg
dG8gdGltZS4KCk1vdmUgdGhlIHN5bWJvbCB0byBhIGtlcm5lbC1pbnRlcm5hbCBoZWFkZXIuCgpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRy
b25peC5kZT4KQWNrZWQtYnk6IE1hZ251cyBMaW5kaG9sbSA8bGlubWFnN0BnbWFpbC5jb20+ClJl
dmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNAa2VybmVsLm9yZz4KLS0tCiBhcmNoL2FscGhhL2lu
Y2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgfCA3ICsrKysrKysKIGFyY2gvYWxwaGEvaW5jbHVkZS91
YXBpL2FzbS9hdXh2ZWMuaCB8IDggKysrLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FscGhhL2luY2x1ZGUv
YXNtL2F1eHZlYy5oIGIvYXJjaC9hbHBoYS9pbmNsdWRlL2FzbS9hdXh2ZWMuaApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmZhOTBlZTRmODk5YwotLS0gL2Rldi9udWxs
CisrKyBiL2FyY2gvYWxwaGEvaW5jbHVkZS9hc20vYXV4dmVjLmgKQEAgLTAsMCArMSw3IEBACisv
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLworI2lmbmRlZiBfX0FTTV9BTFBI
QV9BVVhWRUNfSAorI2RlZmluZSBfX0FTTV9BTFBIQV9BVVhWRUNfSAorCisjZGVmaW5lIEFUX1ZF
Q1RPUl9TSVpFX0FSQ0ggNCAvKiBlbnRyaWVzIGluIEFSQ0hfRExJTkZPICovCisKKyNlbmRpZiAv
KiBfX0FTTV9BTFBIQV9BVVhWRUNfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9hbHBoYS9pbmNsdWRl
L3VhcGkvYXNtL2F1eHZlYy5oIGIvYXJjaC9hbHBoYS9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5o
CmluZGV4IDU3Y2FlODc4MGQ4MS4uZDIxYjg3YjY3MzBhIDEwMDY0NAotLS0gYS9hcmNoL2FscGhh
L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKKysrIGIvYXJjaC9hbHBoYS9pbmNsdWRlL3VhcGkv
YXNtL2F1eHZlYy5oCkBAIC0xLDYgKzEsNiBAQAogLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAgV0lUSCBMaW51eC1zeXNjYWxsLW5vdGUgKi8KLSNpZm5kZWYgX19BU01fQUxQSEFf
QVVYVkVDX0gKLSNkZWZpbmUgX19BU01fQUxQSEFfQVVYVkVDX0gKKyNpZm5kZWYgX19VQVBJX0FT
TV9BTFBIQV9BVVhWRUNfSAorI2RlZmluZSBfX1VBUElfQVNNX0FMUEhBX0FVWFZFQ19ICiAKIC8q
IFJlc2VydmUgdGhlc2UgbnVtYmVycyBmb3IgYW55IGZ1dHVyZSB1c2Ugb2YgYSBWRFNPLiAgKi8K
ICNpZiAwCkBAIC0yMiw2ICsyMiw0IEBACiAjZGVmaW5lIEFUX0wyX0NBQ0hFU0hBUEUJMzYKICNk
ZWZpbmUgQVRfTDNfQ0FDSEVTSEFQRQkzNwogCi0jZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0gg
NCAvKiBlbnRyaWVzIGluIEFSQ0hfRExJTkZPICovCi0KLSNlbmRpZiAvKiBfX0FTTV9BTFBIQV9B
VVhWRUNfSCAqLworI2VuZGlmIC8qIF9fVUFQSV9BU01fQUxQSEFfQVVYVkVDX0ggKi8KCi0tIAoy
LjU1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
