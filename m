Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B20CC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:48:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C549F6120F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C549F6120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZrgSiqVbY+8DmXup/pmy6lB9cXZkL7f+3mLFn8OZto=; b=ioLiy9mYdw8ifq
	tqHQzie58+/7rp+US7z3kLGbO0CxpuYw0nRqlfQ/04UHf8m0g0LC6fvRbfhxp8EdSobtXL9gXGaVu
	h6H5TFNzJ6IbNv/0xG6/Ymf20squURmC0ULsvhFkxlMaCNtZVFH5TzoYMMZbmubfXBX/iXgbJBa6w
	jwVK932V8JZ39vIvLOVJcNUSxHoEr7UB72PmZx3uxjEyeMc6056lJQNT3V0PtC4HoYuBfYSPHsC2p
	extUi1HKR2fw7sI16NXvr4uZGBvKdZwNPXejwhK8XB6bWrQtgKOCGTgubw+LgAA9FkYgCZ566hpET
	0LXDibH4SnMD2/mQQrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn0hP-002Bje-1r; Tue, 16 Nov 2021 15:48:43 +0000
Received: from smtp1.tecnico.ulisboa.pt ([193.136.128.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn0hI-002Bei-2S
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 15:48:39 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 436536005C44;
 Tue, 16 Nov 2021 15:48:17 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id lLg7PTaJWVeX; Tue, 16 Nov 2021 15:48:14 +0000 (WET)
Received: from mail2.tecnico.ulisboa.pt (mail2.ist.utl.pt [193.136.128.12])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id AD3E76005C32;
 Tue, 16 Nov 2021 15:48:14 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1637077694;
 bh=L0uH4y+eLrotmKlSZwpxLB8DIS1Pj8tO75awDvkaK4s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=S9moGslAUYiv7OvNr3jAy/3nvOSy9OrZh8Ij1eRibolhvUpGhztrxDhZzlB1W0SyE
 7LIsWzK+GzTAWQNQS/cpvxqHiMDPkg1Fjjf6l+IhYliBSJ4/nJ1WpZksYbk8CacygG
 xL41YSmfQ313KzLpXn4kzk2CXZelOvqXqH3zBaMs=
Received: from joaomariovmubuntu.Home (unknown
 [IPv6:2001:8a0:fa2d:4500:215:5dff:fe40:101])
 (Authenticated sender: ist181713)
 by mail2.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 7F89056007E;
 Tue, 16 Nov 2021 15:48:14 +0000 (WET)
From: =?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?=
 <joao.mario@tecnico.ulisboa.pt>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: atish.patra@wdc.com, anup.patel@wdc.com, linux-riscv@lists.infradead.org,
 nikita.shubin@maquefel.me, joao.mario@tecnico.ulisboa.pt
Subject: [PATCH v2 2/4] RISC-V: Support CPUID for risc-v in perf
Date: Tue, 16 Nov 2021 15:48:10 +0000
Message-Id: <20211116154812.17008-3-joao.mario@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211116154812.17008-1-joao.mario@tecnico.ulisboa.pt>
References: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
 <20211116154812.17008-1-joao.mario@tecnico.ulisboa.pt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_074836_475942_575708A8 
X-CRM114-Status: GOOD (  17.23  )
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

VGhpcyBwYXRjaCBjcmVhdGVzIHRoZSBoZWFkZXIuYyBmaWxlIGZvciB0aGUgcmlzYy12IGFyY2hp
dGVjdHVyZSBhbmQgaW50cm9kdWNlcyBzdXBwb3J0IGZvcgpQTVUgaWRlbnRpZmljYXRpb24gdGhy
b3VnaCBzeXNmcy4KSXQgaXMgbm93IHBvc3NpYmxlIHRvIGNvbmZpZ3VyZSBwbXUtZXZlbnRzIGlu
IHJpc2Mtdi4KCkRlcGVuZHMgb24gcGF0Y2ggWzFdLCB0aGF0IGludHJvZHVjZXMgdGhlIGlkIHN5
c2ZzIGZpbGUuCgpTaWduZWQtb2ZmLWJ5OiBKb8OjbyBNw6FyaW8gRG9taW5nb3MgPGpvYW8ubWFy
aW9AdGVjbmljby51bGlzYm9hLnB0PgotLS0KIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXUuYyAgICAg
ICAgICAgIHwgMTggKysrKysrKysKIHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL0J1aWxkICAg
IHwgIDEgKwogdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvaGVhZGVyLmMgfCA2NiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA4NSBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvaGVhZGVyLmMK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMgYi9kcml2ZXJzL3BlcmYvcmlz
Y3ZfcG11LmMKaW5kZXggMGM4NTNlMjNmNjc5Li4zNzUyZmZkNGVkYWYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvcGVyZi9yaXNjdl9wbXUuYworKysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMKQEAg
LTE3LDYgKzE3LDIzIEBACiAKICNpbmNsdWRlIDxhc20vc2JpLmg+CiAKK1BNVV9GT1JNQVRfQVRU
UihldmVudCwgImNvbmZpZzowLTYzIik7CisKK3N0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpyaXNj
dl9hcmNoX2Zvcm1hdHNfYXR0cltdID0geworCSZmb3JtYXRfYXR0cl9ldmVudC5hdHRyLAorCU5V
TEwsCit9OworCitzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCByaXNjdl9wbXVfZm9ybWF0
X2dyb3VwID0geworCS5uYW1lID0gImZvcm1hdCIsCisJLmF0dHJzID0gcmlzY3ZfYXJjaF9mb3Jt
YXRzX2F0dHIsCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqcmlz
Y3ZfcG11X2F0dHJfZ3JvdXBzW10gPSB7CisJJnJpc2N2X3BtdV9mb3JtYXRfZ3JvdXAsCisJTlVM
TCwKK307CisKIHN0YXRpYyB1bnNpZ25lZCBsb25nIGNzcl9yZWFkX251bShpbnQgY3NyX251bSkK
IHsKICNkZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVhZChfX2Nzcl9udW0sIF9fdmFsKQkJe1wKQEAg
LTMxNCw2ICszMzEsNyBAQCBzdHJ1Y3QgcmlzY3ZfcG11ICpyaXNjdl9wbXVfYWxsb2Modm9pZCkK
IAkJCWNwdWMtPmV2ZW50c1tpXSA9IE5VTEw7CiAJfQogCXBtdS0+cG11ID0gKHN0cnVjdCBwbXUp
IHsKKwkJLmF0dHJfZ3JvdXBzCT0gcmlzY3ZfcG11X2F0dHJfZ3JvdXBzLAogCQkuZXZlbnRfaW5p
dAk9IHJpc2N2X3BtdV9ldmVudF9pbml0LAogCQkuYWRkCQk9IHJpc2N2X3BtdV9hZGQsCiAJCS5k
ZWwJCT0gcmlzY3ZfcG11X2RlbCwKZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi91
dGlsL0J1aWxkIGIvdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvQnVpbGQKaW5kZXggN2QzMDUw
MTM0YWUwLi42MDNkYmI1YWU0ZGMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi91
dGlsL0J1aWxkCisrKyBiL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL0J1aWxkCkBAIC0xLDQg
KzEsNSBAQAogcGVyZi15ICs9IHBlcmZfcmVncy5vCitwZXJmLXkgKz0gaGVhZGVyLm8KIAogcGVy
Zi0kKENPTkZJR19EV0FSRikgKz0gZHdhcmYtcmVncy5vCiBwZXJmLSQoQ09ORklHX0xJQkRXX0RX
QVJGX1VOV0lORCkgKz0gdW53aW5kLWxpYmR3Lm8KZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvYXJj
aC9yaXNjdi91dGlsL2hlYWRlci5jIGIvdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvaGVhZGVy
LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5iNGNhOGE3NjhmMTEK
LS0tIC9kZXYvbnVsbAorKysgYi90b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9oZWFkZXIuYwpA
QCAtMCwwICsxLDY2IEBACisjaW5jbHVkZSA8c3RkaW8uaD4KKyNpbmNsdWRlIDxzdGRsaWIuaD4K
KyNpbmNsdWRlIDxhcGkvZnMvZnMuaD4KKyNpbmNsdWRlIDxlcnJuby5oPgorI2luY2x1ZGUgIi4u
Ly4uL3V0aWwvZGVidWcuaCIKKyNpbmNsdWRlICIuLi8uLi91dGlsL2hlYWRlci5oIgorCisjZGVm
aW5lIFNUUl9MRU4gMTAyNAorI2RlZmluZSBJRF9TSVpFIDY0CisKK3N0YXRpYyBpbnQgX2dldF9j
cHVpZChjaGFyICpidWYsIHNpemVfdCBzeikKK3sKKwljb25zdCBjaGFyICpzeXNmcyA9IHN5c2Zz
X19tb3VudHBvaW50KCk7CisJdTY0IGlkID0gMDsKKwljaGFyIHBhdGhbUEFUSF9NQVhdOworCUZJ
TEUgKmZpbGU7CisKKwlpZiAoIXN5c2ZzIHx8IHN6IDwgSURfU0laRSkKKwkJcmV0dXJuIC1FSU5W
QUw7CisKKwlzY25wcmludGYocGF0aCwgUEFUSF9NQVgsICIlcy9kZXZpY2VzL3BsYXRmb3JtL3Nv
Yy9zb2M6cG11L2lkIiwKKwkJCXN5c2ZzKTsKKworCWZpbGUgPSBmb3BlbihwYXRoLCAiciIpOwor
CWlmICghZmlsZSkgeworCQlwcl9kZWJ1ZygiZm9wZW4gZmFpbGVkIGZvciBmaWxlICVzXG4iLCBw
YXRoKTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCWlmICghZmdldHMoYnVmLCBJRF9TSVpFLCBm
aWxlKSkgeworCQlmY2xvc2UoZmlsZSk7CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCWZjbG9z
ZShmaWxlKTsKKworCS8qQ2hlY2sgaWYgdmFsdWUgaXMgbnVtZXJpYyBhbmQgcmVtb3ZlIHNwZWNp
YWwgY2hhcmFjdGVycyovCisJaWQgPSBzdHJ0b3VsKGJ1ZiwgTlVMTCwgMTYpOworCWlmICghaWQp
CisJCXJldHVybiAtRUlOVkFMOworCXNjbnByaW50ZihidWYsIElEX1NJWkUsICIweCVseCIsIGlk
KTsKKworCXJldHVybiAwOworfQorCitjaGFyICpnZXRfY3B1aWRfc3RyKHN0cnVjdCBwZXJmX3Bt
dSAqcG11IF9fbWF5YmVfdW51c2VkKQoreworCWNoYXIgKmJ1ZiA9IE5VTEw7CisJaW50IHJlczsK
KworCWlmICghcG11KQorCQlyZXR1cm4gTlVMTDsKKworCWJ1ZiA9IG1hbGxvYyhJRF9TSVpFKTsK
KwlpZiAoIWJ1ZikKKwkJcmV0dXJuIE5VTEw7CisKKwkvKiByZWFkIGlkICovCisJcmVzID0gX2dl
dF9jcHVpZChidWYsIElEX1NJWkUpOworCWlmIChyZXMpIHsKKwkJcHJfZXJyKCJmYWlsZWQgdG8g
Z2V0IGNwdWlkIHN0cmluZyBmb3IgUE1VICVzXG4iLCBwbXUtPm5hbWUpOworCQlmcmVlKGJ1Zik7
CisJCWJ1ZiA9IE5VTEw7CisJfQorCisJcmV0dXJuIGJ1ZjsKK30KLS0gCjIuMTcuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
