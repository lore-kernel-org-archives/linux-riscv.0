Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6CB606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mjSPh8sw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2z10FrIE;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=UGWZ7T+q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O43GrB2qjcAuWTsD8esJXzyGnVt9tt3r4fAKNfhkFBY=; b=mjSPh8swXOXnf6XLieokGP8xkM
	RuOjEr55/M0rZL/gn6KO+9dq9I177X6zVjZJVflQVxUkRV9heKlmJDhnzIbZBUVKeY+4/RyE5WgFL
	jHWsJzrU39seJCucjseGmSATN8ChFtBs6PaqaxSkiN7XGAbfHk1jYxvphQ5PO20cA0+xfzi/aAnAX
	GeBvJG0Sj45yVwkkHKn2w/jcwJNvvEQVfVHL4A0PRWT1ALQ1SssJJ0vhGHuHwZqaJe6Ex1TfcUfMB
	3g//5VF+hHfQqpJs4SdOgy8Hrd4kEHSG1+O2L2/BQRK9OubyNvdz7atMaaE1CkyRC13jT09x0Lmpm
	8PaqS7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQVA-00000002kU2-03cG;
	Mon, 23 Nov 2026 09:38:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUR-00000002jpo-1WFW;
	Mon, 23 Nov 2026 09:37:36 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIWLxGK1Vij7tiU90cRxSFqpScY7zQR7QJvEseKLzwo=;
	b=2z10FrIENPAZxNBu/4FgnLVDlG3M7eRID7PzxUiXKydy/rln1DK0lZio8yE3noqkjRh9oT
	e/b+tC4rq+6YEoAcrjJ3cO7WlEfdLeLM1li0q/Tu0ADcA+or6b8Go/sgxFoq3u5Jml76nL
	wEJatTYHV8KEwJ04HLx5bycTT8ZyBzDv/EG6zYCj2bUXUfvkPNDwJxK6iLrH1+oKwxdDm0
	M6du5ER5mMXwAVZIpKmMPCoHzkl1ZHZHlS6RXzVJrU/FNTiYSQ/havtLOL4i6YJNQIQTNc
	2tz4Vmrf1kO+R+LB3ZbFcXy/yLpQ6jr/eCHfaUARFPi2Tkk0Cg45knkrepuvNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIWLxGK1Vij7tiU90cRxSFqpScY7zQR7QJvEseKLzwo=;
	b=UGWZ7T+qthHBHDZwO2ZfnZZ4wdrxxNgHz6eoMYh19mIUB2kturgEFENUaaOBWGQCMbjlCJ
	6yQtRb64pG3v47Aw==
Date: Mon, 23 Nov 2026 10:37:12 +0100
Subject: [PATCH v3 07/15] RISC-V: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-at-vector-size-arch-v3-7-d342dae9e843@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
In-Reply-To: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Andy Chiu <andybnac@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1592;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=d8drZZysn7iP84IJ7qJbdevEVmAtmC8DVsiKbIAXolk=;
 b=aNwL1kWJlo01PaCvebxGDmG5xP0glqFTyi1RyyWhaa+P/3M+1844nqqBisvg5ICRxsxQjd2Xb
 /DJ1mQEVkTCBkqSfISfQLtBeGU1DOULq9hjkJBkJp0rUsvPlCTIH+I2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013735_575159_B067220F 
X-CRM114-Status: GOOD (  12.37  )
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
b25peC5kZT4KQWNrZWQtYnk6IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPiAjIGFyY2gv
cmlzY3YKUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8YW5keWJuYWNAZ21haWwuY29tPgpSZXZpZXdl
ZC1ieTogS2VlcyBDb29rIDxrZWVzQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9hdXh2ZWMuaCAgICAgIHwgMTMgKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2F1eHZlYy5oIHwgIDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2F1eHZlYy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hdXh2ZWMuaApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjA5NjBiYzA3Y2NkMAotLS0gL2Rldi9udWxsCisr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXV4dmVjLmgKQEAgLTAsMCArMSwxMyBAQAorLyog
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLworLyoKKyAqIENvcHlyaWdo
dCAoQykgMjAxMiBBUk0gTHRkLgorICogQ29weXJpZ2h0IChDKSAyMDE1IFJlZ2VudHMgb2YgdGhl
IFVuaXZlcnNpdHkgb2YgQ2FsaWZvcm5pYQorICovCisKKyNpZm5kZWYgX0FTTV9SSVNDVl9BVVhW
RUNfSAorI2RlZmluZSBfQVNNX1JJU0NWX0FVWFZFQ19ICisKKy8qIGVudHJpZXMgaW4gQVJDSF9E
TElORk8gKi8KKyNkZWZpbmUgQVRfVkVDVE9SX1NJWkVfQVJDSAkxMAorCisjZW5kaWYgLyogX0FT
TV9SSVNDVl9BVVhWRUNfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2F1eHZlYy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCmluZGV4
IDk1MDUwZWJlOWFkMC4uMGE3MjVmMmFhMmU3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvdWFwaS9hc20vYXV4dmVjLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2F1
eHZlYy5oCkBAIC0zMyw4ICszMyw2IEBACiAjZGVmaW5lIEFUX0wzX0NBQ0hFU0laRQkJNDYKICNk
ZWZpbmUgQVRfTDNfQ0FDSEVHRU9NRVRSWQk0NwogCi0vKiBlbnRyaWVzIGluIEFSQ0hfRExJTkZP
ICovCi0jZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0gJMTAKICNkZWZpbmUgQVRfTUlOU0lHU1RL
U1oJCTUxCiAKICNlbmRpZiAvKiBfVUFQSV9BU01fUklTQ1ZfQVVYVkVDX0ggKi8KCi0tIAoyLjU2
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
