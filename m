Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB4BCFC5EC
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTKe1beU7gaOEt5N0uCG5+dvHKG2PDFM6i+SzQjP9lI=; b=mOMLiR9tAhx5lL
	oyON5Y7i1LLu2XdQKU/ydzglqa4mu+0/xv8dvTxcefI/6ZKTfaoWHA/VnV0uat3qL/biIvvIBPbhU
	5eOprBmKNVGq0ZnmWzSRTGaWVVTssQ1bkn8998B7Lxj+PJHD5tw2VqIqeX1PvM2xI40YuYBuepu9r
	BO9kBy4JAFPlREUWUx/YWfdboxegPHzvCpvPsk4+yHgIxu5qwyeQ38sx7V8iQgZgUFMLjQuE7zygC
	UZtXdAATbqVWPE9H1v2nLJ+g/Cq4ZRHsCapC7ZJjEsoXQjEb8spjzcej2R/vMxQ267lS0qAyJ/TFG
	Oa1uTFFDPEW7FNlv9eMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syy2e-0000000Dw4H-2SSy;
	Thu, 10 Oct 2024 18:37:40 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxqM-0000000DpfE-2L6Q
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:24:59 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e26ba37314so24841917b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584697; x=1729189497; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4CpCR2xmh5xLGpBn2Bl3P0Y4RCeyU3sCMc2ynGYEmk=;
        b=M7Snr5N22pikPCYYXMJYsOlgIEBf4+x3Uqg6sVxeZVadYTICrG4ulpFRgPtXVG0X0n
         JZ2/nX9phcaEtKWHj1yPru+AarfrxgYbtzXswb2v92ZPGKNmtdah06jEFW/mllb+oibh
         CBKgB1cMUdcgVGm+aTjLPjjrmXe2Hfze6XuIV0ZeaSFds53FKVgiaPzajxfWki+VusBG
         0ZxzebIV31ZFXuzuGmx7TJqF8oZ/P8kgCd05nBiQQ6We33hwrDG5iyqppNKEN7BXJoyY
         U1tRYYoYlyeYl0xm2A4lPSen0EvpIggWblDdQu+MQKURLXfflhNdB/DNtQyuAg89xkyJ
         7Jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584697; x=1729189497;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X4CpCR2xmh5xLGpBn2Bl3P0Y4RCeyU3sCMc2ynGYEmk=;
        b=HQlOybqBxZtTAd788lqNVwBs+W8K+dUAgRMhE7JBP/KeEe/oizCG6Vh19LoAB2WmwO
         G7kGNO10oGIPLLbh8kSYHLgKWalotUD0AkH4sffOcjqjZDOBo+SYo/6s4V+iqrt3RFzJ
         yBMODAJHj84U+QvxV7N290ffyoB9i5y5UY2Ni2HfajCu9xX5dJDyEXFbFj1pL78JGPgs
         5OLoqMJ3pk9qcBRp2OP+jKtOl3Cvg4wEQ26KBUFa6h8ZGS5n+VWWC3SnpU0Td18HNy8y
         yqr3KDrUcpWQWyXtwucV8MAGlD99Zwr5Vw6Npb0QQ+MOLzEHeAZBPmRDL+KNCrKmzGNV
         gTPA==
X-Forwarded-Encrypted: i=1; AJvYcCWcwY32ODg1EzKgd1N0WCEkHElAu6EsAXrJenGJH499ajikO5qZ8Uqiq4tndRMKNZx16eYhzeJC9hKADA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxchsze+JlWmzL/lIcYoPbo7OyFe4IkGEUfBNV4cw28a0GrU5UU
	wth7ATydSMfMv9cSPEchfE8C3OiPyVGAh3f6NI3vvaOBIb/iGMXaL5t/OxcT2Ne4Yof/IRHPFQO
	zww==
X-Google-Smtp-Source: AGHT+IGrULPD5dT5NWC9dFAfgTsoL9JIWGzHU9t8+6e7flVyO5QHPCRlr/jDUZCu+nhXBHYl+WGzejB3KuQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a0d:e486:0:b0:6e2:371f:4aef with SMTP id
 00721157ae682-6e322168931mr204147b3.3.1728584696651; Thu, 10 Oct 2024
 11:24:56 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:06 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-5-seanjc@google.com>
Subject: [PATCH v13 04/85] KVM: x86/mmu: Skip the "try unsync" path iff the
 old SPTE was a leaf SPTE
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
X-CRM114-CacheID: sfid-20241010_112458_676789_343792F5 
X-CRM114-Status: GOOD (  12.18  )
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

QXBwbHkgbWFrZV9zcHRlKCkncyBvcHRpbWl6YXRpb24gdG8gc2tpcCB0cnlpbmcgdG8gdW5zeW5j
IHNoYWRvdyBwYWdlcyBpZgphbmQgb25seSBpZiB0aGUgb2xkIFNQVEUgd2FzIGEgbGVhZiBTUFRF
LCBhcyBub24tbGVhZiBTUFRFcyBpbiBkaXJlY3QgTU1VcwphcmUgYWx3YXlzIHdyaXRhYmxlLCBp
LmUuIGNvdWxkIHRyaWdnZXIgYSBmYWxzZSBwb3NpdGl2ZSBhbmQgaW5jb3JyZWN0bHkKbGVhZCB0
byBLVk0gY3JlYXRpbmcgYSBTUFRFIHdpdGhvdXQgd3JpdGUtcHJvdGVjdGluZyBvciBtYXJraW5n
IHNoYWRvdwpwYWdlcyB1bnN5bmMuCgpUaGlzIGJ1ZyBvbmx5IGFmZmVjdHMgdGhlIFREUCBNTVUs
IGFzIHRoZSBzaGFkb3cgTU1VIG9ubHkgb3ZlcndyaXRlcyBhCnNoYWRvdy1wcmVzZW50IFNQVEUg
d2hlbiBzeW5jaHJvbml6aW5nIFNQVEVzIChhbmQgb25seSA0S2lCIFNQVEVzIGNhbiBiZQp1bnN5
bmMpLiAgU3BlY2lmaWNhbGx5LCBtbXVfc2V0X3NwdGUoKSBkcm9wcyBhbnkgbm9uLWxlYWYgU1BU
RXMgKmJlZm9yZSoKY2FsbGluZyBtYWtlX3NwdGUoKSwgd2hlcmVhcyB0aGUgVERQIE1NVSBjYW4g
ZG8gYSBkaXJlY3QgcmVwbGFjZW1lbnQgb2YgYQpwYWdlIHRhYmxlIHdpdGggdGhlIGxlYWYgU1BU
RS4KCk9wcG9ydHVuaXN0aWNhbGx5IHVwZGF0ZSB0aGUgY29tbWVudCB0byBleHBsYWluIHdoeSBz
a2lwcGluZyB0aGUgdW5zeW5jCnN0dWZmIGlzIHNhZmUsIGFzIG9wcG9zZWQgdG8gc2ltcGx5IHNh
eWluZyAiaXQncyBzb21lb25lIGVsc2UncyBwcm9ibGVtIi4KCkNjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnClRlc3RlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpT
aWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KLS0t
CiBhcmNoL3g4Ni9rdm0vbW11L3NwdGUuYyB8IDE4ICsrKysrKysrKysrKystLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYva3ZtL21tdS9zcHRlLmMgYi9hcmNoL3g4Ni9rdm0vbW11L3NwdGUuYwppbmRleCA4
ZjdlYjNhZDg4ZmMuLjU1MjE2MDgwNzdlYyAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL21tdS9z
cHRlLmMKKysrIGIvYXJjaC94ODYva3ZtL21tdS9zcHRlLmMKQEAgLTIyNiwxMiArMjI2LDIwIEBA
IGJvb2wgbWFrZV9zcHRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tbXVfcGFn
ZSAqc3AsCiAJCXNwdGUgfD0gUFRfV1JJVEFCTEVfTUFTSyB8IHNoYWRvd19tbXVfd3JpdGFibGVf
bWFzazsKIAogCQkvKgotCQkgKiBPcHRpbWl6YXRpb246IGZvciBwdGUgc3luYywgaWYgc3B0ZSB3
YXMgd3JpdGFibGUgdGhlIGhhc2gKLQkJICogbG9va3VwIGlzIHVubmVjZXNzYXJ5IChhbmQgZXhw
ZW5zaXZlKS4gV3JpdGUgcHJvdGVjdGlvbgotCQkgKiBpcyByZXNwb25zaWJpbGl0eSBvZiBrdm1f
bW11X2dldF9wYWdlIC8ga3ZtX21tdV9zeW5jX3Jvb3RzLgotCQkgKiBTYW1lIHJlYXNvbmluZyBj
YW4gYmUgYXBwbGllZCB0byBkaXJ0eSBwYWdlIGFjY291bnRpbmcuCisJCSAqIFdoZW4gb3Zlcndy
aXRpbmcgYW4gZXhpc3RpbmcgbGVhZiBTUFRFLCBhbmQgdGhlIG9sZCBTUFRFIHdhcworCQkgKiB3
cml0YWJsZSwgc2tpcCB0cnlpbmcgdG8gdW5zeW5jIHNoYWRvdyBwYWdlcyBhcyBhbnkgcmVsZXZh
bnQKKwkJICogc2hhZG93IHBhZ2VzIG11c3QgYWxyZWFkeSBiZSB1bnN5bmMsIGkuZS4gdGhlIGhh
c2ggbG9va3VwIGlzCisJCSAqIHVubmVjZXNzYXJ5IChhbmQgZXhwZW5zaXZlKS4KKwkJICoKKwkJ
ICogVGhlIHNhbWUgcmVhc29uaW5nIGFwcGxpZXMgdG8gZGlydHkgcGFnZS9mb2xpbyBhY2NvdW50
aW5nOworCQkgKiBLVk0gd2lsbCBtYXJrIHRoZSBmb2xpbyBkaXJ0eSB1c2luZyB0aGUgb2xkIFNQ
VEUsIHRodXMKKwkJICogdGhlcmUncyBubyBuZWVkIHRvIGltbWVkaWF0ZWx5IG1hcmsgdGhlIG5l
dyBTUFRFIGFzIGRpcnR5LgorCQkgKgorCQkgKiBOb3RlLCBib3RoIGNhc2VzIHJlbHkgb24gS1ZN
IG5vdCBjaGFuZ2luZyBQRk5zIHdpdGhvdXQgZmlyc3QKKwkJICogemFwcGluZyB0aGUgb2xkIFNQ
VEUsIHdoaWNoIGlzIGd1YXJhbnRlZWQgYnkgYm90aCB0aGUgc2hhZG93CisJCSAqIE1NVSBhbmQg
dGhlIFREUCBNTVUuCiAJCSAqLwotCQlpZiAoaXNfd3JpdGFibGVfcHRlKG9sZF9zcHRlKSkKKwkJ
aWYgKGlzX2xhc3Rfc3B0ZShvbGRfc3B0ZSwgbGV2ZWwpICYmIGlzX3dyaXRhYmxlX3B0ZShvbGRf
c3B0ZSkpCiAJCQlnb3RvIG91dDsKIAogCQkvKgotLSAKMi40Ny4wLnJjMS4yODguZzA2Mjk4ZDE1
MjUtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
