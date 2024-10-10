Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85540CFC5F4
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urB7D0YjB3PrS0IhcdOWFrPf08LFU3ilyDP+CEASzzI=; b=1aUJwUEa5iN5oP
	NFjmPaNvu18f8Aiple2cPcxqPXe/gdPTsoX/RnsNqtdq+dmEr1WsTxEZ4xCtRbwq5eVAvSeV4c+Zf
	ub+TSMG9E0gIlVq5ZPOIoSuP28bIJC2rcnzaCFs3exJRcwkuJWBdy7vhZ6t+HWCJQi93PrPNabERo
	UC/FhTDKr/ajCo1inteJ2hfuilTBNK6BtqtJwX2SptselRhJFGlSIQZ6KQwP31x9gxcwWF4qIlhWU
	0onFLp2ugsxeLkb/a74++R5meKs3grp/hmZv9qhHAIQhvtgLavzsMrnwcGf/HdkJLI1DrqqiHqqPM
	aFTK1/uYUcW1HA+lYWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyDm-0000000DzU2-0Q0o;
	Thu, 10 Oct 2024 18:49:10 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxqy-0000000Dq9l-2UwZ
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:39 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2e2dcea0f03so997754a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584735; x=1729189535; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNPEWcjaz+dEwpcBQF1ZcKP3HAxUc/LzxURpjzN7wyY=;
        b=cQVMlHY01P5GUGimI1EwUwV1gMXDWO1YhRNQgRRZRp00tcXkR3VxYVS8SFNZdGUHSM
         +EnHGdT46sR1K/IGTWajJMmoGBn0sNYOYBl9jKHyXHiRccxDMQz2SiMM8mPBIPgc36qO
         Po18p81ZhZKkcywvYLdtTn92U0KOy4krcXQi8HumWxBuK6fva1EYc44wJf8gFuc/2fd6
         KE22Z93ZbqXtSHgYYN/h+5IQDFU3/qaj+6FgQnJ80jSJFdyR2wG6J4Jnw+f04poLAqTP
         dsiF1M/Sh525nq3aLtvs5dKB47INji3eZlodpB9Gp1tMy1RepfdgGfZF+37O8j4+KXr8
         aD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584735; x=1729189535;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LNPEWcjaz+dEwpcBQF1ZcKP3HAxUc/LzxURpjzN7wyY=;
        b=UouhhKm9lBDf2VSyBNvCkzzFd/QdMjeIrjAZx/vnuNvPhwEddeXMJ9Ypxdz7yDAOJy
         U+DR+gQwUeFmiEXiPsBhGxu5sm+Ld0f+vZc9A/7VyeyKhJggDr8kfKsgHspAjNGjK9ly
         KosgzuMsEUkZyT/InVCXl2U7+DCJYlSlcBdwaP6bzBFk7WI40JOGLL1FVy9Mp660Mgu7
         8mhKQwceOqCfxZ6w76ng8nzAR/oYY+7vpNIPthha/HdTogFsAFn604hUWzsKWFA2mS+1
         wn51sS65ubSWsncvkOvEEZ/pxw+aNvaTgV67xzhZEEenAsqwjCM36f296gageThaEnWW
         wNfw==
X-Forwarded-Encrypted: i=1; AJvYcCUe8ZESBNGNDq3hYprAwtttyFLeNhhpyKiFclselHNY8o8jefd7fLgyKPxMj6i33XDaXvslLUGTnILDPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyMHSyPHePJnWYE5GlhjgNBPcFtGqkVKwRxM2wUhe+ztWZ5OGz
	ATEHuUZAXsKegPLsa7j/iYBLQG5D2vxSD/qCAAS9zXxDJf1/4M0qi5C9tj+b9jH8NuV03J6GO7Q
	Okg==
X-Google-Smtp-Source: AGHT+IEnZEGZphhdHlQgb0iOcJfNRdGKMtxwSRuFd5MkDGpZIOhDcg8ohYIeF4ySSwO5bqKUu8yK4lYjZ+4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:8595:b0:2e2:d600:3862 with SMTP id
 98e67ed59e1d1-2e2f0d9dbfemr89a91.8.1728584735013; Thu, 10 Oct 2024 11:25:35
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:22 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-21-seanjc@google.com>
Subject: [PATCH v13 20/85] KVM: Remove pointless sanity check on @map param to kvm_vcpu_(un)map()
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
X-CRM114-CacheID: sfid-20241010_112536_714593_C7809FAA 
X-CRM114-Status: GOOD (  10.00  )
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

RHJvcCBrdm1fdmNwdV97LHVufW1hcCgpJ3MgdXNlbGVzcyBjaGVja3Mgb24gQG1hcCBiZWluZyBu
b24tTlVMTC4gIFRoZSBtYXAKaXMgMTAwJSBrZXJuZWwgY29udHJvbGxlZCwgYW55IGNhbGxlciB0
aGF0IHBhc3NlcyBhIE5VTEwgcG9pbnRlciBpcyBicm9rZW4KYW5kIG5lZWRzIHRvIGJlIGZpeGVk
LCBpLmUuIGEgY3Jhc2ggZHVlIHRvIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGlzCmRlc2ly
YWJsZSAodGhvdWdoIG9idmlvdXNseSBub3QgYXMgZGVzaXJhYmxlIGFzIG5vdCBoYXZpbmcgYSBi
dWcgaW4gdGhlCmZpcnN0IHBsYWNlKS4KClRlc3RlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJl
bm5lZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFu
amNAZ29vZ2xlLmNvbT4KLS0tCiB2aXJ0L2t2bS9rdm1fbWFpbi5jIHwgNiAtLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWlu
LmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCmluZGV4IDUyNjI5YWMyNjExOS4uYzc2OTFiYzQwMzg5
IDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5jCisrKyBiL3ZpcnQva3ZtL2t2bV9tYWlu
LmMKQEAgLTMwNzEsOSArMzA3MSw2IEBAIGludCBrdm1fdmNwdV9tYXAoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBnZm5fdCBnZm4sIHN0cnVjdCBrdm1faG9zdF9tYXAgKm1hcCkKIAl2b2lkICpodmEg
PSBOVUxMOwogCXN0cnVjdCBwYWdlICpwYWdlID0gS1ZNX1VOTUFQUEVEX1BBR0U7CiAKLQlpZiAo
IW1hcCkKLQkJcmV0dXJuIC1FSU5WQUw7Ci0KIAlwZm4gPSBnZm5fdG9fcGZuKHZjcHUtPmt2bSwg
Z2ZuKTsKIAlpZiAoaXNfZXJyb3Jfbm9zbG90X3BmbihwZm4pKQogCQlyZXR1cm4gLUVJTlZBTDsK
QEAgLTMxMDEsOSArMzA5OCw2IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGt2bV92Y3B1X21hcCk7CiAK
IHZvaWQga3ZtX3ZjcHVfdW5tYXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX2hv
c3RfbWFwICptYXAsIGJvb2wgZGlydHkpCiB7Ci0JaWYgKCFtYXApCi0JCXJldHVybjsKLQogCWlm
ICghbWFwLT5odmEpCiAJCXJldHVybjsKIAotLSAKMi40Ny4wLnJjMS4yODguZzA2Mjk4ZDE1MjUt
Z29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
