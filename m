Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F7BC47089
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKKS7vybL4PITtJ4UkKD0agp2lCe9KTGFtIxsC4yvyo=; b=z1mcw55xxATkCi
	kEZ+8wiZcC1OX8HUAfsG4DBdup9paTAPHDVZ49Bu8305sUUhAcqeSH4ZilV5IYVnztYwc51fTKfUb
	RZ4jbd+UZaJCtHz+mQIhLFtAJ+7QCOuOrCYWZCmoNiN+tfFO3x2noVsuYrkOGScFudhNbRB6aEtIu
	9JC2x8kGOfCqFqpUUwoHbYOyX+GkyKx0c/9SYUE39Brf3i2+Wsf1hCmIPItWZdeme8sFYGZlGQ6NP
	0JAqBbtbCATMHKsrZs/eBsu0Ah9AHJOU1DKoE8jgrN9x5539ZG3fnR8EFOpmvr2e0kYbcy9RtiAPv
	aV0SnjtdNxI0YeqA66Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0X3L-003TD9-Lu; Thu, 01 Dec 2022 00:03:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WbZ-003Gqn-Kn
	for linux-riscv@bombadil.infradead.org; Wed, 30 Nov 2022 23:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Reply-To:Sender:Content-ID:Content-Description;
	bh=oZ/AA3AN9yZfFS+Yz2Hj0GA1Db97x+XE1LjIfmdmS/w=; b=jTG8VFC1rhfocd50wlYvyE+yUD
	fv/iXaG65fq/qisONL5gmZ6lsA71pA+7SAICoGHG1GP800pGbvLfJzQ4AqnEuuds2x1n7dMynCOCF
	a4LGJbwO3U1unCPGu1iPGYAqhdH7/3x6y5K7De2rPOAtdfX1H7qVm786YB3Z6pXFSU/lxGx7otbmO
	1VJVmXJZg9gC2Tq2sYCA2gUJE9ym/zpNT9Jh4TPD5eRHo3eORb/wkNXfMxIODnizQFyHB5omSUntO
	3JXfc3xdxPfLA8Nn+OAe/iOyVRFLlplbfaD8kTwfC4QrQ/h6owsWmdbAdCwXJ7VQC+hCrXxSj2AeF
	IffLAgfQ==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDo-00FPn6-Dt
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:10:34 +0000
Received: by mail-pl1-x649.google.com with SMTP id o8-20020a170902d4c800b001898ea5e030so11313737plg.13
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZ/AA3AN9yZfFS+Yz2Hj0GA1Db97x+XE1LjIfmdmS/w=;
        b=luHLl3WdRQNdBhH/vZv/hfYOmt9Q6vwep+qjtUAST73H1MF3LqvzoF2Ukv7UaDUlgb
         fXELwkqnEzgBN1h88nvzTImTYOnZGPEMito85bT2cMG/Dw2lvuyXP8zeBz8U2jGVs5tj
         pSDhoig8xe+6jwKUzsQZ0HNL6W7uKODl2j0YOlmoXogdfyORLlX0GkBhzBuT5EaiKGr7
         PCHzZt497tY3kEsEdxjbaw0LnCs8v3tH39skbarsReDUyuZOdzK6YVSLerydaPGb/0Z5
         eHv7VqvGcSRs3JMgPsz9Bq5kCqCHy9eUbAeqCz5po17CqSrTsXQffsEYVsh38nZQAmal
         lJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oZ/AA3AN9yZfFS+Yz2Hj0GA1Db97x+XE1LjIfmdmS/w=;
        b=tFWEQ7MiYE1mk2BqvQS47c1XTcRfgIAnPe8JsTCPrmwnfBHbJxW3D850WeS2pyuJRT
         i2vGCtxSq4tQRYpR/gacieenNVAOwwguFO/GaXo/20VJHw20HYD6AVCBWrYC7Af/N5xW
         +ihaVfYMVGnB96Q2b+aTfwE+fTlic8gUchP4iA1XFhd6Li2l1OKRKwlsf2v0mnufYZls
         knSdVQL5Rlw2OJrmZyisg6zZz4JP45Uxjb6cvWL+xyAHLKNLf4W5++3Izoooh1NeqtGi
         WhTvk/Dq+BE8S6FQvYBt6mv/7O6PUmwkQu/lqV4wRt47wSnKLxJ46JOFWSuixq6IDAmS
         Mp/w==
X-Gm-Message-State: ANoB5pmvxPzmzOenbqJ4LJyHpZhI/5pqnyDmeM3RXmxSO881clterqJq
	ABqNPviIRMWlZyKW5i8IsKvR/w4hoek=
X-Google-Smtp-Source: AA0mqf70Xm5b73dwbCTmumj9PiXG1e+aKYb1a7npTh2VM+OaIt1Kg/9NwT12H0mJEQDQr8PRUFC8axppjXM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f1c5:b0:189:39e4:c0ed with SMTP id
 e5-20020a170902f1c500b0018939e4c0edmr41790703plc.108.1669849824265; Wed, 30
 Nov 2022 15:10:24 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:11 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-28-seanjc@google.com>
Subject: [PATCH v2 27/50] KVM: s390: Do s390 specific init without bouncing
 through kvm_init()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>, 
	Cornelia Huck <cohuck@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Kai Huang <kai.huang@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_231032_522996_2D01B7FB 
X-CRM114-Status: GOOD (  11.57  )
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

TW92ZSB0aGUgZ3V0cyBvZiBrdm1fYXJjaF9pbml0KCkgaW50byBhIG5ldyBoZWxwZXIsIF9fa3Zt
X3MzOTBfaW5pdCgpLAphbmQgaW52b2tlIHRoZSBuZXcgaGVscGVyIGRpcmVjdGx5IGZyb20ga3Zt
X3MzOTBfaW5pdCgpIGluc3RlYWQgb2YKYm91bmNpbmcgdGhyb3VnaCBrdm1faW5pdCgpLiAgSW52
b2tpbmcga3ZtX2FyY2hfaW5pdCgpIGlzIHRoZSB2ZXJ5CmZpcnN0IGFjdGlvbiBwZXJmb3JtZWQg
Ynkga3ZtX2luaXQoKSwgaS5lLiB0aGlzIGlzIGEgZ2xvcmlmaWVkIG5vcC4KCk1vdmluZyBzZXR1
cCB0byBfX2t2bV9zMzkwX2luaXQoKSB3aWxsIGFsbG93IHRhZ2dpbmcgbW9yZSBmdW5jdGlvbnMg
YXMKX19pbml0LCBhbmQgZW1wdHlpbmcga3ZtX2FyY2hfaW5pdCgpIHdpbGwgYWxsb3cgZHJvcHBp
bmcgdGhlIGhvb2sKZW50aXJlbHkgb25jZSBhbGwgYXJjaGl0ZWN0dXJlIGltcGxlbWVudGF0aW9u
cyBhcmUgbm9wcy4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgoKU2lnbmVkLW9mZi1i
eTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+ClJldmlld2VkLWJ5OiBF
cmljIEZhcm1hbiA8ZmFybWFuQGxpbnV4LmlibS5jb20+ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+Ci0tLQogYXJjaC9zMzkwL2t2bS9rdm0t
czM5MC5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvczM5
MC9rdm0va3ZtLXMzOTAuYyBiL2FyY2gvczM5MC9rdm0va3ZtLXMzOTAuYwppbmRleCA4MjllNmUw
NDYwMDMuLjhjNGZjYWYyYmQzNiAxMDA2NDQKLS0tIGEvYXJjaC9zMzkwL2t2bS9rdm0tczM5MC5j
CisrKyBiL2FyY2gvczM5MC9rdm0va3ZtLXMzOTAuYwpAQCAtNDY5LDcgKzQ2OSw3IEBAIHN0YXRp
YyB2b2lkIGt2bV9zMzkwX2NwdV9mZWF0X2luaXQodm9pZCkKIAkgKi8KIH0KIAotaW50IGt2bV9h
cmNoX2luaXQodm9pZCAqb3BhcXVlKQorc3RhdGljIGludCBfX2t2bV9zMzkwX2luaXQodm9pZCkK
IHsKIAlpbnQgcmMgPSAtRU5PTUVNOwogCkBAIC01MjcsNyArNTI3LDcgQEAgaW50IGt2bV9hcmNo
X2luaXQodm9pZCAqb3BhcXVlKQogCXJldHVybiByYzsKIH0KIAotdm9pZCBrdm1fYXJjaF9leGl0
KHZvaWQpCitzdGF0aWMgdm9pZCBfX2t2bV9zMzkwX2V4aXQodm9pZCkKIHsKIAlnbWFwX3VucmVn
aXN0ZXJfcHRlX25vdGlmaWVyKCZnbWFwX25vdGlmaWVyKTsKIAlnbWFwX3VucmVnaXN0ZXJfcHRl
X25vdGlmaWVyKCZ2c2llX2dtYXBfbm90aWZpZXIpOwpAQCAtNTQxLDYgKzU0MSwxNiBAQCB2b2lk
IGt2bV9hcmNoX2V4aXQodm9pZCkKIAlkZWJ1Z191bnJlZ2lzdGVyKGt2bV9zMzkwX2RiZl91dik7
CiB9CiAKK2ludCBrdm1fYXJjaF9pbml0KHZvaWQgKm9wYXF1ZSkKK3sKKwlyZXR1cm4gMDsKK30K
Kwordm9pZCBrdm1fYXJjaF9leGl0KHZvaWQpCit7CisKK30KKwogLyogU2VjdGlvbjogZGV2aWNl
IHJlbGF0ZWQgKi8KIGxvbmcga3ZtX2FyY2hfZGV2X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLAog
CQkJdW5zaWduZWQgaW50IGlvY3RsLCB1bnNpZ25lZCBsb25nIGFyZykKQEAgLTU2OTYsNyArNTcw
Niw3IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBub25oeXBfbWFzayhpbnQgaSkKIAog
c3RhdGljIGludCBfX2luaXQga3ZtX3MzOTBfaW5pdCh2b2lkKQogewotCWludCBpOworCWludCBp
LCByOwogCiAJaWYgKCFzY2xwLmhhc19zaWVmMikgewogCQlwcl9pbmZvKCJTSUUgaXMgbm90IGF2
YWlsYWJsZVxuIik7CkBAIC01NzEyLDEyICs1NzIyLDIzIEBAIHN0YXRpYyBpbnQgX19pbml0IGt2
bV9zMzkwX2luaXQodm9pZCkKIAkJa3ZtX3MzOTBfZmFjX2Jhc2VbaV0gfD0KIAkJCXN0ZmxlX2Zh
Y19saXN0W2ldICYgbm9uaHlwX21hc2soaSk7CiAKLQlyZXR1cm4ga3ZtX2luaXQoTlVMTCwgc2l6
ZW9mKHN0cnVjdCBrdm1fdmNwdSksIDAsIFRISVNfTU9EVUxFKTsKKwlyID0gX19rdm1fczM5MF9p
bml0KCk7CisJaWYgKHIpCisJCXJldHVybiByOworCisJciA9IGt2bV9pbml0KE5VTEwsIHNpemVv
ZihzdHJ1Y3Qga3ZtX3ZjcHUpLCAwLCBUSElTX01PRFVMRSk7CisJaWYgKHIpIHsKKwkJX19rdm1f
czM5MF9leGl0KCk7CisJCXJldHVybiByOworCX0KKwlyZXR1cm4gMDsKIH0KIAogc3RhdGljIHZv
aWQgX19leGl0IGt2bV9zMzkwX2V4aXQodm9pZCkKIHsKIAlrdm1fZXhpdCgpOworCisJX19rdm1f
czM5MF9leGl0KCk7CiB9CiAKIG1vZHVsZV9pbml0KGt2bV9zMzkwX2luaXQpOwotLSAKMi4zOC4x
LjU4NC5nMGYzYzU1ZDRjMi1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
