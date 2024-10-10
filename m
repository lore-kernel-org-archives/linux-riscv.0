Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA088CFC5FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQ+uhhN85wkDZ7a/8YspSeLrDnBklEzur8mbZv8hsEw=; b=21pKPdFWvFs0r+
	C2VqwWaXHU+CQEVXiWuKt3CjGY/VqCJXoYSsyApM/LPrMWk1jMcuE0GeAKcuT2yEBndumg+/3jsnX
	clqNn7RsxHWJXKEK22DXMPyjWWbul9dQSoN0o9/sxdtWqVnf3Eso73mHbBFGGmtSRLI3y8OaNjCzQ
	aypL2+QVP8lT+y3ZT2L31NcQVU5CmzW7tOPAn0R8ARv8ItTczU8p7UfKYulCJEBOSWg0qnAMnUk78
	g6mI8VWpELoV3gjFt7qKrg+ea1b+Cg9tNN0mqwrxq3gsZTutWBSomdu6eFJtFLx9KkEK/+Lrl3t7o
	8onl8lTU/rBE4/6czExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyjE-0000000E5VP-3cuI;
	Thu, 10 Oct 2024 19:21:40 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrq-0000000Dqs2-1Wry
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:32 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e165fc5d94fso1877585276.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584789; x=1729189589; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DfuS3cqNKQbdjipc1jp6gNPynmr8H/oDbYVrbrij3Q=;
        b=bQ9AW2IX1XkoVL4gLFimXEPTP1Mhxriw/jA12X4nUWJqxirBw2m1oV21TXm/Q54OeR
         3xmOsY2+fN14ugnmdPBfXy10JZiNvnidlIpFjwC2GEgPzc3S1L2f1a7G1sLYsbXGtr6i
         9XRCsT2/Cc4kodHq8DEyH1VOHP5NEgfR88ObjV0h7fThBsu7UaMqpD7iHSjQ0uhYnbpX
         UTjnPR9wQqePEmjiseiBgcqy85260s+ZN+LEAB38tRq3kQI0DwyghI6k3Keuhi5xIiqt
         IyWVuhf8iqzQLYFlCsp4W/nAMsCB+r6tSjgae+dSuOCaKKvoIZGnzvWO9SINB0Uprnwn
         bh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584789; x=1729189589;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/DfuS3cqNKQbdjipc1jp6gNPynmr8H/oDbYVrbrij3Q=;
        b=Rqw0OWy7C7JoyediKMPKXFtHSsgBhDkxyrDAmV+1qP0gY68CbcK2aUvECBHdMtpLtX
         qjManC/pmKXCwXAVVulSLRGQ8M1eG6rYL79D1xFvvYTQhZkOWBIT0o+rDoQ+f4Jz5qC0
         HovobjLPKeexkwarQa2kNhS1JwSIAUIG5gGWJdIB8PXICiCGGnNlOE3cyRnCrMExQ0nO
         KFTqztx5Ugohdse5p1zteKkQZVZehC1tp/a4XhMxR4YTrrQMDeqRcDB7LJc4THTsOObw
         Rtdu4yZp8jXX/nmE1vQ6WFvNqqfrdz499UBXk/EgWt7r49qHI8OYtv5HVcUfHXbrFtJL
         aUqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgP27xmxf3cJnALwlty9wkqjpRvBxXGo3CMZlWHN/B+BDNiOh9EzbBPmOIpL7b3O0/XVypX2b4OQDQ+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzezKkJ/rTi12jspeYsJsBJ7ZmkI+a1nwMOADnWJehQV/luaxkA
	5v1iONL7hyBmkq7pGL5IA3HPz1rK9bNevSuAbUtaIpjvKy76ksFfGepUAh+mVJ2fHbnGjmFhghT
	FsQ==
X-Google-Smtp-Source: AGHT+IHLQFn8WLOIHu4PHZ3K+TrLKBMF9JlmWl30kTXK43TD90b+TNbg3ZepRFQQdmJeel5bU/EhDzobpdQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:b191:0:b0:e1f:eaf1:2254 with SMTP id
 3f1490d57ef6-e28fe41acaamr82536276.8.1728584788687; Thu, 10 Oct 2024 11:26:28
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:48 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-47-seanjc@google.com>
Subject: [PATCH v13 46/85] KVM: guest_memfd: Provide "struct page" as output
 from kvm_gmem_get_pfn()
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
X-CRM114-CacheID: sfid-20241010_112630_564258_F36E0A06 
X-CRM114-Status: GOOD (  14.39  )
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

UHJvdmlkZSB0aGUgInN0cnVjdCBwYWdlIiBhc3NvY2lhdGVkIHdpdGggYSBndWVzdF9tZW1mZCBw
Zm4gYXMgYW4gb3V0cHV0CmZyb20gX19rdm1fZ21lbV9nZXRfcGZuKCkgc28gdGhhdCBLVk0gZ3Vl
c3QgcGFnZSBmYXVsdCBoYW5kbGVycyBjYW4KZGlyZWN0bHkgcHV0IHRoZSBwYWdlIGluc3RlYWQg
b2YgaGF2aW5nIHRvIHJlbHkgb24Ka3ZtX3Bmbl90b19yZWZjb3VudGVkX3BhZ2UoKS4KClRlc3Rl
ZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5
OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KLS0tCiBhcmNoL3g4Ni9r
dm0vbW11L21tdS5jICAgfCAgMiArLQogYXJjaC94ODYva3ZtL3N2bS9zZXYuYyAgIHwgMTAgKysr
KysrLS0tLQogaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIHwgIDYgKysrKy0tCiB2aXJ0L2t2bS9n
dWVzdF9tZW1mZC5jICAgfCAgOCArKysrKystLQogNCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRp
b25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9tbXUvbW11
LmMgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCmluZGV4IDJlMjA3NjI4N2FhZi4uYTAzOGNkZTc0
ZjBkIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCisrKyBiL2FyY2gveDg2L2t2
bS9tbXUvbW11LmMKQEAgLTQ0MDAsNyArNDQwMCw3IEBAIHN0YXRpYyBpbnQga3ZtX21tdV9mYXVs
dGluX3Bmbl9wcml2YXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAl9CiAKIAlyID0ga3ZtX2dt
ZW1fZ2V0X3Bmbih2Y3B1LT5rdm0sIGZhdWx0LT5zbG90LCBmYXVsdC0+Z2ZuLCAmZmF1bHQtPnBm
biwKLQkJCSAgICAgJm1heF9vcmRlcik7CisJCQkgICAgICZmYXVsdC0+cmVmY291bnRlZF9wYWdl
LCAmbWF4X29yZGVyKTsKIAlpZiAocikgewogCQlrdm1fbW11X3ByZXBhcmVfbWVtb3J5X2ZhdWx0
X2V4aXQodmNwdSwgZmF1bHQpOwogCQlyZXR1cm4gcjsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2
bS9zdm0vc2V2LmMgYi9hcmNoL3g4Ni9rdm0vc3ZtL3Nldi5jCmluZGV4IDQ1NTdmZjM4MDRhZS4u
YzZjODUyNDg1OTAwIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vc3ZtL3Nldi5jCisrKyBiL2Fy
Y2gveDg2L2t2bS9zdm0vc2V2LmMKQEAgLTM4NDksNiArMzg0OSw3IEBAIHN0YXRpYyBpbnQgX19z
ZXZfc25wX3VwZGF0ZV9wcm90ZWN0ZWRfZ3Vlc3Rfc3RhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQogCWlmIChWQUxJRF9QQUdFKHN2bS0+c2V2X2VzLnNucF92bXNhX2dwYSkpIHsKIAkJZ2ZuX3Qg
Z2ZuID0gZ3BhX3RvX2dmbihzdm0tPnNldl9lcy5zbnBfdm1zYV9ncGEpOwogCQlzdHJ1Y3Qga3Zt
X21lbW9yeV9zbG90ICpzbG90OworCQlzdHJ1Y3QgcGFnZSAqcGFnZTsKIAkJa3ZtX3Bmbl90IHBm
bjsKIAogCQlzbG90ID0gZ2ZuX3RvX21lbXNsb3QodmNwdS0+a3ZtLCBnZm4pOwpAQCAtMzg1OSw3
ICszODYwLDcgQEAgc3RhdGljIGludCBfX3Nldl9zbnBfdXBkYXRlX3Byb3RlY3RlZF9ndWVzdF9z
dGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJCSAqIFRoZSBuZXcgVk1TQSB3aWxsIGJlIHBy
aXZhdGUgbWVtb3J5IGd1ZXN0IG1lbW9yeSwgc28KIAkJICogcmV0cmlldmUgdGhlIFBGTiBmcm9t
IHRoZSBnbWVtIGJhY2tlbmQuCiAJCSAqLwotCQlpZiAoa3ZtX2dtZW1fZ2V0X3Bmbih2Y3B1LT5r
dm0sIHNsb3QsIGdmbiwgJnBmbiwgTlVMTCkpCisJCWlmIChrdm1fZ21lbV9nZXRfcGZuKHZjcHUt
Pmt2bSwgc2xvdCwgZ2ZuLCAmcGZuLCAmcGFnZSwgTlVMTCkpCiAJCQlyZXR1cm4gLUVJTlZBTDsK
IAogCQkvKgpAQCAtMzg4OCw3ICszODg5LDcgQEAgc3RhdGljIGludCBfX3Nldl9zbnBfdXBkYXRl
X3Byb3RlY3RlZF9ndWVzdF9zdGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJCSAqIGNoYW5n
ZXMgdGhlbiBjYXJlIHNob3VsZCBiZSB0YWtlbiB0byBlbnN1cmUKIAkJICogc3ZtLT5zZXZfZXMu
dm1zYSBpcyBwaW5uZWQgdGhyb3VnaCBzb21lIG90aGVyIG1lYW5zLgogCQkgKi8KLQkJa3ZtX3Jl
bGVhc2VfcGZuX2NsZWFuKHBmbik7CisJCWt2bV9yZWxlYXNlX3BhZ2VfY2xlYW4ocGFnZSk7CiAJ
fQogCiAJLyoKQEAgLTQ2ODgsNiArNDY4OSw3IEBAIHZvaWQgc2V2X2hhbmRsZV9ybXBfZmF1bHQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsIHU2NCBlcnJvcl9jb2RlKQogCXN0cnVj
dCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3Q7CiAJc3RydWN0IGt2bSAqa3ZtID0gdmNwdS0+a3ZtOwog
CWludCBvcmRlciwgcm1wX2xldmVsLCByZXQ7CisJc3RydWN0IHBhZ2UgKnBhZ2U7CiAJYm9vbCBh
c3NpZ25lZDsKIAlrdm1fcGZuX3QgcGZuOwogCWdmbl90IGdmbjsKQEAgLTQ3MTQsNyArNDcxNiw3
IEBAIHZvaWQgc2V2X2hhbmRsZV9ybXBfZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFf
dCBncGEsIHU2NCBlcnJvcl9jb2RlKQogCQlyZXR1cm47CiAJfQogCi0JcmV0ID0ga3ZtX2dtZW1f
Z2V0X3Bmbihrdm0sIHNsb3QsIGdmbiwgJnBmbiwgJm9yZGVyKTsKKwlyZXQgPSBrdm1fZ21lbV9n
ZXRfcGZuKGt2bSwgc2xvdCwgZ2ZuLCAmcGZuLCAmcGFnZSwgJm9yZGVyKTsKIAlpZiAocmV0KSB7
CiAJCXByX3dhcm5fcmF0ZWxpbWl0ZWQoIlNFVjogVW5leHBlY3RlZCBSTVAgZmF1bHQsIG5vIGJh
Y2tpbmcgcGFnZSBmb3IgcHJpdmF0ZSBHUEEgMHglbGx4XG4iLAogCQkJCSAgICBncGEpOwpAQCAt
NDc3Miw3ICs0Nzc0LDcgQEAgdm9pZCBzZXZfaGFuZGxlX3JtcF9mYXVsdChzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsIGdwYV90IGdwYSwgdTY0IGVycm9yX2NvZGUpCiBvdXQ6CiAJdHJhY2Vfa3ZtX3Jt
cF9mYXVsdCh2Y3B1LCBncGEsIHBmbiwgZXJyb3JfY29kZSwgcm1wX2xldmVsLCByZXQpOwogb3V0
X25vX3RyYWNlOgotCXB1dF9wYWdlKHBmbl90b19wYWdlKHBmbikpOworCWt2bV9yZWxlYXNlX3Bh
Z2VfdW51c2VkKHBhZ2UpOwogfQogCiBzdGF0aWMgYm9vbCBpc19wZm5fcmFuZ2Vfc2hhcmVkKGt2
bV9wZm5fdCBzdGFydCwga3ZtX3Bmbl90IGVuZCkKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
a3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAppbmRleCAzYjlhZmI0MGU5MzUu
LjUwNDQ4M2QzNTE5NyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCisrKyBi
L2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaApAQCAtMjQ5MCwxMSArMjQ5MCwxMyBAQCBzdGF0aWMg
aW5saW5lIGJvb2wga3ZtX21lbV9pc19wcml2YXRlKHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3QgZ2Zu
KQogCiAjaWZkZWYgQ09ORklHX0tWTV9QUklWQVRFX01FTQogaW50IGt2bV9nbWVtX2dldF9wZm4o
c3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LAotCQkgICAgIGdm
bl90IGdmbiwga3ZtX3Bmbl90ICpwZm4sIGludCAqbWF4X29yZGVyKTsKKwkJICAgICBnZm5fdCBn
Zm4sIGt2bV9wZm5fdCAqcGZuLCBzdHJ1Y3QgcGFnZSAqKnBhZ2UsCisJCSAgICAgaW50ICptYXhf
b3JkZXIpOwogI2Vsc2UKIHN0YXRpYyBpbmxpbmUgaW50IGt2bV9nbWVtX2dldF9wZm4oc3RydWN0
IGt2bSAqa3ZtLAogCQkJCSAgIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsIGdmbl90IGdm
biwKLQkJCQkgICBrdm1fcGZuX3QgKnBmbiwgaW50ICptYXhfb3JkZXIpCisJCQkJICAga3ZtX3Bm
bl90ICpwZm4sIHN0cnVjdCBwYWdlICoqcGFnZSwKKwkJCQkgICBpbnQgKm1heF9vcmRlcikKIHsK
IAlLVk1fQlVHX09OKDEsIGt2bSk7CiAJcmV0dXJuIC1FSU87CmRpZmYgLS1naXQgYS92aXJ0L2t2
bS9ndWVzdF9tZW1mZC5jIGIvdmlydC9rdm0vZ3Vlc3RfbWVtZmQuYwppbmRleCA4YTg3OGU1N2M1
ZDQuLjQ3YTlmNjhmN2IyNCAxMDA2NDQKLS0tIGEvdmlydC9rdm0vZ3Vlc3RfbWVtZmQuYworKysg
Yi92aXJ0L2t2bS9ndWVzdF9tZW1mZC5jCkBAIC01OTQsNyArNTk0LDggQEAgc3RhdGljIHN0cnVj
dCBmb2xpbyAqX19rdm1fZ21lbV9nZXRfcGZuKHN0cnVjdCBmaWxlICpmaWxlLAogfQogCiBpbnQg
a3ZtX2dtZW1fZ2V0X3BmbihzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3Qg
KnNsb3QsCi0JCSAgICAgZ2ZuX3QgZ2ZuLCBrdm1fcGZuX3QgKnBmbiwgaW50ICptYXhfb3JkZXIp
CisJCSAgICAgZ2ZuX3QgZ2ZuLCBrdm1fcGZuX3QgKnBmbiwgc3RydWN0IHBhZ2UgKipwYWdlLAor
CQkgICAgIGludCAqbWF4X29yZGVyKQogewogCXBnb2ZmX3QgaW5kZXggPSBrdm1fZ21lbV9nZXRf
aW5kZXgoc2xvdCwgZ2ZuKTsKIAlzdHJ1Y3QgZmlsZSAqZmlsZSA9IGt2bV9nbWVtX2dldF9maWxl
KHNsb3QpOwpAQCAtNjE1LDcgKzYxNiwxMCBAQCBpbnQga3ZtX2dtZW1fZ2V0X3BmbihzdHJ1Y3Qg
a3ZtICprdm0sIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsCiAJCXIgPSBrdm1fZ21lbV9w
cmVwYXJlX2ZvbGlvKGt2bSwgc2xvdCwgZ2ZuLCBmb2xpbyk7CiAKIAlmb2xpb191bmxvY2soZm9s
aW8pOwotCWlmIChyIDwgMCkKKworCWlmICghcikKKwkJKnBhZ2UgPSBmb2xpb19maWxlX3BhZ2Uo
Zm9saW8sIGluZGV4KTsKKwllbHNlCiAJCWZvbGlvX3B1dChmb2xpbyk7CiAKIG91dDoKLS0gCjIu
NDcuMC5yYzEuMjg4LmcwNjI5OGQxNTI1LWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
