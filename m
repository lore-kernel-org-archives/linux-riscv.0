Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8E5CFC5F9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+kfG9DgsKWE1QG4Eq/byBdu8SNPmXP5QO3fNGCa8Ok=; b=hhekYX7zpBd1Af
	6618tZY1LDH8KOtwZRv5soFinsrUcLDAv2Zv7Ndx12g+Lsy5nRmgPp1khj4rIdcWsOPordB9M9hPC
	ZAoWOw9lNG+H0fD3CBDpriGhXmX+wNP8UxfI9R5dri08uQGkYc+Q+t+5M+xAUFnm56PDqsf33aGi+
	XQ1Hj3P0+oflSCPKq9JEOFQDtRMCAoS+5SZURzrWarojvUFK6CwcwKILFTaqD9een8eWVrXByXM05
	7b3WkliwHPLM2eMD7L4MH7M/7IErd8VZrt3Q6oRqwt9nrorOPH/tnumMesLotWGelYEmFBpmhqLqJ
	f7k5OSDIGgXRli9jZfZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyjQ-0000000E5Zy-3Gfl;
	Thu, 10 Oct 2024 19:21:52 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrv-0000000DqwN-1o6d
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:36 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e2e4874925so21251437b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584794; x=1729189594; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BN+hsHae4h8wzhzshUJRGKM30XxzO0F311sC9z4rUGc=;
        b=mFEQ1pk0GSblJlbvVxjSomWrM6IE+btPApHqV5NrilXRXoFJJ2QtCA8C3DRzZU638K
         fGwnvg2LFw4lj/o2cvU/G8+4i1rkmzmCYJ+K8kAtgcwfRhJdswGO4ZjYFmc0fOpnGAaO
         qM8T1NUyZqa09HXc5T1Ol762RIpMtB9T2BxUQSneDHsTS4aPWVdavwKvZRgVyE0BRFlK
         J2q6XJotNBexnIBUs1cGiNgPYYBQ8CryEKe7aIWrWBYO5N0YgHcBVCFW6MVxRz/ypuMy
         GI2HAbh6rArHdBxq4xWdbR4NHv2mRM+UDfic7XIfgYAex/UlvCHyl6arPi0UFMRFcmya
         8iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584794; x=1729189594;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BN+hsHae4h8wzhzshUJRGKM30XxzO0F311sC9z4rUGc=;
        b=kwLtYtPH9kC97pnEJWI8/Hk8NT5idk5ghw716bD0fLNT1xmNsANU3thZrIhcShdKBV
         kLH797qai++XZhII5Xe2Tbm8rPXmdMB405NlUdI6rkJEpBcv0I4AVUpaimTvpwBVs/rW
         ZrF7iBTg7L+JWPd3J6X+hL45CsYfieTnsD/8/vO9NYl8jaF3xEjwUS6ytHmPDXz9Jf6O
         HRTNFwwuG5SeiS5lAr5YoawwKBlHNqwNg9YuWtbg9QvatZVAZJ/dLT35/ZW8qWnyD+m+
         ucTe38h8uDJ2AZ6QJSJmJu8iZTah5ZpMVmnEz6xeiEUZe4kcBiQO3oZ567+J4yAc2kbd
         iNNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6oSmZkZfHJ099hCZuA/6pljZQLmZLYScv50R1hGlY/M+Gm5bnOdzfC6bXrS3JQSrSqZp59nygI2M4PQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+smQTg9AYa38NZjynDuOk+Fu6KDzBptl0W5JK+xo5uuRwm6n+
	9qQpMzrgpClr073Ns/DggzN9pJeEgpMANT0Bg4KFr2qzCpwsrVpRedCvs/99K2ecEryJf+2zA5u
	92w==
X-Google-Smtp-Source: AGHT+IEjw5s9ln5Mmco0bHKHDYNNIWwRc71SIREcZZABOz/fcRYPRAU5+BeNEqASF/uZrX6+QTap8C7eoHE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2c01:b0:6e2:3e17:1838 with SMTP id
 00721157ae682-6e3221407b0mr440167b3.1.1728584793806; Thu, 10 Oct 2024
 11:26:33 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:50 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-49-seanjc@google.com>
Subject: [PATCH v13 48/85] KVM: x86/mmu: Don't mark unused faultin pages as accessed
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
X-CRM114-CacheID: sfid-20241010_112635_500860_87311F51 
X-CRM114-Status: GOOD (  11.86  )
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

V2hlbiBmaW5pc2hpbmcgZ3Vlc3QgcGFnZSBmYXVsdHMsIGRvbid0IG1hcmsgcGFnZXMgYXMgYWNj
ZXNzZWQgaWYgS1ZNCmlzIHJlc3VtaW5nIHRoZSBndWVzdCBfd2l0aG91dF8gaW5zdGFsbGluZyBh
IG1hcHBpbmcsIGkuZS4gaWYgdGhlIHBhZ2UKaXNuJ3QgYmVpbmcgdXNlZC4gIFdoaWxlIGl0J3Mg
cG9zc2libGUgdGhhdCBtYXJraW5nIHRoZSBwYWdlIGFjY2Vzc2VkCmNvdWxkIGF2b2lkIG1pbm9y
IHRocmFzaGluZyBkdWUgdG8gcmVjbGFpbWluZyBhIHBhZ2UgdGhhdCB0aGUgZ3Vlc3QgaXMKYWJv
dXQgdG8gYWNjZXNzLCBpdCdzIGZhciBtb3JlIGxpa2VseSB0aGF0IHRoZSBnZm49PnBmbiBtYXBw
aW5nIHdhcwp3YXMgaW52YWxpZGF0ZWQsIGUuZy4gZHVlIGEgbWVtc2xvdCBjaGFuZ2UsIG9yIGJl
Y2F1c2UgdGhlIGNvcnJlc3BvbmRpbmcKVk1BIGlzIGJlaW5nIG1vZGlmaWVkLgoKVGVzdGVkLWJ5
OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFNl
YW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgotLS0KIGFyY2gveDg2L2t2bS9t
bXUvbW11LmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vbW11L21tdS5jIGIvYXJjaC94ODYv
a3ZtL21tdS9tbXUuYwppbmRleCBmOWI3ZTNhNzM3MGYuLmUxNGI4NGQyZjU1YiAxMDA2NDQKLS0t
IGEvYXJjaC94ODYva3ZtL21tdS9tbXUuYworKysgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCkBA
IC00Mzg2LDcgKzQzODYsOSBAQCBzdGF0aWMgdm9pZCBrdm1fbW11X2ZpbmlzaF9wYWdlX2ZhdWx0
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAkgKiBmYXVsdCBoYW5kbGVyLCBhbmQgc28gS1ZNIG11
c3QgKHNvbWV3aGF0KSBzcGVjdWxhdGl2ZWx5IG1hcmsgdGhlCiAJICogZm9saW8gZGlydHkgaWYg
S1ZNIGNvdWxkIGxvY2tsZXNzbHkgbWFrZSB0aGUgU1BURSB3cml0YWJsZS4KIAkgKi8KLQlpZiAo
IWZhdWx0LT5tYXBfd3JpdGFibGUgfHwgciA9PSBSRVRfUEZfUkVUUlkpCisJaWYgKHIgPT0gUkVU
X1BGX1JFVFJZKQorCQlrdm1fcmVsZWFzZV9wYWdlX3VudXNlZChmYXVsdC0+cmVmY291bnRlZF9w
YWdlKTsKKwllbHNlIGlmICghZmF1bHQtPm1hcF93cml0YWJsZSkKIAkJa3ZtX3JlbGVhc2VfcGFn
ZV9jbGVhbihmYXVsdC0+cmVmY291bnRlZF9wYWdlKTsKIAllbHNlCiAJCWt2bV9yZWxlYXNlX3Bh
Z2VfZGlydHkoZmF1bHQtPnJlZmNvdW50ZWRfcGFnZSk7Ci0tIAoyLjQ3LjAucmMxLjI4OC5nMDYy
OThkMTUyNS1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
