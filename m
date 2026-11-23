Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC9A606A6AE
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gM9yj+vz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=eVR3Ru4Y;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fb+iCiKk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=44kNfBm2SiDCxZeYJD3ujxMVLXICRW+Zu/LB3e6eXt4=; b=gM9yj+vzWzBtmq/EmnjNn+/s13
	TA51I+x/KTV1u4l+apjpiWc3Ni8hwhXDO/6XTlttOuV42O+o6UiDuvQ+wUS77ce5Su3PizkKTYzYv
	GCTtAefMZElPvPLJxGsnTUvCZQnl7h+/yw5eMj8SQ8FF7h8Ifhdp3R/w8Xg2MbPg0QiW5fc4MP1ta
	McVBBhMeITNTpOEpdCuDhEmU5H2h+SzDn64HhoutUBguJrJynQQzMJBCvOWDIJTNTiADEo9YEoKM8
	8kWwd+Axz9GqWR2OmWR0XAVHXcmIA/ed2VEemNuSpD+FTBMxpT5DqeHZtih/mGdpzYeff23SRPaCH
	BDo02+fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUR-00000002jqc-0r5P;
	Mon, 23 Nov 2026 09:37:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUL-00000002jnU-4434;
	Mon, 23 Nov 2026 09:37:33 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=12rCIot4Q1y046Vzp8EdeFdJZwXEj1gxqogCrSz0YUU=;
	b=eVR3Ru4YMLUxoE2oBeLnHegybGHZ1wA0UbD4tiFIxf5sSlq+p3wJdzZpk1ObDTCcQrza1z
	sy98hHXx+8xzinXaJ18cQFrVUiJIc/UcxxCx104dR5eQpHKjKHCYzESkf81Gf3OdfKYFU/
	eii4VqnD+bVQRxDevExQLyGum7btdJKvvpx3Yr5ardHDzDIHP6aGihnfy+77XqVSz6ZQgt
	47xh6w/Vwimk/bHTNf5kdhLgywTu1BYGw396QHdIBvHSpQXvrSULdDcD2Khd3VZ6kMCHkn
	cKpXfzLviy+wczOkqv+t1GeRU7hURAtZmDFbfCzTh8szA5wnR/Jki6meRytmbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=12rCIot4Q1y046Vzp8EdeFdJZwXEj1gxqogCrSz0YUU=;
	b=fb+iCiKkolSfl3maExBNRcPmG1YtwmtD8FIgojBmtd/T7xWBvxDvLsmVcOv8h0gdh8FVpL
	vvdYhx+u/oAeYgDg==
Subject: [PATCH v3 00/15] exec: Remove AT_VECTOR_SIZE_ARCH from UAPI
Date: Mon, 23 Nov 2026 10:37:05 +0100
Message-Id: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NQQ6CMBCF4auQrq2ZTiOCK+9hXJQylUlMMS02K
 OHuFly4kOU/yftmEpECUxSnYhKBEkfufQ69K4TtjL+R5Da3QMASFNTSDDKRHfogI79JmmA7WRI
 4pNq5qilFXj4COR5X9XLN3XHMg9f6JKnl+vU04KaXlARplHKgG4PWVOc7++cQes/jviWxmAl/T
 g1628HsHBqr0RwV6fbPmef5A6qlb4UCAQAA
X-Change-ID: 20260109-at-vector-size-arch-6e0f2e9ff8b6
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
 Magnus Lindholm <linmag7@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=3299;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=0K3qhqEWg64tqQPsXMhmXxkKgiRN0V2EEQPpHTYxv4A=;
 b=Fe8nQiRi3Kfc2ylHmmPvMPRVTTjkYlaqoKTjn4kvNkLesW4z62H7gN1D51+mJJRRBnWysks5K
 2YBQSucEVjaDRaSt/FqXQnlQcInw1lzhzM2T6nWBTe45/TAM3F1ehFZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013730_158531_E6354909 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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
dG8gdGltZS4KCk1vdmUgdGhlIHN5bWJvbCB0byBrZXJuZWwtaW50ZXJuYWwgaGVhZGVycy4KCk1l
YW50IHRvIGJlIGFwcGxpZWQgdGhyb3VnaCB0aGUgYXNtLWdlbmVyaWMgb3IgZXhlY3ZlIHRyZWUu
ClRoZSBkZWZhdWx0IHJlY2lwaWVudCBsaXN0IHdhcyBodWdlLiBJIHRyaW1tZWQgaXQgdG8gb25s
eSB0aGUKYXJjaGl0ZWN0dXJlIGxpc3RzLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2No
dWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQpDaGFuZ2VzIGluIHYzOgot
IFJlYmFzZSBvbiB2Ny4zLXJjMS4KLSBGaXggc29tZSBpbmNsdWRlIGd1YXJkcy4KLSBMaW5rIHRv
IHYyOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA5MDMtYXQtdmVjdG9yLXNpemUtYXJj
aC12Mi0wLTViYzMyYTcxZTNkOEBsaW51dHJvbml4LmRlCgpDaGFuZ2VzIGluIHYyOgotIFJlYmFz
ZSBvbiB2Ny4zLXJjMS4KLSBQaWNrIHVwIHRhZ3MuCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDI2MDMwMi1hdC12ZWN0b3Itc2l6ZS1hcmNoLXYxLTAtYTExZjAzYmEy
Y2E4QGxpbnV0cm9uaXguZGUKCi0tLQpUaG9tYXMgV2Vpw59zY2h1aCAoMTUpOgogICAgICBNQUlO
VEFJTkVSUzogZXhlYzogQWRkIG1vcmUgYXV4dmVjLmggdmFyaWFudHMKICAgICAgYXV4dmVjLmg6
IE1vdmUgQVRfVkVDVE9SX1NJWkUgZGVmaW5pdGlvbnMgdG8gbGludXgvYXV4dmVjLmgKICAgICAg
YXNtLWdlbmVyaWM6IGFkZCBhbiBpbi1rZXJuZWwgYXV4dmVjLmggaGVhZGVyCiAgICAgIEFSTTog
ZHJvcCBjdXN0b20gYXNtL2F1eHZlYy5oCiAgICAgIHg4NjogUmVtb3ZlIEFUX1ZFQ1RPUl9TSVpF
X0FSQ0ggZnJvbSBVQVBJCiAgICAgIGFybTY0OiBSZW1vdmUgQVRfVkVDVE9SX1NJWkVfQVJDSCBm
cm9tIFVBUEkKICAgICAgUklTQy1WOiBSZW1vdmUgQVRfVkVDVE9SX1NJWkVfQVJDSCBmcm9tIFVB
UEkKICAgICAgTG9vbmdBcmNoOiBSZW1vdmUgQVRfVkVDVE9SX1NJWkVfQVJDSCBmcm9tIFVBUEkK
ICAgICAgczM5MDogUmVtb3ZlIEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggZnJvbSBVQVBJCiAgICAgIHBv
d2VycGM6IFJlbW92ZSBBVF9WRUNUT1JfU0laRV9BUkNIIGZyb20gVUFQSQogICAgICBNSVBTOiBS
ZW1vdmUgQVRfVkVDVE9SX1NJWkVfQVJDSCBmcm9tIFVBUEkKICAgICAgc3BhcmM6IFJlbW92ZSBB
VF9WRUNUT1JfU0laRV9BUkNIIGZyb20gVUFQSQogICAgICBzaDogUmVtb3ZlIEFUX1ZFQ1RPUl9T
SVpFX0FSQ0ggZnJvbSBVQVBJCiAgICAgIGFscGhhOiByZW1vdmUgQVRfVkVDVE9SX1NJWkVfQVJD
SCBmcm9tIFVBUEkKICAgICAgYXV4dmVjLmg6IERyb3AgZmFsbGJhY2sgQVRfVkVDVE9SX1NJWkVf
QVJDSAoKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKysr
KwogYXJjaC9hbHBoYS9pbmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgICAgICB8ICA3ICsrKysrKysK
IGFyY2gvYWxwaGEvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCAgICAgfCAgOCArKystLS0tLQog
YXJjaC9hcm0vaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICAgICAgICB8ICAxIC0KIGFyY2gvYXJt
NjQvaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICAgICAgfCAgNyArKysrKysrCiBhcmNoL2FybTY0
L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggICAgIHwgIDYgKystLS0tCiBhcmNoL2xvb25nYXJj
aC9pbmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgIHwgMTQgKysrKysrKysrKysrKysKIGFyY2gvbG9v
bmdhcmNoL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggfCAgOCArKystLS0tLQogYXJjaC9taXBz
L2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysrCiBh
cmNoL21pcHMvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCAgICAgIHwgIDggKysrLS0tLS0KIGFy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgICAgfCAgNyArKysrKysrCiBhcmNo
L3Bvd2VycGMvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCAgIHwgIDYgKystLS0tCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgICAgIHwgMTMgKysrKysrKysrKysrKwogYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oICAgICB8ICAyIC0tCiBhcmNoL3MzOTAv
aW5jbHVkZS9hc20vYXV4dmVjLmggICAgICAgICAgIHwgIDcgKysrKysrKwogYXJjaC9zMzkwL2lu
Y2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggICAgICB8ICA2ICsrLS0tLQogYXJjaC9zaC9pbmNsdWRl
L2FzbS9hdXh2ZWMuaCAgICAgICAgICAgICB8ICA3ICsrKysrKysKIGFyY2gvc2gvaW5jbHVkZS91
YXBpL2FzbS9hdXh2ZWMuaCAgICAgICAgfCAgOCArKystLS0tLQogYXJjaC9zcGFyYy9pbmNsdWRl
L2FzbS9hdXh2ZWMuaCAgICAgICAgICB8ICA2ICsrKysrKwogYXJjaC9zcGFyYy9pbmNsdWRlL3Vh
cGkvYXNtL2F1eHZlYy5oICAgICB8ICA4ICsrKy0tLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9h
dXh2ZWMuaCAgICAgICAgICAgIHwgMTIgKysrKysrKysrKysrCiBhcmNoL3g4Ni9pbmNsdWRlL3Vh
cGkvYXNtL2F1eHZlYy5oICAgICAgIHwgMTMgKysrLS0tLS0tLS0tLQogaW5jbHVkZS9hc20tZ2Vu
ZXJpYy9LYnVpbGQgICAgICAgICAgICAgICB8ICAxICsKIGluY2x1ZGUvYXNtLWdlbmVyaWMvYXV4
dmVjLmggICAgICAgICAgICAgfCAgNyArKysrKysrCiBpbmNsdWRlL2xpbnV4L2F1eHZlYy5oICAg
ICAgICAgICAgICAgICAgIHwgIDUgKysrKysKIGluY2x1ZGUvbGludXgvbW1fdHlwZXMuaCAgICAg
ICAgICAgICAgICAgfCAgNiAtLS0tLS0KIDI2IGZpbGVzIGNoYW5nZWQsIDEzOSBpbnNlcnRpb25z
KCspLCA1NiBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiBhNmI0YmE3YWNjMjNhYzBmYjY4
MDQ0OTk4MTk4MmYzMDhlYTc1MDM2CmNoYW5nZS1pZDogMjAyNjAxMDktYXQtdmVjdG9yLXNpemUt
YXJjaC02ZTBmMmU5ZmY4YjYKCkJlc3QgcmVnYXJkcywKLS0gIApUaG9tYXMgV2Vpw59zY2h1aCA8
dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
