Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6531ED24442
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hX0QUqeZJsHdtAw/9DPu7MHUY+uukdsb22WsFohr9yo=; b=VIAwnoAvDS3W3K
	CyoKkdwkAhNGtL6vKbFPlnHEmp+Eh3M1ELA8NfXyxEusbCndiJ1U7cOhcc66OczFh5pQsG2wtbNEq
	CcDbSFYFC2m6/zxSKfcc6FbsbCXiuiBOyW9c+hjf06lFePH5ZT/uQN6Tx/KOdGCbidujOsc5ALFmO
	N/IJGHXTaWLCBfjK1kBVSpGyqHBEUrQuvRGohkXQVDhkd5noovtbK0iL8WnC9J8nF4C4AkwBgd0kt
	GJmbGplXd/YRsWlz9B+DmNZ1tdJH6zHNe+xAMTCgXmOku+mKWS2BPltDor/Al9enuiyZYu52HJVge
	QunGmwmdSrYpB/jBpIqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzFp-0000000ECie-0gXE;
	Thu, 10 Oct 2024 19:55:21 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxt7-0000000Drv0-1WeK
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:52 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-20c8a637b77so13075005ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584868; x=1729189668; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYRk8t9w2U8aQ/ID4AWjouVrA1tdB4hWvcNmB/sB3HQ=;
        b=MUIvCWd3OKL3bG2LnW491oxhTPr2o7/fCOnjUOkW6ycXy+5uHrA31BINqdPJuJ3C3/
         5DXZ4T8bTuWTd5pncs9YLc3/n2uR8x54Vs/bYASESllzopfA6VCT9SAWgifi3sSY6Qkl
         RJ0aG8HQgu0RB6tNsUB6isyfkRPB4kYBT4bcNCJEtYN4QGGG6Gb5tjcu36I2dXx7LaSe
         eG9yeEcdUT1bz6iz6MXsGzWuvXb823sD9bk5OtzpOhbQRpZvKKKqxXMfUSPh3lkWrLvQ
         63KzXC9l1Jx6YZ1qfhtiZQ9PLgmDhUFzpW+u6EFMfvHpAsOXJ5IxILDg0Et7pSJqVR/l
         vVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584868; x=1729189668;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qYRk8t9w2U8aQ/ID4AWjouVrA1tdB4hWvcNmB/sB3HQ=;
        b=nEUdZ9lQG+ehXvP8JAbkztGFOq+vO+ewZ4qFv5rVUbzdf+Z1cslZ5DQr6MwB7nYtv4
         2rxHunLdlW9XcjKMmqQxvcFKW0dDUQfwAH00sp9i3q8Gn+PLzf4VOYMiX84NxnyPsOZq
         7HV+AwjbbbRXNDVtrVMnaApI7p2RPz07zzAiGTz7RR7V3x2xXuCP5NLD1i8rJXBe/3CY
         o/Uuwz/BxHNRobZQktOmJGfttYNHG0oIZ+h9jIaS8JIF2pQktCVdWuTuBpuK0Gv2ODcy
         kzoQadVkL+FDdPdGGrrQ993dhjT3immfE7UmjfuqKRH8OV4I2oFAqwElfRX6ljy4TvB2
         9/gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAtOZbxQMYrudntHSmI3/hckBlt6VDQJmM8ezAf3A3zkLnvQhdkHrQYwemSBh2oWR5Ve1jU3vEYk7WSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YznrQZZ/quDUmcZEYnJGxTa7oQcVB1yg8UXpD50rvjBXT8vcnVJ
	2FPlgQu8N3JV+mtKsXKUVs1yZSq9YMW1P2SRwCG8RtTlRotgiyYLI1Tgz0cHx9kUpN35i22lvye
	7+A==
X-Google-Smtp-Source: AGHT+IHfwq/leOSDpGNmElHsEevN2NLhktzxL5WWYsNV7s51yqV4fIBatX1NQsHzbv29AfLNcoyCuLVeClM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:e745:b0:20c:857b:5dcb with SMTP id
 d9443c01a7336-20c857b62ffmr639275ad.4.1728584868183; Thu, 10 Oct 2024
 11:27:48 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:25 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-84-seanjc@google.com>
Subject: [PATCH v13 83/85] KVM: arm64: Don't mark "struct page" accessed when
 making SPTE young
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112749_457075_65034457 
X-CRM114-Status: GOOD (  12.09  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RG9uJ3QgbWFyayBwYWdlcy9mb2xpb3MgYXMgYWNjZXNzZWQgaW4gdGhlIHByaW1hcnkgTU1VIHdo
ZW4gbWFraW5nIGEgU1BURQp5b3VuZyBpbiBLVk0ncyBzZWNvbmRhcnkgTU1VLCBhcyBkb2luZyBz
byByZWxpZXMgb24Ka3ZtX3Bmbl90b19yZWZjb3VudGVkX3BhZ2UoKSwgYW5kIGdlbmVyYWxseSBz
cGVha2luZyBpcyB1bm5lY2Vzc2FyeSBhbmQKd2FzdGVmdWwuICBLVk0gcGFydGljaXBhdGVzIGlu
IHBhZ2UgYWdpbmcgdmlhIG1tdV9ub3RpZmllcnMsIHNvIHRoZXJlJ3Mgbm8KbmVlZCB0byBwdXNo
ICJhY2Nlc3NlZCIgdXBkYXRlcyB0byB0aGUgcHJpbWFyeSBNTVUuCgpEcm9wcGluZyB1c2Ugb2Yg
a3ZtX3NldF9wZm5fYWNjZXNzZWQoKSBhbHNvIHBhdmVzIHRoZSB3YXkgZm9yIHJlbW92aW5nCmt2
bV9wZm5fdG9fcmVmY291bnRlZF9wYWdlKCkgYW5kIGFsbCBpdHMgdXNlcnMuCgpUZXN0ZWQtYnk6
IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogU2Vh
biBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Ci0tLQogYXJjaC9hcm02NC9pbmNs
dWRlL2FzbS9rdm1fcGd0YWJsZS5oIHwgNCArLS0tCiBhcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJs
ZS5jICAgICAgICAgfCA3ICsrLS0tLS0KIGFyY2gvYXJtNjQva3ZtL21tdS5jICAgICAgICAgICAg
ICAgICB8IDYgKy0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9rdm1fcGd0YWJs
ZS5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9rdm1fcGd0YWJsZS5oCmluZGV4IDAzZjRjM2Q3
ODM5Yy4uYWFiMDQwOTdiNTA1IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2t2
bV9wZ3RhYmxlLmgKKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9rdm1fcGd0YWJsZS5oCkBA
IC02NzQsMTAgKzY3NCw4IEBAIGludCBrdm1fcGd0YWJsZV9zdGFnZTJfd3Jwcm90ZWN0KHN0cnVj
dCBrdm1fcGd0YWJsZSAqcGd0LCB1NjQgYWRkciwgdTY0IHNpemUpOwogICoKICAqIElmIHRoZXJl
IGlzIGEgdmFsaWQsIGxlYWYgcGFnZS10YWJsZSBlbnRyeSB1c2VkIHRvIHRyYW5zbGF0ZSBAYWRk
ciwgdGhlbgogICogc2V0IHRoZSBhY2Nlc3MgZmxhZyBpbiB0aGF0IGVudHJ5LgotICoKLSAqIFJl
dHVybjogVGhlIG9sZCBwYWdlLXRhYmxlIGVudHJ5IHByaW9yIHRvIHNldHRpbmcgdGhlIGZsYWcs
IDAgb24gZmFpbHVyZS4KICAqLwota3ZtX3B0ZV90IGt2bV9wZ3RhYmxlX3N0YWdlMl9ta3lvdW5n
KHN0cnVjdCBrdm1fcGd0YWJsZSAqcGd0LCB1NjQgYWRkcik7Cit2b2lkIGt2bV9wZ3RhYmxlX3N0
YWdlMl9ta3lvdW5nKHN0cnVjdCBrdm1fcGd0YWJsZSAqcGd0LCB1NjQgYWRkcik7CiAKIC8qKgog
ICoga3ZtX3BndGFibGVfc3RhZ2UyX3Rlc3RfY2xlYXJfeW91bmcoKSAtIFRlc3QgYW5kIG9wdGlv
bmFsbHkgY2xlYXIgdGhlIGFjY2VzcwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rdm0vaHlwL3Bn
dGFibGUuYyBiL2FyY2gvYXJtNjQva3ZtL2h5cC9wZ3RhYmxlLmMKaW5kZXggYjExYmNlYmFjOTA4
Li40MGJkNTU5NjY1NDAgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQva3ZtL2h5cC9wZ3RhYmxlLmMK
KysrIGIvYXJjaC9hcm02NC9rdm0vaHlwL3BndGFibGUuYwpAQCAtMTI0NSwxOSArMTI0NSwxNiBA
QCBpbnQga3ZtX3BndGFibGVfc3RhZ2UyX3dycHJvdGVjdChzdHJ1Y3Qga3ZtX3BndGFibGUgKnBn
dCwgdTY0IGFkZHIsIHU2NCBzaXplKQogCQkJCQlOVUxMLCBOVUxMLCAwKTsKIH0KIAota3ZtX3B0
ZV90IGt2bV9wZ3RhYmxlX3N0YWdlMl9ta3lvdW5nKHN0cnVjdCBrdm1fcGd0YWJsZSAqcGd0LCB1
NjQgYWRkcikKK3ZvaWQga3ZtX3BndGFibGVfc3RhZ2UyX21reW91bmcoc3RydWN0IGt2bV9wZ3Rh
YmxlICpwZ3QsIHU2NCBhZGRyKQogewotCWt2bV9wdGVfdCBwdGUgPSAwOwogCWludCByZXQ7CiAK
IAlyZXQgPSBzdGFnZTJfdXBkYXRlX2xlYWZfYXR0cnMocGd0LCBhZGRyLCAxLCBLVk1fUFRFX0xF
QUZfQVRUUl9MT19TMl9BRiwgMCwKLQkJCQkgICAgICAgJnB0ZSwgTlVMTCwKKwkJCQkgICAgICAg
TlVMTCwgTlVMTCwKIAkJCQkgICAgICAgS1ZNX1BHVEFCTEVfV0FMS19IQU5ETEVfRkFVTFQgfAog
CQkJCSAgICAgICBLVk1fUEdUQUJMRV9XQUxLX1NIQVJFRCk7CiAJaWYgKCFyZXQpCiAJCWRzYihp
c2hzdCk7Ci0KLQlyZXR1cm4gcHRlOwogfQogCiBzdHJ1Y3Qgc3RhZ2UyX2FnZV9kYXRhIHsKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQva3ZtL21tdS5jIGIvYXJjaC9hcm02NC9rdm0vbW11LmMKaW5k
ZXggNDA1NDM1NmM5NzEyLi5lMmFlOTAwNWUzMzMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQva3Zt
L21tdS5jCisrKyBiL2FyY2gvYXJtNjQva3ZtL21tdS5jCkBAIC0xNzA2LDE4ICsxNzA2LDE0IEBA
IHN0YXRpYyBpbnQgdXNlcl9tZW1fYWJvcnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBwaHlzX2Fk
ZHJfdCBmYXVsdF9pcGEsCiAvKiBSZXNvbHZlIHRoZSBhY2Nlc3MgZmF1bHQgYnkgbWFraW5nIHRo
ZSBwYWdlIHlvdW5nIGFnYWluLiAqLwogc3RhdGljIHZvaWQgaGFuZGxlX2FjY2Vzc19mYXVsdChz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHBoeXNfYWRkcl90IGZhdWx0X2lwYSkKIHsKLQlrdm1fcHRl
X3QgcHRlOwogCXN0cnVjdCBrdm1fczJfbW11ICptbXU7CiAKIAl0cmFjZV9rdm1fYWNjZXNzX2Zh
dWx0KGZhdWx0X2lwYSk7CiAKIAlyZWFkX2xvY2soJnZjcHUtPmt2bS0+bW11X2xvY2spOwogCW1t
dSA9IHZjcHUtPmFyY2guaHdfbW11OwotCXB0ZSA9IGt2bV9wZ3RhYmxlX3N0YWdlMl9ta3lvdW5n
KG1tdS0+cGd0LCBmYXVsdF9pcGEpOworCWt2bV9wZ3RhYmxlX3N0YWdlMl9ta3lvdW5nKG1tdS0+
cGd0LCBmYXVsdF9pcGEpOwogCXJlYWRfdW5sb2NrKCZ2Y3B1LT5rdm0tPm1tdV9sb2NrKTsKLQot
CWlmIChrdm1fcHRlX3ZhbGlkKHB0ZSkpCi0JCWt2bV9zZXRfcGZuX2FjY2Vzc2VkKGt2bV9wdGVf
dG9fcGZuKHB0ZSkpOwogfQogCiAvKioKLS0gCjIuNDcuMC5yYzEuMjg4LmcwNjI5OGQxNTI1LWdv
b2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
