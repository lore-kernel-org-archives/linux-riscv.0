Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF44CFC5F7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqsyyUJa7R9QcnJVFa+nP1sCVW71bP1kxm301L3FJag=; b=HJObgx2mnk+QSF
	1FCEdn8hImpLt/mp0OEWQqKepKQurnRPf/23aKXtBGTu8HA2EWNceHyhZlA97DnKezkxYbEtiDpOy
	KXOQ40CLxoIcHqiQzgVxNroIoq5lC0BCy8pAmTp2K4SsSSo3+6UTDdbL6rq4Z8eolazgcaegYrEj7
	e4RgKYXTCYR3PiNJ5lP/wRivXp/Yq2EVJOEWRA1XvgBIaQavvItzF85B/2jrCpb6vtjMOm6TztO7c
	VBd4WGzjaPIdKnTYlevsWS1kITxXnPbsi8oVd0LDkILUsSTVNQEgSQQIUYIqdzCOOulPacLQmtWtR
	sEocYgDjMPOpb+ErEExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyNS-0000000E1Ot-2zzE;
	Thu, 10 Oct 2024 18:59:10 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrI-0000000DqR6-439o
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:58 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e3231725c9so23554677b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584755; x=1729189555; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/prKt8Bu+DRISNBcov5NrkfgoAIYHMahITKzCWpSrCI=;
        b=spm+Iun/rKPn0B8n5jp4vtXW4KoIEaOrEeQhdA6BP3YALJ/n0GskBlDL6e3o6m8fcJ
         B2FLXrGM9uCwxFoF53aH0EHoH0e8ffaFOJQDwK/LpbkXexqlsNTjFgC4wgFjjWRitsa2
         UwACMIiv9Ob9acFXqYVSy594DaZ7OfCpmYZ3aqpwJOcSfJBcl+GOnZoVxguzaWh8MnAj
         Kpu9mPXvfrTaAVtdQVhqotBwfO2qkl2/kuOdYGCFEGrb3/wC8p5ti+UyIpUO2AHERCmz
         CJK7plDH++huahh/U/pxEGKc9USpkfmmKt+0HHbSHtgky+x/Xx5DiQah54yFJCS1hted
         Ighg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584755; x=1729189555;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/prKt8Bu+DRISNBcov5NrkfgoAIYHMahITKzCWpSrCI=;
        b=i0Xjn6mX2tmjsay+frGq2cfWDMpn3yNtd6DTiB1jaht2dY37GLOWfcendla1nEWqGZ
         6XTjWW72WzWWbSr1N8ROmOA9kOpIx15UxEVUBo4BzIv5Yz7af5ZlO3+IhAKsNbibpqbG
         FqW0hM1iy6P8itqI/HxdpeFfQJ79Ptk6uyYqgJD4u3qet8NTMY8B1UZK/LTYWyEutcXT
         3MQoYsRrEvBndYzbswmHrJkTlkoNxqJOLy20L2BQQeb3BNmBVhlhCPWB1YPiyaFvu10J
         e3mGU1cTiYGpTw3DzNCVMmLXwOGQshK2M9rdSJUGCTyhX2FOI+DohtZJfsKWktcgrbxY
         E+PA==
X-Forwarded-Encrypted: i=1; AJvYcCUNADgfeJP0dPIdPOyk7QwbX81U6NcoZ5iWzfQGJ0TUOTB+35Bo8kIA1a2GqvqF1Pcdk5jE2FpQ5YQYEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbRuROYoDAxSZjZzJfLXPfN6OuhgV2chpVvKATrOdfoTnMZ8V8
	XiPkTWQF7gFiD5yOZQEujw5UmVAUJKCODNSXIpBVvF5nv0Pp86lmhDFf9Ic3zG2LUDxZWGcruYH
	ufg==
X-Google-Smtp-Source: AGHT+IHNZW39HKgOpo4XLx10sqcp5MldEDD35H2r/7z7SkgDatDPvbEuIFyvlgb9BtXWEl9gaR4EDWCFxGs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2093:b0:6d4:30f0:3a74 with SMTP id
 00721157ae682-6e322171640mr1011347b3.6.1728584755409; Thu, 10 Oct 2024
 11:25:55 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:32 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-31-seanjc@google.com>
Subject: [PATCH v13 30/85] KVM: Migrate kvm_vcpu_map() to kvm_follow_pfn()
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
X-CRM114-CacheID: sfid-20241010_112557_064858_019A9329 
X-CRM114-Status: GOOD (  14.65  )
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

RnJvbTogRGF2aWQgU3RldmVucyA8c3RldmVuc2RAY2hyb21pdW0ub3JnPgoKTWlncmF0ZSBrdm1f
dmNwdV9tYXAoKSB0byBrdm1fZm9sbG93X3BmbigpLCBhbmQgaGF2ZSBpdCB0cmFjayB3aGV0aGVy
IG9yCm5vdCB0aGUgbWFwIGhvbGRzIGEgcmVmY291bnRlZCBzdHJ1Y3QgcGFnZS4gIFByZWNpc2Vs
eSB0cmFja2luZyBzdHJ1Y3QKcGFnZSByZWZlcmVuY2VzIHdpbGwgZXZlbnR1YWxseSBhbGxvdyBy
ZW1vdmluZyBrdm1fcGZuX3RvX3JlZmNvdW50ZWRfcGFnZSgpCmFuZCBpdHMgdmFyaW91cyB3cmFw
cGVycy4KClNpZ25lZC1vZmYtYnk6IERhdmlkIFN0ZXZlbnMgPHN0ZXZlbnNkQGNocm9taXVtLm9y
Zz4KW3NlYW46IHVzZSBhIHBvaW50ZXIgaW5zdGVhZCBvZiBhIGJvb2xlYW5dClRlc3RlZC1ieTog
QWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFu
IENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2t2
bV9ob3N0LmggfCAgMiArLQogdmlydC9rdm0va3ZtX21haW4uYyAgICAgIHwgMjYgKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIGIvaW5j
bHVkZS9saW51eC9rdm1faG9zdC5oCmluZGV4IGUzYzAxY2JiYzQxYS4uMDJhYjNhNjU3YWE2IDEw
MDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKKysrIGIvaW5jbHVkZS9saW51eC9r
dm1faG9zdC5oCkBAIC0yODAsNiArMjgwLDcgQEAgc3RydWN0IGt2bV9ob3N0X21hcCB7CiAJICog
Y2FuIGJlIHVzZWQgYXMgZ3Vlc3QgbWVtb3J5IGJ1dCB0aGV5IGFyZSBub3QgbWFuYWdlZCBieSBo
b3N0CiAJICoga2VybmVsKS4KIAkgKi8KKwlzdHJ1Y3QgcGFnZSAqcmVmY291bnRlZF9wYWdlOwog
CXN0cnVjdCBwYWdlICpwYWdlOwogCXZvaWQgKmh2YTsKIAlrdm1fcGZuX3QgcGZuOwpAQCAtMTIz
OCw3ICsxMjM5LDYgQEAgdm9pZCBrdm1fcmVsZWFzZV9wZm5fZGlydHkoa3ZtX3Bmbl90IHBmbik7
CiB2b2lkIGt2bV9zZXRfcGZuX2RpcnR5KGt2bV9wZm5fdCBwZm4pOwogdm9pZCBrdm1fc2V0X3Bm
bl9hY2Nlc3NlZChrdm1fcGZuX3QgcGZuKTsKIAotdm9pZCBrdm1fcmVsZWFzZV9wZm4oa3ZtX3Bm
bl90IHBmbiwgYm9vbCBkaXJ0eSk7CiBpbnQga3ZtX3JlYWRfZ3Vlc3RfcGFnZShzdHJ1Y3Qga3Zt
ICprdm0sIGdmbl90IGdmbiwgdm9pZCAqZGF0YSwgaW50IG9mZnNldCwKIAkJCWludCBsZW4pOwog
aW50IGt2bV9yZWFkX2d1ZXN0KHN0cnVjdCBrdm0gKmt2bSwgZ3BhX3QgZ3BhLCB2b2lkICpkYXRh
LCB1bnNpZ25lZCBsb25nIGxlbik7CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIv
dmlydC9rdm0va3ZtX21haW4uYwppbmRleCA2Y2RiZDA1MTZkNTguLmIxYzFiN2U0ZjMzYSAxMDA2
NDQKLS0tIGEvdmlydC9rdm0va3ZtX21haW4uYworKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCkBA
IC0zMDkzLDIxICszMDkzLDIxIEBAIHN0cnVjdCBwYWdlICpnZm5fdG9fcGFnZShzdHJ1Y3Qga3Zt
ICprdm0sIGdmbl90IGdmbikKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGdmbl90b19wYWdlKTsKIAot
dm9pZCBrdm1fcmVsZWFzZV9wZm4oa3ZtX3Bmbl90IHBmbiwgYm9vbCBkaXJ0eSkKLXsKLQlpZiAo
ZGlydHkpCi0JCWt2bV9yZWxlYXNlX3Bmbl9kaXJ0eShwZm4pOwotCWVsc2UKLQkJa3ZtX3JlbGVh
c2VfcGZuX2NsZWFuKHBmbik7Ci19Ci0KIGludCBrdm1fdmNwdV9tYXAoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBnZm5fdCBnZm4sIHN0cnVjdCBrdm1faG9zdF9tYXAgKm1hcCkKIHsKKwlzdHJ1Y3Qg
a3ZtX2ZvbGxvd19wZm4ga2ZwID0geworCQkuc2xvdCA9IGdmbl90b19tZW1zbG90KHZjcHUtPmt2
bSwgZ2ZuKSwKKwkJLmdmbiA9IGdmbiwKKwkJLmZsYWdzID0gRk9MTF9XUklURSwKKwkJLnJlZmNv
dW50ZWRfcGFnZSA9ICZtYXAtPnJlZmNvdW50ZWRfcGFnZSwKKwl9OworCisJbWFwLT5yZWZjb3Vu
dGVkX3BhZ2UgPSBOVUxMOwogCW1hcC0+cGFnZSA9IE5VTEw7CiAJbWFwLT5odmEgPSBOVUxMOwog
CW1hcC0+Z2ZuID0gZ2ZuOwogCi0JbWFwLT5wZm4gPSBnZm5fdG9fcGZuKHZjcHUtPmt2bSwgZ2Zu
KTsKKwltYXAtPnBmbiA9IGt2bV9mb2xsb3dfcGZuKCZrZnApOwogCWlmIChpc19lcnJvcl9ub3Ns
b3RfcGZuKG1hcC0+cGZuKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKQEAgLTMxMzksMTAgKzMxMzks
MTYgQEAgdm9pZCBrdm1fdmNwdV91bm1hcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBr
dm1faG9zdF9tYXAgKm1hcCwgYm9vbCBkaXJ0eSkKIAlpZiAoZGlydHkpCiAJCWt2bV92Y3B1X21h
cmtfcGFnZV9kaXJ0eSh2Y3B1LCBtYXAtPmdmbik7CiAKLQlrdm1fcmVsZWFzZV9wZm4obWFwLT5w
Zm4sIGRpcnR5KTsKKwlpZiAobWFwLT5yZWZjb3VudGVkX3BhZ2UpIHsKKwkJaWYgKGRpcnR5KQor
CQkJa3ZtX3JlbGVhc2VfcGFnZV9kaXJ0eShtYXAtPnJlZmNvdW50ZWRfcGFnZSk7CisJCWVsc2UK
KwkJCWt2bV9yZWxlYXNlX3BhZ2VfY2xlYW4obWFwLT5yZWZjb3VudGVkX3BhZ2UpOworCX0KIAog
CW1hcC0+aHZhID0gTlVMTDsKIAltYXAtPnBhZ2UgPSBOVUxMOworCW1hcC0+cmVmY291bnRlZF9w
YWdlID0gTlVMTDsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGt2bV92Y3B1X3VubWFwKTsKIAotLSAK
Mi40Ny4wLnJjMS4yODguZzA2Mjk4ZDE1MjUtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
