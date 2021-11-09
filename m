Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D45AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 10:34:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 394F3610F8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 10:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 394F3610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90JKXkaKjPnsKCNYKnCOkWAos27Qi1btJj3ey23hSIg=; b=xoTBAm4TG0yzEO
	fwO6VBZjhyfdG2XIKRi0fhJRl0tvMxM0HaZ/RRyQIoukYhZ2R6Q1rJUrhX/Zuq5+2jl7eaQlt7LBy
	4Dh+UKtO9O3q+vwE1anK7zSnIAJrMY0lxn1vlCcc5Dqa9uq0rfFQIvZxd0xjgf1nUckfGTog9AlxJ
	auL4vSd4s17ZTcOGBYF7sEZ6kniDOeEbWJMKcafUMJAEbrQVKiwQxxTi3avT/FyNyKVHk4CiPcAiK
	vbZHHiq19167fZ90fsVGcoi/nUwumo42khyvPuRmrTjk0b6UXn80WzOz8uq+6b8BR4YioyXdC2c+z
	9HVaU9oFlDFAQHOV1okQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkOS1-001YeW-Vl; Tue, 09 Nov 2021 10:34:02 +0000
Received: from smtp1.tecnico.ulisboa.pt ([2001:690:2100:1::15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkORs-001YaM-Im
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 10:33:58 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id BDDA16005438;
 Tue,  9 Nov 2021 10:26:00 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id yIPkBlqvj0VD; Tue,  9 Nov 2021 10:25:57 +0000 (WET)
Received: from mail2.tecnico.ulisboa.pt (mail2.ist.utl.pt
 [IPv6:2001:690:2100:1::4750:b5b4])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 8B15B6005C38;
 Tue,  9 Nov 2021 10:25:57 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1636453557;
 bh=gB7Bk2VrzmEu20yTNuOy52qSSylQeFsF/mDum1VfHig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=P2MMoJrauIZ5utItJ3aVkuyuoQRZUdKwxbtiK9VfuBJ+A4d/6kqz65ZuJS/MdJOP7
 PJ8pKLy8VTCa8TbjT+imni6VBojvSzqLMcUXD4SOw7i26+2MdEbap2G26m3zG7Z1NM
 guPq/4rmFPqDVv8RRuBaSNEoihS5VaP5BYoDslOQ=
Received: from localhost.localdomain (unknown
 [IPv6:2001:8a0:fa2d:4500:215:5dff:fe40:101])
 (Authenticated sender: ist181713)
 by mail2.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 5ECCF560085;
 Tue,  9 Nov 2021 10:25:57 +0000 (WET)
From: =?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?=
 <joao.mario@tecnico.ulisboa.pt>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: atish.patra@wdc.com, anup.patel@wdc.com, linux-riscv@lists.infradead.org
Subject: [PATCH 2/4] RISC-V: Support CPUID for risc-v in perf
Date: Tue,  9 Nov 2021 10:25:53 +0000
Message-Id: <20211109102555.16381-3-joao.mario@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
References: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_023352_822630_86466E5B 
X-CRM114-Status: GOOD (  17.77  )
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
LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5lZjczOWFlMzZkNDgK
LS0tIC9kZXYvbnVsbAorKysgYi90b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9oZWFkZXIuYwpA
QCAtMCwwICsxLDY2IEBACisjaW5jbHVkZSA8c3RkaW8uaD4KKyNpbmNsdWRlIDxzdGRsaWIuaD4K
KyNpbmNsdWRlIDxhcGkvZnMvZnMuaD4KKyNpbmNsdWRlIDxlcnJuby5oPgorI2luY2x1ZGUgIi4u
Ly4uL3V0aWwvZGVidWcuaCIKKyNpbmNsdWRlICIuLi8uLi91dGlsL2hlYWRlci5oIgorCisjZGVm
aW5lIFNUUl9MRU4gMTAyNAorI2RlZmluZSBJRF9TSVpFIDY0CisKK3N0YXRpYyBpbnQgX2dldF9j
cHVpZChjaGFyICpidWYsIHNpemVfdCBzeikKK3sKKwljb25zdCBjaGFyICpzeXNmcyA9IHN5c2Zz
X19tb3VudHBvaW50KCk7CisJdTY0IGlkID0gMDsKKyAgICBjaGFyIHBhdGhbUEFUSF9NQVhdOwor
ICAgIEZJTEUgKmZpbGU7CisKKwlpZiAoIXN5c2ZzIHx8IHN6IDwgSURfU0laRSkKKwkJcmV0dXJu
IEVJTlZBTDsKKworICAgIHNjbnByaW50ZihwYXRoLCBQQVRIX01BWCwgIiVzL2RldmljZXMvcGxh
dGZvcm0vc29jL3NvYzpwbXUvaWQiLAorICAgICAgICAgICAgc3lzZnMpOworCisgICAgZmlsZSA9
IGZvcGVuKHBhdGgsICJyIik7CisgICAgaWYgKCFmaWxlKSB7CisgICAgICAgIHByX2RlYnVnKCJm
b3BlbiBmYWlsZWQgZm9yIGZpbGUgJXNcbiIsIHBhdGgpOworICAgICAgICByZXR1cm4gRUlOVkFM
OworICAgIH0KKyAgICBpZiAoIWZnZXRzKGJ1ZiwgSURfU0laRSwgZmlsZSkpIHsKKyAgICAgICAg
ZmNsb3NlKGZpbGUpOworICAgICAgICByZXR1cm4gRUlOVkFMOworICAgIH0KKworICAgIGZjbG9z
ZShmaWxlKTsKKworCS8qQ2hlY2sgaWYgdmFsdWUgaXMgbnVtZXJpYyBhbmQgcmVtb3ZlIHNwZWNp
YWwgY2hhcmFjdGVycyovCisgICAgaWQgPSBzdHJ0b3VsKGJ1ZiwgTlVMTCwgMTYpOworCWlmICgh
aWQpCisJCXJldHVybiBFSU5WQUw7CisJc2NucHJpbnRmKGJ1ZiwgSURfU0laRSwgIjB4JWx4Iiwg
aWQpOworCisJcmV0dXJuIDA7Cit9CisKK2NoYXIgKmdldF9jcHVpZF9zdHIoc3RydWN0IHBlcmZf
cG11ICpwbXUgX19tYXliZV91bnVzZWQpCit7CisgICAgY2hhciAqYnVmID0gTlVMTDsKKwlpbnQg
cmVzOworCisJaWYgKCFwbXUpCisJCXJldHVybiBOVUxMOworCisJYnVmID0gbWFsbG9jKElEX1NJ
WkUpOworCWlmICghYnVmKQorCQlyZXR1cm4gTlVMTDsKKworCS8qIHJlYWQgaWQgKi8KKwlyZXMg
PSBfZ2V0X2NwdWlkKGJ1ZiwgSURfU0laRSk7CisJaWYgKHJlcykgeworCQlwcl9lcnIoImZhaWxl
ZCB0byBnZXQgY3B1aWQgc3RyaW5nIGZvciBQTVUgJXNcbiIsIHBtdS0+bmFtZSk7CisJCWZyZWUo
YnVmKTsKKwkJYnVmID0gTlVMTDsKKwl9CisgICAgCisgICAgcmV0dXJuIGJ1ZjsKK30KXCBObyBu
ZXdsaW5lIGF0IGVuZCBvZiBmaWxlCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
