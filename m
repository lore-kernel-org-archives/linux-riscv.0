Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF0C606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vw5KSy8a;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TyvVEjET;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=UeyrNx36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MdKDrQDBSxphUT6/+gWY7AxnAkUquOwAxyHEXFmZXNA=; b=Vw5KSy8abK2l6rAbH6Aa2ywJs6
	EfmwZ/ZUOYgCuJMx0W6YwX9UnKc0sLlVO2G2pnnwWPQ4wy5u8aq8+E3Shyz8SdC7Wc79s2xD2rmtr
	zy6295dI4asetkoKPcIqhws2xftz4ozmbqbBhQDV3wphmoewyogf9koM5xgavMET6qJM1+M6Jk2oX
	gn8kMGzhzn5JRZux+dh9j5p2kguXSdFdn7ZD9G5mTzT6fq+jJQ0zeRS7o8W0vIiRkZYHCiYxt7g2Q
	jGsrYoFpwEvpK+IDfAwQZW7wxi6XsEnIQWOgf9kcwu2YKm1vdwyIaVU6MEaT/j3YcjD3xZe9uwDub
	ScENruCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQWZ-00000002m9A-1pj0;
	Mon, 23 Nov 2026 09:39:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUT-00000002jsF-2e36;
	Mon, 23 Nov 2026 09:37:41 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dp9YyKBWCSEjb6xrb6VMG09P6jqIzXjTgw7J5S2fTA4=;
	b=TyvVEjET6MQnliSzrqpnj+WkaFtU1zdWalGJrq4lM+AG+q+GryJ6uLyXM3uuKuMjPwI8Q7
	hXW9l92VNUnHMqFEWfhzIP/+ank7W2QypcCihnx37IfZQBhZP3LFb7GNb+YNj3CHfGSbs5
	ZhZR+iPlg/bcytywj2VDrgqzMWW1DBlh2cJuaI/J0WVIFHmyAwJi5zM/82k6QefOlFt1dz
	tg0ik+MAZFWoUZhTqe87bhvHbNeg3maMBV/cDtE0aW/fZiImJGJWeAXysA5to544DrSSxJ
	G84S2kJq5OpbCqnzmKWFT3UfGcp35UD7EOdsH8gcGg1UZbcf7aAajTe5p6hbsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dp9YyKBWCSEjb6xrb6VMG09P6jqIzXjTgw7J5S2fTA4=;
	b=UeyrNx36ELx+2TKAHU7bC/JsVRcYrQLbDiG5FMpmWcJSPNqa84GS7ohHzM60dWu8RXOreK
	Iht1lJnEMVjGIzAg==
Date: Mon, 23 Nov 2026 10:37:18 +0100
Subject: [PATCH v3 13/15] sh: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-at-vector-size-arch-v3-13-d342dae9e843@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
In-Reply-To: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1608;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ztfIXLUSH0CwIJyGBvoNgGeeiOG70QOYQ4pFqwwxIFQ=;
 b=LKBQXJ0mP2V6uYDx8P6XIyIzFshAJA1+7kRDjBNYWfzYxsdonu5uj4s7DWGYZrkTi/6jZXHLX
 /DLzlefFrAKCVL70qHWqHj3o6sDBv0xorI5veF399VQjaRzOqml8CsX
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013737_910823_5204FE7F 
X-CRM114-Status: GOOD (  11.36  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Q19IICovCgotLSAKMi41Ni4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
