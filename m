Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3809EC04FDF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 23:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aP0adPAf8cP0Yy4OyWHTrGEmzcDwjUBZqw/w24LyDVI=; b=ryDXw/C6NQ1fn1d126MpdEvpKQ
	QaFQcrMyNLtCNfWbDX/VW+2XsCzAQwMiUkhI6pfyluxhN13pancvd6AWwbdKl2wDWCfKqt0ELkLJt
	zLTCg5eWNXHgFBYJ+hC8KuuC0zZjXNgfdkVQCRRzociIX0PD6JAVdrFO/50MTMLgQLvSSzYogPrBD
	CHcAoMJnGk5TQa5xKeVP94FjndaNVqrwSWq1rojMNmRaTsCE4VoyESd37QJdITquKltqonufUTXWQ
	qfwf8tWNMVOrwNtCkvrHE/33c1AyOUVTpL35LME5a10eINrhwh2kcNk1XIzz9laV6dhXVemvssT+d
	p+A7YNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVti-003dL7-0Q;
	Tue, 08 Aug 2023 23:13:54 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVtV-003d54-1h
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 23:13:45 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d4db57d2982so3885004276.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 16:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691536416; x=1692141216;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72O4JjoYZq3iLcv3bAZ3OmpFstwA2kMJRyaM4BuQEBE=;
        b=R5I5Z7dKsQM2VswHYUX2hskpPb2N83EoKFoKuLJn/BC4sXMaBnhcj99WCsAp5QKKyy
         7u+T5Ec3pR/25gv1e/zbEjRKzrqzDDJBAemw6R3xQC7KrPp7aJZJM4G22QpoAC0zp5kH
         UMXBmcZb9hsdnj+lbnSFw34hakifAJ7K53PQunN9SGCFq6Ui1dwSKqTlD9zEHfhXeHeP
         0bj76PocHyecHuyM+Ns81rvZC/L72J5BAdxXht2Ch/UnatoKkEOwofuDLlnsgpQl5qOl
         rYtHj2q1IH0XKliwZJi6cxMJX+B5xoJtpcJNKcE7br9I1vSodIwSHZA3qcZXR3rrOTTD
         QFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691536416; x=1692141216;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=72O4JjoYZq3iLcv3bAZ3OmpFstwA2kMJRyaM4BuQEBE=;
        b=Af+88fZxGyphvYcOxPA2vbkzEEMuHUAd473hcjHHGZ0hxMGXK/TOLOl875Rq4nKuQO
         NBsh6qk3H5m0JINEPll0oB98BHTNEC5Rn7R9JMqotvf/44AdKXQFo8Iw9rrWL2bZT/Ti
         yzIQBbEJ1t1AZawtysSIO5zhAD+s9RQ9qHHbSvVfYuewaB00VDbLSf5RXEuKqrnZBizf
         OKpqn9h6V78KEpvKyxIO1Hk30oePpNNsAaJkW22Ug9Abrz0JNXXYAnglo+/GoHkLWPVc
         8ZkDzOf/XPcFg0hoViReKmyZ/7dtTzl904yUByrdeWX4z2iNhE0fGRfcMzRgaierz9yH
         DAqw==
X-Gm-Message-State: AOJu0Ywc0WwecbDvhwgnv+VdR29Cr+caLTYA4pzfAhjxn+hg59uH7zYy
	8Oi2NfPUlspQyuTs9vsSGraTlu3Qz2AI
X-Google-Smtp-Source: AGHT+IE7fclKfZoTRFj3+JRtM/8w0lKPDLMergkPyAZ7GDrfovjgxJMs9LxY7VD7kflVGqJRYcLb7SZ/s4nQ
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:b94:0:b0:d4e:e2ae:e0c8 with SMTP id
 142-20020a250b94000000b00d4ee2aee0c8mr21899ybl.1.1691536416062; Tue, 08 Aug
 2023 16:13:36 -0700 (PDT)
Date: Tue,  8 Aug 2023 23:13:17 +0000
In-Reply-To: <20230808231330.3855936-1-rananta@google.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230808231330.3855936-2-rananta@google.com>
Subject: [PATCH v8 01/14] KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Anata <rananta@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_161341_565660_FA2D2243 
X-CRM114-Status: GOOD (  11.60  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogRGF2aWQgTWF0bGFjayA8ZG1hdGxhY2tAZ29vZ2xlLmNvbT4KClJlbmFtZSBrdm1fYXJj
aF9mbHVzaF9yZW1vdGVfdGxiKCkgYW5kIHRoZSBhc3NvY2lhdGVkIG1hY3JvCl9fS1ZNX0hBVkVf
QVJDSF9GTFVTSF9SRU1PVEVfVExCIHRvIGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzKCkgYW5k
Cl9fS1ZNX0hBVkVfQVJDSF9GTFVTSF9SRU1PVEVfVExCUyByZXNwZWN0aXZlbHkuCgpNYWtpbmcg
dGhlIG5hbWUgcGx1cmFsIG1hdGNoZXMga3ZtX2ZsdXNoX3JlbW90ZV90bGJzKCkgYW5kIG1ha2Vz
IGl0IG1vcmUKY2xlYXIgdGhhdCB0aGlzIGZ1bmN0aW9uIGNhbiBhZmZlY3QgbW9yZSB0aGFuIG9u
ZSByZW1vdGUgVExCLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCgpTaWduZWQtb2Zm
LWJ5OiBEYXZpZCBNYXRsYWNrIDxkbWF0bGFja0Bnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBS
YWdoYXZlbmRyYSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+ClJldmlld2VkLWJ5OiBH
YXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogU2hhb3FpbiBIdWFuZyA8
c2hhaHVhbmdAcmVkaGF0LmNvbT4KLS0tCiBhcmNoL21pcHMvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aCB8IDQgKystLQogYXJjaC9taXBzL2t2bS9taXBzLmMgICAgICAgICAgICAgfCAyICstCiBhcmNo
L3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICB8IDQgKystLQogaW5jbHVkZS9saW51eC9rdm1f
aG9zdC5oICAgICAgICAgfCA0ICsrLS0KIHZpcnQva3ZtL2t2bV9tYWluLmMgICAgICAgICAgICAg
IHwgMiArLQogNSBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL21p
cHMvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCAwNGNlZGY5Zjg4MTE1Li45YjBhZDhmM2Jm
MzI3IDEwMDY0NAotLS0gYS9hcmNoL21pcHMvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAorKysgYi9h
cmNoL21pcHMvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApAQCAtODk2LDcgKzg5Niw3IEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBrdm1fYXJjaF9zY2hlZF9pbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGlu
dCBjcHUpIHt9CiBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX2FyY2hfdmNwdV9ibG9ja2luZyhzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpIHt9CiBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX2FyY2hfdmNwdV91
bmJsb2NraW5nKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkge30KIAotI2RlZmluZSBfX0tWTV9IQVZF
X0FSQ0hfRkxVU0hfUkVNT1RFX1RMQgotaW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGIoc3Ry
dWN0IGt2bSAqa3ZtKTsKKyNkZWZpbmUgX19LVk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9UTEJT
CitpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnMoc3RydWN0IGt2bSAqa3ZtKTsKIAogI2Vu
ZGlmIC8qIF9fTUlQU19LVk1fSE9TVF9IX18gKi8KZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9rdm0v
bWlwcy5jIGIvYXJjaC9taXBzL2t2bS9taXBzLmMKaW5kZXggYWE1NTgzYTdiMDViZS4uNGI3YmMz
OWE0MTczNiAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2t2bS9taXBzLmMKKysrIGIvYXJjaC9taXBz
L2t2bS9taXBzLmMKQEAgLTk4MSw3ICs5ODEsNyBAQCB2b2lkIGt2bV9hcmNoX3N5bmNfZGlydHlf
bG9nKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdCkKIAog
fQogCi1pbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYihzdHJ1Y3Qga3ZtICprdm0pCitpbnQg
a3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnMoc3RydWN0IGt2bSAqa3ZtKQogewogCWt2bV9taXBz
X2NhbGxiYWNrcy0+cHJlcGFyZV9mbHVzaF9zaGFkb3coa3ZtKTsKIAlyZXR1cm4gMTsKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9rdm1faG9zdC5oCmluZGV4IDI4YmQzODMwM2Q3MDQuLmEyZDNjZmMyZWI3NWMgMTAwNjQ0
Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIvYXJjaC94ODYvaW5j
bHVkZS9hc20va3ZtX2hvc3QuaApAQCAtMTc5NCw4ICsxNzk0LDggQEAgc3RhdGljIGlubGluZSBz
dHJ1Y3Qga3ZtICprdm1fYXJjaF9hbGxvY192bSh2b2lkKQogI2RlZmluZSBfX0tWTV9IQVZFX0FS
Q0hfVk1fRlJFRQogdm9pZCBrdm1fYXJjaF9mcmVlX3ZtKHN0cnVjdCBrdm0gKmt2bSk7CiAKLSNk
ZWZpbmUgX19LVk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9UTEIKLXN0YXRpYyBpbmxpbmUgaW50
IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGIoc3RydWN0IGt2bSAqa3ZtKQorI2RlZmluZSBfX0tW
TV9IQVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RMQlMKK3N0YXRpYyBpbmxpbmUgaW50IGt2bV9hcmNo
X2ZsdXNoX3JlbW90ZV90bGJzKHN0cnVjdCBrdm0gKmt2bSkKIHsKIAlpZiAoa3ZtX3g4Nl9vcHMu
Zmx1c2hfcmVtb3RlX3RsYnMgJiYKIAkgICAgIXN0YXRpY19jYWxsKGt2bV94ODZfZmx1c2hfcmVt
b3RlX3RsYnMpKGt2bSkpCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggYi9p
bmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKaW5kZXggOWQzYWM3NzIwZGE5Zi4uZTNmOTY4YjM4YWU5
NyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCisrKyBiL2luY2x1ZGUvbGlu
dXgva3ZtX2hvc3QuaApAQCAtMTQ3OSw4ICsxNDc5LDggQEAgc3RhdGljIGlubGluZSB2b2lkIGt2
bV9hcmNoX2ZyZWVfdm0oc3RydWN0IGt2bSAqa3ZtKQogfQogI2VuZGlmCiAKLSNpZm5kZWYgX19L
Vk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9UTEIKLXN0YXRpYyBpbmxpbmUgaW50IGt2bV9hcmNo
X2ZsdXNoX3JlbW90ZV90bGIoc3RydWN0IGt2bSAqa3ZtKQorI2lmbmRlZiBfX0tWTV9IQVZFX0FS
Q0hfRkxVU0hfUkVNT1RFX1RMQlMKK3N0YXRpYyBpbmxpbmUgaW50IGt2bV9hcmNoX2ZsdXNoX3Jl
bW90ZV90bGJzKHN0cnVjdCBrdm0gKmt2bSkKIHsKIAlyZXR1cm4gLUVOT1RTVVBQOwogfQpkaWZm
IC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKaW5kZXgg
ZGZiYWFmYmUzYTAwOS4uNzBlNTQ3OTc5N2FjMyAxMDA2NDQKLS0tIGEvdmlydC9rdm0va3ZtX21h
aW4uYworKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCkBAIC0zNjEsNyArMzYxLDcgQEAgdm9pZCBr
dm1fZmx1c2hfcmVtb3RlX3RsYnMoc3RydWN0IGt2bSAqa3ZtKQogCSAqIGt2bV9tYWtlX2FsbF9j
cHVzX3JlcXVlc3QoKSByZWFkcyB2Y3B1LT5tb2RlLiBXZSByZXVzZSB0aGF0CiAJICogYmFycmll
ciBoZXJlLgogCSAqLwotCWlmICgha3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYihrdm0pCisJaWYg
KCFrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxicyhrdm0pCiAJICAgIHx8IGt2bV9tYWtlX2FsbF9j
cHVzX3JlcXVlc3Qoa3ZtLCBLVk1fUkVRX1RMQl9GTFVTSCkpCiAJCSsra3ZtLT5zdGF0LmdlbmVy
aWMucmVtb3RlX3RsYl9mbHVzaDsKIH0KLS0gCjIuNDEuMC42NDAuZ2E5NWRlZjU1ZDAtZ29vZwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
