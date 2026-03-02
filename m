Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D6DE9B36A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m63oi/Iv1K/VOGQ2w9H1+wQawdG2h1IvN9MF8jlzWqQ=; b=00S6W55zVOh+b1
	+qyQjdkIFJQzjsBaGhMQXzXGftWRVZBo00PorqYyiY/82rCCj8tX3To0aNrdL0YqKK6MSqLUsbf0A
	8S4XPpP6qOH8Yxbn819oDkpOSMsmFPjlY3hwh3j6nTqVqdSiVHknLHhXSgnZ769yaGwEVagADDL9c
	jVAKNjH9gLUt1nIxOfZANd2FBgZLOOJrLOh7pYS9uPmm63yASwAezVDn7HCf9zJepTXXHhbrLXePz
	As9J5oSQ4iG/c5Hnd/zT4h8zuPs46lb6yAj25bhTGXrOJXd3ylRhcEK7LZb558A6IfqEwyi3rQtJZ
	cW5YEfx6IbWLDGyTvjgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Lo-0000000Cwb7-3OW5;
	Mon, 02 Mar 2026 12:26:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LS-0000000Cvuq-27YN;
	Mon, 02 Mar 2026 12:25:55 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUatCUMGjSOAYdWwYL9kAf5S0UMPuz+Fx84eRD4pGU4=;
	b=MW1bGCsS9DfO9X+v0DSKadvLFn+SWmk1pn+rddicrRlb+25XuZl0eJt6iP0G+BXg34cvQ+
	1Ypq8dU9/4H9JLtsbNLwN5Op4E1bl+T4qCK3Q+t4+bjDkmJqqKq1cZulRp0Q5bjxyuTa47
	wiRCfLK8Jy/Zk+I2mf8sQaKTwx9mwTzg39fMPaeuYCeMY1g5BgCHN7iPogP3geq0eUFj3Z
	1espng2OIo24NrTFZzZJjZfVEZhat3bTP91FgzcChTJq/X8HDD3/SOOdkrO038gUGid1NP
	/TG9xAya313yScFDighxypdFYvV3s2al8OVDGX6NMfe71/7TtA36WV+yKWJIog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUatCUMGjSOAYdWwYL9kAf5S0UMPuz+Fx84eRD4pGU4=;
	b=Glqb/iX58ImwLmydqxjJwzbHZqXKn5FJ/rKO/+KdO7fpIDILYZKeypk8G9y+WgL/AIWKQi
	8ZSn2D4OHrttUMCg==
Date: Mon, 02 Mar 2026 13:25:38 +0100
Subject: [PATCH 14/15] alpha: remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260302-at-vector-size-arch-v1-14-a11f03ba2ca8@linutronix.de>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1621;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1k5fCTPjgHXmT1wIddDgmvVMNFYPCfoGbNYiBvOaniE=;
 b=+emcoOjpmCtOGbRKRilDXun4wh9rZo8IxjTkm9zYNPepV3X+fcHLumuZs3KaZBdDmhAbmZz3X
 Sar6SiZRFKiDIiijEXUFkxsbjuuwCItZ6i5gyRlwHoXVec8Fv7oUaT2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042554_693267_6D16EA06 
X-CRM114-Status: GOOD (  11.74  )
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
b25peC5kZT4KLS0tCiBhcmNoL2FscGhhL2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgfCA3ICsr
KysrKysKIGFyY2gvYWxwaGEvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCB8IDggKysrLS0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL2FscGhhL2luY2x1ZGUvYXNtL2F1eHZlYy5oIGIvYXJjaC9hbHBoYS9pbmNs
dWRlL2FzbS9hdXh2ZWMuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAu
LmZhOTBlZTRmODk5YwotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvYWxwaGEvaW5jbHVkZS9hc20v
YXV4dmVjLmgKQEAgLTAsMCArMSw3IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMCAqLworI2lmbmRlZiBfX0FTTV9BTFBIQV9BVVhWRUNfSAorI2RlZmluZSBfX0FTTV9BTFBI
QV9BVVhWRUNfSAorCisjZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggNCAvKiBlbnRyaWVzIGlu
IEFSQ0hfRExJTkZPICovCisKKyNlbmRpZiAvKiBfX0FTTV9BTFBIQV9BVVhWRUNfSCAqLwpkaWZm
IC0tZ2l0IGEvYXJjaC9hbHBoYS9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oIGIvYXJjaC9hbHBo
YS9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCmluZGV4IDU3Y2FlODc4MGQ4MS4uZDIxYjg3YjY3
MzBhIDEwMDY0NAotLS0gYS9hcmNoL2FscGhhL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKKysr
IGIvYXJjaC9hbHBoYS9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCkBAIC0xLDYgKzEsNiBAQAog
LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgV0lUSCBMaW51eC1zeXNjYWxsLW5v
dGUgKi8KLSNpZm5kZWYgX19BU01fQUxQSEFfQVVYVkVDX0gKLSNkZWZpbmUgX19BU01fQUxQSEFf
QVVYVkVDX0gKKyNpZm5kZWYgX19VQVBJX0FTTV9BTFBIQV9BVVhWRUNfSAorI2RlZmluZSBfX1VB
UElfQVNNX0FMUEhBX0FVWFZFQ19ICiAKIC8qIFJlc2VydmUgdGhlc2UgbnVtYmVycyBmb3IgYW55
IGZ1dHVyZSB1c2Ugb2YgYSBWRFNPLiAgKi8KICNpZiAwCkBAIC0yMiw2ICsyMiw0IEBACiAjZGVm
aW5lIEFUX0wyX0NBQ0hFU0hBUEUJMzYKICNkZWZpbmUgQVRfTDNfQ0FDSEVTSEFQRQkzNwogCi0j
ZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggNCAvKiBlbnRyaWVzIGluIEFSQ0hfRExJTkZPICov
Ci0KLSNlbmRpZiAvKiBfX0FTTV9BTFBIQV9BVVhWRUNfSCAqLworI2VuZGlmIC8qIF9fVUFQSV9B
U01fQUxQSEFfQVVYVkVDX0ggKi8KCi0tIAoyLjUzLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
