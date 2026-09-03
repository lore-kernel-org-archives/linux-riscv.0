Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F83C624DE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvR60Z9UwwUj70SY+246Zxg4gx7XJGSciEBX0MME03Y=; b=2E4sn4FkSSKIQA
	RV7o8f4vxVrdfKkO/tdLH4VIZRalHbLTkwSdXExGlyXYPG+3QzEogsvMqCi99GBuauqbEW3RPQqvN
	mO2CRYXud+YVzVcaKEG2XQvo2VZSCu6lKweMstVPLSursKp7rX+6bo0fgDYfWM/InK3JC7Ug8eWZF
	9ZrHgreY4bxYUA8MEzfjGKu6C68vza5qnruqyal7s34uNoNJ5qnzigsABVx8ypxVaK06PXZsKYvxL
	WFkyTwFs6wl5mLgbdMapeJPIod5y4hk53gTWOetHq9zVZDy/syCXv+J+mG0Oi1wq1I/HGK09zmeWJ
	aYfR7jB0f/HUC6DgKYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2252-0000000GdE1-3CyD;
	Thu, 03 Sep 2026 07:41:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224n-0000000Gckq-293V;
	Thu, 03 Sep 2026 07:41:40 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUcarKasoX0h99dw6M4/xD5hiQ/p+f+NjembhaSjUVQ=;
	b=APQB2vuQicLW7Zb8jMJr8A8PXWF7rS0zkF9Ri7xRZz0NsPEweiKDr7QnuZXaZEvkpJG+4v
	K4RMcVqqimnh0TCJyD8QgGasKT3klSt0i/t9LuY/5GXUbyPDPWKT/4dWU6jcyXMNbq3QSY
	tWglOGTMDhufCZNh4xqwF/KN9UqbmPUZn3x3MB/GHS1WhgREN9lSNUhpFZvq9Y8R7n4jrc
	RzUDRhuuzFI6IhveVU/KEl+OXPL1RML61ZFBzasXiEbV82Qy8nBURU/YjV1AwndNfUiRnF
	pVVKkQaJsMt+N+OB0YtlNGJkvmD9mgWghcpmB4U+XKodetrCpm8ZE1xKF4sWgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUcarKasoX0h99dw6M4/xD5hiQ/p+f+NjembhaSjUVQ=;
	b=kMqEoxbn4idATtgPsStZnSGqmHcSXU6olXd8YPdu0q+KeHi8EXRyVYj+Mj6ubqC9aAtVS4
	PHj2p3DSjWMbZIBw==
Date: Thu, 03 Sep 2026 09:41:24 +0200
Subject: [PATCH v2 09/15] s390: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260903-at-vector-size-arch-v2-9-5bc32a71e3d8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=1450;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=SvAg75HBK8bLtuaKgOOLDr10ibDxxL9SdBfOzzfNWls=;
 b=3RT19pLNWlOURXZVikzalNwkQhefjiPlou99ySXRRsmtxX0e69Nl8D5OGCHH4DyrLWTIuCnAG
 MABfP++jZRoDuSWe0OPaLheUiQwuWtT2e9LUHAy/E3h86Qgzctp8htY
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004137_695657_BAFF2BEA 
X-CRM114-Status: GOOD (  10.47  )
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
QVJDSF9ETElORk8gKi8KLQogI2VuZGlmCgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
