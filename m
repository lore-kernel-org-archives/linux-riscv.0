Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D63D24454
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 21:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yf6LdUuiXd5bHyMNW6zRVTvFx4hHgFJmXjR2s95IMWw=; b=U78Kji7OYbt8Nt
	LamJn/9JAFxqbHLPb7x7gZVkPzRNxL4iWvHQuJSN5yr1AiytX7VzvvFCr3pLTqfspwnKkn8Q1w0DC
	s3y2MScscG2Z0eEAaE6l3QKS1b+u6DPhLL6te4H4ExYazyldW1ae0ZFlnxsgIOmf0VMc/+wxIcobU
	KrKYDPGwEnJyaWZzNZIAtJ+bL57eN2Yiem4pHmrOWRueFLxTzWmq58Dfuc7xfOPzptae32fN32Uq9
	0THsB7j2KMLVT6MaK+gFtwxaOBUy+Wl545bDvxJapfpupLUfqTZMpi+axUlNZWXlZ/AmQT8nSsF5j
	7Rdyr/VL6ibsbUpoBihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0zM-0000000ESTy-0iAq;
	Thu, 10 Oct 2024 21:46:28 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsD-0000000DrC1-4AVD
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:56 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2e2bac0c38aso1505569a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584812; x=1729189612; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6S7ecEpHeP2pNYK74CcyfNjVxKIOVPI1u0giMU3AdU=;
        b=Tuq8jkdyupHP826P5bLjfoLYxHZeD/rX8rWQA7Q8ZEMCeDRAxuIwjVqa40D00ztFy+
         D2mzL2FwoGdy9Y/Zmc9BOowAx/frGlZMdf9np48O+Abjk+HSQ8te8uSbkGaO+iXzsKte
         5kwzt6k+5tFWim+CNFlXXNaVBlBDWjqVnLWP+hMDO9SIN+dnSIgvcfkYQUAyfOB42RJ+
         gnVrEAThIhugh/52odDRt13phaIvxB1EuFKBb2MgPPMXJDRyW7wjwfkJnPK/O46Cls14
         kti4++RxaaPlgzg9f/fpqZUZf4UJe/oCupqUIDVWRpDygUJokX5Sf1I+q/Rq2nmvNSE+
         rlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584812; x=1729189612;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L6S7ecEpHeP2pNYK74CcyfNjVxKIOVPI1u0giMU3AdU=;
        b=m6oyKg5tryATnzChwDtBFpXyEJN03J2hxE4TaIG2aUjFrfFEqNI8RWnp7PVMNLDUPU
         GOEt32DcJg/2Ou2n3UdaKVwgO3thHLbl+gIJ+1UBfXBR1pHG1x4IK896Dgk3ylrTzA9s
         BzHkSXrjU52SusHGYWOacQGNArKan2CMH2jSmtONGoJPKD47Z2oTZzxxdn1PN/c99Prb
         TBH4zSR78LrsB46IKIhvKIbnU02TKNwVWi8nMTotOycvMxLeSpfiXZylD7BFgX++/HlP
         5YQ4gZleryqhYveSwIk6mEz7q9s084t5xeLdymFNLqTVn29ZM7TwRnI30mpD36VB1ZhQ
         FE3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbgItaBnN17vPw4x/h/tKFg0Bd1YTErIlrVq9a2dztCs49zGot0+r4ovP4iEFKmOdzS8uz1V1Lyr6xyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKJIIm/Anc+q+4bBRZt0kauGBCyUmasiQbgKwbsZrNEeZFyPG1
	aOl0UKplMWB9yLjM1BgVx1ae+QSB5AbxAunGUe7LhPktT3H86FUbb7+lkiTaPksS5bHEeY0H3WH
	R6A==
X-Google-Smtp-Source: AGHT+IFNqFi+zU38KeaNCnXXdZA3xW66mqPsBP1LkkibZO//JxtU2HWKMaWXgt9tHH1pSDOFY+ZWY6Gk4GE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4f4b:b0:2d8:bf47:947c with SMTP id
 98e67ed59e1d1-2e2f0c456f8mr35a91.3.1728584812033; Thu, 10 Oct 2024 11:26:52
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:58 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-57-seanjc@google.com>
Subject: [PATCH v13 56/85] KVM: arm64: Use __kvm_faultin_pfn() to handle
 memory aborts
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
X-CRM114-CacheID: sfid-20241010_112654_122325_09D79196 
X-CRM114-Status: GOOD (  11.04  )
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

Q29udmVydCBhcm02NCB0byB1c2UgX19rdm1fZmF1bHRpbl9wZm4oKStrdm1fcmVsZWFzZV9mYXVs
dGluX3BhZ2UoKS4KVGhyZWUgZG93biwgc2l4IHRvIGdvLgoKVGVzdGVkLWJ5OiBBbGV4IEJlbm7D
qWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3Bo
ZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgotLS0KIGFyY2gvYXJtNjQva3ZtL21tdS5jIHwgMTUg
KysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva3ZtL21tdS5jIGIvYXJjaC9hcm02NC9r
dm0vbW11LmMKaW5kZXggZWNjNmMyYjU2YzQzLi40MDU0MzU2Yzk3MTIgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtNjQva3ZtL21tdS5jCisrKyBiL2FyY2gvYXJtNjQva3ZtL21tdS5jCkBAIC0xNDM5LDYg
KzE0MzksNyBAQCBzdGF0aWMgaW50IHVzZXJfbWVtX2Fib3J0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgcGh5c19hZGRyX3QgZmF1bHRfaXBhLAogCWxvbmcgdm1hX3BhZ2VzaXplLCBmYXVsdF9ncmFu
dWxlOwogCWVudW0ga3ZtX3BndGFibGVfcHJvdCBwcm90ID0gS1ZNX1BHVEFCTEVfUFJPVF9SOwog
CXN0cnVjdCBrdm1fcGd0YWJsZSAqcGd0OworCXN0cnVjdCBwYWdlICpwYWdlOwogCiAJaWYgKGZh
dWx0X2lzX3Blcm0pCiAJCWZhdWx0X2dyYW51bGUgPSBrdm1fdmNwdV90cmFwX2dldF9wZXJtX2Zh
dWx0X2dyYW51bGUodmNwdSk7CkBAIC0xNTYwLDcgKzE1NjEsNyBAQCBzdGF0aWMgaW50IHVzZXJf
bWVtX2Fib3J0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgcGh5c19hZGRyX3QgZmF1bHRfaXBhLAog
CiAJLyoKIAkgKiBSZWFkIG1tdV9pbnZhbGlkYXRlX3NlcSBzbyB0aGF0IEtWTSBjYW4gZGV0ZWN0
IGlmIHRoZSByZXN1bHRzIG9mCi0JICogdm1hX2xvb2t1cCgpIG9yIF9fZ2ZuX3RvX3Bmbl9tZW1z
bG90KCkgYmVjb21lIHN0YWxlIHByaW9yIHRvCisJICogdm1hX2xvb2t1cCgpIG9yIF9fa3ZtX2Zh
dWx0aW5fcGZuKCkgYmVjb21lIHN0YWxlIHByaW9yIHRvCiAJICogYWNxdWlyaW5nIGt2bS0+bW11
X2xvY2suCiAJICoKIAkgKiBSZWx5IG9uIG1tYXBfcmVhZF91bmxvY2soKSBmb3IgYW4gaW1wbGlj
aXQgc21wX3JtYigpLCB3aGljaCBwYWlycwpAQCAtMTU2OSw4ICsxNTcwLDggQEAgc3RhdGljIGlu
dCB1c2VyX21lbV9hYm9ydChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHBoeXNfYWRkcl90IGZhdWx0
X2lwYSwKIAltbXVfc2VxID0gdmNwdS0+a3ZtLT5tbXVfaW52YWxpZGF0ZV9zZXE7CiAJbW1hcF9y
ZWFkX3VubG9jayhjdXJyZW50LT5tbSk7CiAKLQlwZm4gPSBfX2dmbl90b19wZm5fbWVtc2xvdCht
ZW1zbG90LCBnZm4sIGZhbHNlLCBOVUxMLAotCQkJCSAgIHdyaXRlX2ZhdWx0LCAmd3JpdGFibGUp
OworCXBmbiA9IF9fa3ZtX2ZhdWx0aW5fcGZuKG1lbXNsb3QsIGdmbiwgd3JpdGVfZmF1bHQgPyBG
T0xMX1dSSVRFIDogMCwKKwkJCQkmd3JpdGFibGUsICZwYWdlKTsKIAlpZiAocGZuID09IEtWTV9Q
Rk5fRVJSX0hXUE9JU09OKSB7CiAJCWt2bV9zZW5kX2h3cG9pc29uX3NpZ25hbChodmEsIHZtYV9z
aGlmdCk7CiAJCXJldHVybiAwOwpAQCAtMTU4Myw3ICsxNTg0LDcgQEAgc3RhdGljIGludCB1c2Vy
X21lbV9hYm9ydChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHBoeXNfYWRkcl90IGZhdWx0X2lwYSwK
IAkJICogSWYgdGhlIHBhZ2Ugd2FzIGlkZW50aWZpZWQgYXMgZGV2aWNlIGVhcmx5IGJ5IGxvb2tp
bmcgYXQKIAkJICogdGhlIFZNQSBmbGFncywgdm1hX3BhZ2VzaXplIGlzIGFscmVhZHkgcmVwcmVz
ZW50aW5nIHRoZQogCQkgKiBsYXJnZXN0IHF1YW50aXR5IHdlIGNhbiBtYXAuICBJZiBpbnN0ZWFk
IGl0IHdhcyBtYXBwZWQKLQkJICogdmlhIGdmbl90b19wZm5fcHJvdCgpLCB2bWFfcGFnZXNpemUg
aXMgc2V0IHRvIFBBR0VfU0laRQorCQkgKiB2aWEgX19rdm1fZmF1bHRpbl9wZm4oKSwgdm1hX3Bh
Z2VzaXplIGlzIHNldCB0byBQQUdFX1NJWkUKIAkJICogYW5kIG11c3Qgbm90IGJlIHVwZ3JhZGVk
LgogCQkgKgogCQkgKiBJbiBib3RoIGNhc2VzLCB3ZSBkb24ndCBsZXQgdHJhbnNwYXJlbnRfaHVn
ZXBhZ2VfYWRqdXN0KCkKQEAgLTE2OTIsMTEgKzE2OTMsNyBAQCBzdGF0aWMgaW50IHVzZXJfbWVt
X2Fib3J0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgcGh5c19hZGRyX3QgZmF1bHRfaXBhLAogCX0K
IAogb3V0X3VubG9jazoKLQlpZiAod3JpdGFibGUgJiYgIXJldCkKLQkJa3ZtX3JlbGVhc2VfcGZu
X2RpcnR5KHBmbik7Ci0JZWxzZQotCQlrdm1fcmVsZWFzZV9wZm5fY2xlYW4ocGZuKTsKLQorCWt2
bV9yZWxlYXNlX2ZhdWx0aW5fcGFnZShrdm0sIHBhZ2UsICEhcmV0LCB3cml0YWJsZSk7CiAJcmVh
ZF91bmxvY2soJmt2bS0+bW11X2xvY2spOwogCiAJLyogTWFyayB0aGUgcGFnZSBkaXJ0eSBvbmx5
IGlmIHRoZSBmYXVsdCBpcyBoYW5kbGVkIHN1Y2Nlc3NmdWxseSAqLwotLSAKMi40Ny4wLnJjMS4y
ODguZzA2Mjk4ZDE1MjUtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
