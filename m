Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784FBC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 10:34:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4133C610F8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 10:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4133C610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T81YKxSH5xepMA/28XuNzCMedXNoTUWCAfvAUOozKQo=; b=DMR9hOoQzQvo8q
	ouEgpZ1hospwwsONqEXgHy+yzphBY/IB2cAAAY4lzk+fOTz9+onaYXEU4dxAs25F/QB1rgJ2HNFKq
	PtEmdsyZ7T481+oPP9Y/UNIqkoKkeSrDzxhCx20Ruo887NzYOpYurUdgfjmzXnS5cf1e0NJgMR3Hg
	275SiDrVdddGqSjCZ+9lYcLvQGoiL5znFyIacxQAKkhLSKfBrAhkXJv8WbQ+vyhk5Pvdu9in4JOGP
	tuicyN3ul2wsEzo7xLvjdfcoWgASLxjryN3mL24lMDtdIw0WFP4jn2xeMQjq6BFFzW2mT0DJPPb8B
	/28QWXJS+hgSgg+PoZww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkOSL-001YlK-3g; Tue, 09 Nov 2021 10:34:21 +0000
Received: from smtp1.tecnico.ulisboa.pt ([193.136.128.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkORs-001YaL-IL
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 10:33:58 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 921C16005433;
 Tue,  9 Nov 2021 10:26:00 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id ejsPI05q3Uta; Tue,  9 Nov 2021 10:25:57 +0000 (WET)
Received: from mail2.tecnico.ulisboa.pt (mail2.ist.utl.pt
 [IPv6:2001:690:2100:1::4750:b5b4])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 6621B6005C37;
 Tue,  9 Nov 2021 10:25:57 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1636453557;
 bh=4wJpEEWXqws1hIngv9XGihPaug2YZrgE2W8X/0vyhTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=um1+kyv0pSwr1E61X/NAys+sSdtIuBA6Eele67GVp9+POxu4NZwXa5XaU6FysWw7v
 Ov5qxpGoTs6aJZWjleuXlCshyRvhW4E9JSQqAuKUPj6g39Qhg3RJP2WX2klrAYi4Et
 i4qJUonyI15d/LGIiAf6Gvg+UZBVKmt6l+uHH3DA=
Received: from localhost.localdomain (unknown
 [IPv6:2001:8a0:fa2d:4500:215:5dff:fe40:101])
 (Authenticated sender: ist181713)
 by mail2.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 3BAFA56007A;
 Tue,  9 Nov 2021 10:25:57 +0000 (WET)
From: =?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?=
 <joao.mario@tecnico.ulisboa.pt>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: atish.patra@wdc.com, anup.patel@wdc.com, linux-riscv@lists.infradead.org
Subject: [PATCH 1/4] RISC-V: Create unique identification for SoC PMU
Date: Tue,  9 Nov 2021 10:25:52 +0000
Message-Id: <20211109102555.16381-2-joao.mario@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
References: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_023352_815632_9456F6D6 
X-CRM114-Status: GOOD (  14.73  )
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

VGhlIFNCSSBQTVUgcGxhdGZvcm0gZHJpdmVyIGRpZCBub3QgcHJvdmlkZSBhbnkgaWRlbnRpZmlj
YXRpb24gZm9yCnBlcmYgZXZlbnRzIG1hdGNoaW5nLiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBu
ZXcgc3lzZnMgZmlsZSBpbnNpZGUgdGhlCnBsYXRmb3JtIGRldmljZSAoc29jOnBtdS9pZCkgZm9y
IHBtdSBpZGVudGlmaWNhdGlvbi4KClRoZSBpZGVudGlmaWNhdGlvbiBpcyBhIDY0LWJpdCB2YWx1
ZSBnZW5lcmF0ZWQgYXM6Cls2My0zMl06IG12ZW5kb3JpZDsKWzMxXTogbWFyY2hpZFtNU0JdOwpb
MzAtMTZdOiBtYXJjaGlkWzE1LTBdOwpbMTUtMF06IG1pbXBpZFsxNU1TQnNdOwoKVGhlIENTUnMg
YXJlIGRldGFpbGVkIGluIHRoZSBSSVNDLVYgcHJpdmlsZWdlZCBzcGVjIFsxXS4KVGhlIG1hcmNo
aWQgaXMgc3BsaXQgaW4gTVNCICsgMTVMU0JzLCBkdWUgdG8gdGhlIE1TQiBiZWluZyB1c2VkIGZv
cgpvcGVuLXNvdXJjZSBhcmNoaXRlY3R1cmUgaWRlbnRpZmljYXRpb24uCgpbMV0gaHR0cHM6Ly9n
aXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwKClNpZ25lZC1vZmYtYnk6IEpvw6NvIE3D
oXJpbyBEb21pbmdvcyA8am9hby5tYXJpb0B0ZWNuaWNvLnVsaXNib2EucHQ+Ci0tLQogYXJjaC9y
aXNjdi9rZXJuZWwvc2JpLmMgICAgICB8ICAzICsrKwogZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9z
YmkuYyB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBj
aGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
c2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwppbmRleCA3NDAyYTQxN2YzOGUuLjRlNGY1
NjcxYjg2NCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvc2JpLmMKQEAgLTU1MSwxNiArNTUxLDE5IEBAIGxvbmcgc2JpX2dldF9tdmVu
ZG9yaWQodm9pZCkKIHsKIAlyZXR1cm4gX19zYmlfYmFzZV9lY2FsbChTQklfRVhUX0JBU0VfR0VU
X01WRU5ET1JJRCk7CiB9CitFWFBPUlRfU1lNQk9MKHNiaV9nZXRfbXZlbmRvcmlkKTsKIAogbG9u
ZyBzYmlfZ2V0X21hcmNoaWQodm9pZCkKIHsKIAlyZXR1cm4gX19zYmlfYmFzZV9lY2FsbChTQklf
RVhUX0JBU0VfR0VUX01BUkNISUQpOwogfQorRVhQT1JUX1NZTUJPTChzYmlfZ2V0X21hcmNoaWQp
OwogCiBsb25nIHNiaV9nZXRfbWltcGlkKHZvaWQpCiB7CiAJcmV0dXJuIF9fc2JpX2Jhc2VfZWNh
bGwoU0JJX0VYVF9CQVNFX0dFVF9NSU1QSUQpOwogfQorRVhQT1JUX1NZTUJPTChzYmlfZ2V0X21p
bXBpZCk7CiAKIHN0YXRpYyB2b2lkIHNiaV9zZW5kX2NwdW1hc2tfaXBpKGNvbnN0IHN0cnVjdCBj
cHVtYXNrICp0YXJnZXQpCiB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3Ni
aS5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwppbmRleCA3YTY4ZGZhODlmNmYuLmY5
MTNkOGRkZmU3MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYworKysg
Yi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCkBAIC0yMzYsNiArMjM2LDE1IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcG11X2V2ZW50X2RhdGEgcG11X2NhY2hlX2V2ZW50X21hcFtQRVJGX0NP
VU5UX0hXX0NBQ0hFX01BWF0KIAl9LAogfTsKIAorc3RhdGljIERFVklDRV9BVFRSKGlkLCBTX0lS
VUdPIHwgU19JV1VTUiwgcG11X3NiaV9pZF9zaG93LCAwKTsKKworc3RhdGljIHN0cnVjdCBhdHRy
aWJ1dGUgKnBtdV9zYmlfYXR0cnNbXSA9IHsKKyAgICAmZGV2X2F0dHJfaWQuYXR0ciwKKyAgICBO
VUxMCit9OworCitBVFRSSUJVVEVfR1JPVVBTKHBtdV9zYmkpOworCiBzdGF0aWMgaW50IHBtdV9z
YmlfY3RyX2dldF93aWR0aChpbnQgaWR4KQogewogCXJldHVybiBwbXVfY3RyX2xpc3RbaWR4XS53
aWR0aDsKQEAgLTY0Miw2ICs2NTEsMzYgQEAgc3RhdGljIGludCBwbXVfc2JpX3NldHVwX2lycXMo
c3RydWN0IHJpc2N2X3BtdSAqcG11LCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGUKIAlyZXR1
cm4gMDsKIH0KIAorc3RhdGljIHVpbnQ2NF90IHBtdV9zYmlfZ2V0X3BtdV9pZCh2b2lkKQorewor
CXVuaW9uIHNiaV9wbXVfaWQgeworCQl1aW50NjRfdCB2YWx1ZTsKKwkJc3RydWN0IHsKKwkJCXVp
bnQxNl90IGltcDoxNjsKKwkJCXVpbnQxNl90IGFyY2g6MTY7CisJCQl1aW50MzJfdCB2ZW5kb3I6
MzI7CisJCX07CisJfXBtdWlkOworCisJcG11aWQudmFsdWUgPSAwOworCXBtdWlkLnZlbmRvciA9
ICh1aW50MzJfdCkgc2JpX2dldF9tdmVuZG9yaWQoKTsKKwlwbXVpZC5hcmNoID0gKHNiaV9nZXRf
bWFyY2hpZCgpID4+ICg2MyAtIDE1KSAmICgxIDw8IDE1KSkgfCAoIHNiaV9nZXRfbWFyY2hpZCgp
ICYgMHg3RkZGICk7CisJcG11aWQuaW1wID0gKHNiaV9nZXRfbWltcGlkKCkgPj4gMTYpOworCisJ
cmV0dXJuIHBtdWlkLnZhbHVlOworfQorCitzdGF0aWMgc3NpemVfdCBwbXVfc2JpX2lkX3Nob3co
c3RydWN0IGRldmljZSAqZGV2LAorICAgICAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0
ciwgY2hhciAqYnVmKQoreworICAgIGludCBsZW47CisgICAgbGVuID0gc3ByaW50ZihidWYsICIw
eCVseFxuIiwgcG11X3NiaV9nZXRfcG11X2lkKCkpOworICAgIGlmIChsZW4gPD0gMCkKKyAgICAg
ICAgZGV2X2VycihkZXYsICJteWRydjogSW52YWxpZCBzcHJpbnRmIGxlbjogJWRuIiwgbGVuKTsK
KworICAgIHJldHVybiBsZW47Cit9CisKIHN0YXRpYyBpbnQgcG11X3NiaV9kZXZpY2VfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUg
PSBOVUxMOwpAQCAtNjgwLDYgKzcxOSwxMyBAQCBzdGF0aWMgaW50IHBtdV9zYmlfZGV2aWNlX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcG11LT5jdHJfY2xlYXJfaWR4ID0g
cG11X3NiaV9jdHJfY2xlYXJfaWR4OwogCXBtdS0+Y3RyX3JlYWQgPSBwbXVfc2JpX2N0cl9yZWFk
OwogCisJcmV0ID0gc3lzZnNfY3JlYXRlX2dyb3VwKCZwZGV2LT5kZXYua29iaiwgJnBtdV9zYmlf
Z3JvdXApOworCWlmIChyZXQpIHsKKyAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAic3lzZnMg
Y3JlYXRpb24gZmFpbGVkXG4iKTsKKyAgICAgICAgcmV0dXJuIHJldDsKKyAgICB9CisJcGRldi0+
ZGV2Lmdyb3VwcyA9IHBtdV9zYmlfZ3JvdXBzOworCiAJcmV0ID0gY3B1aHBfc3RhdGVfYWRkX2lu
c3RhbmNlKENQVUhQX0FQX1BFUkZfUklTQ1ZfU1RBUlRJTkcsICZwbXUtPm5vZGUpOwogCWlmIChy
ZXQpCiAJCXJldHVybiByZXQ7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
