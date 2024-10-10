Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252FACFC5F9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnMjDDphgmIAm7paQZjZKoXBpwBvkG2jcwklV7zG3Bs=; b=UO+UAgvT226aWv
	b06U/1QZrM2Z4dfEq/iJksGNrhIfoVfJxAq8Ak6mPWJLS60kz8nnPfscCmjLhK3XsYTbXaQnuEmbR
	o9iBvwoAiJeEMHDS2/ogaPwQQSI2mR7BewBlCXmaRbeJujHtfuY+4wzFP6CrkdMOgJTyBOF4VLvDA
	uKJeDNmG/bo38ErDjF8mm28gMxJML3oV8wZgnY/SQYShypcbc1ulq/X9pf2r/4y2z5xWqCn+jj995
	2OGVqF1T8FAoAn5vOsO/pYPl6sct7Zh6yTEl7Q4i/JV+UdQOulN4xy3QLZT9Egp4MX+8Jy4yaiRVM
	iXQZCrt2IJ/SmmBpCaZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyYF-0000000E3cE-2meK;
	Thu, 10 Oct 2024 19:10:19 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrW-0000000Dqbw-2DW5
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:11 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-20c8b0b0736so7708555ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584769; x=1729189569; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=551DSOChXG5A+yDanUyc1gC1jxg9ryEf27npUXDW1CE=;
        b=hHRUq768hWMB0snk3BTDf56BfbwlI/wpDGgFhaIx6MEk7ikWWWPixPGn5ajCAfoaG7
         0pbQvb2docQGGHhQNGOEELyTo7Vn6Kg+2FK1Ado67d3dpb9nyxslxTWPdbIhCjSBDz55
         ZZHh5rAO98OLYQq30LZnkOFZ8o9x0nvVNieVl9SGp8g1LHKYjOx0z8KSEtcXQHgXxI5a
         ssz873LT3liXqRaru9m8P5P+ghEymZ2dHwIcTCN5DQoQB/SedtOHs1Ul/MYoHZ+tTuqg
         rAtROSmEeH/8XJgjKuysN/PJsY+C2BYPd5iklkCaHOn7gwmpxw+U9/Pxtu4Mfcnf5wVt
         B9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584769; x=1729189569;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=551DSOChXG5A+yDanUyc1gC1jxg9ryEf27npUXDW1CE=;
        b=K37YjCqNDS9NfUQa+AErUGeMpjKXBBM3fFO6MtzVNF5TvLqoz2HarJQR3FjkVpf4mh
         olsA7njp3a2uAnvG6kVpNdZj2ub862uc4TfbQZImkP95upx6okM0+g06ySBX4cteV9Hj
         saJMmnFXGD7eYRaTEjAeOmWzg6kRYfFEVxQR812UBjPXbNJ1IBkb5jRbWZxz71eCGLTG
         +k3qrCL9hrteiN/6kRQbJ9KYgCH2ksBUUZjdpg1Q/CbLtJUzRvBru1G5HdQux/hlLSbs
         eRIqTdHMOMBJsk2GW82QaEpYZ3Po1v14TOm3hdYzKnvEP6QLVJzgRBAS3PCGMkSDqyol
         df+g==
X-Forwarded-Encrypted: i=1; AJvYcCUA+38Ec/rN+7qThh3DMklDyEFk5oc/9mV7iZcWWFG7LDFqV4fjE6kdpBx9SlzJpyIBiqL+0JprGox1RQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzF0AnQaqkWaFdM9TGjpKrjSUwbGdjUMYwrOHMroz6vlPvBOvVn
	81+55wQ2WGrXl0a1V88lDaGQKRqGi92ZIDH/AuRVT996F1vI6pCNh2blEh2b5gUDWhqWrSWKmKz
	EsA==
X-Google-Smtp-Source: AGHT+IGKm7yq47izgr1FmkV+xWCQVhrzT+Qt86SXT8qqzZ7digIfsw6vfVxyVo72E4861BiCHpsXRIV5BzI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:e80f:b0:1fa:2ae7:cc6a with SMTP id
 d9443c01a7336-20c63722d7fmr648865ad.4.1728584768900; Thu, 10 Oct 2024
 11:26:08 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:39 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-38-seanjc@google.com>
Subject: [PATCH v13 37/85] KVM: x86/mmu: Add "mmu" prefix fault-in helpers to
 free up generic names
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
X-CRM114-CacheID: sfid-20241010_112610_618815_9F97831D 
X-CRM114-Status: GOOD (  12.05  )
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

UHJlZml4IHg4NidzIGZhdWx0aW5fcGZuIGhlbHBlcnMgd2l0aCAibW11IiBzbyB0aGF0IHRoZSBt
bXUtbGVzcyBuYW1lcyBjYW4KYmUgdXNlZCBieSBjb21tb24gS1ZNIGZvciBzaW1pbGFyIEFQSXMu
CgpObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KClRlc3RlZC1ieTogQWxleCBCZW5uw6ll
IDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVy
c29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KLS0tCiBhcmNoL3g4Ni9rdm0vbW11L21tdS5jICAgICAg
ICAgIHwgMTkgKysrKysrKysrKy0tLS0tLS0tLQogYXJjaC94ODYva3ZtL21tdS9tbXVfaW50ZXJu
YWwuaCB8ICAyICstCiBhcmNoL3g4Ni9rdm0vbW11L3BhZ2luZ190bXBsLmggIHwgIDIgKy0KIDMg
ZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC94ODYva3ZtL21tdS9tbXUuYyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKaW5k
ZXggMjhmMmI4NDJkNmNhLi5lNDUxZTFiOWE1NWEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9t
bXUvbW11LmMKKysrIGIvYXJjaC94ODYva3ZtL21tdS9tbXUuYwpAQCAtNDM0Nyw4ICs0MzQ3LDgg
QEAgc3RhdGljIHU4IGt2bV9tYXhfcHJpdmF0ZV9tYXBwaW5nX2xldmVsKHN0cnVjdCBrdm0gKmt2
bSwga3ZtX3Bmbl90IHBmbiwKIAlyZXR1cm4gbWF4X2xldmVsOwogfQogCi1zdGF0aWMgaW50IGt2
bV9mYXVsdGluX3Bmbl9wcml2YXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKLQkJCQkgICBzdHJ1
Y3Qga3ZtX3BhZ2VfZmF1bHQgKmZhdWx0KQorc3RhdGljIGludCBrdm1fbW11X2ZhdWx0aW5fcGZu
X3ByaXZhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAorCQkJCSAgICAgICBzdHJ1Y3Qga3ZtX3Bh
Z2VfZmF1bHQgKmZhdWx0KQogewogCWludCBtYXhfb3JkZXIsIHI7CiAKQEAgLTQzNzEsMTAgKzQz
NzEsMTEgQEAgc3RhdGljIGludCBrdm1fZmF1bHRpbl9wZm5fcHJpdmF0ZShzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsCiAJcmV0dXJuIFJFVF9QRl9DT05USU5VRTsKIH0KIAotc3RhdGljIGludCBfX2t2
bV9mYXVsdGluX3BmbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcGFnZV9mYXVs
dCAqZmF1bHQpCitzdGF0aWMgaW50IF9fa3ZtX21tdV9mYXVsdGluX3BmbihzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsCisJCQkJIHN0cnVjdCBrdm1fcGFnZV9mYXVsdCAqZmF1bHQpCiB7CiAJaWYgKGZh
dWx0LT5pc19wcml2YXRlKQotCQlyZXR1cm4ga3ZtX2ZhdWx0aW5fcGZuX3ByaXZhdGUodmNwdSwg
ZmF1bHQpOworCQlyZXR1cm4ga3ZtX21tdV9mYXVsdGluX3Bmbl9wcml2YXRlKHZjcHUsIGZhdWx0
KTsKIAogCWZhdWx0LT5wZm4gPSBfX2dmbl90b19wZm5fbWVtc2xvdChmYXVsdC0+c2xvdCwgZmF1
bHQtPmdmbiwgZmFsc2UsIHRydWUsCiAJCQkJCSAgZmF1bHQtPndyaXRlLCAmZmF1bHQtPm1hcF93
cml0YWJsZSk7CkBAIC00NDA5LDggKzQ0MTAsOCBAQCBzdGF0aWMgaW50IF9fa3ZtX2ZhdWx0aW5f
cGZuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9wYWdlX2ZhdWx0ICpmYXVsdAog
CXJldHVybiBSRVRfUEZfQ09OVElOVUU7CiB9CiAKLXN0YXRpYyBpbnQga3ZtX2ZhdWx0aW5fcGZu
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9wYWdlX2ZhdWx0ICpmYXVsdCwKLQkJ
CSAgIHVuc2lnbmVkIGludCBhY2Nlc3MpCitzdGF0aWMgaW50IGt2bV9tbXVfZmF1bHRpbl9wZm4o
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LAorCQkJICAgICAgIHN0cnVjdCBrdm1fcGFnZV9mYXVsdCAq
ZmF1bHQsIHVuc2lnbmVkIGludCBhY2Nlc3MpCiB7CiAJc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAq
c2xvdCA9IGZhdWx0LT5zbG90OwogCWludCByZXQ7CkBAIC00NDkzLDcgKzQ0OTQsNyBAQCBzdGF0
aWMgaW50IGt2bV9mYXVsdGluX3BmbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1f
cGFnZV9mYXVsdCAqZmF1bHQsCiAJaWYgKG1tdV9pbnZhbGlkYXRlX3JldHJ5X2dmbl91bnNhZmUo
dmNwdS0+a3ZtLCBmYXVsdC0+bW11X3NlcSwgZmF1bHQtPmdmbikpCiAJCXJldHVybiBSRVRfUEZf
UkVUUlk7CiAKLQlyZXQgPSBfX2t2bV9mYXVsdGluX3Bmbih2Y3B1LCBmYXVsdCk7CisJcmV0ID0g
X19rdm1fbW11X2ZhdWx0aW5fcGZuKHZjcHUsIGZhdWx0KTsKIAlpZiAocmV0ICE9IFJFVF9QRl9D
T05USU5VRSkKIAkJcmV0dXJuIHJldDsKIApAQCAtNDU3MCw3ICs0NTcxLDcgQEAgc3RhdGljIGlu
dCBkaXJlY3RfcGFnZV9mYXVsdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcGFn
ZV9mYXVsdCAqZmF1bHQKIAlpZiAocikKIAkJcmV0dXJuIHI7CiAKLQlyID0ga3ZtX2ZhdWx0aW5f
cGZuKHZjcHUsIGZhdWx0LCBBQ0NfQUxMKTsKKwlyID0ga3ZtX21tdV9mYXVsdGluX3Bmbih2Y3B1
LCBmYXVsdCwgQUNDX0FMTCk7CiAJaWYgKHIgIT0gUkVUX1BGX0NPTlRJTlVFKQogCQlyZXR1cm4g
cjsKIApAQCAtNDY2MSw3ICs0NjYyLDcgQEAgc3RhdGljIGludCBrdm1fdGRwX21tdV9wYWdlX2Zh
dWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAlpZiAocikKIAkJcmV0dXJuIHI7CiAKLQlyID0g
a3ZtX2ZhdWx0aW5fcGZuKHZjcHUsIGZhdWx0LCBBQ0NfQUxMKTsKKwlyID0ga3ZtX21tdV9mYXVs
dGluX3Bmbih2Y3B1LCBmYXVsdCwgQUNDX0FMTCk7CiAJaWYgKHIgIT0gUkVUX1BGX0NPTlRJTlVF
KQogCQlyZXR1cm4gcjsKIApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL21tdS9tbXVfaW50ZXJu
YWwuaCBiL2FyY2gveDg2L2t2bS9tbXUvbW11X2ludGVybmFsLmgKaW5kZXggNjMzYWVkZWMzYzJl
Li41OWU2MDBmNmZmOWQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9tbXUvbW11X2ludGVybmFs
LmgKKysrIGIvYXJjaC94ODYva3ZtL21tdS9tbXVfaW50ZXJuYWwuaApAQCAtMjM1LDcgKzIzNSw3
IEBAIHN0cnVjdCBrdm1fcGFnZV9mYXVsdCB7CiAJLyogVGhlIG1lbXNsb3QgY29udGFpbmluZyBn
Zm4uIE1heSBiZSBOVUxMLiAqLwogCXN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3Q7CiAKLQkv
KiBPdXRwdXRzIG9mIGt2bV9mYXVsdGluX3Bmbi4gICovCisJLyogT3V0cHV0cyBvZiBrdm1fbW11
X2ZhdWx0aW5fcGZuKCkuICAqLwogCXVuc2lnbmVkIGxvbmcgbW11X3NlcTsKIAlrdm1fcGZuX3Qg
cGZuOwogCWJvb2wgbWFwX3dyaXRhYmxlOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL21tdS9w
YWdpbmdfdG1wbC5oIGIvYXJjaC94ODYva3ZtL21tdS9wYWdpbmdfdG1wbC5oCmluZGV4IDE0M2I3
ZTlmMjZkYy4uOWJkM2Q2ZjVkYjkxIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vbW11L3BhZ2lu
Z190bXBsLmgKKysrIGIvYXJjaC94ODYva3ZtL21tdS9wYWdpbmdfdG1wbC5oCkBAIC04MTIsNyAr
ODEyLDcgQEAgc3RhdGljIGludCBGTkFNRShwYWdlX2ZhdWx0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHN0cnVjdCBrdm1fcGFnZV9mYXVsdCAqZmF1bHQKIAlpZiAocikKIAkJcmV0dXJuIHI7CiAK
LQlyID0ga3ZtX2ZhdWx0aW5fcGZuKHZjcHUsIGZhdWx0LCB3YWxrZXIucHRlX2FjY2Vzcyk7CisJ
ciA9IGt2bV9tbXVfZmF1bHRpbl9wZm4odmNwdSwgZmF1bHQsIHdhbGtlci5wdGVfYWNjZXNzKTsK
IAlpZiAociAhPSBSRVRfUEZfQ09OVElOVUUpCiAJCXJldHVybiByOwogCi0tIAoyLjQ3LjAucmMx
LjI4OC5nMDYyOThkMTUyNS1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
