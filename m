Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EC4D2445D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 23:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGSEH70eynaya5Nylvfrr4A0ElttLtbokZmntMH+qJY=; b=Umjj3XHoHFeVo6
	Atk4B40eGNCGJILndHdWMERBfo2pjltKJhboWgt1XbgboRx4NIT2YaLlBYVvENCv9ikYnFBMx/viJ
	xfc+jwUbjoyPHBvW9QT+zlYPvhSm2SkxSFoH12+5r45LF98KShWDJRbQra0wZegSqi/eG+Ia/BjYd
	PmuY3D9SgawQbPmsGvXEu2jdjSJEqJP0w+IsvqeO6F+U21GNLEymao5iFuvrKOmzUCbxY+J5M4nia
	MWfpFexPuKpVXGvJKBTEegSrX3kcqcvWZDnR/cqOU6ZDamM85sm3ySjvZqPJkHVOFHu8UG7B4sKkL
	hGuzVf1u47NwVi0VVDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz2cz-0000000Ef4h-2L8f;
	Thu, 10 Oct 2024 23:31:29 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrf-0000000DqjR-05Yr
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:21 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-206b912491eso23155655ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584778; x=1729189578; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgK+YcjRpEQ+YhbfYv/o4akq/yPA2qNOXCMP41gc9EY=;
        b=iFkBAzBXYFBUziXH1DPHFwz0QuJbVZY9yzLrch8ot8iJUnZFwu0Ch7La+ANEyti4nR
         AiDSevGke+MAd+fF5+8281cC7OvrCxYOzA8Jn/wVBWgRyeNM1C+8Y4ZOM9b7hYkXpmDz
         rSxcKYrmZHnrNvGHVOgV5h+nWW41K7iFAYTqArL5ncvyqN2Nrg8M2ksNxs489+ODUdI5
         RkxO0PgCZ3IqNb8GULWvgAuWQDd7DbJqF6gmz7/xpgXrONOBNZ8xnCYXKQDivmKtwi++
         SkbfWdozQu9XNTOmoT67SyrcEA3ebbCiwMyOSypgPQ2bTRLYaltBc5xINem/udZ5gqOM
         R5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584778; x=1729189578;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sgK+YcjRpEQ+YhbfYv/o4akq/yPA2qNOXCMP41gc9EY=;
        b=USjtn95MZ9+Dyizs+NGALTTbp4XAVvruFTpJe2XGoMZs2v62MsPcXH8LR/wMJMBCTE
         LoovBt78gKxoWPOI886u1AfG5SNg1sDyp5XDX5ggO2pSWrrcQDAtX8BUmf9mS5mjprjU
         IOCqbAy86Gl9eVaSlpn1iuTMIAI00JYNg0k//yzfLgGvI2mUyDyTEwCheRriXRpD77De
         wB8WBpHufcx1o8RUbGWpP1yZsa6fuokxmoECOsDgPBdPLx6+ASYac91WRJvR6wkXyLZw
         NQPC4WVCMtAdeLzJ/aokbgLqw1NoVklv4pjxmWQc4tlTmAGYyNMyGOS+tGluq9XIN1FF
         Xa9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEDOxs4MppAIszHqBFE7U7KUZqMhirhkRGbQEdQJ+y5+Ax/kbu/9EwjtxvSsWJHrNEHSaug4NXomnfjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yypk6VYUviU9gECaZptvhAJ7/DkPValLj/3tY5pp8bKeyM++R2y
	A+EVm4+rw0/tniGgMRVfUd+urVTJmUt5ejrxiAvkuaBgPuCfRQrBUSDGn3AwnQqlz6+M97uJCbE
	fFg==
X-Google-Smtp-Source: AGHT+IHgES02wxBmUBuw4MXImaMxOgBvLS6HzbS699NHinso/VI3SIlimd+hdhb5F/AgwxmTSyUtUzYKtBo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:ec85:b0:20b:7bfa:ac0f with SMTP id
 d9443c01a7336-20ca037f212mr485ad.1.1728584777475; Thu, 10 Oct 2024 11:26:17
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:43 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-42-seanjc@google.com>
Subject: [PATCH v13 41/85] KVM: x86/mmu: Mark pages/folios dirty at the origin
 of make_spte()
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
X-CRM114-CacheID: sfid-20241010_112619_199281_EC287716 
X-CRM114-Status: GOOD (  17.21  )
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

TW92ZSB0aGUgbWFya2luZyBvZiBmb2xpb3MgZGlydHkgZnJvbSBtYWtlX3NwdGUoKSBvdXQgdG8g
aXRzIGNhbGxlcnMsCndoaWNoIGhhdmUgYWNjZXNzIHRvIHRoZSBfc3RydWN0IHBhZ2VfLCBub3Qg
anVzdCB0aGUgdW5kZXJseWluZyBwZm4uCk9uY2UgYWxsIGFyY2hpdGVjdHVyZXMgZm9sbG93IHN1
aXQsIHRoaXMgd2lsbCBhbGxvdyByZW1vdmluZyBLVk0ncyB1Z2x5CmhhY2sgd2hlcmUgS1ZNIGVs
ZXZhdGVzIHRoZSByZWZjb3VudCBvZiBWTV9NSVhFRE1BUCBwZm5zIHRoYXQgaGFwcGVuIHRvCmJl
IHN0cnVjdCBwYWdlIG1lbW9yeS4KClRlc3RlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5l
ZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNA
Z29vZ2xlLmNvbT4KLS0tCiBhcmNoL3g4Ni9rdm0vbW11L21tdS5jICAgICAgICAgfCAzMCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0KIGFyY2gveDg2L2t2bS9tbXUvcGFnaW5nX3RtcGwu
aCB8ICA1ICsrKysrCiBhcmNoL3g4Ni9rdm0vbW11L3NwdGUuYyAgICAgICAgfCAxMSAtLS0tLS0t
LS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vbW11L21tdS5jIGIvYXJjaC94ODYva3ZtL21tdS9t
bXUuYwppbmRleCAzMWE2YWU0MWE2ZjQuLmY3MzA4NzA4ODdkZCAxMDA2NDQKLS0tIGEvYXJjaC94
ODYva3ZtL21tdS9tbXUuYworKysgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCkBAIC0yOTY0LDcg
KzI5NjQsMTcgQEAgc3RhdGljIGJvb2wga3ZtX21tdV9wcmVmZXRjaF9zcHRlcyhzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIGdmbl90IGdmbiwgdTY0ICpzcHRlcCwKIAlmb3IgKGkgPSAwOyBpIDwgbnJf
cGFnZXM7IGkrKywgZ2ZuKyssIHNwdGVwKyspIHsKIAkJbW11X3NldF9zcHRlKHZjcHUsIHNsb3Qs
IHNwdGVwLCBhY2Nlc3MsIGdmbiwKIAkJCSAgICAgcGFnZV90b19wZm4ocGFnZXNbaV0pLCBOVUxM
KTsKLQkJa3ZtX3JlbGVhc2VfcGFnZV9jbGVhbihwYWdlc1tpXSk7CisKKwkJLyoKKwkJICogS1ZN
IGFsd2F5cyBwcmVmZXRjaGVzIHdyaXRhYmxlIHBhZ2VzIGZyb20gdGhlIHByaW1hcnkgTU1VLAor
CQkgKiBhbmQgS1ZNIGNhbiBtYWtlIGl0cyBTUFRFIHdyaXRhYmxlIGluIHRoZSBmYXN0IHBhZ2Ug
aGFuZGxlciwKKwkJICogd2l0aG91dCBub3RpZnlpbmcgdGhlIHByaW1hcnkgTU1VLiAgTWFyayBw
YWdlcy9mb2xpb3MgZGlydHkKKwkJICogbm93IHRvIGVuc3VyZSBmaWxlIGRhdGEgaXMgd3JpdHRl
biBiYWNrIGlmIGl0IGVuZHMgdXAgYmVpbmcKKwkJICogd3JpdHRlbiBieSB0aGUgZ3Vlc3QuICBC
ZWNhdXNlIEtWTSdzIHByZWZldGNoaW5nIEdVUHMKKwkJICogd3JpdGFibGUgUFRFcywgdGhlIHBy
b2JhYmlsaXR5IG9mIHVubmVjZXNzYXJ5IHdyaXRlYmFjayBpcworCQkgKiBleHRyZW1lbHkgbG93
LgorCQkgKi8KKwkJa3ZtX3JlbGVhc2VfcGFnZV9kaXJ0eShwYWdlc1tpXSk7CiAJfQogCiAJcmV0
dXJuIHRydWU7CkBAIC00MzYwLDcgKzQzNzAsMjMgQEAgc3RhdGljIHU4IGt2bV9tYXhfcHJpdmF0
ZV9tYXBwaW5nX2xldmVsKHN0cnVjdCBrdm0gKmt2bSwga3ZtX3Bmbl90IHBmbiwKIHN0YXRpYyB2
b2lkIGt2bV9tbXVfZmluaXNoX3BhZ2VfZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJ
CSAgICAgIHN0cnVjdCBrdm1fcGFnZV9mYXVsdCAqZmF1bHQsIGludCByKQogewotCWt2bV9yZWxl
YXNlX3Bmbl9jbGVhbihmYXVsdC0+cGZuKTsKKwlsb2NrZGVwX2Fzc2VydF9vbmNlKGxvY2tkZXBf
aXNfaGVsZCgmdmNwdS0+a3ZtLT5tbXVfbG9jaykgfHwKKwkJCSAgICByID09IFJFVF9QRl9SRVRS
WSk7CisKKwkvKgorCSAqIElmIHRoZSBwYWdlIHRoYXQgS1ZNIGdvdCBmcm9tIHRoZSAqcHJpbWFy
eSBNTVUqIGlzIHdyaXRhYmxlLCBhbmQgS1ZNCisJICogaW5zdGFsbGVkIG9yIHJldXNlZCBhIFNQ
VEUsIG1hcmsgdGhlIHBhZ2UvZm9saW8gZGlydHkuICBOb3RlLCB0aGlzCisJICogbWF5IG1hcmsg
YSBmb2xpbyBkaXJ0eSBldmVuIGlmIEtWTSBjcmVhdGVkIGEgcmVhZC1vbmx5IFNQVEUsIGUuZy4g
aWYKKwkgKiB0aGUgR0ZOIGlzIHdyaXRlLXByb3RlY3RlZC4gIEZvbGlvcyBjYW4ndCBiZSBzYWZl
bHkgbWFya2VkIGRpcnR5CisJICogb3V0c2lkZSBvZiBtbXVfbG9jayBhcyBkb2luZyBzbyBjb3Vs
ZCByYWNlIHdpdGggd3JpdGViYWNrIG9uIHRoZQorCSAqIGZvbGlvLiAgQXMgYSByZXN1bHQsIEtW
TSBjYW4ndCBtYXJrIGZvbGlvcyBkaXJ0eSBpbiB0aGUgZmFzdCBwYWdlCisJICogZmF1bHQgaGFu
ZGxlciwgYW5kIHNvIEtWTSBtdXN0IChzb21ld2hhdCkgc3BlY3VsYXRpdmVseSBtYXJrIHRoZQor
CSAqIGZvbGlvIGRpcnR5IGlmIEtWTSBjb3VsZCBsb2NrbGVzc2x5IG1ha2UgdGhlIFNQVEUgd3Jp
dGFibGUuCisJICovCisJaWYgKCFmYXVsdC0+bWFwX3dyaXRhYmxlIHx8IHIgPT0gUkVUX1BGX1JF
VFJZKQorCQlrdm1fcmVsZWFzZV9wZm5fY2xlYW4oZmF1bHQtPnBmbik7CisJZWxzZQorCQlrdm1f
cmVsZWFzZV9wZm5fZGlydHkoZmF1bHQtPnBmbik7CiB9CiAKIHN0YXRpYyBpbnQga3ZtX21tdV9m
YXVsdGluX3Bmbl9wcml2YXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2t2bS9tbXUvcGFnaW5nX3RtcGwuaCBiL2FyY2gveDg2L2t2bS9tbXUvcGFnaW5nX3Rt
cGwuaAppbmRleCAzNWQwYzNmMWE3ODkuLmY0NzExNjc0YzQ3YiAxMDA2NDQKLS0tIGEvYXJjaC94
ODYva3ZtL21tdS9wYWdpbmdfdG1wbC5oCisrKyBiL2FyY2gveDg2L2t2bS9tbXUvcGFnaW5nX3Rt
cGwuaApAQCAtOTU0LDYgKzk1NCwxMSBAQCBzdGF0aWMgaW50IEZOQU1FKHN5bmNfc3B0ZSkoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX21tdV9wYWdlICpzcCwgaW50CiAJCSAgc3B0
ZV90b19wZm4oc3B0ZSksIHNwdGUsIHRydWUsIHRydWUsCiAJCSAgaG9zdF93cml0YWJsZSwgJnNw
dGUpOwogCisJLyoKKwkgKiBUaGVyZSBpcyBubyBuZWVkIHRvIG1hcmsgdGhlIHBmbiBkaXJ0eSwg
YXMgdGhlIG5ldyBwcm90ZWN0aW9ucyBtdXN0CisJICogYmUgYSBzdWJzZXQgb2YgdGhlIG9sZCBw
cm90ZWN0aW9ucywgaS5lLiBzeW5jaHJvbml6aW5nIGEgU1BURSBjYW5ub3QKKwkgKiBjaGFuZ2Ug
dGhlIFNQVEUgZnJvbSByZWFkLW9ubHkgdG8gd3JpdGFibGUuCisJICovCiAJcmV0dXJuIG1tdV9z
cHRlX3VwZGF0ZShzcHRlcCwgc3B0ZSk7CiB9CiAKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9t
bXUvc3B0ZS5jIGIvYXJjaC94ODYva3ZtL21tdS9zcHRlLmMKaW5kZXggOGU4ZDZlZTc5YzhiLi5m
MWE1MGE3OGJhZGIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9tbXUvc3B0ZS5jCisrKyBiL2Fy
Y2gveDg2L2t2bS9tbXUvc3B0ZS5jCkBAIC0yNzcsMTcgKzI3Nyw2IEBAIGJvb2wgbWFrZV9zcHRl
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tbXVfcGFnZSAqc3AsCiAJCW1hcmtf
cGFnZV9kaXJ0eV9pbl9zbG90KHZjcHUtPmt2bSwgc2xvdCwgZ2ZuKTsKIAl9CiAKLQkvKgotCSAq
IElmIHRoZSBwYWdlIHRoYXQgS1ZNIGdvdCBmcm9tIHRoZSBwcmltYXJ5IE1NVSBpcyB3cml0YWJs
ZSwgaS5lLiBpZgotCSAqIGl0J3MgaG9zdC13cml0YWJsZSwgbWFyayB0aGUgcGFnZS9mb2xpbyBk
aXJ0eS4gIEFzIGFsbHVkZWQgdG8gYWJvdmUsCi0JICogZm9saW9zIGNhbid0IGJlIHNhZmVseSBt
YXJrZWQgZGlydHkgaW4gdGhlIGZhc3QgcGFnZSBmYXVsdCBoYW5kbGVyLAotCSAqIGFuZCBzbyBL
Vk0gbXVzdCAoc29tZXdoYXQpIHNwZWN1bGF0aXZlbHkgbWFyayB0aGUgZm9saW8gZGlydHkgZXZl
bgotCSAqIHRob3VnaCBpdCBpc24ndCBndWFyYW50ZWVkIHRvIGJlIHdyaXR0ZW4gYXMgS1ZNIHdv
bid0IG1hcmsgdGhlIGZvbGlvCi0JICogZGlydHkgaWYvd2hlbiB0aGUgU1BURSBpcyBtYWRlIHdy
aXRhYmxlLgotCSAqLwotCWlmIChob3N0X3dyaXRhYmxlKQotCQlrdm1fc2V0X3Bmbl9kaXJ0eShw
Zm4pOwotCiAJKm5ld19zcHRlID0gc3B0ZTsKIAlyZXR1cm4gd3Jwcm90OwogfQotLSAKMi40Ny4w
LnJjMS4yODguZzA2Mjk4ZDE1MjUtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
