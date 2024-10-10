Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FC0CFC5FB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PK0F5NNpRY1szFbOVcwu+xmmY3jSitclElANjvMK+jI=; b=VRYDZYylolgfSF
	FC7p5uG5cQJ7ti2QxjKzHfx4T0Ny3GBh+aiu95s9hLtlkkbN707WlvtzYG/nJG/BAPY57nwI+T9UK
	Z97zJV55qiY9c/wmH6rpzes1noAOU9whCM7+Ldb4MTgQOcLl5P3MQ7EHSV2un9oDUus18yxwAsDNm
	fQMD97q8ZRRZCkotqeon5n0P0aSQGF31GVbtnEkUzTRp3TeHn2I0R+K38sCpSqLr951xlDh+22WZg
	VnVT32hEhhHrFSbxFKztwJCoDQfWo56nvLJ+dz2uqF2BEsnkM0sf3NIoPlw2nj6rcFPtKBgSGObaK
	EiohSCGwsxMyFzSLozSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyb5-0000000E4Rp-28GW;
	Thu, 10 Oct 2024 19:13:15 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxra-0000000Dqfd-3xAl
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:16 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-20c3d9a0eb2so16543075ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584774; x=1729189574; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLMllFEXz5NbCB79T5EDeXxXCOdT0E/lPN9LlBgR2FM=;
        b=iqLFJk08lU4sXCqW4q3PDDrFFs5ZbTmdrSdsuuvf3BYW0ezc3qn0B+PT1xdp95wJKP
         v8vCmQJzR9uGRWWX3xM5EFUHYKi2EyUNEbk9tyfb71n60zeMppgYPZ/Vj4gdSD5N6RvJ
         FkgKdr3Z6z8/NYvrrP30gumqXo23lNuT93fQVxGcHiqCRnlW4E/mnK7E1UGmNlyGu+b8
         Y5W97QXCMKKOXRoadOfj7pRQ5An6esrBRxEqAAv4FVktbDLfZXuA1uVEw7KCqLLpPIOx
         JbdwK5ygGHHjecSj53zztRzMuX8uHhsU/M+w90oMCOX27vE9+USr78CsT5jhtEz3h4c7
         2qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584774; x=1729189574;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bLMllFEXz5NbCB79T5EDeXxXCOdT0E/lPN9LlBgR2FM=;
        b=AE4JgjxZbTJrvgkKWNQUa/OEBy06ys0UdbOmHga/Fm2YH0rQt87EFtzVu9A82ruZzO
         ///uT9b4SCuGFaoOvqgTnJZpxCCZSO8/s7KnILuDfO/nDHw5wOw5Lb1wj+DprZF9l+87
         2BxRMHPEd5lHvqpo2o/F+J3waXLLbREndWuOFUFgHZyfXMFE/ogli/kU31lFG3f+FgRN
         coA8o+57smGoUugNWBtqIuBTkxRMhFqm2nsy96ZjlN5c4LwGHeKyfAsDf5ddFeZeKXhw
         goalLgrut7qxq0bAr6SWFuJzynFkLXcqpY1c7Iw8RIewHzduWsnHAYrvxxTgmncIgyrg
         FOKw==
X-Forwarded-Encrypted: i=1; AJvYcCUCP4JK6kc2oGnhRRfQ6q02AQzvBHWFUlYc6dIXfAeu8hZWFS9lkxJFXhb0N6+mCtQBEQiR3/M3a4X+Hg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8hknjqd8qW51GHgLD9V5oltAwAIYCybEmF0Vp+J8GmU6T5BHs
	9yUaGudV8WG/e6kcEVBBY4jreP1hPQ5+BrFxJ8NfhVGRrfM3hPz4A+BDGrSUz1t6vhGeQEppjgY
	czw==
X-Google-Smtp-Source: AGHT+IHTeV3dFyfdACUyzit3PmgjtoD4THwZ77SaAB8Cv7KtK6sEvfc4IjBdPT+nDHGdhMcMXcKC7R1qaBw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:903:1c8:b0:20c:716c:5af with SMTP id
 d9443c01a7336-20c716c078dmr946605ad.3.1728584773496; Thu, 10 Oct 2024
 11:26:13 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:41 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-40-seanjc@google.com>
Subject: [PATCH v13 39/85] KVM: x86/mmu: Add common helper to handle
 prefetching SPTEs
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
X-CRM114-CacheID: sfid-20241010_112615_045138_94955CB4 
X-CRM114-Status: GOOD (  13.48  )
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

RGVkdXBsaWNhdGUgdGhlIHByZWZldGNoaW5nIGNvZGUgZm9yIGluZGlyZWN0IGFuZCBkaXJlY3Qg
TU1Vcy4gIFRoZSBjb3JlCmxvZ2ljIGlzIHRoZSBzYW1lLCB0aGUgb25seSBkaWZmZXJlbmNlIGlz
IHRoYXQgaW5kaXJlY3QgTU1VcyBuZWVkIHRvCnByZWZldGNoIFNQVEVzIG9uZS1hdC1hLXRpbWUs
IGFzIGNvbnRpZ3VvdXMgZ3Vlc3QgdmlydHVhbCBhZGRyZXNzZXMgYXJlbid0Cmd1YXJhbnRlZWQg
dG8geWllbGQgY29udGlndW91cyBndWVzdCBwaHlzaWNhbCBhZGRyZXNzZXMuCgpUZXN0ZWQtYnk6
IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogU2Vh
biBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Ci0tLQogYXJjaC94ODYva3ZtL21t
dS9tbXUuYyAgICAgICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQog
YXJjaC94ODYva3ZtL21tdS9wYWdpbmdfdG1wbC5oIHwgMTMgKy0tLS0tLS0tLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYva3ZtL21tdS9tbXUuYyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKaW5kZXggNjI5
MjRmOTVhMzk4Li42NWQzYTYwMmViMmMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9tbXUvbW11
LmMKKysrIGIvYXJjaC94ODYva3ZtL21tdS9tbXUuYwpAQCAtMjk0MywzMiArMjk0Myw0MSBAQCBz
dGF0aWMgaW50IG1tdV9zZXRfc3B0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1f
bWVtb3J5X3Nsb3QgKnNsb3QsCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBkaXJlY3Rf
cHRlX3ByZWZldGNoX21hbnkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAotCQkJCSAgICBzdHJ1Y3Qg
a3ZtX21tdV9wYWdlICpzcCwKLQkJCQkgICAgdTY0ICpzdGFydCwgdTY0ICplbmQpCitzdGF0aWMg
Ym9vbCBrdm1fbW11X3ByZWZldGNoX3NwdGVzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ2ZuX3Qg
Z2ZuLCB1NjQgKnNwdGVwLAorCQkJCSAgIGludCBucl9wYWdlcywgdW5zaWduZWQgaW50IGFjY2Vz
cykKIHsKIAlzdHJ1Y3QgcGFnZSAqcGFnZXNbUFRFX1BSRUZFVENIX05VTV07CiAJc3RydWN0IGt2
bV9tZW1vcnlfc2xvdCAqc2xvdDsKLQl1bnNpZ25lZCBpbnQgYWNjZXNzID0gc3AtPnJvbGUuYWNj
ZXNzOwotCWludCBpLCByZXQ7Ci0JZ2ZuX3QgZ2ZuOworCWludCBpOworCisJaWYgKFdBUk5fT05f
T05DRShucl9wYWdlcyA+IFBURV9QUkVGRVRDSF9OVU0pKQorCQlyZXR1cm4gZmFsc2U7CiAKLQln
Zm4gPSBrdm1fbW11X3BhZ2VfZ2V0X2dmbihzcCwgc3B0ZV9pbmRleChzdGFydCkpOwogCXNsb3Qg
PSBnZm5fdG9fbWVtc2xvdF9kaXJ0eV9iaXRtYXAodmNwdSwgZ2ZuLCBhY2Nlc3MgJiBBQ0NfV1JJ
VEVfTUFTSyk7CiAJaWYgKCFzbG90KQotCQlyZXR1cm4gLTE7CisJCXJldHVybiBmYWxzZTsKIAot
CXJldCA9IGt2bV9wcmVmZXRjaF9wYWdlcyhzbG90LCBnZm4sIHBhZ2VzLCBlbmQgLSBzdGFydCk7
Ci0JaWYgKHJldCA8PSAwKQotCQlyZXR1cm4gLTE7CisJbnJfcGFnZXMgPSBrdm1fcHJlZmV0Y2hf
cGFnZXMoc2xvdCwgZ2ZuLCBwYWdlcywgbnJfcGFnZXMpOworCWlmIChucl9wYWdlcyA8PSAwKQor
CQlyZXR1cm4gZmFsc2U7CiAKLQlmb3IgKGkgPSAwOyBpIDwgcmV0OyBpKyssIGdmbisrLCBzdGFy
dCsrKSB7Ci0JCW1tdV9zZXRfc3B0ZSh2Y3B1LCBzbG90LCBzdGFydCwgYWNjZXNzLCBnZm4sCisJ
Zm9yIChpID0gMDsgaSA8IG5yX3BhZ2VzOyBpKyssIGdmbisrLCBzcHRlcCsrKSB7CisJCW1tdV9z
ZXRfc3B0ZSh2Y3B1LCBzbG90LCBzcHRlcCwgYWNjZXNzLCBnZm4sCiAJCQkgICAgIHBhZ2VfdG9f
cGZuKHBhZ2VzW2ldKSwgTlVMTCk7CiAJCWt2bV9yZWxlYXNlX3BhZ2VfY2xlYW4ocGFnZXNbaV0p
OwogCX0KIAotCXJldHVybiAwOworCXJldHVybiB0cnVlOworfQorCitzdGF0aWMgYm9vbCBkaXJl
Y3RfcHRlX3ByZWZldGNoX21hbnkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAorCQkJCSAgICAgc3Ry
dWN0IGt2bV9tbXVfcGFnZSAqc3AsCisJCQkJICAgICB1NjQgKnN0YXJ0LCB1NjQgKmVuZCkKK3sK
KwlnZm5fdCBnZm4gPSBrdm1fbW11X3BhZ2VfZ2V0X2dmbihzcCwgc3B0ZV9pbmRleChzdGFydCkp
OworCXVuc2lnbmVkIGludCBhY2Nlc3MgPSBzcC0+cm9sZS5hY2Nlc3M7CisKKwlyZXR1cm4ga3Zt
X21tdV9wcmVmZXRjaF9zcHRlcyh2Y3B1LCBnZm4sIHN0YXJ0LCBlbmQgLSBzdGFydCwgYWNjZXNz
KTsKIH0KIAogc3RhdGljIHZvaWQgX19kaXJlY3RfcHRlX3ByZWZldGNoKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwKQEAgLTI5ODYsOCArMjk5NSw5IEBAIHN0YXRpYyB2b2lkIF9fZGlyZWN0X3B0ZV9w
cmVmZXRjaChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCWlmIChpc19zaGFkb3dfcHJlc2VudF9w
dGUoKnNwdGUpIHx8IHNwdGUgPT0gc3B0ZXApIHsKIAkJCWlmICghc3RhcnQpCiAJCQkJY29udGlu
dWU7Ci0JCQlpZiAoZGlyZWN0X3B0ZV9wcmVmZXRjaF9tYW55KHZjcHUsIHNwLCBzdGFydCwgc3B0
ZSkgPCAwKQorCQkJaWYgKCFkaXJlY3RfcHRlX3ByZWZldGNoX21hbnkodmNwdSwgc3AsIHN0YXJ0
LCBzcHRlKSkKIAkJCQlyZXR1cm47CisKIAkJCXN0YXJ0ID0gTlVMTDsKIAkJfSBlbHNlIGlmICgh
c3RhcnQpCiAJCQlzdGFydCA9IHNwdGU7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vbW11L3Bh
Z2luZ190bXBsLmggYi9hcmNoL3g4Ni9rdm0vbW11L3BhZ2luZ190bXBsLmgKaW5kZXggOWJkM2Q2
ZjVkYjkxLi5hNDc2YTU0MjgwMTcgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9tbXUvcGFnaW5n
X3RtcGwuaAorKysgYi9hcmNoL3g4Ni9rdm0vbW11L3BhZ2luZ190bXBsLmgKQEAgLTUzMyw5ICs1
MzMsNyBAQCBzdGF0aWMgYm9vbAogRk5BTUUocHJlZmV0Y2hfZ3B0ZSkoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBzdHJ1Y3Qga3ZtX21tdV9wYWdlICpzcCwKIAkJICAgICB1NjQgKnNwdGUsIHB0X2Vs
ZW1lbnRfdCBncHRlKQogewotCXN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3Q7CiAJdW5zaWdu
ZWQgcHRlX2FjY2VzczsKLQlzdHJ1Y3QgcGFnZSAqcGFnZTsKIAlnZm5fdCBnZm47CiAKIAlpZiAo
Rk5BTUUocHJlZmV0Y2hfaW52YWxpZF9ncHRlKSh2Y3B1LCBzcCwgc3B0ZSwgZ3B0ZSkpCkBAIC01
NDUsMTYgKzU0Myw3IEBAIEZOQU1FKHByZWZldGNoX2dwdGUpKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgc3RydWN0IGt2bV9tbXVfcGFnZSAqc3AsCiAJcHRlX2FjY2VzcyA9IHNwLT5yb2xlLmFjY2Vz
cyAmIEZOQU1FKGdwdGVfYWNjZXNzKShncHRlKTsKIAlGTkFNRShwcm90ZWN0X2NsZWFuX2dwdGUp
KHZjcHUtPmFyY2gubW11LCAmcHRlX2FjY2VzcywgZ3B0ZSk7CiAKLQlzbG90ID0gZ2ZuX3RvX21l
bXNsb3RfZGlydHlfYml0bWFwKHZjcHUsIGdmbiwgcHRlX2FjY2VzcyAmIEFDQ19XUklURV9NQVNL
KTsKLQlpZiAoIXNsb3QpCi0JCXJldHVybiBmYWxzZTsKLQotCWlmIChrdm1fcHJlZmV0Y2hfcGFn
ZXMoc2xvdCwgZ2ZuLCAmcGFnZSwgMSkgIT0gMSkKLQkJcmV0dXJuIGZhbHNlOwotCi0JbW11X3Nl
dF9zcHRlKHZjcHUsIHNsb3QsIHNwdGUsIHB0ZV9hY2Nlc3MsIGdmbiwgcGFnZV90b19wZm4ocGFn
ZSksIE5VTEwpOwotCWt2bV9yZWxlYXNlX3BhZ2VfY2xlYW4ocGFnZSk7Ci0JcmV0dXJuIHRydWU7
CisJcmV0dXJuIGt2bV9tbXVfcHJlZmV0Y2hfc3B0ZXModmNwdSwgZ2ZuLCBzcHRlLCAxLCBwdGVf
YWNjZXNzKTsKIH0KIAogc3RhdGljIGJvb2wgRk5BTUUoZ3B0ZV9jaGFuZ2VkKShzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsCi0tIAoyLjQ3LjAucmMxLjI4OC5nMDYyOThkMTUyNS1nb29nCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
