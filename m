Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D64606A31F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o57OxQ+A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=i0WDMFuA;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7mhh8fkl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y0vB3lsiXKlJh1B7wJNlLQ62Ck2HzZ2rkQykHMS0qAg=; b=o57OxQ+AWu/j1EKkESPYTxgflg
	oxbf0doVFHHWUNMA9AgbkQ7IggN7V5rSMVyF9f3kZpO4x7cUjLk43mKERh2TFacfvdbhLMcDiJNxR
	Gpsrg4qnjVTRu21KNOIkzXGQ6kIRLY/sHqj4rszTnxzyimbn+fFmyOkSOcmJ7HB74x1LRsI9SEIY+
	s+OeuurRCTCyOjuU7f1j3MA8G4DQYL4e3i5enTB/KBE2rlTDiYOnIXFdfIZntf7l+O4tE9wXV6eJX
	LnNlulYiG5vbYPT6httZd5voi3AYZMG7x+7SVoy2gt2C7yfgu83QnbPflJONQ/pXWAmqzdV/KwaND
	jjpiD24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQVJ-00000002kbw-1TA9;
	Mon, 23 Nov 2026 09:38:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUR-00000002jpn-1XrT;
	Mon, 23 Nov 2026 09:37:37 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6O8o4jPy1JR2PVJ3l/7YMV8E/5cyWIFMpsjiqqNdK9Q=;
	b=i0WDMFuAdZ2j2rOtxrd1oZv/FkA8Zp0c0dAMiqHcxV9AQMvw9zWWBpAXxB01tlEHVKbl1c
	xx5XliI8ACdB9yBxdxLxGu7qzryOwbaFbW+i+rSoV3DxerMmyEaAO4cU1vDSWYAIXnfHvO
	21Sr6Q4wVLZzwo1Ob4tWM6RdWOFnjfDFcFmHBXgHfCeNVASJ6MpDdRqQ2Wb+MOX+6Ic/Zp
	oPsmXQYL9M79ldoIbg7c+oq/fVFbvWgqyoLx3myysEdv0KsG5lTMtACMg3B5SbicTWQUbG
	l5Zo+jNl6b7uMJwahvcGFmmIsImP3IPO3YVAJTn+TuAcogVLzylegCP7rhZmlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6O8o4jPy1JR2PVJ3l/7YMV8E/5cyWIFMpsjiqqNdK9Q=;
	b=7mhh8fklHnCbzFB7I+Q0iexBgbzBVixkvY0GBhA1YVDTjzBQjroLWJYnoRr5gGZ2or0Rlj
	Kd3zBjtkngEuJxCQ==
Date: Mon, 23 Nov 2026 10:37:13 +0100
Subject: [PATCH v3 08/15] LoongArch: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-at-vector-size-arch-v3-8-d342dae9e843@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1767;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vBs3VQQa67rpUmE2rrBLqD26Zpyg2BNszpmqddnCDow=;
 b=cLRElbxW7EhCUz/xMdMTbFBzL6Lski3xa/GSrklt0Zpdw5U2z1v/lmUutRs/DZrC5RtEPdqXP
 iJPTytwMCD0A+UQ2BgjEc7a7FwJHbB1gtR61Pfli6wtUhfwog+Lxafo
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013735_571427_65296736 
X-CRM114-Status: GOOD (  11.88  )
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
Y2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgfCAxNCArKysrKysrKysrKysr
KwogYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCB8ICA4ICsrKy0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vYXV4dmVjLmggYi9hcmNoL2xvb25n
YXJjaC9pbmNsdWRlL2FzbS9hdXh2ZWMuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwMDAuLjM3ZGQ3MTdhM2EyMgotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvbG9vbmdhcmNo
L2luY2x1ZGUvYXNtL2F1eHZlYy5oCkBAIC0wLDAgKzEsMTQgQEAKKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wKyAqLworLyoKKyAqIEF1dGhvcjogSGFubHUgTGkgPGxpaGFubHVA
bG9vbmdzb24uY24+CisgKiAgICAgICAgIEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGxvb25nc29u
LmNuPgorICoKKyAqIENvcHlyaWdodCAoQykgMjAyMC0yMDIyIExvb25nc29uIFRlY2hub2xvZ3kg
Q29ycG9yYXRpb24gTGltaXRlZAorICovCisKKyNpZm5kZWYgX19BU01fQVVYVkVDX0gKKyNkZWZp
bmUgX19BU01fQVVYVkVDX0gKKworI2RlZmluZSBBVF9WRUNUT1JfU0laRV9BUkNIIDEgLyogZW50
cmllcyBpbiBBUkNIX0RMSU5GTyAqLworCisjZW5kaWYgLyogX19BU01fQVVYVkVDX0ggKi8KZGlm
ZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggYi9hcmNo
L2xvb25nYXJjaC9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCmluZGV4IDkyMmQ5ZTZiNTA1OC4u
Nzk2OTFjNDIyYzdlIDEwMDY0NAotLS0gYS9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL3VhcGkvYXNt
L2F1eHZlYy5oCisrKyBiL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgK
QEAgLTYsMTIgKzYsMTAgQEAKICAqIENvcHlyaWdodCAoQykgMjAyMC0yMDIyIExvb25nc29uIFRl
Y2hub2xvZ3kgQ29ycG9yYXRpb24gTGltaXRlZAogICovCiAKLSNpZm5kZWYgX19BU01fQVVYVkVD
X0gKLSNkZWZpbmUgX19BU01fQVVYVkVDX0gKKyNpZm5kZWYgX19VQVBJX0FTTV9BVVhWRUNfSAor
I2RlZmluZSBfX1VBUElfQVNNX0FVWFZFQ19ICiAKIC8qIExvY2F0aW9uIG9mIFZEU08gaW1hZ2Uu
ICovCiAjZGVmaW5lIEFUX1NZU0lORk9fRUhEUgkJMzMKIAotI2RlZmluZSBBVF9WRUNUT1JfU0la
RV9BUkNIIDEgLyogZW50cmllcyBpbiBBUkNIX0RMSU5GTyAqLwotCi0jZW5kaWYgLyogX19BU01f
QVVYVkVDX0ggKi8KKyNlbmRpZiAvKiBfX1VBUElfQVNNX0FVWFZFQ19IICovCgotLSAKMi41Ni4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
