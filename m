Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F892E9B373
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yK2FL+fJ8IlENp0i5RJpnwkrNPTu+WNifYJOvnDtOMs=; b=gKnYP/SQI9pnbG
	2UEVVie/SCLLKqo4d6xVto/MHsSrJFB6cK26/65jS1Zg2WVzC0a3qr53NhPYqIujbQwbrAgNqU5LN
	bv5aPfdDpuuxBnMfs2M7yCNBc9gFkKrokkhGsb+Gmqwn8Do4pis/U8lvyV3dAYsXqnovxvhmcv1g9
	+vrLPhkuPAlR1OEkD5L3r5CUHZ4ynSHehZbiG0xoU9RhMoffV4qruGukTd+QSfkU24bvOwfwnm3oF
	R/mA/2hLzRtu8udM3R5rNJY8ZN7WIZMufCZruZ95DaUjz9ABmT5iDit9H2xTriYQt14yYaumCAf9M
	nGYpLVf5fLvKURGr7rug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Lb-0000000CwBH-2wSl;
	Mon, 02 Mar 2026 12:26:03 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LQ-0000000CvrL-0FWl;
	Mon, 02 Mar 2026 12:25:54 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGu4YUonqtswtsX27rVZnBUBJm/UklEpSAAXy65RzL4=;
	b=NHM8ly0iuYcuh7E4eVeKeGXpReTprXhsGXJI+WYqlEaUf/lJYOUtBGH2QJnSAmI3I5QAPW
	LY468YWc+wcltpXurLXAtczrS3GRRs7ErvM61alrkPsKE3X9qmMsWKbpRyDz62q6oE5QGd
	Cw8Ohv3wtKFFpU4zvThVjA5RvZbBiw4fuurA+7UNWmQxvsskDaVVA4bfSSZgB12N/2TAie
	0omDMNnN9zOIOVB7ao1DehqzId2upP6OirsIQL+gbHRxhanTRwW23vCB34naWTWXi9Htpn
	0i4DmvsTWUtmu8SNg8v9pArAePWhRXG5bmVWZWSE0NmChST4B+21+gbeLT8M7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGu4YUonqtswtsX27rVZnBUBJm/UklEpSAAXy65RzL4=;
	b=M5bdRgSQ3QlnfcfTl+A8OeDFC/IW8uhkG1G/LEw+Ak1w+mPEMp7EWeeSHFb/e7QgJ7ScQS
	t/VtnQymro8BskCg==
Date: Mon, 02 Mar 2026 13:25:33 +0100
Subject: [PATCH 09/15] s390: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260302-at-vector-size-arch-v1-9-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1408;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=wSV5J7HzEFuS3KJbZLwjne1zxmW3zDPxdBoyG55t7aA=;
 b=DiL9Q3q9a2OSCTrfhnV8gNkfPXzhPZlr/JwJIjpZtjcaaAF6eqOl6SEEE9FmY9unQs6qSC3IS
 Tt2RIf9FHBFC64LLNTZGUWGPwKnIoYVR6wJCeubfkDRjuZzU3F/usem
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042552_247374_C471B5BE 
X-CRM114-Status: GOOD (  10.10  )
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
b25peC5kZT4KLS0tCiBhcmNoL3MzOTAvaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICB8IDcgKysr
KysrKwogYXJjaC9zMzkwL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggfCA2ICsrLS0tLQogMiBm
aWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL2F1eHZlYy5oIGIvYXJjaC9zMzkwL2luY2x1ZGUvYXNt
L2F1eHZlYy5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYmVhYWVm
ZTEyYTg0Ci0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL2F1eHZlYy5o
CkBAIC0wLDAgKzEsNyBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgV0lU
SCBMaW51eC1zeXNjYWxsLW5vdGUgKi8KKyNpZm5kZWYgX19BU01TMzkwX0FVWFZFQ19ICisjZGVm
aW5lIF9fQVNNUzM5MF9BVVhWRUNfSAorCisjZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggMSAv
KiBlbnRyaWVzIGluIEFSQ0hfRExJTkZPICovCisKKyNlbmRpZgpkaWZmIC0tZ2l0IGEvYXJjaC9z
MzkwL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggYi9hcmNoL3MzOTAvaW5jbHVkZS91YXBpL2Fz
bS9hdXh2ZWMuaAppbmRleCBhMDU2YzQ2MzdmZmMuLjU0YmJmZDY4ZDcwOSAxMDA2NDQKLS0tIGEv
YXJjaC9zMzkwL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKKysrIGIvYXJjaC9zMzkwL2luY2x1
ZGUvdWFwaS9hc20vYXV4dmVjLmgKQEAgLTEsOSArMSw3IEBACiAvKiBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMCBXSVRIIExpbnV4LXN5c2NhbGwtbm90ZSAqLwotI2lmbmRlZiBfX0FT
TVMzOTBfQVVYVkVDX0gKLSNkZWZpbmUgX19BU01TMzkwX0FVWFZFQ19ICisjaWZuZGVmIF9fQVNN
UzM5MF9VQVBJX0FVWFZFQ19ICisjZGVmaW5lIF9fQVNNUzM5MF9VQVBJX0FVWFZFQ19ICiAKICNk
ZWZpbmUgQVRfU1lTSU5GT19FSERSCQkzMwogCi0jZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0gg
MSAvKiBlbnRyaWVzIGluIEFSQ0hfRExJTkZPICovCi0KICNlbmRpZgoKLS0gCjIuNTMuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
