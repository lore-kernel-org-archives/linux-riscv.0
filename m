Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F6BC43327
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 07:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIqzAJ2haYqzVJOtRzWTyESmB7I8eukWedJRCUFK7vI=; b=Ek8EJ9bHt2Uveo
	/S/GzSQmSomiqIAKk1QhpHFFKnG6NkCnAABBq2gRBV6LGZ9LJxEMGgj4GY/AiyOKKVRGl1e5eSDKp
	8LSSMEvPZpqALJ2oOy+46U+f/qOyZBpnCcVoyRuIzxABxT7pG41UjKrekvfNQxtlNdwURfoM95HUt
	AH4+iZ/yxj57BVKtR7WIozYYjl2VUJZt7wqBvJ3WrDbTGHxGbLxo0zkgv6J6Qt8qsawMF/Yy+XcXJ
	UdL80ZLXNL6mOxS20UOvr0xdB9zXnfuu15MxKlf1o3+cIQDA5BLNPhwFnse5xHLOxRMbYu79wTJwp
	bAopfNGJUy4aipFqZf2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT6J-0000000G8QV-1Pi8;
	Tue, 30 Jun 2026 07:41:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT6G-0000000G8PC-1zEH
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 07:41:45 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782805302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CA7430nihIiOJ89U7+FTTfocCB8FEszFxuf/XzbW+mw=;
	b=tuJg/fL2rytBV7G8PyPhAB8SzDYe79jRfze/Vdj//Y33UkJRijw1rMR90STl/Hk7R+ER5w
	4bkpGu9dUMggtpYXWSSXeqhyADJPYFMJEuhUGRoL5fBUOU9jX2C7niKsZDcA+6LHEjufKK
	2690gGwiQpA4ENVduB7WQpa1SG5j8LLjUAN0oVU21JQhZRXvtXcjzE69z9eFClN2KixkJh
	X1lM06D3buRrwzEO43+kBFeoasnOBQ3CTqaxb0IbpM6tLN/7sfS716Y0EdoAKhhoyn6gJF
	9li37I9dfoJdZ702W5uS5nJCjEl5rmpem8p0mNHPqBBg8pdow4WmNBsVw/uSEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782805302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CA7430nihIiOJ89U7+FTTfocCB8FEszFxuf/XzbW+mw=;
	b=ks2+50qjewerfJNb5U/svByt/4nRc75CfCj9AZqiUEc579gG1QoDI+RzepbJ/6R2AE38ki
	kvAET9VmBIJVMhAg==
Date: Tue, 30 Jun 2026 09:41:40 +0200
Subject: [PATCH 1/3] riscv: vdso: Add symbols for the alternative section
 boundaries
MIME-Version: 1.0
Message-Id: <20260630-riscv-vdso32-alternative-v1-1-a32fd89b7b1c@linutronix.de>
References: <20260630-riscv-vdso32-alternative-v1-0-a32fd89b7b1c@linutronix.de>
In-Reply-To: <20260630-riscv-vdso32-alternative-v1-0-a32fd89b7b1c@linutronix.de>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782805300; l=1852;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=UrtXHHXegZBlN2ZTkwIWaiV0JpQepus4sdp/LSuNy9g=;
 b=/Depye4BXvsR1EkUlw+Dg6gJH6l9vUH4svOpz2ENz/Z82GLFBke1X6JSc24RvRgJ/Nav7NuZu
 RzDP6HLkAjAAYRs7NF7n2tnE51xrdHFl8Gdc9GXveEWEqKUL1JNEJIe
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_004144_679727_62A907EF 
X-CRM114-Status: UNSURE (   6.82  )
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

Q3VycmVudGx5IHRoZSBhbHRlcm5hdGl2ZSBzZWN0aW9ucyBhcmUgZXh0cmFjdGVkIGZyb20gdGhl
IHZEU08KYmluYXJpZXMgYXQgcnVudGltZS4gVGhpcyBoYXMgcnVudGltZSBvdmVyaGVhZCBhbmQg
YWxzbyBkb2Vzbid0CndvcmsgZm9yIHRoZSBjb21wYXQgdkRTTy4KCkV4dHJhY3QgdGhlIG9mZnNl
dHMgb2YgdGhlIGFsdGVybmF0aXZlIHNlY3Rpb24gZHVyaW5nIHRoZSBidWlsZCB3aXRoIHRoZQpl
eGlzdGluZyBzeW1ib2wgZXh0cmFjdGlvbiBtYWNoaW5lcnkuCgpBbHNvIGFkZCBkdW1teSBzeW1i
b2xzIGFzIGZhbGxiYWNrLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21h
cy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92
ZHNvLmggICAgIHwgNiArKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vdmRzby5sZHMuUyB8
IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28u
aAppbmRleCBmNzk5OGQ5YWQ5YjIuLjAyNTliYmM5OGU5MyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS92ZHNvLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvLmgK
QEAgLTE5LDEwICsxOSwxNCBAQAogCiAjaWZkZWYgQ09ORklHX01NVQogI2luY2x1ZGUgPGdlbmVy
YXRlZC92ZHNvLW9mZnNldHMuaD4KKyNlbHNlCitleHRlcm4gc2l6ZV90IF9fdmRzb19hbHRlcm5h
dGl2ZXNfc3RhcnRfb2Zmc2V0LCBfX3Zkc29fYWx0ZXJuYXRpdmVzX2VuZF9vZmZzZXQ7CiAjZW5k
aWYKIAogI2lmZGVmIENPTkZJR19SSVNDVl9VU0VSX0NGSQogI2luY2x1ZGUgPGdlbmVyYXRlZC92
ZHNvLWNmaS1vZmZzZXRzLmg+CisjZWxzZQorZXh0ZXJuIHNpemVfdCBfX3Zkc29fYWx0ZXJuYXRp
dmVzX3N0YXJ0X2NmaV9vZmZzZXQsIF9fdmRzb19hbHRlcm5hdGl2ZXNfZW5kX2NmaV9vZmZzZXQ7
CiAjZW5kaWYKIAogI2lmZGVmIENPTkZJR19SSVNDVl9VU0VSX0NGSQpAQCAtNDEsNiArNDUsOCBA
QAogI2RlZmluZSBDT01QQVRfVkRTT19TWU1CT0woYmFzZSwgbmFtZSkJCQkJCQlcCiAJKHZvaWQg
X191c2VyICopKCh1bnNpZ25lZCBsb25nKShiYXNlKSArIGNvbXBhdF9fdmRzb18jI25hbWUjI19v
ZmZzZXQpCiAKKyNlbHNlCitleHRlcm4gc2l6ZV90IGNvbXBhdF9fdmRzb19hbHRlcm5hdGl2ZXNf
c3RhcnRfb2Zmc2V0LCBjb21wYXRfX3Zkc29fYWx0ZXJuYXRpdmVzX2VuZF9vZmZzZXQ7CiAjZW5k
aWYgLyogQ09ORklHX0NPTVBBVCAqLwogCiBleHRlcm4gY2hhciB2ZHNvX3N0YXJ0W10sIHZkc29f
ZW5kW107CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3Zkc28ubGRzLlMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3Zkc28ubGRzLlMKaW5kZXggOWFjZmE5ZWY1YmFiLi4wY2M0
YjY0ZGY5OTQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vdmRzby5sZHMuUwor
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3Zkc28ubGRzLlMKQEAgLTQ1LDkgKzQ1LDExIEBA
IFNFQ1RJT05TCiAJLnRleHQJCTogeyAqKC50ZXh0IC50ZXh0LiopIH0JCTp0ZXh0CiAKIAkuID0g
QUxJR04oNCk7CisJX192ZHNvX2FsdGVybmF0aXZlc19zdGFydCA9IC47CiAJLmFsdGVybmF0aXZl
IDogewogCQkqKC5hbHRlcm5hdGl2ZSkKIAl9CisJX192ZHNvX2FsdGVybmF0aXZlc19lbmQgPSAu
OwogfQogCiAvKgoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
