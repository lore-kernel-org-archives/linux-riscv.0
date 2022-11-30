Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A37AC4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 23:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhyL/d23lAGY0nusa0IkqrEMNJg5jbRvWP0Z9pJvfhU=; b=qT2FT2sM3eVnM4
	KPa241iLrI6N2C2WD/JxVhZf3XG2LFoizt3C1QfWsQKD1PNSaT0JJw8eiVXk3/BreKs1yd0hefnYx
	HXJ2wOlhRYSg1dFaZWE3k/SzAU3/i2zhFjDH0wtBMPxqJNQC9smkZQuQkmHtBjCNtGrArPBGpXELS
	KIlGvlz95xjMDgr17QVd81Qku5W32QTIbnc6B9ITLmWN2vw4vq1+IZqtMDTi3eukTAh2Kp6A2JkIC
	/BQPm0NEuR9Wq4Xng3e0fpe1cjtUxgGlpJ9aaFT6mD/dUjnb4uYLIal67imvdcuq9FX61CAu6PBt8
	fw+KDjcgpTgw1hgE4rRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WeV-003I6n-O4; Wed, 30 Nov 2022 23:38:07 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WLe-003ANF-Cg
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:18:40 +0000
Received: by mail-pl1-x64a.google.com with SMTP id e11-20020a17090301cb00b001890e0c759aso19022890plh.5
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVoLyoA1Jf8VqqoJmf3pdlSBlpAks9cKaEAPUbSavnk=;
        b=KFEbVt71pG5AUxDCyfw0ctGx35DFJbafRPhU+Tsnxdpd7vRYtW7qd4JlQA8MVnYiNC
         cehxbeOYiyyiJPn7E6s9CwRwaN1xtow5SzScaD2RYcq+Nji7jijt1yTDk319fd1969N1
         0hHslGzgEV2mSg/GwYL0ydrtXmpf4YvER4m6AGCZSc6XSJVF8zd1Bqg0re/J+o1/el+G
         WN9quj9LAzi40hpkUTToXYBkooCrdruUHtSZrN/FsssQRzRW6TIEwt4ZtDDYuI4zno40
         xa3TZK20zvk7wc69EFj168eYu3J57rDplzSJfGRZtrl5uO5EY7/ALANxFIBtzt/BGToa
         XEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iVoLyoA1Jf8VqqoJmf3pdlSBlpAks9cKaEAPUbSavnk=;
        b=G9tlnZ3BXjUeeTGMjgRYY9QeoBBCnP5kERslMbhkmifF6xXbd0yThqhG41PZX9+jLV
         CyUEpu3q2QMINjTGFHcDcdppPml8K5BKsjsQyErelTuWfe63ZhjPYjtLUMIPJnsCw5nx
         O2YYXEErZGV4+8DAoVE9alQRsECCA0VxJX75MWd/mM5fuRUD/Fb7EFJ+HKAQUyUqhZU2
         sfR1ZmhFOtpXzI+QxP2UfBXcap5k8CauJYr9l323k4NpQJYAWQ2Vp7DZqLzaOVIQYFAb
         vacnPKQv1rqlC5pOcY2axkqLvXUc7M8OHXhIDsfEQFPnR3RTUMzi9G+opRXVM8G+bueD
         mgAg==
X-Gm-Message-State: ANoB5pmebCF52IvTwry58rSU2OyO7qTXY+1+wWbLXIf95qr0DGfxOCtV
	elArJ/cz2ThP8V4IjIqHwrXoJcT8Chs=
X-Google-Smtp-Source: AA0mqf5O0rusu3cm3dLUEYlhDw+Qxiq2LyoGZAlqfMmUzuZXBF2mSFTecgqLY6I58XZmsJ5ZtbkyHjCBrrY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:93a3:0:b0:575:c993:d318 with SMTP id
 x3-20020aa793a3000000b00575c993d318mr6951152pff.78.1669849827891; Wed, 30 Nov
 2022 15:10:27 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:13 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-30-seanjc@google.com>
Subject: [PATCH v2 29/50] KVM: Drop kvm_arch_{init,exit}() hooks
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
X-CRM114-CacheID: sfid-20221130_151838_477109_01503352 
X-CRM114-Status: GOOD (  14.14  )
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

RHJvcCBrdm1fYXJjaF9pbml0KCkgYW5kIGt2bV9hcmNoX2V4aXQoKSBub3cgdGhhdCBhbGwgaW1w
bGVtZW50YXRpb25zCmFyZSBub3BzLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCgpT
aWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KUmV2
aWV3ZWQtYnk6IEVyaWMgRmFybWFuIDxmYXJtYW5AbGludXguaWJtLmNvbT4JIyBzMzkwClJldmll
d2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+CkFja2Vk
LWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgotLS0KIGFyY2gvYXJtNjQva3Zt
L2FybS5jICAgICAgICAgICAgICAgIHwgMTEgLS0tLS0tLS0tLS0KIGFyY2gvbWlwcy9rdm0vbWlw
cy5jICAgICAgICAgICAgICAgIHwgMTAgLS0tLS0tLS0tLQogYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggfCAgMSAtCiBhcmNoL3Bvd2VycGMva3ZtL3Bvd2VycGMuYyAgICAgICAg
ICB8ICA1IC0tLS0tCiBhcmNoL3Jpc2N2L2t2bS9tYWluLmMgICAgICAgICAgICAgICB8ICA5IC0t
LS0tLS0tLQogYXJjaC9zMzkwL2t2bS9rdm0tczM5MC5jICAgICAgICAgICAgfCAxMCAtLS0tLS0t
LS0tCiBhcmNoL3g4Ni9rdm0veDg2LmMgICAgICAgICAgICAgICAgICB8IDEwIC0tLS0tLS0tLS0K
IGluY2x1ZGUvbGludXgva3ZtX2hvc3QuaCAgICAgICAgICAgIHwgIDMgLS0tCiB2aXJ0L2t2bS9r
dm1fbWFpbi5jICAgICAgICAgICAgICAgICB8IDE5ICsrLS0tLS0tLS0tLS0tLS0tLS0KIDkgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA3NiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2t2bS9hcm0uYyBiL2FyY2gvYXJtNjQva3ZtL2FybS5jCmluZGV4IDRkMzRh
YmNmYzlhOS4uOTM2ZWY3ZDFlYTk0IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2t2bS9hcm0uYwor
KysgYi9hcmNoL2FybTY0L2t2bS9hcm0uYwpAQCAtMjI4OSwxNyArMjI4OSw2IEBAIHN0YXRpYyBf
X2luaXQgaW50IGt2bV9hcm1faW5pdCh2b2lkKQogCXJldHVybiBlcnI7CiB9CiAKLWludCBrdm1f
YXJjaF9pbml0KHZvaWQgKm9wYXF1ZSkKLXsKLQlyZXR1cm4gMDsKLX0KLQotLyogTk9QOiBDb21w
aWxpbmcgYXMgYSBtb2R1bGUgbm90IHN1cHBvcnRlZCAqLwotdm9pZCBrdm1fYXJjaF9leGl0KHZv
aWQpCi17Ci0KLX0KLQogc3RhdGljIGludCBfX2luaXQgZWFybHlfa3ZtX21vZGVfY2ZnKGNoYXIg
KmFyZykKIHsKIAlpZiAoIWFyZykKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9rdm0vbWlwcy5jIGIv
YXJjaC9taXBzL2t2bS9taXBzLmMKaW5kZXggYWU3YTI0MzQyZmRmLi4zY2FkZTY0ODgyN2EgMTAw
NjQ0Ci0tLSBhL2FyY2gvbWlwcy9rdm0vbWlwcy5jCisrKyBiL2FyY2gvbWlwcy9rdm0vbWlwcy5j
CkBAIC0xMDEwLDE2ICsxMDEwLDYgQEAgbG9uZyBrdm1fYXJjaF92bV9pb2N0bChzdHJ1Y3QgZmls
ZSAqZmlscCwgdW5zaWduZWQgaW50IGlvY3RsLCB1bnNpZ25lZCBsb25nIGFyZykKIAlyZXR1cm4g
cjsKIH0KIAotaW50IGt2bV9hcmNoX2luaXQodm9pZCAqb3BhcXVlKQotewotCXJldHVybiAwOwot
fQotCi12b2lkIGt2bV9hcmNoX2V4aXQodm9pZCkKLXsKLQotfQotCiBpbnQga3ZtX2FyY2hfdmNw
dV9pb2N0bF9nZXRfc3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJCSAgc3RydWN0IGt2
bV9zcmVncyAqc3JlZ3MpCiB7CmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
a3ZtX2hvc3QuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IDVk
MmMzYTQ4N2U3My4uMGE4MGU4MGM3YjllIDEwMDY0NAotLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaAorKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aApAQCAtODgxLDcgKzg4MSw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1fYXJjaF9zeW5jX2V2
ZW50cyhzdHJ1Y3Qga3ZtICprdm0pIHt9CiBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX2FyY2hfbWVt
c2xvdHNfdXBkYXRlZChzdHJ1Y3Qga3ZtICprdm0sIHU2NCBnZW4pIHt9CiBzdGF0aWMgaW5saW5l
IHZvaWQga3ZtX2FyY2hfZmx1c2hfc2hhZG93X2FsbChzdHJ1Y3Qga3ZtICprdm0pIHt9CiBzdGF0
aWMgaW5saW5lIHZvaWQga3ZtX2FyY2hfc2NoZWRfaW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBp
bnQgY3B1KSB7fQotc3RhdGljIGlubGluZSB2b2lkIGt2bV9hcmNoX2V4aXQodm9pZCkge30KIHN0
YXRpYyBpbmxpbmUgdm9pZCBrdm1fYXJjaF92Y3B1X2Jsb2NraW5nKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkge30KIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1fYXJjaF92Y3B1X3VuYmxvY2tpbmcoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KSB7fQogCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva3ZtL3Bv
d2VycGMuYyBiL2FyY2gvcG93ZXJwYy9rdm0vcG93ZXJwYy5jCmluZGV4IGQ0NGI4NWJhOGNlZi4u
MDFkMGY5OTM1ZTZjIDEwMDY0NAotLS0gYS9hcmNoL3Bvd2VycGMva3ZtL3Bvd2VycGMuYworKysg
Yi9hcmNoL3Bvd2VycGMva3ZtL3Bvd2VycGMuYwpAQCAtMjUzOSwxMSArMjUzOSw2IEBAIHZvaWQg
a3ZtcHBjX2luaXRfbHBpZCh1bnNpZ25lZCBsb25nIG5yX2xwaWRzX3BhcmFtKQogfQogRVhQT1JU
X1NZTUJPTF9HUEwoa3ZtcHBjX2luaXRfbHBpZCk7CiAKLWludCBrdm1fYXJjaF9pbml0KHZvaWQg
Km9wYXF1ZSkKLXsKLQlyZXR1cm4gMDsKLX0KLQogRVhQT1JUX1RSQUNFUE9JTlRfU1lNQk9MX0dQ
TChrdm1fcHBjX2luc3RyKTsKIAogdm9pZCBrdm1fYXJjaF9jcmVhdGVfdmNwdV9kZWJ1Z2ZzKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGRlbnRyeSAqZGVidWdmc19kZW50cnkpCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9tYWluLmMgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKaW5k
ZXggY2IwNjNiOGE5YTBmLi40NzEwYTY3NTE2ODcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3Zt
L21haW4uYworKysgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKQEAgLTY1LDE1ICs2NSw2IEBAIHZv
aWQga3ZtX2FyY2hfaGFyZHdhcmVfZGlzYWJsZSh2b2lkKQogCWNzcl93cml0ZShDU1JfSElERUxF
RywgMCk7CiB9CiAKLWludCBrdm1fYXJjaF9pbml0KHZvaWQgKm9wYXF1ZSkKLXsKLQlyZXR1cm4g
MDsKLX0KLQotdm9pZCBrdm1fYXJjaF9leGl0KHZvaWQpCi17Ci19Ci0KIHN0YXRpYyBpbnQgX19p
bml0IHJpc2N2X2t2bV9pbml0KHZvaWQpCiB7CiAJY29uc3QgY2hhciAqc3RyOwpkaWZmIC0tZ2l0
IGEvYXJjaC9zMzkwL2t2bS9rdm0tczM5MC5jIGIvYXJjaC9zMzkwL2t2bS9rdm0tczM5MC5jCmlu
ZGV4IDY2ZDE2MjcyM2QyMS4uMjViMDhiOTU2ODg4IDEwMDY0NAotLS0gYS9hcmNoL3MzOTAva3Zt
L2t2bS1zMzkwLmMKKysrIGIvYXJjaC9zMzkwL2t2bS9rdm0tczM5MC5jCkBAIC01NDEsMTYgKzU0
MSw2IEBAIHN0YXRpYyB2b2lkIF9fa3ZtX3MzOTBfZXhpdCh2b2lkKQogCWRlYnVnX3VucmVnaXN0
ZXIoa3ZtX3MzOTBfZGJmX3V2KTsKIH0KIAotaW50IGt2bV9hcmNoX2luaXQodm9pZCAqb3BhcXVl
KQotewotCXJldHVybiAwOwotfQotCi12b2lkIGt2bV9hcmNoX2V4aXQodm9pZCkKLXsKLQotfQot
CiAvKiBTZWN0aW9uOiBkZXZpY2UgcmVsYXRlZCAqLwogbG9uZyBrdm1fYXJjaF9kZXZfaW9jdGwo
c3RydWN0IGZpbGUgKmZpbHAsCiAJCQl1bnNpZ25lZCBpbnQgaW9jdGwsIHVuc2lnbmVkIGxvbmcg
YXJnKQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5j
CmluZGV4IDQ1MTg0Y2E4OTMxNy4uNjZmMTY0NThhYTk3IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9r
dm0veDg2LmMKKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jCkBAIC05Mjc3LDE2ICs5Mjc3LDYgQEAg
c3RhdGljIGlubGluZSB2b2lkIGt2bV9vcHNfdXBkYXRlKHN0cnVjdCBrdm1feDg2X2luaXRfb3Bz
ICpvcHMpCiAJa3ZtX3BtdV9vcHNfdXBkYXRlKG9wcy0+cG11X29wcyk7CiB9CiAKLWludCBrdm1f
YXJjaF9pbml0KHZvaWQgKm9wYXF1ZSkKLXsKLQlyZXR1cm4gMDsKLX0KLQotdm9pZCBrdm1fYXJj
aF9leGl0KHZvaWQpCi17Ci0KLX0KLQogc3RhdGljIGludCBfX2t2bV94ODZfdmVuZG9yX2luaXQo
c3RydWN0IGt2bV94ODZfaW5pdF9vcHMgKm9wcykKIHsKIAl1NjQgaG9zdF9wYXQ7CmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgK
aW5kZXggZjJlMGU3OGQyZDkyLi43ZGRlMjgzMzNlN2MgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGlu
dXgva3ZtX2hvc3QuaAorKysgYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKQEAgLTE0MzksOSAr
MTQzOSw2IEBAIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3NldF9ndWVzdF9kZWJ1ZyhzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsCiAJCQkJCXN0cnVjdCBrdm1fZ3Vlc3RfZGVidWcgKmRiZyk7CiBpbnQg
a3ZtX2FyY2hfdmNwdV9pb2N0bF9ydW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAotaW50IGt2
bV9hcmNoX2luaXQodm9pZCAqb3BhcXVlKTsKLXZvaWQga3ZtX2FyY2hfZXhpdCh2b2lkKTsKLQog
dm9pZCBrdm1fYXJjaF9zY2hlZF9pbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBjcHUpOwog
CiB2b2lkIGt2bV9hcmNoX3ZjcHVfbG9hZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBjcHUp
OwpkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMK
aW5kZXggMGU2Mjg4N2U4Y2UxLi5hNGExMGEwYjMyMmYgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2
bV9tYWluLmMKKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwpAQCAtNTg1MiwyMCArNTg1Miw4IEBA
IGludCBrdm1faW5pdCh2b2lkICpvcGFxdWUsIHVuc2lnbmVkIHZjcHVfc2l6ZSwgdW5zaWduZWQg
dmNwdV9hbGlnbiwKIAlpbnQgcjsKIAlpbnQgY3B1OwogCi0JLyoKLQkgKiBGSVhNRTogR2V0IHJp
ZCBvZiBrdm1fYXJjaF9pbml0KCksIHZlbmRvciBjb2RlIHNob3VsZCBjYWxsIGFyY2ggY29kZQot
CSAqIGRpcmVjdGx5LiAgTm90ZSwga3ZtX2FyY2hfaW5pdCgpIF9tdXN0XyBiZSBjYWxsZWQgYmVm
b3JlIGFueXRoaW5nCi0JICogZWxzZSBhcyB4ODYgcmVsaWVzIG9uIGNoZWNrcyBidXJpZWQgaW4g
a3ZtX2FyY2hfaW5pdCgpIHRvIGd1YXJkCi0JICogYWdhaW5zdCBtdWx0aXBsZSBjYWxscyB0byBr
dm1faW5pdCgpLgotCSAqLwotCXIgPSBrdm1fYXJjaF9pbml0KG9wYXF1ZSk7Ci0JaWYgKHIpCi0J
CXJldHVybiByOwotCi0JaWYgKCF6YWxsb2NfY3B1bWFza192YXIoJmNwdXNfaGFyZHdhcmVfZW5h
YmxlZCwgR0ZQX0tFUk5FTCkpIHsKLQkJciA9IC1FTk9NRU07Ci0JCWdvdG8gZXJyX2h3X2VuYWJs
ZWQ7Ci0JfQorCWlmICghemFsbG9jX2NwdW1hc2tfdmFyKCZjcHVzX2hhcmR3YXJlX2VuYWJsZWQs
IEdGUF9LRVJORUwpKQorCQlyZXR1cm4gLUVOT01FTTsKIAogCWMucmV0ID0gJnI7CiAJYy5vcGFx
dWUgPSBvcGFxdWU7CkBAIC01OTUzLDggKzU5NDEsNiBAQCBpbnQga3ZtX2luaXQodm9pZCAqb3Bh
cXVlLCB1bnNpZ25lZCB2Y3B1X3NpemUsIHVuc2lnbmVkIHZjcHVfYWxpZ24sCiAJY3B1aHBfcmVt
b3ZlX3N0YXRlX25vY2FsbHMoQ1BVSFBfQVBfS1ZNX1NUQVJUSU5HKTsKIG91dF9mcmVlXzI6CiAJ
ZnJlZV9jcHVtYXNrX3ZhcihjcHVzX2hhcmR3YXJlX2VuYWJsZWQpOwotZXJyX2h3X2VuYWJsZWQ6
Ci0Ja3ZtX2FyY2hfZXhpdCgpOwogCXJldHVybiByOwogfQogRVhQT1JUX1NZTUJPTF9HUEwoa3Zt
X2luaXQpOwpAQCAtNTk4Miw3ICs1OTY4LDYgQEAgdm9pZCBrdm1fZXhpdCh2b2lkKQogCW9uX2Vh
Y2hfY3B1KGhhcmR3YXJlX2Rpc2FibGVfbm9sb2NrLCBOVUxMLCAxKTsKIAlrdm1faXJxZmRfZXhp
dCgpOwogCWZyZWVfY3B1bWFza192YXIoY3B1c19oYXJkd2FyZV9lbmFibGVkKTsKLQlrdm1fYXJj
aF9leGl0KCk7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChrdm1fZXhpdCk7CiAKLS0gCjIuMzguMS41
ODQuZzBmM2M1NWQ0YzItZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
