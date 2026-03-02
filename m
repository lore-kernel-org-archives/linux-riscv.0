Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75D4E9B372
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4tNKQWwbGVMtYA9OtXvBk/rhUICQweWs7q6wCBrOFE=; b=VX0+lO19Tz0H9X
	r/1VDYq6tGxVnjB9PN/uPk+lgAYqSi9i7FNl6JABxorO3Yb4bqyxmP41CK6mvONUrDdzZnI7nGIOW
	P0fH99LuToktbudIsf1k3Mrt87tAvXoA4oiaXjeW/maYPP+SLi3NZvGYRKR5JHD0SPNmzVw4ePvNj
	Ld1Cm8Gq3IKx9j4OEQj7ylMa8WLZogKkSoCdejLLpOG5/AvnL0Q+v6L7mMDr8FoeKEDW3x7ufjcIf
	iAGmQUuT90Q6vZZEfYRr7TbreNmYhCrfUaHyNZSJ98FwF0xiQz5NDKjOCX+VIKI6yC7SiQYSvvDFp
	4brwfWM3n6tkCLcFsRlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Lg-0000000CwLv-42ZL;
	Mon, 02 Mar 2026 12:26:09 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LR-0000000CvtH-1c0o;
	Mon, 02 Mar 2026 12:25:55 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IIl7i97gp0WaH6kynmrYy0424iWZ8UY7WAcAVJym5Rw=;
	b=DRPBoJTSt1Cn72FxGrkICtx6iDm9aDHjx/AiP76zWoLsyxyzrn4ftQM8rjPsBPR2yghAxc
	iR03PQOiOtY65dbfApwClyN8khUvycPTz5RPDD0zS6rfyoHl/BLatzcQVmp558W1UrU0/V
	DFLjDsmsvIVFvnRmUwCirnFDQgXPo+umbV9RIGje8FXGAYZUx+Oi9PCoWGSVr6fjD4npDk
	X0e31PVB5vjJFxtV/JxaclK2glIQQnIbrbYGPZVHGwtbyhuWE04K6kgZN5ywBmzdxx54K9
	oRG0MM6oeTqAEIOftIbOHX4Ql1V8Gitv0Z0kUSKeQRgIsWMIjbEf/G/ltVyCjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IIl7i97gp0WaH6kynmrYy0424iWZ8UY7WAcAVJym5Rw=;
	b=l3N5HQGw9RkKQ8pgKQOl0uOf0kedifyuf/MGCLSijjuMiUCiOQTt4T2v93KxTFefrGNyku
	1oJIKuXH2FuNXNBQ==
Date: Mon, 02 Mar 2026 13:25:36 +0100
Subject: [PATCH 12/15] sparc: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Message-Id: <20260302-at-vector-size-arch-v1-12-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1413;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Iwaju8vXi9F4QFXCQeLchkBfrV3+4S1lN9ALuspGOMM=;
 b=qYE0Cjq7x88NCS4YgSX8MOndLBO3D8QhHWThM4b0UUGFInc+vhxv4cTOMQS/J6/diZo2W/4vM
 jvG23iECxNuCS96zpughHWKWr8+8K3S6bWHHCGi1ZI/2c1sH/jMD9lc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042553_706231_475FF9E4 
X-CRM114-Status: GOOD (  10.86  )
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
b25peC5kZT4KLS0tCiBhcmNoL3NwYXJjL2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgfCA2ICsr
KysrKwogYXJjaC9zcGFyYy9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oIHwgOCArKystLS0tLQog
MiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9hdXh2ZWMuaCBiL2FyY2gvc3BhcmMvaW5jbHVk
ZS9hc20vYXV4dmVjLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi41
MGMyNDlhOGJkMTcKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL3NwYXJjL2luY2x1ZGUvYXNtL2F1
eHZlYy5oCkBAIC0wLDAgKzEsNiBAQAorI2lmbmRlZiBfX0FTTVNQQVJDX0FVWFZFQ19ICisjZGVm
aW5lIF9fQVNNU1BBUkNfQVVYVkVDX0gKKworI2RlZmluZSBBVF9WRUNUT1JfU0laRV9BUkNICTQK
KworI2VuZGlmIC8qICEoX19BU01TUEFSQ19BVVhWRUNfSCkgKi8KZGlmZiAtLWdpdCBhL2FyY2gv
c3BhcmMvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCBiL2FyY2gvc3BhcmMvaW5jbHVkZS91YXBp
L2FzbS9hdXh2ZWMuaAppbmRleCBhYjg3ODBmYjlkZjEuLjBmYWIzYjI5MTQ4YSAxMDA2NDQKLS0t
IGEvYXJjaC9zcGFyYy9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCisrKyBiL2FyY2gvc3BhcmMv
aW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaApAQCAtMSw1ICsxLDUgQEAKLSNpZm5kZWYgX19BU01T
UEFSQ19BVVhWRUNfSAotI2RlZmluZSBfX0FTTVNQQVJDX0FVWFZFQ19ICisjaWZuZGVmIF9fVUFQ
SV9BU01TUEFSQ19BVVhWRUNfSAorI2RlZmluZSBfX1VBUElfQVNNU1BBUkNfQVVYVkVDX0gKIAog
I2RlZmluZSBBVF9TWVNJTkZPX0VIRFIJCTMzCiAKQEAgLTEwLDYgKzEwLDQgQEAKICNkZWZpbmUg
QVRfQURJX05CSVRTCTQ5CiAjZGVmaW5lIEFUX0FESV9VRU9OQURJCTUwCiAKLSNkZWZpbmUgQVRf
VkVDVE9SX1NJWkVfQVJDSAk0Ci0KLSNlbmRpZiAvKiAhKF9fQVNNU1BBUkNfQVVYVkVDX0gpICov
CisjZW5kaWYgLyogIShfX1VBUElfQVNNU1BBUkNfQVVYVkVDX0gpICovCgotLSAKMi41My4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
