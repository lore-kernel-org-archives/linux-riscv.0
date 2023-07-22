Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE831C001DF
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 02:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=H0BC3Ht8r9nIWG64hgDwOUE1fggGhYIgf5ENF9gG/Rs=; b=xYpg3d3Hpf+GVPOcKY32/7hGKU
	nJmwoY5eCbeCJ3Hh+o1nLSmBYKmC9qlc8myfK5ddlRvirGt1xpsx5YgF6/uwMGM3roG5SJ84F8LMA
	9yo+hcScTzK80oRI5O/IfOJMVMhlRNoiF1sTgs5n3iny+kOD+5fUQ3KtQcKfVRNYsu0uW4gw+Ztet
	oNFmgFkJgJebJi3wclCwW2hha/2ST/PCJ7NsXgbTOS2Bo+dPtcqGeBsOWDehp1pseWnmqhnZcsjJf
	+5UQk2sLxlcsrvVHwVd+U/OsccO/ielMWFCBbEAjygyPMob6/67AzGBlGiFX9XQDGPQQbuJPTab9/
	zCcYKL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2H6-00Fc3P-1y;
	Sat, 22 Jul 2023 02:23:16 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2Gq-00Fbq5-0l
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 02:23:03 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c8f360a07a2so2487113276.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 19:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689992576; x=1690597376;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVLGuKEjQProJqaPfm81PXZA82sh3ahc82iDRViuago=;
        b=DaLEp3aJ4g6CjdnA0OVj9WkB7kkXMt625ketI1mIwG+OhRkvRKCPCtKyHBL2UCAqYY
         6BncKNylF6VcSIGB7t2n3Dn5CSP5pExm4CWXgG/7FBXwJBN/sfbQoQJkNHBRmm7ty36B
         MUq7scacSqWfqYq+g6x5myBi0MtQ00UJ8FS4/ZD3t5CVrpw1PJguOOGojtWyaSDCq8CR
         wxIhR/Ia0t1mcVqGNVHspJivlXBaENEiQmQfnWiNVUDMkH86T6m391vIAog4sIm8/2iB
         pyqjcZ0+mz+4rKI9vVwdSw+mUeLYWB0SqtgAVPENuunzVlpmitoCGeYAkoQ9ERKGNqdJ
         aPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689992576; x=1690597376;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UVLGuKEjQProJqaPfm81PXZA82sh3ahc82iDRViuago=;
        b=MDmXdwvcV//r2nNuLiRHM64OfRrTwtRyFsiOXYK7ghjPzlQHCBYqJ3EcIaGhUDfAs3
         a0U9kkzBSWRcannr6/TsVEuT4fdTX24keF3PmnswJzh5bKm1K7ZGVAnztV0xKJXWvA5z
         7X9I3DdA3sS2qVhM2IAQB+r3ZYqE1Hxo5FSgn38cYNKjpQ/L1uY0Gmoxk2ekdQEBJKT3
         dTF7CUYPQZGoB8FvsaVAV3Qlgy0m0GUT488Fzna/g8s6Xu7T0AJhwAovrsexLpI7s1el
         OjCmU1bxzt+pijTidJKjD+qkyMhoa/T2+hA1sa8N63WT+Xa0y//w6rChCIO8A58xHMx7
         YqxQ==
X-Gm-Message-State: ABy/qLYcrH+PsU2LIbzUVof6g+bvmEqNRkZ1R07DxdGD6RejnCUmuoQ9
	FyBfKqbPmaocXmu81/uxTsUwEM5OttQZ
X-Google-Smtp-Source: APBJJlHQe7Y3wSceME6OjPlLqlGW70YZjKObimLmg37ClQQ8eARD2Nzbb/mjJTiI0hLe3HTUEbMa1eTVRYUZ
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6902:10cd:b0:c1c:df23:44ee with SMTP
 id w13-20020a05690210cd00b00c1cdf2344eemr27095ybu.0.1689992576195; Fri, 21
 Jul 2023 19:22:56 -0700 (PDT)
Date: Sat, 22 Jul 2023 02:22:40 +0000
In-Reply-To: <20230722022251.3446223-1-rananta@google.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230722022251.3446223-2-rananta@google.com>
Subject: [PATCH v7 01/12] KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Anata <rananta@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Gavin Shan <gshan@redhat.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_192300_297901_AB41EB59 
X-CRM114-Status: GOOD (  10.59  )
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
cHMvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCAwNGNlZGY5Zjg4MTEuLjliMGFkOGYzYmYz
MiAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIvYXJj
aC9taXBzL2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTg5Niw3ICs4OTYsNyBAQCBzdGF0aWMg
aW5saW5lIHZvaWQga3ZtX2FyY2hfc2NoZWRfaW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQg
Y3B1KSB7fQogc3RhdGljIGlubGluZSB2b2lkIGt2bV9hcmNoX3ZjcHVfYmxvY2tpbmcoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KSB7fQogc3RhdGljIGlubGluZSB2b2lkIGt2bV9hcmNoX3ZjcHVfdW5i
bG9ja2luZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpIHt9CiAKLSNkZWZpbmUgX19LVk1fSEFWRV9B
UkNIX0ZMVVNIX1JFTU9URV9UTEIKLWludCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxiKHN0cnVj
dCBrdm0gKmt2bSk7CisjZGVmaW5lIF9fS1ZNX0hBVkVfQVJDSF9GTFVTSF9SRU1PVEVfVExCUwor
aW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzKHN0cnVjdCBrdm0gKmt2bSk7CiAKICNlbmRp
ZiAvKiBfX01JUFNfS1ZNX0hPU1RfSF9fICovCmRpZmYgLS1naXQgYS9hcmNoL21pcHMva3ZtL21p
cHMuYyBiL2FyY2gvbWlwcy9rdm0vbWlwcy5jCmluZGV4IGFhNTU4M2E3YjA1Yi4uNGI3YmMzOWE0
MTczIDEwMDY0NAotLS0gYS9hcmNoL21pcHMva3ZtL21pcHMuYworKysgYi9hcmNoL21pcHMva3Zt
L21pcHMuYwpAQCAtOTgxLDcgKzk4MSw3IEBAIHZvaWQga3ZtX2FyY2hfc3luY19kaXJ0eV9sb2co
c3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICptZW1zbG90KQogCiB9CiAK
LWludCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxiKHN0cnVjdCBrdm0gKmt2bSkKK2ludCBrdm1f
YXJjaF9mbHVzaF9yZW1vdGVfdGxicyhzdHJ1Y3Qga3ZtICprdm0pCiB7CiAJa3ZtX21pcHNfY2Fs
bGJhY2tzLT5wcmVwYXJlX2ZsdXNoX3NoYWRvdyhrdm0pOwogCXJldHVybiAxOwpkaWZmIC0tZ2l0
IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNt
L2t2bV9ob3N0LmgKaW5kZXggMjhiZDM4MzAzZDcwLi5hMmQzY2ZjMmViNzUgMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9h
c20va3ZtX2hvc3QuaApAQCAtMTc5NCw4ICsxNzk0LDggQEAgc3RhdGljIGlubGluZSBzdHJ1Y3Qg
a3ZtICprdm1fYXJjaF9hbGxvY192bSh2b2lkKQogI2RlZmluZSBfX0tWTV9IQVZFX0FSQ0hfVk1f
RlJFRQogdm9pZCBrdm1fYXJjaF9mcmVlX3ZtKHN0cnVjdCBrdm0gKmt2bSk7CiAKLSNkZWZpbmUg
X19LVk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9UTEIKLXN0YXRpYyBpbmxpbmUgaW50IGt2bV9h
cmNoX2ZsdXNoX3JlbW90ZV90bGIoc3RydWN0IGt2bSAqa3ZtKQorI2RlZmluZSBfX0tWTV9IQVZF
X0FSQ0hfRkxVU0hfUkVNT1RFX1RMQlMKK3N0YXRpYyBpbmxpbmUgaW50IGt2bV9hcmNoX2ZsdXNo
X3JlbW90ZV90bGJzKHN0cnVjdCBrdm0gKmt2bSkKIHsKIAlpZiAoa3ZtX3g4Nl9vcHMuZmx1c2hf
cmVtb3RlX3RsYnMgJiYKIAkgICAgIXN0YXRpY19jYWxsKGt2bV94ODZfZmx1c2hfcmVtb3RlX3Rs
YnMpKGt2bSkpCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggYi9pbmNsdWRl
L2xpbnV4L2t2bV9ob3N0LmgKaW5kZXggOWQzYWM3NzIwZGE5Li5lM2Y5NjhiMzhhZTkgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAorKysgYi9pbmNsdWRlL2xpbnV4L2t2bV9o
b3N0LmgKQEAgLTE0NzksOCArMTQ3OSw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1fYXJjaF9m
cmVlX3ZtKHN0cnVjdCBrdm0gKmt2bSkKIH0KICNlbmRpZgogCi0jaWZuZGVmIF9fS1ZNX0hBVkVf
QVJDSF9GTFVTSF9SRU1PVEVfVExCCi1zdGF0aWMgaW5saW5lIGludCBrdm1fYXJjaF9mbHVzaF9y
ZW1vdGVfdGxiKHN0cnVjdCBrdm0gKmt2bSkKKyNpZm5kZWYgX19LVk1fSEFWRV9BUkNIX0ZMVVNI
X1JFTU9URV9UTEJTCitzdGF0aWMgaW5saW5lIGludCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxi
cyhzdHJ1Y3Qga3ZtICprdm0pCiB7CiAJcmV0dXJuIC1FTk9UU1VQUDsKIH0KZGlmZiAtLWdpdCBh
L3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCmluZGV4IGRmYmFhZmJl
M2EwMC4uNzBlNTQ3OTc5N2FjIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5jCisrKyBi
L3ZpcnQva3ZtL2t2bV9tYWluLmMKQEAgLTM2MSw3ICszNjEsNyBAQCB2b2lkIGt2bV9mbHVzaF9y
ZW1vdGVfdGxicyhzdHJ1Y3Qga3ZtICprdm0pCiAJICoga3ZtX21ha2VfYWxsX2NwdXNfcmVxdWVz
dCgpIHJlYWRzIHZjcHUtPm1vZGUuIFdlIHJldXNlIHRoYXQKIAkgKiBiYXJyaWVyIGhlcmUuCiAJ
ICovCi0JaWYgKCFrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxiKGt2bSkKKwlpZiAoIWt2bV9hcmNo
X2ZsdXNoX3JlbW90ZV90bGJzKGt2bSkKIAkgICAgfHwga3ZtX21ha2VfYWxsX2NwdXNfcmVxdWVz
dChrdm0sIEtWTV9SRVFfVExCX0ZMVVNIKSkKIAkJKytrdm0tPnN0YXQuZ2VuZXJpYy5yZW1vdGVf
dGxiX2ZsdXNoOwogfQotLSAKMi40MS4wLjQ4Ny5nNmQ3MmYzZTk5NS1nb29nCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
