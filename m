Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66124EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=thPKt8X7XIApWLd0pT3996Z0stECsH0ztdc0i3Lzxro=; b=f0MsUhwdFhwbZ4
	XhnEtvkG8fVuRi04enjfHu/iTA6cX9k50BOxKmDlSFpqjW3EU7q3JPZt2R+HdtwPLGtpk/0PhYLFa
	dYKZKEAmaMwifJRrzzPOTgW1vcqHG4I0a3yoeroG8IZ3bJyXw9/J+7ip8EKLVvtRSLOM4qtGiOu7I
	z7Qj9r4wyM9xALY2wPAG2SJlvkEVy7CFnaciQ31tYsNF0GQXnmEXzzDv0R+p18TXWmsh+ZjAjRLSL
	+LtmT4udNYkEdHxmujD8rih6gsfOc/X0cc2ZqNJPRYtAKWZxKUe+SHmr/EA8wULDC0hQ+bD/3xs21
	kTivi15WyMCfrZj5I7DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDpXH-00Ah1O-07;
	Mon, 26 Jun 2023 16:57:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDpXE-00Ah0r-0l
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 16:57:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 702A360E93;
	Mon, 26 Jun 2023 16:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4411AC433C8;
	Mon, 26 Jun 2023 16:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687798670;
	bh=D7OOp/89DCaiYbQMxKU0tOSDhjvcdtKgZcq1oLiZYw8=;
	h=From:To:Cc:Subject:Date:From;
	b=mH7PKJVyDXTVMM0pvqVTZGZvdM1pTfAZhbM2tmvYqv21ZLuWCizd5/AqVqL2/EY6i
	 sFJYZoHET3zvjjKjCXV06M/ruxB21ID8bExYeIy75+ZTY2Frv30nCMAqU4wq8jTBzs
	 lfc49vv+jxFKL4s0cr9XO5JWA+PyLk9E9uurc6k5RZKuyt05qEq2SobHhk051/mB0q
	 q7gwjoJ2UXZc6A6RpUXHPJoZpj3oLfgFqy/tECf4oOrk4zIrRqpWKISigmCKlc8LmI
	 E2klUHvloTfAnOQHCbbUkdsjQP5yqf5gx0eGloy2PVLHQTjFc0sglpyFXTiaupH3Sj
	 GGPSInHOFd0MQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux@rivosinc.com,
	Palmer Dabbelt <palmer@rivosinc.com>,
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
	Darius Rad <darius@bluespec.com>,
	Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH v2] riscv: Discard vector state on syscalls
Date: Mon, 26 Jun 2023 18:57:36 +0200
Message-Id: <20230626165736.65927-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_095752_376829_0FA42F7D 
X-CRM114-Status: GOOD (  13.01  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIFJJU0MtViB2ZWN0
b3Igc3BlY2lmaWNhdGlvbiBzdGF0ZXM6CiAgRXhlY3V0aW5nIGEgc3lzdGVtIGNhbGwgY2F1c2Vz
IGFsbCBjYWxsZXItc2F2ZWQgdmVjdG9yIHJlZ2lzdGVycwogICh2MC12MzEsIHZsLCB2dHlwZSkg
YW5kIHZzdGFydCB0byBiZWNvbWUgdW5zcGVjaWZpZWQuCgpUaGUgdmVjdG9yIHJlZ2lzdGVycyBh
cmUgc2V0IHRvIGFsbCAxcywgdmlsbCBpcyBzZXQgKGludmFsaWQpLCBhbmQgdGhlCnZlY3RvciBz
dGF0dXMgaXMgc2V0IHRvIEluaXRpYWwuCgpUaGF0IHdheSB3ZSBjYW4gcHJldmVudCB1c2Vyc3Bh
Y2UgZnJvbSBhY2NpZGVudGFsbHkgcmVseWluZyBvbiB0aGUKc3RhdGVkIHNhdmUuCgpSw6ltaSBw
b2ludGVkIG91dCBbMV0gdGhhdCB3cml0aW5nIHRvIHRoZSByZWdpc3RlcnMgbWlnaHQgYmUKc3Vw
ZXJmbHVvdXMsIGFuZCBzZXR0aW5nIHZpbGwgaXMgc3VmZmljaWVudC4KCkxpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzEyNzg0MzI2LjlVUFBLM01BZUJAYmFzaWxlLnJl
bWxhYi5uZXQvICMgWzFdClN1Z2dlc3RlZC1ieTogRGFyaXVzIFJhZCA8ZGFyaXVzQGJsdWVzcGVj
LmNvbT4KU3VnZ2VzdGVkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4K
U3VnZ2VzdGVkLWJ5OiBSw6ltaSBEZW5pcy1Db3VybW9udCA8cmVtaUByZW1sYWIubmV0PgpTaWdu
ZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQp2MS0+djI6
CiAgUHJvcGVyIHJlZ2lzdGVyIHJlc3RvcmUgZm9yIGluaXRpYWwgc3RhdGUgKEFuZHkpCiAgU2V0
IHJlZ2lzdGVycyB0byAxcywgYW5kIG5vdCAwcyAoRGFyaXVzKQotLS0KIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdmVjdG9yLmggfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0K
IGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAgICAgfCAgMiArKwogMiBmaWxlcyBjaGFuZ2Vk
LCA0MSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdmVjdG9yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5o
CmluZGV4IDA0YzBiMDdiZjZjZC4uOTNkNzAyZDk5ODhjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9y
LmgKQEAgLTEzOSwxNCArMTM5LDQ5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl92X3ZzdGF0
ZV9zYXZlKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywKIAl9CiB9CiAKK3N0YXRpYyBpbmxpbmUg
dm9pZCBfX3Jpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQodm9pZCkKK3sKKwl1bnNpZ25lZCBsb25nIHZs
LCB2dHlwZV9pbnZhbCA9IDFVTCA8PCAoQklUU19QRVJfTE9ORyAtIDEpOworCisJcmlzY3Zfdl9l
bmFibGUoKTsKKwlhc20gdm9sYXRpbGUgKAorCQkiLm9wdGlvbiBwdXNoXG5cdCIKKwkJIi5vcHRp
b24gYXJjaCwgK3Zcblx0IgorCQkidnNldHZsaQklMCwgeDAsIGU4LCBtOCwgdGEsIG1hXG5cdCIK
KwkJInZtdi52LmkJdjAsIC0xXG5cdCIKKwkJInZtdi52LmkJdjgsIC0xXG5cdCIKKwkJInZtdi52
LmkJdjE2LCAtMVxuXHQiCisJCSJ2bXYudi5pCXYyNCwgLTFcblx0IgorCQkidnNldHZsCQklMCwg
eDAsICUxXG5cdCIKKwkJIi5vcHRpb24gcG9wXG5cdCIKKwkJOiAiPSZyIiAodmwpIDogInIiICh2
dHlwZV9pbnZhbCkgOiAibWVtb3J5Iik7CisJcmlzY3Zfdl9kaXNhYmxlKCk7Cit9CisKK3N0YXRp
YyBpbmxpbmUgdm9pZCByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHN0cnVjdCBwdF9yZWdzICpyZWdz
KQoreworCWlmICghcmlzY3Zfdl92c3RhdGVfcXVlcnkocmVncykpCisJCXJldHVybjsKKworCV9f
cmlzY3Zfdl92c3RhdGVfZGlzY2FyZCgpOworCXJpc2N2X3ZfdnN0YXRlX29uKHJlZ3MpOworfQor
CiBzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3Zfdl92c3RhdGVfcmVzdG9yZShzdHJ1Y3QgdGFza19z
dHJ1Y3QgKnRhc2ssCiAJCQkJCSAgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7Ci0JaWYgKChyZWdz
LT5zdGF0dXMgJiBTUl9WUykgIT0gU1JfVlNfT0ZGKSB7Ci0JCXN0cnVjdCBfX3Jpc2N2X3ZfZXh0
X3N0YXRlICp2c3RhdGUgPSAmdGFzay0+dGhyZWFkLnZzdGF0ZTsKLQorCXN0cnVjdCBfX3Jpc2N2
X3ZfZXh0X3N0YXRlICp2c3RhdGUgPSAmdGFzay0+dGhyZWFkLnZzdGF0ZTsKKwl1bnNpZ25lZCBs
b25nIHN0YXR1cyA9IHJlZ3MtPnN0YXR1cyAmIFNSX1ZTOworCisJc3dpdGNoIChzdGF0dXMpIHsK
KwljYXNlIFNSX1ZTX0lOSVRJQUw6CisJCV9fcmlzY3Zfdl92c3RhdGVfZGlzY2FyZCgpOworCQli
cmVhazsKKwljYXNlIFNSX1ZTX0NMRUFOOgorCWNhc2UgU1JfVlNfRElSVFk6CiAJCV9fcmlzY3Zf
dl92c3RhdGVfcmVzdG9yZSh2c3RhdGUsIHZzdGF0ZS0+ZGF0YXApOwogCQlfX3Jpc2N2X3ZfdnN0
YXRlX2NsZWFuKHJlZ3MpOworCQlicmVhazsKIAl9CiB9CiAKQEAgLTE3OCw2ICsyMTMsNyBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgcmlzY3Zfdl92c3RhdGVfY3RybF91c2VyX2FsbG93ZWQodm9pZCkg
eyByZXR1cm4gZmFsc2U7IH0KICNkZWZpbmUgX19zd2l0Y2hfdG9fdmVjdG9yKF9fcHJldiwgX19u
ZXh0KQlkbyB7fSB3aGlsZSAoMCkKICNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfb2ZmKHJlZ3MpCQlk
byB7fSB3aGlsZSAoMCkKICNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfb24ocmVncykJCQlkbyB7fSB3
aGlsZSAoMCkKKyNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfZGlzY2FyZChyZWdzKQkJZG8ge30gd2hp
bGUgKDApCiAKICNlbmRpZiAvKiBDT05GSUdfUklTQ1ZfSVNBX1YgKi8KIApkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKaW5k
ZXggNTE1ODk2MWVhOTc3Li41ZmY2M2E3ODRhNmQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3RyYXBzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwpAQCAtMjk2LDYgKzI5
Niw4IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9l
Y2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCQlyZWdzLT5lcGMgKz0gNDsKIAkJcmVncy0+
b3JpZ19hMCA9IHJlZ3MtPmEwOwogCisJCXJpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQocmVncyk7CisK
IAkJc3lzY2FsbCA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncywgc3lzY2FsbCk7
CiAKIAkJaWYgKHN5c2NhbGwgPCBOUl9zeXNjYWxscykKCmJhc2UtY29tbWl0OiA0ODg4MzNjY2Rj
YWMxMThkYTE2NzAxZjRlZTA2NzNiMjBiYTQ3ZmUzCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
