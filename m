Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E538C624A4
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElINy2JHviPO+ebMO2NlkF+uR0RgfDIbfZw8MWzzDQE=; b=2b6b/JgW4tVuep
	fjLGXkgdldyR9V+Ap5/tlSgV2ODUuBdXLpM+MGF28/FAbfTovJf0IDqZcKenmKXQPqrO/3aiVjMZ2
	n0Bze64EDSTbkTVb4cfSggVSaHbH/QO3ZptBsuZGnvjhVytP/9uGPAG1V7GbuVMphZsjuswQYfgXj
	6sJlkfTXzKQTJBwkHK4hRJehBbL51Cm0S74Xtfr+mPe00Eu/aA2LMN8GBgtmJ7DlH/X6/R1uAkH+0
	kL6DvI/eGU4PPTOtZLU/gLU7YYQB3f3X+xYY1ANUP1XEHDZzoFz+6XSINkoWEMy4ddUFLIThuZODr
	/hfzMTqxScmiQj16teeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2253-0000000GdFS-0vzh;
	Thu, 03 Sep 2026 07:41:53 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224o-0000000Gcmh-1cxq;
	Thu, 03 Sep 2026 07:41:42 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hrAnP/C3vIIV9MfVxkKNdnam3FAI0o97+nAzFrr7A6o=;
	b=A7uMxPFGSNRKyM+CJ+qi+nH0EVA+MdWp35wphWaEq2E8+0fRn9MbLOB3YpV2ixqEZxN/yY
	o3xT6U8duMUicllU/fFzqeNAcXNYjnmbWLuP9Ch69tr76jl5AlQe3N6DjUD5g9hRhZ57WZ
	olbXOlRtqjhM3eDLMpgailyhTg1ViVGBqUv/W2UKgy4MqAlW6aRfOEnyEMEaTbcMfyg3v3
	AzKBzF8fw0Tus/oHpwhzkco2BlB0yaOGb/fhK0uWDRdoSDCtKLzR4FiKRwpXRiUZBZAdVK
	n+fwbsrReekXVse4Vgc+2+OQC9qpYeuhvgKdvyN3IcmTz6oKlgewhGS31B7Vvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hrAnP/C3vIIV9MfVxkKNdnam3FAI0o97+nAzFrr7A6o=;
	b=4+LXrGA1BNsb+1bt9PPBXeYwlB5OKLjrbTPg3/JyXLOelfRU9JW6w01qpy84FUq6+qD8x1
	o8BYkU71G9JpY9Bg==
Date: Thu, 03 Sep 2026 09:41:27 +0200
Subject: [PATCH v2 12/15] sparc: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260903-at-vector-size-arch-v2-12-5bc32a71e3d8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=1455;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=BmY0rNeTgoOTIM8NoOSOBKd7iOT2/BoW3MMuJmEOpcY=;
 b=k8LJMytIpq8a92cFKJDRyQD9G2gB9e4yHENKcxQqZFuxwyQL3K6Na9Pxjb+tfuD8ycnpiW86k
 er0SGyhyT3cByQa0pEx46UyDAAhL+iId74x9DTkTy68/ftCipnFboFb
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004138_644836_25D0CDE5 
X-CRM114-Status: GOOD (  11.23  )
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
Y2gvc3BhcmMvaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICB8IDYgKysrKysrCiBhcmNoL3NwYXJj
L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggfCA4ICsrKy0tLS0tCiAyIGZpbGVzIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3NwYXJj
L2luY2x1ZGUvYXNtL2F1eHZlYy5oIGIvYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9hdXh2ZWMuaApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjUwYzI0OWE4YmQxNwotLS0g
L2Rldi9udWxsCisrKyBiL2FyY2gvc3BhcmMvaW5jbHVkZS9hc20vYXV4dmVjLmgKQEAgLTAsMCAr
MSw2IEBACisjaWZuZGVmIF9fQVNNU1BBUkNfQVVYVkVDX0gKKyNkZWZpbmUgX19BU01TUEFSQ19B
VVhWRUNfSAorCisjZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0gJNAorCisjZW5kaWYgLyogIShf
X0FTTVNQQVJDX0FVWFZFQ19IKSAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9zcGFyYy9pbmNsdWRlL3Vh
cGkvYXNtL2F1eHZlYy5oIGIvYXJjaC9zcGFyYy9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCmlu
ZGV4IGFiODc4MGZiOWRmMS4uMGZhYjNiMjkxNDhhIDEwMDY0NAotLS0gYS9hcmNoL3NwYXJjL2lu
Y2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKKysrIGIvYXJjaC9zcGFyYy9pbmNsdWRlL3VhcGkvYXNt
L2F1eHZlYy5oCkBAIC0xLDUgKzEsNSBAQAotI2lmbmRlZiBfX0FTTVNQQVJDX0FVWFZFQ19ICi0j
ZGVmaW5lIF9fQVNNU1BBUkNfQVVYVkVDX0gKKyNpZm5kZWYgX19VQVBJX0FTTVNQQVJDX0FVWFZF
Q19ICisjZGVmaW5lIF9fVUFQSV9BU01TUEFSQ19BVVhWRUNfSAogCiAjZGVmaW5lIEFUX1NZU0lO
Rk9fRUhEUgkJMzMKIApAQCAtMTAsNiArMTAsNCBAQAogI2RlZmluZSBBVF9BRElfTkJJVFMJNDkK
ICNkZWZpbmUgQVRfQURJX1VFT05BREkJNTAKIAotI2RlZmluZSBBVF9WRUNUT1JfU0laRV9BUkNI
CTQKLQotI2VuZGlmIC8qICEoX19BU01TUEFSQ19BVVhWRUNfSCkgKi8KKyNlbmRpZiAvKiAhKF9f
VUFQSV9BU01TUEFSQ19BVVhWRUNfSCkgKi8KCi0tIAoyLjU1LjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
