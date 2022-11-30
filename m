Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82269C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqT00xNO+yFr3AGLTNhwFHtI3gAW9XwYJnm8rgWNkfM=; b=veRb2e9OwqVjD3
	rxOq69AjvO6RVwJvtR/ckS/3BDi7hximdjGWLv+hpODYsmGMlctQ3+t0aOf4IejFa8gKtEXIr0Zkn
	2Q6FBasTsOI7rrz4A2s8PYbp3rcBWK0sUhGnSUCM61S6PRSdyTUOS3pNbkKgVUML0caBNR9Ynr2xc
	0Ptqho2e2qzIBb4jQAv0ESy/oNdKnPZw2R20PaI6/RTS0rFCiQJRKrb1lVp522KmnZr17xDpGr2tl
	VRbBl4Zt7zjlPHPudklaQmaFDNnAy1nSqhjkklprH6oPzURF/EnYGCQLGqudDinyjSdneh8FbxE4l
	3K0I6BTK8OKT5VKgRluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0X3T-003TGT-GE; Thu, 01 Dec 2022 00:03:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Wba-003Gqn-0Z
	for linux-riscv@bombadil.infradead.org; Wed, 30 Nov 2022 23:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Reply-To:Sender:Content-ID:Content-Description;
	bh=uj+BMG24gpugAApyuMjfHhGTokqhj/HfOHcPzx/7Ixc=; b=UJTUJ2lC+l2Brpf71fQVpjYfuo
	0WAIukDvvcKrx5Uv336X4By6BkkThR1oMc5pEJDI7OMwSc4Vy1GkM/P7b5dleInOhnktvy0ofPE8X
	jcs88lftF2WfVVnNGAIRB9bWTA0lqKKSGwwK8d2RPcE5cRgg896lDzIlaB7IgPj7nISmq1R4807h1
	oHel3DOwoyk+25tfRWV5DwFxFbtPYJmklSeVBTaTbnlYze6NekWQyEwvdbhjQaPGDfwDIkopH7cEj
	W+r+Gbyh5D0PNOqrlPEdR30U4tFEv5scHLx8a+F/qe81Mw9DyOaKgWKmaPjUvAQW/RprQhcRrOTX/
	0fztaQpw==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDf-00FPr8-8B
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:10:25 +0000
Received: by mail-pj1-x104a.google.com with SMTP id mh8-20020a17090b4ac800b0021348e084a0so3775625pjb.8
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj+BMG24gpugAApyuMjfHhGTokqhj/HfOHcPzx/7Ixc=;
        b=rXveYksPcbHAdLQWx0Se3mgCcQvIusgWV2YBwsk350kO+gwstaEEoshUZTFpuvac++
         pLds7vX8HQyFV+EXcCsNs4Huph1CvEcQOXAAAxG85uCm3rCCbxscdft2ZxjRveL1foHX
         Lrax89MRhf3bE1bAwMOLphkpziYLo/XzKTjZtkj0KrWsaZWT2gVodfm1c5joltsrB5eF
         W0icMxnX0hgljPZjSz6UkymZcq3fcWnGh4feMzJb8fuOAJykHj0A+tcjteTkrK4SYiHc
         +b7l66OJ0teH4JUbB2xCLD5wxFKLZ8CELPJsM7W7cN4l69kYm6xFX8ZvCrFTJGzWVhEq
         HM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uj+BMG24gpugAApyuMjfHhGTokqhj/HfOHcPzx/7Ixc=;
        b=eiwj6QI/J/0MKVmiv8QHvDfd1RxFB/HQyVNl6x5tdAjdUXdjCik+zRf+7HEjtYx+PY
         Adai5mL2BTaBVoPQB7IO9mGBr7ZBiXyisInaiiyCp2mUdpaqVoSx+sLgRsJ6PMbx6qoS
         ZWMmWSJ2qeKZiDRTz8ANnt5FWoHlkaZ/sZDCFlDvINpvU6KVIOwmPzuBqvhyZEogD7wG
         pWoJFw/hfPk1lr7Mtl3fV1OTL9STqUboyWktfvIHN6NV7bKs5GfMnwQ206PIw9lT/EJN
         Di452KM200I94wq28NGBvDiyku0x3GMSxsbTv2ZZUsBea+5yrtatomv/wET1sOqggc38
         Mp/g==
X-Gm-Message-State: ANoB5pk00PVVZtl4HCDMZooZsjM+bpK3wjLxHEg1eVTwAPbkoegi+lvR
	MvbdNt+wmZaTDlj42C2ztpouM6I3jlI=
X-Google-Smtp-Source: AA0mqf4xYnJCkXbWk/N31ZRo5enbQfT7p8hAsoCQiyumsmQYs6alw3yUJytbRmVQwuUcUkB1fPIndjJ7nUc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1624:b0:573:993b:ea6d with SMTP id
 e4-20020a056a00162400b00573993bea6dmr46050829pfc.10.1669849814934; Wed, 30
 Nov 2022 15:10:14 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:06 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-23-seanjc@google.com>
Subject: [PATCH v2 22/50] KVM: MIPS: Setup VZ emulation? directly from kvm_mips_init()
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
X-CRM114-CacheID: sfid-20221130_231023_407496_364C9C5B 
X-CRM114-Status: GOOD (  10.23  )
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

SW52b2tlIGt2bV9taXBzX2VtdWxhdGlvbl9pbml0KCkgZGlyZWN0bHkgZnJvbSBrdm1fbWlwc19p
bml0KCkgaW5zdGVhZApvZiBib3VuY2luZyB0aHJvdWdoIGt2bV9pbml0KCk9Pmt2bV9hcmNoX2lu
aXQoKS4gIEZ1bmN0aW9uYWxseSwgdGhpcyBpcwphIGdsb3JpZmllZCBub3AgYXMgaW52b2tpbmcg
a3ZtX2FyY2hfaW5pdCgpIGlzIHRoZSB2ZXJ5IGZpcnN0IGFjdGlvbgpwZXJmb3JtZWQgYnkga3Zt
X2luaXQoKS4KCkVtcHR5aW5nIGt2bV9hcmNoX2luaXQoKSB3aWxsIGFsbG93IGRyb3BwaW5nIHRo
ZSBob29rIGVudGlyZWx5IG9uY2UgYWxsCmFyY2hpdGVjdHVyZSBpbXBsZW1lbnRhdGlvbnMgYXJl
IG5vcHMuCgpObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KClNpZ25lZC1vZmYtYnk6IFNl
YW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgotLS0KIGFyY2gvbWlwcy9rdm0v
bWlwcy5jIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL21pcHMva3ZtL21pcHMuYyBiL2FyY2gvbWlwcy9r
dm0vbWlwcy5jCmluZGV4IGYwYTZjMjQ1ZDFmZi4uNzU2ODEyODFlMmRmIDEwMDY0NAotLS0gYS9h
cmNoL21pcHMva3ZtL21pcHMuYworKysgYi9hcmNoL21pcHMva3ZtL21pcHMuYwpAQCAtMTAxMiw3
ICsxMDEyLDcgQEAgbG9uZyBrdm1fYXJjaF92bV9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlscCwgdW5z
aWduZWQgaW50IGlvY3RsLCB1bnNpZ25lZCBsb25nIGFyZykKIAogaW50IGt2bV9hcmNoX2luaXQo
dm9pZCAqb3BhcXVlKQogewotCXJldHVybiBrdm1fbWlwc19lbXVsYXRpb25faW5pdCgpOworCXJl
dHVybiAwOwogfQogCiB2b2lkIGt2bV9hcmNoX2V4aXQodm9pZCkKQEAgLTE2MzYsNiArMTYzNiwx
MCBAQCBzdGF0aWMgaW50IF9faW5pdCBrdm1fbWlwc19pbml0KHZvaWQpCiAJaWYgKHJldCkKIAkJ
cmV0dXJuIHJldDsKIAorCXJldCA9IGt2bV9taXBzX2VtdWxhdGlvbl9pbml0KCk7CisJaWYgKHJl
dCkKKwkJcmV0dXJuIHJldDsKKwogCXJldCA9IGt2bV9pbml0KE5VTEwsIHNpemVvZihzdHJ1Y3Qg
a3ZtX3ZjcHUpLCAwLCBUSElTX01PRFVMRSk7CiAKIAlpZiAocmV0KQotLSAKMi4zOC4xLjU4NC5n
MGYzYzU1ZDRjMi1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
