Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152A3CFC5F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FLuYqcYfYKO0YFOyI00fJurPtgxOjQDWgl3qcjFFzs=; b=dpZoV2PWjIHtX8
	4yy+VTKqvdjGy1ol4ydrOXUPm510tK2HXD9QX/1haPcpeBCSeHRJD/keLd84Q+LDeKq1UnnwLA0jM
	qnHG7izy2vsHHEVtBMoLkTuLwhoG+gxhfn6r6bMr1eEnsqQ9wt4ub2JJEt02hB9K8AoKYe7Yy5dbH
	N0w/P+xNEUkpB3bUiEm8Utaa5z+59n/RR20nGVqgAKOULKeNk6Zree5EC04DtKGm16Zv40vLj3b9y
	s+jVvV2/37EiflhO+zEP1GvgOcjDePIO3AHx84KUYxeHSPOCxsMjjl8hdCFE88zoYGG3WWLrq3q+s
	EHgiiDi9tExVdu9dSnQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyDm-0000000DzUL-3exi;
	Thu, 10 Oct 2024 18:49:10 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxr0-0000000DqBR-2Jd7
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:40 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e2605ce4276so2179754276.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584737; x=1729189537; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMgO/JDFhWAWu7Wkr7+zBWYfApHhI977J8rKw7ML51Y=;
        b=hgOyYvQjo5Iks6jmfsYRhhZ653J3E4BLCYk0mKm4K/P7+ujw/kMs5SrTQfCdhu/xHN
         Db+HLZdiVwPcx0XNx4loznLbHChfVsgKxjMvnZidzMISqKM77GaWqQSFWintuPV3lTQX
         5jNj8pMXtm3F6/AV4ag8agFO4lZ7LmFFe8bcXThkRc/3+NJnsaMCjPEnLChuYTVFTwIB
         CFbpbYCm8WEOCdmDdlAYfY1rbx6mzZGqqXQreWnDdlkTfbmZbXswSTw+o5ATOZGDgKiM
         JIQWUJLrwQQWH02X0iNjAYXuGRrfA3GmkUw6L3I4X7spPpuDh3EtI/himbevDZ/o1cjm
         qkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584737; x=1729189537;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IMgO/JDFhWAWu7Wkr7+zBWYfApHhI977J8rKw7ML51Y=;
        b=fAhL4oRDHKiTzGX8i7G0I099W2UcpncYcNBXXkt1dz6+aTbWnjGuA900Lie+DXmwoC
         HsQMMTJAIYDg1cBFHgq3I+3igrXG0VqtWQwcNvDvm0RvzqbUI3wQbfgEgfWGF0jqKtIc
         IDes59v7CfE3IElToNZ8sftNlnqWc0BcyQg54YgF12lsqplpOyrE1OfUG59uUN9HTgGI
         UBKZIp+YYssQV6RP6ICRMj3cegXkpgJ/tB7n7aro0s/8Ptm5toB0OTW6wqlAEYTqBBeY
         l6/isNaHc74i5CWOmQaE4navHPuNihfE2ZJajsbCsOTi8kLPoAokKnpOqHLLyqIc82R+
         oQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdhQpmCTwWTJSPNwWMP3ms96DHq6WFBMheFgeoQ9Oaw5Obgjae9rsEyxPepcDAKqCspdjLARl4bGHlhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxGflMWEUAv/B9gtJVDFTFVqIiOSLO7E3Iy+rsbnujYByN5jSS
	sLnXq9n4zeI+VB5roBYSSVcXmNpWmEoVMDbY4N4VNsP5cO/leqDjg6kUjD5VAJdmhQdu4fQuW6Z
	4Mw==
X-Google-Smtp-Source: AGHT+IGlSN4X6DbrP5DPPe6+MPgoNlxMoOT3GZzpJV2jr+xnXsAJlzTjTlsnBYkwN+CsyuU9UJbLGW89hxk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:c70a:0:b0:e28:eae7:f84a with SMTP id
 3f1490d57ef6-e28fe0feaecmr5507276.0.1728584736880; Thu, 10 Oct 2024 11:25:36
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:23 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-22-seanjc@google.com>
Subject: [PATCH v13 21/85] KVM: Explicitly initialize all fields at the start
 of kvm_vcpu_map()
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
X-CRM114-CacheID: sfid-20241010_112538_693348_2E5AB0CE 
X-CRM114-Status: GOOD (  10.01  )
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

RXhwbGljaXRseSBpbml0aWFsaXplIHRoZSBlbnRpcmUga3ZtX2hvc3RfbWFwIHN0cnVjdHVyZSB3
aGVuIG1hcHBpbmcgYQpwZm4sIGFzIHNvbWUgY2FsbGVycyBkZWNsYXJlIHRoZWlyIHN0cnVjdCBv
biB0aGUgc3RhY2ssIGkuZS4gZG9uJ3QKemVyby1pbml0aWFsaXplIHRoZSBzdHJ1Y3QsIHdoaWNo
IG1ha2VzIHRoZSBtYXAtPmh2YSBpbiBrdm1fdmNwdV91bm1hcCgpCip2ZXJ5KiBzdXNwZWN0LgoK
VGVzdGVkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+ClNpZ25lZC1v
ZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgotLS0KIHZpcnQv
a3ZtL2t2bV9tYWluLmMgfCA0MCArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKaW5k
ZXggYzc2OTFiYzQwMzg5Li5mMWM5YTc4MTMxNWMgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2bV9t
YWluLmMKKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwpAQCAtMzA2NywzMiArMzA2NywyNCBAQCB2
b2lkIGt2bV9yZWxlYXNlX3Bmbihrdm1fcGZuX3QgcGZuLCBib29sIGRpcnR5KQogCiBpbnQga3Zt
X3ZjcHVfbWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ2ZuX3QgZ2ZuLCBzdHJ1Y3Qga3ZtX2hv
c3RfbWFwICptYXApCiB7Ci0Ja3ZtX3Bmbl90IHBmbjsKLQl2b2lkICpodmEgPSBOVUxMOwotCXN0
cnVjdCBwYWdlICpwYWdlID0gS1ZNX1VOTUFQUEVEX1BBR0U7Ci0KLQlwZm4gPSBnZm5fdG9fcGZu
KHZjcHUtPmt2bSwgZ2ZuKTsKLQlpZiAoaXNfZXJyb3Jfbm9zbG90X3BmbihwZm4pKQotCQlyZXR1
cm4gLUVJTlZBTDsKLQotCWlmIChwZm5fdmFsaWQocGZuKSkgewotCQlwYWdlID0gcGZuX3RvX3Bh
Z2UocGZuKTsKLQkJaHZhID0ga21hcChwYWdlKTsKLSNpZmRlZiBDT05GSUdfSEFTX0lPTUVNCi0J
fSBlbHNlIHsKLQkJaHZhID0gbWVtcmVtYXAocGZuX3RvX2hwYShwZm4pLCBQQUdFX1NJWkUsIE1F
TVJFTUFQX1dCKTsKLSNlbmRpZgotCX0KLQotCWlmICghaHZhKQotCQlyZXR1cm4gLUVGQVVMVDsK
LQotCW1hcC0+cGFnZSA9IHBhZ2U7Ci0JbWFwLT5odmEgPSBodmE7Ci0JbWFwLT5wZm4gPSBwZm47
CisJbWFwLT5wYWdlID0gS1ZNX1VOTUFQUEVEX1BBR0U7CisJbWFwLT5odmEgPSBOVUxMOwogCW1h
cC0+Z2ZuID0gZ2ZuOwogCi0JcmV0dXJuIDA7CisJbWFwLT5wZm4gPSBnZm5fdG9fcGZuKHZjcHUt
Pmt2bSwgZ2ZuKTsKKwlpZiAoaXNfZXJyb3Jfbm9zbG90X3BmbihtYXAtPnBmbikpCisJCXJldHVy
biAtRUlOVkFMOworCisJaWYgKHBmbl92YWxpZChtYXAtPnBmbikpIHsKKwkJbWFwLT5wYWdlID0g
cGZuX3RvX3BhZ2UobWFwLT5wZm4pOworCQltYXAtPmh2YSA9IGttYXAobWFwLT5wYWdlKTsKKyNp
ZmRlZiBDT05GSUdfSEFTX0lPTUVNCisJfSBlbHNlIHsKKwkJbWFwLT5odmEgPSBtZW1yZW1hcChw
Zm5fdG9faHBhKG1hcC0+cGZuKSwgUEFHRV9TSVpFLCBNRU1SRU1BUF9XQik7CisjZW5kaWYKKwl9
CisKKwlyZXR1cm4gbWFwLT5odmEgPyAwIDogLUVGQVVMVDsKIH0KIEVYUE9SVF9TWU1CT0xfR1BM
KGt2bV92Y3B1X21hcCk7CiAKLS0gCjIuNDcuMC5yYzEuMjg4LmcwNjI5OGQxNTI1LWdvb2cKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
