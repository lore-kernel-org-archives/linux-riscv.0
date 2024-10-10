Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C91FCFC5FD
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2UDOASqnWKvY+O1IJzNBfWk/0kxnO2gOVfgqkAW7SRI=; b=rrvZ7mqID3xUy8
	U94Dvry2aaCZWbEk1C6MmnEcS4qW+6KE/qobud64+7b4x+gvQotTMhvG26NnoyKIW4fzkpQAvkt7P
	RCgPJzYTijDnW9ZlJukKU4gsbRkLMF6uEJdwO38YrtwaEzVPF30IMi2qwuvsPjIf4B6K9G9phQbP5
	qQ+JbryvWFvV3F7z2eEIZrB3CV7GS9HrRT+w0u9RpzUVTkOF6zTVjvtqttsD7GLW7Ml80hjE3n1hY
	e6q69BYHHdN4byqt7FJxXTmxjCYlJ6eSE3rJSiKmqxiVpbJu40VrIVYJQBJrB3rFxW+O/1WvcaEsS
	a58ngP5DYWFXKMYz0R+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyjP-0000000E5ZL-2gdS;
	Thu, 10 Oct 2024 19:21:51 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrt-0000000DquZ-1Bno
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:35 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-71e0228d71dso1225581b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584792; x=1729189592; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4aL9ye2ZxrCnqTpLqQlinT65BUul16gfmDzid4NN5Y=;
        b=4NJxd+23djSQD5IrKrOM7+QBFAb+zUEzLAelhcpuCsN/jNgk8WGR2zJ21WF08csT9V
         yhMLGsZmfSz963iR9mrnBU4cwLKvwl5BPrO7GoCUIghqK86NVrPcw9z4snYKKkabblTO
         z/jBEzoAkqypTekJV+lLgO+n/EPna95q8QOQmqUodoUob08Ymw8w1UizJ3J5xwCC3ymz
         wTklvrSW+SKTZSOpfYN6lllfuRcZhijDV7ltjf7exYNEDFDq4/QVOcZQfFIaQqokMloc
         9m29lmfaoY7ZsvkPtfUGCgdPTiTz7Ji2mxd/cOFOBuo50KHj5VvP2JR6hGeFnLweMZll
         9c8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584792; x=1729189592;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l4aL9ye2ZxrCnqTpLqQlinT65BUul16gfmDzid4NN5Y=;
        b=Enezv8aElsEkDAqc1V28ReeA9A/k760+LGzhEQ6dg+0KAiIpG+YRI53UoYrwhEwWoz
         Ii7emlBWClTGFX9nl7LPaB6eyDIXMDOtamf3USztnU5FpO6+Np4kiNzgkatrNjOuxM8I
         4jXN8mB5zPe/jbwBRLNedOC2U31uRIeOeoqqPZlTIFGrGm1tornCDj5mAMRAR6zuNCAU
         j/ZUIE/XsAZo4ToVxbSTCEKf6zWOc5eAo8BXpJVXrXmA+fmTtLzPaNZnpHsw82b/zPqs
         d28E5qpHusGQ9JT94ggOafm1GExDlyUn/bLwt/c6au0MsFpDmM0NK2f+7wYcq/bCPyho
         oKOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkwfetjZpbGyx4YwKeFUan8YdUkitBG0hvRV7L5517JvJ/QeC91s0YEUWtez4Ze92w+jLxrJQnL5Wgkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YziC7UAyWHMhI3PEZsAWGya2extaDifP7oeSCMJgGwIe8Uu9xOP
	teydmAxPaIJRZu6aFfN8ltoXmOTSw20RuTjK1VysLN73Dpeglx6N3vXjyDV9EC7u38I/ygK8pvU
	XMg==
X-Google-Smtp-Source: AGHT+IFunsAHL0GYDEyxrwNnSExkBiXOv88aJkEgjVxw5ZDXOBsEr4Eha3ByEK4QIBQ4extfr7SnAz+Fl/s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:aa7:9184:0:b0:71d:f7c9:8cb3 with SMTP id
 d2e1a72fcca58-71e1dbf1ab5mr7799b3a.5.1728584790633; Thu, 10 Oct 2024 11:26:30
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:49 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-48-seanjc@google.com>
Subject: [PATCH v13 47/85] KVM: x86/mmu: Put refcounted pages instead of
 blindly releasing pfns
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
X-CRM114-CacheID: sfid-20241010_112633_467639_D7832FED 
X-CRM114-Status: GOOD (  10.71  )
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

Tm93IHRoYXQgYWxsIHg4NiBwYWdlIGZhdWx0IHBhdGhzIHByZWNpc2VseSB0cmFjayByZWZjb3Vu
dGVkIHBhZ2VzLCB1c2UKVXNlIGt2bV9wYWdlX2ZhdWx0LnJlZmNvdW50ZWRfcGFnZSB0byBwdXQg
cmVmZXJlbmNlcyB0byBzdHJ1Y3QgcGFnZSBtZW1vcnkKd2hlbiBmaW5pc2hpbmcgcGFnZSBmYXVs
dHMuICBUaGlzIGlzIGEgYmFieSBzdGVwIHRvd2FyZHMgZWxpbWluYXRpbmcKa3ZtX3Bmbl90b19y
ZWZjb3VudGVkX3BhZ2UoKS4KClRlc3RlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBs
aW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29v
Z2xlLmNvbT4KLS0tCiBhcmNoL3g4Ni9rdm0vbW11L21tdS5jIHwgNyArKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2t2bS9tbXUvbW11LmMgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCmluZGV4IGEwMzhj
ZGU3NGYwZC4uZjliN2UzYTczNzBmIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vbW11L21tdS5j
CisrKyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKQEAgLTQzNzMsNiArNDM3Myw5IEBAIHN0YXRp
YyB2b2lkIGt2bV9tbXVfZmluaXNoX3BhZ2VfZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAog
CWxvY2tkZXBfYXNzZXJ0X29uY2UobG9ja2RlcF9pc19oZWxkKCZ2Y3B1LT5rdm0tPm1tdV9sb2Nr
KSB8fAogCQkJICAgIHIgPT0gUkVUX1BGX1JFVFJZKTsKIAorCWlmICghZmF1bHQtPnJlZmNvdW50
ZWRfcGFnZSkKKwkJcmV0dXJuOworCiAJLyoKIAkgKiBJZiB0aGUgcGFnZSB0aGF0IEtWTSBnb3Qg
ZnJvbSB0aGUgKnByaW1hcnkgTU1VKiBpcyB3cml0YWJsZSwgYW5kIEtWTQogCSAqIGluc3RhbGxl
ZCBvciByZXVzZWQgYSBTUFRFLCBtYXJrIHRoZSBwYWdlL2ZvbGlvIGRpcnR5LiAgTm90ZSwgdGhp
cwpAQCAtNDM4NCw5ICs0Mzg3LDkgQEAgc3RhdGljIHZvaWQga3ZtX21tdV9maW5pc2hfcGFnZV9m
YXVsdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJICogZm9saW8gZGlydHkgaWYgS1ZNIGNvdWxk
IGxvY2tsZXNzbHkgbWFrZSB0aGUgU1BURSB3cml0YWJsZS4KIAkgKi8KIAlpZiAoIWZhdWx0LT5t
YXBfd3JpdGFibGUgfHwgciA9PSBSRVRfUEZfUkVUUlkpCi0JCWt2bV9yZWxlYXNlX3Bmbl9jbGVh
bihmYXVsdC0+cGZuKTsKKwkJa3ZtX3JlbGVhc2VfcGFnZV9jbGVhbihmYXVsdC0+cmVmY291bnRl
ZF9wYWdlKTsKIAllbHNlCi0JCWt2bV9yZWxlYXNlX3Bmbl9kaXJ0eShmYXVsdC0+cGZuKTsKKwkJ
a3ZtX3JlbGVhc2VfcGFnZV9kaXJ0eShmYXVsdC0+cmVmY291bnRlZF9wYWdlKTsKIH0KIAogc3Rh
dGljIGludCBrdm1fbW11X2ZhdWx0aW5fcGZuX3ByaXZhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LAotLSAKMi40Ny4wLnJjMS4yODguZzA2Mjk4ZDE1MjUtZ29vZwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
