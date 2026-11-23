Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A3D606A31F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gj9Q/V17;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TR8XczD/;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hoHVYH9x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CrxEJrjMOGPyqPmsalRibdFXtqdCwQ6XU0Lxy3AEGBA=; b=Gj9Q/V17ZuJ/7pFLoMNtY/ufL2
	jwZevxXyc5QxkxrAANrx8lQ0srZpLEvy4Pg6R48gGxI0gX8emkoHTOfax0muC3BUKEzRh8wpLm/bE
	ECuDwQf0MdoLRnPCyPIg0EG3nx1Oo04Gw7ZHlMi3B7vaQlonDKyXG/k1nIL9gaaXBaNO/vA4TUdsQ
	iShiee4L+CIOJOmY2EhZspcBs6W4Zm8SPNjBKtHDOLoryGooUJv5Q6apB9TF8Q/VqTAbLwXB2Mg6X
	fRQqhFveH3ewNORV60ahPwcIU7haUMTV6zhNkEeOhdz46SN3DUkNOdyXBVHpb4n5vTA0pj4iCNm3+
	L1F7ISPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQVb-00000002kzt-3eiU;
	Mon, 23 Nov 2026 09:38:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUR-00000002jqH-3ima;
	Mon, 23 Nov 2026 09:37:39 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OzqRCnJR602SPiJtJXTG2PDcd45+A0tgb/oYXFQovLs=;
	b=TR8XczD//6I1MR5e9lJz+GijeGBKJ/F77cjTzH8vVoII07f/tMCwr/xGjF4TQGtgulC1EP
	vACmE5JKgFiiOYT5KMeM2ILfQDDi13RwanO37c9TmxxeyyWSa0jXluHBhTGxRKR0Yl64Oo
	7CYJEReknofWyo9+snoBGSVkCzXAajtax1AaQ/4R5wOyeTS+P0v42R8b4YqyL/j18nRyhy
	mAwleNFjqSK+iTvML/y9rFNzZ0CRLbBTDuzjqKG2uRk179PYD2MCsPQ1UIFgLV23Hjv6Nc
	mYzD6KuLCKi+7tfSemTLaki6pb72ly81l56+DTIHo3Ug7lZ9pzlij7cZQsJJsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OzqRCnJR602SPiJtJXTG2PDcd45+A0tgb/oYXFQovLs=;
	b=hoHVYH9xKLXuXyJAz+H1gDzElbvGfdJZ93NePphkmUT76//hgCh1ZCl3cIDoWvCVOzkPxm
	cENh6xJYPcEMYdBw==
Date: Mon, 23 Nov 2026 10:37:14 +0100
Subject: [PATCH v3 09/15] s390: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-at-vector-size-arch-v3-9-d342dae9e843@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1450;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XHafUQ8AvHq+zUf/VxtJZdze1xMjqQNOG6NhH665A6A=;
 b=oxMrqHfHeIxNkNvUbLxa7kn1LyC91rAIVfldoDncMK3YDOPceCuvoLmcVldlsZq98SdN6iXBt
 Y22qC0QCyKzCx4lysgpfyA2b5U5DJjnjaaEah8tYPviOHRifBjjXfLp
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013736_061917_3FD5575A 
X-CRM114-Status: GOOD (  10.16  )
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
Y2gvczM5MC9pbmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgIHwgNyArKysrKysrCiBhcmNoL3MzOTAv
aW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCB8IDYgKystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3MzOTAvaW5j
bHVkZS9hc20vYXV4dmVjLmggYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vYXV4dmVjLmgKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5iZWFhZWZlMTJhODQKLS0tIC9kZXYv
bnVsbAorKysgYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vYXV4dmVjLmgKQEAgLTAsMCArMSw3IEBA
CisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBXSVRIIExpbnV4LXN5c2NhbGwt
bm90ZSAqLworI2lmbmRlZiBfX0FTTVMzOTBfQVVYVkVDX0gKKyNkZWZpbmUgX19BU01TMzkwX0FV
WFZFQ19ICisKKyNkZWZpbmUgQVRfVkVDVE9SX1NJWkVfQVJDSCAxIC8qIGVudHJpZXMgaW4gQVJD
SF9ETElORk8gKi8KKworI2VuZGlmCmRpZmYgLS1naXQgYS9hcmNoL3MzOTAvaW5jbHVkZS91YXBp
L2FzbS9hdXh2ZWMuaCBiL2FyY2gvczM5MC9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCmluZGV4
IGEwNTZjNDYzN2ZmYy4uNTRiYmZkNjhkNzA5IDEwMDY0NAotLS0gYS9hcmNoL3MzOTAvaW5jbHVk
ZS91YXBpL2FzbS9hdXh2ZWMuaAorKysgYi9hcmNoL3MzOTAvaW5jbHVkZS91YXBpL2FzbS9hdXh2
ZWMuaApAQCAtMSw5ICsxLDcgQEAKIC8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
IFdJVEggTGludXgtc3lzY2FsbC1ub3RlICovCi0jaWZuZGVmIF9fQVNNUzM5MF9BVVhWRUNfSAot
I2RlZmluZSBfX0FTTVMzOTBfQVVYVkVDX0gKKyNpZm5kZWYgX19BU01TMzkwX1VBUElfQVVYVkVD
X0gKKyNkZWZpbmUgX19BU01TMzkwX1VBUElfQVVYVkVDX0gKIAogI2RlZmluZSBBVF9TWVNJTkZP
X0VIRFIJCTMzCiAKLSNkZWZpbmUgQVRfVkVDVE9SX1NJWkVfQVJDSCAxIC8qIGVudHJpZXMgaW4g
QVJDSF9ETElORk8gKi8KLQogI2VuZGlmCgotLSAKMi41Ni4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
