Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAD7C624DE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gPAgfzwUOjU2gcr8BEhMHZ1wXqZW9zb920vBjKEzX8k=; b=33s+S6MykN0JGd
	66RefwQWdjnwyy744fSiw9GdMdAJO2tT5yLdsB7Q7UTYK10VZ4ArxAX6k59kXuT0c6YorN6nKDbSs
	1xa6M8z52Cm88Pn3rmHJwihIIrw6bSoLBW3ZIAGsfP/ffCOweSf/yknL/50A5IemqZyBw1LfUIqTb
	Jp1z2WNqaKYSJtwJ430cqZ9rHpGg1/SSxiw66ccd1JgFul9pRhyU1yr3EYr+CEIC8h94Lg1fL+xfn
	8nne4Fu1MAqRwjSurvgTsrxjCnG6TGhGjdrJHth0uLQNiKz68XnnlgmZozOY4D9kO2o5kng++bSKA
	MCMfxngFPmUqFyNh4x6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224m-0000000Gclf-1vGm;
	Thu, 03 Sep 2026 07:41:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224i-0000000Gchx-2WO1;
	Thu, 03 Sep 2026 07:41:34 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5KW4JSiXbH9maSfkULvZaqX7CoVimn1QeXod/ruf3No=;
	b=sP4GAzlfiwyJ8SlAiXB9hhGatHqYn5Vcn3KyodxJkAO1wj/PHMlbdW77kFZude743RnLhd
	B5QZwXUkCLLV6Wvnob5GUovY1H43zZVNWtGF5UOAyDtw0h84ySpzYI64iVVJEIHvicRsJY
	pD1ld4DRhtbdgnX9NNClO75WOFLSWKxzBq3iHywNs/5YkMjYPN/hkHQCvUYgFe8rIWuTxq
	ufYRd2Yn9ZInjWVURzxboS8uymqnHI7MPJc3Ye+zTbYZ7DuMs5zMOjmE9Qpb0t7EMovaQc
	99zQAQl51CjfPmTlBPFogtZ+kwL7ycovS8bv8r+JCiyjj17qoIK0POFSFj9veQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5KW4JSiXbH9maSfkULvZaqX7CoVimn1QeXod/ruf3No=;
	b=74b6hxEuHiaYbO16J3R8hRN+sLyi/sfMIBBYDtJQpn5U/qxoOZMHYwATNk199oaBFFJwuk
	Q6njN3w1wiL/mPDw==
Subject: [PATCH v2 00/15] exec: Remove AT_VECTOR_SIZE_ARCH from UAPI
Date: Thu, 03 Sep 2026 09:41:15 +0200
Message-Id: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7ZhpSQi48h6GRSlTmcQU05YGJ
 dzdiluX7yfv/Q0iB+EIl2qDwFmizL6APlVgJ+PvjDIWBk26IUUdmoSZbZoDRnkzmmAnbJic5s6
 5dmigmM/ATtajeusLTxKL8DpOsvquv15N+m8vKyQ0SjmqB6Otaa8P8UsKs5f1PDL0+75/AAd6e
 Um6AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=3129;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3s3XptoE1X5UpOSAIz59e0R0lZLIvWXcerejp7RbE+E=;
 b=XVy2EwXriKXi49fdKmjGDzcDgmWqDqa4Nz8coc0Bonz8f2R5uqRepUP5lWAxCUStMn+bsNf9+
 GanZj2c8Z3BAevBQ7Rcfu7kM1Xymj/tUjcr033fxv07isChfPk+ufoG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004132_800612_3CFC7358 
X-CRM114-Status: UNSURE (   8.22  )
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

VGhlcmUgaXMgbm90aGluZyB1c2Vyc3BhY2UgY2FuIGRvIHdpdGggdGhpcyB2YWx1ZS4gSW4gdGhl
IGtlcm5lbCBpcwphbHdheXMgY29tYmluZWQgd2l0aCBBVF9WRUNUT1JfU0laRV9CQVNFLCB3aGlj
aCBpcyBub3QgZXhwb3NlZCB0bwp1c2Vyc3BhY2UgYW5kIGFsc28gY2hhbmdlcyBmcm9tIHRpbWUg
dG8gdGltZS4KCk1vdmUgdGhlIHN5bWJvbCB0byBrZXJuZWwtaW50ZXJuYWwgaGVhZGVycy4KCk1l
YW50IHRvIGJlIGFwcGxpZWQgdGhyb3VnaCB0aGUgYXNtLWdlbmVyaWMgb3IgZXhlY3ZlIHRyZWUu
ClRoZSBkZWZhdWx0IHJlY2lwaWVudCBsaXN0IHdhcyBodWdlLiBJIHRyaW1tZWQgaXQgdG8gb25s
eSB0aGUKYXJjaGl0ZWN0dXJlIGxpc3RzLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2No
dWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQpDaGFuZ2VzIGluIHYyOgot
IFJlYmFzZSBvbiB2Ny4zLXJjMS4KLSBQaWNrIHVwIHRhZ3MuCi0gTGluayB0byB2MTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDMwMi1hdC12ZWN0b3Itc2l6ZS1hcmNoLXYxLTAtYTEx
ZjAzYmEyY2E4QGxpbnV0cm9uaXguZGUKCi0tLQpUaG9tYXMgV2Vpw59zY2h1aCAoMTUpOgogICAg
ICBNQUlOVEFJTkVSUzogZXhlYzogQWRkIG1vcmUgYXV4dmVjLmggdmFyaWFudHMKICAgICAgYXV4
dmVjLmg6IE1vdmUgQVRfVkVDVE9SX1NJWkUgZGVmaW5pdGlvbnMgdG8gbGludXgvYXV4dmVjLmgK
ICAgICAgYXNtLWdlbmVyaWM6IGFkZCBhbiBpbi1rZXJuZWwgYXV4dmVjLmggaGVhZGVyCiAgICAg
IEFSTTogZHJvcCBjdXN0b20gYXNtL2F1eHZlYy5oCiAgICAgIHg4NjogUmVtb3ZlIEFUX1ZFQ1RP
Ul9TSVpFX0FSQ0ggZnJvbSBVQVBJCiAgICAgIGFybTY0OiBSZW1vdmUgQVRfVkVDVE9SX1NJWkVf
QVJDSCBmcm9tIFVBUEkKICAgICAgUklTQy1WOiBSZW1vdmUgQVRfVkVDVE9SX1NJWkVfQVJDSCBm
cm9tIFVBUEkKICAgICAgTG9vbmdBcmNoOiBSZW1vdmUgQVRfVkVDVE9SX1NJWkVfQVJDSCBmcm9t
IFVBUEkKICAgICAgczM5MDogUmVtb3ZlIEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggZnJvbSBVQVBJCiAg
ICAgIHBvd2VycGM6IFJlbW92ZSBBVF9WRUNUT1JfU0laRV9BUkNIIGZyb20gVUFQSQogICAgICBN
SVBTOiBSZW1vdmUgQVRfVkVDVE9SX1NJWkVfQVJDSCBmcm9tIFVBUEkKICAgICAgc3BhcmM6IFJl
bW92ZSBBVF9WRUNUT1JfU0laRV9BUkNIIGZyb20gVUFQSQogICAgICBzaDogUmVtb3ZlIEFUX1ZF
Q1RPUl9TSVpFX0FSQ0ggZnJvbSBVQVBJCiAgICAgIGFscGhhOiByZW1vdmUgQVRfVkVDVE9SX1NJ
WkVfQVJDSCBmcm9tIFVBUEkKICAgICAgYXV4dmVjLmg6IERyb3AgZmFsbGJhY2sgQVRfVkVDVE9S
X1NJWkVfQVJDSAoKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NSArKysrKwogYXJjaC9hbHBoYS9pbmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgICAgICB8ICA3ICsr
KysrKysKIGFyY2gvYWxwaGEvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCAgICAgfCAgOCArKyst
LS0tLQogYXJjaC9hcm0vaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICAgICAgICB8ICAxIC0KIGFy
Y2gvYXJtNjQvaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICAgICAgfCAgNyArKysrKysrCiBhcmNo
L2FybTY0L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggICAgIHwgIDYgKystLS0tCiBhcmNoL2xv
b25nYXJjaC9pbmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgIHwgMTQgKysrKysrKysrKysrKysKIGFy
Y2gvbG9vbmdhcmNoL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggfCAgOCArKystLS0tLQogYXJj
aC9taXBzL2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysr
KysrCiBhcmNoL21pcHMvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCAgICAgIHwgIDggKysrLS0t
LS0KIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgICAgfCAgNyArKysrKysr
CiBhcmNoL3Bvd2VycGMvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCAgIHwgIDYgKystLS0tCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2F1eHZlYy5oICAgICAgICAgIHwgMTMgKysrKysrKysrKysr
KwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oICAgICB8ICAyIC0tCiBhcmNo
L3MzOTAvaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICAgICAgIHwgIDcgKysrKysrKwogYXJjaC9z
MzkwL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggICAgICB8ICA2ICsrLS0tLQogYXJjaC9zaC9p
bmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgICAgICAgICB8ICA3ICsrKysrKysKIGFyY2gvc2gvaW5j
bHVkZS91YXBpL2FzbS9hdXh2ZWMuaCAgICAgICAgfCAgOCArKystLS0tLQogYXJjaC9zcGFyYy9p
bmNsdWRlL2FzbS9hdXh2ZWMuaCAgICAgICAgICB8ICA2ICsrKysrKwogYXJjaC9zcGFyYy9pbmNs
dWRlL3VhcGkvYXNtL2F1eHZlYy5oICAgICB8ICA4ICsrKy0tLS0tCiBhcmNoL3g4Ni9pbmNsdWRl
L2FzbS9hdXh2ZWMuaCAgICAgICAgICAgIHwgMTIgKysrKysrKysrKysrCiBhcmNoL3g4Ni9pbmNs
dWRlL3VhcGkvYXNtL2F1eHZlYy5oICAgICAgIHwgMTMgKysrLS0tLS0tLS0tLQogaW5jbHVkZS9h
c20tZ2VuZXJpYy9LYnVpbGQgICAgICAgICAgICAgICB8ICAxICsKIGluY2x1ZGUvYXNtLWdlbmVy
aWMvYXV4dmVjLmggICAgICAgICAgICAgfCAgNyArKysrKysrCiBpbmNsdWRlL2xpbnV4L2F1eHZl
Yy5oICAgICAgICAgICAgICAgICAgIHwgIDUgKysrKysKIGluY2x1ZGUvbGludXgvbW1fdHlwZXMu
aCAgICAgICAgICAgICAgICAgfCAgNiAtLS0tLS0KIDI2IGZpbGVzIGNoYW5nZWQsIDEzOSBpbnNl
cnRpb25zKCspLCA1NiBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiAyNjk4OTYxNTk5MTk1
OTkwMTE3YTBmYTI0MDExOGVjZjJmOGU3NDUzCmNoYW5nZS1pZDogMjAyNjAxMDktYXQtdmVjdG9y
LXNpemUtYXJjaC02ZTBmMmU5ZmY4YjYKCkJlc3QgcmVnYXJkcywKLS0gIApUaG9tYXMgV2Vpw59z
Y2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
