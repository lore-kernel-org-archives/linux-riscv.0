Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8FFCFC5F9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/hohgjh6yrJlZ3SghbJ2GQxy58R3QDiQB1iDQ7epI0=; b=FV4xLbHH9Hh3js
	U4M6mLNJiOfG8DSkT83IJrVBua4ngQb40H7iekyB3na6BvBTQfUCiZGq7SZZRCqYlII+leqKYgoYN
	Bzb2cPV9KmgcxWsTc4gdGN3PUKc6bissv0vz7mi46ctrKfkhJBaVgMx894CsUEsV5VmUqIfFG341A
	eYEKpPP6VTi9XM6oqaDZDzq+nYOX7NruNj+CKbowB7ZNQYg72PLfzO2fta8RKJkdoUo0YQvR2dCQ8
	igJCusluQXAfo30Pj9EmkE0MxcKj8A1Fq5CeGJyYT88q/mH7+8HMSuSp6dwqHqo08V+FLEmnXLJGM
	NOBxTcMhlrotJTMpiN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyb6-0000000E4SF-0wmH;
	Thu, 10 Oct 2024 19:13:16 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrd-0000000DqhR-11Xo
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:18 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-71e0228d71dso1225410b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584776; x=1729189576; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAJaAoo95YXsHy4joQlb4gblEl3cKLpcYsG4EH0XckI=;
        b=agto7fsVBUrNPJE79ZqKdKpL56Mwp4ggAufpi3aobdfUMqqDLiZePIEDWdZdbEiu8K
         t8r+5OhPjz9fgq16P3VlDF8eKhXvyvPklbZFKypYRoc2ct12HZqqWkaTgun7QUkTKvO0
         dNyxvyCqVBkkl2G1Bynvde5QJxv86Iskrfv+necqUnTYkwOORvwd+LUfpSQyTp0tj4Sn
         95J2lIFDA5QKqrewiHle9ipChsR0tw7IP8b/yIlAW8KtmlUhkkMxFmnnZ46aKVXuB3E5
         DiwGOd4HYAa8c2P85NmCinCOH65of45ssCv3+8jc/ZLu/J3Rq2BD6TCXI3hQ2zqYzUeN
         Fidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584776; x=1729189576;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GAJaAoo95YXsHy4joQlb4gblEl3cKLpcYsG4EH0XckI=;
        b=fAj0VHZ6O7hFRvs9qCZ7NhX8AU2Cvz8imjecXb1ahWrW5qbgiBMuofPgXn4EW19KC0
         ISro3i7PySTEK7FYiP2wNQQYn1sq2Md11OHbnmlBC9kdt3dC8H88X8W8uiWb/RX2NUSV
         E4MC4YntX0oG+UUw89UuKV2jKs4zgoz1CtzqlA5pKV1JlMNFfTKY62jPuRSJCmuWZVYS
         QNkTpZBFgy8dEaI/Kj9bu+Mi2H9WKyaSnjlWfqz9Wo9XuUjLSxPoHn2DAxvyR75x2QH5
         CvKJGXqgDnAHDqYTvtgLqUiEQAQMg7ne+IsE2REunrWoQC1tHHII9wEk8KzaK5l2ezdI
         NuRw==
X-Forwarded-Encrypted: i=1; AJvYcCXGl70ehNd8s0rdHhEPy5odhwgnRLszgw6vzfsDlUpAxxopHIwLyol9LRRxZ+V7QHbCRHSzOG8Kj1z7wg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwA/ume4Z9DG7AxK47mCl6qccpxoHthOupddBvdad2D8q7XZoTi
	rp88CkwoX66oVZrnVRxnsTe6zR0tHNASZwuFRngZyHrIeHBi8GqjbNpcPe9kPh7+3LfSSFjGe7Y
	8fw==
X-Google-Smtp-Source: AGHT+IEXxr/4vsCtgUsUHHkctm5xGRqb6tsNipBtkL7vgMjj75AzVZauqGsQqnffIf336Hhi8e9e6vZrhMQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:aa7:9184:0:b0:71d:f7c9:8cb3 with SMTP id
 d2e1a72fcca58-71e1dbf1ab5mr7792b3a.5.1728584775458; Thu, 10 Oct 2024 11:26:15
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:42 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-41-seanjc@google.com>
Subject: [PATCH v13 40/85] KVM: x86/mmu: Add helper to "finish" handling a
 guest page fault
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
X-CRM114-CacheID: sfid-20241010_112617_336025_0F2270AB 
X-CRM114-Status: GOOD (  10.21  )
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

QWRkIGEgaGVscGVyIHRvIGZpbmlzaC9jb21wbGV0ZSB0aGUgaGFuZGxpbmcgb2YgYSBndWVzdCBw
YWdlLCBlLmcuIHRvCm1hcmsgdGhlIHBhZ2VzIGFjY2Vzc2VkIGFuZCBwdXQgYW55IGhlbGQgcmVm
ZXJlbmNlcy4gIEluIHRoZSBuZWFyCmZ1dHVyZSwgdGhpcyB3aWxsIGFsbG93IGltcHJvdmluZyB0
aGUgbG9naWMgd2l0aG91dCBoYXZpbmcgdG8gY29weStwYXN0ZQpjaGFuZ2VzIGludG8gYWxsIHBh
Z2UgZmF1bHQgcGF0aHMuICBBbmQgaW4gdGhlIGxlc3MgbmVhciBmdXR1cmUsIHdpbGwKYWxsb3cg
c2hhcmluZyB0aGUgImZpbmlzaCIgQVBJIGFjcm9zcyBhbGwgYXJjaGl0ZWN0dXJlcy4KCk5vIGZ1
bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgoKVGVzdGVkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXgu
YmVubmVlQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPgotLS0KIGFyY2gveDg2L2t2bS9tbXUvbW11LmMgICAgICAgICB8IDEy
ICsrKysrKysrKy0tLQogYXJjaC94ODYva3ZtL21tdS9wYWdpbmdfdG1wbC5oIHwgIDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9rdm0vbW11L21tdS5jIGIvYXJjaC94ODYva3ZtL21tdS9tbXUuYwppbmRl
eCA2NWQzYTYwMmViMmMuLjMxYTZhZTQxYTZmNCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL21t
dS9tbXUuYworKysgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCkBAIC00MzU3LDYgKzQzNTcsMTIg
QEAgc3RhdGljIHU4IGt2bV9tYXhfcHJpdmF0ZV9tYXBwaW5nX2xldmVsKHN0cnVjdCBrdm0gKmt2
bSwga3ZtX3Bmbl90IHBmbiwKIAlyZXR1cm4gbWF4X2xldmVsOwogfQogCitzdGF0aWMgdm9pZCBr
dm1fbW11X2ZpbmlzaF9wYWdlX2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKKwkJCQkgICAg
ICBzdHJ1Y3Qga3ZtX3BhZ2VfZmF1bHQgKmZhdWx0LCBpbnQgcikKK3sKKwlrdm1fcmVsZWFzZV9w
Zm5fY2xlYW4oZmF1bHQtPnBmbik7Cit9CisKIHN0YXRpYyBpbnQga3ZtX21tdV9mYXVsdGluX3Bm
bl9wcml2YXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAkJCQkgICAgICAgc3RydWN0IGt2bV9w
YWdlX2ZhdWx0ICpmYXVsdCkKIHsKQEAgLTQ1MjIsNyArNDUyOCw3IEBAIHN0YXRpYyBpbnQga3Zt
X21tdV9mYXVsdGluX3BmbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJICogbW11X2xvY2sgaXMg
YWNxdWlyZWQuCiAJICovCiAJaWYgKG1tdV9pbnZhbGlkYXRlX3JldHJ5X2dmbl91bnNhZmUodmNw
dS0+a3ZtLCBmYXVsdC0+bW11X3NlcSwgZmF1bHQtPmdmbikpIHsKLQkJa3ZtX3JlbGVhc2VfcGZu
X2NsZWFuKGZhdWx0LT5wZm4pOworCQlrdm1fbW11X2ZpbmlzaF9wYWdlX2ZhdWx0KHZjcHUsIGZh
dWx0LCBSRVRfUEZfUkVUUlkpOwogCQlyZXR1cm4gUkVUX1BGX1JFVFJZOwogCX0KIApAQCAtNDU5
OCw4ICs0NjA0LDggQEAgc3RhdGljIGludCBkaXJlY3RfcGFnZV9mYXVsdChzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsIHN0cnVjdCBrdm1fcGFnZV9mYXVsdCAqZmF1bHQKIAlyID0gZGlyZWN0X21hcCh2
Y3B1LCBmYXVsdCk7CiAKIG91dF91bmxvY2s6CisJa3ZtX21tdV9maW5pc2hfcGFnZV9mYXVsdCh2
Y3B1LCBmYXVsdCwgcik7CiAJd3JpdGVfdW5sb2NrKCZ2Y3B1LT5rdm0tPm1tdV9sb2NrKTsKLQlr
dm1fcmVsZWFzZV9wZm5fY2xlYW4oZmF1bHQtPnBmbik7CiAJcmV0dXJuIHI7CiB9CiAKQEAgLTQ2
ODUsOCArNDY5MSw4IEBAIHN0YXRpYyBpbnQga3ZtX3RkcF9tbXVfcGFnZV9mYXVsdChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsCiAJciA9IGt2bV90ZHBfbW11X21hcCh2Y3B1LCBmYXVsdCk7CiAKIG91
dF91bmxvY2s6CisJa3ZtX21tdV9maW5pc2hfcGFnZV9mYXVsdCh2Y3B1LCBmYXVsdCwgcik7CiAJ
cmVhZF91bmxvY2soJnZjcHUtPmt2bS0+bW11X2xvY2spOwotCWt2bV9yZWxlYXNlX3Bmbl9jbGVh
bihmYXVsdC0+cGZuKTsKIAlyZXR1cm4gcjsKIH0KICNlbmRpZgpkaWZmIC0tZ2l0IGEvYXJjaC94
ODYva3ZtL21tdS9wYWdpbmdfdG1wbC5oIGIvYXJjaC94ODYva3ZtL21tdS9wYWdpbmdfdG1wbC5o
CmluZGV4IGE0NzZhNTQyODAxNy4uMzVkMGMzZjFhNzg5IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9r
dm0vbW11L3BhZ2luZ190bXBsLmgKKysrIGIvYXJjaC94ODYva3ZtL21tdS9wYWdpbmdfdG1wbC5o
CkBAIC04MzYsOCArODM2LDggQEAgc3RhdGljIGludCBGTkFNRShwYWdlX2ZhdWx0KShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcGFnZV9mYXVsdCAqZmF1bHQKIAlyID0gRk5BTUUo
ZmV0Y2gpKHZjcHUsIGZhdWx0LCAmd2Fsa2VyKTsKIAogb3V0X3VubG9jazoKKwlrdm1fbW11X2Zp
bmlzaF9wYWdlX2ZhdWx0KHZjcHUsIGZhdWx0LCByKTsKIAl3cml0ZV91bmxvY2soJnZjcHUtPmt2
bS0+bW11X2xvY2spOwotCWt2bV9yZWxlYXNlX3Bmbl9jbGVhbihmYXVsdC0+cGZuKTsKIAlyZXR1
cm4gcjsKIH0KIAotLSAKMi40Ny4wLnJjMS4yODguZzA2Mjk4ZDE1MjUtZ29vZwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
