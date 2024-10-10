Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D3BCFC5F6
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLdDohDDFqGFXAGyTu3u+ZvGCh81J1T2J9zwRSkoLRw=; b=XXD6Zo0cScOCsY
	yT60xleSam62u41QigaSlPbr+foorhHgHq6I4Vcbttfwx1eHST/aFGJXB3y3SYbRU79/qrSYMEE8n
	MaOjToXHwrepNFfolGZEjFYUHgoWlXnpR3Tw3hAUXxQPG8V9FrDs5OXt/b/Ri28Ca2A9sSb6nnMNF
	NeldXwJUSup63vuW3kg+YzZ0Xvz81vvcQWB0UQWEA+cQKbRVnn3HtEK/bYuwSmGPvb6v1Wd9Aye/F
	tN5krKdVmYwZVryoLzme8TustIrulmJwR6aLPwxmfETtFVTSHm8WTeFHLhshXaEe3mmpiRxNlSaCa
	aVJH56VeQ9qkfGqKtHrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyM7-0000000E0qJ-2f2P;
	Thu, 10 Oct 2024 18:57:47 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrH-0000000DqP1-0KZ8
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:56 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e02fff66a83so1965993276.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584753; x=1729189553; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXVCtJlFVF227JmXan6PsTRYgw7//koA3Av9lMmMw70=;
        b=ttCXfoQrTUVfgH8jwR8KWzplwegscq+j8FDqssv2oxhDJRt4EEVBLhTF1+GaGNqIQl
         XvdFls0Il6zSW+CKvmB9tAofDO1Ill0yzaCXijICpQhEHTeRAWZnMb43UbmWmuM0vN2I
         9sZWepWrJ+nULqgWGU5XrQ46pWviuTndQVuXa3ndAOlS+s/JEa0YjwCfRXMzAf4tzQHd
         XqRowaXrWrVUe04WhSnbBr0Qc8BnZMsF8YrEnrHvYviJJkJkNbvK6sB89qGjQdFD7cL9
         5GOd+zNYLbrYew8HML/Cnf9qrivbBDIL1+HW1EqU4gsgl4lwPm3tZ7yh7tQzleuhQo16
         DdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584753; x=1729189553;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nXVCtJlFVF227JmXan6PsTRYgw7//koA3Av9lMmMw70=;
        b=EY8D3yTM7zxeZvW2pfvmJlLn4RaIQ9EyUe1E8Z3TMho7TiUltgA9xDNXgEfjGm9WY9
         XEWvsu8WlZMadm2AaJrZ3Kt7twnrNcPtYlPELM8pjVAA5uE01XJGYF1iWoNYlfyS9JJx
         4RIwAXkyd3OWTllVxebEvIY8Zpa6TPhhdqq+PBZqg17IZoHNtd5Bu01QiJ8PJDroOSIu
         HyIglHtjc3ZtqlSg7W9JjE4w/PDd64kaaGTQGrYkAGf+gaIxpWHaXLBObCBktVcwl3WE
         vufR4snUbTUI5yeBUwecjJwJLjs98iZcOuyC2rKdbbw7QBuWpkJJjvQwk7O4kXqh9oRD
         Fghw==
X-Forwarded-Encrypted: i=1; AJvYcCUXjMERsMV+WZLCYbczSHfp6/fcP4o2KUg5d2aT/XO9psnI4IEbmglvVKen8WNkLgZQ719RVlCRIdljDA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/kqm3pedx/TC9RkDiiCR1VoU7ysXmoEAtxIVxj71qgHjNdn/z
	0tz/L1UWiWDj9uJkt9jD2A4blm2q1yatWqt/fBDWE11pBE241mum8NihgldY82POJZ6dyg62g5k
	yfg==
X-Google-Smtp-Source: AGHT+IFqzRS1xOg2oJDncuDOdOtR7gITdwbfvBFuJ4xWEWgDQEplutdiZUKmbH0mIVak18Oaak6LM032atM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:b205:0:b0:e25:17cb:352e with SMTP id
 3f1490d57ef6-e28fe43f3f5mr4095276.9.1728584753336; Thu, 10 Oct 2024 11:25:53
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:31 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-30-seanjc@google.com>
Subject: [PATCH v13 29/85] KVM: pfncache: Precisely track refcounted pages
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
X-CRM114-CacheID: sfid-20241010_112555_434415_A8B3C65C 
X-CRM114-Status: GOOD (  10.67  )
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

VHJhY2sgcmVmY291bnRlZCBzdHJ1Y3QgcGFnZSBtZW1vcnkgdXNpbmcga3ZtX2ZvbGxvd19wZm4u
cmVmY291bnRlZF9wYWdlCmluc3RlYWQgb2YgcmVseWluZyBvbiBrdm1fcmVsZWFzZV9wZm5fY2xl
YW4oKSB0byBjb3JyZWN0bHkgZGV0ZWN0IHRoYXQgdGhlCnBmbiBpcyBhc3NvY2lhdGVkIHdpdGgg
YSBzdHJ1Y3QgcGFnZS4KClRlc3RlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5h
cm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xl
LmNvbT4KLS0tCiB2aXJ0L2t2bS9wZm5jYWNoZS5jIHwgMTEgKysrKysrKy0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdmly
dC9rdm0vcGZuY2FjaGUuYyBiL3ZpcnQva3ZtL3BmbmNhY2hlLmMKaW5kZXggMDY3ZGFmOWFkNmVm
Li43MjhkMmMxYjQ4OGEgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL3BmbmNhY2hlLmMKKysrIGIvdmly
dC9rdm0vcGZuY2FjaGUuYwpAQCAtMTU5LDExICsxNTksMTQgQEAgc3RhdGljIGt2bV9wZm5fdCBo
dmFfdG9fcGZuX3JldHJ5KHN0cnVjdCBnZm5fdG9fcGZuX2NhY2hlICpncGMpCiAJa3ZtX3Bmbl90
IG5ld19wZm4gPSBLVk1fUEZOX0VSUl9GQVVMVDsKIAl2b2lkICpuZXdfa2h2YSA9IE5VTEw7CiAJ
dW5zaWduZWQgbG9uZyBtbXVfc2VxOworCXN0cnVjdCBwYWdlICpwYWdlOworCiAJc3RydWN0IGt2
bV9mb2xsb3dfcGZuIGtmcCA9IHsKIAkJLnNsb3QgPSBncGMtPm1lbXNsb3QsCiAJCS5nZm4gPSBn
cGFfdG9fZ2ZuKGdwYy0+Z3BhKSwKIAkJLmZsYWdzID0gRk9MTF9XUklURSwKIAkJLmh2YSA9IGdw
Yy0+dWh2YSwKKwkJLnJlZmNvdW50ZWRfcGFnZSA9ICZwYWdlLAogCX07CiAKIAlsb2NrZGVwX2Fz
c2VydF9oZWxkKCZncGMtPnJlZnJlc2hfbG9jayk7CkBAIC0xOTgsNyArMjAxLDcgQEAgc3RhdGlj
IGt2bV9wZm5fdCBodmFfdG9fcGZuX3JldHJ5KHN0cnVjdCBnZm5fdG9fcGZuX2NhY2hlICpncGMp
CiAJCQlpZiAobmV3X2todmEgIT0gb2xkX2todmEpCiAJCQkJZ3BjX3VubWFwKG5ld19wZm4sIG5l
d19raHZhKTsKIAotCQkJa3ZtX3JlbGVhc2VfcGZuX2NsZWFuKG5ld19wZm4pOworCQkJa3ZtX3Jl
bGVhc2VfcGFnZV91bnVzZWQocGFnZSk7CiAKIAkJCWNvbmRfcmVzY2hlZCgpOwogCQl9CkBAIC0y
MTgsNyArMjIxLDcgQEAgc3RhdGljIGt2bV9wZm5fdCBodmFfdG9fcGZuX3JldHJ5KHN0cnVjdCBn
Zm5fdG9fcGZuX2NhY2hlICpncGMpCiAJCQluZXdfa2h2YSA9IGdwY19tYXAobmV3X3Bmbik7CiAK
IAkJaWYgKCFuZXdfa2h2YSkgewotCQkJa3ZtX3JlbGVhc2VfcGZuX2NsZWFuKG5ld19wZm4pOwor
CQkJa3ZtX3JlbGVhc2VfcGFnZV91bnVzZWQocGFnZSk7CiAJCQlnb3RvIG91dF9lcnJvcjsKIAkJ
fQogCkBAIC0yMzYsMTEgKzIzOSwxMSBAQCBzdGF0aWMga3ZtX3Bmbl90IGh2YV90b19wZm5fcmV0
cnkoc3RydWN0IGdmbl90b19wZm5fY2FjaGUgKmdwYykKIAlncGMtPmtodmEgPSBuZXdfa2h2YSAr
IG9mZnNldF9pbl9wYWdlKGdwYy0+dWh2YSk7CiAKIAkvKgotCSAqIFB1dCB0aGUgcmVmZXJlbmNl
IHRvIHRoZSBfbmV3XyBwZm4uICBUaGUgcGZuIGlzIG5vdyB0cmFja2VkIGJ5IHRoZQorCSAqIFB1
dCB0aGUgcmVmZXJlbmNlIHRvIHRoZSBfbmV3XyBwYWdlLiAgVGhlIHBhZ2UgaXMgbm93IHRyYWNr
ZWQgYnkgdGhlCiAJICogY2FjaGUgYW5kIGNhbiBiZSBzYWZlbHkgbWlncmF0ZWQsIHN3YXBwZWQs
IGV0Yy4uLiBhcyB0aGUgY2FjaGUgd2lsbAogCSAqIGludmFsaWRhdGUgYW55IG1hcHBpbmdzIGlu
IHJlc3BvbnNlIHRvIHJlbGV2YW50IG1tdV9ub3RpZmllciBldmVudHMuCiAJICovCi0Ja3ZtX3Jl
bGVhc2VfcGZuX2NsZWFuKG5ld19wZm4pOworCWt2bV9yZWxlYXNlX3BhZ2VfY2xlYW4ocGFnZSk7
CiAKIAlyZXR1cm4gMDsKIAotLSAKMi40Ny4wLnJjMS4yODguZzA2Mjk4ZDE1MjUtZ29vZwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
