Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E798EC79F82
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SAznll94dAEPUOYSd879iRCy0dYOxp8cpkaDWlvAt4E=; b=IVvLff5zBzRU31
	MWQjWk2OI7bQWGtlx+q7xI3lAmYOSX8zGUlOO7SXB1AZ/fu/0i++b4sma1qiZWo7BF/jfqy4BT9DH
	5Yo49U/+xA6EAydSAaLRhd8eTs4vC2Z9TbgKWR8oNC60HxpBY6II7A4lK/QfzraiTle93/oqV09b5
	o4WQOJMy3vgnL1Eb1LQuNtu6MdQj4ggtddrr0l3ywRMeA7y+xEjZTkrwn9v7T941NgluyPtAOLFys
	OuH0/xowg3N0D3L5j+6Eu3rOvbWWyvp0seCusgWan62nXh+QZEaJaRx5bQj40tBbYbbUYowE1dmoA
	1r0gCqUsDvMqVvsf46eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2253-0000000GdHu-3X7V;
	Thu, 03 Sep 2026 07:41:53 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224p-0000000Gcnf-04QA;
	Thu, 03 Sep 2026 07:41:44 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acT7QjZNdUmpfnBE9uBNeofdPEPn+BimCrNJZCbn/To=;
	b=3jP4QdtfvdGKafZk4gV8HAs0JKCcq1g5wS/L1M3Qb1c7h/bp22yYQ4TGtOpk0Mr1S/c40K
	vezg61PPYZqPkMIMi0P+MeWnhIYlWcTdnwH+SRrFrQj+nHm3Q7XiGS+vPJ4prnY7NtnqS4
	Xcm7eDuut8ABcFWFXYthMXqf5wGy9Ccz9usV3DQF9udUqTs+ZSL1h0G/e/uPiHShZ/Ewxu
	mmqEjU6o4o8g1buldyiSf74wUiAqSpfnewCZQA6Jv6yvahNkaYBKs1k4bYgN+RF3gqYYZY
	9mJxAv66dqtq8g2IiUO/pUOHIbenwPQiYRyIjphamnJW3UILkPOqYRUhshZy9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acT7QjZNdUmpfnBE9uBNeofdPEPn+BimCrNJZCbn/To=;
	b=s2g2u1zE4MoDzQePYnFomJgqRmXe5nRTN2VoD8bDtfLrzofrwt3d1WEshMMUnT7M9XzlRA
	0xw/D3K/rl1yL3Bw==
Date: Thu, 03 Sep 2026 09:41:28 +0200
Subject: [PATCH v2 13/15] sh: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260903-at-vector-size-arch-v2-13-5bc32a71e3d8@linutronix.de>
References: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
In-Reply-To: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=1608;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=YKN2r1KwV0S2heb/8Y+Jhhyff24Np1SwL0Bw1UDwB4U=;
 b=useSqq1PQgc5jzt7dwdzir5U98FAJIkoH55nFNQGYdoiuFZAdgXYdssF8gR1E00nS8bRYsyyN
 V4+Vyu8LX0EAHidn3hUqdF1MdUf5WBlzeDxA5S/zQiX92l2UKGbW/Vx
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004139_214026_CD7C7473 
X-CRM114-Status: GOOD (  11.58  )
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
b25peC5kZT4KUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPgotLS0KIGFy
Y2gvc2gvaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICB8IDcgKysrKysrKwogYXJjaC9zaC9pbmNs
dWRlL3VhcGkvYXNtL2F1eHZlYy5oIHwgOCArKystLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvc2gvaW5jbHVk
ZS9hc20vYXV4dmVjLmggYi9hcmNoL3NoL2luY2x1ZGUvYXNtL2F1eHZlYy5oCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZjA4MzA4MDhlYjE5Ci0tLSAvZGV2L251bGwK
KysrIGIvYXJjaC9zaC9pbmNsdWRlL2FzbS9hdXh2ZWMuaApAQCAtMCwwICsxLDcgQEAKKy8qIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCisjaWZuZGVmIF9fQVNNX1NIX0FVWFZF
Q19ICisjZGVmaW5lIF9fQVNNX1NIX0FVWFZFQ19ICisKKyNkZWZpbmUgQVRfVkVDVE9SX1NJWkVf
QVJDSCA1IC8qIGVudHJpZXMgaW4gQVJDSF9ETElORk8gKi8KKworI2VuZGlmIC8qIF9fQVNNX1NI
X0FVWFZFQ19IICovCmRpZmYgLS1naXQgYS9hcmNoL3NoL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVj
LmggYi9hcmNoL3NoL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKaW5kZXggNjNmY2MzOWUyYzZh
Li5jZjBmMTNkYTk3N2EgMTAwNjQ0Ci0tLSBhL2FyY2gvc2gvaW5jbHVkZS91YXBpL2FzbS9hdXh2
ZWMuaAorKysgYi9hcmNoL3NoL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKQEAgLTEsNiArMSw2
IEBACiAvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBXSVRIIExpbnV4LXN5c2Nh
bGwtbm90ZSAqLwotI2lmbmRlZiBfX0FTTV9TSF9BVVhWRUNfSAotI2RlZmluZSBfX0FTTV9TSF9B
VVhWRUNfSAorI2lmbmRlZiBfX1VBUElfQVNNX1NIX0FVWFZFQ19ICisjZGVmaW5lIF9fVUFQSV9B
U01fU0hfQVVYVkVDX0gKIAogLyoKICAqIEFyY2hpdGVjdHVyZS1uZXV0cmFsIEFUXyB2YWx1ZXMg
aW4gMC0xNywgbGVhdmUgc29tZSByb29tCkBAIC0zMCw2ICszMCw0IEBACiAjZGVmaW5lIEFUX0wx
RF9DQUNIRVNIQVBFCTM1CiAjZGVmaW5lIEFUX0wyX0NBQ0hFU0hBUEUJMzYKIAotI2RlZmluZSBB
VF9WRUNUT1JfU0laRV9BUkNIIDUgLyogZW50cmllcyBpbiBBUkNIX0RMSU5GTyAqLwotCi0jZW5k
aWYgLyogX19BU01fU0hfQVVYVkVDX0ggKi8KKyNlbmRpZiAvKiBfX1VBUElfQVNNX1NIX0FVWFZF
Q19IICovCgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
