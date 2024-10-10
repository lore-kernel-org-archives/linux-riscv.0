Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CCDD2444F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 20:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RG7hhddPRSH0dwciXHH8gfzMg7L6eFvrYNkkp1ctLlI=; b=se3bkDwE9j60IJ
	QvnOF0VtKL1NWVfP+y7nPMaxgpYlK7uV097OjDGpDUbBuzKRDmyNBgvEqoMM7pXS+vi2WaNAKggbn
	xk9wvFpqxcNOGMGYZXjt9aB9YO9Obd7T6KUGp4n0CdME9+QAMQsd3l0HRROKPpXaG0SYSA//DmbiJ
	rKP1M6KocN07OnW2UtexcUBlKK0HxGmX2FZcz/qvZR32St8ijqkq2Cr2IXob1/nWsStD360M9WTvE
	747qNqoSMAjcJQmCkXwPhCoYdAvTFcjhN9ZsVl5RNxmbmhScYBKeHEsOZ77OcjP594xTm4EQBcAzE
	dtotOIMu+fm8TULs8IJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzoi-0000000EGmQ-48lw;
	Thu, 10 Oct 2024 20:31:24 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrk-0000000Dqnp-32Cn
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:26 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7e6e98892e1so1288241a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584784; x=1729189584; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O48RmE1hmLPs0qNEdPIh+k/rpCPu+e8A6GC4+tMXVMw=;
        b=tUX4W6o8HRVDNg2p6vKzVqKv4QtBGye1jr9W70enPs3WfdHdg/DAX4SGK3PXyvt/PU
         b7AYI/CL/BlJ+quKCLDQWnwM3l+DwmoJ38wzIZ0AUR/5qG3XbJ6uKyGqIGs7af000tzu
         Yw5mLr5FCn/tAEl9m+rbmGRIlmBjOVsDrIb/34VVROnkoIFIZoc77UW/hjwsWuFMrKWu
         /akxlANMKK8Zni3hn6A1as9i+vAkfXKoaefSt+xnuNgimIQ5h/U2840t3CpBs4rUac96
         3v9uJ9pPCbO+EtZ7MI416Oy4vh2RW3JLQnyfGXSyS7FkCqEOQLvRezcMeq0XiOM0Uyrt
         IWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584784; x=1729189584;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O48RmE1hmLPs0qNEdPIh+k/rpCPu+e8A6GC4+tMXVMw=;
        b=Bq7D6UBMGklSijpwdIeacKsnPnU34c9sMHXlo9Es/Xe55MiM/E1LvHb+PkfpHE5sUl
         Z0aLmfq63DwzrWBq332t9sHYidveTIEC19I3nsulsnnJ2uhx/bcvWFCmKVhb7/PvaWtF
         xC7nrR+SrYMWTwO6tFPRYJT/35OF5c6h6dLKHmVDJgmWcXkf9a1X0rZjLdg9TlbBoj2m
         t56tDsA+Hd6jh0wxyA+8kmvtYcvUmAj9zibg8mrBjAnp98kMip9hUjYSpDUp1rHiSDCh
         EC3OvbAZIwXnKnYvcZNOpFbIJJTZmgG8m6jiU9t9hVPiWI/W8Xz4/VXjd5XljmHQh1hM
         AfXA==
X-Forwarded-Encrypted: i=1; AJvYcCWbYXbSB37C/qel0ToL4NzJGFRiHb+G8m+QR2SUW/uICgYryilhysYCzQPAEx0fJRIbZDcRaxywgO8qLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXc3HZ8PjHlGJgmNtpL7RnRJAPCAjFc1xq68jNKmyD+5cqOBCP
	Chp9EF9HEmYM5oe33Ej0Ihq6iaL8UY6J5pLLeYIVl0woyjNvzi60R2cfzzLp2iykXWHoBY+tZmA
	SmA==
X-Google-Smtp-Source: AGHT+IGY3J0AFIsOlJbVDrqn6majLeEUOkcp3LAakwsbgSwDXT3SnAGgA9L20idMLdLGQvBeoRsHZDJxo50=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:2445:0:b0:75d:16f9:c075 with SMTP id
 41be03b00d2f7-7ea5359cd2amr19a12.9.1728584783356; Thu, 10 Oct 2024 11:26:23
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:46 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-45-seanjc@google.com>
Subject: [PATCH v13 44/85] KVM: x86/mmu: Convert page fault paths to kvm_faultin_pfn()
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
X-CRM114-CacheID: sfid-20241010_112624_810591_D76A17CA 
X-CRM114-Status: GOOD (  12.96  )
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

Q29udmVydCBLVk0geDg2IHRvIHVzZSB0aGUgcmVjZW50bHkgaW50cm9kdWNlZCBfX2t2bV9mYXVs
dGluX3BmbigpLgpPcHBvcnR1bnN0aWNhbGx5IGNhcHR1cmUgdGhlIHJlZmNvdW50ZWRfcGFnZSBn
cmFiYmVkIGJ5IEtWTSBmb3IgdXNlIGluCmZ1dHVyZSBjaGFuZ2VzLgoKTm8gZnVuY3Rpb25hbCBj
aGFuZ2UgaW50ZW5kZWQuCgpUZXN0ZWQtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGlu
YXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2ds
ZS5jb20+Ci0tLQogYXJjaC94ODYva3ZtL21tdS9tbXUuYyAgICAgICAgICB8IDE0ICsrKysrKysr
KystLS0tCiBhcmNoL3g4Ni9rdm0vbW11L21tdV9pbnRlcm5hbC5oIHwgIDEgKwogMiBmaWxlcyBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2t2bS9tbXUvbW11LmMgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCmluZGV4IGY3MzA4
NzA4ODdkZC4uMmUyMDc2Mjg3YWFmIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vbW11L21tdS5j
CisrKyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKQEAgLTQ0MTYsMTEgKzQ0MTYsMTQgQEAgc3Rh
dGljIGludCBrdm1fbW11X2ZhdWx0aW5fcGZuX3ByaXZhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LAogc3RhdGljIGludCBfX2t2bV9tbXVfZmF1bHRpbl9wZm4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LAogCQkJCSBzdHJ1Y3Qga3ZtX3BhZ2VfZmF1bHQgKmZhdWx0KQogeworCXVuc2lnbmVkIGludCBm
b2xsID0gZmF1bHQtPndyaXRlID8gRk9MTF9XUklURSA6IDA7CisKIAlpZiAoZmF1bHQtPmlzX3By
aXZhdGUpCiAJCXJldHVybiBrdm1fbW11X2ZhdWx0aW5fcGZuX3ByaXZhdGUodmNwdSwgZmF1bHQp
OwogCi0JZmF1bHQtPnBmbiA9IF9fZ2ZuX3RvX3Bmbl9tZW1zbG90KGZhdWx0LT5zbG90LCBmYXVs
dC0+Z2ZuLCBmYWxzZSwgdHJ1ZSwKLQkJCQkJICBmYXVsdC0+d3JpdGUsICZmYXVsdC0+bWFwX3dy
aXRhYmxlKTsKKwlmb2xsIHw9IEZPTExfTk9XQUlUOworCWZhdWx0LT5wZm4gPSBfX2t2bV9mYXVs
dGluX3BmbihmYXVsdC0+c2xvdCwgZmF1bHQtPmdmbiwgZm9sbCwKKwkJCQkgICAgICAgJmZhdWx0
LT5tYXBfd3JpdGFibGUsICZmYXVsdC0+cmVmY291bnRlZF9wYWdlKTsKIAogCS8qCiAJICogSWYg
cmVzb2x2aW5nIHRoZSBwYWdlIGZhaWxlZCBiZWNhdXNlIEkvTyBpcyBuZWVkZWQgdG8gZmF1bHQt
aW4gdGhlCkBAIC00NDQ3LDggKzQ0NTAsMTEgQEAgc3RhdGljIGludCBfX2t2bV9tbXVfZmF1bHRp
bl9wZm4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCSAqIHRvIHdhaXQgZm9yIElPLiAgTm90ZSwg
Z3VwIGFsd2F5cyBiYWlscyBpZiBpdCBpcyB1bmFibGUgdG8gcXVpY2tseQogCSAqIGdldCBhIHBh
Z2UgYW5kIGEgZmF0YWwgc2lnbmFsLCBpLmUuIFNJR0tJTEwsIGlzIHBlbmRpbmcuCiAJICovCi0J
ZmF1bHQtPnBmbiA9IF9fZ2ZuX3RvX3Bmbl9tZW1zbG90KGZhdWx0LT5zbG90LCBmYXVsdC0+Z2Zu
LCB0cnVlLCB0cnVlLAotCQkJCQkgIGZhdWx0LT53cml0ZSwgJmZhdWx0LT5tYXBfd3JpdGFibGUp
OworCWZvbGwgfD0gRk9MTF9JTlRFUlJVUFRJQkxFOworCWZvbGwgJj0gfkZPTExfTk9XQUlUOwor
CWZhdWx0LT5wZm4gPSBfX2t2bV9mYXVsdGluX3BmbihmYXVsdC0+c2xvdCwgZmF1bHQtPmdmbiwg
Zm9sbCwKKwkJCQkgICAgICAgJmZhdWx0LT5tYXBfd3JpdGFibGUsICZmYXVsdC0+cmVmY291bnRl
ZF9wYWdlKTsKKwogCXJldHVybiBSRVRfUEZfQ09OVElOVUU7CiB9CiAKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2t2bS9tbXUvbW11X2ludGVybmFsLmggYi9hcmNoL3g4Ni9rdm0vbW11L21tdV9pbnRl
cm5hbC5oCmluZGV4IDU5ZTYwMGY2ZmY5ZC4uZmFiYmVhNTA0YTY5IDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni9rdm0vbW11L21tdV9pbnRlcm5hbC5oCisrKyBiL2FyY2gveDg2L2t2bS9tbXUvbW11X2lu
dGVybmFsLmgKQEAgLTIzOCw2ICsyMzgsNyBAQCBzdHJ1Y3Qga3ZtX3BhZ2VfZmF1bHQgewogCS8q
IE91dHB1dHMgb2Yga3ZtX21tdV9mYXVsdGluX3BmbigpLiAgKi8KIAl1bnNpZ25lZCBsb25nIG1t
dV9zZXE7CiAJa3ZtX3Bmbl90IHBmbjsKKwlzdHJ1Y3QgcGFnZSAqcmVmY291bnRlZF9wYWdlOwog
CWJvb2wgbWFwX3dyaXRhYmxlOwogCiAJLyoKLS0gCjIuNDcuMC5yYzEuMjg4LmcwNjI5OGQxNTI1
LWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
