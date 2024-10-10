Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CA4D2444F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 20:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDJzg/rExKHDP4gATntrLwP0JYFHE9qDcQgQGlLeHZU=; b=fQLTFQbXhCiHEy
	G68EYmu2ztytWZlJPpwSp5nkBcVArT2PFaHrI/GxKzyWmr+yPHDx+48WV6xmg9mEsI+uprp+bz896
	QMGavCqinGHotPyQzPnObQjtcmZfxkyOuGcE6KlDa2scAuM7j0bdlY0ETBLLw/QrT4Zq4aC5QE2HJ
	lFEzeWHReNfZGpsUniMOvSzsYZf81QYoxMue/+JokTw6i5iHQp8orWA10GBLRqJ9tL2BYAYy2l+XI
	hkVM+ahn1L608zAoVncvQYXuokz1KqygV/e/1SsDU2o9HdQyiOFBI4nlwOdQlbcoku5hiKcWDbDYx
	metSg9/opIBp3HwJLKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzom-0000000EGpR-29MQ;
	Thu, 10 Oct 2024 20:31:28 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrx-0000000DqyO-39Em
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:41 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7b696999c65so863532a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584796; x=1729189596; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndpfmsd07O3XHkbROvy9SWySHpmtrF0LUOG5EHCQjAE=;
        b=4HGW8f7tjownBfYqPr3g4q5rap4pEjc4NDH2XoQtWUJmNugApsKx93exzBPNkaqmo7
         22HQMvd+Q4rL+NUcId2bgBlZd7JTUfOuTG+AaGGp5/MieBVOiymMRBah3+emzZqc2o47
         EaCg48mEguoYCSN3ZQZnwHaOSKoILqP3AFoA8aYxTJ9yw2yQTyuvbig92YQxp/aOz8iq
         L7zSmYRy7UmWkkcy15/lY4+BC2929WmoIEeZ+DilgVBJARphsvEY2zJXni0FF0XUYOSc
         OlRUp7qqzox27rKuo+WQQnNLhRVDeqO+GFbPztsLp2jp1XWndoR4wUm2paLbo9oPpwYg
         FXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584796; x=1729189596;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ndpfmsd07O3XHkbROvy9SWySHpmtrF0LUOG5EHCQjAE=;
        b=hQ1RrE2mkjQY1GyDcZBZorC7kvBG3334cpmBiwDyznojzkmYIvvDSySuOHuv2s/IW7
         zLGB9TjlSIDc4cT7ag2xxMUU1V1xFiRgm62ruUSfHkPupYkwsLVu/WLCkGZKN5H+/hBt
         7QDKXxLdlHX9XtVzM2N4YlVsARa2b5GxYpUIKCVtHZtvJ8ZA7cbT00/DAfmqjqVkgrE3
         cU5qcwSzZs7nEabucmssshonPF+k6GrJENT4jwFt1q44fQuHbz0oHQa/V1sb5sgwdm7B
         fsmsskY/hOxrss9cZRFbX4ZN/Q8j3jwzmlLRw9VRjKgBMMPBaeb5BCr7CoYL8IBS0VD/
         2LAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMQosOI81BWnT0iwy1gIXnQaJkMKErDlKejYbigCtEM5HDzGYQAWUkGRicByVsQJOMpIX8ME2VQ67xcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKwiHvY4kU4oTW5OoVf7lNP4C6dttCmIZZ8B5UtgI1PB45Al6K
	zbCtPfg8GsbQENMFyRYYn3uRj2aF4LNitPbLHM5IAauh7G/zZRBn4ZIBM+p1NnSOarBlpIov4pg
	lMw==
X-Google-Smtp-Source: AGHT+IGJc8hgBZq6lOovV4Dgly5ctIXEs7jDnJfEupYxVqninaLorgqTg5WNW0BPJZYnJnHdEtp0yWaf7UM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a65:450a:0:b0:717:a912:c302 with SMTP id
 41be03b00d2f7-7ea53525e73mr49a12.1.1728584796119; Thu, 10 Oct 2024 11:26:36
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:51 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-50-seanjc@google.com>
Subject: [PATCH v13 49/85] KVM: Move x86's API to release a faultin page to
 common KVM
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
X-CRM114-CacheID: sfid-20241010_112637_877617_873E8817 
X-CRM114-Status: GOOD (  14.78  )
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

TW92ZSBLVk0geDg2J3MgaGVscGVyIHRoYXQgImZpbmlzaGVzIiB0aGUgZmF1bHRpbiBwcm9jZXNz
IHRvIGNvbW1vbiBLVk0Kc28gdGhhdCB0aGUgbG9naWMgY2FuIGJlIHNoYXJlZCBhY3Jvc3MgYWxs
IGFyY2hpdGVjdHVyZXMuICBOb3RlLCBub3QgYWxsCmFyY2hpdGVjdHVyZXMgaW1wbGVtZW50IGEg
ZmFzdCBwYWdlIGZhdWx0IHBhdGgsIGJ1dCB0aGUgZ2lzdCBvZiB0aGUKY29tbWVudCBhcHBsaWVz
IHRvIGFsbCBhcmNoaXRlY3R1cmVzLgoKVGVzdGVkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVu
bmVlQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5q
Y0Bnb29nbGUuY29tPgotLS0KIGFyY2gveDg2L2t2bS9tbXUvbW11LmMgICB8IDI0ICsrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQogaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIHwgMjYgKysrKysrKysr
KysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMjIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL21tdS9tbXUuYyBiL2FyY2gv
eDg2L2t2bS9tbXUvbW11LmMKaW5kZXggZTE0Yjg0ZDJmNTViLi41YWNkYWYzYjEwMDcgMTAwNjQ0
Ci0tLSBhL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKKysrIGIvYXJjaC94ODYva3ZtL21tdS9tbXUu
YwpAQCAtNDM3MCwyOCArNDM3MCw4IEBAIHN0YXRpYyB1OCBrdm1fbWF4X3ByaXZhdGVfbWFwcGlu
Z19sZXZlbChzdHJ1Y3Qga3ZtICprdm0sIGt2bV9wZm5fdCBwZm4sCiBzdGF0aWMgdm9pZCBrdm1f
bW11X2ZpbmlzaF9wYWdlX2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAkJCQkgICAgICBz
dHJ1Y3Qga3ZtX3BhZ2VfZmF1bHQgKmZhdWx0LCBpbnQgcikKIHsKLQlsb2NrZGVwX2Fzc2VydF9v
bmNlKGxvY2tkZXBfaXNfaGVsZCgmdmNwdS0+a3ZtLT5tbXVfbG9jaykgfHwKLQkJCSAgICByID09
IFJFVF9QRl9SRVRSWSk7Ci0KLQlpZiAoIWZhdWx0LT5yZWZjb3VudGVkX3BhZ2UpCi0JCXJldHVy
bjsKLQotCS8qCi0JICogSWYgdGhlIHBhZ2UgdGhhdCBLVk0gZ290IGZyb20gdGhlICpwcmltYXJ5
IE1NVSogaXMgd3JpdGFibGUsIGFuZCBLVk0KLQkgKiBpbnN0YWxsZWQgb3IgcmV1c2VkIGEgU1BU
RSwgbWFyayB0aGUgcGFnZS9mb2xpbyBkaXJ0eS4gIE5vdGUsIHRoaXMKLQkgKiBtYXkgbWFyayBh
IGZvbGlvIGRpcnR5IGV2ZW4gaWYgS1ZNIGNyZWF0ZWQgYSByZWFkLW9ubHkgU1BURSwgZS5nLiBp
ZgotCSAqIHRoZSBHRk4gaXMgd3JpdGUtcHJvdGVjdGVkLiAgRm9saW9zIGNhbid0IGJlIHNhZmVs
eSBtYXJrZWQgZGlydHkKLQkgKiBvdXRzaWRlIG9mIG1tdV9sb2NrIGFzIGRvaW5nIHNvIGNvdWxk
IHJhY2Ugd2l0aCB3cml0ZWJhY2sgb24gdGhlCi0JICogZm9saW8uICBBcyBhIHJlc3VsdCwgS1ZN
IGNhbid0IG1hcmsgZm9saW9zIGRpcnR5IGluIHRoZSBmYXN0IHBhZ2UKLQkgKiBmYXVsdCBoYW5k
bGVyLCBhbmQgc28gS1ZNIG11c3QgKHNvbWV3aGF0KSBzcGVjdWxhdGl2ZWx5IG1hcmsgdGhlCi0J
ICogZm9saW8gZGlydHkgaWYgS1ZNIGNvdWxkIGxvY2tsZXNzbHkgbWFrZSB0aGUgU1BURSB3cml0
YWJsZS4KLQkgKi8KLQlpZiAociA9PSBSRVRfUEZfUkVUUlkpCi0JCWt2bV9yZWxlYXNlX3BhZ2Vf
dW51c2VkKGZhdWx0LT5yZWZjb3VudGVkX3BhZ2UpOwotCWVsc2UgaWYgKCFmYXVsdC0+bWFwX3dy
aXRhYmxlKQotCQlrdm1fcmVsZWFzZV9wYWdlX2NsZWFuKGZhdWx0LT5yZWZjb3VudGVkX3BhZ2Up
OwotCWVsc2UKLQkJa3ZtX3JlbGVhc2VfcGFnZV9kaXJ0eShmYXVsdC0+cmVmY291bnRlZF9wYWdl
KTsKKwlrdm1fcmVsZWFzZV9mYXVsdGluX3BhZ2UodmNwdS0+a3ZtLCBmYXVsdC0+cmVmY291bnRl
ZF9wYWdlLAorCQkJCSByID09IFJFVF9QRl9SRVRSWSwgZmF1bHQtPm1hcF93cml0YWJsZSk7CiB9
CiAKIHN0YXRpYyBpbnQga3ZtX21tdV9mYXVsdGluX3Bmbl9wcml2YXRlKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1ZGUv
bGludXgva3ZtX2hvc3QuaAppbmRleCA1MDQ0ODNkMzUxOTcuLjlmNzY4MmVjZTRhMSAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCisrKyBiL2luY2x1ZGUvbGludXgva3ZtX2hv
c3QuaApAQCAtMTIzMSw2ICsxMjMxLDMyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1fcmVsZWFz
ZV9wYWdlX3VudXNlZChzdHJ1Y3QgcGFnZSAqcGFnZSkKIHZvaWQga3ZtX3JlbGVhc2VfcGFnZV9j
bGVhbihzdHJ1Y3QgcGFnZSAqcGFnZSk7CiB2b2lkIGt2bV9yZWxlYXNlX3BhZ2VfZGlydHkoc3Ry
dWN0IHBhZ2UgKnBhZ2UpOwogCitzdGF0aWMgaW5saW5lIHZvaWQga3ZtX3JlbGVhc2VfZmF1bHRp
bl9wYWdlKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IHBhZ2UgKnBhZ2UsCisJCQkJCSAgICBib29s
IHVudXNlZCwgYm9vbCBkaXJ0eSkKK3sKKwlsb2NrZGVwX2Fzc2VydF9vbmNlKGxvY2tkZXBfaXNf
aGVsZCgma3ZtLT5tbXVfbG9jaykgfHwgdW51c2VkKTsKKworCWlmICghcGFnZSkKKwkJcmV0dXJu
OworCisJLyoKKwkgKiBJZiB0aGUgcGFnZSB0aGF0IEtWTSBnb3QgZnJvbSB0aGUgKnByaW1hcnkg
TU1VKiBpcyB3cml0YWJsZSwgYW5kIEtWTQorCSAqIGluc3RhbGxlZCBvciByZXVzZWQgYSBTUFRF
LCBtYXJrIHRoZSBwYWdlL2ZvbGlvIGRpcnR5LiAgTm90ZSwgdGhpcworCSAqIG1heSBtYXJrIGEg
Zm9saW8gZGlydHkgZXZlbiBpZiBLVk0gY3JlYXRlZCBhIHJlYWQtb25seSBTUFRFLCBlLmcuIGlm
CisJICogdGhlIEdGTiBpcyB3cml0ZS1wcm90ZWN0ZWQuICBGb2xpb3MgY2FuJ3QgYmUgc2FmZWx5
IG1hcmtlZCBkaXJ0eQorCSAqIG91dHNpZGUgb2YgbW11X2xvY2sgYXMgZG9pbmcgc28gY291bGQg
cmFjZSB3aXRoIHdyaXRlYmFjayBvbiB0aGUKKwkgKiBmb2xpby4gIEFzIGEgcmVzdWx0LCBLVk0g
Y2FuJ3QgbWFyayBmb2xpb3MgZGlydHkgaW4gdGhlIGZhc3QgcGFnZQorCSAqIGZhdWx0IGhhbmRs
ZXIsIGFuZCBzbyBLVk0gbXVzdCAoc29tZXdoYXQpIHNwZWN1bGF0aXZlbHkgbWFyayB0aGUKKwkg
KiBmb2xpbyBkaXJ0eSBpZiBLVk0gY291bGQgbG9ja2xlc3NseSBtYWtlIHRoZSBTUFRFIHdyaXRh
YmxlLgorCSAqLworCWlmICh1bnVzZWQpCisJCWt2bV9yZWxlYXNlX3BhZ2VfdW51c2VkKHBhZ2Up
OworCWVsc2UgaWYgKGRpcnR5KQorCQlrdm1fcmVsZWFzZV9wYWdlX2RpcnR5KHBhZ2UpOworCWVs
c2UKKwkJa3ZtX3JlbGVhc2VfcGFnZV9jbGVhbihwYWdlKTsKK30KKwoga3ZtX3Bmbl90IF9fa3Zt
X2ZhdWx0aW5fcGZuKGNvbnN0IHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsIGdmbl90IGdm
biwKIAkJCSAgICB1bnNpZ25lZCBpbnQgZm9sbCwgYm9vbCAqd3JpdGFibGUsCiAJCQkgICAgc3Ry
dWN0IHBhZ2UgKipyZWZjb3VudGVkX3BhZ2UpOwotLSAKMi40Ny4wLnJjMS4yODguZzA2Mjk4ZDE1
MjUtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
