Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258CCCFC5F3
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nm3CqfBG7D6bxycJqx29G3FK7jIU/aEIfF68/cEimp8=; b=S7PuJNYK3NlOxk
	DXDkSDI4PnnjmrX+PL1WJKPdVLly5gbETBmb4HjQ7v7ZjWyrW97TGAy+JP5KPEwkuuiJQ4k/SDFJG
	d7Wta1QaiYvutTqWMKvz1NxUe5v45kOdb1j8Sxg2yS6IMmLppAqivSn48Ye1+e5j1wCI96rv4mVA/
	wrNYGLbu2+8mOPIBtL65GTcz0XJypkBDEPmPhJKzsHqn4xah7MZGVwcTeeVV1c/q9fKChLuGvh2gU
	zq4/XYsL5gZkLLzTMOsclHDf40FAy5DXopJBGlkT5Ql2lB2l1gpe8hLDSMjXzNlDoRLJ+jelnTGm3
	YT+nVwEPQo/3CailHLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyDn-0000000DzUq-2VpL;
	Thu, 10 Oct 2024 18:49:11 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxr2-0000000DqCu-1AV1
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:42 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e2261adfdeso21188417b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584739; x=1729189539; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wU+jX/zRq5GV793BchOJ2bBXpO8AjDudJh47DKJg70M=;
        b=FIApe3/ZIx/g/Zfj5ITJmKSVaNpQH8BwtI16v5WF0kzSLo63vWhM9zgGz/f6KZrMod
         eaM47p1v8g3XI8cRrHCgnlw1lkERt2Es2DkFBS95BMEa8VOtSISuR0JQV/5yE6ZrE9g8
         jtFlVPKcjYY26HLTybBZ5JgpE+WFrKho0MxAG6zyMHT/NBJhzkj0OsbHSOdDYe5atDIk
         dwHJUpgA5PUAp3iX+mX/XwVfXhs7goHJGlBb88Z1FzHwOHL0qZrZ/S3A9GWkwAYPF2Rs
         cJn+WIYR1eimvF36V83F42MITIu1YXfPQNciFvRCZHqu34NfpiAeRIxNgBjC85XWMPfE
         z3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584739; x=1729189539;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wU+jX/zRq5GV793BchOJ2bBXpO8AjDudJh47DKJg70M=;
        b=VRNm5oAyA+cAqWaTB4AuOXBRrNBLeSINBBW2kOi4DxNSh992uQsDltOu4FszxA3Z8a
         L90r0fmCMCrzs/k9DzjwxPdqYELIX70W0r8R8sUqR87RznBlFKqOFW56VWUXFTxizXcX
         qMCndUrzh08HjqlE9XhigFGFL8ttSPJnCHb0HI0qIfVdJfd7Oy2YGYGrZGf3lxzynbDj
         kanN+XkOIjRPuybnDyFJZSINqqVjvLgY1G3IwyPtj87YVECThlMLS6dZj1cyoFF47lM4
         off5aN5YzgP7gafjraSAprVLFK6XBhj+97nzDOV9Y2mgHyXGAaflLm3sTe85AOSbYFEW
         pD8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxN/1KXgo0ZLHpx5c5cYDHndq2akPHo+BwOpdothtS4cefUqX8+igeKcjQlAZROXgBhqJZT+2a4Ks6kg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOZbbmxkhbhcNpJ1ORjdwCz7dR2LMaK0evo4folx7kbaNszeoG
	tss9GPnJxIGeIZMDgqkpS3be8vIWrThYb/gXJyHiOfuJeOliva02tj0wpw7MeunMkMMcLsrirHM
	pTQ==
X-Google-Smtp-Source: AGHT+IGZ+3mddEgfwOZrB7Mg/yEB+clUKORcl3gwcx/GeFypDRI64NMuGnBtjzJ0gTzObJ64BsofGpKHxtA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:ab6d:0:b0:e28:f8e6:f4c6 with SMTP id
 3f1490d57ef6-e28fe465652mr58758276.2.1728584738891; Thu, 10 Oct 2024 11:25:38
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:24 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-23-seanjc@google.com>
Subject: [PATCH v13 22/85] KVM: Use NULL for struct page pointer to indicate
 mremapped memory
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
X-CRM114-CacheID: sfid-20241010_112540_385079_63EE7EB4 
X-CRM114-Status: GOOD (  14.28  )
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

RHJvcCB5ZXQgYW5vdGhlciB1bm5lY2Vzc2FyeSBtYWdpYyBwYWdlIHZhbHVlIGZyb20gS1ZNLCBh
cyB0aGVyZSdzIHplcm8KcmVhc29uIHRvIHVzZSBhIHBvaXNvbmVkIHBvaW50ZXIgdG8gaW5kaWNh
dGUgIm5vIHBhZ2UiLiAgSWYgS1ZNIHVzZXMgYQpOVUxMIHBhZ2UgcG9pbnRlciwgdGhlIGtlcm5l
bCB3aWxsIGV4cGxvZGUganVzdCBhcyBxdWlja2x5IGFzIGlmIEtWTSB1c2VzCmEgcG9pc29uZWQg
cG9pbnRlci4gIE5ldmVyIG1pbmQgdGhlIGZhY3QgdGhhdCBzdWNoIHVzYWdlIHdvdWxkIGJlIGEK
YmxhdGFudCBhbmQgZWdyZWdpb3VzIEtWTSBidWcuCgpUZXN0ZWQtYnk6IEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNv
biA8c2VhbmpjQGdvb2dsZS5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIHwgNCAt
LS0tCiB2aXJ0L2t2bS9rdm1fbWFpbi5jICAgICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgva3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAppbmRleCBjYmM3YjljMDRj
MTQuLmUzYzAxY2JiYzQxYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCisr
KyBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaApAQCAtMjczLDE2ICsyNzMsMTIgQEAgZW51bSB7
CiAJUkVBRElOR19TSEFET1dfUEFHRV9UQUJMRVMsCiB9OwogCi0jZGVmaW5lIEtWTV9VTk1BUFBF
RF9QQUdFCSgodm9pZCAqKSAweDUwMCArIFBPSVNPTl9QT0lOVEVSX0RFTFRBKQotCiBzdHJ1Y3Qg
a3ZtX2hvc3RfbWFwIHsKIAkvKgogCSAqIE9ubHkgdmFsaWQgaWYgdGhlICdwZm4nIGlzIG1hbmFn
ZWQgYnkgdGhlIGhvc3Qga2VybmVsIChpLmUuIFRoZXJlIGlzCiAJICogYSAnc3RydWN0IHBhZ2Un
IGZvciBpdC4gV2hlbiB1c2luZyBtZW09IGtlcm5lbCBwYXJhbWV0ZXIgc29tZSBtZW1vcnkKIAkg
KiBjYW4gYmUgdXNlZCBhcyBndWVzdCBtZW1vcnkgYnV0IHRoZXkgYXJlIG5vdCBtYW5hZ2VkIGJ5
IGhvc3QKIAkgKiBrZXJuZWwpLgotCSAqIElmICdwZm4nIGlzIG5vdCBtYW5hZ2VkIGJ5IHRoZSBo
b3N0IGtlcm5lbCwgdGhpcyBmaWVsZCBpcwotCSAqIGluaXRpYWxpemVkIHRvIEtWTV9VTk1BUFBF
RF9QQUdFLgogCSAqLwogCXN0cnVjdCBwYWdlICpwYWdlOwogCXZvaWQgKmh2YTsKZGlmZiAtLWdp
dCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCmluZGV4IGYxYzlh
NzgxMzE1Yy4uN2FjYjFhOGFmMmU0IDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5jCisr
KyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKQEAgLTMwNjcsNyArMzA2Nyw3IEBAIHZvaWQga3ZtX3Jl
bGVhc2VfcGZuKGt2bV9wZm5fdCBwZm4sIGJvb2wgZGlydHkpCiAKIGludCBrdm1fdmNwdV9tYXAo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4sIHN0cnVjdCBrdm1faG9zdF9tYXAgKm1h
cCkKIHsKLQltYXAtPnBhZ2UgPSBLVk1fVU5NQVBQRURfUEFHRTsKKwltYXAtPnBhZ2UgPSBOVUxM
OwogCW1hcC0+aHZhID0gTlVMTDsKIAltYXAtPmdmbiA9IGdmbjsKIApAQCAtMzA5Myw3ICszMDkz
LDcgQEAgdm9pZCBrdm1fdmNwdV91bm1hcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBr
dm1faG9zdF9tYXAgKm1hcCwgYm9vbCBkaXJ0eSkKIAlpZiAoIW1hcC0+aHZhKQogCQlyZXR1cm47
CiAKLQlpZiAobWFwLT5wYWdlICE9IEtWTV9VTk1BUFBFRF9QQUdFKQorCWlmIChtYXAtPnBhZ2Up
CiAJCWt1bm1hcChtYXAtPnBhZ2UpOwogI2lmZGVmIENPTkZJR19IQVNfSU9NRU0KIAllbHNlCi0t
IAoyLjQ3LjAucmMxLjI4OC5nMDYyOThkMTUyNS1nb29nCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
