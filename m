Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEC3C79F80
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9DtBxCtgsZNaWgrrRLKf2Ykft3TeGRpnXEZcaA5jss=; b=IFn6q8c/8nxBac
	yobbR6IULQ08DPri+wbhugFqT9rw4Kb68lrBJKpAawztaghqQ9zxhBQBGnodUVzFZZRwhHgwvJmVN
	GPM/L12Jc/j86a7rETJCseILn+Sya46MJw7w/IAYouiX2/RwXDIZPbYtInvwzwf62qUs11JsWHyk4
	4Vu7Wpm6ekcXW/oOfnXReVGlipYFDDk4sVIcZbNqhDXIDaJkLSf6dD554LPOlKWLwNCH4lAfhQLwJ
	7SGTuch/vbRanFxwU3EQraxdnjcU9+GAn4KrWn2Ht1UZQKmFfztd++PoUPOpZe0TLxErZTrUBAvI1
	3pLicjsqEK8SoV3jnNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224q-0000000GcsT-3sGG;
	Thu, 03 Sep 2026 07:41:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224i-0000000Gci0-2SwF;
	Thu, 03 Sep 2026 07:41:35 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tzk8S7GGq/mqM3W6SmaZkZnDg7V0wPqYFRG/WWfPRl8=;
	b=wnd6QEH54/BjH3IqL+NmsSLdPMkIm3Ol4UY/fevb8PsoirNu25dRIf9FyoBeO21n7ryuiB
	4q8W5smEU5SP2xUhtsmAPB8t1AyD7BOnfk9PMF61YydeJW57H9S+LagF4bPuQfR4881WRX
	/4oCAgEv/Lb/GUwIYUiN9M5C/Nq2KJrUZLyuYIxmNF/rXmTaHpNExOd8dL/nTrYG1A8nqS
	1IJmvplNWiUa6b0Q2weqH1mz/Kn4SalyfB2YijMQ8/Vpp2jtuXuQxHZdB3BjakEgFTGG1+
	IzqqSnX5CGvvZly/aH0pQFeEH4/dWYMPZ/63MP3uHm5VaD0VlSxBYQTUsX1SgQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tzk8S7GGq/mqM3W6SmaZkZnDg7V0wPqYFRG/WWfPRl8=;
	b=3zO6GdloI0RIRQIUARPzBVJ6Z2WmANTijL9R9i7Ce0cPzMjNreKcy1VLDJ/BIWuW6HH1xn
	nh/lWOAWzbhNpfDQ==
Date: Thu, 03 Sep 2026 09:41:17 +0200
Subject: [PATCH v2 02/15] auxvec.h: Move AT_VECTOR_SIZE definitions to
 linux/auxvec.h
MIME-Version: 1.0
Message-Id: <20260903-at-vector-size-arch-v2-2-5bc32a71e3d8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=1309;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HWrppGtlxN68+J1EvLurdbOmIVycSJ5y0ost40gYay0=;
 b=QtuUd8ndQfte3MxNSIPeA1ceK7WkBDpTjXLL5fb4pzWRDNSz/qxqD4exzasiSFQC/0O6qJggd
 TikOW26FC/0DEludcoZTMbhvBJm/noFxtE6Oqd7XYz5ZG5OybqRL4sw
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004132_807101_72F52BD5 
X-CRM114-Status: UNSURE (   8.47  )
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

VGhlIGF1eHZlYy5oIGhlYWRlciBpcyBhIG1vcmUgZml0dGluZyBwbGFjZSBmb3IgdGhlc2UgZGVm
aW5pdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNz
c2NodWhAbGludXRyb25peC5kZT4KUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwu
b3JnPgotLS0KIGluY2x1ZGUvbGludXgvYXV4dmVjLmggICB8IDcgKysrKysrKwogaW5jbHVkZS9s
aW51eC9tbV90eXBlcy5oIHwgNiAtLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYXV4dmVjLmgg
Yi9pbmNsdWRlL2xpbnV4L2F1eHZlYy5oCmluZGV4IDhiY2I5YjcyNjI2Mi4uNGIzNjRlNjM5ZjA4
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2F1eHZlYy5oCisrKyBiL2luY2x1ZGUvbGludXgv
YXV4dmVjLmgKQEAgLTYsNCArNiwxMSBAQAogCiAjZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0JBU0Ug
MjQgLyogTkVXX0FVWF9FTlQgZW50cmllcyBpbiBhdXhpbGlhcnkgdGFibGUgKi8KICAgLyogbnVt
YmVyIG9mICIjZGVmaW5lIEFUXy4qIiBhYm92ZSwgbWludXMge0FUX05VTEwsIEFUX0lHTk9SRSwg
QVRfTk9URUxGfSAqLworCisjaWZuZGVmIEFUX1ZFQ1RPUl9TSVpFX0FSQ0gKKyNkZWZpbmUgQVRf
VkVDVE9SX1NJWkVfQVJDSCAwCisjZW5kaWYKKworI2RlZmluZSBBVF9WRUNUT1JfU0laRSAoMioo
QVRfVkVDVE9SX1NJWkVfQVJDSCArIEFUX1ZFQ1RPUl9TSVpFX0JBU0UgKyAxKSkKKwogI2VuZGlm
IC8qIF9MSU5VWF9BVVhWRUNfSCAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbV90eXBl
cy5oIGIvaW5jbHVkZS9saW51eC9tbV90eXBlcy5oCmluZGV4IDZkODE1ZjY0NDBjOS4uMDhhMDZi
MjYzNzViIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21tX3R5cGVzLmgKKysrIGIvaW5jbHVk
ZS9saW51eC9tbV90eXBlcy5oCkBAIC0yNiwxMiArMjYsNiBAQAogCiAjaW5jbHVkZSA8YXNtL21t
dS5oPgogCi0jaWZuZGVmIEFUX1ZFQ1RPUl9TSVpFX0FSQ0gKLSNkZWZpbmUgQVRfVkVDVE9SX1NJ
WkVfQVJDSCAwCi0jZW5kaWYKLSNkZWZpbmUgQVRfVkVDVE9SX1NJWkUgKDIqKEFUX1ZFQ1RPUl9T
SVpFX0FSQ0ggKyBBVF9WRUNUT1JfU0laRV9CQVNFICsgMSkpCi0KLQogc3RydWN0IGFkZHJlc3Nf
c3BhY2U7CiBzdHJ1Y3QgZnV0ZXhfcHJpdmF0ZV9oYXNoOwogc3RydWN0IG1lbV9jZ3JvdXA7Cgot
LSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
